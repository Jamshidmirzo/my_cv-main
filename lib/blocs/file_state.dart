abstract class FileState {}

class InitialState extends FileState {}

class LoadingState extends FileState {}

class LoadedState extends FileState {
  final String filePath;
  LoadedState({required this.filePath});
}

class ErrorState extends FileState {
  final String message;
  ErrorState(this.message);
}
