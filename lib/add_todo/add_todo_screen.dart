import 'package:crud_bloc/dashboard/bloc.dart';
import 'package:crud_bloc/dashboard/dashboard_screen.dart';
import 'package:crud_bloc/dashboard/event.dart';
import 'package:crud_bloc/dashboard/state.dart';
import 'package:crud_bloc/model/to_do_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToDoScreen extends StatelessWidget {
  AddToDoScreen({super.key});

  TextEditingController id = TextEditingController();
  TextEditingController task = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          leading: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          title: Text("Add To Do Tasks", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: BlocListener<ToDoBloc,ToDoState>(
          listener: ( context, state) {
            if (state is ToDoLoaded) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('To Do Added')));
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Id',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: id,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Task',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: task,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: description,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                SizedBox(
                  height: 80,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          backgroundColor: Colors.black),
                      onPressed: () {
                        print('added');
                        var todo = ToDo(
                          id: id.value.text,
                          task: task.value.text,
                          description: description.value.text,
                        );
                        context.read<ToDoBloc>().add(AddTodo(todo: todo));
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Add To Do",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
