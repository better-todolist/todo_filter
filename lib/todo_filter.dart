library todo_filter;

import 'dart:async';

import 'package:todo_record/database/database.dart';
import 'package:todo_record/record/todo_record.dart';
import 'package:todo_record/tag.dart';

abstract class SetInFilter {
  setSelect(bool select);
}

class PriorityFilter extends SetInFilter {
  int level;
  bool inFilter;

  PriorityFilter(this.level, this.inFilter);

  @override
  setSelect(bool select) {
    inFilter = select;
  }
}

class TagFilter extends SetInFilter {
  Tag tag;
  bool inFilter;

  TagFilter(this.tag, this.inFilter);

  @override
  setSelect(bool select) {
    inFilter = select;
  }
}

class Filter {
  List<PriorityFilter> priorityFilter;
  List<TagFilter> tagsFilter;

  Filter(this.priorityFilter, this.tagsFilter);

  /// 从数据库中加载 filter
  static Future<Filter> fromDatabase(Database database, TagMap map) async {
    return Filter(
        (await database.getFilter(FilterType.priority))
            .map((key, value) => MapEntry(key, PriorityFilter(key, value)))
            .values
            .toList()
          ..sort((l, r) => l.level - r.level),
        (await database.getFilter(FilterType.tag))
            .map((key, value) => MapEntry(key, TagFilter(map[key]!, value)))
            .values
            .toList()
          ..sort((l, r) => l.tag.id - r.tag.id));
  }

  Filter.deepCopy(Filter rhs)
      : this(rhs.priorityFilter.toList(), rhs.tagsFilter.toList());

  /// 要求实现 根据当前的filer 信息，将筛选后的结果返回
  ///
  /// inFilter
  ///   - true => 筛选保留该元素
  ///   - false => 筛选不保留该元素
  /// 注意： 要同时筛选 优先级 和 tags
  List<TodoRecord> filter(List<TodoRecord> input) {
    /// Todo: implement this
    throw UnimplementedError();
  }

  /// 将筛选信息持久化
  ///
  /// 组织好数据，保存到数据库
  Future<void> store(Database database) async {
    await database.saveFilter(
        priorityFilter: priorityFilter
            .asMap()
            .map((key, value) => MapEntry(value.level, value.inFilter)),
        tagFilter: tagsFilter
            .asMap()
            .map((key, value) => MapEntry(value.tag.id, value.inFilter)));
  }
}
