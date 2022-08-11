import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:samsung_note/Database/database.dart';
import 'package:samsung_note/app_style.dart';
class BaseContainer extends StatelessWidget {
  final NoteEntityData note ;
  const BaseContainer({Key? key,required this.note}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final time = DateFormat.Hm().format(note.createdTime);
    final dateTime = DateFormat.yMMMd().format(note.createdTime);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 8.w),
      child: Container(
        //width: MediaQuery.of(context).size.width*0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 4.r,
              ),
              SizedBox(height: 6.h),
              Text(note.title,style: AppStyle.normalTextStyle,),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(dateTime,style: AppStyle.smallTextStyle.copyWith(color: Colors.grey),),
                  note.isImportant ? Icon(Icons.star,color: Colors.orange,size: 20.r,): Container(),
                ],
              ),
              SizedBox(height: 15.h),
              Expanded(child: Text(note.description,style: AppStyle.smallTextStyle,overflow: TextOverflow.fade)),
            ],
          ),
        ),
      ),
    );
  }
}
