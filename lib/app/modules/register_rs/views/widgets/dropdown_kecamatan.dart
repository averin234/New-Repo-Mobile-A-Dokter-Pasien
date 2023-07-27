import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adokter/app/data/componen/fetch_data.dart';
import 'package:adokter/app/data/model/homepage/poli.dart';
import 'package:adokter/app/modules/register_rs/controllers/register_rs_controller.dart';

import '../../../../data/model/list_data.dart';


class DropDownkecamatan extends StatefulWidget {
  const DropDownkecamatan({
    Key? key,
  }) : super(key: key);

  @override
  _DropDownkecamatanState createState() => _DropDownkecamatanState();
}

class _DropDownkecamatanState extends State<DropDownkecamatan> {
  final TextEditingController _cityTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
              future: API.getProvinsi(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState != ConnectionState.waiting &&
                    snapshot.data != null) {
                  final data = snapshot.data!;
                  return AppTextField(
                    textEditingController: _cityTextEditingController,
                    hint: "Kecamatan",
                    isCitySelected: true,
                    lists: data.list!,
                    title: '',
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}

/// This is Common App textfiled class.
class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<Lists> lists;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    required this.lists,
    Key? key,
  }) : super(key: key);

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    final controller = Get.put(RegisterRsController());
    showModalBottomSheet<void>(
      enableDrag: true,
      showDragHandle: true,
      context: Get.context!,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Column(
          children: [
            Expanded(
              child: ListView(
                children: lists
                    .map(
                      (e) => TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 20)),
                        child: Text(
                          e.nama!,
                          style: GoogleFonts.nunito(
                            fontSize: 17.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        onPressed: () {
                          textEditingController.text = e.nama!;
                          controller.provinsi.value = e.kode!;
                          Get.back();
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(String message) {
    Get.snackbar(title, message);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          readOnly: true,
          controller: textEditingController,
          cursorColor: Colors.black,
          onTap: onTextFieldTap,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon: const Icon(
              Icons.arrow_drop_down_circle,
              color: Color(0xff00AFC1),
            ),
            contentPadding:
                const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 10),
            hintText: hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
