// GoRouter configuration
import 'package:example/showcase/package_delivery_tracking.dart';
import 'package:example/showcase/process_timeline.dart';
import 'package:example/showcase/timeline_status.dart';
import 'package:example/theme_page.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';
import 'manufacturing/manufacturing_timeline_page.dart';
import 'manufacturing/manufacturing_board.dart';
import 'manufacturing/models/manufacturing_timeline_models.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/theme',
      builder: (context, state) => const ThemePage(),
    ),
    GoRoute(
      path: '/timeline_status',
      builder: (context, state) => const TimelineStatusPage(),
    ),
    GoRoute(
      path: '/package_delivery_tracking',
      builder: (context, state) => const PackageDeliveryTrackingPage(),
    ),
    GoRoute(
      path: '/process_timeline',
      builder: (context, state) => const ProcessTimelinePage(),
    ),
    GoRoute(
      path: '/manufacturing_timeline',
      builder: (context, state) => ManufacturingTimelinePage(
        workOrder: SampleManufacturingData.getSampleWorkOrder(),
      ),
    ),
    GoRoute(
      path: '/manufacturing_board',
      builder: (context, state) => const ManufacturingBoard(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const ExamplePage(),
    ),
  ],
);
