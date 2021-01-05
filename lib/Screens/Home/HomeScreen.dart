import 'package:flutter/material.dart';
//import 'package:flutter_auth/Screens/ThingsSpeak/page/line_chart_page.dart';
import 'package:flutter_auth/Screens/ThingsSpeak/wave_screen.dart';
import 'package:flutter_auth/Screens/evaluation/evaluation_screen.dart';
import 'package:flutter_auth/widgets/bottom_nav_bar.dart';
import 'package:flutter_auth/widgets/category_card.dart';
import 'package:flutter_auth/widgets/search_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'details_screen.dart';
import 'package:flutter_auth/Screens/report/report_screen.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFF6F35A5),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFF6F35A5),
                        shape: BoxShape.circle,
                      ),
                     // child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Evaluation",
                          imgPath: "assets/images/testing.jpg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return EvaluationScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Eyes on your waves",
                          imgPath: "assets/images/w1.jpg",
                          press: () {
                            Navigator.push(
                                context,
                            MaterialPageRoute(builder: (context) {
                             return WaveScreen(title: "Waves");
                             }),
                                   );
                           },
                        ),
                        CategoryCard(
                          title: "Meditation",
                         imgPath: "assets/images/meditation_1.jpg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Report",
                          imgPath: "assets/images/p1.jpg",
                          press: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return ReportScreen();
                            }),
                          );},
                        ),
                        CategoryCard(
                          title: "Google Map",
                          imgPath: "assets/images/doc2.jpg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "About us",
                          imgPath: "assets/images/icon.jpg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}