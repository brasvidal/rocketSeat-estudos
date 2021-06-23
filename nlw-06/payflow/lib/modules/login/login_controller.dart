import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    //adiciona build context dentro da classe google signin
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      authController.setUser(context, response);
      print(response);
    } catch (error) {
      authController.setUser(context, null); //se der errado passar usuario como null.
      print(error);
    }
  }
}
