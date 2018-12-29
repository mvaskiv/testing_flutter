import 'package:flutter/material.dart';

class RoundedModal extends StatelessWidget {
  final Widget child;
  RoundedModal(this.child);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.transparent,
      child: new Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0)
          ),
        ),
        child: new Column(
          children: <Widget>[
            Icon(Icons.more_horiz, color: Colors.grey,),
            this.child
          ]
        ),
      ),
    );
  }
}