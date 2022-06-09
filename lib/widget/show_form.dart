import 'package:fire/controller/main_controller.dart';
import 'package:fire/models/user_model.dart';
import 'package:fire/pages/sign_up_page.dart';
import 'package:fire/pages/updatePage.dart';
import 'package:fire/utils/Dimensions.dart';
import 'package:fire/widget/big_text.dart';
import 'package:fire/widget/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowForm extends StatefulWidget {
  final isHeader;
  final UserModel? user;

  final List<dynamic> data;
  const ShowForm(
      {this.isHeader = false, required this.data, this.user, Key? key})
      : super(key: key);

  @override
  State<ShowForm> createState() => _ShowFormState();
}

class _ShowFormState extends State<ShowForm> {
  bool isSelectet = false;
  double cellHeight = Dimensions.screenHeight * .05;
  @override
  Widget build(BuildContext context) {
    double width = Dimensions.screenWidth * 1;

    return Container(
      // width: width,
      padding: EdgeInsets.only(left: width * .02, right: width * .02),
      foregroundDecoration: BoxDecoration(
          color: Colors.blue
              .withOpacity(isSelectet && !widget.isHeader ? 0.2 : 0)),
      child: Row(
        // scrollDirection: Axis.horizontal,
        children: [
          // serial number
          GestureDetector(
            onTap: () => setState(() {
              isSelectet = !isSelectet;
            }),
            child: Container(
              padding: cellPadding,
              width: width * .1,
              height: cellHeight,
              color: Colors.red,
              child: widget.isHeader
                  ? BigText(
                      widget.data[0],
                      size: Dimensions.font16,
                      fontWeight: FontWeight.bold,
                    )
                  : BigText(widget.data[0], size: Dimensions.font16 * .9),
            ),
          ),
          // elements
          Expanded(
              child: GestureDetector(
            onTap: () => setState(() {
              isSelectet = !isSelectet;
            }),
            child: Row(
              children: widget.data
                  .sublist(1, widget.data.length)
                  .asMap()
                  .entries
                  .map(
                    (e) => Container(
                      padding: cellPadding,
                      width: (width * .66) / (widget.data.length - 1),
                      height: cellHeight,
                      color:
                          e.key.isEven ? Colors.amber[100] : Colors.amber[500],
                      child: widget.isHeader
                          ? BigText(
                              e.value,
                              size: Dimensions.font16,
                              fontWeight: FontWeight.bold,
                            )
                          : BigText(e.value, size: Dimensions.font16 * .9),
                    ),
                  )
                  .toList(),
            ),
          )),
          // tools
          Container(
            padding: widget.isHeader ? cellPadding : EdgeInsets.all(5),
            width: width * .2,
            height: cellHeight,
            color: Colors.red,
            child: widget.isHeader
                ? BigText(
                    "Tools",
                    size: Dimensions.font16,
                    fontWeight: FontWeight.bold,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        GestureDetector(
                            onTap: () => setState(() {
                                  // ConfirmDialog(
                                  //   title: "",
                                  //   content: "",
                                  //   action: () => MainController.instance
                                  //       .deleteElement(
                                  //           tableName: "user",
                                  //           key: widget.id),
                                  // );
                                  deleteDialog(
                                      id: widget.user!.id!,
                                      name: widget.user!.name!);
                                }),
                            child: Icon(
                              Icons.delete_forever,
                              size: Dimensions.iconSize24 * 1.3,
                            )),
                        GestureDetector(
                            onTap: () => Get.to(UpdatePage(
                                  user: widget.user!,
                                )),
                            child: Icon(
                              Icons.edit,
                              size: Dimensions.iconSize24 * 1.3,
                            )),
                      ]),
          )
        ],
      ),
    );
  }

  EdgeInsetsGeometry get cellPadding =>
      EdgeInsets.only(top: cellHeight * .3, left: Dimensions.height5);

  // delete dialog
  Future<void> deleteDialog({required String id, required String name}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to delete $name'),
                // Text("plese select"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                setState(() {
                  MainController.instance
                      .deleteElement(tableName: "user", id: id);
                  Navigator.of(context).pop();
                  setState(() {});
                });
              },
            ),
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
