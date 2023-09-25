import 'package:bloc/bloc.dart';
import 'package:crud_bloc/dashboard/event.dart';
import 'package:crud_bloc/dashboard/state.dart';
import 'package:crud_bloc/model/to_do_model.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoLoading()) {
    on<LoadTodo>((event, emit) {
      emit(ToDoLoaded(todos: event.todos));
    });

    on<AddTodo>((event, emit) {
      final state = this.state;
      if (state is ToDoLoaded) {
        emit(ToDoLoaded(todos: List.from(state.todos)..add(event.todo)));
      }
    });
    on<DeleteTodo>((event, emit) {
      final state = this.state;
      if (state is ToDoLoaded) {
        List<ToDo> todos = state.todos.where((todos) {
          return todos.id != event.todo.id;
        }).toList();
        emit(ToDoLoaded(todos: todos));
      }
    });

  }
}
