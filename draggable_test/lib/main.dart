import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _tabController;
  double xPosition = 0;
  double yPosition = 0;
  bool isSuccessful = false;
  List<Widget> moveItems;
  double appBarHeight;
  //double tabbarHeight;
  double statusBarHeight;

  @override
  void initState() {
    super.initState();
    moveItems = [];
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    appBarHeight = AppBar().preferredSize.height;
  }

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        //title: _buildTabBar(),
        bottom: _buildTabBar(),
      ),
      body: _buildView()
    );
  }

  Widget _buildTabBar(){
    return TabBar(
      labelPadding: EdgeInsets.zero,
      controller: _tabController,
      labelColor: Colors.redAccent,
      unselectedLabelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
      //indicatorWeight: 10,
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)),
        color: Colors.white, ),
      tabs: [
        Align(alignment: Alignment.center,child: Tab(text: '1층',)),
        Align(alignment: Alignment.center,child: Tab(text: '2층',))
      ],
      onTap: (index){
        setState(() {});
      },
    );
  }

  Widget _buildView(){

    print(moveItems.length);
    return TabBarView(
      controller: _tabController,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent)
                ),
                width: 712,
                height: 677,
                child: Stack(
                    children: moveItems/*[
                  Positioned(
                    top: 250,
                    left: 374,
                    child: Text('테이블'),
                  )
                ]*/
                    ),
                /*child: DragTarget(
                  builder: (context, List<String> candidateDate, rejectData){
                    return Stack(
                      children: moveItems,
                    );
                  },
                  onWillAccept: (data) {
                    return true;
                  },
                  onAccept: (data) {
                    setState(() {
                      isSuccessful = true;
                      moveItems.add(MoveableStackItem('테이블', xPosition, yPosition));
                      //moveItems.add(MoveableStackItem('테이블'));
                    });
                  },
                ), */
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 93,
                    width: 93,
                    child: Draggable(
                 d       feedback: SizedBox(
                            width: 93,
                            height: 93,
                            child: Image.asset("assets/kitchen.png")),
                        child: Image.asset("assets/kitchen.png"),
                        onDragEnd: (detail){
                          setState(() {
                            xPosition = detail.offset.dx;
                            yPosition = detail.offset.dy - appBarHeight - statusBarHeight;
                            moveItems.add(MoveableStackItem('assets/kitchen.png', xPosition, yPosition));
                            print('xPosition : $xPosition\nyPosition : $yPosition');
                          });
                        }
                    ),
                  ),
                  SizedBox(
                    height: 93,
                    width: 93,
                    child: Draggable(
                        feedback: SizedBox(
                          width: 93,
                            height: 93,
                            child: Image.asset("assets/counter.png")),
                        child: Image.asset("assets/counter.png"),
                        onDragEnd: (detail){
                          setState(() {
                            xPosition = detail.offset.dx;
                            yPosition = detail.offset.dy - appBarHeight;
                            moveItems.add(MoveableStackItem('assets/counter.png', xPosition, yPosition));
                            print('xPosition : $xPosition\nyPosition : $yPosition');
                          });
                        }
                    ),
                  ),
                  SizedBox(
                    height: 93,
                    width: 93,
                    child: Draggable(
                        feedback: SizedBox(
                            width: 93,
                            height: 93,
                            child: Image.asset("assets/stairs.png")),
                        child: Image.asset("assets/stairs.png"),
                        onDragEnd: (detail){
                          setState(() {
                            xPosition = detail.offset.dx;
                            yPosition = detail.offset.dy - appBarHeight;
                            moveItems.add(MoveableStackItem('assets/stairs.png', xPosition, yPosition));
                            print('xPosition : $xPosition\nyPosition : $yPosition');
                          });
                        }
                    ),
                  ),
                  SizedBox(
                    height: 93,
                    width: 93,
                    child: Draggable(
                        feedback: SizedBox(
                            width: 93,
                            height: 93,
                            child: Image.asset("assets/toilet.png")),
                        child: Image.asset("assets/toilet.png"),
                        onDragEnd: (detail){
                          setState(() {
                            xPosition = detail.offset.dx;
                            yPosition = detail.offset.dy - appBarHeight;
                            moveItems.add(MoveableStackItem('assets/toilet.png', xPosition, yPosition));
                            print('xPosition : $xPosition\nyPosition : $yPosition');
                          });
                        }
                    ),
                  ),
                  SizedBox(
                    height: 93,
                    width: 93,
                    child: Draggable(
                        feedback: SizedBox(
                            width: 93,
                            height: 93,
                            child: Image.asset("assets/plant.png")),
                        child: Image.asset("assets/plant.png"),
                        onDragEnd: (detail){
                          setState(() {
                            xPosition = (detail.offset.dx - 8).roundToDouble();
                            yPosition = (detail.offset.dy - appBarHeight - statusBarHeight - 49 - 8).roundToDouble();
                            //yPosition = detail.offset.dy;
                            moveItems.add(MoveableStackItem('assets/plant.png', xPosition, yPosition));
                            print('xPosition : $xPosition\nyPosition : $yPosition\n'
                            'appbar_height : $appBarHeight\ntabbar_height: $statusBarHeight'
                            );
                          });
                        }
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Center(child : Text('두번째 페이지입니다. '))
      ],
    );
  }
}

class MoveableStackItem extends StatefulWidget {
  final text;
  final xPosition;
  final yPosition;
  MoveableStackItem(this.text, this.xPosition, this.yPosition);

  @override
  _MoveableStackItemState createState() => _MoveableStackItemState();
}

class _MoveableStackItemState extends State<MoveableStackItem> {
  double xp;
  double yp;

  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Positioned(
      top: xp == null ? widget.yPosition : xp,
      left: yp == null ? widget.xPosition : yp,
      child: SizedBox(
        width: 93,
        height: 93,
        child: Draggable(
          feedback: SizedBox(
            width: 93,
              height: 93,
              child: Image.asset(widget.text)
          ),
          childWhenDragging: Image.asset(widget.text),
          child: Image.asset(widget.text),
          onDragEnd: (detail){
            setState(() {
              xp = (detail.offset.dx - 8).roundToDouble();
              yp = (detail.offset.dy - appBarHeight - statusBarHeight - 49 - 8).roundToDouble();
              print('xp : $xp\n yp : $yp\nappBarHeight : $appBarHeight');
            });
          }
        ),
      ),
    );
  }
}

