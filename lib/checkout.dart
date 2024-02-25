import 'package:flutter/material.dart';
import 'package:flutter_application_1/NumberControllerWidget.dart';

 
/*结算页*/
class CheckOutPage extends StatefulWidget {
  @override
  State<CheckOutPage> createState() => _CheckOutPage();
}
 
class _CheckOutPage extends State<CheckOutPage> {
 
  List listData = [
    {
      "store": "Apple苹果旗舰店",
      "skuName": "Apple iPhone 14 Pro (A2892) 256GB 暗紫色 支持移动联通电信5G 双卡双待手机",
      "price": "￥ 5988",
      "image": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
    },
    {
      "store": "小米旗舰店",
      "skuName": "Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航",
      "price": "￥ 2588",
      "image": "https://img-blog.csdnimg.cn/678c0686dc694b65ad6b20693dbc35f1.jpeg",
    },
  ];
 
  var userInfo = {
    "nickName": "吴邪",
    "phone": "139343254540",
    "address": "北京市 海淀区 天秀路",
  };
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black, //字体颜色
        backgroundColor: const Color(0xFFFBFBFB), //顶部背景色
        title: const Text('提交订单', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  addressInfo(), //地址选择
                  skuInfo(), //商品
                  priceInfo(),   //金额优惠
                ],
              ),
            ),
          ),
          bottomFix() //固定页面底部
        ],
      )
    );
  }
 
  Container addressInfo(){
    return Container(
      height: 90,
      width: 500,
      margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
               //弹出地址管理弹窗
          }, //卡片点击
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,  //水平左对齐
                  children: [
                    Text(userInfo["address"]!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                    Row(
                      children: [
                        Text(userInfo["nickName"]!, style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(userInfo["phone"]!, style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
                        ),
                      ],
                    )
                  ],
                ),
                const Icon(Icons.arrow_forward_ios, size: 12)
              ],
            ),
          )
        ),
      )
    );
  }
 
  //商品列表
  SizedBox skuInfo(){
    return SizedBox(
      width: 500,
      height: 370,
      child: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return Container(
            height: 180,
            width: 500,
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(listData[index]["store"], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Row(
                      children: [
                        Image.network(listData[index]["image"], width: 90, height: 90, fit: BoxFit.cover),//商品图片
                        Container(
                            width: 240,
                            height: 90,
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,  //水平左对齐
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
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(listData[index]["price"], style: const TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.w600)),//金额
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
              )
 
            ),
          );
        },
      ),
    );
  }
 
  Container priceInfo(){
    return Container(
      height: 180,
      width: 500,
      margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: const Card(
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('商品金额', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),//商品名称
                  Text('￥5988', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),//商品名称
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('运费', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),//商品名称
                  Text('￥8', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),//商品名称
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('优惠券', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),//商品名称
                  Text('-￥20', style: TextStyle(color: Colors.redAccent, fontSize: 14, fontWeight: FontWeight.w400)),//商品名称
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('积分', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),//商品名称
                  Text('-￥3', style: TextStyle(color: Colors.redAccent, fontSize: 14, fontWeight: FontWeight.w400)),//商品名称
                ],
              )
            ],
          ),
        )
      )
    );
  }
 
  /*底部固定：提交订单*/
  Container bottomFix(){
    return Container(
      width: 500,
      height: 50,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Text('应支付: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),//
                  Text('￥5968', style: TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.w600)),//商品名称
                ],
              ),
              TextButton (
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(90, 30)),
                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), //字体颜色
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))) //圆角
                ),
                child: const Text('提交订单'),
                onPressed: () {
                  //跳转收银台
                },
              ),
            ]
        ),
      )
    );
  }
 
}