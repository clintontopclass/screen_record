import 'package:flutter/material.dart';
import 'package:flutter_screen_recording/flutter_screen_recording.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:quiver/async.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool recording = false;
  int _time = 0;

  requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.microphone,
      Permission.manageExternalStorage,
      Permission.photos,
    ].request();
    print(statuses[Permission.location]);
  }

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Screen Recording'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  recording = !recording;
                  if (recording == true) {
                    print(
                        '--------- $recording  ------- START record----------');
                    await FlutterScreenRecording.startRecordScreenAndAudio(
                        "screen_record${DateTime.now()}");
                  } else {
                    print(
                        '--------- $recording  ------- STOP record----------');
                    String? videoscreen =
                        await FlutterScreenRecording.stopRecordScreen;
                    print('path----------$videoscreen');

                    GallerySaver.saveVideo(videoscreen!,
                        albumName: 'media', toDcim: true);
                  }

                  setState(() {});
                },
                child: Text('Strat and stop'))
          ],
        ),
      ),
    );
  }
}
