import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

//---notifies pages---

@singleton
class AppEventsCubit extends Cubit<AppEventsStates> {
  AppEventsCubit() : super(AppEventsInit());
}

abstract class AppEventsStates {}

class AppEventsInit extends AppEventsStates {}

//---events---

//reusable listener widget
class AppEventsListener extends StatelessWidget {
  final Widget child;
  final void Function(BuildContext context, AppEventsStates state) listener;

  const AppEventsListener({super.key, required this.child, required this.listener});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppEventsCubit, AppEventsStates>(listener: listener, child: child);
  }
}
