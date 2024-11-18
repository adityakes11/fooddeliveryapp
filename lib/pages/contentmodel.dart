import 'package:lottie/lottie.dart';

class UnboardingContent {
  String animationPath;
  String title;
  String description;

  UnboardingContent({required this.description, required this.animationPath, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description: 'Pick your food from our menu\nMore than 35 items',
      title: 'Select from Our\nBest Menu',
      animationPath: 'assets/animations/Screen1.json' // Replace with actual Lottie JSON file path
  ),
  UnboardingContent(
      description: 'You can pay cash on delivery and\nCard payment is available',
      title: 'Easy and Online Payment',
      animationPath: 'assets/animations/Screen2.json' // Replace with actual Lottie JSON file path
  ),
  UnboardingContent(
      description: 'Deliver your food at your Doorstep',
      title: 'Quick Delivery at Your Doorstep',
      animationPath: 'assets/animations/Screen3.json' // Replace with actual Lottie JSON file path
  ),
];