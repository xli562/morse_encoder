import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge

from mods.logging_mods import *
from mods.quantization_mods import *


SECOND = 5e7        # Clk cycles in 1 second

@cocotb.test()
async def test_counter_simple(dut):
    """ Test counter once with 200 nanosecond (10 cycles) countdown """

    ctd_secs = 2e-7

    # Start the clock
    clock = Clock(dut.clk_i, 20, units='ns')
    cocotb.start_soon(clock.start())

    # Reset the DUT
    dut.rstn_i.value = 0
    for _ in range(2):
        await RisingEdge(dut.clk_i)
    dut.rstn_i.value = 1
    await RisingEdge(dut.clk_i)

    # Generate testcase
    ctd_cycles = ctd_secs * SECOND

    # Apply inputs
    dut.start_time_i.value = int(ctd_cycles)

    # Indicate valid input data
    dut.load_i.value = 1
    dut.enable_i.value = 1
    for _ in range(2):
        await RisingEdge(dut.clk_i)
    dut.load_i.value = 0

    assert dut.count_o.value != ctd_cycles, 'Input is not correctly loaded into timer'
    await RisingEdge(dut.clk_i)
    while not dut.count_o.value == 0:
        t = dut.count_o.value
        await RisingEdge(dut.clk_i)
        assert dut.count_o.value == t-1, 'Timer not decrementing by 1'
    
