import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
/*新闻详情页*/
class ArticlePage extends StatefulWidget {
  @override
  State<ArticlePage> createState() => _ArticlePage();
}
 
class _ArticlePage extends State<ArticlePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black, //字体颜色
        backgroundColor: const Color(0xFFFBFBFB), //顶部背景色
        title: const Text('最新新闻', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz), //更多操作
          ),
        ],
      ),
      body: Scrollbar(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    tile(),  //标题+作者+关注
                    picture(), //图片
                    articleContent(), // 文章内容
                    statement(), // 版权声明
                  ],
                ),
              ),
            ), //实现底部固定必需
            bottomFix() //底部固定栏（点赞+收藏+分享）
          ],
        ),
      ) //进度条
    );
  }
 
  /*标题+作者*/
  Container tile(){
    return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(data["title"]!, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //主轴(水平方向)两端对齐
              children: [
                Text(data["subtitle"]!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey)),
                TextButton (
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(const Size(64, 24)),  //按钮宽高设置
                      backgroundColor: MaterialStateProperty.all(Colors.blueAccent), //背景颜色
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), //字体颜色
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), //圆角
                  ),//扁平风格按钮
                  child: const Text('关注'),
                  onPressed: () {
 
                  },
                ),
              ]
            )
          ],
        ),
    );
  }
 
  /*图片*/
  Padding picture(){
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Image.network(data["image"]!, fit: BoxFit.fill, width: 500, height: 240), // 图片,
    );
  }
 
  /*文章内容*/
  Padding articleContent(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(data["content"]!, style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.black)),
    );
  }
 
  //数据
  var data = {
    "title" : "一汽奔腾T90创新发售，10万级SUV市场多了个性化选择",
    "subtitle": "汽车圈",
    "image": "https://img-blog.csdnimg.cn/c6dfd375abf1433fa3a42951cc186a2b.jpeg",
    "content": "财联社6月2日讯（编辑 卞纯）去年底人工智能（AI）聊天机器人ChatGPT的问世，在全球范围内掀起了一股AI热潮，并推动AI的发展步入“快车道”。根据一份行业报告，ChatGPT及其竞争对手谷歌Bard等AI工具的发布，将推动一场长达十年的AI繁荣，预计到2032年，生成式AI市场的营收规模将从去年的400亿美元增长逾30倍至1.3万亿美元。根据以曼迪普·辛格（Mandeep Singh）为首的彭博智库（Bloomberg Intelligence）分析师发布的一份新报告，未来十年生成式AI行业可能会以高达42%的复合速度高速增长。报告指出，生成式AI市场将首先由训练AI系统所必需的基础设施需求推动，到2032年，这方面的业务收入将达到2470亿美元；然后，增长动力来自使用AI模型、广告等服务的设备，到2032年，AI支持的数字广告业务收入将达1920亿美元，AI服务器的收入可能达1340亿美元。“未来十年，世界将看到AI领域的爆炸式增长，这有望从根本上改变科技行业的运作方式。” 辛格周四在一份声明中表示。“随着这项技术的发展，它将成为IT支出、广告支出和网络安全等领域中越来越重要的一部分。”自去年年底ChatGPT推出以来，对生成式AI的需求在全球范围内激增，这项技术有望颠覆从客户服务到银行业的一切。这一生成式AI产品使用来自互联网的大量数据样本来学习如何对指令做出反应，能够制作逼真的图像以及像真人一样回答问题。报告还称，亚马逊旗下云计算部门AWS、谷歌母公司Alphabet Inc.、英伟达公司和OpenAI的投资者微软很可能成为人工智能热潮的最大赢家。财联社6月2日讯（编辑 卞纯）去年底人工智能（AI）聊天机器人ChatGPT的问世，在全球范围内掀起了一股AI热潮，并推动AI的发展步入“快车道”。根据一份行业报告，ChatGPT及其竞争对手谷歌Bard等AI工具的发布，将推动一场长达十年的AI繁荣，预计到2032年，生成式AI市场的营收规模将从去年的400亿美元增长逾30倍至1.3万亿美元。根据以曼迪普·辛格（Mandeep Singh）为首的彭博智库（Bloomberg Intelligence）分析师发布的一份新报告，未来十年生成式AI行业可能会以高达42%的复合速度高速增长。报告指出，生成式AI市场将首先由训练AI系统所必需的基础设施需求推动，到2032年，这方面的业务收入将达到2470亿美元；然后，增长动力来自使用AI模型、广告等服务的设备，到2032年，AI支持的数字广告业务收入将达1920亿美元，AI服务器的收入可能达1340亿美元。“未来十年，世界将看到AI领域的爆炸式增长，这有望从根本上改变科技行业的运作方式。” 辛格周四在一份声明中表示。“随着这项技术的发展，它将成为IT支出、广告支出和网络安全等领域中越来越重要的一部分。”自去年年底ChatGPT推出以来，对生成式AI的需求在全球范围内激增，这项技术有望颠覆从客户服务到银行业的一切。这一生成式AI产品使用来自互联网的大量数据样本来学习如何对指令做出反应，能够制作逼真的图像以及像真人一样回答问题。报告还称，亚马逊旗下云计算部门AWS、谷歌母公司Alphabet Inc.、英伟达公司和OpenAI的投资者微软很可能成为人工智能热潮的最大赢家。"
  };
 
  /*版权声明*/
  Padding statement(){
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text('版权声明', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey)),
    );
  }
 
  /*底部固定栏（点赞+收藏+分享）*/
  SizedBox bottomFix(){
    return SizedBox(
      width: 500,
      height: 50,
      child: ButtonBar(
        children: [
          IconButton(
            color: Colors.grey,
            icon: const Icon(CupertinoIcons.heart),
            onPressed:(){},
          ),
          IconButton(
            color: Colors.grey,
            icon: const Icon(Icons.star_border_outlined),
            onPressed:(){},
          ),
          IconButton(
            color: Colors.grey,
            icon: const Icon(Icons.share),
            onPressed:(){},
          ),
        ]
      ),
    );
  }
 
}