import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';
import '../models/process_step.dart';
import '../models/raw_material.dart';
import '../models/end_product.dart';

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
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appColors.neutral.withOpacity(0.2),
          width: 1,
        ),
      ),
      title: Text('Tahapan', style: appFonts.subtitle.semibold.ts),
      children: steps.map((step) => _buildProcessStep(step)).toList(),
    );
  }

  Widget _buildProcessStep(ProcessStep step) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appColors.neutral.withOpacity(0.2),
          width: 1,
        ),
      ),
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
              const SizedBox(height: 16),
              if (step.materials.isNotEmpty) ...[
                Text('Bahan Baku', style: appFonts.text.semibold.ts),
                const SizedBox(height: 8),
                _buildMaterialsTable(step.materials),
                const SizedBox(height: 16),
              ],
              if (step.products.isNotEmpty) ...[
                Text('Hasil Produksi', style: appFonts.text.semibold.ts),
                const SizedBox(height: 8),
                _buildProductsTable(step.products),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMaterialsTable(List<RawMaterial> materials) {
    return Table(
      border: TableBorder.all(
        color: appColors.neutral.withOpacity(0.2),
        width: 1,
      ),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: appColors.neutral.withOpacity(0.1),
          ),
          children: [
            _buildTableCell('Nama', isHeader: true),
            _buildTableCell('Target', isHeader: true),
            _buildTableCell('Aktual', isHeader: true),
            _buildTableCell('Progress', isHeader: true),
          ],
        ),
        ...materials.map((material) => TableRow(
              children: [
                _buildTableCell(material.name),
                _buildTableCell('${material.required} ${material.unit}'),
                _buildTableCell('${material.prepared} ${material.unit}'),
                _buildTableCell(
                  '${material.progress.toStringAsFixed(1)}%',
                  textColor:
                      material.progress >= 100 ? appColors.success.main : null,
                ),
              ],
            )),
      ],
    );
  }

  Widget _buildProductsTable(List<EndProduct> products) {
    return Table(
      border: TableBorder.all(
        color: appColors.neutral.withOpacity(0.2),
        width: 1,
      ),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: appColors.neutral.withOpacity(0.1),
          ),
          children: [
            _buildTableCell('Nama', isHeader: true),
            _buildTableCell('Target', isHeader: true),
            _buildTableCell('Aktual', isHeader: true),
            _buildTableCell('Progress', isHeader: true),
          ],
        ),
        ...products.map((product) => TableRow(
              children: [
                _buildTableCell(product.name),
                _buildTableCell('${product.quota} ${product.unit}'),
                _buildTableCell('${product.produced} ${product.unit}'),
                _buildTableCell(
                  '${product.progress.toStringAsFixed(1)}%',
                  textColor:
                      product.progress >= 100 ? appColors.success.main : null,
                ),
              ],
            )),
      ],
    );
  }

  Widget _buildTableCell(String text,
      {bool isHeader = false, Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Text(
        text,
        style: (isHeader ? appFonts.caption.semibold : appFonts.caption)
            .copyWith(color: textColor)
            .ts,
        textAlign: isHeader ? TextAlign.center : TextAlign.right,
      ),
    );
  }
}
