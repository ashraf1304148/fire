import 'package:fire/models/user_model.dart';
import 'package:fire/routes/route_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainController extends GetxController {
  //AuthController.intsance..
  static MainController instance = Get.find();
  List<UserModel> users = [];
  //email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseMessaging fcmToken = FirebaseMessaging.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

// initial screen
  _initialScreen(User? user) {
    if (user == null) {
      print("no user");
      // Get.offAllNamed(RouteHelper.getSignInPage());
    } else {
      // Get.offAllNamed(RouteHelper.getWellcomePage(email: user.email!));
      print("have a user");
    }
  }

// firebase messageing background
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();

    print("Handling a background message: ${message.messageId}");
  }

// initial image
  initialMessage() async {
    NotificationSettings settings = await fcmToken.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print("user Graint permission " + settings.authorizationStatus.toString());
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // register
  void register(UserModel data) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: data.email!, password: data.password!);
      setData(tableName: "user", data: data.toJson());
      Get.toNamed(RouteHelper.getWellcomePage(email: data.email!));
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
  }

// login
  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
  }

// set data
  void setData(
      {required String tableName,
      required Map<String, dynamic> data,
      String? id}) async {
    try {
      // var result = await FirebaseStorage.instance.ref("/files").listAll();

      var result = await FirebaseFirestore.instance
          .collection(tableName)
          .doc(id)
          .set(data);
    } catch (e) {
      Get.snackbar("About upload", "upload message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "faild to upload data",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
  }

// get users
  void getUsers() async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('user')
          .get()
          .then((QuerySnapshot querySnapshot) {
        users = [];

        querySnapshot.docs.forEach((doc) {
          users.add(UserModel.fromQueryDocumentSnapshot(doc));
        });
      });
    } catch (e) {
      Get.snackbar("get Faild", "get message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "faild to get data",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
    update();
  }

// delete user
  Future deleteUser(String email, String password) async {
    try {
      await auth.currentUser!.delete();
    } catch (e) {
      Get.snackbar("About delete", "delete message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "faild to delete data",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
  }

// delete element
  void deleteElement({required String tableName, required String id}) async {
    try {
      // var result = await FirebaseStorage.instance.ref("/files").listAll();

      var result = await FirebaseFirestore.instance
          .collection(tableName)
          .doc(id)
          .delete();
    } catch (e) {
      Get.snackbar("About delete", "delete message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "faild to delete data",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
    update();
  }

// log out
  void logOut() async {
    await auth.signOut();
    Get.toNamed(RouteHelper.getSignInPage());
  }

// social methods
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: ['email']).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
