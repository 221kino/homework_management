import 'package:flutter/material.dart';
import './main.dart';
import './benesselogin.dart';


class NextPage4 extends StatelessWidget {
  NextPage4(this.title);
  final String title;


  var name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登録完了'),
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



            Text(
              '科目名',
              style: Theme.of(context).textTheme.headlineMedium,

            ),


            Text(
              'English',
              style: TextStyle(
                  fontSize: 50,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.solid),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                '    ',
                textAlign: TextAlign.center,
              ),
            ),

            Text(
              '締切日',
              style: Theme.of(context).textTheme.headlineMedium,

            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 50,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.solid),
            ),














          ],


        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Text('Home'),
        onPressed: (){

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },

      ),


    );
  }
}