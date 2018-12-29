import 'package:flutter/material.dart';
import '../components/cardItem.dart';
import '../menu/functions.dart';

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
            IconButton(icon: new Icon(Icons.sort), onPressed: () => showMenuModal(context)),
            IconButton(icon: new Icon(Icons.more_vert), onPressed: () => showSortModal(context)),
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