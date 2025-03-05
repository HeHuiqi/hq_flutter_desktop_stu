import 'package:flutter/material.dart';

class HqSliderWidget extends StatefulWidget {
  final void Function(double rate)? onChange;
  final double width;
  final double height;
  final double trackWidth;
  final double rate;
  final double trackBorderWidth;
  final double backgroundBorderWidth;
  final Color progerssColor;
  final Color trackColor;
  final Color trackBorderColor;
  final Color backgroundColor;
  final Color backgroundBorderColor;

  const HqSliderWidget({
    super.key,
    this.width = 100.0,
    this.height = 4.0,
    this.rate = 0.0,
    this.trackWidth = 13.0,
    this.trackBorderWidth = 1.0,
    this.trackColor = Colors.blue,
    this.trackBorderColor = Colors.white,
    this.progerssColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.backgroundBorderColor = Colors.blue,
    this.backgroundBorderWidth = 1.0,
    this.onChange,
  });

  @override
  State<HqSliderWidget> createState() => _HqSliderWidgetState();
}

class _HqSliderWidgetState extends State<HqSliderWidget> {
  double _value = 0.0;
  double maxWidth = 100.0;
  double height = 4.0;
  double trackWidth = 13.0;

  late double marginTopAndBottom;
  @override
  initState() {
    height = widget.height;
    trackWidth = widget.trackWidth;
    maxWidth = widget.width;
    if (widget.width < 50) {
      maxWidth = 50;
    }
    if (height > trackWidth) {
      height = trackWidth / 2.0;
    }
    marginTopAndBottom = (trackWidth - height) / 2;
    _value = widget.rate * maxWidth;
    super.initState();
  }

  Widget _buildBody() {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        print("开始滑动");
      },
      onHorizontalDragUpdate: (details) {
        double delta = details.delta.dx;
        _value += delta;
        _value = _value.clamp(0.0, maxWidth);
        print("滑动距离: $_value");
        widget.onChange?.call(_value / maxWidth);
        setState(() {});
      },
      onHorizontalDragEnd: (details) {
        print("结束滑动");
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: marginTopAndBottom,
                bottom: marginTopAndBottom,
                left: trackWidth / 2.0,
                right: trackWidth / 2.0),
            child: Container(
              height: height,
              width: maxWidth,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(height / 2.0),
                border: Border.all(
                    color: widget.backgroundBorderColor,
                    width: widget.backgroundBorderWidth),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: marginTopAndBottom,
                bottom: marginTopAndBottom,
                left: trackWidth / 2.0,
                right: trackWidth / 2.0),
            child: Container(
              height: height,
              width: _value,
              decoration: BoxDecoration(
                color: widget.progerssColor,
                borderRadius: BorderRadius.circular(height / 2.0),
              ),
            ),
          ),
          Positioned(
            left: _value.clamp(0, maxWidth),
            child: Container(
              height: trackWidth,
              width: trackWidth,
              decoration: BoxDecoration(
                color: widget.trackBorderColor,
                borderRadius: BorderRadius.circular(trackWidth / 2.0),
                border: Border.all(
                    color: widget.trackColor, width: widget.trackBorderWidth),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();

    // return LayoutBuilder(builder: (context, constraints) {
    //   maxWidth = constraints.maxWidth - trackWidth;
    //   print("maxWidth: $maxWidth");
    //   return _buildBody();
    // });
  }
}
