import 'package:flutter/material.dart';
import './main.dart';

class benesselogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ベネッセログイン'),
        backgroundColor: Colors.red,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ログイン'),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'ベネッセID',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'パスワード',
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // パスワードを忘れた場合の処理
              },
              child: Text('パスワードを忘れた場合'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard/student');
              },
              child: Text('ログイン'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // 新規アカウント作成の処理
              },
              child: Text('新規アカウント作成はこちら'),
            ),
          ],
        ),
      ),





    );
  }
}