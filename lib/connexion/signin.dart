import 'package:flutter/material.dart';
import 'login.dart';
import 'reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'error_handling.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> createUserWithEmailAndPassword(
    String nom, String email, String password, String urlPhoto) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    await _firestore.collection('utilisateur').doc(user!.uid).set({
      'nom': nom,
      'email': email,
      'url_photo': urlPhoto,
    });

    // Le compte utilisateur a été créé avec succès
  } catch (e) {
    handleAuthError(e);
  }
}

class SigninPage extends StatelessWidget {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String profileImageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer un compte'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profileImageUrl),
                radius: 50.0,
              ),
              SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () {
                  // Code pour sélectionner une photo de profil et obtenir l'URL
                },
                child: Text('Ajouter une photo de profil'),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: nomController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Adresse e-mail',
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  String nom = nomController.text;
                  String email = emailController.text;
                  String password = passwordController.text;
                  createUserWithEmailAndPassword(
                      nom, email, password, profileImageUrl);
                },
                child: Text('Créer un compte'),
              ),
              SizedBox(height: 12.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Retour à la page de connexion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
