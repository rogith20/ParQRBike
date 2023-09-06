import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:park_qr/models/qrs.dart';
import 'package:park_qr/models/student.dart';
import 'package:park_qr/services/services.dart';

class ServiceImp implements Services {
  Future<void> newBike(String name, String rollno, String phno, String bmodel,
      String vno, String year, String dept, String section) async {
    final uidd = await FirebaseAuth.instance.currentUser!.uid;
    final data =
        await FirebaseFirestore.instance.collection('users').doc(uidd).get();
    final students = await FirebaseFirestore.instance.collection('bikes').doc();
    Student newFeed = Student((b) => b
      ..name = name
      ..rollno = rollno
      ..uid = data['id'].toString()
      ..phno = phno
      ..bikemodel = bmodel
      ..vehicleno = vno
      ..year = year
      ..section = section
      ..dept = dept);
    students.set(newFeed.toJson());
  }

  Future<void> insertUser(String mail, String pass) async {
    UserCredential userc;
    userc = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: mail,
      password: pass,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userc.user!.uid)
        .set({"mail": mail, "id": userc.user!.uid});
  }

  Future<void> insertqr(String qrdata, String bike, String bikeno) async {
    final uidd = await FirebaseAuth.instance.currentUser!.uid;
    final data =
        await FirebaseFirestore.instance.collection('users').doc(uidd).get();
    print(data);
    await FirebaseFirestore.instance.collection('qrs').doc().set(
        {"uid": data["id"], "qrdata": qrdata, "bike": bike, "bikeno": bikeno});
  }

  Future<BuiltList<Qrs>> getQRs() async {
    final uidd = await FirebaseAuth.instance.currentUser!.uid;
    final data =
        await FirebaseFirestore.instance.collection('users').doc(uidd).get();
    final QuerySnapshot<Map<String, dynamic>> _collectionRef =
        await FirebaseFirestore.instance
            .collection('qrs')
            .where('uid', isEqualTo: data['id'].toString())
            .get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot =
        _collectionRef.docs;
    List<Qrs> list = [];
    snapshot.forEach((element) {
      list.add(Qrs.fromJson(element.data()));
    });
    print("collaborations");
    print(list);
    return list.toBuiltList();
  }
}
