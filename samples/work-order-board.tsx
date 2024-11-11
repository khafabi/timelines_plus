'use client'

import { Calendar, ChevronDown, ChevronRight, ChevronUp, Clock, Coffee, ExternalLink, ShoppingCart } from "lucide-react"
import { useState } from "react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardFooter, CardHeader } from "@/components/ui/card"

interface Task {
  id: string
  name: string
  quantity: string
  completion: number
  timestamp?: string
}

interface WorkOrder {
  id: string
  startDate: string
  estimatedEndDate: string
  tasks: Task[]
  status: "scheduled" | "in-process" | "completed"
  completionDate?: string
}

export default function Component() {
  const [expandedTasks, setExpandedTasks] = useState<Record<string, boolean>>({})

  const toggleTask = (taskId: string) => {
    setExpandedTasks(prev => ({
      ...prev,
      [taskId]: !prev[taskId]
    }))
  }

  const workOrders: WorkOrder[] = [
    {
      id: "WO.2024.08.00001",
      startDate: "02/08/2024",
      estimatedEndDate: "09/08/2024",
      status: "scheduled",
      tasks: [
        { id: "1", name: "Cake Coklat Bakar (1 PCS)", quantity: "1000", completion: 100, timestamp: "03 Feb 2023, 08:12" },
        { id: "2", name: "Remah Roti(20 GR)", quantity: "1000", completion: 100 },
        { id: "3", name: "Pengambilan Bahan Baku", quantity: "1000", completion: 100 },
        { id: "4", name: "Panggang (1 PCS)", quantity: "1000", completion: 100 }
      ],
      completionDate: "03/08/2024"
    },
    {
      id: "WO.2024.08.00002",
      startDate: "03/08/2024",
      estimatedEndDate: "10/08/2024",
      status: "in-process",
      tasks: [
        { id: "5", name: "Cake Vanilla (1 PCS)", quantity: "800", completion: 50, timestamp: "04 Feb 2023, 09:30" },
        { id: "6", name: "Krim Vanilla(30 GR)", quantity: "800", completion: 75 },
        { id: "7", name: "Pengambilan Bahan Baku", quantity: "800", completion: 100 },
        { id: "8", name: "Panggang (1 PCS)", quantity: "800", completion: 25 }
      ]
    },
    {
      id: "WO.2024.08.00003",
      startDate: "01/08/2024",
      estimatedEndDate: "08/08/2024",
      status: "completed",
      tasks: [
        { id: "9", name: "Roti Gandum (1 PCS)", quantity: "500", completion: 100, timestamp: "02 Feb 2023, 14:45" },
        { id: "10", name: "Biji Gandum(50 GR)", quantity: "500", completion: 100 },
        { id: "11", name: "Pengambilan Bahan Baku", quantity: "500", completion: 100 },
        { id: "12", name: "Panggang (1 PCS)", quantity: "500", completion: 100 }
      ],
      completionDate: "07/08/2024"
    }
  ]

  const getStatusColor = (status: WorkOrder['status']) => {
    switch (status) {
      case 'scheduled':
        return 'bg-blue-500'
      case 'in-process':
        return 'bg-orange-500'
      case 'completed':
        return 'bg-green-500'
      default:
        return 'bg-gray-500'
    }
  }

  const getStatusTitle = (status: WorkOrder['status']) => {
    switch (status) {
      case 'scheduled':
        return 'Di Jadwalkan'
      case 'in-process':
        return 'Dalam Proses'
      case 'completed':
        return 'Selesai/Ditutup'
    }
  }

  const getStatusIcon = (status: WorkOrder['status']) => {
    switch (status) {
      case 'scheduled':
        return <Calendar className="h-5 w-5" />
      case 'in-process':
        return <Clock className="h-5 w-5" />
      case 'completed':
        return <Coffee className="h-5 w-5" />
    }
  }

  return (
    <div className="container mx-auto p-4">
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        {(['scheduled', 'in-process', 'completed'] as const).map(status => (
          <div key={status} className="space-y-4">
            <div className={`flex items-center gap-2 p-2 rounded-lg ${getStatusColor(status)} text-white`}>
              {getStatusIcon(status)}
              <h2 className="text-lg font-semibold">{getStatusTitle(status)}</h2>
            </div>
            
            <div className="space-y-4">
              {workOrders
                .filter(wo => wo.status === status)
                .map(workOrder => (
                  <Card key={workOrder.id} className="shadow-md">
                    <CardHeader className={`${getStatusColor(workOrder.status)} text-white rounded-t-lg`}>
                      <div className="flex justify-between items-center">
                        <span>{workOrder.id}</span>
                        <span>{workOrder.startDate}</span>
                      </div>
                    </CardHeader>
                    <CardContent className="p-4 space-y-3">
                      <div className="flex justify-between text-sm">
                        <span>Tgl Mulai {workOrder.startDate}</span>
                        <span className={workOrder.status === 'completed' ? 'text-green-500' : 'text-red-500'}>
                          Est. Selesai {workOrder.estimatedEndDate}
                        </span>
                      </div>
                      
                      {workOrder.tasks.map(task => (
                        <div key={task.id} className="space-y-2">
                          <div className="flex items-center justify-between">
                            <div className="flex items-center gap-2">
                              <ShoppingCart className="h-4 w-4" />
                              <span>{task.name}</span>
                            </div>
                            <div className="flex items-center gap-2">
                              <span>{task.quantity} ({task.completion}%)</span>
                              <Button
                                variant="ghost"
                                size="sm"
                                onClick={() => toggleTask(task.id)}
                              >
                                {expandedTasks[task.id] ? (
                                  <ChevronUp className="h-4 w-4" />
                                ) : (
                                  <ChevronDown className="h-4 w-4" />
                                )}
                              </Button>
                            </div>
                          </div>
                          
                          {task.timestamp && (
                            <div className="text-sm text-red-500">
                              {task.timestamp}
                            </div>
                          )}
                          
                          {expandedTasks[task.id] && (
                            <div className="pl-6 text-sm text-gray-600">
                              Additional task details would go here...
                            </div>
                          )}
                        </div>
                      ))}
                      
                      {workOrder.completionDate && (
                        <div className="flex items-center gap-2 text-green-500">
                          <span>Selesai</span>
                          <span>{workOrder.completionDate}</span>
                        </div>
                      )}
                    </CardContent>
                    <CardFooter className="p-4 pt-0">
                      <Button variant="link" className="ml-auto flex items-center gap-1">
                        Lihat Detail
                        <ChevronRight className="h-4 w-4" />
                      </Button>
                    </CardFooter>
                  </Card>
                ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}