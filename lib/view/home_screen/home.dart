import 'package:emart_project/consts/consts.dart';
import 'package:emart_project/controllers/home_controllers.dart';
import 'package:emart_project/view/profile_screen/profile_screen.dart';
import 'package:emart_project/view/cart_screen/cart_screen.dart';
import 'package:emart_project/view/categories_screen/category_screen.dart';
import 'package:emart_project/view/home_screen/home_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];

    var naveBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: naveBody.elementAt(controller.currentNaveIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: whiteColor,
          currentIndex: controller.currentNaveIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          items: navbarItem,
          onTap: (value) {
            controller.currentNaveIndex.value = value;
          },
        ),
      ),
    );
  }
}
