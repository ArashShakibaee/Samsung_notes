import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samsung_note/CustomWidget/base_container.dart';
import 'package:samsung_note/Database/database.dart';
import 'package:samsung_note/Screens/add_screen.dart';
import 'package:samsung_note/Screens/details_screen.dart';
import 'package:samsung_note/SearchBar/search_bar.dart';
import '../app_style.dart';

class AnimatedAppBar extends StatefulWidget {
  final List<NoteEntityData> notes;

  const AnimatedAppBar({Key? key, required this.notes}) : super(key: key);

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
              delegate: CustomSliverAppBar(
                  notes: widget.notes,
                  onPressed: () => Scaffold.of(context).openDrawer()),
              pinned: true,
            ),
          ];
        },
        body: GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 170,
            crossAxisCount: 2,
          ),
          itemCount: widget.notes.length,
          itemBuilder: (context, index) {
            final note = widget.notes[index];
            return GestureDetector(
                onTap: () => Get.to(() => DetailsScreen(id: note.id)),
                child: BaseContainer(note: note));
          },
        ),
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

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  final List<NoteEntityData> notes;
  final VoidCallback onPressed;

  CustomSliverAppBar({required this.notes, required this.onPressed});

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => kToolbarHeight +30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return this != oldDelegate;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade200, boxShadow: [
        BoxShadow(
          color: Colors.black45,
          blurRadius: shrinkOffset > kToolbarHeight ? 2 : 0,
        ),
      ]),
      child: Column(
        children: [
          Flexible(
            child: TweenAnimationBuilder<double>(
              tween: Tween(end: shrinkOffset < minExtent ? 1 : 0),
              duration: const Duration(milliseconds: 250),
              builder: (context, value, child) {
                return Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: lerpDouble(0, 20, value),
                      bottom: 0,
                      child: Center(
                        child: Opacity(
                          opacity: value,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\n\n\nAll notes',
                                  style:AppStyle.largeTextStyle.copyWith(fontSize: 40)
                                ),
                                TextSpan(
                                  text: '\n\n${notes.length} notes',
                                  style:AppStyle.normalTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          TweenAnimationBuilder<double>(
            tween: Tween(end: shrinkOffset > kToolbarHeight ? 1 : 0),
            duration: const Duration(milliseconds: 250),
            builder: (context, value, child) {
              return AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.menu_rounded, color: Colors.black),
                  splashRadius: 20,
                ),
                title: Opacity(
                  opacity: value,
                  child: Text(
                    "All notes",
                    style: AppStyle.normalTextStyle
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: ()=>Get.to(()=>SearchBar(notes: notes)),
                    icon: const Icon(Icons.search_rounded, color: Colors.black),
                    splashRadius: 20,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_rounded,
                        color: Colors.black),
                    splashRadius: 20,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
