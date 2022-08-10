import 'package:firebase_auth1/add_todo/todo_card.dart';
import 'package:firebase_auth1/constant/color.dart';
import 'package:firebase_auth1/constant/icon.dart';
import 'package:firebase_auth1/constant/image.dart';
import 'package:firebase_auth1/constant/string_constant.dart';
import 'package:firebase_auth1/constant/style.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(StringConstant.todaySchedule,
            style: AppStyles.regularText(fontSize: 30, color: AppColors.white)),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(
              AppImages.girl,
            ),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  StringConstant.monday,
                  style: AppStyles.regularText(
                      fontSize: 30, color: AppColors.white),
                ),
              ),
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: AppColors.black,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(AppIcons.home,size: 30,color: AppColors.white,
                ),
              label: 'home',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(AppIcons.plus,size: 30,color: AppColors.white),
                label: 'add'),
            BottomNavigationBarItem(
                icon: Icon(AppIcons.setting,size: 30,color: AppColors.white),
                label: 'setting'),

          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
           CardTodo()
          ],
        ),
      ),

      );
  }
}
