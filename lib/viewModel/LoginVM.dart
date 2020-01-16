import 'package:barty/db/Repository.dart';
import 'package:barty/model/User.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginViewModel extends Model {
  Future<User> _user;
  Future<User> get user => _user;
  set user(Future<User> value) {
    _user = value;
    notifyListeners();
  }

  final Repository repository = Repository();

  Future<bool> fetchConnectedUser(String connectedUser) async {
    user = repository?.fetchUserData(connectedUser);
    return _user != null;
  }
}
