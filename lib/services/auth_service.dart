import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Récupérer l'utilisateur courant
  User? get currentUser => _auth.currentUser;

  // Fonction pour se connecter
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Erreur de connexion: $e');
      return null;
    }
  }

  // Fonction pour s'inscrire
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Erreur d\'inscription: $e');
      return null;
    }
  }

  // Fonction pour se déconnecter
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
