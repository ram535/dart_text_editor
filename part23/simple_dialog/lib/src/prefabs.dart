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

///Source Code Stats Dialog
class CodeStatsDialog extends Dialog {
  CanvasRenderingContext2D c2d;

  /// Constructor.
  CodeStatsDialog() : super("Source Code Stats", "", 510, 400) {

    CanvasElement graphs = new CanvasElement();
    graphs.width = 500;
    graphs.height = 270;
    c2d = graphs.getContext("2d");

    contentDiv
      ..append(new BRElement())
      ..append(graphs);
  }

  /// Process the code and build the pie chart.
  void scanCode(String srcCode) {

    // Get the stats.
    List<double> data = [0.0, 0.0, 0.0, 0.0];
    double totalLines = 0.0;
    SourceCodeScanner scScanner = new SourceCodeScanner();

    scScanner.scan(srcCode.split('\n'));
    data[0] = (scScanner.totalLines -
            (scScanner.comments + scScanner.whitespace + scScanner.imports))
        .roundToDouble();
    data[1] = scScanner.comments.roundToDouble();
    data[2] = scScanner.imports.roundToDouble();
    data[3] = scScanner.whitespace.roundToDouble();
    totalLines = scScanner.totalLines.roundToDouble();

    // Display Pie chart.
    double lastpos = 0.0;
    var labels = ['Code', 'Comments', 'Imports', 'Whitespace'];
    var colors = ['red', 'green', 'blue', 'yellow'];
    int radius = 130;

    for (int i = 0; i < 4; i++) {
      c2d
        ..fillStyle = colors[i]
        ..strokeStyle = "black"
        ..beginPath()
        ..moveTo(radius, radius)
        ..arc(radius, radius, radius, lastpos,
            (lastpos + (PI * 2.0 * (data[i] / totalLines))), false)
        ..lineTo(radius, radius)
        ..fill()
        ..stroke()
        ..closePath();
      lastpos += PI * 2.0 * (data[i] / totalLines);
      print(lastpos);

      c2d
        ..beginPath()
        ..strokeStyle = "black"
        ..fillStyle = colors[i]
        ..fillRect(380, 90 + 20 * i, 8, 8)
        ..strokeRect(380, 90 + 20 * i, 8, 8)
        ..strokeText(labels[i], 400, 100 + 20 * i)
        ..stroke()
        ..closePath();
    }
  }
}
