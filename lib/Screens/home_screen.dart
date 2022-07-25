import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:samsung_note/CustomWidget/base_container.dart';
import 'package:samsung_note/CustomWidget/home_scaffold.dart';
import 'package:samsung_note/Database/database.dart';
import 'package:samsung_note/Screens/details_screen.dart';
import 'package:samsung_note/app_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Database _database;

  @override
  void initState() {
    _database = Database();
    super.initState();
  }

  @override
  void dispose() {
    _database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NoteEntityData>>(
      future: _database.getAllNotes(),
      builder: (context, snapshot) {
        final List<NoteEntityData>? notes = snapshot.data;
        if (snapshot.connectionState != ConnectionState.done) {
          return HomeScaffold(
            notes: notes,
            body: Center(
              child: LoadingAnimationWidget.inkDrop(
                  color: Colors.deepOrange, size: 35),
            ),
          );
        } else if (snapshot.hasError) {
          return HomeScaffold(
            notes: notes,
            body: Center(
              child: LoadingAnimationWidget.inkDrop(
                  color: Colors.deepOrange, size: 35),
            ),
          );
        } else if (notes!.isNotEmpty) {
          return HomeScaffold(
            notes: notes,
            body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 170,
                    crossAxisCount: 2,
                  ),
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return GestureDetector(
                        onTap: () => Get.to(() => DetailsScreen(id: note.id)),
                        child: BaseContainer(note: note));
                  },
                )),
          );
        } else if (notes.isEmpty) {
          return HomeScaffold(
            notes: notes,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No notes",
                    style: AppStyle.normalTextStyle.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Text("Tap the Add button to create a note",
                      style: AppStyle.normalTextStyle
                          .copyWith(color: Colors.grey.shade500, fontSize: 17)),
                ],
              ),
            ),
          );
        }
        return const Text('No Data Found');
      },
    );
  }
}
