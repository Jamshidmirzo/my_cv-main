import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cv/blocs/file_event.dart';
import 'package:my_cv/blocs/file_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  FileBloc() : super(InitialState()) {
    on<DownloadFile>(_onDownloadPdf);
    on<OpenFile>(_onOpenFile);
  }

  final dio = Dio();

  void _onDownloadPdf(DownloadFile event, Emitter<FileState> emit) async {
    emit(LoadingState());
    try {
      final savePath = await _getSavePath();
      await dio.download(event.pasth, savePath);
      emit(LoadedState(filePath: savePath));
    } catch (e) {
      emit(ErrorState("Failed to download file"));
    }
  }

  void _onOpenFile(OpenFile event, Emitter<FileState> emit) async {
    try {
      await OpenFilex.open(event.pasth);
    } catch (e) {
      emit(ErrorState("Failed to open file"));
    }
  }

  Future<String> _getSavePath() async {
    Directory savePath = await getApplicationDocumentsDirectory();
    if (Platform.isAndroid) {
      savePath = Directory("/storage/emulated/0/Download");
    }
    final fullPath = "${savePath.path}/opers.pdf";
    return fullPath;
  }
}




// Future<void> _downloadWithIsolate(String url) async {
//     final _dio = Dio();

//     final Directory savePath = await getApplicationDocumentsDirectory();
//     final String filePath = "${savePath.path}/cv.pdf";
//     await _dio.download(url, filePath);
//   }

