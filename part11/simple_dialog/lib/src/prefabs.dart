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
