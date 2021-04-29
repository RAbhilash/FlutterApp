import 'package:app/fontlib/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class detail {
  String subject, url, subtext;
  IconData asset;
  detail(this.subject, this.asset, this.url, this.subtext);
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
    data1.add(detail(
        "DBMS",
        MyFlutterApp.whimsical,
        "https://whimsical.com/dbms-roadmap-by-love-babbar-FmUi8ffVop33t3MmpVxPCo",
        "DBMS RoadMap - Love Babbar"));
    data1.add(detail(
        "Final year roadmap",
        MyFlutterApp.youtube,
        "https://www.youtube.com/watch?v=VY6003vijLw",
        "[4th year] Roadmap to Dream Placement - Love Babbar"));
    data1.add(detail(
        "Web Development",
        MyFlutterApp.youtube,
        "https://www.youtube.com/watch?v=GLk7-imcjiI",
        "Complete Roadmap for Web Development - Love Babbar"));
    data1.add(detail(
        "OOPS",
        MyFlutterApp.whimsical,
        "https://whimsical.com/object-oriented-programming-cheatsheet-by-love-babbar-YbSgLatbWQ4R5paV7EgqFw",
        "Object Oriented Programming CheatSheet - by Love Babbar"));
    data1.add(detail(
        "2nd year",
        MyFlutterApp.youtube,
        "https://www.youtube.com/watch?v=CF1j_wMEbPA",
        "Roadmap to Off-campus Internship in 2nd Year - Apna College"));
    data1.add(detail(
        "How to get into Product Based Companies",
        MyFlutterApp.youtube,
        "https://www.youtube.com/watch?v=PihtA9D-IlE",
        "Studying for College Placements - Aman Dhatarwal"));
    Comparator<detail> comp = (a, b) => a.subject.compareTo(b.subject);
    data1.sort(comp);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text('Placement Resources',
            style: TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
      ),
      body: _sem(data1),
    );
  }

  ListView _sem(List<detail> data) {
    return ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => item(
            context,
            index,
            data[index].subject,
            data[index].url,
            data[index].asset,
            data[index].subtext));
  }
}

// double size = 100.0;
Widget item(BuildContext context, int index, String subject, String url,
    IconData asset, String subtext) {
  return Card(
    margin: EdgeInsets.all(16),
    elevation: 10,
    child: InkWell(
      onTap: () {
        launchurl(url);
      },
      child: Container(
        child: ListTile(
            subtitle: Text(subtext),
            contentPadding:
                EdgeInsets.only(top: 8, right: 8, bottom: 8, left: 16),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(asset),
            title: Text(subject)),
      ),
    ),
  );
}
