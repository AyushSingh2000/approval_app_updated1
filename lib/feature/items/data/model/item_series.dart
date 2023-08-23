// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemModel {
  String Series;
  String ItemName;
  dynamic ForeignName;
  int ItemsGroupCode;
  String ItemType;
  String PurchaseItem;
  String SalesItem;
  String InventoryItem;
  int UoMGroupEntry;
  int InventoryUoMEntry;
  int DefaultSalesUoMEntry;
  int DefaultPurchasingUoMEntry;
  dynamic SupplierCatalogNo;
  int Manufacturer;
  String ManageSerialNumbers;
  String ManageBatchNumbers;
  String SRIAndBatchManageMethod;
  String CostAccountingMethod;
  String SWW;
  dynamic U_TRPHSC;
  double MaxInventory;
  double MinInventory;
  String U_TRPAPPST;
  dynamic U_VSPPC;
  String ProcurementMethod;
  String U_TRPITMGP;

  ItemModel({
    required this.Series,
    required this.ItemName,
    required this.ForeignName,
    required this.ItemsGroupCode,
    required this.ItemType,
    required this.PurchaseItem,
    required this.SalesItem,
    required this.InventoryItem,
    required this.UoMGroupEntry,
    required this.InventoryUoMEntry,
    required this.DefaultSalesUoMEntry,
    required this.DefaultPurchasingUoMEntry,
    required this.SupplierCatalogNo,
    required this.Manufacturer,
    required this.ManageSerialNumbers,
    required this.ManageBatchNumbers,
    required this.SRIAndBatchManageMethod,
    required this.CostAccountingMethod,
    required this.SWW,
    required this.U_TRPHSC,
    required this.MaxInventory,
    required this.MinInventory,
    required this.U_TRPAPPST,
    required this.U_VSPPC,
    required this.ProcurementMethod,
    required this.U_TRPITMGP,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Series': Series,
      'ItemName': ItemName,
      'ForeignName': ForeignName,
      'ItemsGroupCode': ItemsGroupCode,
      'ItemType': ItemType,
      'PurchaseItem': PurchaseItem,
      'SalesItem': SalesItem,
      'InventoryItem': InventoryItem,
      'UoMGroupEntry': UoMGroupEntry,
      'InventoryUoMEntry': InventoryUoMEntry,
      'DefaultSalesUoMEntry': DefaultSalesUoMEntry,
      'DefaultPurchasingUoMEntry': DefaultPurchasingUoMEntry,
      'SupplierCatalogNo': SupplierCatalogNo,
      'Manufacturer': Manufacturer,
      'ManageSerialNumbers': ManageSerialNumbers,
      'ManageBatchNumbers': ManageBatchNumbers,
      'SRIAndBatchManageMethod': SRIAndBatchManageMethod,
      'CostAccountingMethod': CostAccountingMethod,
      'SWW': SWW,
      'U_TRPHSC': U_TRPHSC,
      'MaxInventory': MaxInventory,
      'MinInventory': MinInventory,
      'U_TRPAPPST': U_TRPAPPST,
      'U_VSPPC': U_VSPPC,
      'ProcurementMethod': ProcurementMethod,
      'U_TRPITMGP': U_TRPITMGP,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      Series: map['Series'] as String,
      ItemName: map['ItemName'] as String,
      ForeignName: map['ForeignName'] as dynamic,
      ItemsGroupCode: map['ItemsGroupCode'] as int,
      ItemType: map['ItemType'] as String,
      PurchaseItem: map['PurchaseItem'] as String,
      SalesItem: map['SalesItem'] as String,
      InventoryItem: map['InventoryItem'] as String,
      UoMGroupEntry: map['UoMGroupEntry'] as int,
      InventoryUoMEntry: map['InventoryUoMEntry'] as int,
      DefaultSalesUoMEntry: map['DefaultSalesUoMEntry'] as int,
      DefaultPurchasingUoMEntry: map['DefaultPurchasingUoMEntry'] as int,
      SupplierCatalogNo: map['SupplierCatalogNo'] as dynamic,
      Manufacturer: map['Manufacturer'] as int,
      ManageSerialNumbers: map['ManageSerialNumbers'] as String,
      ManageBatchNumbers: map['ManageBatchNumbers'] as String,
      SRIAndBatchManageMethod: map['SRIAndBatchManageMethod'] as String,
      CostAccountingMethod: map['CostAccountingMethod'] as String,
      SWW: map['SWW'] as String,
      U_TRPHSC: map['U_TRPHSC'] as dynamic,
      MaxInventory: map['MaxInventory'] as double,
      MinInventory: map['MinInventory'] as double,
      U_TRPAPPST: map['U_TRPAPPST'] as String,
      U_VSPPC: map['U_VSPPC'] as dynamic,
      ProcurementMethod: map['ProcurementMethod'] as String,
      U_TRPITMGP: map['U_TRPITMGP'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ItemWarehouseInfoModel {
  double minimalStock;
  double maximalStock;
  double minimalOrder;
  String warehouseCode;
  double inStock;
  double committed;
  double ordered;

  ItemWarehouseInfoModel({
    required this.minimalStock,
    required this.maximalStock,
    required this.minimalOrder,
    required this.warehouseCode,
    required this.inStock,
    required this.committed,
    required this.ordered,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'minimalStock': minimalStock,
      'maximalStock': maximalStock,
      'minimalOrder': minimalOrder,
      'warehouseCode': warehouseCode,
      'inStock': inStock,
      'committed': committed,
      'ordered': ordered,
    };
  }

  factory ItemWarehouseInfoModel.fromMap(Map<String, dynamic> map) {
    return ItemWarehouseInfoModel(
      minimalStock: map['minimalStock'] as double,
      maximalStock: map['maximalStock'] as double,
      minimalOrder: map['minimalOrder'] as double,
      warehouseCode: map['warehouseCode'] as String,
      inStock: map['inStock'] as double,
      committed: map['committed'] as double,
      ordered: map['ordered'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemWarehouseInfoModel.fromJson(String source) =>
      ItemWarehouseInfoModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
