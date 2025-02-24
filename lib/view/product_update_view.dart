import 'package:flutter/material.dart';
import 'package:flutter_machine_test_products/utils/colors.dart';
import 'package:flutter_machine_test_products/widgets/custom_button.dart';

class ProductUpdateView extends StatelessWidget {
  const ProductUpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/login.png',
                height: 300,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'product.name',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'product.description',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹123',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.darkPrimary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          spacing: 5,
                          children: [
                            Text(
                              '4.3',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 18,
                              color: AppColors.whiteColor,
                            ),
                          ],
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
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(
                  'Product Details',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Essence Mascara Lash Princess',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDetailRow("Category", "Beauty"),
                        buildDetailRow("Brand", "Essence"),
                        buildDetailRow("Price", "\$9.99 (7.17% Off)"),
                        buildDetailRow("Stock", "5 (Low Stock)"),
                        buildDetailRow("Rating", "4.94 ⭐"),
                        buildDetailRow("Weight", "2g"),
                        buildDetailRow(
                            "Dimensions", "23.17 x 14.43 x 28.01 cm"),
                        buildDetailRow("Warranty", "1 Month"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CustomcoloredButton(
                height: 60,
                width: double.infinity,
                text: 'Buy Now',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              value,
              style: TextStyle(
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
