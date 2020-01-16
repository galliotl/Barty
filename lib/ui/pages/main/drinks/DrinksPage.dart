import 'package:barty/ui/pages/main/drinks/beverageGrid.dart/BeverageCategoryGrid.dart';
import 'package:barty/viewModel/DrinksVM.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DrinksPage extends StatefulWidget {
  @override
  _DrinksPageState createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage>
    with SingleTickerProviderStateMixin {
  DrinksViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = DrinksViewModel();
    loadData();
  }

  Future loadData() async {
    await viewModel.fetchBeverageCategories();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<DrinksViewModel>(
      model: viewModel,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: SizedBox(
                width: 230,
                height: 150,
                child: Image.asset("assets/images/image.png"),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Today, I crave...",
                style: Theme.of(context).textTheme.subtitle,
              ),
            ),
          ),
          BeverageCategoryGrid(),
        ],
      ),
    );
  }
}
