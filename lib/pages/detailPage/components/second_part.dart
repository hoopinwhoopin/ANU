import 'package:aun/pages/cartPage/cart_part.dart';
import 'package:aun/widgets/my_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../appColors/app_colors.dart';
import '../../../route/routing_page.dart';

class SecondPart extends StatelessWidget {
  final String productName;
  final double productPrice;
  final double productOldPrice;
  final int productRate;
  final String productDescription;
  final String productId;
  final String productImage;
  final String productCategory;
  const SecondPart({
    Key? key,
    required this.productCategory,
    required this.productImage,
    required this.productId,
    required this.productDescription,
    required this.productName,
    required this.productPrice,
    required this.productOldPrice,
    required this.productRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text("\Rs$productPrice"),
              const SizedBox(
                width: 20,
              ),
              Text(
                "\Rs$productOldPrice",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.Kgradient1,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        productRate.toString(),
                        style: const TextStyle(
                          color: AppColors.KwhiteColor,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "50 Reviews",
                    style: TextStyle(
                      color: AppColors.Kgradient1,
                    ),
                  )
                ],
              ),
              const Divider(
                thickness: 2,
              ),
            ],
          ),
          const Text(
            "Description",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            productDescription,
            style: const TextStyle(),
          ),
          MyButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("cart")
                  .doc(FirebaseAuth.instance.currentUser?.uid)
                  .collection("userCart")
                  .doc(productId)
                  .set(
                {
                  "productId": productId,
                  "productImage": productImage,
                  "productName": productName,
                  "productPrice": productPrice,
                  "productOldPrice": productPrice,
                  "productRate": productRate,
                  "productDescription": productDescription,
                  "productQuantity": 1,
                  "productCategory": productCategory,
                },
              );
              RoutingPage.goTonext(
                context: context,
                navigateTo: const CartPage(),
              );
            },
            text: "Add to Cart",
          ),
        ],
      ),
    );
  }
}
