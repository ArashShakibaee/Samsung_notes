import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samsung_note/app_style.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback onTapConfirmed;
  final String content;
  final String yesButtonText;
  final String noButtonText;
  final BuildContext context;

  const CustomDialog(
      {Key? key,
      required this.onTapConfirmed,
      required this.content,
      required this.noButtonText,
      required this.context,
      required this.yesButtonText})
      : super(key: key);

  static void show({
    required BuildContext context,
    bool isDismissible = false,
    required Function() onTapConfirmed,
    required String title,
    required String content,
    required String yesButtonText,
    required String noButtonText,
  }) {
    showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (context) => CustomDialog(
        context: context,
        noButtonText: noButtonText,
        yesButtonText: yesButtonText,
        onTapConfirmed: onTapConfirmed,
        content: content,
      ),
    );
  }

  BorderRadius getBorderRadiusOfAlertDialog() {
    if (Localizations.localeOf(context).languageCode == 'fa') {
      return const BorderRadius.only(
          topLeft: Radius.circular(100), bottomRight: Radius.circular(100));
    } else {
      return const BorderRadius.only(
          topRight: Radius.circular(100), bottomLeft: Radius.circular(100));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(8),
      contentPadding: const EdgeInsets.fromLTRB(32.0, 24.0, 24.0, 24.0),
      alignment: Alignment.bottomCenter,
      backgroundColor: Colors.grey.shade200,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      content: Builder(
        builder: (context) {
          final width = MediaQuery.of(context).size.width;
          return SizedBox(
            width: width,
            child: Text(
              content,
              style: AppStyle.normalTextStyle.copyWith(fontSize: 15),
            ),
          );
        }
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  noButtonText,
                  style: AppStyle.normalTextStyle
                      .copyWith(color: Colors.grey.shade600, fontSize: 15),
                )),
            Container(
              color: Colors.grey.shade400,
              width: 2,
              height: 30,
            ),
            TextButton(
                onPressed: () => onTapConfirmed.call(),
                child: Text(
                  yesButtonText,
                  style: AppStyle.normalTextStyle
                      .copyWith(color: Colors.deepOrange, fontSize: 15),
                )),
          ],
        )
      ],
    );
  }
}
