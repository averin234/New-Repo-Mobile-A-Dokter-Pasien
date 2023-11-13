import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:adokter/app/modules/shammer/shimmer_rmr.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adokter/app/data/componen/fetch_data.dart';
import 'package:adokter/app/modules/home/views/widgets/widget_cardnoantriant.dart';
import 'package:adokter/app/modules/riwayat_medis/controllers/riwayat_medis_controller.dart';
import 'package:adokter/app/modules/riwayat_medis/views/widgets/widget_listview_riwayat.dart';
import 'package:adokter/app/modules/riwayat_medis/views/widgets/widget_title_riwayat2.dart';
import 'package:adokter/app/modules/riwayat_medis/views/widgets/widget_title_riwayat3.dart';
import '../../../data/componen/my_font_size.dart';

class RiwayatMedisView extends GetView<RiwayatMedisController> {
  const RiwayatMedisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDBF6FD),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 1,
            floating: true,
            pinned: true,
            snap: true,
            stretch: true,
            leading: IconButton(
                icon: const Icon(Icons.arrow_circle_left_rounded),
                color: const Color(0xff00AFC1),
                iconSize: 40,
                onPressed: () {
                  Get.back();
                }),
            title: Text(
              "Riwayat Medis",
              style: GoogleFonts.nunito(
                  fontSize: MyFontSize.large1, fontWeight: FontWeight.bold),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              const WidgetTitleRiwayat2(),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: const Color(0xfff6f9fe),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFe0e0e0).withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(2, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const WidgetTitleRiwayat3(),
                        Obx(() {
                          return FutureBuilder(
                              future: API.getListMr(
                                noKtp: controller.dataRegist.value.noKtp!,
                                tgl: controller.date.value,
                              ),
                              builder: (context, snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.connectionState !=
                                        ConnectionState.waiting &&
                                    snapshot.data != null) {
                                  final data = snapshot.data!;
                                  return Column(
                                    children:
                                        AnimationConfiguration.toStaggeredList(
                                      duration:
                                          const Duration(milliseconds: 475),
                                      childAnimationBuilder: (widget) =>
                                          SlideAnimation(
                                        child: FadeInAnimation(
                                          child: widget,
                                        ),
                                      ),
                                      children: data.res != null
                                          ? data.res!
                                              .map(
                                                (e) => CardListViewRiawayat(
                                                    res: e),
                                              )
                                              .toList()
                                          : [const CardNoAntrian()],
                                    ),
                                  );
                                } else {
                                  return const Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      shimmerRMR(),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      shimmerRMR(),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      shimmerRMR(),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      shimmerRMR(),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      shimmerRMR(),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      shimmerRMR(),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  );
                                }
                              });
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

// Search Page
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Cari Dokter/Spesialisasi',
                border: InputBorder.none),
          ),
        ),
      )),
    );
  }
}
