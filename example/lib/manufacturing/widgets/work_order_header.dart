import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:example/style/app_colors.dart';
import 'package:example/style/app_fonts.dart';

import '../../manufacturing_models/manufacturing_timeline_models.dart';

class WorkOrderHeader extends StatelessWidget {
  final WorkOrder workOrder;

  const WorkOrderHeader({
    super.key,
    required this.workOrder,
  });

  String get formattedLastUpdate =>
      DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

  // DateFormat('dd/MM/yyyy HH:mm').format(workOrder.lastUpdated);

  String get progressString {
    // Implement a simple progress calculation
    // This is a placeholder and should be replaced with actual logic
    return '50%';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appColors.primary.main,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Perintah Kerja',
                style: appFonts.subtitle.semibold.white.ts,
              ),
              const SizedBox(height: 4),
              Text(
                workOrder.id,
                style: appFonts.caption.white
                    .copyWith(
                      color: appColors.white.withOpacity(0.7),
                    )
                    .ts,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Update terakhir $formattedLastUpdate',
                style: appFonts.caption
                    .copyWith(
                      color: appColors.white.withOpacity(0.7),
                    )
                    .ts,
              ),
              const SizedBox(height: 4),
              Text(
                'Progress $progressString',
                style: appFonts.subtitle.semibold.white.ts,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
