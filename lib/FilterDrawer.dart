
import 'package:flutter/widgets.dart';
import 'package:todo_filter/todo_filter.dart';

/// filter drawer 界面
class FilterDrawer extends StatefulWidget{
  final Filter filter;

  const FilterDrawer({super.key, required this.filter});


  @override
  State<StatefulWidget> createState() => FilterDrawerState();
}


class FilterDrawerState extends State<FilterDrawer>{
  late Filter filter;

  /// 请注意： 该页面为 弹出侧栏 。 请使用 Drawer
  ///
  /// 要求实现
  /// 1. 顶部显示标题： “筛选”
  /// 2. 接下来显示优先级筛选列表， 使用 FilterRegion
  /// 3. 接下来显示 tags 筛选列表， 使用 FilterRegion
  /// 4. 最后， 添加一个确认按键， 当且仅当使用这个确认按键退出返回会弹出修改后的filter, 其他情况
  /// 退出均返回 null
  ///
  /// 5. 几个部分占比 2：3：7：1 不同部分之间使用分割线（Divider）分割
  /// 6. Drawer 宽度设置为 256， 其他参数可左倾设置
  @override
  void initState() {
    super.initState();
    filter = Filter.deepCopy(widget.filter);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}