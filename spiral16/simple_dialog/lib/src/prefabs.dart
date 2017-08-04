part of simple_dialog;

/// Equivalent of JS confirm - Ok Cancel buttons.
void confirm(
    String dlgTitle, String prompt, int width, int height, Function action) {
  Dialog dlg = new Dialog(dlgTitle, prompt, width, height, true, action);
}

/// Equivalent of JS alert - Ok button.
void alert(String dlgTitle, String prompt, int width, int height) {
  Dialog dlg = new Dialog(dlgTitle, prompt, width, height);
}

/// About box - text content with hyperlink.
// extends keyword allows the AboutDialog class to inherit the Dialog class
// we can see that we are using the contentDiv that is define in the Dialog class
// the keyword super allows the AboutDialog class to use the constructor
// of the Dialog class
class AboutDialog extends Dialog {
  String linkUrl;
  String linkText;

  AboutDialog(String titleText, String bodyText, this.linkUrl, this.linkText,
      int width, int height)
      : super(titleText, bodyText, width, height) {
    // Customise the content for an about box.
    var link = new AnchorElement();
    link.href = linkUrl;
    link.text = linkText;
    contentDiv
      ..nodes.insert(0, new BRElement())
      ..nodes.insert(0, new BRElement())
      ..append(new BRElement())
      ..append(new BRElement())
      ..append(link)
      ..style.textAlign = "center";
  }
}

// Frequency words box
class FrequencyDialog extends Dialog {
  String words = "";

  FrequencyDialog(
      String titleText, String bodyText, int width, int height, this.words)
      : super(titleText, bodyText, width, height) {
    contentDiv
      ..appendHtml("<table align=\"center\">$words</table>")
      ..style.overflowY = "scroll";
  }
}

///Class Generator Dialog
class GenClassDialog extends Dialog {
  TextInputElement name;
  TextAreaElement fields;
  TextAreaElement methods;
  String result = "";
  Function resultHandler;
  Function resultSave;

  GenClassDialog() : super("Dart Class Generator", "", 400, 375, true) {
    name = new TextInputElement();
    name
      ..placeholder = "Name"
      ..style.width = "90%";

    fields = new TextAreaElement();
    fields
      ..rows = 6
      ..placeholder = "Fields  (new line after each)"
      ..style.resize = "none"
      ..style.width = "90%";

    methods = new TextAreaElement();
    methods
      ..rows = 6
      ..placeholder = "Methods (new line after each)"
      ..style.resize = "none"
      ..style.width = "90%";

    contentDiv
      ..append(name)
      ..append(new BRElement())
      ..append(new BRElement())
      ..append(fields)
      ..append(new BRElement())
      ..append(new BRElement())
      ..append(methods);
  }

  void setOKStatus(MouseEvent me) {
    remove(null);
    makeClass();
    resultHandler();
    resultSave();
  }

  void show(Function handler, Function save) {
    resultHandler = handler;
    resultSave = save;
  }

  // Create the actual source code from the Use input.
  void makeClass() {
    String className = name.value;
    String fieldsSrc = "";
    String methodsSrc = "";

    List<String> classFields = fields.value.split("\n");
    List<String> classMethods = methods.value.split("\n");

    classFields.forEach((field) => fieldsSrc += "    var $field;\n");
    classMethods.forEach((method) => methodsSrc += "    $method(){};\n");

    result = """   /// The $className Class.
   class $className {

$fieldsSrc

    $className(){}

$methodsSrc

   }
    """;
  }

}
