/// Object to extract line counts from Source code strings.
class SourceCodeScanner {
  int totalLines = 0;

  void scan(List<String> lines) {
    totalLines = lines.length;
  }
}
