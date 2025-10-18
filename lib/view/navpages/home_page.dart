import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //Trong Dart, từ khóa with dùng để “trộn” (mix) thêm các tính năng hoặc phương thức của một lớp khác vào lớp hiện tại.
  //TickerProviderStateMixin cung cấp cho class của bạn khả năng:
  // Tạo ra Ticker, thứ dùng để cung cấp nhịp cho animation.
  // Giúp bạn có thể viết vsync: this trong AnimationController.
  var images={
    "balloning.png":"Balloning",
    "hiking.png":"hiking",
    "kayaking.png":"Kayaking",
    "snorkling.png":"Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tapController = TabController(length: 3, vsync: this);
    //vsync cập nhật animation khi màn hình đang chuẩn bị vẽ khung hình mới
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 30, left: 30),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black54),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          SizedBox(height: 10),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: _tapController,
                labelColor: Colors.black54,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,

                //indicatorSize: TabBarIndicatorSize.label -> Cho biết chiều rộng của đường chỉ báo màu xanh phái dưới chữ.
                // lable:chiều rộng bằng đúng nội dung trong tab,
                // tab:Chiều rộng bằng toàn bộ tab
                indicator: CircleTabIndicator(color: Colors.blue, radius: 4),

                //indicator: trong TabBar dùng để tùy chỉnh cách hiển thị thanh gạch dưới (underline) hoặc hiệu ứng đánh dấu cho tab đang được chọn.
                tabs: [
                  Tab(text: "Places"),
                  Tab(text: "Inspiration"),
                  Tab(text: "Emotions"),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 290,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tapController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("assets/images/welcome_one.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),

                Text("Hi2"),
                Text("Hi3"),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore more", size: 22),

                AppLargeText(text: "See all", size: 16, color: Colors.blue),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 110,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Column(
                    children: [
                      Container(
                        //margin: EdgeInsets.only(right: 50),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/images/"+images.keys.elementAt(index)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        child: AppText(text: images.keys.elementAt(index),color: Colors.grey,),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
