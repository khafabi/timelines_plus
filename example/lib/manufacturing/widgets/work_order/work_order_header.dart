import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../style/app_colors.dart';
import '../../../style/app_fonts.dart';
import '../../models/work_order.dart';

class WorkOrderHeader extends StatelessWidget {
  final WorkOrder workOrder;

  const WorkOrderHeader({
    Key? key,
    required this.workOrder,
  }) : super(key: key);

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
    return Container(
      color: _getStatusColor(workOrder.status),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workOrder.id,
                    style: appFonts.subtitle.semibold.white.ts,
                  ),
                ],
              ),
              Text(
                workOrder.status.toUpperCase(),
                style: appFonts.caption.semibold.white.ts,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggal Mulai:',
                    style: appFonts.caption.white.ts,
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(workOrder.startDate),
                    style: appFonts.caption.bold.white.ts,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estimasi Tanggal Selesai:',
                    style: appFonts.caption.white.ts,
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(workOrder.estimatedEndDate),
                    style: appFonts.caption.white.bold.ts,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
