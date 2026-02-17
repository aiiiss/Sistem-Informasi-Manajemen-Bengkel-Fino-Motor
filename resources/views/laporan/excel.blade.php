<!DOCTYPE html>
<html lang="id">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style>
        /* Style bisa dimasukkan di sini jika perlu */
        th {
            background-color: #eeeeee;
            font-weight: bold;
            text-align: center;
            border: 1px solid #000000;
        }
        td {
            border: 1px solid #000000;
        }
    </style>
</head>
<body>
    <table>
        <!-- Header Laporan -->
        <tr>
            <td colspan="6" style="text-align: center; font-weight: bold; font-size: 16px;">LAPORAN KEUANGAN & TRANSAKSI BENGKEL</td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center;">Periode: {{ date('d M Y', strtotime($startDate)) }} - {{ date('d M Y', strtotime($endDate)) }}</td>
        </tr>
        <tr></tr>

        <!-- Ringkasan Keuangan -->
        <tr>
            <td colspan="2" style="font-weight: bold;">RINGKASAN KEUANGAN</td>
        </tr>
        <tr>
            <td>Total Pemasukan (Penjualan)</td>
            <td>: Rp {{ number_format($totalPemasukan, 0, ',', '.') }}</td>
        </tr>
        <tr>
            <td>Total Pengeluaran (Pembelian)</td>
            <td>: Rp {{ number_format($totalPengeluaran, 0, ',', '.') }}</td>
        </tr>
        <tr>
            <td style="font-weight: bold;">KEUNTUNGAN BERSIH</td>
            <td style="font-weight: bold;">: Rp {{ number_format($keuntungan, 0, ',', '.') }}</td>
        </tr>
        <tr></tr>

        <!-- Header Tabel Data -->
        <thead>
        <tr>
            <th style="width: 20px;">TANGGAL</th>
            <th style="width: 25px;">KODE TRANSAKSI</th>
            <th style="width: 15px;">TIPE</th>
            <th style="width: 40px;">DETAIL BARANG (Qty)</th>
            <th style="width: 20px;">TOTAL NILAI</th>
            <th style="width: 20px;">KASIR</th>
        </tr>
        </thead>
        
        <!-- Isi Data -->
        <tbody>
        @foreach($transaksi as $trx)
            <tr>
                <td>{{ date('d/m/Y H:i', strtotime($trx->tanggal_transaksi)) }}</td>
                <td>{{ $trx->kode_transaksi }}</td>
                <td style="text-align: center;">
                    @if($trx->tipe_transaksi == 'keluar') 
                        PENJUALAN 
                    @else 
                        PEMBELIAN 
                    @endif
                </td>
                <td>
                    @foreach($trx->details as $detail)
                        {{ $detail->nama_barang }} ({{ $detail->jumlah }}), 
                    @endforeach
                </td>
                <td>Rp {{ number_format($trx->total_nilai, 0, ',', '.') }}</td>
                <td>{{ $trx->user->first_name ?? 'System' }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>
</body>
</html>