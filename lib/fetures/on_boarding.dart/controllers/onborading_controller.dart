import 'package:flutter/material.dart';
import 'package:flycode/fetures/auth/presentation/views/register_user.dart';
import 'package:flycode/fetures/on_boarding.dart/models/onboarding_model.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  PageController controllerPage = PageController();

  RxList<OnboardingModel> listOnboarding = <OnboardingModel>[
    OnboardingModel(
      title: 'Crea y comparte tus propios descuentos',
      description: 'Gestiona la disponibilidad de todos tus cupones.',
      pathIcon: 'lib/utils/assets/onb1.svg',
    ),
    OnboardingModel(
      title: 'Forma alianzas con otros negocios',
      description: 'Tendrás más y mejores beneficios para tus clientes.',
      pathIcon: 'lib/utils/assets/onb1.svg',
    ),
    OnboardingModel(
      title: 'Crea y comparte tus propios descuentos',
      description: 'Gestiona la disponibilidad de todos tus cupones.',
      pathIcon: 'lib/utils/assets/onb1.svg',
    ),
  ].obs;

  RxString imageBackgroundSelected = 'lib/utils/assets/onb1.svg'.obs;

  //medoto para avanzar de pagina

  setNextPage() {
    if (controllerPage.page! + 1 == listOnboarding.length) {
      Get.to(() => const RegisterUserPage());
      return;
    }

    controllerPage.animateToPage(
      controllerPage.page!.toInt() + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }
}
