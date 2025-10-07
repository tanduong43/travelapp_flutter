import 'package:flutter/material.dart';

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
          );
        },
      ),
    );
  }
}
