import 'package:flutter/material.dart';

import '../screens/common_shapes/appbar.dart';
import '../screens/common_shapes/cart_icon_menu.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good day for shooping", style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.grey[200]),),
          Text("Arnold Mutai", style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
        ],
      ),
      actions: [
        TCartCounter(onPressed: () {  }, iconColor: Colors.white,)
      ],
    );
  }
}