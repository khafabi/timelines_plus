import 'package:example/manufacturing/widgets/work_order_materials.dart';
import 'package:example/manufacturing/widgets/work_order_processes.dart';
import 'package:flutter/material.dart';
import '../../../style/app_colors.dart';
import '../../models/work_order.dart';
import '../../utils/status_helper.dart';
import 'work_order_header.dart';
import 'work_order_products.dart';

class WorkOrderCard extends StatelessWidget {
  final WorkOrder workOrder;

  const WorkOrderCard({
    Key? key,
    required this.workOrder,
  }) : super(key: key);

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
          WorkOrderHeader(workOrder: workOrder),
          WorkOrderProducts(products: workOrder.endProducts),
          const Divider(height: 1),
          WorkOrderMaterials(materials: workOrder.materials),
          const Divider(height: 1),
          WorkOrderProcesses(steps: workOrder.steps),
        ],
      ),
    );
  }
}
