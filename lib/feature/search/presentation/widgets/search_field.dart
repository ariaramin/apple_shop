import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String) onChange;

  const SearchField({
    super.key,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 14,
        bottom: 18,
        top: 18,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/search.svg"),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextField(
                    onChanged: onChange,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'جستجوی محصول مورد نظر...',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
