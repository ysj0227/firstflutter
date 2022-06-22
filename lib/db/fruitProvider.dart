import 'fruit.dart';
import 'fruitdao.dart';

class FruitsProvider {
  late FruitsDao _fruitsDao;

  FruitsDao get fruitsDao => _fruitsDao;

  FruitsProvider() {
    FruitsDatabase database = FruitsDatabase();
    _fruitsDao = FruitsDao(database);
  }
}
