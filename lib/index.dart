import 'package:flutter/material.dart';
import 'package:flutter_application_1/recommend.dart';
import 'package:flutter_application_1/search.dart';

/*首页
* 顶部搜索框 SearchAppBar
* 顶部导航栏 TabBar
* 导航栏嵌入推荐页：RecommendPage 是图文列表 ListView
* */
class IndexPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFBFBFB), //顶部背景色
          title: SearchAppBar(),  // 顶部搜素框（自定义组件）
          bottom: const TabBar(
            labelColor: Colors.blue,  //选中时颜色
            unselectedLabelColor: Colors.black26, //未选中时颜色
            tabs: [
              Tab(text: '推荐'),
              Tab(text: '资讯'),
              Tab(text: '科技'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RecommendPage(),  // 推荐页
            const Icon(Icons.directions_transit),
            const Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}