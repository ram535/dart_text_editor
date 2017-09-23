import 'dart:convert';
import 'dart:html';
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

  void showWordCount(MouseEvent event) {
    const String punctuation = ",.-!\"";
    String txt = theEditor.value;
    //punctuation.split('') makes an array [,, ., -, !, "]
    for (var c in punctuation.split(''))
      // replace the punctuations with a white space
      txt = txt.replaceAll(c, " ");

    // split where are a white space and return an array
    List<String> words = txt.split(" ");
    words
      // remove the indexes that are white spaces
      ..removeWhere((s) => s == " ")
      // remove the indexes that are empty
      ..removeWhere((s) => s.length == 0);

    alert(appTitle, "Word Count ${words.length}", 200, 120);
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
