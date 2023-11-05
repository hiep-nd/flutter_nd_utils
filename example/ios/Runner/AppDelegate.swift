import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "vn.neodata.nd_absolute_dimention_design",
                                              binaryMessenger: controller.binaryMessenger)
              batteryChannel.setMethodCallHandler({
              [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in

              // Note: this method is invoked on the UI thread.
              guard call.method == "getEnvironment" else {
               result(FlutterMethodNotImplemented)
               return
              }



              result(ProcessInfo().environment)

//            self?.receiveBatteryLevel(result: result)
          })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
