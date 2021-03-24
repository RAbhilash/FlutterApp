import 'package:flutter/material.dart';

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
    return ListView.builder(
        itemCount: 3,
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
                              child: tableft("subject", "subtext"),
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
                                  "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
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
}

ListView _sem2() {
  return ListView.builder(
      itemCount: 3,
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
                            child: tabright("subject", "subtext"),
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
                                  "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ));
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
