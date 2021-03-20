import 'package:flutter/material.dart';
import 'dart:convert';

class yearone extends StatelessWidget {
  List data;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('First Year'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Sem 1',
                ),
                Tab(
                  text: 'Sem 2',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              _sem1(context),
              _sem2(context),
            ],
          )),
    );
  }

  ListView _sem1(BuildContext context) {
    FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/json/sem1.json'),
        builder: (context, snapshot) {
          // Decode the JSON
          if (!snapshot.hasData)
            return Container();
          else {
            var newData = json.decode(snapshot.data.toString());
            return ListView.builder(
                itemCount: newData == null ? 0 : newData.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: FittedBox(
                          child: Material(
                              color: Colors.white,
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(24.0),
                              shadowColor: Color(0x802196F3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: tableft(newData[index]['name'],
                                          newData[index]['subtext']),
                                    ),
                                  ),
                                  Container(
                                    width: 190,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24.0),
                                      child: Image(
                                        fit: BoxFit.contain,
                                        alignment: Alignment.topRight,
                                        image: NetworkImage(
                                          newData[index]['asset'],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ));
          }
        });
  }

  ListView _sem2(BuildContext context) {
    FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/json/sem2.json'),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Container();
          else {
            // Decode the JSON
            var newData = json.decode(snapshot.data.toString());
            return ListView.builder(
                itemCount: newData == null ? 0 : newData.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: FittedBox(
                          child: Material(
                              color: Colors.white,
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(24.0),
                              shadowColor: Color(0x802196F3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: tabright(newData[index]['name'],
                                          newData[index]['subtext']),
                                    ),
                                  ),
                                  Container(
                                    width: 190,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24.0),
                                      child: Image(
                                        fit: BoxFit.contain,
                                        alignment: Alignment.topRight,
                                        image: NetworkImage(
                                            newData[index]['asset']),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ));
          }
        });
  }
}

Widget tableft(String s, String subtext) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
        child: Container(
          child: Text(s),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 8),
        child: Container(
          child: Text(subtext),
        ),
      ),
    ],
  );
}

Widget tabright(String name, String subtext) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Container(
          child: Text(name),
        ),
      ),
      Padding(
          padding: EdgeInsets.only(left: 8),
          child: Container(
            child: Text(subtext),
          )),
    ],
  );
}
