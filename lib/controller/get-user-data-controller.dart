

import '../e_commerce.dart';

class GetUserDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getUserData(String uId) async {
    final QuerySnapshot userData =
    await _firestore.collection('users').where('uId', isEqualTo: uId).get();
    return userData.docs;
  }
}