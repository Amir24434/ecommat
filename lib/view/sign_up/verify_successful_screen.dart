import 'package:ecommat/component/custom_button.dart';
import 'package:ecommat/component/custom_text.dart';
import 'package:ecommat/theme/theme/theme/constants/colors.dart';
import 'package:ecommat/view/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifySuccessfulScreen extends StatefulWidget {
  const VerifySuccessfulScreen({super.key});

  @override
  State<VerifySuccessfulScreen> createState() => _VerifySuccessfulScreenState();
}

class _VerifySuccessfulScreenState extends State<VerifySuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundColor: OrderitColors.greenBackground,
                radius: 70,
                foregroundColor: Colors.white,
                child: Icon(
                  Icons.check,
                  size: 90,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomText(
              text: 'Successful',
              fontWeight: FontWeight.bold,
              size: 18,
              color: OrderitColors.textGreen,
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomText(
              text:
                  'Your account has been created successfully, \nyou can continue as customer, vendor or rider.',
              fontWeight: FontWeight.normal,
              size: 12,
              color: OrderitColors.dark,
            ),
            const SizedBox(
              height: 60,
            ),
            CustomButton(
              color: OrderitColors.greenBackground,
              textColor: const TextStyle(color: OrderitColors.light),
              text: 'Continue',
              onPressed: () {
                Get.off(const SignInScreen());
              },
            ),
          ],
        ),
      )),
    );
  }
}
