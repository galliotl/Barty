import 'package:barty/db/Repository.dart';
import 'package:barty/model/Bar.dart';
import 'package:scoped_model/scoped_model.dart';

class BarsViewModel extends Model {
  
  Future<List<Bar>> _bars;
  Future<List<Bar>> get bars => _bars;
  set bars(Future<List<Bar>> value) {
    _bars = value;
    notifyListeners();
  }

  final Repository repository = Repository();

  Future<bool> fetchBars() async {
    if (bars == null) bars = repository?.fetchBars();
    return _bars != null;
  }

}