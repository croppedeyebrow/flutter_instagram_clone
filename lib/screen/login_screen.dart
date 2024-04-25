///인스타그램 로그인 화면 ui만들기

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 이메일 입력 컨트롤러
  final email = TextEditingController();
  FocusNode email_F = FocusNode();

  // 비밀번호 입력 컨트롤러
  final password = TextEditingController();
  FocusNode password_F = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 96.w,
              height: 100.h,
            ),
            Center(child: Image.asset('assets/images/logo.jpg')),
            SizedBox(
              height: 120.h,
            ),
            Textfield(email, Icons.email, '이메일을 입력하세요', email_F),
            SizedBox(
              height: 20.h,
            ),
            Textfield(password, Icons.lock, '비밀번호를 입력하세요', password_F),
            SizedBox(
              height: 14.h,
            ),
            Forgot(),
            SizedBox(
              height: 14.h,
            ),
            Login(),
            SizedBox(
              height: 14.h,
            ),
            Have()
          ],
        ),
      ),
    );
  }

  ////위젯 메서드 생성 공간

// email,비번 텍스트필드 생성 메소드.
  Widget Textfield(TextEditingController controller, IconData icon, String type,
      FocusNode focusNode) {
    // TextEditingController controller, IconData icon, String type, FocusNode focusNode, String hint는 각각 텍스트필드의 컨트롤러, 아이콘, 타입, 포커스노드, 힌트를 의미
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: TextField(
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
            ),
            controller: controller, // 이메일 입력 컨트롤러
            focusNode:
                focusNode, // 이메일 입력 포커스노드, 포커스노드는 텍스트필드에 포커스가 있을때와 없을때를 구분하기 위해 사용
            decoration: InputDecoration(
              hintText: type,
              prefixIcon: Icon(
                icon,
                color: focusNode.hasFocus ? Colors.black : Colors.blueGrey,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                  width: 1.2.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.2.w,
                ),
              ),
            )),
      ),
    );
  }
}

//로그인 화면 하단 회원가입 텍스트 위젯

class Have extends StatelessWidget {
  const Have({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
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
          Text(
            '회원가입',
            style: TextStyle(fontSize: 13.sp, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

//로그인 버튼 위젯

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 44.h,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(12.r)),
        child: Text(
          'Log in',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

//비밀번호 찾기 위젯

class Forgot extends StatelessWidget {
  const Forgot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        '비밀번호가 기억나지 않으신가요?',
        style: TextStyle(
            fontSize: 12.sp, color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }
}
