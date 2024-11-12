import 'package:intl/intl.dart';
import 'end_product.dart';
import 'raw_material.dart';
import 'process_step.dart';

class WorkOrder {
  final String id;
  final String description;
  final DateTime startDate;
  final DateTime estimatedEndDate;
  final String status;
  final List<EndProduct> endProducts;
  final List<RawMaterial> materials;
  final List<ProcessStep> steps;
  final DateTime? completionDate;
  final DateTime lastUpdated;

  WorkOrder({
    required this.id,
    required this.description,
    required this.startDate,
    required this.estimatedEndDate,
    required this.status,
    required this.endProducts,
    required this.materials,
    required this.steps,
    this.completionDate,
    required this.lastUpdated,
  });
}
