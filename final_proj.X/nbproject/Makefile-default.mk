#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/final_proj.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/final_proj.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../pic24_code_example/lib/src/dataXfer.c ../pic24_code_example/lib/src/dataXferImpl.c ../pic24_code_example/lib/src/pic24_adc.c ../pic24_code_example/lib/src/pic24_clockfreq.c ../pic24_code_example/lib/src/pic24_configbits.c ../pic24_code_example/lib/src/pic24_ecan.c ../pic24_code_example/lib/src/pic24_flash.c ../pic24_code_example/lib/src/pic24_i2c.c ../pic24_code_example/lib/src/pic24_serial.c ../pic24_code_example/lib/src/pic24_spi.c ../pic24_code_example/lib/src/pic24_stdio_uart.c ../pic24_code_example/lib/src/pic24_timer.c ../pic24_code_example/lib/src/pic24_uart.c ../pic24_code_example/lib/src/pic24_util.c ../lcd4bit_lib.c ../main_final.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/175856677/dataXfer.o ${OBJECTDIR}/_ext/175856677/dataXferImpl.o ${OBJECTDIR}/_ext/175856677/pic24_adc.o ${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o ${OBJECTDIR}/_ext/175856677/pic24_configbits.o ${OBJECTDIR}/_ext/175856677/pic24_ecan.o ${OBJECTDIR}/_ext/175856677/pic24_flash.o ${OBJECTDIR}/_ext/175856677/pic24_i2c.o ${OBJECTDIR}/_ext/175856677/pic24_serial.o ${OBJECTDIR}/_ext/175856677/pic24_spi.o ${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o ${OBJECTDIR}/_ext/175856677/pic24_timer.o ${OBJECTDIR}/_ext/175856677/pic24_uart.o ${OBJECTDIR}/_ext/175856677/pic24_util.o ${OBJECTDIR}/_ext/1472/lcd4bit_lib.o ${OBJECTDIR}/_ext/1472/main_final.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/175856677/dataXfer.o.d ${OBJECTDIR}/_ext/175856677/dataXferImpl.o.d ${OBJECTDIR}/_ext/175856677/pic24_adc.o.d ${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o.d ${OBJECTDIR}/_ext/175856677/pic24_configbits.o.d ${OBJECTDIR}/_ext/175856677/pic24_ecan.o.d ${OBJECTDIR}/_ext/175856677/pic24_flash.o.d ${OBJECTDIR}/_ext/175856677/pic24_i2c.o.d ${OBJECTDIR}/_ext/175856677/pic24_serial.o.d ${OBJECTDIR}/_ext/175856677/pic24_spi.o.d ${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o.d ${OBJECTDIR}/_ext/175856677/pic24_timer.o.d ${OBJECTDIR}/_ext/175856677/pic24_uart.o.d ${OBJECTDIR}/_ext/175856677/pic24_util.o.d ${OBJECTDIR}/_ext/1472/lcd4bit_lib.o.d ${OBJECTDIR}/_ext/1472/main_final.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/175856677/dataXfer.o ${OBJECTDIR}/_ext/175856677/dataXferImpl.o ${OBJECTDIR}/_ext/175856677/pic24_adc.o ${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o ${OBJECTDIR}/_ext/175856677/pic24_configbits.o ${OBJECTDIR}/_ext/175856677/pic24_ecan.o ${OBJECTDIR}/_ext/175856677/pic24_flash.o ${OBJECTDIR}/_ext/175856677/pic24_i2c.o ${OBJECTDIR}/_ext/175856677/pic24_serial.o ${OBJECTDIR}/_ext/175856677/pic24_spi.o ${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o ${OBJECTDIR}/_ext/175856677/pic24_timer.o ${OBJECTDIR}/_ext/175856677/pic24_uart.o ${OBJECTDIR}/_ext/175856677/pic24_util.o ${OBJECTDIR}/_ext/1472/lcd4bit_lib.o ${OBJECTDIR}/_ext/1472/main_final.o

