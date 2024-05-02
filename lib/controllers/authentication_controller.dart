import 'package:firebase_auth/firebase_auth.dart';
import 'package:gdrive_clone/utils.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  login()  async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if ( googleUser != null ) {
      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      UserCredential userCredential = await auth.signInWithCredential(credential);
      User? user = userCredential.user!;

      userCollection.doc(user.uid).set({
        "username": user.displayName,
        "profilepic": user.photoURL,
        "email": user.email,
        "uid": user.uid,
        "userCreated": DateTime.now()
      });

    }


  }
}