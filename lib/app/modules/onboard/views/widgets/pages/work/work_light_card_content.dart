import 'package:flutter/material.dart';

import '../../../../../login/views/constants.dart';
import '../../icon_container.dart';

class WorkLightCardContent extends StatelessWidget {
  const WorkLightCardContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        const IconContainer(
          icon: Icons.event_seat,
          padding: kPaddingS,
        ),
        IconContainer(
          icon: Icons.business_center,
          padding: kPaddingM,
        ),
        IconContainer(
          icon: Icons.assessment,
          padding: kPaddingS,
        ),
      ],
    );
  }
}
