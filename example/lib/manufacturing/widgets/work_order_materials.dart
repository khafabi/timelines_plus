import 'package:flutter/material.dart';
import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';
import '../models/raw_material.dart';

class WorkOrderMaterials extends StatefulWidget {
  final List<RawMaterial> materials;

  const WorkOrderMaterials({
    Key? key,
    required this.materials,
  }) : super(key: key);

  @override
  _WorkOrderMaterialsState createState() => _WorkOrderMaterialsState();
}

class _WorkOrderMaterialsState extends State<WorkOrderMaterials> {
  bool _isMaterialsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () =>
              setState(() => _isMaterialsExpanded = !_isMaterialsExpanded),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.category, size: 20, color: appColors.primary),
                const SizedBox(width: 8),
                Text('Bahan Baku', style: appFonts.subtitle.semibold.ts),
                const Spacer(),
                Icon(
                  _isMaterialsExpanded ? Icons.expand_less : Icons.expand_more,
                  color: appColors.primary,
                ),
              ],
            ),
          ),
        ),
        if (_isMaterialsExpanded)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: widget.materials
                  .map((material) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child:
                                  Text(material.name, style: appFonts.text.ts),
                            ),
                            Expanded(
                              child: Text(
                                '${material.prepared}/${material.required} ${material.unit}',
                                style: appFonts.text.caption.bold.ts,
                                textAlign: TextAlign.right,
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 45,
                              child: Text(
                                '${material.progress.toStringAsFixed(0)}%',
                                style: appFonts.text.primary.caption.bold.ts,
                                textAlign: TextAlign.right,
                              ),
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
