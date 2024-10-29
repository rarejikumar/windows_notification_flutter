#include "flutter_window.h"

#include <optional>

#include "flutter/generated_plugin_registrant.h"

 #include <flutter/binary_messenger.h>
 #include <flutter/standard_method_codec.h>
 #include <flutter/method_channel.h>
 #include <flutter/method_result_functions.h>

 FlutterWindow::FlutterWindow(const flutter::DartProject& project)
    : project_(project) {}

    // FlutterWindow::FlutterWindow(RunLoop* run_loop,
    //                          const flutter::DartProject& project)
    // : run_loop_(run_loop), project_(project) {}

FlutterWindow::~FlutterWindow() {}

void initMethodChannel(flutter::FlutterEngine* flutter_instance) {
  // auto channel = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
  //     registry->messenger(), "com.leadergroup.axionic/desktop_app",
  //     &flutter::StandardMethodCodec::GetInstance());

  // channel->SetMethodCallHandler(
  //     [](const flutter::MethodCall<flutter::EncodableValue>& call,
  //        std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  //       if (call.method_name().compare("getNativeMessage") == 0) {
  //         std::string message = "Hello from Windows!";
  //         result->Success(flutter::EncodableValue(message));
  //       } else {
  //         result->NotImplemented();
  //       }
  //     });

  auto channel =
        std::make_unique<flutter::MethodChannel<>>(
            flutter_instance->messenger(), "com.leadergroup.axionic/desktop_app",
            &flutter::StandardMethodCodec::GetInstance());

    channel->SetMethodCallHandler(
        [](const flutter::MethodCall<>& call, 
    std::unique_ptr<flutter::MethodResult<>> result) {

            if (call.method_name().compare("getNativeData") == 0) {
            // do whate ever you want

            result->Success("pass result here");
            }// cheack method name called from dart
            
            else {
                result->NotImplemented();
            }
        });
}


bool FlutterWindow::OnCreate() {
  if (!Win32Window::OnCreate()) {
    return false;
  }

  RECT frame = GetClientArea();

  // The size here must match the window dimensions to avoid unnecessary surface
  // creation / destruction in the startup path.
  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  // Ensure that basic setup of the controller was successful.
  if (!flutter_controller_->engine() || !flutter_controller_->view()) {
    return false;
  }
  RegisterPlugins(flutter_controller_->engine());

  // run_loop_->RegisterFlutterInstance(flutter_controller_->engine());

  flutter::MethodChannel<> channel(
      flutter_controller_->engine()->messenger(), "com.leadergroup.axionic/desktop_app",
      &flutter::StandardMethodCodec::GetInstance());
  channel.SetMethodCallHandler(
      [](const flutter::MethodCall<>& call,
         std::unique_ptr<flutter::MethodResult<>> result) {
        std::cout << "Method called: " << call.method_name() << std::endl;

            if (call.method_name().compare("getNativeData") == 0) {
                // Print a message indicating the method was matched
                std::cout << "Received 'getNativeData' method call" << std::endl;

                // Do whatever you want
                result->Success("pass result here");

                // Print a message indicating success
                std::cout << "Result sent: pass result here" << std::endl;
            } else {
                // Print a message for unmatched methods
                std::cout << "Method not implemented: " << call.method_name() << std::endl;
                result->NotImplemented();
            }
      });


  SetChildContent(flutter_controller_->view()->GetNativeWindow());
  flutter_controller_->engine()->SetNextFrameCallback([&]() {
    this->Show();
  });

  // Flutter can complete the first frame before the "show window" callback is
  // registered. The following call ensures a frame is pending to ensure the
  // window is shown. It is a no-op if the first frame hasn't completed yet.
  flutter_controller_->ForceRedraw();

  return true;
}

void FlutterWindow::OnDestroy() {
  if (flutter_controller_) {
    // run_loop_->UnregisterFlutterInstance(flutter_controller_->engine());
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
  // Give Flutter, including plugins, an opportunity to handle window messages.
  if (flutter_controller_) {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
    if (result) {
      return *result;
    }
  }

  switch (message) {
    case WM_FONTCHANGE:
      flutter_controller_->engine()->ReloadSystemFonts();
      break;
  }

  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}
