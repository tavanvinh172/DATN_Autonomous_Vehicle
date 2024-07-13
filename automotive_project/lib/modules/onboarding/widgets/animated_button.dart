import 'package:automotive_project/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    super.key,
    required this.controller,
    required this.action,
  });

  final OnboardingController controller;
  final VoidCallback action;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            RiveAnimation.asset('assets/RiveAssets/button.riv', controllers: [controller.animationController],),
            const Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.arrow_right),
                  SizedBox(width: 8,),
                  Text(
                    "Start the course",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
