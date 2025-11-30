import 'dart:async';
import 'package:flutter/material.dart';

class AsyncPage extends StatefulWidget {
  const AsyncPage({Key? key}) : super(key: key);

  @override
  State<AsyncPage> createState() => _AsyncPageState();
}

class _AsyncPageState extends State<AsyncPage> {
  String text = "Nhấn nút để tải user";
  bool loading = false;
  int countdown = 3;
  Timer? timer;

  void startLoad() {
    setState(() {
      loading = true;
      countdown = 3;
      text = "Đang tải user...";
    });

    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        countdown--;
      });

      if (countdown == 0) {
        timer?.cancel();
        finishLoad();
      }
    });
  }

  void finishLoad() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        loading = false;
        text = "User loaded successfully!";
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bài 4 - Async nâng cao")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: TextStyle(fontSize: 18)),

            SizedBox(height: 20),

            // Loading animation + countdown
            if (loading) ...[
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text("Còn lại: $countdown giây"),
            ],

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: loading ? null : startLoad,
              child: Text("Bắt đầu tải"),
            )
          ],
        ),
      ),
    );
  }
}
