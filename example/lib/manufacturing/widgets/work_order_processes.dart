import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';
import '../../models/process_step.dart';
import '../../models/raw_material.dart';
import '../../models/end_product.dart';

class WorkOrderProcesses extends StatelessWidget {
  final List<ProcessStep> steps;

  const WorkOrderProcesses({
    Key? key,
    required this.steps,
  }) : super(key: key);

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
      title: Text(step.name, style: appFonts.text.semibold.ts),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (step.description.isNotEmpty)
            Text(step.description, style: appFonts.caption.gray.ts),
          Text(
            'Mulai: ${DateFormat('dd/MM/yyyy HH:mm').format(step.startDate)}',
            style: appFonts.caption.gray.ts,
          ),
          if (step.completedAt != null)
            Text(
              'Selesai: ${DateFormat('dd/MM/yyyy HH:mm').format(step.completedAt!)}',
              style: appFonts.caption.success.ts,
            ),
          LinearProgressIndicator(
            value: step.progressPercentage / 100,
            backgroundColor: appColors.neutral.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(
              step.isCompleted ? appColors.success.main : appColors.primary,
            ),
          ),
          Text(
            'Progress: ${step.progressPercentage.toStringAsFixed(1)}%',
            style: appFonts.caption.gray.ts,
          ),
        ],
      ),
      children: [
        if (step.materials.isNotEmpty) _buildMaterialsList(step.materials),
        if (step.products.isNotEmpty) _buildProductsList(step.products),
      ],
    );
  }

  Widget _buildMaterialsList(List<RawMaterial> materials) {
    return ExpansionTile(
      title: Text('Bahan Baku', style: appFonts.text.semibold.ts),
      children: materials.map((material) {
        return ListTile(
          dense: true,
          title: Text(material.name, style: appFonts.text.ts),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
        );
      }).toList(),
    );
  }

  Widget _buildProductsList(List<EndProduct> products) {
    return ExpansionTile(
      title: Text('Hasil Produksi', style: appFonts.text.semibold.ts),
      children: products.map((product) {
        return ListTile(
          dense: true,
          title: Text(product.name, style: appFonts.text.ts),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
        );
      }).toList(),
    );
  }
}
