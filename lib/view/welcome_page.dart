import 'package:flutter/material.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["welcome_one.png", "welcome_two.png", "welcome_three.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        // tạo trang có thể cuộn
        scrollDirection: Axis.vertical,
        itemCount: images.length, // xác định số lượng trang trong PageView.
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              //Là một lớp dùng để trang trí
              image: DecorationImage(
                //được sử dụng để hiển thị hình ảnh làm nền.
                image: AssetImage("assets/images/" + images[index]),
                fit: BoxFit.cover, //Hình ảnh sẽ bao phủ toàn bộ Container
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(text: "Mountain", size: 30),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: AppText(
                          text: "Nguyễn Tấn Dương đẹp zai nhất sever trái đất",
                          size: 16,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
