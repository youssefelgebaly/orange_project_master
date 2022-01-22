import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange_project_master/models/products_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 1 / 1.6,
        padding: const EdgeInsets.all(10),
        children: List.generate(
          products.length,
          (index) =>
              GestureDetector(child: buildProduct(products[index], context)),
        ),
      ),
    );
  }
}

Widget buildProduct(Product products, context) => Column(
      // alignment: AlignmentDirectional.bottomCenter,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  products.imageName,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 80,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              color:Colors.white70
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  products.subTitle,
                  style: Theme.of(context).textTheme.caption,
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
                      '${products.price} EGP',
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
    );
