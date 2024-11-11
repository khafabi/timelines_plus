import 'package:example/style/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../manufacturing_models/manufacturing_models.dart';
import 'widgets/work_order_header.dart';
import 'widgets/timeline_event_card.dart';

class ManufacturingTimelinePage extends StatelessWidget {
  final WorkOrder workOrder;

  const ManufacturingTimelinePage({
    super.key,
    required this.workOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manufacturing Timeline: ${workOrder.id}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WorkOrderHeader(workOrder: workOrder),
            TimelineTheme(
              data: TimelineThemeData(
                nodePosition: 0.5, // Change from 0.2 to 0.5 to center the timeline
                connectorTheme: const ConnectorThemeData(
                  color: Colors.grey,
                  thickness: 2,
                ),
                indicatorTheme: const IndicatorThemeData(
                  size: 20,
                ),
              ),
              child: Timeline.tileBuilder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                builder: TimelineTileBuilder.connected(
                  connectionDirection: ConnectionDirection.before,
                  itemCount: workOrder.events.length,
                  contentsBuilder: (context, index) {
                    final event = workOrder.events[index];
                    if (event.type == ManufacturingEventType.processStart || 
                        event.type == ManufacturingEventType.processComplete) {
                      // Show date on the right for process events
                      return Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          event.formattedDate,
                          style: appFonts.caption.ts,
                        ),
                      );
                    }
                    // Show card on the right for non-process events
                    return Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TimelineEventCard(event: event),
                    );
                  },
                  oppositeContentsBuilder: (context, index) {
                    final event = workOrder.events[index];
                    if (event.type == ManufacturingEventType.processStart || 
                        event.type == ManufacturingEventType.processComplete) {
                      // Show process cards on the left
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: TimelineEventCard(event: event),
                      );
                    }
                    // Show date on the left for non-process events
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        event.formattedDate,
                        style: appFonts.caption.ts,
                        textAlign: TextAlign.right,
                      ),
                    );
                  },
                  indicatorBuilder: (context, index) {
                    final event = workOrder.events[index];
                    return DotIndicator(
                      color: event.type.color,
                      child: Icon(
                        _getIconForEventType(event.type),
                        size: 12,
                        color: Colors.white,
                      ),
                    );
                  },
                  connectorBuilder: (context, index, type) {
                    return SolidLineConnector(
                      color: workOrder.events[index].type.color,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForEventType(ManufacturingEventType type) {
    switch (type) {
      case ManufacturingEventType.materialCollection:
        return Icons.inventory;
      case ManufacturingEventType.processStart:
        return Icons.play_arrow;
      case ManufacturingEventType.processComplete:
        return Icons.check;
      case ManufacturingEventType.finalProduct:
        return Icons.done_all;
    }
  }
}
