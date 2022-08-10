import 'package:firebase_auth1/constant/color.dart';
import 'package:flutter/material.dart';

class CardTodo extends StatefulWidget {
  const CardTodo({Key? key}) : super(key: key);

  @override
  State<CardTodo> createState() => _CardTodoState();
}

class _CardTodoState extends State<CardTodo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Theme(
              data: ThemeData(primarySwatch: Colors.blue,unselectedWidgetColor: Colors.orange),
              child: Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  activeColor: Colors.blue,
                  checkColor: Colors.pink,
                  value: true,
                  onChanged: (bool? value) {},
                ),
              )),
        ],
      ),
    );
  }
}
