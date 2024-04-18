import 'package:awoke_learning_app/core/constants/fonts.dart';
import 'package:awoke_learning_app/features/onboarding/presentation/onboarding_data.dart';
import 'package:awoke_learning_app/features/onboarding/presentation/providers/onboardingdot_provider.dart';
import 'package:awoke_learning_app/features/onboarding/presentation/screens/onboarding_content.dart';
import 'package:awoke_learning_app/features/onboarding/presentation/widgets/dot_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingdotProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Consumer<OnboardingdotProvider>(
              builder: (context, dotprovider, _) {
                return Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: demodata.length,
                        itemBuilder: (context, index) {
                          return OnBoardingContent(
                            image: demodata[index].image,
                            title: demodata[index].title,
                            description: demodata[index].description,
                          );
                        },
                        onPageChanged: (index) =>
                            dotprovider.updateIndex(index),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            demodata.length,
                            (index) => Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: DotIndicator(
                                  isActive: index == dotprovider.currentIndex),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Next",
                          style: TextStyle(fontFamily: buttonText.toString()),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
