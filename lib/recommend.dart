import 'package:flutter/material.dart';
import 'package:flutter_application_1/animationUtile.dart';
import 'package:flutter_application_1/cupertino.dart';

 
/*推荐页*/
class RecommendPage extends StatefulWidget {
  @override
  State<RecommendPage> createState() => _RecommendPage();
}
 
class _RecommendPage extends State<RecommendPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView.separated(
          itemCount: listData.length,  //条目个数：获取数据的个数
          separatorBuilder: (context, index) { // <-- SEE HERE
            return const Divider();
          },  //分割线必要参数
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(showPageFromRight(ArticlePage())); //点击跳转到新闻详情
              },
              child: ListTile(
                title: Text(listData[index]["title"]), //大标题
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //左对齐
                  children: [
                    const SizedBox(height: 12),  //设置title和subtitle的间距
                    Text(listData[index]["subtitle"], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),  //小标题
                trailing: Image.network(listData[index]["image"], fit: BoxFit.fill, width: 110, height: 90), //右侧图片
                visualDensity: const VisualDensity(vertical: 4), //增加item高度,优化布局，便于图片展示
                minVerticalPadding: 8, //组件内边距，title和分割线的垂直间距
              ),
            );
          },
        ),
      ),
    );
  }
 
  //数据
  List listData = [
    {
      "title": "一汽奔腾T90创新发售，10万级SUV市场多了个性化选择",
      "subtitle": "汽车圈",
      "image": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
    },
    {
      "title": "沐飒低于预售价上市，北京现代瞄准70%的大多数",
      "subtitle": "北京现代",
      "image": "https://img-blog.csdnimg.cn/678c0686dc694b65ad6b20693dbc35f1.jpeg",
    },
    {
      "title": "第二款奥特能平台车型上市，别克加速布局主流电动车市场",
      "subtitle": "电动车",
      "image": "https://img-blog.csdnimg.cn/63efe7acbac74e7ebce85e3801f948e3.jpeg",
    },
    {
      "title": "一汽奔腾T90创新发售，10万级SUV市场多了个性化选择",
      "subtitle": "汽车圈",
      "image": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
    },
    {
      "title": "沐飒低于预售价上市，北京现代瞄准70%的大多数",
      "subtitle": "北京现代",
      "image": "https://img-blog.csdnimg.cn/678c0686dc694b65ad6b20693dbc35f1.jpeg",
    },
    {
      "title": "第二款奥特能平台车型上市，别克加速布局主流电动车市场",
      "subtitle": "电动车",
      "image": "https://img-blog.csdnimg.cn/63efe7acbac74e7ebce85e3801f948e3.jpeg",
    },
    {
      "title": "一汽奔腾T90创新发售，10万级SUV市场多了个性化选择",
      "subtitle": "汽车圈",
      "image": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
    },
    {
      "title": "沐飒低于预售价上市，北京现代瞄准70%的大多数",
      "subtitle": "北京现代",
      "image": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
    },
    {
      "title": "第二款奥特能平台车型上市，别克加速布局主流电动车市场",
      "subtitle": "电动车",
      "image": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
    },
  ];
 
}