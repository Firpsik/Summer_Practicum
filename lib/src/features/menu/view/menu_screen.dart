import 'package:summer_practicum/src/features/menu/models/menu_category.dart';
import 'package:summer_practicum/src/features/menu/view/widgets/template.dart';
import 'package:summer_practicum/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuPage extends StatefulWidget {
  final List<MenuCategory> menuCategories;

  const MenuPage({super.key, required this.menuCategories});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late Map<String, GlobalKey> _categoryKeys;
  final ItemScrollController _menuScrollController = ItemScrollController();
  final ItemScrollController _appBarScrollController = ItemScrollController();
  late ItemPositionsListener _positionListener;
  int currentIndex = 0;
  bool isScrolling = false;
  bool reachedEnd = false;

  @override
  void initState() {
    super.initState();
    _positionListener = ItemPositionsListener.create();

    _categoryKeys = {
      for (var category in widget.menuCategories) category.categoryName: GlobalKey()
    };

    _positionListener.itemPositions.addListener(() {
      final firstVisibleItemIndex = _positionListener.itemPositions.value.firstWhere((item) {
        return item.itemLeadingEdge >= 0;
      }).index;

      if (isScrolling == false && reachedEnd == false &&
          firstVisibleItemIndex != currentIndex) {
        _updateCurrentIndex(firstVisibleItemIndex);
        _scrollAppBarToCategory(firstVisibleItemIndex);
      }
    });
  }

  void _updateCurrentIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  void _scrollMenuToCategory(int index) async {
    isScrolling = true;
    _menuScrollController.scrollTo(
        index: index, duration: const Duration(milliseconds: 250));
    await Future.delayed(const Duration(milliseconds: 250));
    isScrolling = false;
  }

  void _scrollAppBarToCategory(int index) async {
    _appBarScrollController.scrollTo(
        curve: Curves.easeOut,
        opacityAnimationWeights: [25, 25, 60],
        index: index,
        duration: const Duration(milliseconds: 250));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: AppColors.panel,
          title: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: SizedBox(
              height: 40,
              child: ScrollablePositionedList.builder(
                itemScrollController: _appBarScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.menuCategories.length,
                itemBuilder: (context, index) {
                  final category = widget.menuCategories[index];
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: ElevatedButton(
                      onPressed: () {
                        _updateCurrentIndex(index);
                        _scrollMenuToCategory(index);
                        _scrollAppBarToCategory(index);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: index == currentIndex
                              ? AppColors.button
                              : AppColors.card),
                      child: Text(
                        category.categoryName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: index == currentIndex
                                ? AppColors.card
                                : AppColors.panel),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ScrollablePositionedList.builder(
            itemScrollController: _menuScrollController,
            itemPositionsListener: _positionListener,
            itemBuilder: (context, index) {
              final category = widget.menuCategories[index];
              return CategorySection(
                key: _categoryKeys[category.categoryName],
                category: category,
              );
            },
            itemCount: widget.menuCategories.length,
          ),
        ),
      ),
    );
  }
}