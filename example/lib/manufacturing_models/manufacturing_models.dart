import 'package:flutter/material.dart';

/// Enum defining different types of manufacturing events
enum ManufacturingEventType {
  materialCollection,
  processStart,
  processComplete,
  finalProduct,
}

/// Extension to get the appropriate color for each event type
extension ManufacturingEventTypeColor on ManufacturingEventType {
  Color get color {
    switch (this) {
      case ManufacturingEventType.materialCollection:
        return Colors.blue;
      case ManufacturingEventType.processStart:
      case ManufacturingEventType.processComplete:
        return Colors.orange;
      case ManufacturingEventType.finalProduct:
        return Colors.green;
    }
  }
}

/// Model representing a manufacturing event in the timeline
class ManufacturingEvent {
  final String id;
  final DateTime date;
  final ManufacturingEventType type;
  final String title;
  final String? subtitle;
  final List<String> details;

  const ManufacturingEvent({
    required this.id,
    required this.date,
    required this.type,
    required this.title,
    this.subtitle,
    this.details = const [],
  });

  // Helper method to format the date
  String get formattedDate {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}

/// Model representing a work order
class WorkOrder {
  final String id;
  final DateTime lastUpdate;
  final double progress;
  final String description;
  final List<ManufacturingEvent> events;

  const WorkOrder({
    required this.id,
    required this.lastUpdate,
    required this.progress,
    required this.description,
    this.events = const [],
  });

  // Helper method to format the last update date
  String get formattedLastUpdate {
    return '${lastUpdate.day.toString().padLeft(2, '0')}/${lastUpdate.month.toString().padLeft(2, '0')}/${lastUpdate.year}';
  }

  // Helper method to get progress as percentage string
  String get progressString => '${(progress * 100).toInt()}%';
}

/// Sample data generator for testing
class SampleManufacturingData {
  static WorkOrder getSampleWorkOrder() {
    return WorkOrder(
      id: 'WO.2024.08.00001',
      lastUpdate: DateTime(2024, 8, 17),
      progress: 1.0,
      description: 'Cake Coklat Bakar (1000PCS), Remah Roti (20 GR)',
      events: [
        ManufacturingEvent(
          id: 'MF.2024.08.00002',
          date: DateTime(2024, 8, 2),
          type: ManufacturingEventType.materialCollection,
          title: 'Ambil Barang',
          details: [
            '[100001] Tepung Terigu (0.1 KG)',
            '[100001] Tepung Terigu (0.1 KG)',
          ],
        ),
        ManufacturingEvent(
          id: 'MF.2024.08.00002',
          date: DateTime(2024, 8, 3),
          type: ManufacturingEventType.processStart,
          title: 'Mulai',
          details: ['Tahapan proses Buat Cake (2 PCS)'],
        ),
        ManufacturingEvent(
          id: 'MF.2024.08.00002',
          date: DateTime(2024, 8, 3),
          type: ManufacturingEventType.processComplete,
          title: 'Selesai',
          details: ['Tahapan proses Buat Cake (2 PCS)'],
        ),
        ManufacturingEvent(
          id: 'FGS.2024.08.00002',
          date: DateTime(2024, 8, 4),
          type: ManufacturingEventType.finalProduct,
          title: 'Produk Jadi',
          details: [
            '[100001] Cake Coklat Bakar (1000 PCS)',
            '[100001] Remah Roti (20 GR)',
          ],
        ),
      ],
    );
  }
}
