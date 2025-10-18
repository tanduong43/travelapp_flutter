import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  //Trong Dart, từ khóa with dùng để “trộn” (mix) thêm các tính năng hoặc phương thức của một lớp khác vào lớp hiện tại.
  //TickerProviderStateMixin cung cấp cho class của bạn khả năng:
  // Tạo ra Ticker, thứ dùng để cung cấp nhịp cho animation.
  // Giúp bạn có thể viết vsync: this trong AnimationController.
  @override
  Widget build(BuildContext context) {
    TabController _tapController=TabController(length: 3, vsync: this);
    //vsync cập nhật animation khi màn hình đang chuẩn bị vẽ khung hình mới
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top:60,left: 30),
                child: Row(
                  children: [
                    Icon(Icons.menu, size: 30, color: Colors.black54,),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5)
                      )
                    ),
                  ],
                ),

              ),
              SizedBox(height: 40,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: AppLargeText(text: "Discover"),
              ),
              SizedBox(height: 30,),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    controller: _tapController,
                    labelColor: Colors.black54,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,//

                      tabs: [
                        Tab(text: "Places"),
                        Tab(text: "Inspiration"),
                        Tab(text: "Emotions"),
                      ]
                  ),
                ),
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                    controller: _tapController,
                    children: [
                      Text("Hi"),
                      Text("Hi2"),
                      Text("Hi3"),
                ]),
              )

            ]
        )
    );
  }
}