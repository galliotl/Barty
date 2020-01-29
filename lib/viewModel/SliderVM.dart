import 'package:barty/db/Repository.dart';
import 'package:scoped_model/scoped_model.dart';

class SliderViewModel extends Model {
  Future<bool> _validated;
  Future<bool> get validated => _validated;
  set validated(Future<bool> value) {
    _validated = value;
    notifyListeners();
  }

  final Repository repository = Repository();

  Future<bool> validate(String connectedUser, String barId) async {
    // Verify that the user can actually have a free drink
    validated = repository.validateUserWithBar(connectedUser, barId);
    return _validated;
  }
}