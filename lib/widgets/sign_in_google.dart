import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/google_sign_in.dart';

class SignInGoogleWidget extends StatelessWidget {
  const SignInGoogleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            FlutterLogo(size: 120),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text(
                "HEY THERE,\NWELCOME BACK",
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
              label: Text("Sign up with Google"),
            ),
            SizedBox(
              height: 40,
            ),
            RichText(
              text: TextSpan(
                text: "Already have an account?",
                children: [
                  TextSpan(
                    text: "Login",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      );
}
