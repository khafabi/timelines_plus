import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:example/style/app_colors.dart';
import 'package:example/style/app_fonts.dart';

class WorkOrderCard extends StatefulWidget {
  final WorkOrder workOrder;

  const WorkOrderCard({
    super.key,
    required this.workOrder,
  });

  @override
  State<WorkOrderCard> createState() => _WorkOrderCardState();
}

class _WorkOrderCardState extends State<WorkOrderCard> {
  bool _isMaterialsExpanded = false;
  bool _isProcessesExpanded = false;

  Color _getStatusColor(String status) {
    switch (status) {
      case 'scheduled':
        return appColors.info.main;
      case 'in-process':
        return appColors.warning.main;
      case 'completed':
        return appColors.success.main;
      default:
        return appColors.neutral;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: appColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          _buildEndProducts(),
          const Divider(height: 1),
          _buildMaterials(),
          const Divider(height: 1),
          _buildProcessSteps(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: _getStatusColor(widget.workOrder.status),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.workOrder.id,
                style: appFonts.subtitle.semibold.white.ts,
              ),
            ],
          ),
          Text(
            widget.workOrder.status.toUpperCase(),
            style: appFonts.caption.semibold.white.ts,
          ),
        ],
      ),
    );
  }

  Widget _buildEndProducts() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.inventory_2, size: 20, color: appColors.primary),
              const SizedBox(width: 8),
              Text('Produk Akhir', style: appFonts.subtitle.semibold.ts),
            ],
          ),
          const SizedBox(height: 12),
          ...widget.workOrder.endProducts.map((product) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(product.name, style: appFonts.text.ts),
                    ),
                    Expanded(
                      child: Text(
                        '${product.produced}/${product.quota} ${product.unit}',
                        style: appFonts.text.caption.bold.ts,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 45,
                      child: Text(
                        '${product.progress.toStringAsFixed(0)}%',
                        style: appFonts.text.primary.caption.bold.ts,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildMaterials() {
    return Column(
      children: [
        InkWell(
          onTap: () =>
              setState(() => _isMaterialsExpanded = !_isMaterialsExpanded),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.category, size: 20, color: appColors.primary),
                const SizedBox(width: 8),
                Text('Bahan Baku', style: appFonts.subtitle.semibold.ts),
                const Spacer(),
                Icon(
                  _isMaterialsExpanded ? Icons.expand_less : Icons.expand_more,
                  color: appColors.primary,
                ),
              ],
            ),
          ),
        ),
        if (_isMaterialsExpanded)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: widget.workOrder.materials
                  .map((material) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child:
                                  Text(material.name, style: appFonts.text.ts),
                            ),
                            Expanded(
                              child: Text(
                                '${material.prepared}/${material.required} ${material.unit}',
                                style: appFonts.text.caption.bold.ts,
                                textAlign: TextAlign.right,
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 45,
                              child: Text(
                                '${material.progress.toStringAsFixed(0)}%',
                                style: appFonts.text.primary.caption.bold.ts,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildProcessSteps() {
    return Column(
      children: [
        InkWell(
          onTap: () =>
              setState(() => _isProcessesExpanded = !_isProcessesExpanded),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.assignment, size: 20, color: appColors.primary),
                const SizedBox(width: 8),
                Text('Proses', style: appFonts.subtitle.semibold.ts),
                const Spacer(),
                Icon(
                  _isProcessesExpanded ? Icons.expand_less : Icons.expand_more,
                  color: appColors.primary,
                ),
              ],
            ),
          ),
        ),
        if (_isProcessesExpanded)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: widget.workOrder.steps
                  .map((step) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: step.isCompleted
                                    ? appColors.success.main
                                    : appColors.neutral.withOpacity(0.2),
                              ),
                              child: Center(
                                child: Text(
                                  step.sequence.toString(),
                                  style: appFonts.caption.white.ts,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(step.name,
                                      style: appFonts.text.semibold.ts),
                                  if (step.description.isNotEmpty)
                                    Text(
                                      step.description,
                                      style: appFonts.caption.gray.ts,
                                    ),
                                ],
                              ),
                            ),
                            if (step.completedAt != null)
                              Text(
                                DateFormat('dd/MM/yyyy HH:mm')
                                    .format(step.completedAt!),
                                style: appFonts.caption.success.ts,
                              ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
      ],
    );
  }
}

// Models
class EndProduct {
  final String id;
  final String name;
  final String unit;
  final double quota;
  final double produced;

  EndProduct({
    required this.id,
    required this.name,
    required this.unit,
    required this.quota,
    this.produced = 0,
  });

  double get progress => (produced / quota) * 100;
}

class RawMaterial {
  final String id;
  final String name;
  final String unit;
  final double required;
  final double prepared;

  RawMaterial({
    required this.id,
    required this.name,
    required this.unit,
    required this.required,
    this.prepared = 0,
  });

  double get progress => (prepared / required) * 100;
}

class ProcessStep {
  final String id;
  final String name;
  final String description;
  final int sequence;
  final bool isCompleted;
  final DateTime? completedAt;

  ProcessStep({
    required this.id,
    required this.name,
    required this.description,
    required this.sequence,
    this.isCompleted = false,
    this.completedAt,
  });
}

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

class ManufacturingBoard extends StatefulWidget {
  const ManufacturingBoard({super.key});

  @override
  ManufacturingBoardState createState() => ManufacturingBoardState();
}

class ManufacturingBoardState extends State<ManufacturingBoard> {
  final Map<String, bool> _expandedTasks = {};
  final DateFormat dateFormatter = DateFormat('dd/MM/yyyy');

