import 'package:emart_project/consts/colors.dart';
import 'package:emart_project/widget_common/our_button.dart';
import 'package:emart_project/widget_common/rounded_border_button.dart';
import 'package:flutter/material.dart';

class modalbottomsheet {
  static void moremodalbottomsheet(context) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: size.height * 0.3,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SizedBox(
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Confirm",
                      style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300)
                          .copyWith(color: Colors.blueAccent),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Are you sure you want to logout?',
                      style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w300)
                          .copyWith(color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: RoundedBorderButton(
                            height: 60,
                            onTap: () {},
                            bColor: Colors.blue,
                            tColor: Colors.blue,
                            text: "Yes",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        outButton(
                            onPress: () {
                              Navigator.of(context).pop();
                            },
                            title: "No"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
