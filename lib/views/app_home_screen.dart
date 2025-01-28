import 'package:ecommerce_app/models/app_model.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/views/category_item_new.dart';
import 'package:ecommerce_app/views/items_detail_screen.dart';
import 'package:ecommerce_app/widget/banner.dart';
import 'package:ecommerce_app/widget/curated_items.dart';
import 'package:flutter/material.dart';

class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/twitter.png",
                    height: 40,
                  ),
                  Stack(
                    children: [
                      const Icon(
                        Icons.shopping_bag,
                        size: 28,
                      ),
                      Positioned(
                        right: -3,
                        top: -5,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: const Text(
                            "3",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const MyBanner(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop By Category",
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Sell All",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 0, color: Colors.black45),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  category.length,
                  (index) => InkWell(
                    onTap: () {
                      final filterItems = fashionEcommerceApp
                          .where((item) =>
                              item.category.toLowerCase() ==
                              category[index].name.toLowerCase())
                          .toList();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CategoryItemsNew(
                                    category: category[index].name,
                                    categoryItems: filterItems,
                                  )));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: fbackgroundColor1,
                            backgroundImage: AssetImage(category[index].image),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(category[index].name),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Curated For You",
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Sell All",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 0, color: Colors.black45),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(fashionEcommerceApp.length, (index) {
                  final eCommerceItems = fashionEcommerceApp[index];
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.symmetric(horizontal: 20)
                        : const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ItemsDetailScreen(
                                      eCommerceItems: eCommerceItems,
                                    )));
                      },
                      child: CuratedItems(
                          eCommerceItems: eCommerceItems, size: size),
                    ),
                  );
                }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Curated For You",
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Sell All",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 0, color: Colors.black45),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(fashionEcommerceApp.length, (index) {
                  final eCommerceItems = fashionEcommerceApp[index];
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.symmetric(horizontal: 20)
                        : const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ItemsDetailScreen(
                                      eCommerceItems: eCommerceItems,
                                    )));
                      },
                      child: CuratedItems(
                          eCommerceItems: eCommerceItems, size: size),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
