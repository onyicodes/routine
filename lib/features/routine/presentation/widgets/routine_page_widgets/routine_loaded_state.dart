import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';


Widget routineLoadedState({required List<Routine> routineList}) {
  return SingleChildScrollView(
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: routineList.length,
        itemBuilder: (context, index) {
          DateFormat dateFormat = DateFormat.MMMEd();
          
          DateTime date = DateTime.parse(routineList[index]
              .routineTime);
          String formatedDate = dateFormat.format(date);
          
          return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            title: Text(routineList[index].title),
            subtitle: Text(formatedDate),
            onTap: (){
            },
          ),
        );
        }),
  );
}
