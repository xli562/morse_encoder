library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fsm is
    generic (
        SPACE_TIME : natural := 1;
        DOT_TIME   : natural := 2;
        DASH_TIME  : natural := 3;

        CODE_DOT   : std_logic := '0';
        CODE_DASH  : std_logic := '1'
    );
    port (
        clk_i         : in  std_logic;
        rstn_i        : in  std_logic;

        code_i        : in  std_logic_vector (4 downto 0);
        len_i         : in  std_logic_vector (2 downto 0);
        send_i        : in  std_logic;
        led_o         : out std_logic;

        set_time_o    : out std_logic_vector (1 downto 0);
        timer_load_o  : out std_logic;
        timer_empty_i : in  std_logic
    );
end fsm;

architecture Behavior of fsm is
    -- State names
    type state_t is (
        IDLE,
        SPACE,
        DOT,
        DASH
    );
    signal state, next_state : state_t;
    -- Internal signals
    signal ptr                 : unsigned         (2 downto 0);
    signal led                 : std_logic;
    signal code_reg            : std_logic_vector (4 downto 0);
    signal len_reg             : std_logic_vector (2 downto 0);
    signal sel_slice           : std_logic;
    -- Timer empty posedge detector
    signal prev_rollover       : std_logic;
    signal timer_empty_posedge : std_logic;

begin

    sel_slice <= code_reg(TO_INTEGER(ptr));
    -- Timer empty posedge detector
    timer_empty_posedge <= '1' when ((prev_rollover /= timer_empty_i) and (timer_empty_i = '1')) else '0';

    process(state, send_i, ptr, len_reg, timer_empty_posedge, sel_slice)
    begin
        next_state <= state;
        led <= '1';
        set_time_o <= std_logic_vector(to_unsigned(0, 2));
        timer_load_o <= '0';

        case state is
            when IDLE =>
                led <= '0';
                if send_i = '1' then
                    next_state <= SPACE;
                end if;
            when SPACE =>
                led <= '0';
                if ptr = (unsigned(len_reg) + 1) then 
                    next_state <= IDLE;
                elsif (timer_empty_posedge = '1') and (sel_slice = CODE_DOT) then
                    next_state <= DOT;
                    set_time_o <= std_logic_vector(to_unsigned(DOT_TIME, 2));
                    timer_load_o <= '1';
                elsif (timer_empty_posedge = '1') and (sel_slice = CODE_DASH) then
                    next_state <= DASH;
                    set_time_o <= std_logic_vector(to_unsigned(DASH_TIME, 2));
                    timer_load_o <= '1';
                end if;
            when DOT =>
                led <= '1';
                set_time_o <= std_logic_vector(to_unsigned(DOT_TIME, 2));
                if timer_empty_posedge = '1' then
                    next_state <= SPACE;
                    set_time_o <= std_logic_vector(to_unsigned(SPACE_TIME, 2));
                    timer_load_o <= '1';
                end if;
            when DASH =>
                led <= '1';
                set_time_o <= std_logic_vector(to_unsigned(DASH_TIME, 2));
                if timer_empty_posedge = '1' then
                    next_state <= SPACE;
                    set_time_o <= std_logic_vector(to_unsigned(SPACE_TIME, 2));
                    timer_load_o <= '1';
                end if;
            when others =>
                null;
        end case;
    end process;

    process(clk_i, rstn_i)
    begin
        if rstn_i = '0' then
            state <= IDLE;
            prev_rollover <= '0';
        elsif rising_edge(clk_i) then
            state <= next_state;
            led_o <= led;
            prev_rollover <= timer_empty_i;
            
            case state is
                when IDLE =>
                    ptr <= (others => '0');
                    if next_state = SPACE then
                        code_reg <= code_i;
                        len_reg <= len_i;
                    end if;
                when SPACE =>
                    null;
                when DOT =>
                    if next_state = SPACE then
                        ptr <= ptr + 1;
                    end if;
                when DASH =>
                    if next_state = SPACE then
                        ptr <= ptr + 1;
                    end if;
                when others =>
                    null;
            end case;
        end if;
    end process;

end Behavior;
