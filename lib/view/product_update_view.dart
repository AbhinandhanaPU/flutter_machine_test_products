import 'package:flutter/material.dart';
import 'package:flutter_machine_test_products/controllers/single_product_controller.dart';
import 'package:flutter_machine_test_products/utils/colors.dart';
import 'package:flutter_machine_test_products/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ProductUpdateView extends StatefulWidget {
  final int productId;
  const ProductUpdateView({super.key, required this.productId});

  @override
  State<ProductUpdateView> createState() => _ProductUpdateViewState();
}

class _ProductUpdateViewState extends State<ProductUpdateView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<SingleProductController>(context, listen: false)
            .fetchProduct(widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<SingleProductController>(
        builder: (context, productController, child) {
          if (productController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (productController.product == null) {
            return const Center(child: Text("Failed to load product"));
          }

          final product = productController.product!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    product.images.first,
                    height: 300,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹${product.price}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.darkPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '${product.rating} ⭐',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 10,
                  color: AppColors.lightGrey,
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: const Text(
                      'Product Details',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          product.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildDetailRow("Category", product.category),
                            buildDetailRow("Brand", product.brand),
                            buildDetailRow("Price", "₹${product.price}"),
                            buildDetailRow("Stock", "${product.stock}"),
                            buildDetailRow("Rating", "${product.rating} ⭐"),
                            buildDetailRow("Weight", '${product.weight}'),
                            buildDetailRow(
                                "Warranty", product.warrantyInformation),
                            buildDetailRow(
                                "return Policy", product.returnPolicy),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: CustomcoloredButton(
                    height: 60,
                    width: double.infinity,
                    text: 'Buy Now',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
