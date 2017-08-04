import 'dart:html';
import 'dart:async';
import 'editor.dart';
import 'package:intl/intl.dart';

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
  var btnDownload = querySelector("#btnDownload");
  var btnClassGen = querySelector("#btnClassGen");
  var btnStat = querySelector("#btnCodeStats");

  btnClear.onClick.listen(theEditor.clearEditor);
  btnAlert.onClick.listen(theEditor.showWordCount);
  btnFreq.onClick.listen(theEditor.showCountFrequency);
  btnAbout.onClick.listen(theEditor.showAbout);
  btnDownload.onClick.listen(theEditor.downloadFile);
  btnClassGen.onClick.listen(theEditor.showClassGen);
  btnStat.onClick.listen(theEditor.showStats);

  //Clock
  new Timer.periodic(new Duration(seconds: 1),
      (timer) => querySelector("#clock").text =
          (new DateFormat('HH:mm')).format(new DateTime.now()));
}
