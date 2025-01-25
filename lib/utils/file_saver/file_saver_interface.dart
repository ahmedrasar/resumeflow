abstract interface class FileSaverInterface {
  Future<bool> saveFile(
      List<int> bytes, String fileName, String prompt, String extension);
}
