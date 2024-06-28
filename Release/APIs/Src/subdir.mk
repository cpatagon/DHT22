################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APIs/Src/DHT22.c \
../APIs/Src/DHT22_Hardware.c \
../APIs/Src/DWT_Delay.c \
../APIs/Src/uart.c 

OBJS += \
./APIs/Src/DHT22.o \
./APIs/Src/DHT22_Hardware.o \
./APIs/Src/DWT_Delay.o \
./APIs/Src/uart.o 

C_DEPS += \
./APIs/Src/DHT22.d \
./APIs/Src/DHT22_Hardware.d \
./APIs/Src/DWT_Delay.d \
./APIs/Src/uart.d 


# Each subdirectory must supply rules for building sources it contributes
APIs/Src/%.o APIs/Src/%.su APIs/Src/%.cyclo: ../APIs/Src/%.c APIs/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I/home/lgomez/STM32Cube/Repository/STM32Cube_FW_F4_V1.27.1/Drivers/STM32F4xx_HAL_Driver/Inc -I/home/lgomez/STM32Cube/Repository/STM32Cube_FW_F4_V1.27.1/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I/home/lgomez/STM32Cube/Repository/STM32Cube_FW_F4_V1.27.1/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I/home/lgomez/STM32Cube/Repository/STM32Cube_FW_F4_V1.27.1/Drivers/CMSIS/Include -I"/home/lgomez/Documentos/MAGISTER_UBA/TESIS/STM32/Tesis_DHT22/APIs" -I"/home/lgomez/Documentos/MAGISTER_UBA/TESIS/STM32/Tesis_DHT22/APIs/Inc" -I"/home/lgomez/Documentos/MAGISTER_UBA/TESIS/STM32/Tesis_DHT22/APIs/Src" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APIs-2f-Src

clean-APIs-2f-Src:
	-$(RM) ./APIs/Src/DHT22.cyclo ./APIs/Src/DHT22.d ./APIs/Src/DHT22.o ./APIs/Src/DHT22.su ./APIs/Src/DHT22_Hardware.cyclo ./APIs/Src/DHT22_Hardware.d ./APIs/Src/DHT22_Hardware.o ./APIs/Src/DHT22_Hardware.su ./APIs/Src/DWT_Delay.cyclo ./APIs/Src/DWT_Delay.d ./APIs/Src/DWT_Delay.o ./APIs/Src/DWT_Delay.su ./APIs/Src/uart.cyclo ./APIs/Src/uart.d ./APIs/Src/uart.o ./APIs/Src/uart.su

.PHONY: clean-APIs-2f-Src

