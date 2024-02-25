import 'package:flutter/material.dart';
import 'package:flutter_application_1/animationUtile.dart';
import 'package:flutter_application_1/cart.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

 
/*商品详情页*/
class SkuDetailPage extends StatefulWidget {
  @override
  State<SkuDetailPage> createState() => _SkuDetailPage();
}
 
class _SkuDetailPage extends State<SkuDetailPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black, //字体颜色
        backgroundColor: const Color(0xFFFBFBFB), //顶部背景色
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('商品', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
            Text('评价', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
            Text('详情', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
            Text('推荐', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network('https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg', fit: BoxFit.fill, width: 500, height: 260), // 图片
                  priceInfo(), // 价格和促销
                  skuInfo(), // 商品参数
                  comment(), // 评价
                ],
              ),
            ),
          ),
          bottomFix() //底部固定栏
        ],
      )
    );
  }
 
  /*价格信息*/
  Container priceInfo(){
    return Container(
      width: 500,
      height: 45,
      decoration: BoxDecoration(
        color: const Color.fromARGB(50, 255, 48, 48),
        borderRadius: BorderRadius.circular(6), // 设置圆角
      ),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('到手价  ￥4999', style: TextStyle(color: Colors.redAccent, fontSize: 14, fontWeight: FontWeight.w600)),
          Text('立减20 | 30天价保 | 包含运费险', style: TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
 
  /*商品名称+选品+地址+时效*/
  Container skuInfo(){
    return Container(
      width: 500,
      height: 200,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Apple iPhone 14 Pro (A2892) 256GB 暗紫色 支持移动联通电信5G 双卡双待手机', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)), //商品名称
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //水平方向两端对齐
              children: [
                Text('选品 ', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400)),
                Text('已选: 暗紫色 1件 256G 0.33kg', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                Icon(Icons.arrow_forward_ios, size: 10)
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //水平方向两端对齐
            children: [
              Text('参数 ', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400)),
              Column(
                children: [
                  Text('A15  ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  Text('cpu  ', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
              Column(
                children: [
                  Text('6.1英寸  ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  Text('尺寸  ', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
              Column(
                children: [
                  Text('OLED直屏  ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  Text('屏幕材质  ', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
              Icon(Icons.arrow_forward_ios, size: 10)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //水平方向两端对齐
            children: [
              Text('配送 ', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400)),
              Column(
                children: [
                  Text('北京 海淀区', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400)),
                  Text('现货，预计今天(06月23日)送达', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
              Icon(Icons.arrow_forward_ios, size: 10)
            ],
          )
        ],
      ),
    );
  }
 
  /*评价*/
  Container comment(){
    return Container(
      width: 500,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // 设置圆角
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(top: 5),
      // alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //水平方向两端对齐
            children: [
              Text('评价 (200万+)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              Row(
                children: [
                  Text('好评度 97%', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400)),
                  Icon(Icons.arrow_forward_ios, size: 10)
                ],
              ),
            ],
          ),
          SizedBox(height: 2),
          Row(
            children: [
              ClipOval(
                  child: Image.network('https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg', width: 30, height: 30, fit: BoxFit.cover),
              ), //圆型头像
              const Text(' 吴邪', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400)),
            ],
          ),
          SizedBox(height: 2),
          const Text('外观: 小巧精致，手感不错，屏幕流畅，拍照功能强大', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
          SizedBox(height: 3),
          Expanded(
            child: MasonryGridView.count(
              scrollDirection: Axis.horizontal, //水平方向
              itemCount: listData.length, //条目个数：获取数据的个数
              crossAxisCount: 1, //交叉轴（水平方向）行数
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                return Image.network(listData[index]["imageUrl"], width: 120, height: 50, fit: BoxFit.cover);
              }
            ),
          )//图片组
        ],
      ),
    );
  }
 
  List listData = [
    {
      "imageUrl": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
    },
    {
      "imageUrl": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
    },
    {
      "imageUrl": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
    },
    {
      "imageUrl": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
    },
    {
      "imageUrl": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
    }
  ];
 
  /*底部固定：购物车+立即购买*/
  Container bottomFix(){
    return Container(
      width: 500,
      height: 50,
      color: Colors.white,
      // alignment: Alignment.centerLeft,
      child: ButtonBar(
          children: [
            IconButton(
              color: Colors.grey,
              icon: const Icon(Icons.add_business), //店铺
              onPressed:(){},
            ),
            IconButton(
              color: Colors.grey,
              icon: const Icon(Icons.star_border_outlined), //收藏
              onPressed:(){},
            ),
            IconButton(
              color: Colors.grey,
              icon: const Icon(Icons.add_shopping_cart), //购物车
              onPressed:(){
                Navigator.of(context).push(showPageFromRight(CartPage())); //点击购物车图标，进入购物车页
              },
            ),
            TextButton  (
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(80, 50)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent), //字体颜色
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), //圆角
                  side: MaterialStateProperty.all(const BorderSide(color: Colors.pinkAccent, width: 0.67)) // 边框颜色
              ),
              child: const Text('加入购物车'),
              onPressed: () {
 
              },
            ),
            TextButton (
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(80, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), //字体颜色
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))) //圆角
              ),
              child: const Text('立即购买'),
              onPressed: () {
 
              },
            ),
          ]
      ),
    );
  }
 
}