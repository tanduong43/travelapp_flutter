import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isReponsive;
  double? width;

  ResponsiveButton({super.key, this.isReponsive = false, this.width = 120});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isReponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: Row(
          mainAxisAlignment:
              isReponsive == true
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,

          children: [
            isReponsive == true
                ? Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Book Trip Now",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
                : Container(),
            Container(
              margin: EdgeInsets.only(right: isReponsive == true ? 30 : 0),
              child: Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
