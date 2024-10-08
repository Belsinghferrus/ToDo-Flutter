import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {

  final String taskName;
  final bool isDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

   ToDoList({
     super.key,
     required this.taskName,
     required this.isDone,
     required this.onChanged,
     required this.deleteFunction,
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(7)
        ),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                  value: isDone,
                  onChanged: onChanged,
                  activeColor: Colors.black,
              ),

              //task Name
              Text(taskName,
              style: TextStyle(
                decoration: isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
               ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

