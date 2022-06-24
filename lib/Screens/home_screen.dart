import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:samsung_note/CustomWidget/base_container.dart';
import 'package:samsung_note/Database/database.dart';
import 'package:samsung_note/Screens/add_screen.dart';
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
    final size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        title: Text(
          "All notes",
          style: AppStyle.normalTextStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
        ],
      ),
      body: FutureBuilder<List<NoteEntityData>>(
        future: _database.getAllNotes(),
        builder: (context, snapshot) {
          final List<NoteEntityData>? notes = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                  color: Colors.deepOrange, size: 200),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (notes!.isNotEmpty) {
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                ));
          } else if (notes.isEmpty) {
            return Center(
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
            );
          }
          return const Text('No Data Found');
        },
      ),
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
