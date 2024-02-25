import 'package:flutter/material.dart';
 
/*个人中心页*/
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}
 
class _HomePage extends State<HomePage> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFBBDEFB), Colors.white70], //背景渐变色：顶部蓝色到底部灰色
            begin: Alignment.topCenter, //颜色渐变从顶部居中开始
            end: Alignment.bottomCenter, //颜色渐变从底部居中结束
          )
        ), //背景装饰：颜色渐变
      child: Column(
        children: [
          topInfo(context), //头像+昵称+编辑资料
          userDate(), //用户数据：关注+收藏+点赞+历史
          commonFunction(), //常用功能
        ],
      ),
    );
  }
 
  /*顶部信息：头像+昵称+编辑资料*/
  Padding topInfo(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 90, 10, 40),
      child: Row(
        children: [
          GestureDetector(
            child: ClipOval(
              child: Image.network('https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg', width: 50, height: 50, fit: BoxFit.cover),
            ),
            onTap: (){
 
            },
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 150, 0),
              child: Text('昵称', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16))
          ),
          TextButton  (
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(80, 60)), //按钮宽高设置
              foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(100, 30, 144, 255)), //背景色
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), //圆角
            ),
            child: const Text('编辑资料', style: TextStyle(color: Colors.blueAccent)),
            onPressed: () {
 
            },
          ),
        ],
      ),
    );
  }
 
  /*用户数据：关注+收藏+历史*/
  Container userDate(){
    return Container(
        margin: const EdgeInsets.all(8),
        height: 80,
        width: 360,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //主轴方向（横向）间距
          children: [
            Column(
              children: [
                Text('66', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text('关注'),
              ],
            ),
            Column(
              children: [
                Text('101', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text('收藏'),
              ],
            ),
            Column(
              children: [
                Text('278', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text('点赞'),
              ],
            ),
            Column(
              children: [
                Text('579', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text('历史'),
              ],
            ),
          ],
        )
    );
  }
 
  /*常用功能*/
  Container commonFunction(){
    return Container(
        margin: const EdgeInsets.all(5),
        height: 120,
        width: 360,
        decoration: BoxDecoration(
          color: const Color.fromARGB(200, 248, 248, 255),  // 白色
          borderRadius: BorderRadius.circular(12), // 设置圆角
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //垂直方向平分
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text('  常用功能', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, //主轴方向（横向）间距
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.message),
                      onPressed: () {},
                      color: Colors.blue,
                    ),
                    const Text('消息'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.directions_boat),
                      onPressed: () {},
                      color: Colors.redAccent,
                    ),
                    const Text('动态'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {},
                      color: Colors.green,
                    ),
                    const Text('设置'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.output),
                      onPressed: () {},
                      color: Colors.deepOrangeAccent,
                    ),
                    const Text('退出'),
                  ],
                )
              ],
            )
          ],
        )
    );
  }
 
 
}