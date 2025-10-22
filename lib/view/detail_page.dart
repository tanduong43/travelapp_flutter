import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/widgets/app_buttons.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:travelapp/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/mountain.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu, color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 250,
              child: Container(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                height: 500,
                width:
                    MediaQuery.of(context)
                        .size
                        .width, //được dùng để lấy chiều rộng (width) của toàn bộ màn hình thiết bị
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Yosemite", color: Colors.black54),
                        AppLargeText(text: "\$250", color: Colors.blueAccent),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.blueAccent),
                        SizedBox(width: 5),
                        AppText(
                          text: "USA, California",
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          //Wrap theo ngang hoặc dọc, tự động xuống dòng/cột khi hết chỗ
                          children: List.generate(5, (index) {
                            //index 0 1 2 3 4
                            return Icon(
                              Icons.star,
                              color:
                                  index < gottenStars
                                      ? Colors.yellow
                                      : Colors.grey,
                            );
                          }),
                        ),
                        SizedBox(width: 10),
                        AppText(text: "(4.0)", color: Colors.black54),
                      ],
                    ),

                    SizedBox(height: 10),
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(height: 5),
                    AppText(
                      text: "Number of people in your group",
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: AppButtons(
                              text: (index + 1).toString(),
                              isIcon: false,
                              size: 50,
                              color:
                                  selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                              backgroundColor:
                                  selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey.shade200,
                              borderColor:
                                  selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey.shade200,
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 10),
                    AppLargeText(
                      text: "Description",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(height: 5),
                    AppText(
                      text:
                          "You must go to see Yosemite, the most beautiful national park in the USA. You will see many wonderful scenes here.",
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButtons(
                    size: 60,
                    icon: Icons.favorite_border,
                    isIcon: true,
                    color: Colors.black,
                    backgroundColor: Colors.white,
                    borderColor: Colors.black,
                  ),
                  SizedBox(width: 20),
                  ResponsiveButton(isReponsive: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
