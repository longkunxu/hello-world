import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() =>
      new _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200.0,
          height: 100.0,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        onTap: () => updateText("Tap"), //点击
        onDoubleTap: () => updateText("DoubleTap"), //双击
        onLongPress: () => updateText("LongPress"), //长按
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

class Gesture_ListView_Demo extends StatefulWidget {
  @override
  _Gesture_ListView_DemoState createState() => _Gesture_ListView_DemoState();
}

class _Gesture_ListView_DemoState extends State<Gesture_ListView_Demo> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        // return GestureDetector(
        //   onTap: () {
        //     print(index);
        //   },
        //   child: Container(
        //     height: 20,
        //     decoration: BoxDecoration(color: Colors.grey),
        //     child: Column(
        //       children: <Widget>[Text('$index')],
        //     ),
        //   ),
        // );
        
        // return Container(
        //   height: 20,
        //   decoration: BoxDecoration(color: Colors.grey),
        //   child: Text('$index'),
        // );

        return ListTile(
          title: Text(index.toString()),
          onTap: (){
            print(index);
          },
        );
      },
    );
  }
}
