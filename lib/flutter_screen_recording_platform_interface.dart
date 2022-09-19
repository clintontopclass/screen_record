import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_screen_recording_method_channel.dart';

abstract class FlutterScreenRecordingPlatform extends PlatformInterface {
  /// Constructs a FlutterScreenRecordingPlatform.
  FlutterScreenRecordingPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterScreenRecordingPlatform _instance = MethodChannelFlutterScreenRecording();

  /// The default instance of [FlutterScreenRecordingPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterScreenRecording].
  static FlutterScreenRecordingPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterScreenRecordingPlatform] when
  /// they register themselves.
  static set instance(FlutterScreenRecordingPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
