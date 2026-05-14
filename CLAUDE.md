# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

jpush_flutter_android is a Flutter plugin that integrates the Android vendor channel SDK of JPush. It must be used in conjunction with the `jpush_flutter` plugin.

**Key points:**
- Supports multiple Android vendor channels: Huawei, Xiaomi, Meizu, Vivo, OPPO, Honor
- Configuration is done via `pubspec.yaml` (from version 1.0.0+)
- Automatically handles manifest placeholders and ProGuard rules
- Version 1.0.1 supports jpush_flutter 3.4.5+

## Version Compatibility

| jpush_flutter | jpush_flutter_android |
|:-------------:|:---------------------:|
| 3.4.5+        | 1.0.1                 |
| 3.4.3+        | 0.0.10+               |
| 3.3.8+        | 0.0.9                 |

## Project Structure

```
jpush_flutter_android/
├── lib/                          # Dart plugin code
│   ├── jpush_flutter_android.dart          # Main plugin class
│   ├── jpush_flutter_android_platform_interface.dart  # Platform interface
│   └── jpush_flutter_android_method_channel.dart      # Method channel implementation
├── android/                      # Android native code
│   ├── build.gradle              # Gradle build config (reads pubspec.yaml)
│   ├── proguard-rules.pro        # ProGuard rules
│   └── src/main/
│       ├── kotlin/com/jpush/flutter/android/JPushFlutterAndroidPlugin.kt
│       └── AndroidManifest.xml
├── example/                      # Example app
├── pubspec.yaml                  # Plugin manifest + jpush_android config
└── CHANGELOG.md
```

## Key Files

### `android/build.gradle`
- Reads `jpush_android` configuration from pubspec.yaml using SnakeYAML
- Dynamically injects manifest placeholders into the app module
- Conditionally adds vendor channel dependencies based on configuration
- Important: Must maintain compatibility with different AGP versions (has multiple fallback methods for setting placeholders)

### `pubspec.yaml` Configuration
Users configure vendor channels in pubspec.yaml like this:
```yaml
jpush_android:
  app_key: xxx
  channel: xxx
  huawei:
    enable: true
  xiaomi:
    enable: true
    app_key: xxx
    app_id: xxx
  # ... other vendors
```

## Commonly Used Commands

```bash
# Run Flutter analyze
flutter analyze

# Run tests
flutter test

# Format Dart code
dart format .
```

## Development Notes

1. **Gradle Configuration**: The android/build.gradle uses `projectsEvaluated` hook to inject manifest placeholders into the app module. It has multiple fallback methods to support different AGP versions.

2. **Vendor Prefixes**: The plugin automatically adds required prefixes:
   - Meizu: `MZ-` prefix for app_key/app_id
   - OPPO: `OP-` prefix for app_key/app_id/app_secret

3. **Min SDK**: The plugin requires minSdk 24

4. **ProGuard**: Rules are included in `proguard-rules.pro` and automatically applied via `consumerProguardFiles`

5. **Method Channel**: The channel name is `jPush_flutter_android`
