import 'package:crafty_bay/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  static const String name = '/product-list-screen';

  const ProductListScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Text(widget.categoryName),
      ),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: 3),
        itemBuilder: (context, index) {
          return FittedBox(child: ProductItemWidget());
        },
      ),
    );
  }
}
