import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import "package:transparent_image/transparent_image.dart";

import '../models/meals.dart';

class MealItem extends StatelessWidget {

  final Meal meal;
  const MealItem({
    super.key,
    required this.meal
  });

  @override
  Widget build(BuildContext context) {


    return Card(
      child: InkWell(
        onTap: (){},
        child: Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(meal.title, maxLines: 2, textAlign: TextAlign.center,),
                      const SizedBox(height: 12,),
                      Row(
                        children: [

                        ],
                      )
                    ]
                  )
                ))
          ],
        )
      )
    );
  }
}