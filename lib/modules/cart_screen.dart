import 'package:flutter/material.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Expanded(
          child: ListView.separated(
             itemCount: 5,
            separatorBuilder: (context,index)=>Divider(),
            itemBuilder: (context,index)=>buildCartItem(context),
          ),
        ),
        
        Container(
          height: 60,
          child: Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(onPressed: (){},child: const Text('Clear Cart',style: TextStyle(color: Colors.black,fontSize: 18),),color: Colors.white,height: 50,),
              )),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(onPressed: (){},child: const Text('Go to Checkout',style: TextStyle(color: Colors.white,fontSize: 18),),color: Colors.red,height: 50,),
              ))
            ],
          ),
        )
      ],
    );
  }
}

Widget buildCartItem(context)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(

    child:   Row(



      children: [

        Container(

          width: 100,
          height: 100,
          child: Image.network("https://retail.amit-learning.com/images/products/mFXrS9i3y07IT9ic7jgcfq90GtMhf91WdlydLsnt.jpg",),
        ),

        SizedBox(width: 20,),

        Expanded(

          child: Column(



            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(

                'Three Men Socks Ankle',

                maxLines: 1,

                overflow: TextOverflow.ellipsis,

                style: Theme.of(context).textTheme.subtitle2,



              ),

              Text(

                'Solo Bundle OF Three Men Socks Ankle',

                style: Theme.of(context).textTheme.caption,

                maxLines: 1,

                overflow: TextOverflow.ellipsis,

              ),

              SizedBox(height: 30,),

              Padding(

                padding: const EdgeInsets.all(10.0),

                child: Row(

                  children: [

                    Text(

                      "300 EGP",

                      style: TextStyle(fontSize: 20, color: Colors.red,),

                    ),

                    Spacer(),

                    Container(

                      height: 20,

                      width: 30,

                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(8),

                        color: Colors.red,



                      ),

                      child: Icon(Icons.add,color: Colors.white,size: 15,),),

                    const SizedBox(width: 5,),

                    Container(

                        decoration: BoxDecoration(

                          border: Border.all(color: Colors.grey),

                          borderRadius: BorderRadius.circular(5),

                        ),

                        width: 50,

                        height: 25,

                        child: Center(child: Text('0'))),

                    const SizedBox(width: 5,),

                    Container(

                      height: 20,

                      width: 30,

                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(8),

                        color: Colors.red,



                      ),

                      child: Icon(Icons.remove,color:Colors.white,size:15,),



                    ),



                  ],

                ),

              ),



            ],

          ),

        )

      ],



    ),

  ),
);