import 'dart:io';

import 'package:emart_project/consts/consts.dart';
import 'package:emart_project/controllers/profile_controllers.dart';
import 'package:emart_project/widget_common/bg_widget.dart';
import 'package:emart_project/widget_common/custom_text_field.dart';
import 'package:emart_project/widget_common/our_button.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllers());

    var controller = Get.find<ProfileControllers>();
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            data['imageUrl'] == '' && controller.profileImagePath.isEmpty
                ? Image.asset(
                    imgProfile2,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                : data['imageUrl'] == '' && controller.profileImagePath.isEmpty
                    ? Image.network(data['imageUrl'],
                            width: 100, fit: BoxFit.cover)
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make()
                    : Image.file(
                        File(controller.profileImagePath.value),
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            outButton(
                color: redColor,
                onPress: () {
                  // Get.find<ProfileControllers>().changeImage(context);
                  controller.changeImage(context);
                },
                textColor: whiteColor,
                title: "Change"),
            const Divider(),
            20.heightBox,
            customTextField(
                controller: controller.nameController,
                hint: nameHit,
                title: name,
                isPass: false),
            customTextField(
                controller: controller.passController,
                hint: passwordHint,
                title: password,
                isPass: true),
            20.heightBox,
            controller.isloding.value
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  )
                : SizedBox(
                    width: context.screenWidth - 60,
                    child: outButton(
                        color: redColor,
                        onPress: () async {
                          await controller.uploadProfileImage();
                          await controller.updateProfile(
                              name: controller.nameController.text,
                              password: controller.passController.text,
                              imgUrl: controller.profileImageLink);
                          VxToast.show(context, msg: "Updated");
                        },
                        textColor: whiteColor,
                        title: "Save"),
                  ),
          ],
        )
            .box
            .white
            .shadowSm
            .padding(const EdgeInsets.all(16))
            .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    ));
  }
}
