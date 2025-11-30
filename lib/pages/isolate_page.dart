import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

class IsolatePage extends StatefulWidget {
  const IsolatePage({Key? key}) : super(key: key);

  @override
  State<IsolatePage> createState() => _IsolatePageState();
}

class _IsolatePageState extends State<IsolatePage> {
  bool loading = false;
  String? result;
  double progress = 0;

  // Hàm chạy ở isolate khác
  static BigInt tinhGiaiThua(int n) {
    BigInt kq = BigInt.one;
    for (int i = 1; i <= n; i++) {
      kq *= BigInt.from(i);
    }
    return kq;
  }

  Future<void> batDauTinh() async {
    setState(() {
      loading = true;
      result = null;
      progress = 0;
    });

    // Giả lập progress (vì compute không báo tiến trình)
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(Duration(milliseconds: 300));
      setState(() {
        progress = i / 5;
      });
    }

    // Tính factorial bằng isolate
    BigInt output = await compute(tinhGiaiThua, 30000);

    setState(() {
      loading = false;
      result = output.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bài 5 - Isolate factorial")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: loading ? null : batDauTinh,
              child: Text("Tính 30,000!"),
            ),
            SizedBox(height: 20),

            if (loading) ...[
              LinearProgressIndicator(value: progress),
              SizedBox(height: 10),
              Text("Đang tính... ${(progress * 100).toInt()}%"),
            ],

            SizedBox(height: 15),

            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  result ?? "Chưa có kết quả",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
