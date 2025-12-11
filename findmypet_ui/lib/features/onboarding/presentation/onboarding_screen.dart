import 'package:findmypet/features/onboarding/presentation/infoscreen1.dart';
import 'package:findmypet/features/onboarding/presentation/infoscreen2.dart';
import 'package:findmypet/features/onboarding/presentation/infoscreen3.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  final List<Widget> _buildPages = const [
    Infoscreen1(),
    Infoscreen2(),
    Infoscreen3(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) => setState(() {
          _currentPage = value;
        }),
        children: _buildPages,
      ),
    );
  }
}
