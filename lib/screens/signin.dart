import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signin'),
      ),
    );
  }

  // Future<void> signInWithGoogle() async {
  //   final auth = FirebaseAuth.instance;
  //   final googleSignIn = GoogleSignIn();
  //   final googleUser = await googleSignIn.signIn();
  //   final googleAuth = await googleUser!.authentication;
  //   final credential = GoogleAuthProvider.getCredential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   final user = await auth.signInWithCredential(credential);
  //   print('User: ${user.user!.displayName}');
  // }
}