  void _toggleTask(String taskId) {
    setState(() {
      _expandedTasks[taskId] = !(_expandedTasks[taskId] ?? false);
    });
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'scheduled':
        return appColors.info.main;
      case 'in-process':
        return appColors.warning.main;
      case 'completed':
        return appColors.success.main;
      default:
        return appColors.neutral;
    }
  }

  String _getStatusTitle(String status) {
    switch (status) {
      case 'scheduled':
        return 'Di Jadwalkan';
      case 'in-process':
        return 'Dalam Proses';
      case 'completed':
        return 'Selesai/Ditutup';
      default:
        return '';
    }
  }

  Icon _getStatusIcon(String status, Color iconColor) {
    switch (status) {
      case 'scheduled':
        return Icon(Icons.calendar_today, size: 20, color: iconColor);
      case 'in-process':
        return Icon(Icons.access_time, size: 20, color: iconColor);
      case 'completed':
        return Icon(Icons.check_circle, size: 20, color: iconColor);
      default:
        return Icon(Icons.error, size: 20, color: iconColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<WorkOrder> workOrders = [
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
      WorkOrder(
        id: "WO.2024.08.00003",
        description: "Produksi Roti Gandum",
        startDate: DateTime(2024, 8, 1),
        estimatedEndDate: DateTime(2024, 8, 8),
        status: "completed",
        endProducts: [
          EndProduct(
            id: "EP003",
            name: "Roti Gandum",
            unit: "pcs",
            quota: 500,
            produced: 500,
          ),
        ],
        materials: [
          RawMaterial(
            id: "RM005",
            name: "Tepung Gandum",
            unit: "kg",
            required: 30,
            prepared: 30,
          ),
          RawMaterial(
            id: "RM006",
            name: "Biji Gandum",
            unit: "kg",
            required: 10,
            prepared: 10,
          ),
        ],
        steps: [
          ProcessStep(
            id: "PS007",
            name: "Persiapan Bahan",
            description: "Siapkan dan timbang bahan",
            sequence: 1,
            isCompleted: true,
            completedAt: DateTime(2024, 8, 1, 14, 45),
          ),
          ProcessStep(
            id: "PS008",
            name: "Pencampuran",
            description: "Campur bahan sesuai resep",
            sequence: 2,
            isCompleted: true,
            completedAt: DateTime(2024, 8, 1, 14, 45),
          ),
          ProcessStep(
            id: "PS009",
            name: "Pembakaran",
            description: "Bakar roti sesuai suhu",
            sequence: 3,
            isCompleted: true,
            completedAt: DateTime(2024, 8, 1, 14, 45),
          ),
        ],
        completionDate: DateTime(2024, 8, 7),
        lastUpdated: DateTime(2024, 8, 7),
      ),
      WorkOrder(
        id: "WO.2024.08.00004",
        description: "Produksi Roti Tawar",
        startDate: DateTime(2024, 8, 10),
        estimatedEndDate: DateTime(2024, 8, 17),
        status: "scheduled",
        endProducts: [
          EndProduct(
            id: "EP004",
            name: "Roti Tawar",
            unit: "pcs",
            quota: 1200,
            produced: 0,
          ),
        ],
        materials: [
          RawMaterial(
            id: "RM007",
            name: "Tepung Terigu",
            unit: "kg",
            required: 60,
            prepared: 0,
          ),
          RawMaterial(
            id: "RM008",
            name: "Ragi",
            unit: "kg",
            required: 2,
            prepared: 0,
          ),
          RawMaterial(
            id: "RM009",
            name: "Gula",
            unit: "kg",
            required: 5,
            prepared: 0,
          ),
        ],
        steps: [
          ProcessStep(
            id: "PS010",
            name: "Persiapan Bahan",
            description: "Siapkan dan timbang bahan",
            sequence: 1,
            isCompleted: false,
          ),
          ProcessStep(
            id: "PS011",
            name: "Pencampuran & Fermentasi",
            description: "Campur bahan dan tunggu fermentasi",
            sequence: 2,
            isCompleted: false,
          ),
          ProcessStep(
            id: "PS012",
            name: "Pembakaran",
            description: "Bakar roti sesuai suhu",
            sequence: 3,
            isCompleted: false,
          ),
        ],
        lastUpdated: DateTime(2024, 8, 1),
      ),
    ];

    return Scaffold(
      backgroundColor: appColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // Mobile layout
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      for (final status in [
                        'scheduled',
                        'in-process',
                        'completed'
                      ])
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: _getStatusColor(status),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    _getStatusIcon(status, appColors.white)
                                        .icon,
                                    size: 20,
                                    color: appColors.white,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    _getStatusTitle(status),
                                    style: appFonts.white.semibold.ts,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Column(
                              children: workOrders
                                  .where((wo) => wo.status == status)
                                  .map((wo) => WorkOrderCard(workOrder: wo))
                                  .toList(),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            } else {
              // Desktop layout
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final status in ['scheduled', 'in-process', 'completed'])
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            // decoration: BoxDecoration(
                            //   color: _getStatusColor(status),
                            //   borderRadius: BorderRadius.circular(8),
                            // ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _getStatusIcon(status, _getStatusColor(status)),
                                const SizedBox(width: 16),
                                Text(
                                  _getStatusTitle(status),
                                  style: appFonts.bold.ts,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: workOrders
                                      .where((wo) => wo.status == status)
                                      .map((wo) =>
                                          WorkOrderCard(workOrder: wo))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
