import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samsung_note/CustomWidget/base_container.dart';
import 'package:samsung_note/Database/database.dart';
import 'package:samsung_note/app_style.dart';

import '../Screens/details_screen.dart';

class SearchBar extends StatefulWidget {
  final List<NoteEntityData> notes;

  const SearchBar({Key? key, required this.notes}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<NoteEntityData>? _foundedUser = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(()=>_foundedUser = widget.notes);
  }
  onSearch(String search){
    setState((){
      _foundedUser = widget.notes.where((note) => note.title.toLowerCase().contains(search)).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: ()=>Get.back(), icon: const Icon(Icons.arrow_back_ios)),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.close))],
        title: TextField(
          onChanged: (search)=>onSearch(search),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search notes",
            hintStyle: AppStyle.normalTextStyle,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 170,
              crossAxisCount: 2,
            ),
            itemCount: _foundedUser!.length,
            itemBuilder: (context, index) {
              final note = _foundedUser![index];
              return GestureDetector(
                  onTap: () => Get.to(() => DetailsScreen(id: note.id)),
                  child: BaseContainer(note: note));
            },
          )),
    );
  }
}
