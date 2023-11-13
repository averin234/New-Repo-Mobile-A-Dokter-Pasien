import 'package:flutter/material.dart';

import '../../text_column.dart';

class CommunityTextColumn extends StatelessWidget {
  const CommunityTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Rumah Sakit Pluit',
      text:
          'Menjadikan RS Pluit sebagai RS yang bermutu dan menjadi pilihan masyarakat.',
    );
  }
}
