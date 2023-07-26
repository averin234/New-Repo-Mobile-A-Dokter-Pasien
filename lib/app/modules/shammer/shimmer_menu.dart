import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adokter/app/data/componen/my_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../data/componen/my_font_size.dart';
import '../home/views/widgets/custom_card.dart';

class ShimmerMenu extends StatelessWidget {
  const ShimmerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 355),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Shimmer(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 100,
                    width: 95,
                    decoration: BoxDecoration(
                      color: Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
                Shimmer(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 100,
                    width: 95,
                    decoration: BoxDecoration(
                      color: Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
                Shimmer(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 100,
                    width: 95,
                    decoration: BoxDecoration(
                      color: Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Shimmer(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 100,
                    width: 95,
                    decoration: BoxDecoration(
                      color: Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
                Shimmer(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 100,
                    width: 95,
                    decoration: BoxDecoration(
                      color: Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
                Shimmer(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 100,
                    width: 95,
                    decoration: BoxDecoration(
                      color: Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
