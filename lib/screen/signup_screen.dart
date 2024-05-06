import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/data/firebase_service/firebase_auth.dart';
import 'package:flutter_instagram_clone/util/dialog.dart';
import 'package:flutter_instagram_clone/util/exception.dart';
import 'package:flutter_instagram_clone/util/imagepicker.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback show;

  SignupScreen(this.show, {super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // 이메일 입력 컨트롤러
  final email = TextEditingController();
  FocusNode email_F = FocusNode();
  // 비밀번호 입력 컨트롤러
  final password = TextEditingController();
  FocusNode password_F = FocusNode();

  // 성별 입력 컨트롤러
  final bio = TextEditingController();
  FocusNode bio_F = FocusNode();

  // 이름 입력 컨트롤러
  final username = TextEditingController();
  FocusNode username_F = FocusNode();

  // 비밀번호 확인 컨트롤러
  final passwordConfirm = TextEditingController();
  FocusNode passwordConfirm_F = FocusNode();

  // 이미지 파일 변수
  File _imageFile = File('');

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(width: 96.w, height: 40.h),
            Center(
              child: Image.asset('assets/images/logo.jpg'),
            ),
            SizedBox(height: 60.h),
            InkWell(
              onTap: () async {
                File _imagefilee = await ImagePickerr().uploadImage('gallery');
                setState(() {
                  _imageFile = _imagefilee;
                });
              },
              child: CircleAvatar(
                radius: 42.r,
                backgroundColor: Colors.black54,
                child: _imageFile == null
                    ? CircleAvatar(
                        radius: 38.r,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: AssetImage('assets/images/person.png'),
                      )
                    : CircleAvatar(
                        radius: 38.r,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: Image.file(
                          _imageFile!,
                          fit: BoxFit.cover,
                        ).image,
                      ),
              ),
            ),
            SizedBox(height: 50.h),
            Textfild(email, email_F, '이메일을 입력해주세요', Icons.email),
            SizedBox(height: 16.h),
            Textfild(username, username_F, '이름', Icons.person_2),
            SizedBox(height: 16.h),
            Textfild(bio, bio_F, '성별', Icons.abc),
            SizedBox(height: 16.h),
            Textfild(password, password_F, '비밀번호', Icons.lock),
            SizedBox(height: 16.h),
            Textfild(passwordConfirm, passwordConfirm_F, '비밀번호 확인', Icons.lock),
            SizedBox(height: 20.h),
            Signup(),
            SizedBox(height: 16.h),
            Have()
          ],
        ),
      ),
    );
  }

  ////위젯 메서드 생성 공간

  // 회원가입 텍스트 위젯
  Widget Have() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '이미 저희와 함께하고 계신가요?',
            style: TextStyle(fontSize: 13.sp, color: Colors.blueGrey),
          ),
          SizedBox(
            width: 14.w,
          ),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              '로그인',
              style: TextStyle(fontSize: 13.sp, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

// 회원가입 버튼 위젯
  Widget Signup() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: InkWell(
        onTap: () async {
          try {
            await Authentication().Signup(
                email: email.text,
                password: password.text,
                passwordConfirm: passwordConfirm.text,
                username: username.text,
                bio: bio.text,
                profile: File(''));
          } on exceptions catch (e) {
            dialogBuilder(context, e.massage);
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 44.h,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            'Sign up',
            style: TextStyle(
              fontSize: 23.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

// 비밀번호 찾기 위젯
  Padding forget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        '비밀번호가 기억나지 않으신가요?',
        style: TextStyle(
            fontSize: 12.sp, color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }

// email,비번 텍스트필드 생성 메소드.
  Padding Textfild(TextEditingController controll, FocusNode focusNode,
      String typename, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: TextField(
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
          controller: controll,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: typename,
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? Colors.black : Colors.grey[600],
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                width: 2.w,
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                width: 2.w,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
