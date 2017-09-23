import 'dart:io';

main(List<String> arguments) {
  print(arguments[0]);
  File myFile = new File(arguments[0]);

  myFile.readAsLines().then((List<String> Lines) {
    print(Lines);
  });
}
