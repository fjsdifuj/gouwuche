import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
 
/*搜索详情页*/
class SearchDetail extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFFBFBFB),  // 搜索框背景色
          automaticallyImplyLeading: false,  //隐藏左侧默认返回按钮
          title: Container(
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2),  // 搜索框背景色
              borderRadius: BorderRadius.circular(16), // 设置搜索框圆角
            ),
            child: Row(
              children: const [
                SizedBox(
                  width: 32,
                  height: 24,
                  child: Icon(Icons.search, size: 16, color: Color(0xFF999999)),  //搜索框图标
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '人工智能',
                    hintStyle: TextStyle(fontSize: 12, color: Color(0xFF999999)),  //搜索框文字
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 6, 0), //间距左，上，右，下
              child: cancelText(context),  // 取消，回退上一页
            )
          ],
      ),
      body: Column(
            crossAxisAlignment:  CrossAxisAlignment.start, //文字左对齐
            children:  [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Text('搜索历史', style: TextStyle(fontWeight: FontWeight.w600)) //字体加粗
              ),
              Wrap(
                  spacing: 10, // 搜索关键词的间距
                  runSpacing: 10, // 搜索关键词的间距
                  children: KeyWords()  // 关键词列表
              )
            ]
      )
    );
  }
 
  // 取消-富文本点击方式实现
  Text cancelText(BuildContext context){
    return Text.rich(
        TextSpan(
            text: '取消',
            style: const TextStyle(height: 2, color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
        )
    );
  }
 
  // 关键词列表
  List<Widget> KeyWords() => List.generate(9, (index) {
     return Container(
         padding: const EdgeInsets.all(6),
         decoration: BoxDecoration(
           color: const Color(0xFFF2F2F2),  // 搜索框背景色
           borderRadius: BorderRadius.circular(4), // 设置搜索框圆角
         ),
         child: Text("关键词 $index",
           style: const TextStyle(color: Color(0xFF999999), fontSize: 14, height: 1, fontWeight: FontWeight.w300)
         )
     );
  });
 
}