import 'package:doctor_appointment/features/auth/pages/demo_settings.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<StatefulWidget> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() async {
    if (pageController.page! < 2.0) {
      await pageController.animateToPage(
        pageController.page!.ceil() + 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      moveon();
    }
  }

  void moveon() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => DemoSettingsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                _OnboardingPageContent(
                  page: 1,
                  header: "Meet Doctors Online",
                  desc:
                      "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.",
                ),
                _OnboardingPageContent(
                  page: 2,
                  header: "Connect with Specialists",
                  desc:
                      "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.",
                ),
                _OnboardingPageContent(
                  page: 3,
                  header: "Thousands of Online Specialists",
                  desc:
                      " Explore a Vast Array of Online Medical Specialists, Offering an Extensive Range of Expertise Tailored to Your Healthcare Needs.",
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          SizedBox(
            height: 48,
            width: 311,
            child: FilledButton(onPressed: nextPage, child: const Text("Next")),
          ),
          SizedBox(height: 29),
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: ExpandingDotsEffect(
              dotWidth: 8,
              dotHeight: 8,
              expansionFactor: 4,
              spacing: 6,
            ),
          ),
          SizedBox(height: 24),
          GestureDetector(
            onTap: moveon,
            child: Text("Skip", style: TextTheme.of(context).bodyMedium),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _OnboardingPageContent extends StatelessWidget {
  final int page;
  final String header;
  final String desc;

  const _OnboardingPageContent({
    required this.page,
    required this.header,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/onboarding-$page.png"),
        SizedBox(height: 29),
        Text(
          header,
          style: TextStyle(
            color: Color(0xFF374151),
            fontSize: 18,
            fontWeight: .w700,
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: 311,
          child: Text(
            desc,
            textAlign: .center,
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 14,
              fontWeight: .w400,
            ),
          ),
        ),
      ],
    );
  }
}
