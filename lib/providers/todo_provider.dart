import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/todo_model.dart';
import '../constants/app_constants.dart';

class TodoProvider with ChangeNotifier {
  List<TodoItem> _todos = [];

  List<TodoItem> get todos => _todos;

  List<TodoItem> get completedTodos =>
      _todos.where((todo) => todo.isCompleted).toList();

  List<TodoItem> get pendingTodos =>
      _todos.where((todo) => !todo.isCompleted).toList();

  int get totalCount => _todos.length;

  int get completedCount => completedTodos.length;

  int get pendingCount => pendingTodos.length;

  TodoProvider() {
    _loadTodos();
  }

  void addTodo(String title, {String description = ''}) {
    final todo = TodoItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      createdAt: DateTime.now(),
    );
    _todos.add(todo);
    _saveTodos();
    notifyListeners();
  }

  void toggleTodo(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      final todo = _todos[index];
      _todos[index] = todo.copyWith(
        isCompleted: !todo.isCompleted,
        completedAt: !todo.isCompleted ? DateTime.now() : null,
      );
      _saveTodos();
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    _saveTodos();
    notifyListeners();
  }

  void updateTodo(String id, String title, {String description = ''}) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index] = _todos[index].copyWith(
        title: title,
        description: description,
      );
      _saveTodos();
      notifyListeners();
    }
  }

  void clearCompleted() {
    _todos.removeWhere((todo) => todo.isCompleted);
    _saveTodos();
    notifyListeners();
  }

  void clearAll() {
    _todos.clear();
    _saveTodos();
    notifyListeners();
  }

  Future<void> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosJson = prefs.getString(AppConstants.todoKey);
    if (todosJson != null) {
      final List<dynamic> todosList = json.decode(todosJson);
      _todos = todosList.map((json) => TodoItem.fromJson(json)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosJson = json.encode(_todos.map((todo) => todo.toJson()).toList());
    await prefs.setString(AppConstants.todoKey, todosJson);
  }
}
