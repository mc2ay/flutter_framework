#ifndef FLUTTER_PLUGIN_HELLO2_PLUGIN_H_
#define FLUTTER_PLUGIN_HELLO2_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace hello2 {

class Hello2Plugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  Hello2Plugin();

  virtual ~Hello2Plugin();

  // Disallow copy and assign.
  Hello2Plugin(const Hello2Plugin&) = delete;
  Hello2Plugin& operator=(const Hello2Plugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace hello2

#endif  // FLUTTER_PLUGIN_HELLO2_PLUGIN_H_
