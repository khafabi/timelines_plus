### Updated Prompt for Flutter App:

Create a Flutter widget that displays a Work Order (WO) tracking board with three columns: **"Di Jadwalkan" (Scheduled)**, **"Dalam Proses" (In Process)**, and **"Selesai/Ditutup" (Completed/Closed)**. Each column contains multiple cards representing individual work orders with detailed information. Here's how each section should be structured:

---

### **1. Data Models and Structure**

Before implementing the Flutter UI, define the necessary data models using Dart classes. The data models should include the following:

- **WorkOrder**:
  ```dart
  class WorkOrder {
    final String id;
    final String workOrderNumber;
    final DateTime startDate;
    final DateTime estimatedCompletionDate;
    final String status; // 'scheduled', 'inProcess', 'completed'
    final List<Task> tasks;
    final DateTime? completionDate;

    WorkOrder({
      required this.id,
      required this.workOrderNumber,
      required this.startDate,
      required this.estimatedCompletionDate,
      required this.status,
      required this.tasks,
      this.completionDate,
    });
  }
  ```

- **Task**:
  ```dart
  class Task {
    final String id;
    final String name;
    final String icon;
    final int quantity;
    final int progress; // Represents percentage of completion (0-100)
    final DateTime? timestamp; // Optional, used for overdue indicators
    final bool expandable;
    final String? details;

    Task({
      required this.id,
      required this.name,
      required this.icon,
      required this.quantity,
      required this.progress,
      this.timestamp,
      this.expandable = false,
      this.details,
    });
  }
  ```

- **Column**:
  ```dart
  class ColumnModel {
    final String id;
    final String title;
    final String status;
    final Color themeColor;

    ColumnModel({
      required this.id,
      required this.title,
      required this.status,
      required this.themeColor,
    });
  }
  ```

---

### **2. Flutter UI Layout Structure**

Create a responsive Flutter layout with three columns representing the status of the work order:

- Each column has a header indicating its status.
- Each column holds multiple **Work Order** cards based on their status (**Scheduled**, **In Process**, **Completed**).

---

### **3. Card Structure**

- **Card Header**:
    - Displays the unique Work Order number (e.g., "WO.2024.08.00001").
    - Shows the start date and estimated completion date, with the estimated date highlighted in red if overdue.
- **Card Body**:
    - Lists the tasks and their completion status.
    - Each task includes:
        - Task name with an icon.
        - Quantity and completion percentage (e.g., "Cake Coklat Bakar (1 PCS) 1000 (100%)").
        - Timestamp (for overdue tasks) displayed in red if overdue.
        - Expandable sections for additional task details.
        - A status label (e.g., "Selesai" with completion date in green).
- **Card Footer**:
    - Includes a "Lihat Detail" button that navigates to a detailed view of the work order.

---

### **4. Functional Requirements**

- Cards should be interactive, with expandable sections to reveal additional task details.
- Use reusable Flutter widgets for cards, tasks, and status labels.
- Ensure the layout is responsive, with cards stacking vertically on smaller screens.

---

### **5. Sample Flutter Code**

Here's a basic implementation of the **Work Order** card structure using Flutter:

```dart
import 'package:flutter/material.dart';

class WorkOrderCard extends StatelessWidget {
  final WorkOrder workOrder;

  const WorkOrderCard({Key? key, required this.workOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  workOrder.workOrderNumber,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Est. Selesai: ${workOrder.estimatedCompletionDate}",
                  style: TextStyle(
                    color: workOrder.estimatedCompletionDate.isBefore(DateTime.now())
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Task List
            ...workOrder.tasks.map((task) => ListTile(
                  leading: Text(task.icon),
                  title: Text(task.name),
                  subtitle: Text("Quantity: ${task.quantity}"),
                  trailing: Text("${task.progress}%"),
                )),

            // Footer with completion status
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to details page
                },
                child: Text("Lihat Detail"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### **6. Example JSON Data**

To simulate the data in your app, you can use the following example:

```dart
List<WorkOrder> workOrders = [
  WorkOrder(
    id: '1',
    workOrderNumber: 'WO.2024.08.00001',
    startDate: DateTime.parse('2024-08-02'),
    estimatedCompletionDate: DateTime.parse('2024-08-09'),
    status: 'scheduled',
    tasks: [
      Task(
        id: 'task1',
        name: 'Cake Coklat Bakar',
        icon: '🍰',
        quantity: 1,
        progress: 100,
        timestamp: DateTime.parse('2023-02-03 08:12'),
      ),
      Task(
        id: 'task2',
        name: 'Remah Roti',
        icon: '🥖',
        quantity: 20,
        progress: 100,
        timestamp: DateTime.parse('2023-02-03 08:12'),
      ),
      Task(
        id: 'task3',
        name: 'Pengambilan Bahan Baku',
        icon: '🛒',
        quantity: 1,
        progress: 100,
        expandable: true,
      ),
      Task(
        id: 'task4',
        name: 'Panggang',
        icon: '🔥',
        quantity: 1,
        progress: 100,
      ),
    ],
    completionDate: DateTime.parse('2024-08-03'),
  ),
];
```

---

This prompt now includes the definition of data classes for Dart, detailed instructions on implementing the UI, and a sample Flutter component to guide you or an LLM in generating the required code for your app.