import 'package:example/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'data/mock_work_orders.dart';
import 'widgets/board/board_layout.dart';

class ManufacturingBoard extends StatelessWidget {
  const ManufacturingBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.background,
      appBar: AppBar(
        title: const Text('Manufacturing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return BoardLayout(
              workOrders: mockWorkOrders,
              isMobile: constraints.maxWidth < 600,
            );
          },
        ),
      ),
    );
  }
}
