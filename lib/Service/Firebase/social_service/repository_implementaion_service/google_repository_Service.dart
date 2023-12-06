import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizzy_app/Service/Firebase/social_service/repository/social_repository.dart';
import 'package:quizzy_app/model/social_service_response_model.dart';

class GoogleRepositoryService implements SocialRepository {
  @override
  Future<SocialServiceResponseModel> login() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return SocialServiceResponseModel(
          status: true,
          providerId: userCredential.additionalUserInfo!.providerId,
          providertype: 'google');
    } catch (e) {
      return SocialServiceResponseModel(status: false);
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await GoogleSignIn()
          .disconnect(); // Disconnects the current user from the app
      // await GoogleSignIn().signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
