# Examen Unidad III - Automatización con GitHub Actions

**Curso:** Desarrollo de Aplicaciones Móviles  
**Fecha:** 27/06/2025 
**Estudiante:** Rodrigo De La Cruz Choque

## Repositorio
https://github.com/RodrigoDLCC/SM2_ExamenUnidad3

## Evidencias

### 1. Estructura de carpetas
![Estructura del proyecto](images/estructura.png) 

![Estructura del proyecto](images/estructura_1.png)  
*Captura que muestra las carpetas `.github/workflows` y `test`*

### 2. Workflow implementado
![Contenido del workflow](workflow.png)  
*Captura del archivo `quality-check.yml` completo*

### 3. Ejecución automática
![Resultado en GitHub Actions](actions.png)  
*Captura de la pestaña Actions mostrando ejecución exitosa*

## Explicación

1. **Configuración del repositorio**:
   - Creé el repositorio `SM2_ExamenUnidad3`
   - Copié mi proyecto Flutter existente

2. **Workflow**:
   - Creé `.github/workflows/quality-check.yml` con:
     - Análisis de código (`flutter analyze`)
     - Pruebas unitarias (`flutter test`)
   - Se ejecuta automáticamente en pushes y pull requests

3. **Pruebas**:
   - Implementé 3 pruebas unitarias en `test/main_test.dart`
   - Todas pasaron correctamente (100% éxito)

## Código relevante

### quality-check.yml


name: Quality Check

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  quality-analysis:
    runs-on: ubuntu-latest
    timeout-minutes: 15

    steps:
      - uses: actions/checkout@v4

      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.32.5'
          channel: 'stable'

      - name: Install dependencies
        run: |
          flutter pub get
          flutter doctor -v

      - name: Run Flutter Analyze
        run: flutter analyze --no-pub --no-fatal-infos

      - name: Run Widget Tests
        run: flutter test test/widget_test.dart

      - name: Run Unit Tests
        run: flutter test test/main_test.dart 

### main_test.dart

import 'package:flutter_test/flutter_test.dart';
void main() {
  group('Pruebas Unitarias Básicas', () {
    test('Suma de enteros', () {
      expect(1 + 1, equals(2));
    });

    test('Lista contiene elemento', () {
      final numbers = [1, 2, 3];
      expect(numbers.contains(2), isTrue);
    });

    test('Conversión de string', () {
      expect('flutter'.toUpperCase(), equals('FLUTTER'));
    });
  });
}

