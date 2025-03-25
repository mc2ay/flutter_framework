import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'hello2_platform_interface.dart';

/// An implementation of [Hello2Platform] that uses method channels.
class MethodChannelHello2 extends Hello2Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('hello2');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
