import 'package:built_collection/built_collection.dart';

import '../models/qrs.dart';

abstract class Services {
  Future<void> newBike(String name, String rollno, String phno, String bmodel,
      String vno, String year, String dept, String section);
  Future<void> insertUser(String mail, String pass);
  Future<void> insertqr(String qrdata, String bike, String bikeno);
  Future<BuiltList<Qrs>> getQRs();
}
