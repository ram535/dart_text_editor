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
  DivElement buttons = new DivElement();

  bool cancelButton = false;
  Function editorAction = null;

  // Ctor with two option trailing parameters.
  Dialog(this.titleText, this.bodyText, this.width, this.height,
      [this.cancelButton = false, this.editorAction = null]) {
    title
      ..text = titleText
      ..classes.toggle("dialogboxtitle")
      ..style.width = "${width}px";

    contentDiv
      ..text = bodyText
      ..style.padding = "5px"
      ..style.width = "${width}px";

    buttons
      ..append(new BRElement())
      ..append(new BRElement())
      ..style.textAlign = "center"
      ..style.width = "${width}px"
      ..append(makeButton("OK", setOKStatus));

    if (cancelButton) {
      var gap = new SpanElement();
      gap.appendHtml("&nbsp;&nbsp;&nbsp;");
      buttons.append(gap);
      buttons.append(makeButton("CANCEL", remove));
    }

    dialogBox
      ..style.width = "${width}px"
      ..style.height = "${height}px"
      // ..style.visibility = "visible"
      ..classes.toggle("dialogbox")
      ..append(title)
      ..append(contentDiv)
      ..append(buttons);

    // Add the dialog to the DOM.
    document.body.append(dialogBox);
  }

  // Create a button with the supplied text and connect to handler.
  ButtonElement makeButton(String text, Function clickhandler) {
    ButtonElement button = new ButtonElement();
    button
      ..text = text
      ..style.width = "100px"
      ..style.padding = "5px";
    button.onClick.listen(clickhandler);
    return button;
  }

  // Remove the dialog from the screen.
  void remove(MouseEvent me) {
    document.body.children.remove(dialogBox);
  }

  // the ok button perform other action when is pressed
  // like clear the text area and not like the cancel button
  // that just remove the dialog box
  void setOKStatus(MouseEvent me) {
    remove(null);
    // since editorAction is optional like in the alarm dialog
    // we need this if. Without it the the program would try
    // to execute editorAction() but since it does not exist
    // like in the alarm dialog box, and this would throw an error
    if (editorAction != null) editorAction();
  }
}
