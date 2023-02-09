import 'package:flutter/material.dart';

class OnboardCarousel extends StatelessWidget {
  OnboardCarousel({Key? key, required this.onchanged}) : super(key: key);

  final Function(int) onchanged;

  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: (currentPage) {
        onchanged(currentPage);
      },
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(left: 22, bottom: 30),
              height: 225,
              child: Image.asset('assets/images/doctor_female.png'),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(left: 22, bottom: 30),
              height: 285,
              child: Image.asset('assets/images/doctor_male.png'),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 22, bottom: 30),
              height: 245,
              child: Image.asset('assets/images/yoga.png'),
            ),
          ],
        ),
      ],
    );
  }
}
