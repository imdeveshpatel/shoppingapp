import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_model.dart';

class Productdetails extends StatelessWidget {
  final Product? product;

  const Productdetails({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product!.image!),
              ),
            ),
          ),
          Positioned(
            bottom: 01,
            left: 1,
            right: 1,
            child: Container(
              height: 200,
              width: 450,
              color: Colors.black.withOpacity(.4),
              child: Center(
                child: Text(
                  "${product?.description}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            child: SizedBox(
              height: 130,
              width: 435,
              child: Center(
                child: Text(
                  "${product?.category}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
