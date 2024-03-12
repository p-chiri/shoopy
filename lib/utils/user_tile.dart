import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TUserTile extends StatelessWidget {
  const TUserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 50,
        child: ClipOval(
          child: Image.asset(
            "assets/images/programmer.png",
            width: 40, // Set the desired width
            height: 40, // Set the desired height
            fit: BoxFit.cover, // Adjust BoxFit as needed
          ),
        ),// Adjust the radius as needed

      ),
      title: Text("Arnold Mutai ", style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
      subtitle: Text("kipchirchir.arnold.mutai@gmail.com", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
      trailing: IconButton(onPressed: (){}, icon: const Icon(Iconsax.edit, color: Colors.white,)),
    );
  }
}