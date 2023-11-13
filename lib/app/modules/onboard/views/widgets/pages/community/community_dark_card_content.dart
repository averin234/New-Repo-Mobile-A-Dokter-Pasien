import 'package:flutter/material.dart';

import '../../../../../login/views/constants.dart';

class CommunityDarkCardContent extends StatelessWidget {
  const CommunityDarkCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(top: kPaddingL),
          child: Icon(
            Icons.brush,
            color: kWhite,
            size: 32.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: kPaddingL),
          child: Icon(
            Icons.camera_alt,
            color: kWhite,
            size: 32.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: kPaddingL),
          child: Icon(
            Icons.straighten,
            color: kWhite,
            size: 32.0,
          ),
        ),
      ],
    );
  }
}
