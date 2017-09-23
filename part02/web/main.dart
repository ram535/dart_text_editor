import 'dart:html';
import 'dart:convert';

TextAreaElement theEditor;

void main() {
  DivElement apptitle = querySelector("#toolbar");
  apptitle.text = "TextEditor";

  theEditor = querySelector("#editor");
  theEditor
    ..onKeyUp.listen(handleKeyPress)
    ..text = loadDocument();

  ButtonInputElement btnClear = querySelector("#btnClearText");
  btnClear.onClick.listen(clearEditor);
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

void clearEditor(MouseEvent event) {
  theEditor.value = "";
  saveDocument();
}

void saveDocument() {
  window.localStorage["MyTextEditor"] = JSON.encode(theEditor.value);
}
