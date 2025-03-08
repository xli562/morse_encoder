library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity morse_encoder is
    generic (
        SPACE_TIME     : natural   := 1;
        DOT_TIME       : natural   := 1;
        DASH_TIME      : natural   := 3;

        -- symbols
        CODE_DOT       : std_logic := '0';
        CODE_DASH      : std_logic := '1';

        -- counter
        TIMER_WIDTH    : natural   := 2;
        TIMER_START_AT : natural   := 3;
        CLK_WIDTH      : natural   := 27;
        HALF_CLK_FREQ  : natural   := 25000000
    );
    port (
        clk_i   : in  std_logic;
        rstn_i  : in  std_logic;

        sw_i    : in  std_logic_vector(2 downto 0);
        sendn_i : in  std_logic;

        led_o   : out std_logic
    );
end morse_encoder;

architecture Behavior of morse_encoder is
    -- internal signals
    signal code         : std_logic_vector(4 downto 0);
    signal len          : std_logic_vector(2 downto 0);
    signal set_time     : std_logic_vector(1 downto 0);
    signal half_second  : std_logic;
    signal timer_load   : std_logic;
    signal timer_enable : std_logic;
    signal timer_empty  : std_logic;
    signal send         : std_logic;
    constant half_clk_freq_static : std_logic_vector(CLK_WIDTH-1 downto 0) :=
            std_logic_vector(to_unsigned(HALF_CLK_FREQ, CLK_WIDTH));

begin

    timer_enable <= half_second or timer_load;
    send         <= not sendn_i;

    -- instantiations
    fsm_0: entity work.fsm
        generic map(
            SPACE_TIME => SPACE_TIME,
            DOT_TIME   => DOT_TIME,
            DASH_TIME  => DASH_TIME,
            CODE_DOT   => CODE_DOT,
            CODE_DASH  => CODE_DASH
        )
        port map(
            clk_i         => clk_i,
            rstn_i        => rstn_i,
            code_i        => code,
            len_i         => len,
            send_i        => send,
            led_o         => led_o,
            set_time_o    => set_time,
            timer_load_o  => timer_load,
            timer_empty_i => timer_empty
        );

    input_lut_0: entity work.input_lut
        port map(
            sw_i   => sw_i,
            code_o => code,
            len_o  => len
        );

    -- half-second clock
    counter_slow: entity work.counter
        generic map(
            WIDTH    => CLK_WIDTH,
            START_AT => HALF_CLK_FREQ
        )
        port map(
            clk_i        => clk_i,
            rstn_i       => rstn_i,
            load_i       => timer_load,
            enable_i     => '1',
            start_time_i => half_clk_freq_static,
            rollover_o   => half_second
        );
    
    -- morse timer
    counter_0: entity work.counter
        generic map(
            WIDTH    => TIMER_WIDTH,
            START_AT => TIMER_START_AT
        )
        port map(
            clk_i        => clk_i,
            rstn_i       => rstn_i,
            load_i       => timer_load,
            enable_i     => timer_enable,
            start_time_i => set_time,
            rollover_o   => timer_empty
        );
end Behavior;
