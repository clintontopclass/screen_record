import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screen_recording/flutter_screen_recording_method_channel.dart';

void main() {
  MethodChannelFlutterScreenRecording platform = MethodChannelFlutterScreenRecording();
  const MethodChannel channel = MethodChannel('flutter_screen_recording');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
