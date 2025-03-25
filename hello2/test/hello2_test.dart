import 'package:flutter_test/flutter_test.dart';
import 'package:hello2/hello2.dart';
import 'package:hello2/hello2_platform_interface.dart';
import 'package:hello2/hello2_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHello2Platform
    with MockPlatformInterfaceMixin
    implements Hello2Platform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final Hello2Platform initialPlatform = Hello2Platform.instance;

  test('$MethodChannelHello2 is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHello2>());
  });

  test('getPlatformVersion', () async {
    Hello2 hello2Plugin = Hello2();
    MockHello2Platform fakePlatform = MockHello2Platform();
    Hello2Platform.instance = fakePlatform;

    expect(await hello2Plugin.getPlatformVersion(), '42');
  });
}
