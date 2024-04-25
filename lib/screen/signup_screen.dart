import 'package:flutter/material.dart';

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
            SizedBox(width: 96.w, height: 100.h),
            Center(
              child: Image.asset('assets/images/logo.jpg'),
            ),
            SizedBox(height: 120.h),
            Textfild(email, email_F, '이메일을 입력해주세요', Icons.email),
            SizedBox(height: 15.h),
            Textfild(password, password_F, '패스워드', Icons.lock),
            SizedBox(height: 15.h),
            forget(),
            SizedBox(height: 15.h),
            login(),
            SizedBox(height: 15.h),
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
            '아직 계정이 없으신가요?',
            style: TextStyle(fontSize: 13.sp, color: Colors.blueGrey),
          ),
          SizedBox(
            width: 14.w,
          ),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              '회원가입',
              style: TextStyle(fontSize: 13.sp, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

// 로그인 버튼 위젯
  Widget login() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: InkWell(
        // onTap: () async {
        //   await Authentication()
        //       .Login(email: email.text, password: password.text);
        // },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 44.h,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            'Login',
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
