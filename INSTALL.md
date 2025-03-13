# Установка и настройка

## Предварительные требования
- Flutter SDK 3.0+
- Dart 3.0+
- Android Studio/Xcode (для мобильных платформ)
- Git

## Шаги установки

1. Клонировать репозиторий:
```bash
git clone https://github.com/your-repo/task_manager_flutter.git
cd task_manager_flutter
```

2. Установить зависимости:
```bash
flutter pub get
```

3. Сборка для платформ:

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

### Windows
```bash
flutter build windows --release
```

### macOS
```bash
flutter build macos --release
```

### Linux
```bash
flutter build linux --release
```

4. Запуск приложения:
```bash
flutter run -d chrome  # Для веб-версии
```

## Настройка окружения

1. Локализация:
```bash
flutter gen-l10n
```

2. Обновление зависимостей:
```bash
flutter pub upgrade
```

3. Проверка зависимостей:
```bash
flutter pub outdated
```

## Тестирование
```bash
flutter test
```

## Частые проблемы

**Ошибки сборки Android:**
- Убедитесь что установлен Android SDK 33+
- Проверьте лицензии:
```bash
flutter doctor --android-licenses
```

**Проблемы с локализацией:**
- Обновите файлы ARB в lib/l10n
- Перезапустите генерацию:
```bash
flutter gen-l10n
```

---

# Installation Guide

## Prerequisites
- Flutter SDK 3.0+
- Dart 3.0+
- Android Studio/Xcode (for mobile platforms)
- Git

## Installation Steps

1. Clone repository:
```bash
git clone https://github.com/your-repo/task_manager_flutter.git
cd task_manager_flutter
```

2. Install dependencies:
```bash
flutter pub get
```

3. Build for platforms:

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

### Windows
```bash
flutter build windows --release
```

### macOS
```bash
flutter build macos --release
```

### Linux
```bash
flutter build linux --release
```

4. Run application:
```bash
flutter run -d chrome  # For web version
```

## Environment Setup

1. Localization:
```bash
flutter gen-l10n
```

2. Update dependencies:
```bash
flutter pub upgrade
```

3. Check dependencies:
```bash
flutter pub outdated
```

## Testing
```bash
flutter test
```

## Troubleshooting

**Android build errors:**
- Ensure Android SDK 33+ is installed
- Verify licenses:
```bash
flutter doctor --android-licenses
```

**Localization issues:**
- Update ARB files in lib/l10n
- Regenerate localization:
```bash
flutter gen-l10n
```

[![Open in Visual Studio Code](https://img.shields.io/static/v1?logo=visualstudiocode&label=&message=Open%20in%20VS%20Code&labelColor=2c2c32&color=007acc)](https://open.vscode.dev/your-org/task_manager_flutter)
