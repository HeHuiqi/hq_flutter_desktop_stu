import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/widgets/hq_border_button.dart';

class HqShopTypeSlected extends StatefulWidget {
  final List<String> items;
  final String title;
  const HqShopTypeSlected({
    super.key,
    required this.title,
    required this.items,
  });
  @override
  State<HqShopTypeSlected> createState() => _HqShopTypeSlectedState();
}

class _HqShopTypeSlectedState extends State<HqShopTypeSlected> {
  int selectIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Text(
            widget.title,
          ),
        ),
        SizedBox(
          width: 380,
          child: GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            mainAxisSpacing: 8,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 0.5,
            children: List.generate(widget.items.length, (index) {
              return HqBorderButton(
                  borderColor: Colors.black,
                  slectedBorderColor: Colors.blue,
                  onPressed: () {
                    setState(() {
                      if (selectIndex == index) {
                        selectIndex = -1;
                        return;
                      }
                      selectIndex = index;
                    });
                  },
                  isSelected: index == selectIndex,
                  child: Text(
                    widget.items[index],
                  ));
            }),
          ),
        ),
      ],
    );
  }
}
