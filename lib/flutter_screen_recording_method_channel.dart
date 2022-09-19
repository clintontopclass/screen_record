import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_screen_recording_platform_interface.dart';

/// An implementation of [FlutterScreenRecordingPlatform] that uses method channels.
class MethodChannelFlutterScreenRecording extends FlutterScreenRecordingPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_screen_recording');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
