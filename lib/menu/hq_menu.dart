class HqMenu {
  String bigTitle = '';
  String subTitle = '';

  String label = '';
  String url = '';
  int index = 0;
  HqMenu(this.label, this.index, {this.url = ''});
  bool selected = false;
  bool expend = false;
  bool hover = false;
  bool showChildren = false;
  HqMenu? parent;
  List<HqMenu> children = [];
}
