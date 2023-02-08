import 'package:flutter/material.dart';
import 'package:tenang_flutter_test/onboarding/widget/onboard_indicator.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraint) {
                if(constraint.maxHeight <= 750) {
                  return Container(
                    margin: EdgeInsets.only(top: 215),
                    decoration: BoxDecoration(
                      color: Color(0xFF4A80FF),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        stops: [0.7, 14.0],
                        colors: [Color(0xFF4A80FF), Color(0xFF3462FF)],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.07),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(300),
                                topRight: Radius.circular(300),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 300,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.07),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(300),
                                topLeft: Radius.circular(300),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 22, bottom: 30),
                            child: Image.asset('assets/images/doctor_female.png'),
                          ),
                        )
                      ],
                    ),
                  );
                }
                return Container(
                  margin: EdgeInsets.only(top: 315),
                  decoration: BoxDecoration(
                    color: Color(0xFF4A80FF),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      stops: [0.7, 14.0],
                      colors: [Color(0xFF4A80FF), Color(0xFF3462FF)],
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.07),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(300),
                              topRight: Radius.circular(300),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 300,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.07),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(300),
                              topLeft: Radius.circular(300),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 22, bottom: 30),
                        child: Image.asset('assets/images/doctor_female.png'),
                      )
                    ],
                  ),
                );
              },
            ),
            LayoutBuilder(
              builder: (context, constraint) {
                if(constraint.maxHeight <= 750) {
                  return Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
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
                    ),
                  );
                }
                return Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
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
                  ),
                );
              }
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(right: 20, bottom: 30),
                child: OnboardIndicator(
                  currentPage: 2,
                ),
              )
            )
          ],
        )
      ),
    );
  }
}
