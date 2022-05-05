----------------------------------------------------------------------------------------------------------------------------
TRI86 EV driver controls MSP430 firmware README
----------------------------------------------------------------------------------------------------------------------------
- This firmware is written to use the GNU GCC3 toolchain, available from: http://mspgcc.sourceforge.net/
	- This firmware has not yet been updated to use the latest GCC4 based tools, so make sure to use the GCC3 based set
	- Search for mspgcc-20081230 on sourceforge
- Refer to the board schematics, available on the Tritium website, for pinouts and device functionality.
- The firmware is licenced using the BSD licence.  There is no obligation to publish modifications.
- If you've written something cool and would like to share, please let us know about it!
- Contact James Kennedy with any questions or comments: james@tritium.com.au


----------------------------------------------------------------------------------------------------------------------------
Toolchain walkthrough (Windows MSPGCC instructions):
----------------------------------------------------------------------------------------------------------------------------
- Download and install the MSP430 GCC3 mspgcc-20081230 toolchain, this will automatically set up command-prompt paths and other items
- Download and install a minimum install of MinGW, so that your system has 'make' on it
- Unzip the tri86 firmware files into your working directory
- From a command prompt window (DOS box), and in your working directory, type "make" without the quotes
- The tools will produce a file called tri86.a43, containing the device firmware and debug info
- At the command prompt window, type "encrypt.bat" without the quotes to turn the .a43 file into a Tritium .tsf file targetted at the EV driver controls hardware
	- You may need to edit the batch file to match the hardware version of your driver controls.  
	- The single digit that is the 2nd-last parameter for msp430encrypt.exe is the hardware version
- Use the triFwLoad tool from the Tritium website, with a CAN base address of 0x500, to bootload the .tsf file into the driver controls over the CAN bus
