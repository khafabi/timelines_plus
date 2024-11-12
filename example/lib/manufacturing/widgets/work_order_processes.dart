import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';
import '../models/process_step.dart';
import '../models/raw_material.dart';

class WorkOrderProcesses extends StatelessWidget {
  final List<ProcessStep> steps;

  const WorkOrderProcesses({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.assignment, size: 20, color: appColors.primary),
      title: Text('Tahapan', style: appFonts.subtitle.semibold.ts),
      children: steps.map((step) => _buildProcessStep(step)).toList(),
    );
  }

  Widget _buildProcessStep(ProcessStep step) {
    return ExpansionTile(
      leading: Container(
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
      title: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(step.name, style: appFonts.text.semibold.ts),
                if (step.description.isNotEmpty)
                  Text(step.description, style: appFonts.caption.gray.ts),
              ],
            ),
          ),
          Text(
            '${step.progressPercentage.toStringAsFixed(1)}%',
            style: appFonts.caption.gray.ts,
          ),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mulai: ${DateFormat('dd/MM/yyyy HH:mm').format(step.startDate)}',
                style: appFonts.caption.gray.ts,
              ),
              if (step.completedAt != null)
                Text(
                  'Selesai: ${DateFormat('dd/MM/yyyy HH:mm').format(step.completedAt!)}',
                  style: appFonts.caption.success.ts,
                ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: step.progressPercentage / 100,
                backgroundColor: appColors.neutral.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(
                  step.isCompleted ? appColors.success.main : appColors.primary,
                ),
              ),
              if (step.materials.isNotEmpty) ...[
                const Divider(height: 24),
                Text('Bahan Baku', style: appFonts.text.semibold.ts),
                const SizedBox(height: 8),
                ...step.materials.map((material) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(material.name, style: appFonts.text.ts),
                          Text(
                            '${material.prepared}/${material.required} ${material.unit}',
                            style: appFonts.caption.gray.ts,
                          ),
                          LinearProgressIndicator(
                            value: material.progress / 100,
                            backgroundColor: appColors.neutral.withOpacity(0.2),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              material.progress >= 100
                                  ? appColors.success.main
                                  : appColors.primary,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
              if (step.products.isNotEmpty) ...[
                const Divider(height: 24),
                Text('Hasil Produksi', style: appFonts.text.semibold.ts),
                const SizedBox(height: 8),
                ...step.products.map((product) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name, style: appFonts.text.ts),
                          Text(
                            '${product.produced}/${product.quota} ${product.unit}',
                            style: appFonts.caption.gray.ts,
                          ),
                          LinearProgressIndicator(
                            value: product.progress / 100,
                            backgroundColor: appColors.neutral.withOpacity(0.2),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              product.progress >= 100
                                  ? appColors.success.main
                                  : appColors.primary,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
