import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/domain/admin.dart';
import 'package:ecommerce/domain/user.dart';
import 'package:ecommerce/model/global_data.dart';
import 'package:ecommerce/model/initialize.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class FireBaseServices {
  static final FireBaseServices _firebaseServices =
      FireBaseServices._internal();

  final fireStore = Firestore.instance;
  final fireAuth = FirebaseAuth.instance;

  factory FireBaseServices() {
    return _firebaseServices;
  }

  FireBaseServices._internal();

  Future<FirebaseUser> fireBaseGoogleAuth(AuthCredential credential) async {
    final AuthResult result = await fireAuth.signInWithCredential(credential);
    final FirebaseUser user = result.user;

    if (user != null) {
      List<DocumentSnapshot> docs = (await Firestore.instance
              .collection("users")
              .where("id", isEqualTo: user.uid)
              .getDocuments())
          .documents;

      if (docs.length == 0) {
        createNewUserData(user);
      }
    }
    return user;
  }

  Future<FirebaseUser> fireBaseBasicSignIn(LoginData data) async {
    FirebaseUser user;

    try {
      final AuthResult result = await fireAuth.signInWithEmailAndPassword(
          email: data.name, password: data.password);
      user = result.user;
      print(" NO EXCEPTIOOOOOON!!! $user");

      return user;
    } catch (e) {
      print("EXCEPTIOOOOOON!!! $e");
      return null;
    }
  }

  Future<FirebaseUser> fireBaseBasicSignUp(LoginData data) async {
    try {
      var result = await fireAuth.createUserWithEmailAndPassword(
          email: data.name, password: data.password);
      createNewUserData(result.user);

      return result.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> createNewUserData(FirebaseUser user) {
    User u = User(
        email: user.email,
        nickname: user.displayName ?? user.email,
        photoUrl: user.photoUrl,
        id: user.uid,
        createdAt: DateTime.now().millisecondsSinceEpoch.toString());
    return Firestore.instance
        .collection("users")
        .document(user.uid)
        .setData(u.toJson());
  }
}

class FireBaseAuthManager {
  FireBaseServices fireBaseServices = FireBaseServices();
  GlobalDataController globalDataController = Get.put(GlobalDataController());

  Future<bool> fireBaseGoogleAuth(AuthCredential credential) async {
    FirebaseUser user = await fireBaseServices.fireBaseGoogleAuth(credential);
    print("In google auth");
    await loadUser(user);
    return user != null;
  }

  Future<bool> fireBaseBasicSignIn(LoginData data) async {
    FirebaseUser user = await fireBaseServices.fireBaseBasicSignIn(data);
    print("WTF: $user");
    await loadUser(user);
    return user != null;
  }

  Future<bool> fireBaseBasicSignUp(LoginData data) async {
    FirebaseUser user = await fireBaseServices.fireBaseBasicSignUp(data);
    await loadUser(user);
    return user != null;
  }

  void loadUser(FirebaseUser user) async {
    if (user == null) return;
    globalDataController.currentUser = User(id: user.uid, createdAt: null);

    DocumentSnapshot u =
        await Firestore.instance.collection("users").document(user.uid).get();
    globalDataController.currentUser.fromJson(u.data);
    // await initUser(globalDataController.currentUser);
    await Initialize().initEssentials();
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    globalDataController.currentUser = null;
  }

  /*void initUser(User currentUser) async {
    if (currentUser.type == 'admin') {
      type_user = Admin(currentUser);
    }
    */ /*else if (currentUser.type == 'delivery') {
      type_user.typeUser = Delivery(currentUser);
    } else if (currentUser.type == 'manager') {
      type_user.typeUser = Manager(currentUser);
    }*/ /*
  }*/
}
