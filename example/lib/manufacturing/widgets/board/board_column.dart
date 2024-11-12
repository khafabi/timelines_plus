import 'package:flutter/material.dart';
import '../../../style/app_colors.dart';
import '../../../style/app_fonts.dart';
import '../../utils/status_helper.dart';
import '../work_order/work_order_card.dart';
import '../../models/work_order.dart';

class BoardColumn extends StatelessWidget {
  final String status;
  final List<WorkOrder> workOrders;

  const BoardColumn({
    Key? key,
    required this.status,
    required this.workOrders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StatusHelper.getStatusIcon(status, StatusHelper.getStatusColor(status)),
                const SizedBox(width: 16),
                Text(
                  StatusHelper.getStatusTitle(status),
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
                      .map((wo) => WorkOrderCard(workOrder: wo))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
