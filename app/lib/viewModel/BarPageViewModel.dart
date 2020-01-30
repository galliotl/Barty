import 'package:barty/db/Repository.dart';
import 'package:barty/model/Bar.dart';
import 'package:scoped_model/scoped_model.dart';

class BarPageViewModel extends Model {
  
  Future<BarPageDetail> _bar;
  Future<BarPageDetail> get bar => _bar;
  set bar(Future<BarPageDetail> value) {
    _bar = value;
    notifyListeners();
  }

  final Repository repository = Repository();

  Future<bool> fetchBarDetail(String barId) async {
    if(bar == null) bar = repository?.fetchBarDetail(barId);
    return _bar != null;
  }
}