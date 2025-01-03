import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/common/controllers/main_bottom_nav_controllers.dart';
import 'package:crafty_bay/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../widgets/app_bar_icon_button.dart';
import '../../../common/ui/widgets/category_item_widget.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/home_section_header.dart';
import '../../../common/ui/widgets/product_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProductSearchBar(controller: _searchBarController),
              const SizedBox(height: 16),
              HomeCarouselSlider(),

              /// All Categories
              const SizedBox(height: 16),
              HomeSectionHeader(
                  title: 'All Categories',
                  onTap: () {
                    Get.find<MainBottomNavControllers>().moveToCategories();
                  }),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getCategoryWidget(),
                ),
              ),

              /// Popular Item
              HomeSectionHeader(title: "Popular", onTap: () {}),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductListWidget(),
                ),
              ),

              ///Special Item
              const SizedBox(height: 16),
              HomeSectionHeader(title: "Special", onTap: () {}),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductListWidget(),
                ),
              ),

              /// New Item
              const SizedBox(height: 16),
              HomeSectionHeader(title: "New", onTap: () {}),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getProductListWidget()),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryWidget() {
    List<Widget> CategoryList = [];
    for (int i = 0; i < 10; i++) {
      CategoryList.add(
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: CategoryItemWidget(),
        ),
      );
    }
    return CategoryList;
  }

  List<Widget> _getProductListWidget() {
    List<Widget> ProductList = [];
    for (int i = 0; i < 10; i++) {
      ProductList.add(
        Padding(
          padding: EdgeInsets.all(8),
          child: ProductItemWidget(),
        ),
      );
    }
    return ProductList;
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
