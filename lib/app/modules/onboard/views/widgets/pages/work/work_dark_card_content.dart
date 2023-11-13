import 'package:flutter/material.dart';

import '../../../../../login/views/constants.dart';

class WorkDarkCardContent extends StatelessWidget {
  const WorkDarkCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.person_pin,
              color: kWhite,
              size: 32.0,
            ),
          ],
        ),
        SizedBox(height: kSpaceM),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.person,
              color: kWhite,
              size: 32.0,
            ),
            Icon(
              Icons.group,
              color: kWhite,
              size: 32.0,
            ),
            Icon(
              Icons.insert_emoticon,
              color: kWhite,
              size: 32.0,
            ),
          ],
        ),
      ],
    );
  }
}
