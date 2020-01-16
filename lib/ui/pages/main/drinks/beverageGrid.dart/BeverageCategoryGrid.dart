import 'package:barty/model/BeverageCategory.dart';
import 'package:barty/ui/components/cards/BeverageCategoryCard.dart';
import 'package:barty/viewModel/DrinksVM.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BeverageCategoryGrid extends StatelessWidget {
  BeverageCategoryGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<DrinksViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<BeverageCategory>>(
          future: model.beverageCategories,
          builder: (_, AsyncSnapshot<List<BeverageCategory>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return SliverToBoxAdapter(
                  child: Center(
                    child: const CircularProgressIndicator(),
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var beverageCategories = snapshot.data;

                  return SliverPadding(
                    padding: EdgeInsets.all(15),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return BeverageCategoryCard(
                            category: beverageCategories[index],
                          );
                        },
                        childCount: beverageCategories.length,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("error"));
                }
            }
          },
        );
      },
    );
  }
}
