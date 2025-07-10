import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/controller/product_controller.dart';
import 'package:provider_api/screens/product_details.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late ProductController productController;
  @override
  void initState() {
    productController = context.read<ProductController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productController.getProductList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Consumer<ProductController>(
        builder: (context, controller, child) {
          return controller.productList.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = controller.productList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: InkWell(
                        onTap: () {
                          controller.selectedProductDetails(data);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetails(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Image.network(
                                data.images?.firstOrNull ?? "",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name : ${data.title ?? ""}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  Text("Price: ${data.price ?? 0.0} Rs"),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
