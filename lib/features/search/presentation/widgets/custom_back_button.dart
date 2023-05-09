import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: SizedBox(
              width: 24,
              child: SvgPicture.asset(
                "assets/icons/arrow-right.svg",
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
