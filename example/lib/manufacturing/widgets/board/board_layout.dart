import 'package:flutter/material.dart';
import '../../models/work_order.dart';
import 'board_column.dart';

class BoardLayout extends StatelessWidget {
  final List<WorkOrder> workOrders;
  final bool isMobile;

  const BoardLayout({
    Key? key,
    required this.workOrders,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return _buildMobileLayout();
    }
    return _buildDesktopLayout();
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final status in ['scheduled', 'in-process', 'completed'])
          BoardColumn(
            status: status,
            workOrders: workOrders,
          ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            for (final status in ['scheduled', 'in-process', 'completed'])
              Column(
                children: [
                  BoardColumn(
                    status: status,
                    workOrders: workOrders,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
