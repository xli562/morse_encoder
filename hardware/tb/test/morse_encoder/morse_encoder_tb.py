import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge

from mods.logging_mods import *
from mods.quantization_mods import *


@cocotb.test()
async def test_simple(dut):
    """ Letting the dut run freely after receiving input 'B' """

    # Start the clock
    clock = Clock(dut.clk_i, 20, units='ns')
    cocotb.start_soon(clock.start())

    # Reset the DUT
    dut.rstn_i.value = 0
    dut.sendn_i.value = 1
    for _ in range(2):
        await RisingEdge(dut.clk_i)
    dut.rstn_i.value = 1
    await RisingEdge(dut.clk_i)
    for _ in range(2):
        await RisingEdge(dut.clk_i)

    # Generate testcase (letter 'B')
    sw = 1

    # Apply inputs
    dut.sw_i.value = int(sw)

    # Indicate valid input data
    dut.sendn_i.value = 0
    for _ in range(10):
        await RisingEdge(dut.clk_i)
    dut.sendn_i.value = 1

    for _ in range(dut.HALF_CLK_FREQ.value * 19):
        await RisingEdge(dut.clk_i)


@cocotb.test()
async def test_letters(dut):
    """ Letting the dut run freely after receiving inputs A to H,
    respectively. """

    # Start the clock
    clock = Clock(dut.clk_i, 20, units='ns')
    cocotb.start_soon(clock.start())

    # Reset the DUT
    dut.rstn_i.value = 0
    dut.sendn_i.value = 1
    for _ in range(2):
        await RisingEdge(dut.clk_i)
    dut.rstn_i.value = 1
    await RisingEdge(dut.clk_i)
    for _ in range(2):
        await RisingEdge(dut.clk_i)

    for sw in range(8):
        # Apply inputs
        dut.sw_i.value = int(sw)

        # Indicate valid input data
        dut.sendn_i.value = 0
        for _ in range(10):
            await RisingEdge(dut.clk_i)
        dut.sendn_i.value = 1

        for _ in range(dut.HALF_CLK_FREQ.value * 80):
            await RisingEdge(dut.clk_i)


@cocotb.test()
async def test_reset_coherence(dut):
    """ Resetting after each run to see if consistent """

    # Start the clock
    clock = Clock(dut.clk_i, 20, units='ns')
    cocotb.start_soon(clock.start())

    for sw in range(8):
        # Reset the DUT
        dut.rstn_i.value = 0
        dut.sendn_i.value = 1
        for _ in range(2):
            await RisingEdge(dut.clk_i)
        dut.rstn_i.value = 1
        await RisingEdge(dut.clk_i)
        for _ in range(2):
            await RisingEdge(dut.clk_i)

        # Apply inputs
        dut.sw_i.value = int(sw)

        # Indicate valid input data
        dut.sendn_i.value = 0
        for _ in range(10):
            await RisingEdge(dut.clk_i)
        dut.sendn_i.value = 1

        for _ in range(dut.HALF_CLK_FREQ.value * 80):
            await RisingEdge(dut.clk_i)


@cocotb.test()
async def test_reset_completeness(dut):
    """ Resetting during output """

    # Start the clock
    clock = Clock(dut.clk_i, 20, units='ns')
    cocotb.start_soon(clock.start())

    # Reset the DUT
    dut.rstn_i.value = 0
    dut.sendn_i.value = 1
    for _ in range(2):
        await RisingEdge(dut.clk_i)
    dut.rstn_i.value = 1
    await RisingEdge(dut.clk_i)
    for _ in range(2):
        await RisingEdge(dut.clk_i)

    # Apply inputs
    sw = 1
    dut.sw_i.value = int(sw)

    # Indicate valid input data
    dut.sendn_i.value = 0
    for _ in range(10):
        await RisingEdge(dut.clk_i)
    dut.sendn_i.value = 1

    for _ in range(dut.HALF_CLK_FREQ.value * 10):
        await RisingEdge(dut.clk_i)
    
    # Reset the DUT
    dut.rstn_i.value = 0
    dut.sendn_i.value = 1
    for _ in range(2):
        await RisingEdge(dut.clk_i)
    dut.rstn_i.value = 1
    await RisingEdge(dut.clk_i)
    for _ in range(2):
        await RisingEdge(dut.clk_i)

    for _ in range(dut.HALF_CLK_FREQ.value * 50):
        await RisingEdge(dut.clk_i)