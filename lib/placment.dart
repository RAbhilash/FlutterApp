import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class detail {
  String subject, asset, url;
  detail(this.subject, this.asset, this.url);
}

launchurl(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Error launching url';
  }
}

class placement extends StatelessWidget {
  @override
  List<detail> data1 = [];
  placement() {
    data1.add(detail("DBMS", "assets/images/thumbnail.jpg",
        "https://whimsical.com/dbms-roadmap-by-love-babbar-FmUi8ffVop33t3MmpVxPCo"));
    data1.add(detail("Final year roadmap", "assets/images/thumbnail.jpg",
        "https://www.youtube.com/watch?v=VY6003vijLw"));
    data1.add(detail("Web Development", "assets/images/thumbnail.jpg",
        "https://www.youtube.com/watch?v=GLk7-imcjiI"));
    data1.add(detail("OOPS", "assets/images/thumbnail.jpg",
        "https://whimsical.com/object-oriented-programming-cheatsheet-by-love-babbar-YbSgLatbWQ4R5paV7EgqFw"));
    data1.add(detail("2nd year", "assets/images/thumbnail.jpg",
        "https://www.youtube.com/watch?v=CF1j_wMEbPA"));
    data1.add(detail(
        "How to get into Product Based Companies",
        "assets/images/thumbnail.jpg",
        "https://www.youtube.com/watch?v=PihtA9D-IlE"));
    Comparator<detail> comp = (a, b) => a.subject.compareTo(b.subject);
    data1.sort(comp);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Third Year'),
      ),
      body: _sem(data1),
    );
  }

  ListView _sem(List<detail> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => item(context, index,
            data[index].subject, data[index].url, data[index].asset));
  }
}

Widget item(
    BuildContext context, int index, String subject, String url, String asset) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      child: FittedBox(
        child: Material(
            color: Colors.white,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: tab(context, subject, url),
              ),
            )),
      ),
    ),
  );
}

Widget tab(BuildContext context, String s, String url) {
  var size = MediaQuery.of(context).size;
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 8),
        child: Container(
          width: size.width / 3.5,
          child: Text(
            s,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 8),
        child: ElevatedButton.icon(
          label: Text('View'),
          icon: Icon(Icons.download_rounded),
          onPressed: () {
            launchurl(url);
          },
        ),
      ),
    ],
  );
}
