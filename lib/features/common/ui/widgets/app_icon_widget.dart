import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/assets_path.dart';



class AppIconWidget extends StatelessWidget {
  const AppIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsPath.appLogoSvg,
      width: 100,
    );
  }
}
