# makefile configuration
NAME            = tri86
OBJECTS         = ./src/can.o ./src/gauge.o ./src/pedal.o ./src/tri86.o ./src/usci.o 
CPU             = msp430x247

ASFLAGS         = -mmcu=${CPU} -x assembler-with-cpp -D_GNU_ASSEMBLER_ -c
CFLAGS          = -mmcu=${CPU} -O2 -Wall -g -I"./include" -I"../../mspgcc/msp430/include"

#switch the compiler (for the internal make rules)
CC              = c:/mspgcc/bin/msp430-gcc
AS              = c:/mspgcc/bin/msp430-gcc

.PHONY: all FORCE clean download download-jtag download-bsl dist

#all should be the first target. it's built when make is run without args
all: ${NAME}.elf ${NAME}.a43 ${NAME}.lst

#additional rules for files
${NAME}.elf: ${OBJECTS} ${NAME}.x
	${CC} -mmcu=${CPU} -T ${NAME}.x -o $@ ${OBJECTS}

${NAME}.a43: ${NAME}.elf
	c:/mspgcc/bin/msp430-objcopy -O ihex $^ $@

${NAME}.lst: ${NAME}.elf
	c:/mspgcc/bin/msp430-objdump -dSt $^ >$@

clean:
	c:/mspgcc/bin/rm -f ${NAME}.elf ${NAME}.a43 ${NAME}.lst ${OBJECTS}

#automatic collection of dependencies in the source files.
#it's only updated the first time, after that it must be done maually
#with "make depend"
#the dependecies are included from a separate file:
-include dependencies.in
#target to update the file, it's removed first
depend: rmdepend dependencies.in
#remove the file
rmdepend:
	c:/mspgcc/bin/rm -f dependencies.in
#build the file that contains the dependencies. no deps in this rule.
#if there were deps it would be rebuilt every chnage, which is unneded:
dependencies.in:
	$(CC) -MM ${CFLAGS} $(patsubst %.o,%.c,$(OBJECTS)) >$@

