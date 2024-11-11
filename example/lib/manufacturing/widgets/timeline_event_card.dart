import 'package:flutter/material.dart';
import '../../manufacturing_models/manufacturing_models.dart';
import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';

class TimelineEventCard extends StatelessWidget {
  final ManufacturingEvent event;

  const TimelineEventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: appColors.border,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: event.type.color,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  event.id,
                  style: appFonts.subtitle.semibold.white.ts,
                ),
                Text(
                  event.title,
                  style: appFonts.caption.white.ts,
                ),
              ],
            ),
          ),
          if (event.details.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: event.details.map((detail) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      detail,
                      style: appFonts.caption.gray.ts,
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
