import 'package:flutter/material.dart';
import './page2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.red, // �f�U�C���̕ύX�F�ԐF
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
              'assets/logo.png', // ��ʍ���ɔz�u����郍�S�摜
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('�w���͂�����'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => NextPage3()));
              },
              child: Text('�����͂�����'),
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
            Text('���O�C��'),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: '���[�U�[ID',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: '�p�X���[�h',
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // �p�X���[�h��Y�ꂽ�ꍇ�̏���
              },
              child: Text('�p�X���[�h��Y�ꂽ�ꍇ'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard/student');
              },
              child: Text('���O�C��'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // �V�K�A�J�E���g�쐬�̏���
              },
              child: Text('�V�K�A�J�E���g�쐬�͂�����'),
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
          Text('ToDo���X�g'),
          SizedBox(height: 20),
          TaskItem(
            taskName: '�ۑ�A',
            deadline: DateTime(2023, 7, 10),
          ),
          TaskItem(
            taskName: '�ۑ�B',
            deadline: DateTime(2023, 7, 5),
          ),
          TaskItem(
            taskName: '�ۑ�C',
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
          Text('�h��o�^���'),
          SizedBox(height: 20),
          DropdownButton<String>(
            items: [
              DropdownMenuItem(
                child: Text('�Ȗ�A'),
                value: '�Ȗ�A',
              ),
              DropdownMenuItem(
                child: Text('�Ȗ�B'),
                value: '�Ȗ�B',
              ),
              DropdownMenuItem(
                child: Text('�Ȗ�C'),
                value: '�Ȗ�C',
              ),
            ],
            onChanged: (value) {
              // �I�������Ȗڂ̏���
            },
            hint: Text('�Ȗڂ�I�����Ă�������'),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: '�薼',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: '�J�n��',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: '���ߐ؂�',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: '�\��H��',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: '���v����',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              labelText: '�R�����g',
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('�߂�'),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // �ꎞ�ۑ��̏���
                },
                child: Text('�ꎞ�ۑ�'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // �o�^�̏���
                },
                child: Text('�o�^'),
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
      backgroundColor = Colors.red; // ���ߐ؂�`1���O�F�ԐF
    } else if (deadline.isBefore(DateTime.now().subtract(Duration(days: 3)))) {
      backgroundColor = Colors.yellow; // 1�`3���O�F���F
    } else if (deadline.isBefore(DateTime.now().subtract(Duration(days: 7)))) {
      backgroundColor = Colors.blue; // 3�`7���O�F�F
    }

    return Container(
      color: backgroundColor,
      child: Row(
        children: [
          Checkbox(
            value: true, // �`�F�b�N�{�b�N�X�̏�Ԃ͓K�X�ݒ肷��
            onChanged: (value) {
              // �`�F�b�N�{�b�N�X�̏�ԕύX���̏���
            },
          ),
          SizedBox(width: 10),
          Text(taskName),
          Spacer(),
          Text(deadline.toString()), // �����̕\���͓K�X�t�H�[�}�b�g����
        ],
      ),
    );
  }
}