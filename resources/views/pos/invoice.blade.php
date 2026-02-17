<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nota Transaksi - {{ $transaksi->kode_transaksi }}</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @media print {
            .no-print { display: none; }
            body { background-color: white; }
            .nota-container { box-shadow: none; border: none; width: 100%; max-width: 100%; }
        }
        .nota-container {
            max-width: 80mm; /* Ukuran kertas thermal 80mm standard */
            margin: auto;
            background: white;
        }
    </style>
</head>
<body class="bg-gray-100 p-8 text-sm font-mono">
<body class="bg-softbg text-slate-800">

    <div class="nota-container p-4 shadow-lg rounded-lg">
        <!-- Header Nota -->
        <div class="text-center border-b-2 border-dashed border-gray-300 pb-4 mb-4">
            <h1 class="text-xl font-bold uppercase">BENGKEL FINO MOTOR</h1>
            <p class="text-gray-500 text-xs">Jl. Melati Indah, Delima, Kec. Tampan, KotaPekanbaru, Riau 28292.</p>
            <p class="text-gray-500 text-xs">Telp: 0878-6919-1988</p>
        </div>

        <!-- Info Transaksi -->
        <div class="mb-4 text-xs">
            <div class="flex justify-between">
                <span>No. Nota</span>
                <span class="font-bold">{{ $transaksi->kode_transaksi }}</span>
            </div>
            <div class="flex justify-between">
                <span>Tanggal</span>
                <span>{{ date('d/m/y H:i', strtotime($transaksi->tanggal_transaksi)) }}</span>
            </div>
            <div class="flex justify-between">
                <span>Kasir</span>
                <span>{{ $transaksi->user->first_name ?? 'Admin' }}</span>
            </div>
            
            <!-- (Opsional) Nama Mekanik di Header juga bisa tetap ada atau dihapus jika sudah ada di tabel -->
            @if(!empty($transaksi->mekanik))
            <div class="flex justify-between">
                <span>Mekanik</span>
                <span>{{ $transaksi->mekanik }}</span>
            </div>
            @endif
        </div>

        <!-- Detail Barang & Jasa -->
        <div class="border-b-2 border-dashed border-gray-300 pb-4 mb-4">
            <table class="w-full text-xs">
                <thead>
                    <tr class="text-left border-b border-gray-200">
                        <th class="pb-2">Item</th>
                        <th class="pb-2 text-right">Qty</th>
                        <th class="pb-2 text-right">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Loop Barang -->
                    @foreach ($detailTransaksi as $item)
                    <tr>
                        <td class="py-1 pt-2">
                            <div class="font-semibold">{{ $item->nama_barang }}</div>
                            <div class="text-[10px] text-gray-500">@ {{ number_format($item->harga_satuan, 0, ',', '.') }}</div>
                        </td>
                        <td class="py-1 pt-2 text-right align-top">{{ $item->jumlah }}</td>
                        <td class="py-1 pt-2 text-right align-top">
                            {{ number_format($item->subtotal, 0, ',', '.') }}
                        </td>
                    </tr>
                    @endforeach

                    <!-- TAMPILKAN BIAYA JASA + NAMA MEKANIK -->
                    @if($transaksi->biaya_jasa > 0)
                    <tr>
                        <td class="py-1 pt-2">
                            <div class="font-semibold">Jasa Servis</div>
                            <!-- PERUBAHAN: Menampilkan Nama Mekanik di sini -->
                            @if(!empty($transaksi->mekanik))
                                <div class="text-[10px] text-gray-500 italic">({{ $transaksi->mekanik }})</div>
                            @endif
                        </td>
                        <td class="py-1 pt-2 text-right align-top">1</td>
                        <td class="py-1 pt-2 text-right align-top">
                            {{ number_format($transaksi->biaya_jasa, 0, ',', '.') }}
                        </td>
                    </tr>
                    @endif
                </tbody>
            </table>
        </div>

        <!-- Total Pembayaran -->
        <div class="border-b-2 border-dashed border-gray-300 pb-4 mb-4">
            <div class="flex justify-between font-bold text-lg">
                <span>TOTAL</span>
                <span>Rp {{ number_format($totalHarga, 0, ',', '.') }}</span>
            </div>
        </div>

        <!-- Footer -->
        <div class="text-center text-xs text-gray-500 mb-6">
            <p>Terima kasih atas kunjungan Anda!</p>
            <p class="mt-1">Barang yang sudah dibeli tidak dapat ditukar/dikembalikan.</p>
        </div>

        <!-- Tombol Aksi (Tidak Tercetak) -->
        <div class="no-print flex flex-col gap-2">
            <button onclick="window.print()" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded shadow">
                🖨️ Cetak Nota
            </button>
            <a href="{{ route('pos.index') }}" class="w-full block text-center bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded shadow">
                ⬅️ Kembali ke Kasir
            </a>
        </div>

    </div>

    <script>
        // window.onload = function() { window.print(); }
    </script>
</body>
</html>