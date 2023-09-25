import 'package:crud_bloc/model/to_do_model.dart';
import 'package:equatable/equatable.dart';

abstract class ToDoState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

/// ---------------------- TO-DO LOADING---------------------
class ToDoLoading extends ToDoState {}

/// ----------------------- TO-DO LOADED---------------------
class ToDoLoaded extends ToDoState {
  late final List<ToDo> todos;
  ToDoLoaded({this.todos = const <ToDo>[]});

  List<Object?> get props => [todos];
}
