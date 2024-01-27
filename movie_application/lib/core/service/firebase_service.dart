import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_application/core/constants/app_constants.dart';
import 'package:movie_application/feature/_model/user_model.dart';

class FireBaseService {
  var db = FirebaseFirestore.instance;
  Future<UserModel> fetchUser(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc = await db
        .collection(ApplicationConstants.FIREBASE_DOCUMENT)
        .doc(id)
        .get();
    return UserModel(
      id: id,
      email: doc.data()?["email"],
      username: doc.data()?["username"],
      favoriteMovies: doc.data()?["favoriteMovies"],
    );
  }

  addUser(String id, String mail, String password, String username) {
    db.collection(ApplicationConstants.FIREBASE_DOCUMENT).doc(id).set({
      "email": mail,
      "password": password,
      "username": username,
      "favoriteMovies": [],
    });
  }

  addFavoriteMovie(String uid, String id) async {
    await db
        .collection(ApplicationConstants.FIREBASE_DOCUMENT)
        .doc(id)
        .get()
        .then((value) async {
      db.collection(ApplicationConstants.FIREBASE_DOCUMENT).doc(uid).update({
        "favoriteMovies": FieldValue.arrayUnion([id]),
      });
      return value;
    });
  }

  deleteFavoriteMovie(String uid, String id) async {
    await db
        .collection(ApplicationConstants.FIREBASE_DOCUMENT)
        .doc(id)
        .get()
        .then((value) {
      db.collection(ApplicationConstants.FIREBASE_DOCUMENT).doc(uid).update({
        "favoriteMovies": FieldValue.arrayRemove([id])
      });
      return value;
    });
  }
}
