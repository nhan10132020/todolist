import 'package:flutter/material.dart';
import 'package:todo_list/components/dialog_box.dart';
import 'package:todo_list/components/task_cart.dart';
import 'package:todo_list/database/data.dart';

class HomeScreen extends StatefulWidget {

  final TodoData db = TodoData();

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  void onCheck(bool? value,int index){
    setState(() {
      widget.db.todoList[index][1] = value;
    });
  }
  
  void saveNewTask(){
    setState(() {
      widget.db.todoList.add([_controller.text,false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }


  void deleteTask(index){
    setState(() {
      widget.db.todoList.removeAt(index);
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: widget.db.todoList.length,
        itemBuilder: (context,index){
            return TaskCard(
              taskDescription: widget.db.todoList[index][0],
              isComplete: widget.db.todoList[index][1],
              deleteFunction: (context){
                deleteTask(index);
              },
              onCheckBox: (bool? value){
                onCheck(value, index);
              },
            );
          }
        )
    );
  }
}