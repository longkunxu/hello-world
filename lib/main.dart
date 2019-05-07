import 'package:flutter/material.dart';
import 'draggable_demo.dart';
import 'gesture_test.dart';
import 'package:flutter/gestures.dart';
import 'http_demo.dart';
import 'kangshaojun.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter drag demo',
      //theme: ThemeData(primarySwatch: Colors.blue),
      //home: DraggableDemo(),
      //theme: ThemeData.light(),
      theme: ThemeData(primaryColor: Colors.blue),

      //home: GestureDetectorTestRoute(),
      //home: _Drag(),
      //home: _GestureRecognizerTestRoute(),
      //home: ScaleAnimationRoute(),

      home: Scaffold(
        //appBar: AppBar(title: Text('hello'),),
        body: DidiSample(),
        //HttpTestRoute(),

        //home: GestureDetectorTestRoute(),
        //home: _Drag(),
        //home: _GestureRecognizerTestRoute(),
        //home: ScaleAnimationRoute(),
        //1234
        //456
      ),
      
    );
  }
}



class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的便宜
  double _left = 0.0;//距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e){
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }
}


class _GestureRecognizerTestRoute extends StatefulWidget {
  @override
  __GestureRecognizerTestRouteState createState() => __GestureRecognizerTestRouteState();
}

class __GestureRecognizerTestRouteState extends State<_GestureRecognizerTestRoute> {
  TapGestureRecognizer _tapGestureRecognizer1 = new TapGestureRecognizer();
  TapGestureRecognizer _tapGestureRecognizer2 = new TapGestureRecognizer();
  bool _toggle1 = false; //变色开关
  bool _toggle2 = false; //变色开关
  String text1 = "你好世界";
  String text2 = "点我";
  String text4 = "变色";
  String text3 = "你好世界111222";


  @override
  void dispose() {
     //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer1.dispose();
    _tapGestureRecognizer2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(40,80,10,10),
        child: Column(
          children: <Widget>[
            
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: text1,style:TextStyle(fontSize: 10.0)),

                      TextSpan(
                        text: text2,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: _toggle1 ? Colors.blue : Colors.red
                        ),
                        recognizer: _tapGestureRecognizer1
                          ..onTap = () {
                            setState(() {
                              _toggle1 = !_toggle1;
                              print(text2);
                            });
                          },
                      ),


                      TextSpan(
                        text: text4,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: _toggle2 ? Colors.blue : Colors.red
                        ),
                        recognizer: _tapGestureRecognizer2
                          ..onTap = () {
                            setState(() {
                              _toggle2 = !_toggle2;
                              print(text4);
                            });
                          },
                                                  
                      ),
                      TextSpan(text: text3,style:TextStyle(fontSize: 10.0)),
                    ]
                )
            ),

            Text('另一种点击方法',style:TextStyle(fontSize: 10.0)),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){
                  print('dian 另');
                },
                child: Text('另',style:TextStyle(fontSize: 20.0)),
              )
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){
                  print('dian 一一一');
                },
                child: Text('一',style:TextStyle(fontSize: 20.0)),
              )
            ),

            Padding(
              padding: EdgeInsets.all(0.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: GestureDetector(
                      onTap: (){
                        print('一');
                      },
                      child: Text.rich(TextSpan(text: '一',style:TextStyle(fontSize: 20.0))),
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: GestureDetector(
                      onHorizontalDragUpdate: (DragUpdateDetails details){
                        print('二');
                        print(details.toString());
                      },
                      //child: Text('',style:TextStyle(fontSize: 20.0)),
                      child: Text.rich(TextSpan(text: '二',style:TextStyle(fontSize: 20.0))),
                    )
                  ),
                ],
              ),
            ),
          ],
      ),
      ),
    );
  }
}


// class ScaleAnimationRoute extends StatefulWidget {
//   @override
//   _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
// }

// //需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
// class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>  with SingleTickerProviderStateMixin{ 

//   Animation<double> animation;
//   AnimationController controller;

//   initState() {
//     super.initState();
//     controller = new AnimationController(
//         duration: const Duration(seconds: 3), vsync: this);
//      animation=CurvedAnimation(parent: controller, curve: Curves.bounceIn);
//     //图片宽高从0变到300
//     animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
//       ..addListener(() {
//         setState(()=>{});
//       });
//     //启动动画(正向执行)
//     controller.forward();

//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Center(
//        child: Image.asset("images/tangwei.jpg",
//           width: animation.value,
//           height: animation.value
//       ),
//     );
//   }

//   dispose() {
//     //路由销毁时需要释放动画资源
//     controller.dispose();
//     super.dispose();
//   }
// }


class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  initState() {
    // super.initState();
    // controller = new AnimationController(
    //     duration: const Duration(seconds: 3), vsync: this);
    // //图片宽高从0变到300
    // animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    // //启动动画
    // controller.forward();
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 1), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    //启动动画（正向）
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    //return AnimatedImage(animation: animation,);
    return AnimatedBuilder(
      animation: animation,
      child: Image.asset("images/tangwei.jpg"),
      builder: (BuildContext ctx, Widget child) {
        return new Center(
          child: Container(
              height: animation.value, 
              width: animation.value, 
              child: child,
          ),
        );
      },
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}