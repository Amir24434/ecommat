import "package:ecommat/component/custom_button.dart";
import "package:ecommat/const.dart";
import "package:ecommat/theme/theme/theme/constants/colors.dart";
import "package:ecommat/theme/theme/theme/constants/image_strings.dart";
import "package:ecommat/view/onboarding/onboarding_controller/onboarding_controller.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const Image(
              fit: BoxFit.fill,
              image: AssetImage(OrderitImages.onBoardingImage1),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                OrderitOnboardingTexts.onBoardingTitle1,
                style: GoogleFonts.manrope(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                OrderitOnboardingTexts.onBoardingSubtitle1,
                style: GoogleFonts.manrope(
                    fontSize: 18, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
          child: CustomButton(
              color: OrderitColors.greenBackground,
              text: 'Continue',
              textColor: const TextStyle(
                color: OrderitColors.light,
                fontWeight: FontWeight.bold,
              ),
              onPressed: () => OnboardingController.instance.nextPage()),
        ),
      ],
    );
  }
}
