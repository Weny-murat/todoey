import 'package:flutter/material.dart';
import 'package:todoey/features/task/presentation/widgets/add_task_screen.dart';
import 'package:todoey/features/task/presentation/widgets/task_count_text.dart';
import 'package:todoey/features/task/presentation/widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<Widget>(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen(),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Color(0xFF63c9fe),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.list,
                          size: 40,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Todoey',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TaskCountText(),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: TaskListView(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
