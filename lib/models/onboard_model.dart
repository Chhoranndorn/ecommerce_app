class OnboardingModel {
  final String lottieURL;
  final String title;
  final String subtitle;

  OnboardingModel(this.lottieURL, this.title, this.subtitle);
}

// List<OnboardingModel> onboardingItems = [
//   OnboardingModel('assets/shirt.png', 'Start Journey',
//       'When you make a journey , \nyou travel from one to another \n place to enjoy'),
//   OnboardingModel('assets/shirt.png', 'Start Journey',
//       'When you make a journey , \nyou travel from one to another \n place to enjoy'),
//   OnboardingModel('assets/shirt.png', 'Start Journey',
//       'When you make a journey , \nyou travel from one to another \n place to enjoy'),
// ];
// List<OnboardingModel> onboardingItems = [
//   OnboardingModel(
//       'https://lottiefiles.com/free-animation/man-riding-a-red-scooter-zwiwXT7kC5',
//       'Start Journey',
//       'When you make a journey , \nyou travel from one to another \n place to enjoy'),
//   OnboardingModel(
//       'https://lottiefiles.com/free-animation/delivery-guy-dw0XLXmJy1',
//       'Start Journey',
//       'When you make a journey , \nyou travel from one to another \n place to enjoy'),
//   OnboardingModel(
//       'https://lottiefiles.com/free-animation/delivery-guy-waiting-at-the-doorstep-XO3D7xwMH4',
//       'Start Journey',
//       'When you make a journey , \nyou travel from one to another \n place to enjoy'),
// ];

List<OnboardingModel> onboardingItems = [
  OnboardingModel(
      'https://assets9.lottiefiles.com/packages/lf20_yourjsonfile1.json',
      'Start Journey',
      'When you make a journey , \nyou travel from one to another \n place to enjoy'),
  OnboardingModel(
      'https://assets9.lottiefiles.com/packages/lf20_yourjsonfile2.json',
      'Fast Delivery',
      'Get your orders delivered quickly \nand safely to your doorstep'),
  OnboardingModel(
      'https://assets9.lottiefiles.com/packages/lf20_yourjsonfile3.json',
      'Enjoy Shopping',
      'Discover and buy your favorite \nproducts with ease'),
];
