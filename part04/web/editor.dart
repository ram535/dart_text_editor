import 'dart:convert';
import 'dart:html';
import 'dart:js';

class TextEditor {
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
    var result = context.callMethod(
        'confirm', ['Are  you  sure  you  want  to  clear  the  text?']);
    if (result == true) {
      theEditor.value = "";
      saveDocument();
    }
  }

  // Actions. -------------
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
