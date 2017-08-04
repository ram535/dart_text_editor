import 'dart:convert';
import 'dart:html';
import 'dart:js';
import 'package:simple_dialog/simple_dialog.dart';

class TextEditor {
  final String appTitle = "TextEditor";
  // this means it can only be assigned a value once in the lifetime of the application
  final TextAreaElement theEditor;
  // constructor has the same as the class
  // we are setting the member variable theEditor
  TextEditor(this.theEditor) {
    theEditor
      ..onKeyUp.listen(handleKeyPress)
      ..value = loadDocument();
  }

  // Event Handlers. -------------
  void handleKeyPress(KeyboardEvent event) {
    saveDocument();
  }

  void clearEditor(MouseEvent event) {
    confirm(appTitle, "Are you sure you want to clear the text?", 400, 120,
        performClear);
  }

  void showAlertBox(MouseEvent event) {
    alert("Alert", "This a alert dialog box", 200, 120);
  }

  // Actions. -------------
  void performClear() {
    theEditor.value = "";
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
}
