import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TaskCard extends StatefulWidget {

  final String taskDescription; 
  final bool isComplete;
  final Function(BuildContext) deleteFunction;
  final Function(bool?) onCheckBox;

  const TaskCard({super.key, required this.taskDescription, required this.isComplete, required this.deleteFunction,required this.onCheckBox});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20, left:25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deleteFunction ,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10.0)
            )
          ],
        ),
        child: Container(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 7, bottom: 7),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: widget.isComplete,
                onChanged: widget.onCheckBox,
                activeColor: Colors.black,
              ),
              Text(
                  widget.taskDescription
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}