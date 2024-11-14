import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'jpush_flutter_android_method_channel.dart';

abstract class JPushFlutterAndroidPlatform extends PlatformInterface {
  /// Constructs a JPushFlutterAndroidPlatform.
  JPushFlutterAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static JPushFlutterAndroidPlatform _instance = MethodChannelJPushFlutterAndroid();

  /// The default instance of [JPushFlutterAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelJPushFlutterAndroid].
  static JPushFlutterAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [JPushFlutterAndroidPlatform] when
  /// they register themselves.
  static set instance(JPushFlutterAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
