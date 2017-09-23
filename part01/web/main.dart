import 'dart:html';
import 'dart:convert';

TextAreaElement theEditor;

void main() {
  theEditor = querySelector("#editor");
  theEditor
    ..onKeyUp.listen(handleKeyPress)
    ..text = loadDocument();
}

void handleKeyPress(KeyboardEvent event) {
  saveDocument();
}

String loadDocument() {
  String readings = "";
  String jsonString = window.localStorage["MyTextEditor"];
  if (jsonString != null && jsonString.length > 0)
    readings = JSON.decode(jsonString);
  return readings;
}

void saveDocument() {
  window.localStorage["MyTextEditor"] = JSON.encode(theEditor.value);
}
