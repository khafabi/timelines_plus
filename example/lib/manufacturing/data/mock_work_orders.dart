import '../models/work_order.dart';
import '../models/end_product.dart';
import '../models/raw_material.dart';
import '../models/process_step.dart';

final List<WorkOrder> mockWorkOrders = [
  WorkOrder(
    id: "WO.2024.08.00001",
    description: "Produksi Cake Coklat",
    startDate: DateTime(2024, 8, 2),
    estimatedEndDate: DateTime(2024, 8, 9),
    status: "completed",
    endProducts: [
      EndProduct(
        id: "EP001",
        name: "Cake Coklat Bakar",
        unit: "pcs",
        quota: 1000,
        produced: 1000,
      ),
    ],
    materials: [
      RawMaterial(
        id: "RM001",
        name: "Tepung",
        unit: "kg",
        required: 50,
        prepared: 50,
      ),
      RawMaterial(
        id: "RM002",
        name: "Coklat",
        unit: "kg",
        required: 20,
        prepared: 20,
      ),
    ],
    steps: [
      ProcessStep(
        id: "PS001",
        name: "Persiapan Bahan",
        description: "Siapkan dan timbang bahan",
        sequence: 1,
        isCompleted: true,
        completedAt: DateTime(2024, 8, 2, 8, 12),
      ),
      ProcessStep(
        id: "PS002",
        name: "Pencampuran",
        description: "Campur bahan sesuai resep",
        sequence: 2,
        isCompleted: true,
        completedAt: DateTime(2024, 8, 2, 10, 30),
      ),
      ProcessStep(
        id: "PS003",
        name: "Pembakaran",
        description: "Bakar cake sesuai suhu",
        sequence: 3,
        isCompleted: true,
        completedAt: DateTime(2024, 8, 2, 13, 45),
      ),
    ],
    completionDate: DateTime(2024, 8, 3),
    lastUpdated: DateTime(2024, 8, 3),
  ),
  // Add the rest of the work orders from the original file
  WorkOrder(
    id: "WO.2024.08.00002",
    description: "Produksi Cake Vanilla",
    startDate: DateTime(2024, 8, 3),
    estimatedEndDate: DateTime(2024, 8, 10),
    status: "in-process",
    endProducts: [
      EndProduct(
        id: "EP002",
        name: "Cake Vanilla",
        unit: "pcs",
        quota: 800,
        produced: 400,
      ),
    ],
    materials: [
      RawMaterial(
        id: "RM003",
        name: "Tepung",
        unit: "kg",
        required: 40,
        prepared: 26.8,
      ),
      RawMaterial(
        id: "RM004",
        name: "Vanilla",
        unit: "kg",
        required: 15,
        prepared: 10,
      ),
    ],
    steps: [
      ProcessStep(
        id: "PS004",
        name: "Persiapan Bahan",
        description: "Siapkan dan timbang bahan",
        sequence: 1,
        isCompleted: true,
        completedAt: DateTime(2024, 8, 3, 9, 30),
      ),
      ProcessStep(
        id: "PS005",
        name: "Pencampuran",
        description: "Campur bahan sesuai resep",
        sequence: 2,
        isCompleted: true,
        completedAt: DateTime(2024, 8, 3, 11, 15),
      ),
      ProcessStep(
        id: "PS006",
        name: "Pembakaran",
        description: "Bakar cake sesuai suhu",
        sequence: 3,
        isCompleted: false,
      ),
    ],
    lastUpdated: DateTime(2024, 8, 3),
  ),
  // Add the remaining work orders...
];
