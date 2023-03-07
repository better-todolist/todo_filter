import 'package:flutter/cupertino.dart';

class FilterItem {
  final Widget child;
  final bool inFilter;

  FilterItem({required this.child, required this.inFilter});
}

/// 一个filter 域
class FilterRegion extends StatelessWidget {
  final List<FilterItem> filterItems;
  final Function(int, bool) onSelect;
  final Function()? onSelectAll;
  final Function()? onSelectNone;

  const FilterRegion(
      {super.key,
      required this.filterItems,
      required this.onSelect,
      this.onSelectAll,
      this.onSelectNone});

  /// 要求实现
  ///
  /// 1. 顶部2个并排check box
  ///   - 一个复选框 “全选”，点击全选后，全部的筛选项均勾选， 如果提供的 filterItems 全部都选择了，
  ///   那自动勾选该复选框
  ///   - 一个复选框 “全不选”， 点击后，全部筛选项均不选，如果提供是filterItems 全部都没勾选，那就
  ///   自动勾选该复选框
  /// 2. 下半部分一个 ListView, 内部是filterItems
  ///   - 每个选择元素，可以使用 CheckboxListTile,
  ///   - 水平排列 filterItem 复选框 的 child
  ///   - 整个行元素需要能点击，如果用户点击了任意的
  /// 3. 回调
  ///   - 当用户改变了任意 筛选项， 那就调用对应的 onSelect 提供对应筛选项的 idx 和 改变后的值
  ///   - 当用户点击了 全选 那就调用回调 onSelectAll
  ///   - 当用户点击了 全不选 那就调用回调 onSelectAll
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    throw UnimplementedError();
  }
}
