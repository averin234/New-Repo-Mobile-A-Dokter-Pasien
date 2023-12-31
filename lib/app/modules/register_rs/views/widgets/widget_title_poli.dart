import 'package:flutter/material.dart';
import 'package:adokter/app/data/componen/my_style.dart';

class WidgetTitlePoli extends StatefulWidget {
  const WidgetTitlePoli({Key? key}) : super(key: key);

  @override
  _WidgetTitlePoliState createState() => _WidgetTitlePoliState();
}

class _WidgetTitlePoliState extends State<WidgetTitlePoli> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: Row(
        children: [
          Expanded(
            child:
                Text("List Antrean Poliklink", style: MyStyle.textTitleBlack),
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
