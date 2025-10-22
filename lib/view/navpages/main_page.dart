
import 'package:flutter/material.dart';
import 'package:travelapp/view/navpages/search_page.dart';

import 'bar_item_page.dart';
import '../home_page.dart';
import 'my_page.dart';

class MainPage extends StatefulWidget{
const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages=[
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex=index;
    });
  }
 @override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
    body: pages[currentIndex],

    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      onTap:onTap,
      currentIndex: currentIndex,//Mục đang đc chọn (đầu tiên là 0)
      selectedItemColor: Colors.black54,
      selectedFontSize:0,//Bỏ kích thước chữ
      unselectedItemColor: Colors.grey.withOpacity(0.5),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,//Bỏ hiệu ứng bóng đổ phái trên thanh navigation
      iconSize: 25,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart),label: "Bar"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "My"),
      ],
    )
  );
}
}


