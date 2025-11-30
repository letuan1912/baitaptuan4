import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> dsTen = [
      "Tuan Dep Trai",
      "Le Anh Tuan",
      "Nguyen Huy Hoang",
      "Tuan Khi Cu Chi",
      "Xuan Bach",
      "ADC"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Bài 1 - ListView"),
      ),
      body: ListView.builder(
        itemCount: dsTen.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text(dsTen[i]),
          );
        },
      ),
    );
  }
}
