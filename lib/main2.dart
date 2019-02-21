import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// 继承一个有状态组件
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // 在此状态中更改，这会导致它重新运行下面的构建方法
      // 以便显示可以反映更新的值
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 每次调用setState时都会重新运行此方法
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // Column 可以垂直排列或水平排列
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              "hello",
              style: new TextStyle(fontSize: 50.0, color: Colors.pink),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),

      // 浮动动作按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // 添加事件
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
