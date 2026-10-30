import 'package:flutter/material.dart';

class StepIndecator extends StatefulWidget {
  const StepIndecator({super.key});

  @override
  State<StepIndecator> createState() => _StepIndecatorState();
}

class _StepIndecatorState extends State<StepIndecator> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Step ${currentStep + 1}of 2",
          style: Theme.of(context).textTheme.bodyLarge!,
        ),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
