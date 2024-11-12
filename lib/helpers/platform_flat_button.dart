// import 'dart:io';

// import 'package:flutter/cupertino.dart';

// class PlatformFlatButton extends StatelessWidget {
//   final Function handler;
//   final Widget buttonChild;
//   final Color color;

//   PlatformFlatButton({required this.buttonChild,required this.color,required this.handler});

//   @override
//   Widget build(BuildContext context) {
//     return Platform.isIOS
//         ? CupertinoButton(
//             child: this.buttonChild,
//             color: this.color,
//             onPressed: this.handler,
//             borderRadius: BorderRadius.circular(15.0),
//           )
//         : FlatButton(
//             color: this.color,
//             child: this.buttonChild,
//             onPressed: this.handler,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0)),
//           );
//   }
// }

// //--------------------------------

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformFlatButton extends StatelessWidget {
  final VoidCallback? handler; // Updated to VoidCallback?
  final Widget buttonChild;
  final Color color;

  PlatformFlatButton({
    required this.buttonChild,
    required this.color,
    required this.handler,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: this.buttonChild,
            color: this.color,
            onPressed: this.handler,
            borderRadius: BorderRadius.circular(15.0),
          )
        : TextButton(
            style: TextButton.styleFrom(
              backgroundColor: this.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: this.buttonChild,
            onPressed: this.handler,
          );
  }
}
