import "package:flutter/material.dart";

//Future의 의미는 비동기 함수를 사용할 때 사용하는 키워드.
//비동기 함수란 함수의 실행이 완료되기 전에 다음 코드를 실행할 수 있도록 하는 함수.

// 다이얼로그 위젯
//다이얼로그 위젯은 사용자에게 메시지를 보여주고 사용자의 응답을 받는 위젯.
Future<void> dialogBuilder(BuildContext context, String message) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '주의',
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: const TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '확인',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        );
      });
}
