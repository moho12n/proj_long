import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final double size;
  final Function(bool status) onChange;
  final double borderRadius;
  final Color color;

  const CustomCheckbox(
      {Key key,
      this.value = false,
      this.size = 17.0,
      this.onChange,
      this.borderRadius,
      this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (onChange != null) onChange(!value);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60.0),
            border:
                Border.all(color: color, style: BorderStyle.solid, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                color: value ? color : Colors.white,
                borderRadius: BorderRadius.circular(60.0),
                border:
                    Border.all(color: value ? color : Colors.white, width: 10),
              ),
            ),
          ),
        ));
  }
}