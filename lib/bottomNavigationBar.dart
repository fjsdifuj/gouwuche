import 'package:flutter/material.dart';
import 'package:flutter_application_1/find.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/index.dart';
import 'package:flutter_application_1/shop.dart';

//底部导航页-切换页面
final pages = [
  IndexPage(), //首页
  FindPage(), //发现页
  ShopPage(), //商城页
  HomePage()  //个人主页
];
 
//底部导航-图标和文字定义
List<BottomNavigationBarItem> items(){
  return [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '首页',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.find_in_page),
      label: '发现',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shop),
      label: '商城',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.local_activity),
      label: '我的',
    ),
  ];
}