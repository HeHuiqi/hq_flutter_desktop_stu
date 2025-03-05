import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

//https://blog.csdn.net/gzx110304/article/details/134069921
class HqDropDownCustomPage extends StatelessWidget {
  TDDropdownMenu _buildDownSimple(BuildContext context) {
    return TDDropdownMenu(
      direction: TDDropdownMenuDirection.auto,
      onMenuOpened: (value) {
        print('打开第$value个菜单');
      },
      onMenuClosed: (value) {
        print('关闭第$value个菜单');
      },
      items: [
        TDDropdownItem(
          options: [
            TDDropdownItemOption(label: '全部产品', value: 'all', selected: true),
            TDDropdownItemOption(label: '最新产品', value: 'new'),
            TDDropdownItemOption(label: '最火产品', value: 'hot'),
          ],
          onChange: (value) {
            print('选择：$value');
          },
        ),
        TDDropdownItem(
          options: [
            TDDropdownItemOption(
                label: '默认排序', value: 'default', selected: true),
            TDDropdownItemOption(label: '价格从高到低', value: 'price'),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下拉菜单"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: 375,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 44,
              margin:
                  const EdgeInsetsDirectional.only(top: 30, start: 30, end: 30),
              color: Colors.red,
              child: Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      showPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 400,
                              decoration:
                                  const BoxDecoration(color: Colors.yellow),
                              child: SingleChildScrollView(
                                physics: const ClampingScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: List<Widget>.generate(29, (index) {
                                    int itemIndex = index ~/ 2;
                                    if (index.isEven) {
                                      return Container(
                                        height: 44,
                                        alignment: AlignmentDirectional.center,
                                        child: Text("item$itemIndex"),
                                      );
                                    } else {
                                      return Container(
                                        height: 1,
                                        color: Colors.grey,
                                      );
                                    }
                                  }),
                                ),
                              ),
                            );
                          });
                    },
                  );
                },
              ),
            ),
            _buildDownSimple(context),
          ],
        ),
      ),
    );
  }
}

showPopup(
    {required BuildContext context,
    required WidgetBuilder builder,
    double? elevation,
    Color? shadowColor,
    Duration animationDuration = const Duration(milliseconds: 200)}) {
  final RenderBox button = context.findRenderObject()! as RenderBox;
  final RenderBox overlay =
      Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;

  Offset offset = Offset(0.0, button.size.height);

  RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      button.localToGlobal(offset, ancestor: overlay),
      button.localToGlobal(button.size.bottomRight(Offset.zero) + offset,
          ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );

  Navigator.of(context).push(_CustomPopupRoute(
      position: position,
      builder: builder,
      elevation: elevation,
      shadowColor: shadowColor,
      animationDuration: animationDuration,
      barrierLabel:
          MaterialLocalizations.of(context).modalBarrierDismissLabel));
}

class _CustomPopupRoute<T> extends PopupRoute<T> {
  final WidgetBuilder builder;
  final RelativeRect position;
  final double? elevation;
  final Color? shadowColor;
  @override
  final String? barrierLabel;
  final Duration animationDuration;

  _CustomPopupRoute(
      {required this.builder,
      required this.position,
      required this.barrierLabel,
      this.elevation,
      this.shadowColor,
      Duration? animationDuration})
      : animationDuration =
            animationDuration ?? const Duration(milliseconds: 200),
        super(traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop);

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => animationDuration;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    EdgeInsets padding = MediaQuery.paddingOf(context);
    final CurveTween heightFactorTween =
        CurveTween(curve: const Interval(0.0, 1.0));
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      child: CustomSingleChildLayout(
        delegate: _CustomPopupRouteLayout(position, padding),
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Material(
                child: _HeightFactorBox(
              heightFactor: heightFactorTween.evaluate(animation),
              child: child,
            ));
          },
          child: builder(context),
        ),
      ),
    );
  }
}

class _CustomPopupRouteLayout extends SingleChildLayoutDelegate {
  final RelativeRect position;
  EdgeInsets padding;
  double childHeightMax = 0;

  _CustomPopupRouteLayout(this.position, this.padding);

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    Size buttonSize = position.toSize(constraints.biggest);

    double constraintsWidth = buttonSize.width;
    double constraintsHeight = max(
        position.top - buttonSize.height - padding.top - kToolbarHeight,
        constraints.biggest.height - position.top - padding.bottom);

    return BoxConstraints.loose(Size(constraintsWidth, constraintsHeight));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double x = position.left;
    double y = position.top;
    final double buttonHeight = size.height - position.top - position.bottom;
    double constraintsHeight = max(
        position.top - buttonHeight - padding.top - kToolbarHeight,
        size.height - position.top - padding.bottom);
    if (position.top + constraintsHeight > size.height - padding.bottom) {
      y = position.top - childSize.height - buttonHeight;
    }

    return Offset(x, y);
  }

  @override
  bool shouldRelayout(covariant _CustomPopupRouteLayout oldDelegate) {
    return position != oldDelegate.position || padding != oldDelegate.padding;
  }
}

class _RenderHeightFactorBox extends RenderShiftedBox {
  double _heightFactor;
  _RenderHeightFactorBox({
    RenderBox? child,
    double? heightFactor,
  })  : _heightFactor = heightFactor ?? 1.0,
        super(child);

  double get heightFactor => _heightFactor;

  set heightFactor(double value) {
    if (_heightFactor == value) {
      return;
    }
    _heightFactor = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    final BoxConstraints constraints = this.constraints;

    if (child == null) {
      size = constraints.constrain(Size.zero);
      return;
    }

    child!.layout(constraints, parentUsesSize: true);

    size = constraints.constrain(Size(
      child!.size.width,
      child!.size.height,
    ));

    child!.layout(
        constraints.copyWith(
            maxWidth: size.width, maxHeight: size.height * heightFactor),
        parentUsesSize: true);

    size = constraints.constrain(Size(
      child!.size.width,
      child!.size.height,
    ));
  }
}

class _HeightFactorBox extends SingleChildRenderObjectWidget {
  final double? heightFactor;

  const _HeightFactorBox({
    super.key,
    this.heightFactor,
    super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderHeightFactorBox(heightFactor: heightFactor);

  @override
  void updateRenderObject(
      BuildContext context, _RenderHeightFactorBox renderObject) {
    renderObject.heightFactor = heightFactor ?? 1.0;
  }
}
