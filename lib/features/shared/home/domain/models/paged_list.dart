import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class PagedList<T> extends Equatable {
  final List<T> items;
  final int count;

  const PagedList({required this.items, this.count = 0});

  @override
  List<Object?> get props => [items, count];
}
