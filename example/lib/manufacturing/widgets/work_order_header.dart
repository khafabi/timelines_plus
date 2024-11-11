import 'package:flutter/material.dart';
import '../../manufacturing_models/manufacturing_models.dart';
import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';

class WorkOrderHeader extends StatelessWidget {
  final WorkOrder workOrder;

  const WorkOrderHeader({
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
          Container(
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
                      style: appFonts.caption.white.copyWith(
                        color: appColors.white.withOpacity(0.7),
                      ).ts,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Update terakhir ${workOrder.formattedLastUpdate}',
                      style: appFonts.caption.copyWith(
                        color: appColors.white.withOpacity(0.7),
                      ).ts,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Progress ${workOrder.progressString}',
                      style: appFonts.subtitle.semibold.white.ts,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              workOrder.description,
              style: appFonts.text.ts,
            ),
          ),
        ],
      ),
    );
  }
}
