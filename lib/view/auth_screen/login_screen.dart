import 'package:emart_project/consts/consts.dart';
import 'package:emart_project/consts/lists.dart';
import 'package:emart_project/controllers/auth_controllers.dart';
import 'package:emart_project/view/auth_screen/singup.dart';
import 'package:emart_project/view/home_screen/home.dart';
import 'package:emart_project/widget_common/applogo_widget.dart';
import 'package:emart_project/widget_common/bg_widget.dart';
import 'package:emart_project/widget_common/custom_text_field.dart';
import 'package:emart_project/widget_common/our_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controllerValue = Get.put(AuthControllers());
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            "Log in to $appname".text.fontFamily(bold).size(18).white.make(),
            20.heightBox,
            Column(
              children: [
                customTextField(
                    hint: emailHint,
                    title: email,
                    isPass: false,
                    controller: controllerValue.emailController),
                customTextField(
                    hint: passwordHint,
                    title: password,
                    isPass: true,
                    controller: controllerValue.passwordController),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPass.text.make())),
                5.heightBox,
                outButton(
                  onPress: () async {
                    await controllerValue
                        .loginMethod(
                            context: context,
                            email: controllerValue.emailController.text,
                            passward: controllerValue.passwordController.text)
                        .then((value) {
                      if (value == null) {
                        VxToast.show(context, msg: loggedin);
                        Get.offAll(() => const Home());
                      }
                    });
                  },
                  color: redColor,
                  textColor: whiteColor,
                  title: login,
                ).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
                outButton(
                  onPress: () {
                    Get.to(() => const SingUpScreen());
                  },
                  color: lightGolden,
                  textColor: redColor,
                  title: singup,
                ).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                loginWith.text.color(fontGrey).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                socialIconList[index],
                                width: 30,
                              ),
                            ),
                          )),
                )
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
