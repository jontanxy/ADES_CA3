import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInProvider extends ChangeNotifier {
  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult result = await FacebookAuth.i.login(
        permissions: [
          'public_profile',
          'email',
          'pages_show_list',
          'pages_messaging',
          'pages_manage_metadata'
        ],
      );

      // Check if user is signed in
      if (result.status == LoginStatus.success) {
        // You have logged in
        final AccessToken accessToken = result.accessToken!;

        // Create a credential from the access token
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);

        // Once signed in, return the UserCredential
        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future facebookLogout() async {
    await FacebookAuth.instance.logOut();
  }
}
