import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding:EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 170.h,
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
        height: 65.h,
        width: 65.w,
        child: FloatingActionButton(
          tooltip: 'Add note',
          child: Icon(
            Icons.add,
            size: 30.r,
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
  double get maxExtent => 300.h;

  @override
  double get minExtent => kToolbarHeight +30.h;

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
                      left: 0.w,
                      right: 0.w,
                      top: lerpDouble(0, 20.h, value),
                      bottom: 0.h,
                      child: Center(
                        child: Opacity(
                          opacity: value,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\n\n\nAll notes',
                                  style:AppStyle.largeTextStyle.copyWith(fontSize: 40.sp)
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
                  splashRadius: 20.r,
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
                    splashRadius: 20.r,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_rounded,
                        color: Colors.black),
                    splashRadius: 20.r,
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
