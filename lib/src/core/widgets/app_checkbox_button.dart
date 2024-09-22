import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String? text;
  final bool isError;
  final bool isDisabled;

  const CustomCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.text,
    this.isError = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: isDisabled ? null : () => onChanged?.call(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getIcon(),
          if (text != null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                text!,
                style: TextStyle(
                  color: isDisabled
                      ? const Color(0xFFD2D2D2)
                      : const Color(0xFF090909),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _getIcon() {
    if (isDisabled) {
      return SvgPicture.asset("assets/icons/checkbox-seleced-filled.svg");
    }
    if (value) {
      return SvgPicture.asset("assets/icons/checkbox-seleced-filled.svg");
    }
    return   SvgPicture.asset("assets/icons/checkbox-unselected.svg");
  }
}
