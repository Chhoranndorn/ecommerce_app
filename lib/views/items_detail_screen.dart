import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';

import '../models/app_model.dart';

class ItemsDetailScreen extends StatefulWidget {
  final AppModel? eCommerceItems;
  const ItemsDetailScreen({super.key, required this.eCommerceItems});

  @override
  State<ItemsDetailScreen> createState() => _ItemsDetailScreenState();
}

class _ItemsDetailScreenState extends State<ItemsDetailScreen> {
  int currentindex = 0;
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: fbackgroundColor2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Detail Product",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Stack(
            children: [
              const Icon(
                Icons.shopping_bag,
                size: 28,
                color: Colors.black,
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
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: fbackgroundColor2,
            height: size.height * 0.46,
            width: size.width,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentindex = value;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Hero(
                      tag: widget.eCommerceItems!.image,
                      child: Image.asset(
                        widget.eCommerceItems!.image,
                        height: size.height * 0.4,
                        width: size.width * 0.85,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                            3,
                            (index) => AnimatedContainer(
                                  duration: const Duration(microseconds: 300),
                                  margin: const EdgeInsets.only(right: 4),
                                  width: 7,
                                  height: 7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: index == currentindex
                                          ? Colors.blue
                                          : Colors.grey.shade400),
                                ))
                      ],
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "H&M",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black26),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 17,
                    ),
                    Text(
                      "(${widget.eCommerceItems!.review})",
                      style: const TextStyle(color: Colors.black26),
                    ),
                    const Spacer(),
                    const Icon(Icons.favorite_border_rounded)
                  ],
                ),
                Text(
                  widget.eCommerceItems!.name,
                  maxLines: 1,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16, height: 1.5),
                ),
                Row(
                  children: [
                    Text(
                      "\$${widget.eCommerceItems!.price.toString()}.00",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          height: 1.5,
                          color: Colors.pink),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (widget.eCommerceItems!.isCheck == true)
                      Text(
                        "\$${widget.eCommerceItems!.price + 255}.00",
                        style: const TextStyle(
                            color: Colors.black26,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.black26),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "$myDescription1 ${widget.eCommerceItems!.name}$myDescription2",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                      letterSpacing: -.5),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Color",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.eCommerceItems!.fcolor
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                final int index = entry.key;
                                final color = entry.value;
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 10),
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: color,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedColorIndex = index;
                                        });
                                      },
                                      child: Icon(
                                        Icons.check,
                                        color: selectedColorIndex == index
                                            ? Colors.white
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(), // Convert Iterable to List
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Size",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.eCommerceItems!.size
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                final int index = entry.key;
                                final String size = entry.value;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSizeIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 10),
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: selectedSizeIndex == index
                                            ? Colors.black
                                            : Colors.white,
                                        border: Border.all(
                                            color: selectedSizeIndex == index
                                                ? Colors.black
                                                : Colors.black12)),
                                    child: Center(
                                      child: Text(
                                        size,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: selectedSizeIndex == index
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(), // Convert Iterable to List
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 0,
        label: SizedBox(
          width: size.width * 0.9,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "ADD TO CART",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: -1,
                      ),
                    )
                  ],
                ),
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                color: Colors.black,
                child: const Center(
                  child: Text(
                    "BUY NOW",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
