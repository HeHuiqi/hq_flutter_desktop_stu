import 'package:flutter/material.dart';

class HqButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? size;
  final double? borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final Widget? child;
  final EdgeInsets? padding;
  final double? margin;
  const HqButton(
      {super.key,
      required this.onPressed,
      this.backgroundColor,
      this.foregroundColor,
      this.borderRadius,
      this.borderWidth = 0,
      this.borderColor,
      this.child,
      this.padding,
      this.margin,
      this.size});

  @override
  State<HqButton> createState() => _HqButtonState();
}

class _HqButtonState extends State<HqButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          // 设置按钮的背景颜色
          backgroundColor:
              WidgetStateProperty.all(widget.backgroundColor ?? Colors.blue),
          // 设置按钮的前景颜色（文本和图标颜色）
          foregroundColor:
              WidgetStateProperty.all(widget.foregroundColor ?? Colors.white),
          // 设置按钮的最小尺寸
          minimumSize: WidgetStateProperty.all(widget.size ?? Size(0, 0)),
          // 设置按钮的内边距
          padding:
              WidgetStateProperty.all(widget.padding ?? EdgeInsets.all(15)),
          // 设置按钮的形状为圆角矩形
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
              side: widget.borderWidth > 0
                  ? BorderSide(
                      color: widget.borderColor ?? Colors.blue,
                      width: widget.borderWidth)
                  : BorderSide.none,
            ),
          ),
        ),
        child: widget.child);
  }
}
