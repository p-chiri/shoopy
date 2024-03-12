import 'package:flutter/cupertino.dart';

import '../screens/common_shapes/category_container.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index){
          return CategoryContainer(image: 'assets/images/shoes.png', title: 'Camera', onTap: (){},);
        },
      ),
    );
  }
}
