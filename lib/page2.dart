import 'package:flutter/material.dart';
import './todolist.dart';

class NextPage3 extends StatelessWidget {
  int _counter = 0;


  String  title='';
  String  sime='';
  String  name3='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('教師用入力画面'),
        backgroundColor: Colors.red,
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '課題登録:',
            ),



            TextField(
              decoration: InputDecoration(
                labelText: '科目名',
                //hintText: 'Password',
                //icon: Icon(Icons.security),
              ),
              //autocorrect: false,
              //autofocus: false,
              //keyboardType: TextInputType.text,
              //obscureText: true,
              onChanged: (text) {
                // TODO: ここで取得したtextを使う
                //title = text;
              },
              //onChanged: _passwordChanged,
              // onSubmitted: _passwordSubmitted,
            ),

            TextField(
              decoration: InputDecoration(
                labelText: '締切日',

              ),

              //obscureText: true,
              onChanged: (text) {
                // TODO: ここで取得したtextを使う
                title = text;
              },
              //onChanged: _passwordChanged,
              // onSubmitted: _passwordSubmitted,
            ),

            TextField(
              decoration: InputDecoration(
                labelText: '内容',
                //hintText: 'Password',
                //icon: Icon(Icons.security),
              ),
              //autocorrect: false,
              //autofocus: false,
              //keyboardType: TextInputType.text,
              //obscureText: true,
              onChanged: (text) {
                // TODO: ここで取得したtextを使う
                name3 = text;
              },
              //onChanged: _passwordChanged,
              // onSubmitted: _passwordSubmitted,
            ),





            //TextButton(
            //  onPressed: () { /* ボタンがタップされた時の処理 */ },
            //  child: Text('登録'),
            //),







          ],


        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('登録'),
        onPressed: (){

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NextPage4(title)));
        },

      ),

    );
  }
}