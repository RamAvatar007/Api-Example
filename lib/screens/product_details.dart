import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/controller/product_controller.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<ProductController>(
        builder: (BuildContext context, controller, Widget? child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.5,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    height: 200.0,
                  ),
                  items: controller.selectedProduct?.images?.map((i) {
                    return Image.network(i, fit: BoxFit.fill);
                  }).toList(),
                ),
                SizedBox(height: 10),
                Text(
                  controller.selectedProduct?.title ?? '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Price : ${controller.selectedProduct?.price?.toString() ?? '0.00'} Rs',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Text(controller.selectedProduct?.description ?? ''),
                SizedBox(height: 10),
                Divider(),
                Divider(),
                SizedBox(height: 10),
                Text(
                  "Categories:-",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: Image.network(
                    controller.selectedProduct?.category?.image ?? "",
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Category Name : ${controller.selectedProduct?.category?.name ?? ''}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
