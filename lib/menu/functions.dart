import 'package:flutter/material.dart';
import '../components/roundedModal.dart';

void showInput(context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return RoundedModal(new Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              autofocus: true,
            )
          ],
        ),
      ));
    }
  );
}

void showMenuModal(context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return RoundedModal(new Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
              title: Text(
                'Quang Truong',
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black),
              ),
              subtitle: Text(
                'truongphamit@gmail.com',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Divider(
              color: Colors.black26,
              height: 1.0,
            ),
            ListView(
              shrinkWrap: true, //avoids explicit height (so it seems)
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'My Task',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w400),
                  ),
                  decoration: ShapeDecoration(
                      color: Colors.blue[50],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                              bottomStart: Radius.circular(22.0),
                              topStart: Radius.circular(22.0)))),
                )
              ],
            ),
            Divider(
              color: Colors.black26,
              height: 1.0,
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text(
                'Create new list',
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black),
              ),
            ),
            Divider(
              color: Colors.black26,
              height: 1.0,
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text(
                'Send feedback',
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black),
              ),
            ),
            Divider(
              color: Colors.black26,
              height: 1.0,
            ),
            ListTile(
              title: Text(
                'Open-source licenses',
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black),
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 20.0),)
          ],
        ),
      ));
    });
}

void showSortModal(context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return RoundedModal(new Container(
        height: 100.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
              title: Text(
                'Quang Truong',
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black),
              ),
              subtitle: Text(
                'truongphamit@gmail.com',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Divider(
              color: Colors.black26,
              height: 1.0,
            ),
            ListView(
              shrinkWrap: true, //avoids explicit height (so it seems)
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'My Task',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w400),
                  ),
                  decoration: ShapeDecoration(
                      color: Colors.blue[50],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                              bottomStart: Radius.circular(22.0),
                              topStart: Radius.circular(22.0)))),
                )
              ],
            ),
            Divider(
              color: Colors.black26,
              height: 1.0,
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text(
                'Create new list',
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black),
              ),
            ),
            Divider(
              color: Colors.black26,
              height: 1.0,
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text(
                'Send feedback',
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black),
              ),
            ),
            Divider(
              color: Colors.black26,
              height: 1.0,
            ),
            ListTile(
              title: Text(
                'Open-source licenses',
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black),
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 20.0),)
          ],
        ),
      ));
    });
}
