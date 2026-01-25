# Ejemplos Cursos Online

Una aplicación Flutter que demuestra diferentes cálculos relacionados con una plataforma de cursos online. Esta aplicación está basada en los ejemplos del proyecto banco y adaptada para el contexto educativo.

## Características

### 🧮 Calculadora de Matrícula
- Calcula el costo final de un curso aplicando descuentos
- Diferentes tipos de curso (Básico, Intermedio, Avanzado)
- Descuentos especiales para estudiantes, tercera edad y empleados corporativos
- Combinación de descuentos con límite máximo del 50%

### 📈 Seguimiento de Progreso
- Calcula el porcentaje de progreso del curso
- Estima el tiempo restante para completar el curso
- Diferentes tipos de curso según la duración de las lecciones
- Cálculo basado en horas de estudio semanales

### 🎓 Costo de Certificación
- Calcula el costo de certificados digitales y físicos
- Tarifas variables basadas en el valor del curso
- Diferentes opciones: Digital básico/premium, Físico nacional/internacional
- Incluye tiempos de procesamiento estimados

## Tecnologías Utilizadas

- **Flutter**: Framework de desarrollo móvil
- **go_router**: ^14.0.0 - Navegación declarativa
- **Material 3**: Diseño moderno de Google

## Estructura del Proyecto

```
lib/
├── main.dart                           # Punto de entrada de la aplicación
├── app_router.dart                     # Configuración de rutas
└── pages/
    ├── courses_home_page.dart          # Página principal
    ├── enrollment_calculator_page.dart # Calculadora de matrícula
    ├── progress_tracker_page.dart      # Seguimiento de progreso
    └── certification_fee_page.dart     # Costo de certificación
```

## Instalación y Uso

1. Asegúrate de tener Flutter instalado en tu sistema
2. Clona o descarga este proyecto
3. Navega al directorio del proyecto:
   ```bash
   cd ejemplos_cursos_online
   ```
4. Instala las dependencias:
   ```bash
   flutter pub get
   ```
5. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

## Funcionalidades Detalladas

### Calculadora de Matrícula
- **Descuentos por tipo de curso:**
  - Básico: 5%
  - Intermedio: 10%
  - Avanzado: 15%
- **Descuentos adicionales por estudiante:**
  - Estudiante universitario: +10%
  - Tercera edad: +15%
  - Empleado corporativo: +20%

### Seguimiento de Progreso
- **Duración por lección:**
  - Curso corto: 30 minutos
  - Curso medio: 1 hora
  - Curso extenso: 1.5 horas
- Calcula tiempo estimado de finalización
- Muestra progreso en porcentaje

### Costo de Certificación
- **Certificado digital básico:** Tarifa base $10 + 5% del curso
- **Certificado digital premium:** Tarifa base $25 + 8% del curso
- **Certificado físico nacional:** Tarifa base $50 + 10% del curso
- **Certificado físico internacional:** Tarifa base $100 + 15% del curso

## Navegación

La aplicación utiliza go_router para la navegación entre páginas:
- `/` - Página principal
- `/enrollment` - Calculadora de matrícula
- `/progress` - Seguimiento de progreso
- `/certification` - Costo de certificación

## Basado en

Este proyecto está inspirado en la aplicación `flutter_practica_banco` y adapta sus funcionalidades para el contexto de cursos online, manteniendo la misma estructura y patrones de diseño.
