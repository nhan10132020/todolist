import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onCancel; 
  final void Function() onSave;

  const DialogBox({super.key,required this.onCancel,required this.onSave,required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
          children:  [
            Padding(
              padding: const EdgeInsets.only(bottom:15.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  hintText: "Add a new task",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                 MaterialButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: onCancel,
                  child: const Text("Cancel"),
                 ),
                 MaterialButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: onSave,
                  child: const Text("Save"),
                 )
              ],
            )
          ],
        ),
      ),
    );
  }
}
