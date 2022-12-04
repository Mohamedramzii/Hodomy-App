import 'package:ecommerce_app_with_getx/model/facebook_userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/routes.dart';

class Auth_Controller extends GetxController {
  bool isvisible = false;
  bool isChecked = false;
  bool isSignedIn = false;

  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var userEmail = ''.obs;
  
  String? email, password, name;

  GetStorage _authBox = GetStorage();
  String _key = 'IsUser?';

  var _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookauth = FacebookAuth.instance;
  Facebook_User_Model? _facebook_user_model;
  final FirebaseAuth _auth = FirebaseAuth.instance;


//get current user
  User? get userProfile => _auth.currentUser;

  @override
  void onInit() {
    displayUserName.value =
        (userProfile != null ? userProfile!.displayName : 'User')!;
    displayUserPhoto.value =
        (userProfile != null ? userProfile!.photoURL : '')!;
    userEmail.value =
        (userProfile != null ? userProfile!.email : 'User@gmail.com')!;
    super.onInit();
  }


//to hide/appear password
  void PasswordVisibility() {
    isvisible = !isvisible;
    update();
  }

//to check/uncheck 'agree terms' box
  void BoxChecked() {
    isChecked = !isChecked;
    update();
  }

  //REGISTRATION AND SIGN IN METHODS WITH FIREBASE

  void SignIN() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
            userEmail.value= _auth.currentUser!.email!;
            displayUserName.value = _auth.currentUser!.displayName!;
          }
               );
      //to store in a local storage
      isSignedIn = true;
      _authBox.write(_key, isSignedIn);
      ///////////////////////////
      update();
      Get.offAllNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String message = '$e';

      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      Get.snackbar(
        '',
        message,
        titleText: Text(
          'Error',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        messageText: Text(
          message,
          style: TextStyle(fontSize: 17, color: Colors.red),
        ),
        colorText: Colors.black,
        icon: Icon(
          Icons.warning_rounded,
          color: Colors.red,
          size: 40,
        ),
        shouldIconPulse: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e);
    }
  }

  void SignUp() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
        _auth.currentUser!.updateDisplayName(name);
        displayUserName.value = name!;
        userEmail.value=_auth.currentUser!.email!; 
      });
      //to store in Local Storage
      isSignedIn = true;
      _authBox.write(_key, isSignedIn);
      //////////////////////
      update();
      Get.offAllNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String message = 'Fields are empty';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that username.';
      }
      Get.snackbar(
        '',
        message,
        titleText: Text(
          'Error',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        messageText: Text(
          message,
          style: TextStyle(fontSize: 17, color: Colors.red),
        ),
        colorText: Colors.black,
        icon: Icon(
          Icons.warning_rounded,
          color: Colors.red,
          size: 40,
        ),
        shouldIconPulse: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e);
    }
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    displayUserName.value = googleUser!.displayName!;
    displayUserPhoto.value = googleUser.photoUrl!;
    userEmail.value = googleUser.email;

    Get.offAllNamed(Routes.mainScreen);
    // to make user email appears on firebase authentication identifiers

// 1-authenticate that user
    GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
    try {
//2-then get accessToken and idToken of the user
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

//3-finally make your simple sign in with user credential
      await _auth.signInWithCredential(credential);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Google Registration process is cancelled!',
        colorText: Colors.black,
        icon: Icon(
          Icons.warning_rounded,
          color: Colors.red,
          size: 40,
        ),
        shouldIconPulse: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
//to store in Local Storage
    isSignedIn = true;
    _authBox.write(_key, isSignedIn);
    update();
  }

  void FacebookSignIn() async {
    final LoginResult loginResult = await _facebookauth.login();

    if (loginResult.status == LoginStatus.success) {
      final data = await _facebookauth.getUserData();
      _facebook_user_model = Facebook_User_Model.fromJson(data);
      displayUserName.value= _facebook_user_model!.name!;
      userEmail.value=_facebook_user_model!.email!;
      displayUserPhoto.value=_facebook_user_model!.facebookPhotoModel!.url!;
      Get.offAllNamed(Routes.mainScreen);
    }

    try {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await _auth.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      Get.snackbar(
        '',
        '',
        titleText: Text(
          'Error',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        messageText: Text(
          'Facebook Registration process is cancelled',
          style: TextStyle(fontSize: 17, color: Colors.red),
        ),
        colorText: Colors.black,
        icon: Icon(
          Icons.warning_rounded,
          color: Colors.red,
          size: 40,
        ),
        shouldIconPulse: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isSignedIn = true;
    _authBox.write(_key, isSignedIn);
    update();
  }

  Future<void> ResetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.back();
      update();
    } on FirebaseAuthException catch (e) {
      String message = '$e';
      if (e.code == message) {
        message =
            'Account does not exists for that email:\n$email... enter a valid email address';
      }
      Get.snackbar(
        '',
        message,
        titleText: Text(
          'Error',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        messageText: Text(
          message,
          style: TextStyle(fontSize: 17, color: Colors.red),
        ),
        colorText: Colors.black,
        icon: Icon(
          Icons.warning_rounded,
          color: Colors.red,
          size: 40,
        ),
        shouldIconPulse: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {}
  }

  void SignOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    await _facebookauth.logOut();
    displayUserName.value = '';
    displayUserPhoto.value = '';
    isSignedIn = false;
    _authBox.remove(_key);
    update();
    Get.offAllNamed(Routes.welcomeScreen);
  }
}
