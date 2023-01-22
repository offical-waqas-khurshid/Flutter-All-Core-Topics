import 'package:flutter/material.dart';
import 'package:flutter_hero_habibi/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child:
            Hero(tag: product.title, child: Image.asset(product.imagePath)),
          ),
          Column(
            children: [
              Text(product.title, style: Theme.of(context).textTheme.headline1),
              Text(product.price.toString(),
                  style: Theme.of(context).textTheme.headline2),
              Text(product.description!,
                  style: Theme.of(context).textTheme.headline3),
            ],
          )
        ],
      ),
    );
  }
}
