import 'package:flutter/material.dart';

class OnboardIndicator extends StatelessWidget {
  const OnboardIndicator({
    Key? key,
    required this.currentPage,
  }) : super(key: key);
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Dot(color: currentPage == 0 ? Color.fromRGBO(252, 252, 252, 0.3) : Color(0xFFF1F2F6)),
        Dot(color: currentPage == 1 ? Color.fromRGBO(252, 252, 252, 0.3) : Color(0xFFF1F2F6)),
        Dot(color: currentPage == 2 ? Color.fromRGBO(252, 252, 252, 0.3) : Color(0xFFF1F2F6)),
      ],
    );
  }
}

class Dot extends StatelessWidget {
  Dot({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

