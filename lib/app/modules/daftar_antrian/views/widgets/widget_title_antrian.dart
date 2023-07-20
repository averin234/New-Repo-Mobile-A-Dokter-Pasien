import 'package:flutter/material.dart';
import 'package:pluitcare/app/data/componen/my_style.dart';

class WidgetTitleAntrian extends StatelessWidget {
  final String msg;
  const WidgetTitleAntrian({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff4babe7),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Penting !!",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17)),
            SizedBox(
              height: 5,
            ),
            Text(
                "Pasin Tidak Terdaftar di Klinik, Harap membawa KTP Saat datang ke Klinik Guna Melakukan Verifikasi",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14)),
            Text(msg),
          ],
        ),
      ),
    );
  }
}
