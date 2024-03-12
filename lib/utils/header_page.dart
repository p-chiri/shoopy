import 'package:flutter/material.dart';

import 'common_container.dart';
import 'curved_edges_widget.dart';


class THeaderScreen extends StatelessWidget {
  const THeaderScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdges(
              child: SizedBox(
                height: 120,
                child: Container(
                  //height: 250,
                  width: double.infinity,
                  color: Colors.green.shade400,
                  padding: const EdgeInsets.all(0.0),
                  child: Stack(
                    children: [
                      Positioned(top: -150, right: -250 ,child: TCircularcontainer(backgroundColor: Colors.white.withOpacity(0.1),)),
                      Positioned(top: 100, right: -300 ,child: TCircularcontainer(backgroundColor: Colors.white.withOpacity(0.1),)),
                      child,
                    ],
                  ),
                ),
              ),
            );

  }
}















//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:rentit/utils/extensions.dart';
//import 'package:rentit/values/app_colors.dart';

//import '../values/app_routes.dart';

/*class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: IconButton(
              onPressed: (){},
              icon: Icon(Icons.menu),
            ),
            title: Text("Fin Loans"),
            actions: [IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],
          )
        ],
      ),

    );
  }
}*/
