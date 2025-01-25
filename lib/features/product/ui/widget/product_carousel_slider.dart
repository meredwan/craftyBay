import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/assets_path.dart';
import 'package:flutter/material.dart';

import '../../../../../app/app_colors.dart';

class ProductCarouselSlider extends StatefulWidget {
  const ProductCarouselSlider({
    super.key,
  });

  @override
  State<ProductCarouselSlider> createState() => _ProductCarouselSliderState();
}

class _ProductCarouselSliderState extends State<ProductCarouselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        options: CarouselOptions(
          height: 220,
          viewportFraction: 0.95,
          onPageChanged: (currentIndex, reason) {
            _selectedIndex.value = currentIndex;
          },
        ),
        items: [1, 2, 3, 4, 5].map(
          (i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  // child: Image.asset(AssetsPath.navBarAppLogoSvg),
                );
              },
            );
          },
        ).toList(),
      ),
      Positioned(
        bottom: 8,
        left: 0,
        right: 0,
        child: ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    height: 15,
                    width: 15,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        shape: BoxShape.circle,
                        color:
                            value == i ? AppColors.themeColor : Colors.white),
                  )
              ],
            );
          },
        ),
      ),
    ]);
  }
}
