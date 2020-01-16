import 'package:barty/db/Repository.dart';
import 'package:barty/model/BeverageCategory.dart';
import 'package:scoped_model/scoped_model.dart';

class DrinksViewModel extends Model {
  
  Future<List<BeverageCategory>> _beverageCategories;
  Future<List<BeverageCategory>> get beverageCategories => _beverageCategories;
  set beverageCategories(Future<List<BeverageCategory>> value) {
    _beverageCategories = value;
    notifyListeners();
  }

  final Repository repository = Repository();

  Future<bool> fetchBeverageCategories() async {
    beverageCategories = repository?.fetchBeverageCategories();
    return _beverageCategories != null;
  }

}