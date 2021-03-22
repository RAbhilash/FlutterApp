import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

class detail {
  final String name, asset, subtext;
  detail(this.name, this.asset, this.subtext);
}

class yearone extends StatelessWidget {
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
              _sem1(),
              _sem2(),
            ],
          )),
    );
  }

  ListView _sem1() {
    FutureBuilder(
        future: json1(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Container();
          return ListView.builder(
              itemCount: snapshot.data.length(),
              itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: FittedBox(
                        child: Material(
                            color: Colors.white,
                            elevation: 10.0,
                            borderRadius: BorderRadius.circular(24.0),
                            shadowColor: Color(0x802196F3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: tableft(snapshot.data[index].name,
                                        snapshot.data[index].subtext),
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
                                        snapshot.data[index].asset,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ));
        });
  }

  ListView _sem2() {
    FutureBuilder(
        future: json2(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Container();
          return ListView.builder(
              itemCount: snapshot.data.length(),
              itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: FittedBox(
                        child: Material(
                            color: Colors.white,
                            elevation: 10.0,
                            borderRadius: BorderRadius.circular(24.0),
                            shadowColor: Color(0x802196F3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: tabright(snapshot.data[index].name,
                                        snapshot.data[index].subtext),
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
                                          snapshot.data[index].asset),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ));
        });
  }
}

Future<List<detail>> json1({BuildContext context}) async {
  var list =
      await DefaultAssetBundle.of(context).loadString('assets/json/sem1.json');
  return json.decode(list);
}

Future<List<detail>> json2({BuildContext context}) async {
  var list =
      await DefaultAssetBundle.of(context).loadString('assets/json/sem2.json');
  return json.decode(list);
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
