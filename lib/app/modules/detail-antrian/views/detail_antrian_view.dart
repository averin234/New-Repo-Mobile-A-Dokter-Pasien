import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adokter/app/modules/detail-antrian/views/widgets/card_ticket_antrian.dart';

import '../../../data/componen/my_font_size.dart';
import '../controllers/detail_antrian_controller.dart';

class DetailAntrianView extends GetView<DetailAntrianController> {
  const DetailAntrianView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f9fe),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            stretch: true,
            leading: IconButton(
                icon: const Icon(Icons.arrow_circle_left_rounded),
                color: Colors.blue,
                iconSize: 40,
                onPressed: () {
                  Get.back();
                }),
            title: Text(
              "Detail Antrean",
              style: GoogleFonts.nunito(
                  fontSize: MyFontSize.large1, fontWeight: FontWeight.bold),
            ),
            actions: const [
              // IconButton(
              //     onPressed: () => Navigator.of(context)
              //         .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              //     icon: const Icon(Icons.search))
            ],
            bottom: AppBar(
              toolbarHeight: 0,
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => ScaleAnimation(
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                    children: <Widget>[
                      const CardTicketAntrian(),
                    ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
