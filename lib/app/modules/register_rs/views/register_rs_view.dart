// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pluitcare/app/modules/register_rs/views/widgets/cari_dokter.dart';
import 'package:pluitcare/app/modules/register_rs/views/widgets/dropdown_kecamatan.dart';
import 'package:pluitcare/app/modules/register_rs/views/widgets/dropdown_kota.dart';
import 'package:pluitcare/app/modules/register_rs/views/widgets/nospesialisasi.dart';
import 'package:pluitcare/app/modules/shammer/shimmer_listview.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluitcare/app/data/componen/fetch_data.dart';
import 'package:pluitcare/app/data/model/regist_rs/all_dokter_klinik.dart';
import 'package:pluitcare/app/modules/register_rs/controllers/register_rs_controller.dart';
import 'package:pluitcare/app/modules/register_rs/views/widgets/widget_dropdownListExample.dart';
import 'package:pluitcare/app/modules/register_rs/views/widgets/widget_listview_poli.dart';
import 'package:pluitcare/app/modules/register_rs/views/widgets/widget_title_poli2.dart';
import 'package:search_page/search_page.dart';
import '../../../data/componen/my_font_size.dart';

class RegisterRsView extends GetView<RegisterRsController> {
  const RegisterRsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDBF6FD),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: const FlexibleSpaceBar(
                // background: Image.asset(
                //   'assets/images/frame1.png',
                //   fit: BoxFit.cover,
                // ),
                ),
            automaticallyImplyLeading: true,
            floating: true,
            pinned: true,
            snap: true,
            stretch: true,
            leading: IconButton(
                icon: const Icon(Icons.arrow_circle_left_rounded),
                color: Color(0xff00AFC1),
                iconSize: 40,
                onPressed: () {
                  Get.back();
                }),
            title: Text(
              "Pilih Poli",
              style: GoogleFonts.nunito(
                  fontSize: MyFontSize.large1, fontWeight: FontWeight.bold),
            ),
            actions: [],
            bottom: AppBar(
              backgroundColor: const Color(0xffDBF6FD),
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Column(
                children: [
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        'Pilih Klinik Terdekat',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(child: DropDownKota()),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: DropDownkecamatan()),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const WidgetTitlePoli2(),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff6f9fe),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text('Daftar Dokter Spesialisasi',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(child: DropDownListExample()),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(child: CariDokter()),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          return FutureBuilder(
                            future: API.getAllDokterKlinik(
                                filter: controller.namaBagian.value),
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.connectionState !=
                                      ConnectionState.waiting &&
                                  snapshot.data != null) {
                                GetAllDokterKlinik getAllDokterKlinik =
                                    snapshot.data ?? GetAllDokterKlinik();
                                return Column(
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                                    duration: const Duration(milliseconds: 475),
                                    childAnimationBuilder: (widget) =>
                                        SlideAnimation(
                                      child: FadeInAnimation(
                                        child: widget,
                                      ),
                                    ),
                                    children: getAllDokterKlinik.items != null
                                        ? getAllDokterKlinik.items!.map((e) {
                                            return CardListViewPoli(
                                              items: e,
                                              isNoHome: controller.isNoHome,
                                            );
                                          }).toList()
                                        : [const CardNoSpesialisasi()],
                                  ),
                                );
                              } else {
                                return SizedBox(
                                  height: Get.height - 250,
                                  child: const Center(
                                      child: shimmerListViewPoli()),
                                );
                              }
                            },
                          );
                        }),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
