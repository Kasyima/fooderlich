import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loadInterenetImage() {
  return Image.network("https://github.com/ptyagicodecamp/");
}

Widget loadAssetImage() {
  return Image.asset('asset/images/food.png');
}

// //? ToggleButtons
// ToggleButtons(
//   children : [
//     Icon(Icons.airplanemode_off),
//     Icon(Icons.airplanemode_on),
//   ],
//   isSelected: [!isLOcal, isLocal],
//   onPressed: (int index){
//     setState(() {
//       isLocal = !isLocal;
//     })
//   }
// )

class MyTextFieldWidget extends StatefulWidget {
  const MyTextFieldWidget({super.key});

  @override
  State<MyTextFieldWidget> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  late TextEditingController _controller;
  String userText = "";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: _controller,
              obscureText: true,
              keyboardType: TextInputType.number,
              onSubmitted: (value) async {
                setState(() {
                  userText = value;
                  _controller.clear();
                });
              },
            ),
            Text("User entered: $userText"),
          ],
        ),
      ),
    );
    /*
   The TextField widget's autofocus property is set to `true` to prompt users to enter text.
   The `TextEditingController reference `_controller`  is assigned to the `controller` property.
   The `onSubmitted` property tells the widget what to do with the entered text
   The entered text `value` is assigned to the `userText` variable.
   The `TextField` widget is cleared using `_controller.clear()`.
   */
  }
}

//! FutureBuilder (FutureBuilder<T>class) is a widget that builds itself based on
//! the snapshot returned from the Future class.

Future<int> _futureData = Future<int>.delayed(
  Duration(seconds: 3),
  () => 3,
);

Future<int> FutureError = Future<int>.delayed(
  Duration(seconds: 3),
  () => throw ("Sample error"),
);

/*The FutureBuilder widget builds widgets for the interface based on the snapshot received from the Future object.
The Future object `_futureData` is assigned to its `future` property.
The `builder` property is given to the constructor with `AsyncSnapshot<int> snapshot`.
It uses `snapshot` to build the `futureChild` widget.
When the `snapshot` has data, it displays the data received in a text widget.*/
class MyFutureData extends StatelessWidget {
  const MyFutureData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            future: _futureData,
            builder: (context, snapshot) {
              Widget futureChild;
              if (snapshot.hasData) {
                // success
                futureChild = Text("Number received is ${snapshot.data}");
              } else if (snapshot.hasError) {
                // show error message
                futureChild =
                    Text("Error occurred fetching data [${snapshot.error}]");
              } else {
                //waiting for data to arrive
                futureChild = CircularProgressIndicator();
              }
              return Center(
                child: futureChild,
              );
            },
          )
        ],
      ),
    );
  }
}

//! Placeholder WIDGET
//? When this asynchronous data contains information about an image intended to be displayed, it makes sense to show a placeholder for this image.

//! AlertDialog WIDGET
//! ElevatedButton

class MyAlertDialog extends StatefulWidget {
  const MyAlertDialog({super.key});

  @override
  State<MyAlertDialog> createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  _showMaterialDialog(context);
                },
                child: Text("Material"),
              ),
              ElevatedButton(
                onPressed: () {
                  _showCupertinoDialog(context);
                },
                child: Text('Cupertino'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showMaterialDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Material"),
          content: Text("I am a Material AlertDialog"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showCupertinoDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Cupertino"),
          content: Text("I'm Cupertino (iOS) AlertDialog"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
