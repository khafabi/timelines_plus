import 'raw_material.dart';
import 'end_product.dart';

class ProcessStep {
  final String id;
  final String name;
  final String description;
  final int sequence;
  final bool isCompleted;
  final DateTime? completedAt;
  final DateTime startDate;
  final List<RawMaterial> materials;
  final List<EndProduct> products;
  final double progressPercentage;

  ProcessStep({
    required this.id,
    required this.name,
    required this.description,
    required this.sequence,
    required this.startDate,
    required this.materials,
    required this.products,
    this.isCompleted = false,
    this.completedAt,
    this.progressPercentage = 0.0,
  });
}
