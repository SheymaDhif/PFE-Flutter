import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _pageController = PageController();
  int _page = 0;
  List<String> list = ["page_1","page_2","page_3"];
  List<String> listHeaders = [
    "Be capable of controlling your waves",
    "Make Evaluations and check the results",
    "we will offer Help"
  ];
  List<String> listText = [
    "connect please your device and follow the contructions and see what happens.",
    "Visualise your waves in Real Time",
    "Talk with us , ask questions , provide more infos about you!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: FlatButton(
                onPressed: () async {
                  await AuthService.setFirstTime(firstTime: false);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text(
                  "Skip",
                  style: TextStyle(
                      fontSize: 16,
                      color: KprimaryTextColor.withOpacity(0.3)),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Text(
                listHeaders[_page],
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: KprimaryTextColor),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                  controller: _pageController, // PageController
                  count: 3,
                  effect: WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: kPrimaryColor,
                      dotColor:
                      kTextColor), // your preferred effect
                  onDotClicked: (index) {}),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 15),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 50, bottom: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kPrimaryColor.withOpacity(0.08),
                        ),
                      ),
                    ),
                    PageView.builder(
                      controller: _pageController,
                      itemCount: list.length,
                      onPageChanged: (p) {
                        setState(() {
                          _page = p;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            _displayImage(list[index]),
                            SizedBox(
                              height: 15,
                            ),
                            _displayText(listText[index]),
                          ],
                        );
                      },
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () async {
                          if (_page != 2) {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          } else {
                            await AuthService.setFirstTime(firstTime: false);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WelcomeScreen()));
                          }
                        },
                        child: AnimatedContainer(
                          width: _page == 2 ? 200 : 50,
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.3),
                                offset: Offset(0.0, 5.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          // Define how long the animation should take.
                          duration: Duration(milliseconds: 150),
                          // Provide an optional curve to make the animation feel smoother.
                          curve: Curves.fastOutSlowIn,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: AnimatedOpacity(
                                  opacity: _page == 2 ? 1 : 0,
                                  duration: Duration(
                                    milliseconds: 200,
                                  ),
                                  child: Text(
                                    _page == 2 ? "C'est parti" : "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 13),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _displayText(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: KprimaryTextColor),
        textAlign: TextAlign.center,
      ),
    );
  }

  _displayImage(String path) {
    return Image.asset(
      "assets/images/$path.png",
      height: MediaQuery.of(context).size.height * .4,
    );
  }
}
