import 'package:flutter/material.dart';
import 'package:food_app/common/widgets/ui_card.dart';

class ItemCardLayout extends StatelessWidget {
  const ItemCardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sale',
                    style: Theme.of(context).textTheme.headlineSmall!,
                  ),
                  Text(
                    'Super Summer Sale',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                  )
                ],
              ),
              const Text('View all')
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              UICard(),
              UICard(),
              UICard(),
              UICard(),
            ],
          ),
        ),
      ],
    );
  }
}
