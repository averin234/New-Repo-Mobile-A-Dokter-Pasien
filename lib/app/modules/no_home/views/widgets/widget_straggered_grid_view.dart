import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adokter/app/data/componen/my_colors.dart';
import 'package:adokter/app/data/componen/my_font_size.dart';
import 'package:adokter/app/routes/app_pages.dart';
import 'custom_card.dart';

class WidgetStraggeredGridView extends StatelessWidget {
  const WidgetStraggeredGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          CustomCard(
            onTap: () {
              Get.toNamed(Routes.REGISTER_RS, arguments: true);
            },
            shadow: false,
            shadowBlur: 0,
            width: double.infinity,
            bgColor: MyColors.white,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCard(
                  shadow: false,
                  height: 50,
                  width: 50,
                  borderRadius: BorderRadius.circular(100),
                  child: Center(
                    child: SvgPicture.asset("assets/images/regis.svg"),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Register \nRS",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    color: MyColors.blackText,
                    fontSize: MyFontSize.small3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          CustomCard(
            onTap: () => showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (context) => buildSheet(),
            ),
            shadow: false,
            shadowBlur: 0,
            width: double.infinity,
            bgColor: MyColors.white,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 50,
                    borderRadius: BorderRadius.circular(100),
                    child: Center(
                      child: SvgPicture.asset("assets/images/antri.svg"),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Daftar \nAntrian",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    color: MyColors.blackText,
                    fontSize: MyFontSize.small3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          CustomCard(
            onTap: () => showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (context) => buildSheet(),
            ),
            shadow: false,
            shadowBlur: 0,
            width: double.infinity,
            bgColor: MyColors.white,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 50,
                    borderRadius: BorderRadius.circular(100),
                    child: Center(
                      child: SvgPicture.asset("assets/images/riwayat.svg"),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Riwayat \nMedis",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    color: MyColors.blackText,
                    fontSize: MyFontSize.small3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          CustomCard(
            onTap: () => showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (context) => buildSheet(),
            ),
            shadow: false,
            shadowBlur: 0,
            width: double.infinity,
            bgColor: MyColors.white,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 50,
                    borderRadius: BorderRadius.circular(100),
                    child: Center(
                      child: SvgPicture.asset("assets/images/profile.svg"),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Profile \nPasien",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    color: MyColors.blackText,
                    fontSize: MyFontSize.small3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSheet() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  const Text(
                      "Anda Belum Terdaftar atau Login di Aplikasi A-Dokter",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                      "Silahkan daftar atau Login untuk bisa melakukan registrasi untuk mengunakan A-Dokter",
                      style: TextStyle(color: Colors.black45, fontSize: 15),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/login_sukses.png",
                    gaplessPlayback: true,
                    fit: BoxFit.fitHeight,
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 70, left: 10, top: 20),
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.blue,
                            ),
                            child: const Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Cancel",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 10, left: 10, top: 20),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.LOGIN),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.greenAccent,
                            ),
                            child: const Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Login / Regist",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}
