import 'package:flutter/material.dart';
import 'package:tenang_flutter_test/onboarding/widget/onboard_carousel.dart';
import 'package:tenang_flutter_test/onboarding/widget/onboard_description.dart';
import 'package:tenang_flutter_test/onboarding/widget/onboard_indicator.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                        child: OnboardDescription(currentDesc: _currentPage,)
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
                      child: OnboardDescription(currentDesc: _currentPage)
                    );
                  }
              ),
              OnboardCarousel(
                onchanged: (currentPage) {
                  setState(() {
                    _currentPage = currentPage;
                  });
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(right: 20, bottom: 30),
                  child: OnboardIndicator(currentPage: _currentPage),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
