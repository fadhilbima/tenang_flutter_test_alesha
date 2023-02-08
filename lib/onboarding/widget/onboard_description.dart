import 'package:flutter/material.dart';

class OnboardDescription extends StatelessWidget {
  OnboardDescription({Key? key, required this.currentDesc}) : super(key: key);
  int currentDesc = 0;

  @override
  Widget build(BuildContext context) {
    if(currentDesc==0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome to Alesha',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 22,
          ),
          Text(
            'Reference site about Lorem\nIpsum, giving information origins \n as well as a random',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
            textAlign: TextAlign.center,
          )
        ],
      );
    }
    if(currentDesc==1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Find Best Doctors',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 22,
          ),
          Text(
            'Reference site about Lorem\nIpsum, giving information origins \n as well as a random',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
            textAlign: TextAlign.center,
          )
        ],
      );
    }
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Get Fitness Trips',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              'Reference site about Lorem\nIpsum, giving information origins \n as well as a random',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Color(0xFF4A80FF)
              ),
              onPressed: () {
                print('clicked');
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
