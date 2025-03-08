import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepIndicator({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalSteps,
        (index) => _buildStepDot(index + 1, currentStep),
      ),
    );
  }

  Widget _buildStepDot(int stepNumber, int currentStep) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Container(
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: stepNumber == currentStep ? kPrimaryColor : kGreyColor,
          ),
        ),
      ),
    );
  }
}
