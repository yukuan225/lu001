import 'package:flutter/material.dart';
import '../../common/values/values.dart';

import '../../common/widget/action_input.dart';
import '../../common/widget/find_config.dart';

class FindBottomTool extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final ActionTextSubmit submitAction;
  final FindActionCallBack actionCallback;
  final bool agreeState;
  final bool collectionState;
  final String agreeCount;
  final String collectionCount;
  final Color backcolorColor;
  final Color inputBackColor;
  final Color mainColor;
  final bool showBorder;

  const FindBottomTool({
    Key? key,
    required this.focusNode,
    required this.controller,
    required this.submitAction,
    required this.actionCallback,
    this.agreeState = false,
    this.collectionState = false,
    this.agreeCount = '0',
    this.collectionCount = '0',
    this.backcolorColor = PFc.backgroundPrimary,
    this.inputBackColor = Colors.white,
    this.mainColor = Colors.amber,
    this.showBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    
    Container(
      height: 57,
      color: backcolorColor,
      padding: const EdgeInsets.only(left: 30 , bottom: 10, right: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 12, right: 30, top: 7, bottom: 7),
                decoration: BoxDecoration(
                    color: inputBackColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Text('快来评论吧...',
                    style: TextStyle(fontSize: 15, color: mainColor)),
              ),
              onTap: () {
                TKActionComment.showActionSheet(context,
                    focusNode: focusNode,
                    textController: controller,
                    placehold: '快来评论吧...', 
                    submitAction: (text) {
                  submitAction(text);
                });
              },
            ),
            Row(
              children: <Widget>[
                bottomItem(agreeState ? Icons.favorite : Icons.favorite_border,
                    agreeState ? Colors.black : mainColor, agreeCount, 0),
                const SizedBox(width: 30),
                bottomItem(
                    collectionState ? Icons.star : Icons.star_border,
                    collectionState ? Colors.red : mainColor,
                    collectionCount,
                    1)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget bottomItem(IconData icon, Color iconColor, String number, int index) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 20,
            color: iconColor,
          ),
          Text(number, style: TextStyle(fontSize: 13, color: mainColor))
        ],
      ),
      onTap: () {
        if (index == 0) {
          actionCallback(FindActionType.agree);
        } else if (index == 1) {
          actionCallback(FindActionType.collection);
        }
      },
    );
  }
}
