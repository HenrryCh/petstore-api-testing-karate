# PetStore API Automation – Karate Framework

## 1. Descripción general

Este proyecto implementa pruebas automatizadas de servicios REST para la API pública **PetStore** ([https://petstore.swagger.io/](https://petstore.swagger.io/)) utilizando **Karate Framework**.

El objetivo es validar el flujo de gestión de mascotas, cubriendo operaciones CRUD básicas, manejo de variables, validaciones de respuesta y generación de reportes automáticos.

---

## 2. Casos de prueba automatizados

Los siguientes escenarios fueron implementados y validados:

1. **Añadir una mascota a la tienda**

   * Se envía un request POST con un body definido en un archivo JSON externo.
   * Se valida el código de respuesta HTTP y los campos principales del response.

2. **Consultar la mascota ingresada previamente (Búsqueda por ID)**

   * Se consulta la mascota creada usando su ID.
   * Se validan nombre y estatus.

3. **Actualizar el nombre y el estatus de la mascota a “sold”**

   * Se actualiza la mascota usando el método PUT.
   * Se valida que el nombre y el estatus hayan sido modificados correctamente.

4. **Consultar la mascota por estatus (Búsqueda por status)**

   * Se consulta la lista de mascotas con estatus “sold”.
   * Se valida que la respuesta contenga al menos una mascota con dicho estatus y que incluya la mascota creada.

---

## 3. Tecnologías y versiones utilizadas

* **Java JDK:** 17
* **Maven:** 3.9.x
* **Karate Framework:** 1.5.0
* **JUnit:** JUnit 5 (incluido en Karate)
* **IDE:**  Visual Studio Code
* **Sistema operativo:** Windows 

---

## 4. Estructura del proyecto

```text
PetStoreKarate/
│
├── pom.xml
├── README.md
├── conclusiones.txt
│
└── src
    └── test
        ├── java
        │   └── petstore
        │       └── PetStoreTest.java
        │
        └── resources
            ├── karate-config.js
            ├── logback-test.xml
            └── petstore
                ├── feature
                │   └── petstore.feature
                └── json
                    └── newPetRequest.json
```

---

## 5. Configuración del proyecto

### 5.1 karate-config.js

Define la URL base de la API y permite centralizar configuraciones globales del proyecto.

### 5.2 newPetRequest.json

Archivo JSON externo que contiene el payload base para la creación de la mascota, facilitando mantenimiento y reutilización.

---

## 6. Ejecución del proyecto

### 6.1 Verificar instalaciones

```bash
java -version
mvn -version
```

### 6.2 Clonar el repositorio

```bash
git clone git clone https://github.com/HenrryCh/petstore-api-testing-karate.git
cd PetStoreKarate
```

### 6.3 Ejecutar las pruebas

```bash
mvn test
```

---

## 7. Reportes de ejecución

Karate genera reportes automáticos en formato HTML al finalizar la ejecución.

Ruta del reporte principal:

```text
target/karate-reports/karate-summary.html
```

Este reporte incluye:

* Resumen de escenarios ejecutados
* Tiempo de ejecución
* Estado de cada escenario
* Detalle de requests y responses

---

## 8. Consideraciones finales

* El proyecto puede ejecutarse sin configuración adicional.
* Las pruebas son determinísticas y reutilizan variables entre escenarios.

