import 'package:flutter/material.dart';

// 引入 english_words
import 'package:english_words/english_words.dart';

// main
void main() {
  // 使用vs code在调试控制台可以看到这条打印
  print('main...'); 
  return runApp(MyApp());
}

// 继承StatelessWidget(无状态)类
// Stateless widgets 是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的
class MyApp extends StatelessWidget {
  // 覆盖super类的build方法, 返回Widget类型
  // 每次MaterialApp需要渲染时或者在Flutter Inspector中切换平台时 build 都会运行
  @override
  Widget build(BuildContext context) {
    // 此小组件是应用程序的根,  使用md-ui
    return MaterialApp(
      title: 'Welcome to Flutter',

      // 轻松设置app的主题
      theme: new ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: new RandomWords(),
    );
  }
}

// 创建一个有状态的组件
// Stateful widgets 持有的状态可能在widget生命周期中发生变化. 实现一个 stateful widget 至少需要两个类: 一个StatefulWidget类， 一个 State类
//  StatefulWidget类本身是不变的，但是 State类在widget生命周期中始终存在
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

// 添加 RandomWordsState 类.该应用程序的大部分代码都在该类中
class RandomWordsState extends State<RandomWords> {
  // 创建一个私有变量，存储单词列表
  final _suggestions = <WordPair>[];

  // 用户的收藏夹， Set中不允许重复的值
  final _saved = new Set<WordPair>();

  // 一个style样式，存着字体大小
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    //  Scaffold 是 Material library 中提供的一个widget, 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。widget树可以很复杂
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),

        // header 右侧图标,创建新的页面
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved,
          ),
        ],
      ),

      body: _buildSuggestions(), // 通过方法来构建类容
    );
  }

  void _pushSaved() {
    // 创建一个路由页面
    final newPage = new MaterialPageRoute(
      builder: (context) {
        // 生成列表
        final tiles = _saved.map((pair) {
          return new ListTile(
            title: new Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        });

        // ListTile的divideTiles()方法在每个ListTile之间添加1像素的分割线
        final List<Widget> divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();

        // 返回一个脚手架
        return new Scaffold(
          appBar: new AppBar(
            title: Text('收藏夹'),
          ),
          body: _saved.isNotEmpty
              ? new ListView(
                  children: divided,
                )
              : new Center(
                  child: new Text(
                    '暂无收藏.',
                    style: new TextStyle(color: Colors.black45),
                  ),
                ),
        );
      },
    );

    // 路由入栈
    Navigator.of(context).push(newPage);
  }

  // 此方法构建显示建议单词对的无限滚动ListView
  Widget _buildSuggestions() {
    // ListView类提供了一个builder属性
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),

        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();
          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整）(js: Math.floor(1/2) === 0 )，比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  // 列表每行具体的类容
  Widget _buildRow(WordPair pair) {
    // 判断单词是否存在收藏夹中
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase, // 内容
        style: _biggerFont, // 样式
      ),
      // 添加图标
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),

      // 让心形❤️图标变得可以点击。如果单词条目已经添加到收藏夹中， 再次点击它将其从收藏夹中删除。当心形❤️图标被点击时，函数调用setState()通知框架状态已经改变
      onTap: () {
        setState(() {
          alreadySaved ? _saved.remove(pair) : _saved.add(pair);
        });
      },
    );
  }
}
