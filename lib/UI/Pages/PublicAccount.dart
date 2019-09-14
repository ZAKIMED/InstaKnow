import 'package:flutter/material.dart';
import 'package:instaknown/UI/Pages/PieChartPage.dart';
import 'package:instaknown/UI/Resources/my_flutter_app_icons.dart';
import 'package:instaknown/UI/Widgets/EmojiContainer.dart';
import 'package:instaknown/UI/Resources/Constants.dart' as R;
import 'package:instaknown/UI/Widgets/UserCard.dart';

class PublicAccount extends StatefulWidget {
  PublicAccount({
    Key key,
  }) : super(key: key);

  @override
  _PublicAccountState createState() => _PublicAccountState();
}

class _PublicAccountState extends State<PublicAccount> {
  final GlobalKey stickyKeyUsenameContainer = GlobalKey();
  final GlobalKey stickyKeyChartContainer = GlobalKey();

  _findHeight(GlobalKey<State<StatefulWidget>> stickyKey) {
    final keyContext = stickyKey.currentContext;
    if (keyContext != null) {
      // widget is visible
      final box = keyContext.findRenderObject() as RenderBox;
      return box.size.height;
    }
  }

  bool isLogedIn = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Stack(
        children: <Widget>[
          // Username input
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              key: stickyKeyUsenameContainer,
              color: Colors.redAccent,
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    // height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Public Account......",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: R.avenirFontFamily,
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLogedIn = !isLogedIn;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 50,
                              child: Icon(Icons.restore),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  isLogedIn ? UserCard() : Container(),
                  isLogedIn
                      ? Container()
                      : TextField(
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            prefixIcon: Icon(
                              IconData(0xe8e9, fontFamily: 'Feather'),
                              color: Colors.white,
                              size: 30,
                            ),
                            hintText: "Username",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              fontFamily: R.avenirFontFamily,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 32.0,
                              ),
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white10,
                                width: 32.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                  isLogedIn
                      ? Container()
                      : SizedBox(
                          height: 10,
                        ),
                  isLogedIn
                      ? Container()
                      : InkWell(
                          onTap: () {
                            setState(() {
                              isLogedIn = !isLogedIn;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * .055,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0),
                                ),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Center(
                              child: Text(
                                "Analyse",
                                style: TextStyle(
                                  fontFamily: R.avenirFontFamily,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Colors.grey[900],
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
          !isLogedIn
              ? Container()
              : Positioned(
                  left: 0,
                  right: 0,
                  key: stickyKeyChartContainer,
                  top: _findHeight(stickyKeyUsenameContainer) ?? 100,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              GaugeChart(
                                animate: false,
                                color: Colors.black,
                                percentage: 0.65,
                              ),
                              Row(
                                children: <Widget>[
                                  EmojiContainer(
                                      icon: EmojiIcon.emo_angry,
                                      color: Colors.black),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Negative',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: R.avenirFontFamily,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              GaugeChart(
                                animate: false,
                                color: Colors.purple,
                                percentage: 0.35,
                              ),
                              Row(
                                children: <Widget>[
                                  EmojiContainer(
                                      icon: EmojiIcon.emo_laugh,
                                      color: Colors.purple),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Positive',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: R.avenirFontFamily,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          GaugeChart(
                            animate: false,
                            color: Colors.lightGreen,
                            percentage: 0.85,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              EmojiContainer(
                                  icon: EmojiIcon.emo_happy,
                                  color: Colors.lightGreen),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Neutral',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: R.avenirFontFamily,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
