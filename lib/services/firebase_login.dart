import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  static signInwithGoogle() async {
    GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleauth = await googleuser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleauth?.accessToken,
      idToken: googleauth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user?.displayName);
    return userCredential.user;
  }

  static Future<String> getUsername() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userDetails = " ${user.displayName ?? 'N/A'}";

      return userDetails;
    } else {
      return "User not logged in";
    }
  }

  static Future<String> getUseremail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userDetails = " ${user.email ?? 'N/A'}";

      return userDetails;
    } else {
      return "User not logged in";
    }
  }

    static Future<String> getUserimg() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userDetails = " ${user.photoURL ?? 'N/A'}";

      return userDetails;
    } else {
      return "User not logged in";
    }
  }
}
