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
  var btnFreq = querySelector("#btnFreq");
  var btnAbout = querySelector("#btnAbout");

  btnClear.onClick.listen(theEditor.clearEditor);
  btnAlert.onClick.listen(theEditor.showWordCount);
  btnFreq.onClick.listen(theEditor.showCountFrequency);
  btnAbout.onClick.listen(theEditor.showAbout);
}
