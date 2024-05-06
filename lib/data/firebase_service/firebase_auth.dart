import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_instagram_clone/data/firebase_service/firestor.dart';
import 'package:flutter_instagram_clone/data/firebase_service/storage.dart';
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
    String URL; // 프로필 이미지 URL
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        if (password == passwordConfirm) {
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());

          // 프로필 이미지 저장소에 업로드
          if (profile != File('')) {
            // 프로필 이미지가 없을때는 업로드 하지 않음
            URL =
                await StorageMethod().uploadImageToStorage('Profile', profile);
          } else {
            URL = '';
          }
          // 유저 정보 가져오기.
          await Firebase_Firestor().CreateUser(
            email: email,
            username: username,
            bio: bio,
            profile: URL == ''
                ? 'https://firebasestorage.googleapis.com/v0/b/flutter-instagram-clone-1b7b9.appspot.com/o/Profile%2Fdefault.png?alt=media&token=3b3b3b3b-3b3b-3b3b-3b3b-3b3b3b3b3b3b'
                : URL,
          );
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
