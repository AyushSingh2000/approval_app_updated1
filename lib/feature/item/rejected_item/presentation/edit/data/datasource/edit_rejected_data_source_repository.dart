import 'package:dartz/dartz.dart';
// import 'package:new_app/feature/items/data/model/item_series.dart';
// import 'package:new_app/feature/items/data/model/item_substitution.dart';
// import 'package:new_app/feature/items/data/model/original_item.dart';

import '../../../../../../../core/failure.dart';
import '../model/item_series.dart';
import '../model/item_substitution.dart';
import '../model/original_item.dart';

abstract class EditRejectedItemDataSourceRepository {
  Future<Map<String, int>> getItemSeries();
  Future<Map<String, int>> getItemGroup();
  Future<Map<String, int>> getUoM();
  Future<Map<String, String>> getPurchasingUoM();
  Future<Map<String, String>> getSalesUoM();
  Future<Map<String, String>> getInventoryUoM();
  Future<Map<String, String>> getWhseCode();
  Future<Map<String, String>> getBPcode();
  Future<Map<String, String>> getItemNumber();

  Future<Either<Failure, String>> postItemMaster(EditItemModel itemModel);
  Future<Either<Failure, String>> postBPCatalog(
      EditItemSubstitutionModel itemSubstitutionModel);
  Future<Either<Failure, String>> postAlternativeItem(
      EditOriginalItemModel originalItemModel);
}
