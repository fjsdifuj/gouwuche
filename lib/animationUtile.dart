import 'package:flutter/material.dart';
 
/*动画效果-工具方法*/
 
/*页面切换动画-页面从屏幕右侧滑入
* @param statelessWidget 传入需要跳转的页面
* */
Route showPageFromRight(StatefulWidget statefulWidget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => statefulWidget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);  //页面进入的起点坐标
      var end = Offset.zero;    //页面进入的终点坐标
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}