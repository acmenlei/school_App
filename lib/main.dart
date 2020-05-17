import 'package:flutter/material.dart';
import 'package:flutter_app/components/home/home.dart';
import 'package:flutter_app/Login/login.dart';
import 'package:flutter_app/components/lose/lose.dart';
import 'package:flutter_app/components/pick/pick.dart';
import 'package:flutter_app/components/profile/profile.dart';
// import './Login/Login.dart';
// 入口函数
main() => runApp(MyApp());

// 页面结构
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppcontent();
  }
}

class MyAppcontent extends State<MyApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.yellow),
      title: 'Flutter',
      routes: {
        '/profile': (context) => ProfilePage(),
        '/home': (context) => HomePage(),
        '/lose': (context) => LosePage(),
        '/pick': (context) => PickPage(),
        '/login': (context) => Login()
      },
      home: Scaffold( // 标题
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.local_mall), title: Text('失物招领')),
          BottomNavigationBarItem(icon: Icon(Icons.local_see), title: Text('寻物启事')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
        ],
        currentIndex: _currentIndex,
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            HomePage(),
            PickPage(),
            LosePage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
