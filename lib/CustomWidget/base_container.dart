import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 4,
              ),
              const SizedBox(height: 6),
              Text(note.title,style: AppStyle.normalTextStyle,),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(dateTime,style: AppStyle.smallTextStyle.copyWith(color: Colors.grey),),
                  note.isImportant ? const Icon(Icons.star,color: Colors.orange,size: 20,): Container(),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(child: Text(note.description,style: AppStyle.smallTextStyle,overflow: TextOverflow.fade)),
            ],
          ),
        ),
      ),
    );
  }
}
