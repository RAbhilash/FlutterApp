import 'package:flutter/material.dart';

class detail {
  final String subject, asset, subtext;
  detail(this.subject, this.asset, this.subtext);
}

class yeartwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<detail> data1 = [], data2 = [];
    data1.add(detail("Physics", "assets/images/thumbnail.jpg", "subtext1"));
    data1.add(detail("Electrical", "assets/images/thumbnail.jpg", "subtext2"));
    data1.add(detail("English", "assets/images/thumbnail.jpg", "subtext3"));
    data2.add(detail("Mechanical", "assets/images/thumbnail.jpg", "subtext1"));
    data2.add(detail("Chemistry", "assets/images/thumbnail.jpg", "subtext2"));
    data2.add(detail("PPS", "assets/images/thumbnail.jpg", "subtext3"));
    Comparator<detail> comp = (a, b) => a.subject.compareTo(b.subject);
    data1.sort(comp);
    data2.sort(comp);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Second Year'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Sem 3',
                ),
                Tab(
                  text: 'Sem 4',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              _sem(data1),
              _sem(data2),
            ],
          )),
    );
  }

  ListView _sem(List<detail> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => item(index,
            data[index].subject, data[index].subtext, data[index].asset));
  }
}

Widget item(int index, String subject, String subtext, String asset) {
  return Padding(
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
                    child: tab(subject, subtext),
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
                      image: AssetImage(asset),
                    ),
                  ),
                ),
              ],
            )),
      ),
    ),
  );
}

Widget tab(String s, String subtext) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
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
