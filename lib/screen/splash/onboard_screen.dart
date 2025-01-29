import 'package:ecommerce_app/models/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'dashboard_screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomPaint(
            painter: ArcPaint(),
            child: SizedBox(
              height: size.height / 1.35,
              width: size.width,
            ),
          ),
          // for lottie animation file
          Positioned(
            top: 220,
            right: 0,
            left: 0,
            child: Image.network(
              onboardingItems[currentIndex].lottieURL,
              width: 500,
              alignment: Alignment.topCenter,
              fit: BoxFit.contain, // Adjust as needed
            ),
          ),

          // for scrolling
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 270,
              child: Column(
                children: [
                  Flexible(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: onboardingItems.length,
                      itemBuilder: (context, index) {
                        final items = onboardingItems[index];
                        return Column(
                          children: [
                            Text(
                              items.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 50),
                            Text(
                              items.subtitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        );
                      },
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                    ),
                  ),
                  // dot indicator
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int index = 0;
                          index < onboardingItems.length;
                          index++)
                        dotIndicator(isSelected: index == currentIndex),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentIndex < onboardingItems.length - 1) {
            // Move to the next page
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
            );
          } else {
            // Navigate to AppMainScreen when on the last page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AppMainScreen()),
            );
          }
        },
        elevation: 0,
        backgroundColor: Colors.white,
        child: const Icon(Icons.arrow_forward_ios, color: Colors.black),
      ),
    );
  }

  Widget dotIndicator({required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: AnimatedContainer(
        duration: const Duration(microseconds: 500),
        height: isSelected ? 8 : 6,
        width: isSelected ? 8 : 6,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.black26,
        ),
      ),
    );
  }
}

class ArcPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path orangeArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 175)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - 175)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(orangeArc, Paint()..color = Colors.orange);

    Path whiteArc = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(0.0, size.height - 180)
      ..quadraticBezierTo(
          size.width / 2, size.height - 60, size.width, size.height - 180)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(
      whiteArc,
      Paint()..color = const Color.fromARGB(255, 144, 202, 249),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