# Source Files
SOURCEFILES=../pic24_code_example/lib/src/dataXfer.c ../pic24_code_example/lib/src/dataXferImpl.c ../pic24_code_example/lib/src/pic24_adc.c ../pic24_code_example/lib/src/pic24_clockfreq.c ../pic24_code_example/lib/src/pic24_configbits.c ../pic24_code_example/lib/src/pic24_ecan.c ../pic24_code_example/lib/src/pic24_flash.c ../pic24_code_example/lib/src/pic24_i2c.c ../pic24_code_example/lib/src/pic24_serial.c ../pic24_code_example/lib/src/pic24_spi.c ../pic24_code_example/lib/src/pic24_stdio_uart.c ../pic24_code_example/lib/src/pic24_timer.c ../pic24_code_example/lib/src/pic24_uart.c ../pic24_code_example/lib/src/pic24_util.c ../lcd4bit_lib.c ../main_final.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/final_proj.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24HJ128GP502
MP_LINKER_FILE_OPTION=,--script=p24HJ128GP502.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/175856677/dataXfer.o: ../pic24_code_example/lib/src/dataXfer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/dataXfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/dataXfer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/dataXfer.c  -o ${OBJECTDIR}/_ext/175856677/dataXfer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/dataXfer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/dataXfer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/dataXferImpl.o: ../pic24_code_example/lib/src/dataXferImpl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/dataXferImpl.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/dataXferImpl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/dataXferImpl.c  -o ${OBJECTDIR}/_ext/175856677/dataXferImpl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/dataXferImpl.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/dataXferImpl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_adc.o: ../pic24_code_example/lib/src/pic24_adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_adc.c  -o ${OBJECTDIR}/_ext/175856677/pic24_adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o: ../pic24_code_example/lib/src/pic24_clockfreq.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_clockfreq.c  -o ${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_configbits.o: ../pic24_code_example/lib/src/pic24_configbits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_configbits.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_configbits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_configbits.c  -o ${OBJECTDIR}/_ext/175856677/pic24_configbits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_configbits.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_configbits.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_ecan.o: ../pic24_code_example/lib/src/pic24_ecan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_ecan.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_ecan.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_ecan.c  -o ${OBJECTDIR}/_ext/175856677/pic24_ecan.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_ecan.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_ecan.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_flash.o: ../pic24_code_example/lib/src/pic24_flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_flash.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_flash.c  -o ${OBJECTDIR}/_ext/175856677/pic24_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_flash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_flash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_i2c.o: ../pic24_code_example/lib/src/pic24_i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_i2c.c  -o ${OBJECTDIR}/_ext/175856677/pic24_i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_i2c.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_i2c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_serial.o: ../pic24_code_example/lib/src/pic24_serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_serial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_serial.c  -o ${OBJECTDIR}/_ext/175856677/pic24_serial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_serial.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_serial.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_spi.o: ../pic24_code_example/lib/src/pic24_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_spi.c  -o ${OBJECTDIR}/_ext/175856677/pic24_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_spi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o: ../pic24_code_example/lib/src/pic24_stdio_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_stdio_uart.c  -o ${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_timer.o: ../pic24_code_example/lib/src/pic24_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_timer.c  -o ${OBJECTDIR}/_ext/175856677/pic24_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_timer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_uart.o: ../pic24_code_example/lib/src/pic24_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_uart.c  -o ${OBJECTDIR}/_ext/175856677/pic24_uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_uart.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_util.o: ../pic24_code_example/lib/src/pic24_util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_util.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_util.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_util.c  -o ${OBJECTDIR}/_ext/175856677/pic24_util.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_util.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_util.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/lcd4bit_lib.o: ../lcd4bit_lib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/lcd4bit_lib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/lcd4bit_lib.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lcd4bit_lib.c  -o ${OBJECTDIR}/_ext/1472/lcd4bit_lib.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/lcd4bit_lib.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/lcd4bit_lib.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main_final.o: ../main_final.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main_final.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_final.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main_final.c  -o ${OBJECTDIR}/_ext/1472/main_final.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main_final.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main_final.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/175856677/dataXfer.o: ../pic24_code_example/lib/src/dataXfer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/dataXfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/dataXfer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/dataXfer.c  -o ${OBJECTDIR}/_ext/175856677/dataXfer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/dataXfer.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/dataXfer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/dataXferImpl.o: ../pic24_code_example/lib/src/dataXferImpl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/dataXferImpl.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/dataXferImpl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/dataXferImpl.c  -o ${OBJECTDIR}/_ext/175856677/dataXferImpl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/dataXferImpl.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/dataXferImpl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_adc.o: ../pic24_code_example/lib/src/pic24_adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_adc.c  -o ${OBJECTDIR}/_ext/175856677/pic24_adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_adc.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o: ../pic24_code_example/lib/src/pic24_clockfreq.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_clockfreq.c  -o ${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_clockfreq.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_configbits.o: ../pic24_code_example/lib/src/pic24_configbits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_configbits.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_configbits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_configbits.c  -o ${OBJECTDIR}/_ext/175856677/pic24_configbits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_configbits.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_configbits.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_ecan.o: ../pic24_code_example/lib/src/pic24_ecan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_ecan.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_ecan.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_ecan.c  -o ${OBJECTDIR}/_ext/175856677/pic24_ecan.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_ecan.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_ecan.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_flash.o: ../pic24_code_example/lib/src/pic24_flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_flash.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_flash.c  -o ${OBJECTDIR}/_ext/175856677/pic24_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_flash.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_flash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_i2c.o: ../pic24_code_example/lib/src/pic24_i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_i2c.c  -o ${OBJECTDIR}/_ext/175856677/pic24_i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_i2c.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_i2c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_serial.o: ../pic24_code_example/lib/src/pic24_serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_serial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_serial.c  -o ${OBJECTDIR}/_ext/175856677/pic24_serial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_serial.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_serial.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_spi.o: ../pic24_code_example/lib/src/pic24_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_spi.c  -o ${OBJECTDIR}/_ext/175856677/pic24_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_spi.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o: ../pic24_code_example/lib/src/pic24_stdio_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_stdio_uart.c  -o ${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_stdio_uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_timer.o: ../pic24_code_example/lib/src/pic24_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_timer.c  -o ${OBJECTDIR}/_ext/175856677/pic24_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_timer.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_uart.o: ../pic24_code_example/lib/src/pic24_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_uart.c  -o ${OBJECTDIR}/_ext/175856677/pic24_uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_uart.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/175856677/pic24_util.o: ../pic24_code_example/lib/src/pic24_util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/175856677" 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_util.o.d 
	@${RM} ${OBJECTDIR}/_ext/175856677/pic24_util.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../pic24_code_example/lib/src/pic24_util.c  -o ${OBJECTDIR}/_ext/175856677/pic24_util.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/175856677/pic24_util.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/175856677/pic24_util.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/lcd4bit_lib.o: ../lcd4bit_lib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/lcd4bit_lib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/lcd4bit_lib.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lcd4bit_lib.c  -o ${OBJECTDIR}/_ext/1472/lcd4bit_lib.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/lcd4bit_lib.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/lcd4bit_lib.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main_final.o: ../main_final.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main_final.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_final.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main_final.c  -o ${OBJECTDIR}/_ext/1472/main_final.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main_final.o.d"        -g -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main_final.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/final_proj.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/final_proj.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include"  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp=${DFP_DIR}/xc16 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/final_proj.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/final_proj.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DHARDWARE_PLATFORM=5 -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../pic24_code_example/lib/include" -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp=${DFP_DIR}/xc16 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/final_proj.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp=${DFP_DIR}/xc16 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
