import 'package:app/GPA.dart';
import 'package:app/course_notes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
              // height: size.height * .3,
              decoration:
                  BoxDecoration(color: Color.fromRGBO(220, 220, 220, 200))),
          Stack(
            children: [
              Container(
                height: size.height * .5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/background.png"))),
              ),
              Column(children: [
                SizedBox(height: size.height * .15),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/gifs/tele.png")),
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
                    height: 64,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 32,
                          // backgroundImage: NetworkImage(
                          //     'https://i.pinimg.com/originals/78/07/03/78070395106fcd1c3e66e3b3810568bb.jpg'),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'AdityaPratapSingh',
                              style: TextStyle(
                                  fontFamily: "Montserrat Medium",
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Text(
                              'YO ',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.redAccent,
                                  fontFamily: "Montserrat Regular"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 130,
                  ),
                  Expanded(
                    child: GridView.count(
                      padding: EdgeInsets.all(20),
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        //this is personal data
                        //card 1: personal
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.blue, width: 5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Icon(Icons.note,
                                    color: Colors.blue, size: 100),
                              ),
                              Expanded(
                                child: Text(
                                  'Personal Data',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        ),
                        Card(
                          //card 2:Books
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/books.png', //add img here
                                height: 100,
                              ),
                              //SizedBox(height: 10),
                              Text(
                                'Books',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        //card 3:gpa
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Gpa()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/calc.png',
                                  height: 100,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'GPA Calculator',
                                  style: cardTextStyle,
                                )
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
                                MaterialPageRoute(
                                    builder: (context) => notes()));
                          },
                          child: Card(
                            //card 4:course notes
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/notes.png',
                                  height: 100,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Course Notes',
                                  style: cardTextStyle,
                                )
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
    );
  }
}
