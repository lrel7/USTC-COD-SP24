onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L dist_mem_gen_v8_0_13 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.DATA_MEM xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {DATA_MEM.udo}

run 1000ns

quit -force
