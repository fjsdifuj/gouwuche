import 'package:flutter/material.dart';
import 'package:flutter_application_1/animationUtile.dart';
import 'package:flutter_application_1/material.dart';
import 'package:flutter_application_1/search.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

 
/*商城页*/

class ShopPage extends StatelessWidget {


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBFBFB), //顶部背景色
        title: SearchAppBar(),  // 顶部搜素框（自定义组件）
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            width: 500,
            height: 180,
            child: Image.network('https://img-blog.csdnimg.cn/63efe7acbac74e7ebce85e3801f948e3.jpeg'
                , fit: BoxFit.fill, width: 500, height: 200), //可放轮播图 商品类别 筛选之类的
          ),
          Expanded(
            child: MasonryGridView.count( //瀑布流插件
              itemCount: listData.length, //条目个数：获取数据的个数
              scrollDirection: Axis.vertical, //默认主轴是垂直方向
              crossAxisCount: 2, //交叉轴（水平方向）列数
              mainAxisSpacing: 4, //主轴：垂直方向间距
              crossAxisSpacing: 4, //交叉轴：水平方向间距
              itemBuilder: _showSku,
              // shrinkWrap:true, //含义是真空压缩组件，对性能损耗很大，不建议使用
            ), //Expanded 解决GridView嵌套在Column中不兼容的问题
          )
        ]
      ),
    );
  }
 
  //sku列表展示
  Widget _showSku(context, index) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(233, 233, 233, 0.9), //边框颜色
            width: 2, //边框宽度
        ), //边框
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(showPageFromRight(SkuDetailPage()));  //点击跳转到商品详情页
        },
        child: Column(
          children: [
            Image.network(listData[index]["imageUrl"],
                height: 150,
                width: double.infinity, //宽度撑满
                fit: BoxFit.cover //图片撑满父容器，截断
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround, //沿着主轴方向(垂直方向)间距等分
                crossAxisAlignment: CrossAxisAlignment.start, //水平方向左侧对齐
                children: [
                  Text(listData[index]["title"], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                      maxLines: 2, //最大显示两行
                      overflow: TextOverflow.ellipsis  //超出部分省略号
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, //水平方向两端对齐
                    children: [
                      Row(
                        children: [
                          const Text(' ￥', style: TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.w600)),
                          Text(listData[index]["price"], style: const TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('销量 ', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600)),
                          Text(listData[index]["saleNum"], style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600)), //数据类型要准确，Text必须是String
                        ],
                      ),
                    ],
                  ),
                ]
            )
          ],
        ),
      )
    );
  }
 
  //数据
  List listData = [
    {
      "title": "OPPO K9x 8GB+128GB 银紫超梦 天玑810 5000mAh长续航 33W快充 90Hz电竞",
      "price": "2788",
      "imageUrl": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
      "saleNum": "3000"
    },
    {
      "title": "Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航",
      "price": "2998",
      "imageUrl": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
      "saleNum": "500"
    },
    {
      "title": "Apple iPhone 14 Pro (A2892) 256GB 暗紫色 支持移动联通电信5G 双卡双待手机",
      "price": "5899",
      "imageUrl": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
      "saleNum": "2400"
    },
    {
      "title": "三星 SAMSUNG Galaxy Z Fold4 沉浸大屏体验 PC般强大生产力 12GB+512GB",
      "price": "4677",
      "imageUrl": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
      "saleNum": "600"
    },
    {
      "title": "华为畅享 60X 7000mAh长续航 6.95英寸 影音大屏 256GB 曜金黑 鸿蒙智能手机",
      "price": "3778",
      "imageUrl": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
      "saleNum": "900"
    },
    {
      "title": "荣耀X30 骁龙6nm疾速5G芯 66W超级快充 120Hz全视屏 全网通版",
      "price": "4999",
      "imageUrl": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
      "saleNum": "500"
    },
    {
      "title": "Apple iPhone 14 Pro (A2892) 256GB 暗紫色 支持移动联通电信5G 双卡双待手机",
      "price": "5899",
      "imageUrl": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
      "saleNum": "300"
    },
    {
      "title": "三星 SAMSUNG Galaxy Z Fold4 沉浸大屏体验 PC般强大生产力 12GB+512GB",
      "price": "4677",
      "imageUrl": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
      "saleNum": "100"
    }
  ];
 
}