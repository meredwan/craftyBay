import 'package:crafty_bay/features/product/ui/screen/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: 1);
      },
      child: SizedBox(
        width: 140,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(
                      16,
                    ),
                  ),
                  color: AppColors.themeColor.withOpacity(0.15),
                ),
                child: Image.asset(
                  'assets/images/nike_shoes.png',
                  width: 140,
                ),
              ),
              Column(
                children: [
                  Text(
                    maxLines: 1,
                    'New Year Special Shoes',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$100",
                      style: TextStyle(color: AppColors.themeColor),
                    ),
                    Wrap(
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                        ),
                        Text("4.8"),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        size: 18,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
