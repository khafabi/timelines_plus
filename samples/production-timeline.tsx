import { Card } from "@/components/ui/card"

export default function Component() {
  return (
    <div className="w-full max-w-6xl mx-auto p-4">
      {/* Header Card */}
      <Card className="mb-8 overflow-hidden shadow-md">
        <div className="bg-blue-600 text-white p-4 flex justify-between items-center">
          <div className="font-medium">
            Perintah Kerja
            <div className="text-sm opacity-90">WO.2024.08.00001</div>
          </div>
          <div className="text-right">
            <div className="text-sm">Update terakhir 17/08/2024</div>
            <div>Progress 100%</div>
          </div>
        </div>
        <div className="p-4 text-sm">
          Cake Coklat Bakar (1000PCS), Remah Roti (20 GR)
        </div>
      </Card>

      {/* Timeline */}
      <div className="relative space-y-8">
        {/* Vertical Line */}
        <div className="absolute left-20 top-0 bottom-0 w-[2px] bg-gray-200" />

        {/* Material Collection */}
        <div className="relative flex items-start">
          <div className="w-20 flex-shrink-0 text-right">
            <div className="text-sm text-gray-500">02/08/2024</div>
          </div>
          <div className="absolute left-20 -translate-x-1/2 w-6 h-6 rounded-full border-2 border-gray-200 bg-white z-10" />
          <div className="flex-grow pl-8">
            <Card className="overflow-hidden shadow-md">
              <div className="bg-blue-500 text-white p-4 flex justify-between items-center">
                <div className="font-medium">MF.2024.08.00002</div>
                <div className="text-sm">Ambil Barang</div>
              </div>
              <div className="p-4 text-sm space-y-1 text-gray-600">
                <div>[100001] Tepung Terigu (0.1 KG)</div>
                <div>[100001] Tepung Terigu (0.1 KG)</div>
              </div>
            </Card>
          </div>
        </div>

        {/* Process Start */}
        <div className="relative flex items-start">
          <div className="w-20 flex-shrink-0 text-right">
            <div className="text-sm text-gray-500">03/08/2024</div>
          </div>
          <div className="absolute left-20 -translate-x-1/2 w-6 h-6 rounded-full border-2 border-gray-200 bg-white z-10" />
          <div className="flex-grow pl-8">
            <Card className="overflow-hidden shadow-md">
              <div className="bg-orange-500 text-white p-4 flex justify-between items-center">
                <div className="font-medium">MF.2024.08.00002</div>
                <div className="text-sm">Mulai</div>
              </div>
              <div className="p-4 text-sm text-gray-600">
                Tahapan proses Buat Cake (2 PCS)
              </div>
            </Card>
          </div>
        </div>

        {/* Process Complete */}
        <div className="relative flex items-start">
          <div className="w-20 flex-shrink-0 text-right">
            <div className="text-sm text-gray-500">03/08/2024</div>
          </div>
          <div className="absolute left-20 -translate-x-1/2 w-6 h-6 rounded-full border-2 border-gray-200 bg-white z-10" />
          <div className="flex-grow pl-8">
            <Card className="overflow-hidden shadow-md">
              <div className="bg-orange-500 text-white p-4 flex justify-between items-center">
                <div className="font-medium">MF.2024.08.00002</div>
                <div className="text-sm">Selesai</div>
              </div>
              <div className="p-4 text-sm text-gray-600">
                Tahapan proses Buat Cake (2 PCS)
              </div>
            </Card>
          </div>
        </div>

        {/* Final Product */}
        <div className="relative flex items-start">
          <div className="w-20 flex-shrink-0 text-right">
            <div className="text-sm text-gray-500">04/08/2024</div>
          </div>
          <div className="absolute left-20 -translate-x-1/2 w-6 h-6 rounded-full border-2 border-gray-200 bg-white z-10" />
          <div className="flex-grow pl-8">
            <Card className="overflow-hidden shadow-md">
              <div className="bg-green-500 text-white p-4 flex justify-between items-center">
                <div className="font-medium">FGS.2024.08.00002</div>
              </div>
              <div className="p-4 text-sm space-y-1 text-gray-600">
                <div>[100001] Cake Coklat Bakar (1000 PCS)</div>
                <div>[100001] Remah Roti (20 GR)</div>
              </div>
            </Card>
          </div>
        </div>
      </div>
    </div>
  )
}