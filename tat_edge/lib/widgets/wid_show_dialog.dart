import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tat_edge/widgets/wid_txt.dart';

import '../singleton.dart';
import 'central_txt_widget.dart';

class WidShowDialog extends StatefulWidget {
  const WidShowDialog({Key key}) : super(key: key);

  @override
  _WidShowDialogDialogState createState() => _WidShowDialogDialogState();
}

class _WidShowDialogDialogState extends State<WidShowDialog>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  var s2 = Singleton.instance;
  TextEditingController controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
    );
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      insetPadding: EdgeInsets.all(15.0),
      backgroundColor: Colors.transparent,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () => {
              Navigator.pop(context),
              //Navigator.pop(context, true);
            },
            // onTap: () => ExtendedNavigator.of(context).pop(),
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
              //  left: 23.75,
              top: 20.0,
              bottom: 21.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WidText(
                      title: 'CREATE NOTE',
                      widColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      enabled: true,
                      cursorColor: Colors.black,
                      cursorHeight: 20,
                      cursorWidth: 2,
                      maxLines: 10,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      textInputAction: TextInputAction.search,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (value) {},
                      controller: controller,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        hintText: 'Insert Text here..',
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const WidText(
                      title: 'Upload attachment',
                      widColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
