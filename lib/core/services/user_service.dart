import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find<UserService>();

  final _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggedIn => _firebaseAuth.currentUser != null;
  User? get user => _firebaseAuth.currentUser;
}
