import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/app_bar_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
               const SizedBox(height: 16,),
              ProductSearchBar(controller: _searchBarController),
              const SizedBox(height: 16,),
              CarouselSlider(
                options: CarouselOptions(height:200, viewportFraction: 0.95),
                items: [1,2,3,4,5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(
                              color: AppColors.themeColor,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          alignment: Alignment.center,
                          child: Text('text $i', style: TextStyle(fontSize: 16.0,color: Colors.white),)
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navBarAppLogoSvg),
      actions: [
        AppBarIconButton(
          icon: Icons.person,
          onTab: () {},
        ),
        const SizedBox(
          width: 6,
        ),
        AppBarIconButton(
          icon: Icons.call,
          onTab: () {},
        ),
        const SizedBox(
          width: 6,
        ),
        AppBarIconButton(
          icon: Icons.notifications_active_outlined,
          onTab: () {},
        ),
      ],
    );
  }
}


