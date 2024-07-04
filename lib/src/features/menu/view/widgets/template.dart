import 'package:flutter/material.dart';
import 'package:summer_practicum/src/features/menu/models/menu_category.dart';
import 'package:summer_practicum/src/features/menu/models/menu_item.dart';
import 'package:summer_practicum/src/theme/app_colors.dart';
import 'package:summer_practicum/src/theme/image_sources.dart';

class CategorySection extends StatelessWidget {
  final MenuCategory category;

  const CategorySection({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            category.categoryName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14.0,
            crossAxisSpacing: 14.0,
            mainAxisExtent: 200,
          ),
          itemCount: category.items.length,
          itemBuilder: (context, index) {
            return MenuItemCard(item: category.items[index]);
          },
        ),
      ],
    );
  }
}

class MenuItemCard extends StatefulWidget {
  final MenuItem item;

  const MenuItemCard({super.key, required this.item});

  @override
  State<MenuItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<MenuItemCard> {
  int _quantity = 0;

  bool get showQuantityButtons => _quantity > 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 100),
                  child: widget.item.imagePath != null
                      ? Image.network(widget.item.imagePath!)
                      : Image.asset(ImageSources.coffeePic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  widget.item.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: SizedBox(
                  height: 24,
                  child: showQuantityButtons
                      ? Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 24, child: Ink(
                                decoration: const ShapeDecoration(
                                  shape: CircleBorder(), color: AppColors.button),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _quantity--;
                                    });
                                  },
                                  icon: const Icon(Icons.remove,size: 9),
                                  color: AppColors.card,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: MediaQuery.sizeOf(context).width > 100
                                    ? const EdgeInsets.symmetric(horizontal: 8)
                                    : const EdgeInsets.symmetric(horizontal: 2),
                                child: SizedBox(
                                  height: 24,
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(16)),
                                      color: AppColors.button,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$_quantity', 
                                        style: Theme.of(context).textTheme.labelSmall),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 24,
                              child: Ink(
                                decoration: const ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: AppColors.button,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_quantity < 99) {
                                        _quantity++;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.add, size: 9, color: AppColors.card),
                                ),
                              ),
                            ),
                          ],
                        )
                      : FilledButton(
                          onPressed: () {
                            setState(() {
                              _quantity = 1;
                            });
                          },
                          child: Text(
                            '${widget.item.price} р.',
                            style: Theme.of(context).textTheme.bodySmall),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
