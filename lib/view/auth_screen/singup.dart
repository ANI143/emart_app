import 'package:emart_project/consts/consts.dart';
import 'package:emart_project/controllers/auth_controllers.dart';
import 'package:emart_project/view/home_screen/home.dart';
import 'package:emart_project/widget_common/applogo_widget.dart';
import 'package:emart_project/widget_common/bg_widget.dart';
import 'package:emart_project/widget_common/custom_text_field.dart';
import 'package:emart_project/widget_common/our_button.dart';
import 'package:get/get.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  bool isCheck = false;
  var controller = Get.put(AuthControllers());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            "Join the $appname".text.fontFamily(bold).size(18).white.make(),
            20.heightBox,
            Column(
              children: [
                customTextField(
                    hint: nameHit,
                    title: name,
                    controller: nameController,
                    isPass: false),
                customTextField(
                    hint: emailHint,
                    title: email,
                    controller: emailController,
                    isPass: false),
                customTextField(
                    hint: passwordHint,
                    title: password,
                    controller: passwordController,
                    isPass: true),
                customTextField(
                    hint: passwordHint,
                    title: retypepass,
                    controller: passwordRetypeController,
                    isPass: true),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPass.text.make())),
                Row(
                  children: [
                    Checkbox(
                        checkColor: redColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue!;
                          });
                        }),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "I Agree to the ",
                            style: TextStyle(
                                fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: termAndCondition,
                            style: TextStyle(
                                fontFamily: regular, color: redColor)),
                        TextSpan(
                            text: " & ",
                            style: TextStyle(
                                fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: privacyPolisy,
                            style: TextStyle(
                                fontFamily: regular, color: redColor)),
                      ])),
                    ),
                  ],
                ),
                5.heightBox,
                outButton(
                  onPress: () async {
                    if (isCheck != false) {
                      try {
                        await controller
                            .signUpMethod(
                                context: context,
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          return controller.storeUserData(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                          );
                        }).then((value) {
                          VxToast.show(context, msg: loggedin);
                          Get.offAll(() => Home());
                        });
                      } catch (e) {
                        auth.signOut();
                        print('data not found');
                        VxToast.show(context, msg: e.toString());
                      }
                    }
                  },
                  color: isCheck == true ? redColor : lightGrey,
                  textColor: whiteColor,
                  title: singup,
                ).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: alredyHaveAccount,
                      style: TextStyle(fontFamily: bold, color: fontGrey)),
                  TextSpan(
                      text: login,
                      style: TextStyle(fontFamily: bold, color: redColor)),
                ])).onTap(() {
                  Get.back();
                })
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ],
        ),
      ),
    ));
  }
}
