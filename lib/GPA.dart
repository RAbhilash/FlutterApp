import 'package:flutter/material.dart';
import 'package:app/home_screen.dart';
import 'package:app/main.dart';
import 'home_screen.dart';

class Gpa extends StatefulWidget {
  @override
  _GpaState createState() => _GpaState();
}

class _GpaState extends State<Gpa> {
  /////////////////////////////////
  // String valueChosen1;

  List valueChosen = List<String>()..length = 11;
  List valueChosen1 = List<String>()..length = 11;

  List listItem = ["1", "2", "3", "4", "5", '6'];
  List listItem1 = ["O", "A+", "A", "B+", "B", 'C', 'F'];
  // String valueChosen11;
  Widget DrpBt1(int i) {
    return DropdownButtonHideUnderline(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: .1),
            borderRadius: BorderRadius.circular(20)),
        child: DropdownButton(
            hint: Text(
              "    click",
              textAlign: TextAlign.center,
            ),
            value: valueChosen1[i],
            onChanged: (newValue) {
              setState(() {
                this.valueChosen1[i] = newValue;
              });
            },
            items: listItem1.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList()),
      ),
    );
  }

  Widget DrpBt(int i) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: .1),
          borderRadius: BorderRadius.circular(20)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            hint: Text(
              "     click",
              textAlign: TextAlign.center,
            ),
            value: valueChosen[i],
            onChanged: (newValue) {
              setState(() {
                this.valueChosen[i] = newValue;
              });
            },
            items: listItem.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(
                  valueItem,
                  textAlign: TextAlign.center,
                ),
              );
            }).toList()),
      ),
    );
  }

  var _output = 0.0;
  int _hash(String a) {
    if (a == "O")
      return 100;
    else if (a == "A+")
      return 90;
    else if (a == "A")
      return 80;
    else if (a == "B+")
      return 70;
    else if (a == "B")
      return 60;
    else if (a == "C")
      return 55;
    else if (a == "F")
      return 50;
    else
      return 0;
  }

  _Calculatin() {
    print("jo");
    int ci = 0;
    int ans = 0;
    for (int i = 0; i < 11; i += 1) {
      print(i);
      // print(valueChosen[i]);

      if (valueChosen[i] != null && valueChosen1[i] != null) {
        ci = ci + int.parse(valueChosen[i]);
        print(valueChosen[i].runtimeType);
        int temp = _hash(valueChosen1[i]);
        ans += (temp * int.parse(valueChosen[i]));
      }
    }
    _output = ans / (ci * 10);
    _output = double.parse((_output).toStringAsFixed(2));
    // _output = _output.toString() as double;
    print(_output);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        // bottomNavigationBar: Container(height: 60, child: Text("hiii")
        // decoration: ,
        appBar: AppBar(
          title: Text("GPA calculator...test"),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              // alignment: ,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/calc2.jpeg"),
                      fit: BoxFit.fill)),
            ),
            Column(children: [
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Card(
                      child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "S.No",
                          textAlign: TextAlign.center,
                          textScaleFactor: 2,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "credit",
                          textAlign: TextAlign.center,
                          textScaleFactor: 2,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Grade",
                          textAlign: TextAlign.center,
                          textScaleFactor: 2,
                        ),
                      )
                    ],
                  )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.6,
                width: MediaQuery.of(context).size.width / 1.2,
                color: Colors.white60,
                child: GridView.count(
                  childAspectRatio: (3.5),
                  crossAxisCount: 3,
                  children: [
                    Card(
                        child: Text(
                      "1",
                      textAlign: TextAlign.center,
                    )),
                    Card(child: DrpBt(1)),
                    Card(child: DrpBt1(1)),

                    /**from here i will be repeating all the above widget yooo */
                    Card(
                        child: Text(
                      "2",
                      textAlign: TextAlign.center,
                    )),
                    Card(child: DrpBt(2)),
                    Card(child: DrpBt1(2)),
                    Card(
                        child: Text(
                      "3",
                      textAlign: TextAlign.center,
                    )),
                    Card(child: DrpBt(3)),
                    Card(child: DrpBt1(3)),
                    Card(
                        child: Text(
                      "4",
                      textAlign: TextAlign.center,
                    )),
                    Card(child: DrpBt(4)),
                    Card(child: DrpBt1(4)),
                    Card(
                        child: Text(
                      "5",
                      textAlign: TextAlign.center,
                    )),
                    Card(child: DrpBt(5)),
                    Card(child: DrpBt1(5)),
                    Card(
                        child: Text(
                      "6",
                      textAlign: TextAlign.center,
                    )),
                    Card(child: DrpBt(6)),
                    Card(child: DrpBt1(6)),
                    Card(
                        child: Text(
                      "7",
                      textAlign: TextAlign.center,
                    )),
                    Card(child: DrpBt(7)),
                    Card(child: DrpBt1(7)),
                    Card(
                        child: Text(
                      "8",
                      textAlign: TextAlign.center,
                    )),
                    Card(child: DrpBt(8)),
                    Card(child: DrpBt1(8)),
                    Card(
                        child: Text(
                      "9",
                      textAlign: TextAlign.center,
                    )),
                    Card(child: DrpBt(9)),
                    Card(child: DrpBt1(9)),
                    Card(
                        child: Text(
                      "10",
                      textAlign: TextAlign.center,
                    )),
                    Card(child: DrpBt(10)),
                    Card(child: DrpBt1(10)),
                    // Card(
                    //     child: Text(
                    //   "11",
                    //   textAlign: TextAlign.center,
                    // )),
                    // Card(child: DrpBt()),
                    // Card(child: DrpBt1()),
                    // Card(
                    //     child: Text(
                    //   "12",
                    //   textAlign: TextAlign.center,
                    // )),
                    // Card(child: DrpBt()),
                    // Card(child: DrpBt1()),
                    /** till here yooo */
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                      // color: Colors.lightGreenAccent,
                      // border: Border.all(width: .1),
                      borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width / 2,
                  // height: 50,
                  // decoration: Decoration()
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                // color: Colors.white12,
                                border: Border.all(width: .1),
                                borderRadius: BorderRadius.circular(20)),
                            child: RaisedButton(
                                splashColor: Colors.orange,
                                elevation: 0,
                                onLongPress: () =>
                                    (context as Element).reassemble(),
                                onPressed: (() {
                                  print("hii");
                                  setState(() {
                                    _Calculatin();
                                  });
                                }),
                                color: Colors.white30,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                                child: Text(
                                  "lets go",
                                  textAlign: TextAlign.center,
                                )),
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              border: Border.all(width: .1),
                              borderRadius: BorderRadius.circular(20)),
                          child: RaisedButton(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Text(
                              _output.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // height: 40,
                        ),
                      )
                    ],
                  ))
            ]),
          ],
        ));
  }
}
