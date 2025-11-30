import 'package:flutter/material.dart';
import 'pages/list_view_page.dart';
import 'pages/grid_view_page.dart';
import 'pages/shared_pref_page.dart';
import 'pages/async_page.dart';
import 'pages/isolate_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bài tập Flutter")),
      body: ListView(
        children: [
          menuItem(context, "Bài 1 - ListView", ListViewPage()),
          menuItem(context, "Bài 2 - GridView", GridViewPage()),
          menuItem(context, "Bài 3 - Shared Preferences", SharedPrefPage()),
          menuItem(context, "Bài 4 - Async", AsyncPage()),
          menuItem(context, "Bài 5 - Isolate", IsolatePage()),
        ],
      ),
    );
  }

  Widget menuItem(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
    );
  }
}
