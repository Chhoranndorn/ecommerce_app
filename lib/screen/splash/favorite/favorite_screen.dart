import 'package:ecommerce_app/utils/light.dart';
import 'package:flutter/material.dart';

class TechFavCard extends StatelessWidget {
  const TechFavCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text(
                "Favourites",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: SizedBox(
                  height: 120,
                  child: Row(
                    children: [
                      Image.network(
                        "https://cdn.ttgtmedia.com/rms/onlineimages/fitbit_sense_mobile.jpg",
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    "Smart Watch",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_rounded,
                                      color: kPrimaryClr,
                                      size: 30,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MaterialButton(
                                  color: kPrimaryClr,
                                  onPressed: () {},
                                  child: const Text(
                                    "View more",
                                    style: TextStyle(color: kWhiteClr),
                                  ),
                                ),
                                const Text(
                                  "Out of Stock",
                                  style: TextStyle(color: ksecondaryClr),
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
