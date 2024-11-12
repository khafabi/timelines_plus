import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';
import '../models/process_step.dart';

class WorkOrderProcesses extends StatefulWidget {
  final List<ProcessStep> steps;

  const WorkOrderProcesses({
    Key? key,
    required this.steps,
  }) : super(key: key);

  @override
  _WorkOrderProcessesState createState() => _WorkOrderProcessesState();
}

class _WorkOrderProcessesState extends State<WorkOrderProcesses> {
  bool _isProcessesExpanded = false;

  @override
  Widget build(BuildContext context) {
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
              children: widget.steps
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
