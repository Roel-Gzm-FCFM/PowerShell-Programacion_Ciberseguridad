# Repositorio de Scripts de Ciberseguridad con PowerShell

Este repositorio contiene una colección de scripts y módulos de PowerShell diseñados para realizar tareas de auditoría de seguridad, análisis forense digital básico y monitoreo de sistemas en entornos Windows.

## ¿Qué contiene?

El proyecto está compuesto por 11 archivos que se organizan en dos módulos principales con sus respectivos ejecutables, y una serie de scripts independientes para tareas específicas. Incluye tanto el código funcional de las herramientas como los archivos de manifiesto (`.psd1`) que definen los módulos.

## ¿Qué scripts se incluyen?

Los scripts están agrupados por funcionalidad:

### 1. Módulo de Auditoría Básica
Este módulo realiza una revisión rápida de usuarios y servicios.
* **`Principal.ps1`**: Menú interactivo para ejecutar las auditorías.
* **`AuditoriaBasica.psm1`**: Contiene las funciones `Obtener-UsuariosInactivos` y `Obtener-ServiciosExternos`.
* **`AuditoriaBasica.psd1`**: Manifiesto que define el módulo de auditoría básica.

### 2. Módulo Forense Avanzado
Un conjunto de herramientas más robusto para análisis post-incidente.
* **`Script-principal.ps1`**: Menú principal que permite ejecutar análisis forenses y generar reportes en CSV y PDF.
* **`Modulo.psm1`**: Contiene las funciones `Get-EventosForenses`, `Get-ProcesosRedForenses` y `Get-AbuseIPDBReport`.
* **`Manifiesto.psd1`**: Manifiesto que define el módulo forense.

### 3. Scripts de Auditoría Específicos
Herramientas para tareas de monitoreo y reporte muy concretas.
* **`auditoria_usuarios.ps1`**: Clasifica a todos los usuarios locales según si han iniciado sesión alguna vez y genera tres reportes en `.txt`.
* **`ev5_script1.ps1`**: Obtiene una lista completa de todos los servicios del sistema y la guarda en un archivo `.txt` con la fecha actual.
* **`ev5_script2.ps1`**: Lee el archivo del script anterior y filtra únicamente los servicios detenidos, guardándolos en un nuevo reporte.
* **`obtener_procesos_altos.ps1`**: Identifica y reporta los procesos que consumen más de 100 MB de memoria.

### 4. Script de Utilidad y Demostración
* **`Evidencia10_validar_archivos.ps1`**: Contiene una función que demuestra el manejo robusto de errores (`try-catch-finally`) al validar la existencia y acceso a un archivo.

## ¿Qué tareas de ciberseguridad resuelven?

Estos scripts ayudan a automatizar y resolver las siguientes tareas:

* **Auditoría de Cuentas de Usuario**: Identifican cuentas potencialmente peligrosas, como aquellas que están habilitadas pero nunca se han usado.
* **Análisis de Servicios**: Permiten detectar software de terceros que se ejecuta en segundo plano y monitorear el estado de los servicios del sistema.
* **Análisis Forense de Logs**: Extraen y filtran eventos específicos de los registros de Windows (Visor de Eventos) para investigar actividades sospechosas, como inicios de sesión fallidos.
* **Monitoreo de Procesos y Red**: Correlacionan los procesos en ejecución con sus conexiones de red activas, ayudando a identificar qué software se está comunicando con direcciones IP externas. También detectan procesos con alto consumo de memoria.
* **Inteligencia de Amenazas**: Consultan direcciones IP contra la base de datos de AbuseIPDB para verificar su reputación y determinar si están asociadas con actividades maliciosas.
* **Generación de Evidencia**: Crean reportes en formatos manejables (`.txt`, `.csv`, `.html` y `.pdf`) que sirven como evidencia o registro para auditorías posteriores.

## ¿Qué aprendiste al desarrollarlos?

Este proyecto es una demostración práctica de varios conceptos clave de PowerShell aplicados a la ciberseguridad:

* **Creación de Módulos**: El desarrollo de herramientas reutilizables y organizadas mediante archivos `.psm1` y sus manifiestos `.psd1`.
* **Manejo de Errores**: La implementación de bloques `try-catch-finally` para crear scripts robustos que pueden manejar situaciones inesperadas, como la ausencia de un archivo.
* **Interfaz de Usuario en Consola**: El diseño de menús interactivos utilizando `Read-Host` y `switch` para hacer las herramientas accesibles para otros usuarios.
* **Procesamiento de Datos**: El uso de cmdlets como `Get-LocalUser`, `Get-Service`, `Get-Process` y `Get-WinEvent` para recolectar información del sistema, y el uso de `Where-Object` y bucles para filtrarla y procesarla.
* **Integración con APIs Externas**: La capacidad de conectar PowerShell con servicios web de terceros (AbuseIPDB) para enriquecer el análisis con inteligencia de amenazas externa.
* **Automatización de Reportes**: La habilidad de exportar los resultados a múltiples formatos (`Export-Csv`, `ConvertTo-Html`, `Out-File`), incluyendo la interacción con objetos COM (Excel) para la creación de PDFs.

## Desarrollador
* **Roel Antonio Guzman Martinez**
