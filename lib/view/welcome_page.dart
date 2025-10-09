import 'package:flutter/material.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:travelapp/widgets/responsive_button.dart';

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
        //PageView.builder trong Flutter là widget tạo danh sách các trang (page) mà người dùng có thể vuốt qua lại (swipe)
        scrollDirection:
            Axis.vertical, //vuốt lên xuống (giống cuộn dọc trang web).
        //scrollDirection: Axis.horizontal vuốt ngang (trái ↔ phải).
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      SizedBox(height: 20),
                      ResponsiveButton(width: 120),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) {
                      //generator(int index) hàm (hoặc lambda) tạo giá trị cho từng phần tử, index là vị trí từ 0
                      // 3:length số phần tử trong danh sách
                      return Container(
                        margin: EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              index == indexDots
                                  ? Colors.lightBlue
                                  // ignore: deprecated_member_use
                                  : Colors.blueGrey,
                        ),
                      );
                    }),
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
