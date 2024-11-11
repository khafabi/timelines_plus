import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:example/style/app_colors.dart';
import 'package:example/style/app_fonts.dart';

// Data Models
class Task {
  final String id;
  final String name;
  final String quantity;
  final int completion;
  final String? timestamp;

  Task({
    required this.id,
    required this.name,
    required this.quantity,
    required this.completion,
    this.timestamp,
  });
}

class WorkOrder {
  final String id;
  final DateTime startDate;
  final DateTime estimatedEndDate;
  final List<Task> tasks;
  final String status;
  final DateTime? completionDate;

  WorkOrder({
    required this.id,
    required this.startDate,
    required this.estimatedEndDate,
    required this.tasks,
    required this.status,
    this.completionDate,
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

  Icon _getStatusIcon(String status) {
    switch (status) {
      case 'scheduled':
        return const Icon(Icons.calendar_today, size: 20);
      case 'in-process':
        return const Icon(Icons.access_time, size: 20);
      case 'completed':
        return const Icon(Icons.check_circle, size: 20);
      default:
        return const Icon(Icons.error, size: 20);
    }
  }

  Widget _buildWorkOrderCard(WorkOrder workOrder) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: appColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _getStatusColor(workOrder.status),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  workOrder.id,
                  style: appFonts.subtitle.white.semibold.ts,
                ),
                Text(
                  dateFormatter.format(workOrder.startDate),
                  style: appFonts.white.ts,
                ),
              ],
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dates
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tgl Mulai ${dateFormatter.format(workOrder.startDate)}',
                      style: appFonts.gray.ts,
                    ),
                    Text(
                      'Est. Selesai ${dateFormatter.format(workOrder.estimatedEndDate)}',
                      style: workOrder.status == 'completed' 
                        ? appFonts.success.ts
                        : appFonts.error.ts,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Tasks
                ...workOrder.tasks.map((task) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                size: 16,
                                color: appColors.neutralIcon,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  task.name,
                                  style: appFonts.text.ts,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${task.quantity} (${task.completion}%)',
                              style: appFonts.primary.semibold.ts,
                            ),
                            IconButton(
                              icon: Icon(
                                _expandedTasks[task.id] == true
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: appColors.primary,
                              ),
                              onPressed: () => _toggleTask(task.id),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (task.timestamp != null)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          task.timestamp!,
                          style: appFonts.error.caption.ts,
                        ),
                      ),
                    if (_expandedTasks[task.id] == true)
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Additional task details would go here...',
                          style: appFonts.light.caption.ts,
                        ),
                      ),
                  ],
                )),

                // Completion Date
                if (workOrder.completionDate != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Text(
                          'Selesai ',
                          style: appFonts.success.ts,
                        ),
                        Text(
                          dateFormatter.format(workOrder.completionDate!),
                          style: appFonts.success.semibold.ts,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Text(
                    'Lihat Detail',
                    style: appFonts.primary.ts,
                  ),
                  label: Icon(
                    Icons.chevron_right,
                    size: 16,
                    color: appColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<WorkOrder> workOrders = [
      WorkOrder(
        id: "WO.2024.08.00001",
        startDate: DateTime(2024, 8, 2),
        estimatedEndDate: DateTime(2024, 8, 9),
        status: "scheduled",
        tasks: [
          Task(
            id: "1",
            name: "Cake Coklat Bakar (1 PCS)",
            quantity: "1000",
            completion: 100,
            timestamp: "03 Feb 2023, 08:12",
          ),
          Task(
            id: "2",
            name: "Remah Roti(20 GR)",
            quantity: "1000",
            completion: 100,
          ),
          Task(
            id: "3",
            name: "Pengambilan Bahan Baku",
            quantity: "1000",
            completion: 100,
          ),
          Task(
            id: "4",
            name: "Panggang (1 PCS)",
            quantity: "1000",
            completion: 100,
          ),
        ],
        completionDate: DateTime(2024, 8, 3),
      ),
      WorkOrder(
        id: "WO.2024.08.00002",
        startDate: DateTime(2024, 8, 3),
        estimatedEndDate: DateTime(2024, 8, 10),
        status: "in-process",
        tasks: [
          Task(
            id: "5",
            name: "Cake Vanilla (1 PCS)",
            quantity: "800",
            completion: 50,
            timestamp: "04 Feb 2023, 09:30",
          ),
          Task(
            id: "6",
            name: "Krim Vanilla(30 GR)",
            quantity: "800",
            completion: 75,
          ),
          Task(
            id: "7",
            name: "Pengambilan Bahan Baku",
            quantity: "800",
            completion: 100,
          ),
          Task(
            id: "8",
            name: "Panggang (1 PCS)",
            quantity: "800",
            completion: 25,
          ),
        ],
      ),
      WorkOrder(
        id: "WO.2024.08.00003",
        startDate: DateTime(2024, 8, 1),
        estimatedEndDate: DateTime(2024, 8, 8),
        status: "completed",
        tasks: [
          Task(
            id: "9",
            name: "Roti Gandum (1 PCS)",
            quantity: "500",
            completion: 100,
            timestamp: "02 Feb 2023, 14:45",
          ),
          Task(
            id: "10",
            name: "Biji Gandum(50 GR)",
            quantity: "500",
            completion: 100,
          ),
          Task(
            id: "11",
            name: "Pengambilan Bahan Baku",
            quantity: "500",
            completion: 100,
          ),
          Task(
            id: "12",
            name: "Panggang (1 PCS)",
            quantity: "500",
            completion: 100,
          ),
        ],
        completionDate: DateTime(2024, 8, 7),
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
                child: Column(
                  children: [
                    for (final status in ['scheduled', 'in-process', 'completed'])
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
                                  _getStatusIcon(status).icon,
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
                                .map(_buildWorkOrderCard)
                                .toList(),
                          ),
                        ],
                      ),
                  ],
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
                            decoration: BoxDecoration(
                              color: _getStatusColor(status),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                _getStatusIcon(status),
                                const SizedBox(width: 8),
                                Text(
                                  _getStatusTitle(status),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: workOrders
                                    .where((wo) => wo.status == status)
                                    .map(_buildWorkOrderCard)
                                    .toList(),
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
