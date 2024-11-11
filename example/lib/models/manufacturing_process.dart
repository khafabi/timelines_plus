import 'package:example/models/material.dart';
import 'package:example/models/product.dart';

class ManufacturingProcess {
  final String id;
  final String description;
  final ProcessStatus status;
  final DateTime startDate;
  final DateTime endDate;
  final List<Material> materialsUsed;
  final List<Product> productsProduced;

  ManufacturingProcess({
    required this.id,
    required this.description,
    required this.status,
    required this.startDate,
    required this.endDate,
    this.materialsUsed = const [],
    this.productsProduced = const [],
  });
}

enum ProcessStatus {
  notStarted,
  inProgress,
  completed,
}
