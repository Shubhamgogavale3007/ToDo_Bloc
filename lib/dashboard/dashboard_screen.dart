import 'package:crud_bloc/add_todo/add_todo_screen.dart';
import 'package:crud_bloc/dashboard/bloc.dart';
import 'package:crud_bloc/dashboard/event.dart';
import 'package:crud_bloc/dashboard/state.dart';
import 'package:crud_bloc/model/to_do_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static List<ToDo> todos = [
    ToDo(id: '1', task: 'Sample 1', description: 'This is test To Do'),
    ToDo(id: '2', task: 'Sample 2', description: 'This is test To Do')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text(
          "To Do",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddToDoScreen()));
              },
              child: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (BuildContext context, state) {
          if (state is ToDoLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if(state is ToDoLoaded){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Pending To-Dos :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.todos.length,
                      itemBuilder: (context, index) {
                        print('length :: ${todos.length}');
                        return Card(
                          color: Colors.white,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                  "${state.todos[index].id.toString()} :",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  state.todos[index].task.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [

                                    GestureDetector(
                                        onTap: (){

                                          context.read<ToDoBloc>().add(DeleteTodo(todo: state.todos[index]));
                                        },
                                        child: Icon(Icons.cancel)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
            );
          }else{
            return Text("Someting Went Wrong");
          }

        },
      ),
    );
  }
}
