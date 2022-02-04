import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:orange_project_master/layout/bloc/cubit.dart';
import 'package:orange_project_master/layout/bloc/state.dart';
import 'package:orange_project_master/modules/product_details/bloc/cubit.dart';
import 'package:orange_project_master/modules/product_details/product_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingAppCubit, ShoppingAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = ShoppingAppCubit.get(context).products;

        return ConditionalBuilder(
            condition: ShoppingAppCubit.get(context).products !=null,
            builder: (context) => SafeArea(
                  child: GridView.count(
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 7.0,
                    crossAxisSpacing: 7.0,
                    childAspectRatio: 1 / 1.6,
                    padding: const EdgeInsets.all(10),
                    children: List.generate(
                      list.length,
                      (index) => GestureDetector(
                          child: buildProduct(list[index], context),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)
                              {
                                return ProductDetails(list[index]['id']);

                              }),
                          );
                        },
                      ),
                    ),
                  ),
                ),
            fallback: (context) => Center(
                  child: Lottie.network(
                      'https://assets7.lottiefiles.com/packages/lf20_47pyyfcf.json'),
                ));
      },
    );
  }
}

// Widget productsBuilder(AutoGenerate model,context) => SafeArea(
//       child: GridView.count(
//         physics: const BouncingScrollPhysics(),
//         crossAxisCount: 2,
//         mainAxisSpacing: 7.0,
//         crossAxisSpacing: 7.0,
//         childAspectRatio: 1 / 1.6,
//         padding: const EdgeInsets.all(10),
//         children: List.generate(
//           5 ,
//           (index) => GestureDetector(
//               child: buildProduct(model.products[index], context)),
//         ),
//       ),
//     );

Widget buildProduct(products, context) => Stack(
      children: [
        Column(
          // alignment: AlignmentDirectional.bottomCenter,
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          products['avatar'],
                        ),
                      ),
                    ),
                  ),
                  if (products['discount'] != 0)
                    Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    color: Colors.red[500],
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  color: Colors.white70),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products['title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      products['name'],
                      style: Theme.of(context).textTheme.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red),
                        ),
                        const Spacer(),
                        Text(
                          products['price_final_text'],
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        if (products['discount'] != 0)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.grey[100],
            padding: EdgeInsets.symmetric(horizontal: 3.0),
            child: Text(
              '${products['discount']}% OFF',
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
