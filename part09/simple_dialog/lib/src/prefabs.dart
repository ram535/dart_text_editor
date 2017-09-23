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
