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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.inventory_2, size: 20, color: appColors.primary),
              const SizedBox(width: 8),
              Text('Produk Akhir', style: appFonts.subtitle.semibold.ts),
            ],
          ),
          const SizedBox(height: 12),
          ...products.map((product) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(product.name, style: appFonts.text.ts),
                    ),
                    Expanded(
                      child: Text(
                        '${product.produced}/${product.quota} ${product.unit}',
                        style: appFonts.text.caption.bold.ts,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 45,
                      child: Text(
                        '${product.progress.toStringAsFixed(0)}%',
                        style: appFonts.text.primary.caption.bold.ts,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
