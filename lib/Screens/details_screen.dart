import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:samsung_note/CustomWidget/custom_dialog.dart';
import 'package:samsung_note/Database/database.dart';
import 'package:samsung_note/Screens/edit_screen.dart';
import 'package:samsung_note/app_style.dart';

import 'home_screen.dart';

class DetailsScreen extends StatefulWidget {
  final int id;

  const DetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Database _database;
  late NoteEntityData _noteData;

  @override
  void initState() {
    super.initState();
    _database = Database();
    getSingleNote();
  }

  @override
  void dispose() {
    _database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.Hm().format(_noteData.createdTime);
    final dateTime = DateFormat.yMMMd().format(_noteData.createdTime);
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          leading: IconButton(
              splashRadius: 20,
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
                splashRadius: 20,
                onPressed: () => Get.to(() => EditScreen(
                      id: widget.id,
                    )),
                icon: const Icon(Icons.edit)),
            IconButton(
                splashRadius: 20,
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      context: context,
                      noButtonText: "Cancel",
                      yesButtonText: "Delete",
                      onTapConfirmed: deleteButton,
                      content: "Delete note ?",
                    ),
                  );
                },
                icon: const Icon(Icons.delete)),
          ]),
      body: FutureBuilder(
          future: getSingleNote(),
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _noteData.title,
                        style: AppStyle.titleTextStyle,
                      ),
                      _noteData.isImportant
                          ? const Icon(Icons.star, color: Colors.orange)
                          : Container(),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text(_noteData.description,
                      style: AppStyle.descriptionTextStyle),
                  const SizedBox(height: 50),
                  Text(
                    "Created time: $time",
                    style: AppStyle.smallTextStyle
                        .copyWith(fontSize: 16, color: Colors.grey.shade500),
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Created Datetime: $dateTime",
                    style: AppStyle.smallTextStyle
                        .copyWith(fontSize: 16, color: Colors.grey.shade500),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            );
          }),
    );
  }

  Future getSingleNote() async {
    _noteData = await _database.getSingleNote(widget.id);
    setState(() {});
  }

  void deleteButton()  {
    _database.deleteNote(widget.id).then((value) { Get.snackbar(
        backgroundColor: Colors.deepOrange.withOpacity(0.3),
        "Note Deleted !",
        "${_noteData.title == "" ? "The Note": _noteData.title} deleted in Notebook Successfully"
    );
    Get.to(()=> const HomeScreen());
    });
  }
}
