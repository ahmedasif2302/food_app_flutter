import 'package:flutter/material.dart';
import 'package:food_app/common/utils/colors.dart';

class UICard extends StatelessWidget {
  const UICard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: 150,
      height: 260,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
        Radius.circular(10),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/photo.png',
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Doorthy perkins',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.grey,
                  fontSize: 11,
                ),
          ),
          Text(
            'Evening Dress',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black, fontSize: 16),
          ),
          Row(
            children: [
              Text(
                '\$15',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '\$12',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.primaryColor, fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
