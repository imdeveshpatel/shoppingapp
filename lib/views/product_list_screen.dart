import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/views/product_details.dart';
import '../network_service/api_provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  get productItem => null;

  get products => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products",
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: ApiProvider().getRequestMethod(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var resultdata = snapshot.data as List<Product>;
                return listview(resultdata);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Widget listview(List<Product> productlist) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          children: List.generate(productlist.length, (index) {
            return Center(
                child: Column(
              children: [
                Column(
                  children: [
                    Card(
                      elevation: 8,
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Productdetails(
                                            product: productlist[index],
                                          )));
                            },
                            child: Container(
                              height: 180,
                              width: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      NetworkImage(productlist[index].image!),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.6),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      "${productlist[index].title}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "\$.${productlist[index].price}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: FavoriteButton(valueChanged: () {}),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 200,
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 25,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ),
                  ],
                ),
              ],
            ));
          }),
        ),
      ),
    );
  }
}
