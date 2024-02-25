import 'package:flutter/material.dart';
import 'package:flutter_application_1/searchDetail.dart';

/*搜索页*/
class SearchAppBar extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,  //搜索框高度
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),  // 搜索框背景色-灰色
        borderRadius: BorderRadius.circular(16), // 设置搜索框圆角
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 32,
            height: 24,
            child: Icon(Icons.search, size: 16, color: Color(0xFF999999)),  //搜索框图标
          ),
          TextField(
            readOnly: true,  //只读不可编辑，点击搜索框直接跳转搜索页
            decoration: const InputDecoration(
              hintText: '人工智能',  //搜索提示词
              hintStyle: TextStyle(fontSize: 12, color: Color(0xFF999999)),  //搜索框文字样式
            ),
            onTap: () {
              Navigator.of(context).push(_createRoute());  //点击搜索框，路由到搜索页（动画效果: 右侧滑出）
            }, //onTap
          ),
        ],
      ),
    );
  }
 
  //页面切换动画特效-右侧滑出
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SearchDetail(),  //右侧弹出搜索详情页
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);  //页面进入的起点坐标
        var end = Offset.zero;    //页面进入的终点坐标
        const curve = Curves.ease; 
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve)); //
        return SlideTransition(
          position: animation.drive(tween), 
          child: child,
        );
      },
    );
  }
 
}