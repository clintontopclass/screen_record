import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screen_recording/flutter_screen_recording.dart';
import 'package:flutter_screen_recording/flutter_screen_recording_platform_interface.dart';
import 'package:flutter_screen_recording/flutter_screen_recording_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterScreenRecordingPlatform 
    with MockPlatformInterfaceMixin
    implements FlutterScreenRecordingPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterScreenRecordingPlatform initialPlatform = FlutterScreenRecordingPlatform.instance;

  test('$MethodChannelFlutterScreenRecording is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterScreenRecording>());
  });

  test('getPlatformVersion', () async {
    FlutterScreenRecording flutterScreenRecordingPlugin = FlutterScreenRecording();
    MockFlutterScreenRecordingPlatform fakePlatform = MockFlutterScreenRecordingPlatform();
    FlutterScreenRecordingPlatform.instance = fakePlatform;
  
    // expect(await flutterScreenRecordingPlugin.getPlatformVersion(), '42');
  });
}
