import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_instagram_clone/util/exception.dart';

class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> Signup({
    // 회원가입 메서드

    required String email,
    required String password,
    required String passwordConfirm,
    required String username,
    required String bio,
    required File profile,
  }) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        if (password == passwordConfirm) {
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
        } else {
          throw exceptions("비밀번호가 일치하지 않습니다.");
        } // 비밀번호가 일치하지 않을때 예외처리
      } else {
        throw exceptions("모든 항목을 입력해주세요.");
      }
    } on FirebaseAuthException catch (e) {
      throw exceptions(e.message.toString());
    }
  }
}
