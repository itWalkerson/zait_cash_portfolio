import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Loadable<T> extends Equatable {
  final T data;
  final bool isLoading;
  final String? error;

  const Loadable({required this.data, this.isLoading = false, this.error});

  @override
  List<Object?> get props => [data, isLoading, error];

  Loadable<T> copyWith({T? data, bool? isLoading, String? error}) {
    return Loadable<T>(data: data ?? this.data, isLoading: isLoading ?? this.isLoading, error: error ?? this.error);
  }
}
