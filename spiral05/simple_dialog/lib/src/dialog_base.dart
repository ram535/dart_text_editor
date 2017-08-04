part of simple_dialog;

/// Simple general purpose div based Dialog box.
class Dialog {
  String titleText = "";
  String bodyText = "";

  int width = 0;
  int height = 0;

  DivElement title = new DivElement();
  DivElement dialogBox = new DivElement();
  DivElement contentDiv = new DivElement();

  // Ctor with two option trailing parameters.
  Dialog(this.titleText, this.bodyText, this.width, this.height) {

      title
        ..text = titleText
        ..classes.toggle("dialogboxtitle")
        ..style.width = "${width}px";

    contentDiv
      ..text = bodyText
      ..style.padding = "5px"
      ..style.width = "${width}px";

    dialogBox
      ..style.width = "${width}px"
      ..style.height = "${height}px"
      ..classes.toggle("dialogbox")
      ..append(title)
      ..append(contentDiv);

    // Add the dialog to the DOM.
    document.body.append(dialogBox);
  }

}
