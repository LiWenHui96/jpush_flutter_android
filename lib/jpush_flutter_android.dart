import 'jpush_flutter_android_platform_interface.dart';

class JPushFlutterAndroid {
  Future<String?> getPlatformVersion() {
    return JPushFlutterAndroidPlatform.instance.getPlatformVersion();
  }
}
