# DHT22 API

Este proyecto proporciona una API para interactuar con el sensor de temperatura y humedad DHT22 utilizando un microcontrolador STM32.

## Descripción

El sensor DHT22 mide la temperatura y la humedad y proporciona una salida digital que puede ser leída por un microcontrolador. Esta API permite inicializar el sensor, enviar una señal de inicio y leer los datos de temperatura y humedad.

## Estructura del Proyecto

El proyecto está organizado en los siguientes archivos:

- `DHT22.h`: Contiene las declaraciones de las funciones y estructuras utilizadas para interactuar con el sensor.
- `DHT22.c`: Contiene las implementaciones de las funciones declaradas en `DHT22.h`.
- `main.c`: Ejemplo de uso de la API para leer datos del sensor y enviarlos por UART.

## Estructuras

### `DHT22_Data`

Estructura para almacenar los datos del sensor DHT22.

```c
typedef struct {
    float temperatura;  /**< Temperatura medida por el sensor, en grados Celsius. */
    float humedad;      /**< Humedad medida por el sensor, en porcentaje. */
} DHT22_Data;

## DHT22_HandleTypeDef

Estructura para manejar el estado del DHT22.

```c
typedef struct {
    GPIO_TypeDef *GPIOx;  /**< Puerto GPIO donde está conectado el DHT22. */
    uint16_t GPIO_Pin;    /**< Pin GPIO donde está conectado el DHT22. */
} DHT22_HandleTypeDef;


##Funciones
void DHT22_Init(DHT22_HandleTypeDef *dht, GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin)

Inicializa el sensor DHT22 configurando el pin GPIO y habilitando el reloj del puerto GPIO.

    dht: Puntero a la estructura DHT22_HandleTypeDef.
    GPIOx: Puerto GPIO donde está conectado el DHT22.
    GPIO_Pin: Pin GPIO donde está conectado el DHT22.

int DHT22_Read(DHT22_HandleTypeDef *dht, DHT22_Data *data)

Lee la temperatura y la humedad del sensor DHT22 y almacena los valores en la estructura proporcionada.

    dht: Puntero a la estructura DHT22_HandleTypeDef.
    data: Puntero a la estructura DHT22_Data donde se almacenarán los datos leídos.
    Retorna: DHT22_OK si la lectura es exitosa, o un código de error si falla.

##void DWT_Init(void)

Inicializa el contador de ciclos del DWT para medir retrasos precisos.
void DWT_Delay(uint32_t us)

Introduce un retraso en microsegundos utilizando el contador de ciclos del DWT.

    us: Cantidad de microsegundos a esperar.

###void DHT22_StartSignal(DHT22_HandleTypeDef *dht)

Envía la señal de inicio al sensor DHT22 configurando el pin GPIO como salida, enviando la señal y luego configurándolo como entrada para recibir datos.

    dht: Puntero a la estructura DHT22_HandleTypeDef.

##Ejemplo de Uso

A continuación se muestra un ejemplo de cómo utilizar la API para leer datos del sensor DHT22 y enviarlos por UART:

#include "uart.h"
#include "DHT22.h"

int main(void) {
    HAL_Init();
    SystemClock_Config();

    UART_HandleTypeDef huart3;
    UART_Init(&huart3, 9600);

    DHT22_HandleTypeDef dht22;
    DHT22_Init(&dht22, GPIOB, GPIO_PIN_11);
    DWT_Init();

    DHT22_Data sensorData;
    char message[50];

    while (1) {
        if (DHT22_Read(&dht22, &sensorData) == DHT22_OK) {
            snprintf(message, sizeof(message), "Temperatura: %.1f grados C, Humedad: %.1f%%\n", sensorData.temperatura, sensorData.humedad);
        } else {
            snprintf(message, sizeof(message), "Error leyendo el DHT22\n");
        }

        HAL_UART_Transmit(&huart3, (uint8_t *)message, strlen(message), HAL_MAX_DELAY);
        HAL_Delay(2000);
    }
}

## Licencia

Este proyecto está licenciado bajo la Licencia Pública General GNU versión 3.0 (GPL-3.0). Para más detalles, consulta el archivo LICENSE.

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o envía un pull request para cualquier mejora o corrección.
Autor

    Nombre: lgomez
    Fecha de creación: Jun 15, 2024

Este proyecto es software libre: puedes redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General GNU publicada por la Free Software Foundation, ya sea la versión 3 de la Licencia, o (a tu elección) cualquier versión posterior.

Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de COMERCIABILIDAD o APTITUD PARA UN PROPÓSITO PARTICULAR. Ver la Licencia Pública General GNU para más detalles.

Deberías haber recibido una copia de la Licencia Pública General GNU junto con este programa. Si no es así, visita http://www.gnu.org/licenses/.



Este `README.md` proporciona una descripción clara del proyecto, incluyendo la estructura del proyecto, descripciones de las estructuras y funciones, un ejemplo de uso y detalles sobre la licencia y contribuciones.


##Fuentes 
https://github.com/MYaqoobEmbedded/STM32-Tutorials/tree/master/Tutorial%2025%20-%20DHT22%20Temperature%20Sensor
https://www.youtube.com/watch?v=2kjU7sHFSM0&t=30s
DTH22 https://www.youtube.com/watch?v=09C1dyXvSbg&t=216s
como crear alta timer de frecuencia en la stm32  https://www.youtube.com/watch?v=SqC0IhLKJ9o# DHT22
