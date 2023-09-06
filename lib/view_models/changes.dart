import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import '../models/appstate.dart';
import '../models/qrs.dart';
import '../services/services.dart';
import '../services/services_imp.dart';

class Changes extends StatelessWidget {
  const Changes({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<MyModel, Appstate>(
      create: (c) => MyModel(),
      child: child,
    );
  }
}

class MyModel extends StateNotifier<Appstate> with LocatorMixin {
  MyModel() : super(Appstate());
  Services imp = new ServiceImp();

  Future<void> getdetails() async {
    BuiltList<Qrs> qrs = await imp.getQRs();
    state = state.rebuild((p0) => p0.qrs = qrs.toBuilder());
  }
}
