import 'package:flutter/material.dart';
import 'package:flutter_application_1/NumberControllerWidget.dart';
import 'package:flutter_application_1/animationUtile.dart';
import 'package:flutter_application_1/checkout.dart';


/*购物车页*/
class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPage();
}
 
class _CartPage extends State<CartPage> {
 
  List<bool> isChecks = [false, false, false];  //复选框状态,默认未选中
  bool isAllSelect = false;  //全选状态
  List listData = [
    {
      "store": "Apple苹果旗舰店",
      "skuName": "Apple iPhone 14 Pro (A2892) 256GB 暗紫色 支持移动联通电信5G 双卡双待手机",
      "price": "5988",
      "image": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
    },
    {
      "store": "小米旗舰店",
      "skuName": "Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航",
      "price": "2588",
      "image": "https://img-blog.csdnimg.cn/678c0686dc694b65ad6b20693dbc35f1.jpeg",
    },
    {
      "store": "耐克品牌店",
      "skuName": "夏季新款潮流鞋",
      "price": "1299",
      "image": "https://img-blog.csdnimg.cn/63efe7acbac74e7ebce85e3801f948e3.jpeg",
    },
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('购物车', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        foregroundColor: Colors.black, //字体颜色
        backgroundColor: const Color(0xFFFBFBFB), //顶部背景色
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  skuList(),//商品列表
                ],
              ),
            )
          ),
          bottomFix() //底部固定栏
        ],
      ),
    );
  }
 
  //商品列表
  Container skuList(){
    return Container(
      width: 500,
      height: 800,
      padding: const EdgeInsets.only(top: 5),
      child: ListView.builder(
        itemCount: listData.length,  //商品个数
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            width: 500,
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5), //内边距
            margin: const EdgeInsets.fromLTRB(8, 5, 8, 0), //外边距
            child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 2, //卡片海拔高度设置，立体感
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30), //点击卡片，有蓝色透明度响应，扁平化
                onTap: () {
 
                }, //卡片点击
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isChecks[index],
                          onChanged:(value){
                            setState(() {
                              isChecks[index] = value!;
                            });
                          } ,
                        ),//复选框
                        Text(listData[index]["store"], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)), //店铺
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecks[index],
                          onChanged:(value){
                            setState(() {
                              isChecks[index] = value!;
                            });
                          } ,
                        ),
                        Image.network(listData[index]["image"], width: 90, height: 90, fit: BoxFit.cover),//商品图片
                        Container(
                            width: 200,
                            height: 100,
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,  //水平左对齐
                                  children: [
                                    Text(listData[index]["skuName"], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                                    Container(
                                        height: 20,
                                        width: 150,
                                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF2F2F2),
                                          borderRadius: BorderRadius.circular(4), // 设置圆角
                                        ),
                                        child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('蓝色，64G，WLAN版', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w900)),
                                            Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey)
                                          ],
                                        )
                                    ), //选品
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text('￥', style: TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.w600)),//金额
                                        Text(listData[index]["price"], style: const TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.w600)),//金额
                                      ],
                                    ),
                                    NumberControllerWidget(
                                      addValueChanged: (num){print(num);},
                                      removeValueChanged: (num){print(num);},
                                      updateValueChanged: (num){},
                                    )//选件组件
                                  ],
                                )
                              ],
                            )
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
 
  /*底部固定：去结算*/
  Container bottomFix(){
    return Container(
      width: 500,
      height: 50,
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isAllSelect,
                  onChanged:(value){
                    setState(() {
                      isAllSelect = value!;
                      //全选页面所有复选框
                      for (var i = 0; i < isChecks.length; i++) {
                        isChecks[i] = isAllSelect;
                      }
                    });
                  } ,
                ),//复选框
                const Text(' 全选', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),//
              ],
            ),
            const Row(
              children: [
                Text('合计金额: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                Text('￥', style: TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.w600)),//金额
                Text('7988', style: TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.w600)),//金额
              ],
            ),
            TextButton (
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(80, 30)),
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), //字体颜色
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))) //圆角
              ),
              child: const Text('去结算'),
              onPressed: () {
                Navigator.of(context).push(showPageFromRight(CheckOutPage()));
              },
            ),
          ]
      ),
    );
  }
 
}