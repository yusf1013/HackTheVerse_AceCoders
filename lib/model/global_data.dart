import 'package:ecommerce/domain/admin.dart';
import 'package:ecommerce/domain/user.dart';
import 'package:get/get.dart';

User _thisUser;
List<Delivery> allUser = List();
Admin thisAdmin = Admin();
Manager thisManager = Manager();
Delivery thisDelivery = Delivery();
List<Product> allProducts = <Product>[
  Product(name: "Toothbrush", id: "1", cost: 25),
  Product(name: "Soap", id: "2", cost: 40),
  Product(name: "Hand sanitizer", id: "3", cost: 120),
  Product(name: "Shampoo", id: "4", cost: 320),
  Product(name: "Face wash", id: "5", cost: 450),
];

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

  final _allUsers = allUser.obs;
  set allUsers(value) {
    _allUsers.update((val) {});
    return _allUsers.value = value;
  }

  List<Delivery> get allUsers {
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

Product getProduct(String id) {
  for (Product p in allProducts) if (p.id == id) return p;
  return null;
}
