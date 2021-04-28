import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/GPA.dart';
import 'package:app/books.dart';
import 'package:app/course_notes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/placment.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get icon => null;

  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1)); //this is not really working

    return Scaffold(
      body: Container(
        color: Colors.red[300],
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Stack(
              children: [
                Column(
                  children: [
                    // SizedBox(height: 70),
                    Container(
                      height: size.height * .5,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 40.0,
                              offset: Offset(0.0, 0.75))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80),
                        ),
                        // image: DecorationImage(
                        //     fit: BoxFit.fill,
                        //     image: AssetImage("assets/images/top_header.jpg"))
                      ),
                    )
                  ],
                ),
                Column(children: [
                  // SizedBox(height: size.height * .099),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 95, 20, 2),
                    child: ClipPath(
                      clipper: ShapeBorderClipper(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage("assets/images/gif1.gif")),
                        ),
                      ),
                    ),
                  )
                ])
              ],
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 84,
                      // color: Colors.yellow,
                      margin: EdgeInsets.only(bottom: 210),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/en/f/fe/Srmseal.png'),
                          ),
                          SizedBox(
                            width: 55,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Text(
                              //   'SRM PRO',
                              //   style: TextStyle(
                              //       fontFamily: "Montserrat Medium",
                              //       color: Colors.white,
                              //       fontSize: 20),
                              // ),
                              DefaultTextStyle(
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.black),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  pause: Duration(milliseconds: 1500),
                                  animatedTexts: [
                                    // TyperAnimatedText('SRM FOREVER'),
                                    RotateAnimatedText('SRM'),
                                    RotateAnimatedText('FOREVER'),
                                  ],
                                ),
                              ),
                              // Text(
                              //   '4101410141',
                              //   style: TextStyle(
                              //       fontSize: 14,
                              //       color: Colors.redAccent,
                              //       fontFamily: "Montserrat Regular"),
                              // )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      // decoration: BoxDecoration(
                      // color: Colors.black,
                      // borderRadius: BorderRadius.circular(1000)),
                    ),
                    Expanded(
                      flex: 1,
                      child: GridView.count(
                        padding: const EdgeInsets.only(top: 80),
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 20,
                        primary: false,
                        crossAxisCount: 2,
                        children: <Widget>[
                          //this is personal data
                          //card 1: personal
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 1),
                                    transitionsBuilder: (context, animation,
                                        animationTime, child) {
                                      animation = CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.elasticInOut);
                                      return ScaleTransition(
                                        alignment: Alignment.center,
                                        scale: animation,
                                        child: child,
                                      );
                                    },
                                    pageBuilder:
                                        (context, animation, animationTime) {
                                      return placement();
                                    },
                                  ));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              elevation: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/fang.png',
                                    height: 100,
                                  ),
                                  Text(
                                    'Placement Material',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'cardTextStyle'),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 1),
                                    transitionsBuilder: (context, animation,
                                        animationTime, child) {
                                      animation = CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.elasticInOut);
                                      return ScaleTransition(
                                        alignment: Alignment.center,
                                        scale: animation,
                                        child: child,
                                      );
                                    },
                                    pageBuilder:
                                        (context, animation, animationTime) {
                                      return Books();
                                    },
                                  ));
                            },
                            child: Card(
                              //card 2:Books
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              elevation: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    // image: DecorationImage(
                                    //     fit: BoxFit.fill,
                                    //     alignment: Alignment.topCenter,
                                    //     // image: AssetImage('assets/images/g1.jpg')
                                    //     ),
                                    ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/books.png', //add img here
                                      height: 100,
                                    ),
                                    //SizedBox(height: 10),
                                    SizedBox(height: 25),
                                    Text('Books',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'cardTextStyle'))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //card 3:gpa
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Gpa()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              elevation: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/calc.png',
                                    height: 100,
                                  ),
                                  SizedBox(height: 30),
                                  Text('GPA Calculator',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'cardTextStyle'))
                                ],
                              ),
                            ),
                          ),

                          // InkWell(
                          //   borderRadius: BorderRadius.circular(16),
                          //   splashColor: Colors.greenAccent[210],
                          //   child: Card(
                          //     // color: Colors.transparent,
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(20)),
                          //     elevation: 20,
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: <Widget>[
                          //         SvgPicture.network(
                          //           'https://image.flaticon.com/icons/svg/1904/1904235.svg',
                          //           height: 128,
                          //         ),
                          //         Text(
                          //           'Course Booking',
                          //           style: cardTextStyle,
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          //   onTap: () {
                          //     print("Tapped");
                          //   },
                          // ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 1),
                                    transitionsBuilder: (context, animation,
                                        animationTime, child) {
                                      animation = CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.elasticInOut);
                                      return ScaleTransition(
                                        alignment: Alignment.center,
                                        scale: animation,
                                        child: child,
                                      );
                                    },
                                    pageBuilder:
                                        (context, animation, animationTime) {
                                      return notes();
                                    },
                                  ));
                            },
                            child: Card(
                              //card 4:course notes
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              elevation: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/notes.png',
                                    height: 100,
                                  ),
                                  SizedBox(height: 30),
                                  Text('Course Notes',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'cardTextStyle'))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
