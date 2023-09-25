import 'package:crud_bloc/model/to_do_model.dart';
import 'package:equatable/equatable.dart';

abstract class ToDoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

///------------------ LOAD TO-DO ----------------------------------
class LoadTodo extends ToDoEvent {
  late final List<ToDo> todos;
  LoadTodo({this.todos = const <ToDo>[]});

  @override
  List<Object?> get props => [todos];
}

///------------------- ADD TO-DO -----------------------------------
class AddTodo extends ToDoEvent {
  late final ToDo todo;
  AddTodo({required this.todo});

  @override
  List<Object?> get props => [todo];
}


///------------------- DELETE TO-DO ---------------------------------------
class DeleteTodo extends ToDoEvent {
  late final ToDo todo;
  DeleteTodo({required this.todo});

  @override
  List<Object?> get props => [todo];
}
