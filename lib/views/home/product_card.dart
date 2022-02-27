import 'package:flutter/material.dart';
import 'package:tiles/models/Product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Card(
            elevation: 2.0,
            margin: const EdgeInsets.only(top: 10.0,bottom: 10.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue.shade50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex:3,child: Image.network(product.productImage)),
                  Expanded(flex:1,child: Text(product.productName,textAlign: TextAlign.center,)),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Card(
                color: Colors.yellow.shade800,
                margin: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 20.0,
                  child: Center(
                    child: Text("Earn ${product.pointsToEarn}"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
