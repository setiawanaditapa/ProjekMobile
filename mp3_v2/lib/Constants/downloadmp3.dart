import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:musicplayer/Constants/constant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Controller/songplayer_controller.dart';

RxBool cancel = true.obs;
RxInt progress = 0.obs;

Future<String?> downloadMp3({
  var songUrl,
  String? songTitle,
  String? image,
}) async {
  Directory? externalDir;
  Dio dio = Dio();
  SongPlayerController songPlayerController = Get.put(SongPlayerController());

  CancelToken cancelToken = CancelToken();

  progress.value = 0;
  cancel.value = true;
  try {
    if (!isAndroidVersionUp13) {
      if (await Permission.storage.request().isGranted) {
        externalDir = await getApplicationDocumentsDirectory();

        await dio.download(
          songUrl,
          '${externalDir.path}/$songTitle.mp3',
          cancelToken: cancelToken,
          onReceiveProgress: (rcv, total) {
            progress.value = int.parse(((rcv / total) * 100).toStringAsFixed(0));
            if (cancel.value == false) {
              cancelToken.cancel('song cancel');
              progress.value = 0;
              songPlayerController.isDownload.value = false;
            }
          },
          deleteOnError: true,
        );

        return '${externalDir.path}/$songTitle.mp3';
      } else {
        return null;
      }
    } else {
      externalDir = await getApplicationDocumentsDirectory();

      await dio.download(
        songUrl,
        '${externalDir.path}/$songTitle.mp3',
        cancelToken: cancelToken,
        onReceiveProgress: (rcv, total) {
          progress.value = int.parse(((rcv / total) * 100).toStringAsFixed(0));
          if (cancel.value == false) {
            cancelToken.cancel('song cancel');
            progress.value = 0;
            songPlayerController.isDownload.value = false;
          }
        },
        deleteOnError: true,
      );

      return '${externalDir.path}/$songTitle.mp3';
    }
  } catch (e, trace) {
    if (kDebugMode) {
      print('ERROR ::  $e');
      print('TRACE :: $trace');
    }
    return null;
  }
}
