import 'package:flutter/material.dart';
import 'package:food_app/common/utils/colors.dart';
import 'package:food_app/common/widgets/item_card_layout.dart';
import 'package:food_app/common/widgets/ui_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset(
                'images/car1.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
                child: Text(
                  'Street clothes',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        letterSpacing: 4,
                      ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const ItemCardLayout(),
          const SizedBox(
            height: 10,
          ),
          const ItemCardLayout(),
        ],
      ),
    );
  }
}
