import 'package:flutter/widgets.dart';
import 'package:fruitify/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: const FeaturedItem(),
          );
        }),
      ),
    );
  }
}
