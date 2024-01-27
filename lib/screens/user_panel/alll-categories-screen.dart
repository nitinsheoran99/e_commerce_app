

import 'package:e_commerce_app/e_commerce.dart';
import 'package:flutter/cupertino.dart';


class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: const Text(
          "All Categories",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('categories').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: Get.height / 5,
              child: const Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No category found!"),
            );
          }

          if (snapshot.data != null) {
            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    childAspectRatio: 1.19),
                 itemBuilder: (context, index) {
              CategoriesModel categoriesModel = CategoriesModel(
                categoryId: snapshot.data!.docs[index]['categoryId'],
                categoryImg: snapshot.data!.docs[index]['categoryImg'],
                categoryName: snapshot.data!.docs[index]['categoryName'],
                createdAt: snapshot.data!.docs[index]['createdAt'],
                updatedAt: snapshot.data!.docs[index]['updatedAt'],
              );
              return Row(
                children: [
                  GestureDetector(
                    onTap: ()=>Get.to(()=>SingleCategoryProductScreen(categoryId: categoriesModel.categoryId)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FillImageCard(
                        borderRadius: 20.0,
                        width: Get.width / 2.3,
                        heightImage: Get.height / 10,
                        imageProvider: CachedNetworkImageProvider(
                          categoriesModel.categoryImg,
                        ),
                        title: Center(
                          child: Text(
                            categoriesModel.categoryName,
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            );
            //   SizedBox(
            //   height: Get.height / 5.5,
            //   child: ListView.builder(
            //     itemCount: snapshot.data!.docs.length,
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //
            //   ),
            // );
          }

          return Container();
        },
      ),
    );
  }
}
