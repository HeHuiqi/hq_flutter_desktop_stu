import 'package:flutter/material.dart';

class HqShopNumberOp extends StatefulWidget {
  final void Function(int ct)? onChanged;
  const HqShopNumberOp({super.key, this.onChanged});

  @override
  State<HqShopNumberOp> createState() => _HqShopNumberOpState();
}

class _HqShopNumberOpState extends State<HqShopNumberOp> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: 60,
        child: Text(
          '数量:',
        ),
      ),
      SizedBox(
          width: 150,
          height: 45,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        if (count <= 1) {
                          return;
                        }
                        setState(() {
                          count--;
                          widget.onChanged?.call(count);
                        });
                      },
                      icon: Icon(Icons.remove)),
                  Text('$count'),
                  IconButton(
                      onPressed: () {
                        if (count == 100) {
                          return;
                        }
                        setState(() {
                          count++;
                          widget.onChanged?.call(count);
                        });
                      },
                      icon: Icon(Icons.add)),
                ]),
          )),
    ]);
  }
}
