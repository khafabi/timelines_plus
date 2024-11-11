import 'package:example/models/manufacturing_process.dart';

class WorkOrder {
  final String id;
  final String description;
  final DateTime lastUpdate;
  final int progress; // Percentage (0 to 100)
  final List<ManufacturingProcess> processes;

  WorkOrder({
    required this.id,
    required this.description,
    required this.lastUpdate,
    required this.progress,
    required this.processes,
  });
}
