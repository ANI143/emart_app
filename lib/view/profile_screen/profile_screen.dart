import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_project/consts/consts.dart';
import 'package:emart_project/consts/lists.dart';
import 'package:emart_project/controllers/auth_controllers.dart';
import 'package:emart_project/services/firestore_services.dart';
import 'package:emart_project/view/auth_screen/login_screen.dart';
import 'package:emart_project/view/profile_screen/component/detail_card.dart';
import 'package:emart_project/view/profile_screen/edit_profile_screen.dart';
import 'package:emart_project/widget_common/bg_widget.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controllers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileControllers());
    return bgWidget(
        child: Scaffold(
            body: StreamBuilder(
                stream: FireStoreServices.getUser(currentUser!.uid),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      ),
                    );
                  } else {
                    var data2 = snapshot.data!.docs[0];

                    return SafeArea(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.edit,
                              color: whiteColor,
                            ),
                          ).onTap(() {
                            // Get.put(ProfileControllers());
                            controller.nameController.text = data2['name'];
                            controller.passController.text = data2['password'];
                            Get.to(() => EditProfileScreen(
                                  data: data2,
                                ));
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              data2['imageUrl'] == ''
                                  ? Image.asset(
                                      imgProfile2,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make()
                                  : Image.network(
                                      data2['imageUrl'],
                                      width: 60,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make(),
                              10.heightBox,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "${data2['name']}"
                                        .text
                                        .fontFamily(semibold)
                                        .white
                                        .make(),
                                    5.heightBox,
                                    "${data2['email']}".text.white.make()
                                  ],
                                ),
                              ),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side:
                                          const BorderSide(color: whiteColor)),
                                  onPressed: () async {
                                    await Get.put(AuthControllers())
                                        .signOutMethod(context);
                                    Get.offAll(() => const LoginScreen());
                                  },
                                  child: logout.text
                                      .fontFamily(semibold)
                                      .white
                                      .make())
                            ],
                          ),
                        ),
                        20.heightBox,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              detailCard(
                                  width: context.screenWidth / 3.4,
                                  count: "${data2['cart_count']}",
                                  title: "In your card"),
                              detailCard(
                                  width: context.screenWidth / 3.4,
                                  count: "${data2['wishlist_count']}",
                                  title: "In your Wishlist"),
                              detailCard(
                                  width: context.screenWidth / 3.4,
                                  count: "${data2['order_count']}",
                                  title: "Your Orders"),
                            ]),

                        //Button Section

                        ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: lightGrey,
                            );
                          },
                          itemCount: profileButtonList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.asset(
                                profileButtonIcon[index],
                                width: 22,
                              ),
                              title: profileButtonList[index]
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                            );
                          },
                        )
                            .box
                            .white
                            .rounded
                            .padding(const EdgeInsets.symmetric(horizontal: 16))
                            .shadowSm
                            .margin(const EdgeInsets.all(12))
                            .make()
                            .box
                            .color(redColor)
                            .make()
                      ],
                    ));
                  }
                })));
  }
}
