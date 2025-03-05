import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/hq_drop_down_menu/hq_drop_down_menu.dart';
import 'package:hq_flutter_desktop_stu/plain_content/hq_rounded_rect_slider_track_shape.dart';
import 'package:hq_flutter_desktop_stu/plain_content/hq_slider_thum_shape.dart';
import 'package:hq_flutter_desktop_stu/widgets/hq_button.dart';
import 'package:hq_flutter_desktop_stu/widgets/hq_slider_widget.dart';

class HqPlainContent extends StatefulWidget {
  final String title;
  const HqPlainContent({super.key, required this.title});

  @override
  State<HqPlainContent> createState() => _HqPlainContentState();
}

class _HqPlainContentState extends State<HqPlainContent> {
  String desc = '稳定版本是经过充分测试、拥有最少漏洞和最佳性能的版本。虽然该版本不一定是最新的，但我们确保它与每个。。。的主要更新兼容。';
  int versinonIndex = 0;
  double sliderValue = 0;
  Widget _content() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                // 'assets/images/airbus_a302.jpg',
                'assets/images/msfs2020.png',
                // fit: BoxFit.fitHeight,
              ),
              Container(
                  padding: EdgeInsets.only(top: 16, left: 26),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 24),
                  )),
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        // color: Colors.red,
                        margin: EdgeInsets.only(
                          left: 27,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '选择版本',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          bottom: versinonIndex == 0
                                              ? BorderSide(width: 1)
                                              : BorderSide.none)),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.only(
                                      left: 0,
                                    ),
                                    title: Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text('稳定版')),
                                    subtitle: Text(
                                      '2023年10月10日',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        versinonIndex = 0;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          bottom: versinonIndex == 1
                                              ? BorderSide(width: 1)
                                              : BorderSide.none)),
                                  width: 180,
                                  child: ListTile(
                                    title: Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text('开发板')),
                                    subtitle: Text(
                                      '2023年10月10日',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        versinonIndex = 1;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text(
                                '版本描述',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                '$desc',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      width: 2,
                      height: 350,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 27, right: 27),
                      // color: Colors.red,
                      width: 320,
                      height: 350,
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  left: 25, right: 25, top: 13, bottom: 13),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withAlpha(80),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'FROM',
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        HqDropDownMenu(
                                          leading: ImageIcon(
                                            AssetImage(
                                                'assets/images/rect_icon.png'),
                                            color: Colors.blue,
                                          ),
                                          trailing: SizedBox(
                                            // color: Colors.red,
                                            width: 18,
                                            height: 40,
                                            child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                  color: Colors.blue,
                                                  child: Icon(
                                                    Icons
                                                        .arrow_downward_rounded,
                                                    size: 18,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                          ),
                                          data: const [
                                            {'label': '上海', 'value': '1'},
                                            {'label': '北京', 'value': '2'},
                                            {'label': '广州', 'value': '3'},
                                            {'label': '深圳', 'value': '4'},
                                            {'label': '杭州', 'value': '5'},
                                            {'label': '成都', 'value': '6'},
                                            {'label': '武汉', 'value': '7'},
                                          ],
                                          selectCallBack: (value) {
                                            print('选中的value是：$value');
                                          },
                                          offset: const Offset(0, 30),
                                        ),
                                      ]),
                                  SizedBox(
                                    height: 13,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'TO',
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        HqDropDownMenu(
                                          leading: ImageIcon(
                                            AssetImage(
                                                'assets/images/rect_icon.png'),
                                            color: Colors.blue,
                                          ),
                                          trailing: SizedBox(
                                            // color: Colors.red,
                                            width: 18,
                                            height: 40,
                                            child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                  color: Colors.blue,
                                                  child: Icon(
                                                    Icons
                                                        .arrow_downward_rounded,
                                                    size: 18,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                          ),
                                          data: const [
                                            {'label': '北京', 'value': '1'},
                                            {'label': '上海', 'value': '2'},
                                            {'label': '广州', 'value': '3'},
                                            {'label': '深圳', 'value': '4'},
                                            {'label': '杭州', 'value': '5'},
                                            {'label': '成都', 'value': '6'},
                                            {'label': '武汉', 'value': '7'},
                                          ],
                                          selectCallBack: (value) {
                                            print('选中的value是：$value');
                                          },
                                          offset: const Offset(0, 30),
                                        ),
                                      ]),
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.only(
                                  left: 25, right: 25, top: 7, bottom: 13),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withAlpha(80),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '时间',
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                  Text(
                                    '15:58 (7:58 UTC)',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      activeTrackColor: Colors.blue,
                                      inactiveTrackColor: Colors.grey[350],
                                      trackHeight: 4.0,
                                      thumbColor: Colors.white,
                                      thumbShape: const HqRoundSliderThumbShape(
                                        enabledThumbRadius: 6.0,
                                      ),
                                      trackShape:
                                          const HqRoundedRectSliderTrackShape(),
                                      overlayShape:
                                          const RoundSliderOverlayShape(
                                              overlayRadius: 15.0),
                                      tickMarkShape:
                                          const RoundSliderTickMarkShape(
                                              tickMarkRadius: 10.0),
                                      activeTickMarkColor: Colors.white,
                                      inactiveTickMarkColor: Colors.grey[350],
                                      valueIndicatorColor: Colors.blue,
                                      valueIndicatorShape:
                                          const PaddleSliderValueIndicatorShape(),
                                      valueIndicatorTextStyle:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    child: Slider(
                                      value: sliderValue,
                                      min: 0,
                                      max: 100,
                                      // 这两个属性必须同时设置才有效
                                      // label: sliderValue.round().toString(),
                                      // divisions: 10,
                                      onChanged: (newValue) {
                                        setState(() {
                                          sliderValue = newValue;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.only(
                                  left: 25, right: 25, top: 7, bottom: 13),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withAlpha(80),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '油量',
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                  Text(
                                    '78.00%',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  HqSliderWidget(
                                    width: 240,
                                    rate: 0.78,
                                    trackWidth: 16,
                                    onChange: (rate) {
                                      print('滑动的比例是：$rate');
                                    },
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 180,
              )
            ],
          ),
        ),
        Positioned(
          right: 40,
          bottom: 40,
          child: HqButton(
            borderWidth: 1,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            onPressed: () {
              print('click');
            },
            child: Text('启动开始飞行'),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Center(
              child: _content(),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
