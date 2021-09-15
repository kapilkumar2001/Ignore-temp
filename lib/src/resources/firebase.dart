import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gst_app/src/models/gst_model.dart';

class Firebase {
  List<GSTModel> profiles = [];

  GSTModel getPlayer(String id) {
    return profiles.firstWhere((temp) {
      return temp.id == id;
    });
  }

  Future<void> fetchAndSetProfiles() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('GSTProfile');

    QuerySnapshot allDataQuerySnapshot = await _collectionRef.get();

    profiles = allDataQuerySnapshot.docs
        .map((doc) => doc.data())
        .toList()
        .reversed
        .map((e) => GSTModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
