import 'package:ecommerce_app/models/app_model.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/views/items_detail_screen.dart';
import 'package:ecommerce_app/views/sub_category.dart';
import 'package:flutter/material.dart';

class CategoryItemsNew extends StatelessWidget {
  final String category;
  final List<AppModel> categoryItems;

  const CategoryItemsNew(
      {super.key, required this.category, required this.categoryItems});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5),
                        hintText: "$category's Fashion",
                        hintStyle: const TextStyle(color: Colors.black38),
                        filled: true,
                        fillColor: fbackgroundColor2,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black38,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    filterCategory.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(filterCategory[index]),
                            const SizedBox(width: 5),
                            index == 0
                                ? const Icon(
                                    Icons.filter_list,
                                    size: 15,
                                  )
                                : const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 15,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  subCategory.length,
                  (index) => InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: fbackgroundColor1,
                            backgroundImage:
                                AssetImage(subCategory[index].image),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(subCategory[index].name),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          categoryItems.isEmpty
              ? const Center(
                  child: Text(
                    "No items available in this category.",
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                )
              : Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: categoryItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final item = categoryItems[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ItemsDetailScreen(
                                eCommerceItems: item,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: item.image,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: fbackgroundColor2,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(item.image),
                                  ),
                                ),
                                height: size.height * 0.25,
                                width: size.width * 0.5,
                                child: const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.black26,
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "H&M",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black26,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 17,
                                    ),
                                    Text(
                                      "(${item.review})",
                                      style: const TextStyle(
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: size.width * 0.5,
                                  child: Text(
                                    item.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$${item.price.toString()}.00",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        height: 1.5,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    if (item.isCheck == true)
                                      Text(
                                        "\$${item.price + 255}.00",
                                        style: const TextStyle(
                                          color: Colors.black26,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.black26,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
