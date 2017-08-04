import 'dart:html';
import 'editor.dart';

// TextAreaElement theEditor;
TextEditor theEditor;

void main() {
  //Set up the Editor.
  theEditor = new TextEditor(querySelector("#editor"));

  //Connect Toolbar items to the Editor methods.
  var btnClear = querySelector("#btnClearText");
  var btnAlert = querySelector("#btnWordCount");
  var btnAbout = querySelector("#btnAbout");

  btnClear.onClick.listen(theEditor.clearEditor);
  btnAlert.onClick.listen(theEditor.showWordCount);
  btnAbout.onClick.listen(theEditor.showAbout);
}
