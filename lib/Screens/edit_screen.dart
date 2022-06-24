import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samsung_note/Database/database.dart';
import 'package:samsung_note/Screens/home_screen.dart';
import 'package:samsung_note/app_style.dart';
import 'package:drift/drift.dart' as drift;

class EditScreen extends StatefulWidget {
  final int id;
  const EditScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late Database _database;
  late NoteEntityData _noteData;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool isImportant = false;

  @override
  void initState() {
    _database = Database();
    getNote();
    super.initState();
  }
  @override
  void dispose() {
    _database.close();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future getNote()async{
    _noteData = await _database.getSingleNote(widget.id);
    setState((){});
    _titleController.text = _noteData.title;
    _descriptionController.text =_noteData.description;
    isImportant = _noteData.isImportant;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              onPressed: () => setState(() => isImportant = !isImportant),
              icon: isImportant
                  ? const Icon(Icons.star, color: Colors.orange)
                  : const Icon(Icons.star_border)),
          Container(
              padding: const EdgeInsets.all(8),
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                  onPressed:_onPressedSaveButton,
                  child: Text(
                    "Save",
                    style: AppStyle.normalTextStyle.copyWith(
                        color: Colors.grey.shade800),
                  ))),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                    counterText: "",
                    hintText: "Title",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontFamily: "Source",
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    border: InputBorder.none),
                cursorHeight: 22,
                minLines: 1,
                maxLength: 30,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontFamily: "Source"),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: "Notes",
                  hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontFamily: "Source",
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  border: InputBorder.none,
                ),
                cursorHeight: 22,
                maxLines: null,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: "Source"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressedSaveButton() async{
    if (_descriptionController.text != "" || _titleController.text != "") {
        final entity = NoteEntityCompanion(
            id: drift.Value(widget.id),
            createdTime: drift.Value(DateTime.now()),
            isImportant: drift.Value(isImportant),
            title: drift.Value(_titleController.text),
            description: drift.Value(_descriptionController.text));
        await _database.updateNote(entity).whenComplete(() {
          Get.snackbar(
              backgroundColor: Colors.deepOrange.withOpacity(0.3),
              "Note Edited !",
              "${_titleController.text == "" ? "The Note":_titleController.text} edited in Notebook Successfully");
          Get.to(() => const HomeScreen());
      });
    } else if (_descriptionController.text ==""&&_titleController.text =="") {
        Get.snackbar(
            backgroundColor: Colors.deepOrange.withOpacity(0.3),
            "ERROR !",
            "You have to fill Title OR Note part");
    }
  }
}
