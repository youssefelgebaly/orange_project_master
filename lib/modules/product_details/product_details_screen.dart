import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_project_master/models/products_model.dart';
import 'package:orange_project_master/modules/product_details/bloc/cubit.dart';
import 'package:orange_project_master/modules/product_details/bloc/state.dart';

class ProductDetails extends StatelessWidget {
  final id;

  ProductDetails(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ProductDetailsCubit()..getProductDetails(id.toString()),
        child: BlocConsumer<ProductDetailsCubit, ProductDetailsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              //var list =ProductDetailsCubit.get(context).productDetails;

              return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    iconTheme: const IconThemeData(color: Colors.red),
                  ),
                  body:
                  //bodyBuild(context, ProductDetailsCubit.get(context).autoGenerate)
                  ConditionalBuilder(
                    condition:ProductDetailsCubit.get(context).product == null,
                    builder: (context)=> const Center(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: LinearProgressIndicator(color: Colors.red,),
                      ),
                    ),
                    fallback: ( context)=>bodyBuild(context,ProductDetailsCubit.get(context).product!),
                    ),

                    //     ListView.separated(
                    //   itemCount: 1,
                    //   separatorBuilder: (context,index)=>Divider(),
                    //   itemBuilder: (context,index)=> bodyBuild(context,list[index]),
                    // ),


                  );
            }));
  }
}

Widget bodyBuild(context,ProductDetailsModel productDetails,) {
   return ProductDetailsCubit.get(context).product == 0 ? Center(child: CircularProgressIndicator()) :
   SingleChildScrollView(
     child: Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
                height: 350,
                child: Image.network('${productDetails.productd!.avatar}')),
            SizedBox(
              height: 15,
            ),
            Text(productDetails.productd!.name!, style: Theme.of(context).textTheme.headline6),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "${productDetails.productd!.price.toString()} EGP",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                Spacer(),
                Container(
                  height: 25,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 50,
                    height: 25,
                    child: Center(child: Text('0'))),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 25,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: Icon(Icons.remove, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.black,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '${productDetails.productd!.description}Strike a modern and smart look wearing this shirt dress this season. Printed all over, it will enhance the look of your attire and the tie-up at the waist lends a better fit. It has short sleeves and is made from superior quality material',
              maxLines: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                color: Colors.red,
                height: 40,
              ),
            )
          ],
        ),
      ),
  ),
   );
}
