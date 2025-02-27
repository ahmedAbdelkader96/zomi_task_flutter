import 'package:task/features/menu/repository/repository.dart';

class MenuController {
  final repo = MenuRepository();

  Future<void> signOut() {
    return repo.signOut();
  }
}
