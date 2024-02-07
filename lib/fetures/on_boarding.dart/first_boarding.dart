import 'package:flutter/gestures.dart';
import 'package:flycode/fetures/on_boarding.dart/controllers/onborading_controller.dart';
import 'package:flycode/fetures/on_boarding.dart/widgets/on_board_tile.dart';
import 'package:flycode/utils/anim/delayed_reveal.dart';
import 'package:flycode/widgets/background_image_blur.dart';
import 'package:flycode/widgets/button_next.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

import '../../utils/colors/fl_colors.dart';
import '../../widgets/logo_section.dart';

class FirstBoarding extends StatefulWidget {
  const FirstBoarding({super.key});

  @override
  State<FirstBoarding> createState() => _FirstBoardingState();
}

class _FirstBoardingState extends State<FirstBoarding> {
  OnboardingController boarding = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: FlColors.primaryColorsBackground,
        body: SafeArea(
          child: Stack(
            children: [
              BackgroundImageBlur(
                pathIcon: boarding.imageBackgroundSelected.value,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const LogoSection(
                        withOmit: true,
                      ),
                      SizedBox(
                        height: Get.height / 1.5,
                        child: PageView.builder(
                          controller: boarding.controllerPage,
                          itemCount: boarding.listOnboarding.length,
                          dragStartBehavior: DragStartBehavior.down,
                          itemBuilder: (context, index) {
                            return DelayedReveal(
                              delay: const Duration(milliseconds: 300),
                              child: OnBoardCard(
                                title: boarding.listOnboarding[index].title,
                                descrption:
                                    boarding.listOnboarding[index].description,
                                pathIcon:
                                    boarding.listOnboarding[index].pathIcon,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SmoothPageIndicator(
                              controller: boarding.controllerPage,
                              count: boarding.listOnboarding.length,
                              axisDirection: Axis.horizontal,
                              effect: WormEffect(
                                radius: 6,
                                dotHeight: 10,
                                dotWidth: 20,
                                activeDotColor: Colors.white,
                                dotColor: Colors.white.withOpacity(0.25),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ButtonNext(
                              title: 'Siguiente',
                              onPressed: () {
                                boarding.setNextPage();
                              },
                              load: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
