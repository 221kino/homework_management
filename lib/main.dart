import 'package:flutter/material.dart';
import './page2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.red, // デザインの変更：赤色
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/dashboard/student': (context) => StudentDashboardPage(),
        '/dashboard/teacher': (context) => TeacherDashboardPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // 画面左上に配置されるロゴ画像
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('学生はこちら'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => NextPage3()));
              },
              child: Text('教員はこちら'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ログイン'),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'ユーザーID',
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

class StudentDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text('ToDoリスト'),
          SizedBox(height: 20),
          TaskItem(
            taskName: '課題A',
            deadline: DateTime(2023, 7, 10),
          ),
          TaskItem(
            taskName: '課題B',
            deadline: DateTime(2023, 7, 5),
          ),
          TaskItem(
            taskName: '課題C',
            deadline: DateTime(2023, 7, 1),
          ),
        ],
      ),
    );
  }
}

class TeacherDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Dashboard'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text('宿題登録画面'),
          SizedBox(height: 20),
          DropdownButton<String>(
            items: [
              DropdownMenuItem(
                child: Text('科目A'),
                value: '科目A',
              ),
              DropdownMenuItem(
                child: Text('科目B'),
                value: '科目B',
              ),
              DropdownMenuItem(
                child: Text('科目C'),
                value: '科目C',
              ),
            ],
            onChanged: (value) {
              // 選択した科目の処理
            },
            hint: Text('科目を選択してください'),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: '題名',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: '開始日',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: '締め切り',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: '予定工数',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: '所要時間',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'コメント',
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('戻る'),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // 一時保存の処理
                },
                child: Text('一時保存'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // 登録の処理
                },
                child: Text('登録'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final String taskName;
  final DateTime deadline;

  const TaskItem({
    required this.taskName,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    if (deadline.isBefore(DateTime.now().subtract(Duration(days: 1)))) {
      backgroundColor = Colors.red; // 締め切り～1日前：赤色
    } else if (deadline.isBefore(DateTime.now().subtract(Duration(days: 3)))) {
      backgroundColor = Colors.yellow; // 1～3日前：黄色
    } else if (deadline.isBefore(DateTime.now().subtract(Duration(days: 7)))) {
      backgroundColor = Colors.blue; // 3～7日前：青色
    }

    return Container(
      color: backgroundColor,
      child: Row(
        children: [
          Checkbox(
            value: true, // チェックボックスの状態は適宜設定する
            onChanged: (value) {
              // チェックボックスの状態変更時の処理
            },
          ),
          SizedBox(width: 10),
          Text(taskName),
          Spacer(),
          Text(deadline.toString()), // 期日の表示は適宜フォーマットする
        ],
      ),
    );
  }
}