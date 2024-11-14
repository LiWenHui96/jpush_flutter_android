import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'jpush_flutter_android_platform_interface.dart';

/// An implementation of [JPushFlutterAndroidPlatform] that uses method channels.
class MethodChannelJPushFlutterAndroid extends JPushFlutterAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('jPush_flutter_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
