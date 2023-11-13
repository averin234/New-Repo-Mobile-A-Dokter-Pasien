import 'package:flutter/material.dart';
import 'package:adokter/app/data/componen/my_style.dart';

class WidgetTitleRiwayat extends StatefulWidget {
  const WidgetTitleRiwayat({Key? key}) : super(key: key);

  @override
  _WidgetTitleRiwayatState createState() => _WidgetTitleRiwayatState();
}

class _WidgetTitleRiwayatState extends State<WidgetTitleRiwayat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: Row(
        children: [
          Expanded(
            child: Text("Riwayat Poliklinik", style: MyStyle.textTitleBlack),
          ),
          const SizedBox(
            width: 10,
          ),
          // Text(
          //   "Details",
          //   textAlign: TextAlign.center,
          //   style: GoogleFonts.nunito(
          //     color: MyColors.blackText,
          //     fontSize: MyFontSize.medium1,
          //   ),
          // ),
          const SizedBox(
            width: 10,
          ),
          // Icon(Icons.arrow_forward_ios_outlined, size: 15,)
        ],
      ),
    );
  }
}
