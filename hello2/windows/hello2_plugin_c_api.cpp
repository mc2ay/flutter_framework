#include "include/hello2/hello2_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "hello2_plugin.h"

void Hello2PluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  hello2::Hello2Plugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
