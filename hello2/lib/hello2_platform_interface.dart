import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'hello2_method_channel.dart';

abstract class Hello2Platform extends PlatformInterface {
  /// Constructs a Hello2Platform.
  Hello2Platform() : super(token: _token);

  static final Object _token = Object();

  static Hello2Platform _instance = MethodChannelHello2();

  /// The default instance of [Hello2Platform] to use.
  ///
  /// Defaults to [MethodChannelHello2].
  static Hello2Platform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Hello2Platform] when
  /// they register themselves.
  static set instance(Hello2Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
