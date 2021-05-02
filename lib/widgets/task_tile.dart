import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        'Buy Milk',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      trailing: Checkbox(
        value: false,
        onChanged: null,
      ),
    );
  }
}
