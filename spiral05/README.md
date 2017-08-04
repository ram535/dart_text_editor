# Spiral05

We will add several more functionalities to the text editor like:
- count words
- about information
- stats
- frequenty use words
- download option
- classes information
- clock

To show the information of this options we will create dialog boxes
for each the options.

We will achieve this by creating a library call simple_dialog.

This is the structures of the simple_dialog library:

```
.
├── lib
│   ├── simple_dialog.dart
│   └── src
│       ├── dialog_base.dart
│       └── prefabs.dart
├── pubspec.lock
└── pubspec.yaml
```

simple_dialog.dart
This file declares our library and defines what is exposed to the outside of it.

dialog_base.dart
In this file we will create the Dialog class which
will contain all the foundational functionality,
such as the dialog frame and the OK and CANCEL buttons. More specialized
dialog boxes will inherit (extend ) this class and modify it for their purposes.

prefabs.dart
Here we will create the most common dialog boxes using the Dialog class defined in dialog_base.dart file.
-A simple alert dialog box
-An application about dialog box
-Confirmation dialog from the user

#Adding the reference of the package to the pubspec.yaml of the text_editor directory
```
dependencies:
  simple_dialog:
    path: ..\simple_dialog
```

But before everything, let's make a simple dialog box. And from there will be adding
more rest of the functionalities in futures spirals.
