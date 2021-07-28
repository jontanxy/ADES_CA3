import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:todoapp/pages/auth_page.dart';
import 'package:todoapp/providers/facebook_sign_in.dart';
import 'package:todoapp/providers/google_sign_in.dart';
import 'package:todoapp/utilities/color_palette.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image(
              image: AssetImage("assets/logo/feather.png"),
              width: 180,
              height: 180,
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "HEY THERE,\nWELCOME BACK",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Login to your account to continue",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Spacer(),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
              label: Text("Sign in with Google"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              icon: FaIcon(Icons.facebook, color: ColorPalette.facebookBlue),
              onPressed: () {
                final provider =
                    Provider.of<FacebookSignInProvider>(context, listen: false);
                provider.signInWithFacebook();
              },
              label: Text("Sign in with Facebook"),
            ),
            Spacer(),
          ],
        ),
      );
}
