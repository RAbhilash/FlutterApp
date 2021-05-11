import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:responsive_screen/responsive_screen.dart';

class aboutus extends StatefulWidget {
  @override
  _aboutusState createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final wp = Screen(context).wp; //specify wp
    final hp = Screen(context).hp;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'about us',
          ),
          centerTitle: true,
          backgroundColor: Colors.green[200],
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Card(
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.red)),
                    child: Row(
                      children: <Widget>[
                        Container(
                            height: hp(25),
                            width: wp(25),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            )),
                        SizedBox(
                          width: wp(15),
                        ),
                        Text('sqwe'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: hp(5),
                ),
                Card(
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.red)),
                    child: Row(
                      children: <Widget>[
                        Container(
                            height: hp(25),
                            width: wp(25),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            )),
                        SizedBox(
                          width: wp(15),
                        ),
                        Text('sqwe'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: hp(5),
                ),
                Card(
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.red)),
                    child: Row(
                      children: <Widget>[
                        Container(
                            height: hp(25),
                            width: wp(25),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            )),
                        SizedBox(
                          width: wp(15),
                        ),
                        Text('sqwe'),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
