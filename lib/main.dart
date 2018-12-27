import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final mySystemTheme = SystemUiOverlayStyle.light
    .copyWith(systemNavigationBarColor: Colors.white, statusBarColor: Colors.white);
  
  @override
  Widget build(BuildContext context) {
      
    return new AnnotatedRegion<SystemUiOverlayStyle>(
      value: mySystemTheme,
      child: new  MaterialApp(
        color: Colors.white,
        title: 'Toodoo',
        theme: new ThemeData(
          canvasColor: Colors.white,
          accentColor: Colors.blueAccent,
          primaryColor: Colors.white,
        ),
        home: new MyHomePage(title: 'My Tasks'),
        routes: <String, WidgetBuilder> {
          'Personal': (BuildContext context) => Page(title: 'Personal'),
          'Work': (BuildContext context) => Page(title: 'Work'),
          'Home': (BuildContext context) => Page(title: 'Home'),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  
  @override
  _MyHomePageState createState() => _MyHomePageState(title: title);
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  _MyHomePageState({Key key, this.title});
  final String title;


  ScrollController scrollController;
  final appColors = [
    Color.fromRGBO(231, 129, 109, 1.0),
    Color.fromRGBO(99, 138, 223, 1.0),
    Color.fromRGBO(111, 194, 173, 1.0),
    Color.fromRGBO(111, 194, 173, 1.0)
  ];
  var cardIndex = 0;
  var currentColor = Color.fromRGBO(231, 129, 109, 1.0);
  final cardsList = [CardItemModel("Personal", Icons.account_circle, 9, 0.83),CardItemModel("Personal", Icons.account_circle, 9, 0.83),CardItemModel("Work", Icons.work, 12, 0.24),CardItemModel("Home", Icons.home, 7, 0.32)];
  
  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(title, style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w400, color: Colors.grey.shade700)),
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: new IconThemeData(color: Colors.grey.shade700, opacity: 0.8),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          )
        ],
        elevation: 0.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        elevation: 2.0,
        child: const Icon(Icons.add),
        highlightElevation: 2.0,
        onPressed: () => showInput(context),
      ),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.white,
        elevation: 8.0,
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: new Icon(Icons.sort), onPressed: () => showMenu(context)),
            IconButton(icon: new Icon(Icons.more_vert), onPressed: null),
          ],
        ),
      ),
      body: new Center(
        child: new ListView.builder(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0),
          // physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          // controller: scrollController,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, '${cardsList[position].cardTitle}'),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color.fromRGBO(251, 251, 251, 1.0),
                  child: Container(
                    // width: 250.0,
                    // height: 202.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(cardsList[position].icon, color: appColors[position]),
                              Icon(Icons.more_vert, color: Colors.grey.shade700),
                              
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                child: Text("${cardsList[position].tasksRemaining} Tasks", style: TextStyle(color: Colors.grey.shade700)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                child: Text("${cardsList[position].cardTitle}", style: TextStyle(color: Colors.grey.shade700, fontSize: 28.0)),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: LinearProgressIndicator(value: cardsList[position].taskCompletion, valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(29, 129, 129, 1.0)), backgroundColor: Color.fromRGBO(89, 189, 189, 1.0)), 
                              // ),
                            ]
                          )
                        )
                      ]
                    )
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                ),
              ),
              // onHorizontalDragEnd: (details) {
              //   animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
              //   curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
              //   animationController.addListener(() {
              //     setState(() {
              //       currentColor = colorTween.evaluate(curvedAnimation);
              //     });
              //   });

              //   if(details.velocity.pixelsPerSecond.dx > 40) {
              //     if(cardIndex>0) {
              //       cardIndex--;
              //       colorTween = ColorTween(begin:currentColor,end:appColors[cardIndex]);
              //     }
              //   } else if (details.velocity.pixelsPerSecond.dx < -40) {
              //     if(cardIndex<=2) {
              //       cardIndex++;
              //       colorTween = ColorTween(begin: currentColor,
              //           end: appColors[cardIndex]);
              //     }
              //   }
              //   setState(() {
              //     scrollController.animateTo((cardIndex)*256.0, duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
              //   });

              //   colorTween.animate(curvedAnimation);

              //   animationController.forward();
              // },
            );
          },     
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 64.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(cardsList[0].icon, color: appColors[0]),
                  Icon(Icons.more_vert, color: Colors.grey.shade700)
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}

class CardItemModel {

  String cardTitle;
  IconData icon;
  int tasksRemaining;
  double taskCompletion;

  CardItemModel(this.cardTitle, this.icon, this.tasksRemaining, this.taskCompletion);

}

class Page extends StatelessWidget {
  Page({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(title, style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w400, color: Colors.grey.shade700)),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        centerTitle: false,
        iconTheme: new IconThemeData(color: Colors.grey.shade700, opacity: 0.8),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          )
        ],
        elevation: 0.0,
      ),
      body: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 42.0,
                vertical: 32.0,
              ),
              child: new Container(
                child: new Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                      child: Icon(Icons.account_circle, size: 45.0, color: Colors.grey.shade700),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
                      child: Text('Hello, Mike.', style: TextStyle(fontSize: 30.0, color: Colors.grey.shade700)),
                    ),
                  Text('Have a nice day', style: TextStyle(color: Colors.grey.shade700)),
                  Text('You have 0 tasks for today', style: TextStyle(color: Colors.grey.shade700)),
                  ],
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}

void showMenu(context) {
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
    });
}

void showSort(context) {
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