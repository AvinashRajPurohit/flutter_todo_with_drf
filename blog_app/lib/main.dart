import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api/api.dart';
import 'package:blog_app/screens/addtodo.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TodoProvider(),
     child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoP = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:Text("Todo App"),
      ),
       body: ListView.builder(
          itemCount: todoP.todos.length,
           itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(todoP.todos[index].title),
              subtitle: Text(
                  (todoP.todos[index].description),
              ),
            );
           }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => AddTodoScreen()));
        },),
    );
  }
}