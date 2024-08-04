sealed class FileEvent {}

final class GetFiles extends FileEvent {}

final class DownloadFile extends FileEvent {
  final String pasth;

  DownloadFile(this.pasth);
}

final class OpenFile extends FileEvent {
  final String pasth;

  OpenFile(this.pasth);
}
