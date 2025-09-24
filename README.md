# Repositorio de Scripts de Auditoría Básica en PowerShell

Este repositorio contiene una colección de scripts de PowerShell diseñados para realizar tareas fundamentales de auditoría de ciberseguridad en sistemas operativos Windows. Los scripts están orientados a la identificación de posibles riesgos de seguridad a través del análisis de usuarios, servicios, procesos y archivos del sistema.

## Contenido del Repositorio

El proyecto se estructura en torno a un módulo de PowerShell principal y varios scripts de apoyo que automatizan tareas específicas de recolección y filtrado de información.

### Scripts Incluidos

* **`Principal.ps1`**: Es el script de inicio que presenta un menú interactivo al usuario. Permite elegir entre dos auditorías principales: buscar usuarios inactivos o listar servicios externos que se encuentran activos. Este script importa el módulo `AuditoriaBasica` para ejecutar sus funciones.

* **`AuditoriaBasica.psm1`**: Este es el archivo del módulo de script que contiene la lógica central de las auditorías. Define dos funciones principales:
    * `Obtener-UsuariosInactivos`: Identifica cuentas de usuario locales que están habilitadas pero que nunca han registrado un inicio de sesión.
    * `Obtener-ServiciosExternos`: Filtra y muestra los servicios que están en ejecución y no son parte del sistema operativo Windows estándar.

* **`AuditoriaBasica.psd1`**: Es el manifiesto del módulo, un archivo de datos que describe las propiedades del módulo, como la versión, el autor (`Equipo de Ciberseguridad`) y las funciones que exporta.

* **`ev5_script1.ps1` y `ev5_script2.ps1`**: Un conjunto de scripts que trabajan en secuencia. El primero (`ev5_script1.ps1`) obtiene una lista completa de todos los servicios del sistema y la guarda en un archivo de texto. El segundo (`ev5_script2.ps1`) procesa ese archivo para filtrar y guardar únicamente los servicios que se encuentran en estado "Stopped" (Detenido).

* **`obtener_procesos_altos.ps1`**: Este script está diseñado para monitorear el rendimiento del sistema. Identifica todos los procesos que consumen más de 100 MB de memoria (Working Set) y exporta una lista formateada a un archivo de texto, facilitando la detección de software que consume recursos de manera anómala.

* **`Evidencia10_validar_archivos.ps1`**: Contiene una función (`Validar-Archivo`) que demuestra el manejo de errores en PowerShell. La función intenta leer una ruta de archivo, confirma su existencia y accesibilidad, y utiliza bloques `try-catch-finally` para gestionar los resultados y posibles errores.

## Tareas de Ciberseguridad que Resuelven

Estos scripts ayudan a los administradores de sistemas y a los analistas de seguridad a realizar auditorías rápidas y eficientes para:

* **Identificación de Cuentas de Riesgo**: Al listar usuarios habilitados que nunca han iniciado sesión, se pueden detectar cuentas huérfanas o innecesarias que podrían ser un vector de ataque.
* **Detección de Software no Autorizado**: El monitoreo de servicios "no-Windows" en ejecución permite identificar aplicaciones de terceros que podrían no estar autorizadas o ser maliciosas.
* **Análisis de Rendimiento y Malware**: La identificación de procesos con alto consumo de memoria puede ayudar a detectar software ineficiente o incluso malware que esté consumiendo recursos del sistema.
* **Gestión de la Configuración del Sistema**: El listado y filtrado de servicios del sistema permite verificar que solo los servicios necesarios estén en ejecución, siguiendo un principio de mínimo privilegio.

## ¿Qué Aprendí al Desarrollarlos?

El desarrollo de estos scripts me ha permitido fortalecer mis habilidades en PowerShell y comprender su aplicación práctica en el campo de la ciberseguridad. Algunos de los aprendizajes clave incluyen:

* **Creación y Uso de Módulos**: Aprendí a encapsular funciones relacionadas en un módulo (`.psm1`) y a definir sus propiedades en un manifiesto (`.psd1`), lo cual es fundamental para escribir código reutilizable y organizado.
* **Manejo de Objetos en PowerShell**: Reforcé mi dominio del pipeline (`|`) y de cmdlets como `Get-Service`, `Get-Process`, `Where-Object`, y `Format-Table` para filtrar, procesar y presentar datos de manera eficiente.
* **Manipulación de Archivos y Reportes**: Adquirí experiencia en la exportación de resultados a diferentes formatos como CSV (`Export-Csv`), HTML (`ConvertTo-Html`) y texto plano (`Out-File`), una habilidad crucial para la generación de reportes de auditoría.
* **Gestión de Errores Estructurada**: La implementación de bloques `try-catch-finally` en el script `Evidencia10_validar_archivos.ps1` me enseñó la importancia de anticipar y manejar errores para crear scripts más robustos y confiables.
* **Automatización de Tareas Repetitivas**: Comprendí cómo PowerShell puede transformar tareas manuales y tediosas de auditoría en procesos automatizados, rápidos y consistentes.

## Desarrollador

* **Nombre**: Roel Antonio Guzman Martinez
