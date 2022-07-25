import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samsung_note/Database/database.dart';
import 'package:samsung_note/Screens/add_screen.dart';
import 'package:samsung_note/SearchBar/search_bar.dart';
import 'package:samsung_note/app_style.dart';

class HomeScaffold extends StatelessWidget {
  final Widget body;
  final List<NoteEntityData>? notes;
  const HomeScaffold({Key? key,required this.body,required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        title: Text(
          "All notes",
          style: AppStyle.normalTextStyle
              .copyWith(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(onPressed: () =>Get.to(()=>SearchBar(notes: notes!)), icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined))
        ],
      ),
      body: body,
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          tooltip: 'Add note',
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () => Get.to(() => const AddScreen()),
        ),
      ),
    );
  }
}
