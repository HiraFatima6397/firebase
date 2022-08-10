import 'package:firebase_auth1/constant/color.dart';
import 'package:firebase_auth1/constant/icon.dart';
import 'package:firebase_auth1/constant/string_constant.dart';
import 'package:firebase_auth1/constant/style.dart';
import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xfff48fb1),
            Color(0xfffCE4EC),
            Color(0xffCE93D8)
          ])),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      AppIcons.arrow,
                      size: 30,
                      color: AppColors.white,
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(StringConstant.create,
                          style: AppStyles.regularText(
                            fontSize: 30,
                            color: AppColors.white,
                          )),
                      Text(
                        StringConstant.newTodo,
                        style: AppStyles.regularText(
                          fontSize: 30,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      lable(StringConstant.taskTitle),
                      SizedBox(
                        height: 15,
                      ),
                      title(),
                      SizedBox(
                        height: 15,
                      ),
                      lable(StringConstant.taskType),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          chipData(StringConstant.important, 0xffff4080),
                          SizedBox(
                            width: 20,
                          ),
                          chipData(StringConstant.planned, 0xff512DA8)
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      lable(StringConstant.description),
                      SizedBox(
                        height: 15,
                      ),
                      description(),
                      SizedBox(
                        height: 15,
                      ),
                      lable(StringConstant.category),
                      SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        children: [
                          chipData(StringConstant.food, 0xffff4080),
                          SizedBox(
                            width: 20,
                          ),
                          chipData(StringConstant.workOut, 0xffffD54F),
                          SizedBox(
                            width: 20,
                          ),
                          chipData(StringConstant.work, 0xff4527A0),
                          SizedBox(
                            width: 20,
                          ),
                          chipData(StringConstant.design, 0xffC6FF00),
                          SizedBox(
                            width: 20,
                          ),
                          chipData(StringConstant.run, 0xfff44336),

                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      button(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
  Widget button(){
    return Container(height: 60,width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColors.pink
    ),child: Center(child: Text(StringConstant.addTodo,style: AppStyles.regularText(fontSize: 20, color: AppColors.white),))
    );}

  Widget description() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.grey, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: StringConstant.taskTitle,
          hintStyle:
              AppStyles.regularText(fontSize: 20, color: AppColors.white),
          contentPadding: EdgeInsets.only(left: 20, right: 20),
        ),
      ),
    );
  }

  Widget chipData(String label, int color) {
    return Chip(
        backgroundColor: Color(color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(label,
            style: AppStyles.regularText(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold)));
  }

  Widget title() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.grey, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: StringConstant.taskTitle,
            hintStyle:
                AppStyles.regularText(fontSize: 20, color: AppColors.white),
            contentPadding: EdgeInsets.only(left: 20, right: 20)),
      ),
    );
  }

  Widget lable(String text) {
    return Text(
      text,
      style: AppStyles.regularText(
          fontSize: 20, color: AppColors.pink, fontWeight: FontWeight.bold),
    );
  }
}
