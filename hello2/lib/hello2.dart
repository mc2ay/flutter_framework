
import 'hello2_platform_interface.dart';

class Hello2 {
  Future<String?> getPlatformVersion() {
    return Hello2Platform.instance.getPlatformVersion();
  }
}
