import 'dart:html';
import 'editor.dart';

// TextAreaElement theEditor;
TextEditor theEditor;

void main() {
  //Set up the Editor.
  // theEditor = querySelector("#editor");
  theEditor = new TextEditor(querySelector("#editor"));

  //Connect Toolbar items to the Editor methods.
  // ButtonInputElement btnClear = querySelector("#btnClearText");
  var btnClear = querySelector("#btnClearText");

  // btnClear.onClick.listen(clearEditor);
  btnClear.onClick.listen(theEditor.clearEditor);
}
