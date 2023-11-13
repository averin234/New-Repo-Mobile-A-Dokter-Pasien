import 'package:flutter/material.dart';

import '../../text_column.dart';

class WorkTextColumn extends StatelessWidget {
  const WorkTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Rumah Sakit Pluit',
      text: 'Meningkatkan kepuasan pasien dan kesejahteraan karyawan.',
    );
  }
}
