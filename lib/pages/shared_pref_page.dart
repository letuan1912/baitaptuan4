import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefPage extends StatefulWidget {
  const SharedPrefPage({super.key});
  @override
  _SharedPrefPageState createState() => _SharedPrefPageState();
}

class _SharedPrefPageState extends State<SharedPrefPage> {
  TextEditingController nameCtrl = TextEditingController();
  String? showName;

  saveName() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", nameCtrl.text);
  }

  getName() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      showName = prefs.getString("username");
    });
  }

  clearData() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove("username");
    setState(() {
      showName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bài 3 - Shared Preferences")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(labelText: "Nhập tên"),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: saveName, child: Text("Lưu")),
            ElevatedButton(onPressed: getName, child: Text("Hiển Thị")),
            ElevatedButton(onPressed: clearData, child: Text("Xóa")),
            SizedBox(height: 20),
            Text(showName ?? "Chưa có dữ liệu"),
          ],
        ),
      ),
    );
  }
}
