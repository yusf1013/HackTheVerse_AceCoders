import 'package:ecommerce/domain/admin.dart';
import 'package:ecommerce/domain/user.dart';
import 'package:get/get.dart';

User _thisUser;
List<Delivery> allUsers;
Admin thisAdmin = Admin();
Manager thisManager = Manager();
Delivery thisDelivery = Delivery();

class GlobalDataController extends GetxController {
  final Rx<User> _currentUser = _thisUser.obs;
  set currentUser(value) {
    _currentUser.update((val) {});
    return _currentUser.value = value;
  }

  User get currentUser {
    _currentUser.update((val) {});
    return _currentUser.value;
  }

  // All users

  final _allUsers = _thisUser.obs;
  set allUsers(value) {
    _allUsers.update((val) {});
    return _allUsers.value = value;
  }

  get allUsers {
    _allUsers.update((val) {});
    return _allUsers.value;
  }

  // Admin

  final _admin = thisAdmin.obs;
  set admin(value) {
    _admin.update((val) {});
    return _admin.value = value;
  }

  Admin get admin {
    _admin.update((val) {});
    return _admin.value;
  }

  // Man

  final _manager = thisManager.obs;
  set manager(value) {
    _manager.update((val) {});
    return _manager.value = value;
  }

  Manager get manager {
    _manager.update((val) {});
    return _manager.value;
  }

  final _delivery = thisDelivery.obs;
  set delivery(value) {
    _delivery.update((val) {});
    return _delivery.value = value;
  }

  Delivery get delivery {
    _delivery.update((val) {});
    return _delivery.value;
  }
}
