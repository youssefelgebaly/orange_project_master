import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 40, bottom: 80),
          child: Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: Icon(Icons.person,size: 40,color: Colors.red,),
                    radius: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Youssef ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Column(
                children: const <Widget>[
                  NewRow(
                    text: 'Profile',
                    icon: Icons.person,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NewRow(
                    text: 'Settings',
                    icon: Icons.settings,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NewRow(
                    text: 'Categories',
                    icon: Icons.widgets_sharp,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NewRow(
                    text: 'Cart',
                    icon: Icons.shopping_cart,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NewRow(
                    text: 'Favorites',
                    icon: Icons.favorite,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen();
                          },
                    icon: const Icon(Icons.cancel),
                    color: Colors.white.withOpacity(0.5),),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Log out',
                    style: TextStyle(color: Colors.white.withOpacity(0.5)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const NewRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}