# Spiral01

Everytime we press a key is stored in the local storage.
To acomplish that we have to an even that will listen when there is a key stroke.
When the even occurs a function will be called to handle the even.

``` dart
  theEditor
    ..onKeyUp.listen(handleKeyPress)
```

The hangleKeyPress() function will call the saveDocument() function which will save
the key stroke in the local storage. But to be able to do that, the saveDocument()
function first has to encode it in JSON format.

``` dart
void saveDocument() {
  window.localStorage["MyTextEditor"] = JSON.encode(theEditor.value);
}
```

press a key -> handleKeyPress() -> saveDocument() -> localStorage
