

import 'package:e_commerce_app/e_commerce.dart';

import 'all-flash-sale-product-screen.dart';
import 'all-product-screen.dart';
import 'cart-screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppConstant.appTextColor),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          AppConstant.appMainName,
          style: const TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => const CartScreen()),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        ],

      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 90.0,
            ),

            const BannerWidget(),

            //heading
            HeadingWidget(
              headingTitle: "Categories",
              headingSubTitle: "According to your budget",
              onTap: () => Get.to(()=>const AllCategoriesScreen()),
              buttonText: "See More >",
            ),

            const CategoriesWidget(),

            HeadingWidget(
              headingTitle: "Flash Sale",
              headingSubTitle: "According to your budget",
              onTap: () =>Get.to(()=>const AllFlashSaleProductScreen()),
              buttonText: "See More >",
            ),

            const FlashSaleWidget(),
            HeadingWidget(
              headingTitle: "All Products",
              headingSubTitle: "According to your budget",
              onTap: () => Get.to(() => const AllProductsScreen()),
              buttonText: "See More >",
            ),

            const AllProductsWidget(),
          ],
        ),
      ),
    );
  }
}
