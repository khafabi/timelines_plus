import 'package:flutter/material.dart';
import '../../../style/app_colors.dart';
import '../../../style/app_fonts.dart';
import '../../models/end_product.dart';

class WorkOrderProducts extends StatelessWidget {
  final List<EndProduct> products;

  const WorkOrderProducts({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.inventory_2, size: 20, color: appColors.primary),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appColors.neutral.withOpacity(0.2),
          width: 1,
        ),
      ),
      title: Text('Produk Akhir', style: appFonts.subtitle.semibold.ts),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
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
          ),
        ),
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
