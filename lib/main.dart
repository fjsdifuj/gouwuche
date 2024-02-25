import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomNavigationBar.dart';

 
/*启动页*/
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(), //主题
      home: const MyHomePage(),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
 
  int _bottomNavigationIndex = 0;  //底部导航的索引
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_bottomNavigationIndex], //页面切换
        bottomNavigationBar: _bottomNavigationBar()  //底部导航
    );
  }
 
  //底部导航-样式
  BottomNavigationBar _bottomNavigationBar(){
    return BottomNavigationBar(
      items: items(), //底部导航-图标和文字的定义，封装到函数里
      currentIndex: _bottomNavigationIndex,
      onTap: (flag) {
        setState(() {
          _bottomNavigationIndex = flag;  //使用底部导航索引
        });
      }, //onTap 点击切换页面
      fixedColor: Colors.blue,  //样式：图标选中时的颜色：蓝色
      type: BottomNavigationBarType.fixed, //样式：选中图标后的样式是固定的
    );
  }
 
}