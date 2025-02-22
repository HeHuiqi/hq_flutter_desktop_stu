import 'package:flutter/material.dart';

class HqBorderButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color? foregroundColor;
  final Color? selectForegroundColor = Colors.blue;

  final Size? size;
  final double? borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Color? slectedBorderColor;
  final Widget? child;
  final EdgeInsets? padding;
  final double? margin;
  bool isSelected;
  HqBorderButton(
      {super.key,
      required this.onPressed,
      this.isSelected = false,
      this.foregroundColor,
      this.borderRadius,
      this.borderWidth = 1,
      this.borderColor = Colors.blue,
      this.child,
      this.padding,
      this.margin,
      this.size,
      this.slectedBorderColor});

  @override
  State<HqBorderButton> createState() => _HqBorderButtonState();
}

class _HqBorderButtonState extends State<HqBorderButton> {
  Color get showBorderColor => widget.isSelected
      ? widget.slectedBorderColor ?? widget.borderColor
      : widget.borderColor;
  Color get showForegroundColor => widget.isSelected
      ? widget.selectForegroundColor ?? Colors.blue
      : widget.foregroundColor ?? Colors.blue;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          widget.onPressed();
          setState(() {
            widget.isSelected = !widget.isSelected;
            print('widget.isSelected: ${widget.isSelected}');
          });
        },
        style: ButtonStyle(
          // 设置按钮的前景颜色（文本和图标颜色）
          foregroundColor: WidgetStateProperty.all(showBorderColor),
          // 设置按钮的最小尺寸
          minimumSize: WidgetStateProperty.all(widget.size ?? Size(0, 0)),
          // 设置按钮的内边距
          padding:
              WidgetStateProperty.all(widget.padding ?? EdgeInsets.all(15)),
          // 设置按钮的形状为圆角矩形
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                side: BorderSide(
                    color: showBorderColor, width: widget.borderWidth)),
          ),
        ),
        child: widget.child);
  }
}
