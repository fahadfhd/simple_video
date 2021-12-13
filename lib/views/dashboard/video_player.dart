import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sample_vid/common_widgets/common_button.dart';
import 'package:sample_vid/utils/colors.dart';
import 'package:sample_vid/utils/basic_player_page.dart';
import 'package:sample_vid/utils/styles.dart';
import 'package:sample_vid/utils/video_player_widget.dart';
import 'package:sample_vid/views/screens/login.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

class VideoPlayerView extends StatefulWidget {
  static const route = "/videoplayer";
  const VideoPlayerView({Key? key}) : super(key: key);

  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  String? filePath;
  bool _isLoading = false;
  double progress = 0.0;
  final Dio dio = Dio();
  final urlPdf =
      "https://drive.google.com/file/d/1cM5wc5dEW0p69gG8weNdDaoTbtNeMfXc/view?usp=sharing";
  // final url = "https://www.youtube.com/watch?v=H2Biojf5x0o";

  final asset = 'assets/videos/big.mp4';

  Future<bool> saveFile(String url, String fileName) async {
    Directory? directory;
    try {
      if (await _requestPermission(Permission.storage) &&
          await _requestPermission(Permission.accessMediaLocation) &&
          await _requestPermission(Permission.manageExternalStorage)) {
        directory = (await getExternalStorageDirectory());
        print("--------------${directory!.path}");
        String newPath = "";
        List<String> folders = directory.path.split("/");
        for (int x = 1; x < folders.length; x++) {
          String folder = folders[x];
          if (folder != "Android") {
            newPath += "/" + folder;
          } else {
            break;
          }
        }
        newPath = newPath + "/VideoApp";
        directory = Directory(newPath);
      } else {
        return false;
      }

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        File saveFile = File(directory.path + "/$fileName");
        await dio.download(url, saveFile.path,
            onReceiveProgress: (downloaded, totalSize) {
          setState(() {
            progress = downloaded / totalSize;
          });
        });
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  downloadFile() async {
    setState(() {
      _isLoading = true;
    });

    bool downloaded = await saveFile(
        "https://drive.google.com/u/0/uc?id=1cM5wc5dEW0p69gG8weNdDaoTbtNeMfXc&export=download",
        "big.mp4");

    if (downloaded) {
      print("File is Downloaded");
    } else {
      print("error downloading");
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: colorffffff),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    child: BasicPlayerPage(),
                  ),
                  // child: LiveNewsScreen(
                  // url: urlPdf,
                  // )),
                  // height(20),

                  _isLoading
                      ? LinearProgressIndicator(
                          minHeight: 10,
                          value: progress,
                        )
                      : CommonButton(
                          buttonName: "Download",
                          color: colorWhite80,
                          style: tsS14Black,
                          function: () {
                            downloadFile();
                            // downloaded();
                          },
                        )
                ],
              ),
            ),
            const Positioned(
                top: 10,
                left: 15,
                child: CircleAvatar(
                  radius: 35,
                  child: Icon(
                    Icons.people,
                    size: 50,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
