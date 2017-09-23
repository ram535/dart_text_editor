import 'sourcescan.dart';
import 'dart:io';

main(List<String> arguments) {
  print(arguments[0]);
  SourceCodeScanner codeScan = new SourceCodeScanner();
  File myFile = new File(arguments[0]);

  myFile.readAsLines().then((List<String> Lines) {
    codeScan.scan(Lines);
  print("Lines ${codeScan.totalLines}");
  });
}
