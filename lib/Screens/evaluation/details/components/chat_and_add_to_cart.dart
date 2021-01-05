import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/DialogFlow/home_page_dialog_flow.dart';
import 'package:flutter_auth/Screens/Quiz/ui/pages/home.dart';
import 'package:flutter_auth/Screens/memoryGame/Home.dart';
import 'package:flutter_auth/models/Product.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';

class ChatAndAddToCart extends StatelessWidget {
  final int  id;

  const ChatAndAddToCart({Key key, this.id}) : super(key: key);


@override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFCBF1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/chat.svg",
            height: 18,
          ),
          SizedBox(width: kDefaultPadding / 2),
          Text(
            "Chat",
            style: TextStyle(color: Colors.white),
          ),
          // it will cover all available spaces
          Spacer(),
          FlatButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                 switch (id) {
                   case 1:
                     return HomePage();
                   case 2:
                     return Home();
                   case 3:
                     return HomePageDialogflow();
                 // case 3:
                 }
                }),
              );
            },
           icon: SvgPicture.asset(
              "assets/icons/shopping-bag.svg",
              height: 18,
            ),
            label: Text(
              "let's start",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
