import 'package:flutter/material.dart';

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
              _method('sem1'),
              _method('sem2'),
            ],
          )),
    );
  }

  ListView _method(String s) {
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              title: Text(s + ' $index'),
            ));
  }
}
