<?php

namespace App\Exports;

use App\Models\Transaksi;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithCustomStartCell;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Color;

class LaporanExport implements FromCollection, WithHeadings, WithMapping, ShouldAutoSize, WithStyles, WithCustomStartCell, WithEvents
{
    protected $startDate;
    protected $endDate;

    public function __construct($startDate, $endDate)
    {
        $this->startDate = $startDate;
        $this->endDate = $endDate;
    }

    // 1. Ambil Data
    public function collection()
    {
        return Transaksi::with(['user', 'details.item'])
            ->whereDate('tanggal_transaksi', '>=', $this->startDate)
            ->whereDate('tanggal_transaksi', '<=', $this->endDate)
            ->latest('tanggal_transaksi')
            ->get();
    }

    // 2. Header Kolom Utama
    public function headings(): array
    {
        return [
            'TANGGAL',
            'KODE TRANSAKSI',
            'TIPE',
            'DETAIL BARANG',
            'MEKANIK',
            'JASA (Rp)',
            'TOTAL (Rp)',
            'MODAL (Rp)',
            'PROFIT (Rp)',
            'KASIR',
        ];
    }

    // 3. Mapping Data ke Kolom
    public function map($transaksi): array
    {
        $detailString = '';
        $totalModal = 0;

        foreach ($transaksi->details as $detail) {
            $detailString .= $detail->nama_barang . ' (' . $detail->jumlah . '), ';
            
            if ($transaksi->tipe_transaksi == 'keluar') {
                $hargaBeli = $detail->item ? $detail->item->harga_beli : 0;
                $totalModal += $hargaBeli * $detail->jumlah;
            } else {
                $totalModal += $detail->subtotal; 
            }
        }
        $detailString = rtrim($detailString, ', ');

        $namaMekanik = $transaksi->mekanik ?? '-';
        $biayaJasa = $transaksi->biaya_jasa ?? 0;
        $modalDisplay = 0;
        $profit = 0;

        if ($transaksi->tipe_transaksi == 'keluar') {
            $modalDisplay = $totalModal;
            $profit = $transaksi->total_nilai - $totalModal;
        } else {
            $modalDisplay = $transaksi->total_nilai;
            $namaMekanik = '-';
            $biayaJasa = 0;
        }

        return [
            date('d/m/Y H:i', strtotime($transaksi->tanggal_transaksi)),
            $transaksi->kode_transaksi,
            ($transaksi->tipe_transaksi == 'keluar') ? 'PENJUALAN' : 'PEMBELIAN',
            $detailString,
            $namaMekanik,
            $biayaJasa,
            $transaksi->total_nilai,
            $modalDisplay,
            ($transaksi->tipe_transaksi == 'keluar') ? $profit : '-',
            $transaksi->user->first_name ?? 'System',
        ];
    }

    // 4. Mulai Data dari Baris ke-9 (kasih ruang lebih untuk header)
    public function startCell(): string
    {
        return 'A9';
    }

    // 5. Styling & Header Laporan Custom
    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function(AfterSheet $event) {
                $sheet = $event->sheet;

                // ==========================================
                // A. HEADER LAPORAN UTAMA (BARIS 1-3)
                // ==========================================
                
                // Baris 1: Judul Utama
                $sheet->mergeCells('A1:J1');
                $sheet->setCellValue('A1', 'LAPORAN KEUANGAN & TRANSAKSI BENGKEL');
                $sheet->getStyle('A1')->applyFromArray([
                    'font' => [
                        'bold' => true,
                        'size' => 16,
                        'color' => ['argb' => 'FFFFFFFF']
                    ],
                    'fill' => [
                        'fillType' => Fill::FILL_SOLID,
                        'startColor' => ['argb' => 'FF2C3E50'] // Biru Gelap
                    ],
                    'alignment' => [
                        'horizontal' => Alignment::HORIZONTAL_CENTER,
                        'vertical' => Alignment::VERTICAL_CENTER
                    ]
                ]);
                $sheet->getRowDimension('1')->setRowHeight(30);

                // Baris 2: Periode
                $sheet->mergeCells('A2:J2');
                $sheet->setCellValue('A2', 'Periode: ' . date('d M Y', strtotime($this->startDate)) . ' - ' . date('d M Y', strtotime($this->endDate)));
                $sheet->getStyle('A2')->applyFromArray([
                    'font' => [
                        'bold' => true,
                        'size' => 11,
                        'color' => ['argb' => 'FFFFFFFF']
                    ],
                    'fill' => [
                        'fillType' => Fill::FILL_SOLID,
                        'startColor' => ['argb' => 'FF34495E'] // Biru Gelap Sedikit Lebih Terang
                    ],
                    'alignment' => [
                        'horizontal' => Alignment::HORIZONTAL_CENTER,
                        'vertical' => Alignment::VERTICAL_CENTER
                    ]
                ]);
                $sheet->getRowDimension('2')->setRowHeight(25);

                // Baris 3: Kosong (Spacing)
                $sheet->getRowDimension('3')->setRowHeight(5);

                // ==========================================
                // B. RINGKASAN KEUANGAN (BARIS 4-6)
                // ==========================================
                
                $transaksi = $this->collection();
                $penjualan = $transaksi->where('tipe_transaksi', 'keluar');
                
                $totalMasuk = $penjualan->sum('total_nilai');
                $totalJasa = $penjualan->sum('biaya_jasa');
                $totalKeluar = $transaksi->where('tipe_transaksi', 'masuk')->sum('total_nilai');
                
                // Hitung estimasi profit keseluruhan
                $totalModalPenjualan = 0;
                foreach ($penjualan as $trx) {
                    foreach ($trx->details as $detail) {
                        $hargaBeli = $detail->item ? $detail->item->harga_beli : 0;
                        $totalModalPenjualan += $hargaBeli * $detail->jumlah;
                    }
                }
                $estimasiProfit = $totalMasuk - $totalModalPenjualan;

                // Box Ringkasan - Kolom Kiri (A-C)
                $sheet->mergeCells('A4:C4');
                $sheet->setCellValue('A4', 'TOTAL PEMASUKAN');
                $sheet->mergeCells('A5:C5');
                $sheet->setCellValue('A5', 'Rp ' . number_format($totalMasuk, 0, ',', '.'));
                
                $sheet->getStyle('A4:C4')->applyFromArray([
                    'font' => ['bold' => true, 'size' => 10],
                    'fill' => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['argb' => 'FFE8F5E9']],
                    'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER]
                ]);
                
                $sheet->getStyle('A5:C5')->applyFromArray([
                    'font' => ['bold' => true, 'size' => 14, 'color' => ['argb' => 'FF27AE60']],
                    'fill' => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['argb' => 'FFF1F8F4']],
                    'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER]
                ]);

                // Box Ringkasan - Kolom Tengah (D-F)
                $sheet->mergeCells('D4:F4');
                $sheet->setCellValue('D4', 'TOTAL PENGELUARAN STOK');
                $sheet->mergeCells('D5:F5');
                $sheet->setCellValue('D5', 'Rp ' . number_format($totalKeluar, 0, ',', '.'));
                
                $sheet->getStyle('D4:F4')->applyFromArray([
                    'font' => ['bold' => true, 'size' => 10],
                    'fill' => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['argb' => 'FFFEF5E7']],
                    'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER]
                ]);
                
                $sheet->getStyle('D5:F5')->applyFromArray([
                    'font' => ['bold' => true, 'size' => 14, 'color' => ['argb' => 'FFF39C12']],
                    'fill' => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['argb' => 'FFFEF9F0']],
                    'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER]
                ]);

                // Box Ringkasan - Kolom Kanan (G-J)
                $sheet->mergeCells('G4:J4');
                $sheet->setCellValue('G4', 'ESTIMASI PROFIT');
                $sheet->mergeCells('G5:J5');
                $sheet->setCellValue('G5', 'Rp ' . number_format($estimasiProfit, 0, ',', '.'));
                
                $sheet->getStyle('G4:J4')->applyFromArray([
                    'font' => ['bold' => true, 'size' => 10],
                    'fill' => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['argb' => 'FFE3F2FD']],
                    'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER]
                ]);
                
                $sheet->getStyle('G5:J5')->applyFromArray([
                    'font' => ['bold' => true, 'size' => 14, 'color' => ['argb' => 'FF2980B9']],
                    'fill' => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['argb' => 'FFF4F9FD']],
                    'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER]
                ]);

                // Border untuk semua box ringkasan
                $sheet->getStyle('A4:C5')->getBorders()->getOutline()->setBorderStyle(Border::BORDER_MEDIUM);
                $sheet->getStyle('D4:F5')->getBorders()->getOutline()->setBorderStyle(Border::BORDER_MEDIUM);
                $sheet->getStyle('G4:J5')->getBorders()->getOutline()->setBorderStyle(Border::BORDER_MEDIUM);

                $sheet->getRowDimension('4')->setRowHeight(20);
                $sheet->getRowDimension('5')->setRowHeight(30);

                // Baris 6-7: Spacing
                $sheet->getRowDimension('6')->setRowHeight(5);
                $sheet->getRowDimension('7')->setRowHeight(5);

                // ==========================================
                // C. TABEL TRANSAKSI UTAMA (MULAI BARIS 9)
                // ==========================================
                
                $lastRowData = $sheet->getHighestRow();
                $headerRange = 'A9:J9';
                
                // Style Header Tabel
                $sheet->getStyle($headerRange)->applyFromArray([
                    'font' => [
                        'bold' => true,
                        'size' => 11,
                        'color' => ['argb' => 'FFFFFFFF']
                    ],
                    'fill' => [
                        'fillType' => Fill::FILL_SOLID,
                        'startColor' => ['argb' => 'FF3498DB'] // Biru
                    ],
                    'alignment' => [
                        'horizontal' => Alignment::HORIZONTAL_CENTER,
                        'vertical' => Alignment::VERTICAL_CENTER
                    ],
                    'borders' => [
                        'allBorders' => ['borderStyle' => Border::BORDER_THIN]
                    ]
                ]);
                $sheet->getRowDimension('9')->setRowHeight(25);

                // Style Body Tabel (Baris Data)
                $tableRange = 'A9:J' . $lastRowData;
                $sheet->getStyle($tableRange)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
                
                // Format Rupiah untuk kolom angka
                $sheet->getStyle('F10:I' . $lastRowData)->getNumberFormat()->setFormatCode('#,##0');
                $sheet->getStyle('F10:I' . $lastRowData)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);
                
                // Alignment untuk kolom tertentu
                $sheet->getStyle('A10:A' . $lastRowData)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
                $sheet->getStyle('B10:B' . $lastRowData)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
                $sheet->getStyle('C10:C' . $lastRowData)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
                $sheet->getStyle('E10:E' . $lastRowData)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
                $sheet->getStyle('J10:J' . $lastRowData)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);

                // Wrap text untuk kolom detail barang
                $sheet->getStyle('D10:D' . $lastRowData)->getAlignment()->setWrapText(true);

                // Zebra Striping (Baris Ganjil-Genap berbeda warna)
                for ($row = 10; $row <= $lastRowData; $row++) {
                    if (($row - 10) % 2 == 0) {
                        $sheet->getStyle('A' . $row . ':J' . $row)->getFill()
                            ->setFillType(Fill::FILL_SOLID)
                            ->getStartColor()->setARGB('FFF8F9FA');
                    }
                }

                // Lebar Kolom Manual (Lebih presisi)
                $sheet->getColumnDimension('A')->setWidth(17);  // Tanggal
                $sheet->getColumnDimension('B')->setWidth(18);  // Kode Transaksi
                $sheet->getColumnDimension('C')->setWidth(12);  // Tipe
                $sheet->getColumnDimension('D')->setWidth(45);  // Detail Barang
                $sheet->getColumnDimension('E')->setWidth(18);  // Mekanik
                $sheet->getColumnDimension('F')->setWidth(15);  // Jasa
                $sheet->getColumnDimension('G')->setWidth(17);  // Total
                $sheet->getColumnDimension('H')->setWidth(17);  // Modal
                $sheet->getColumnDimension('I')->setWidth(17);  // Profit
                $sheet->getColumnDimension('J')->setWidth(12);  // Kasir

                // ==========================================
                // D. TABEL REKAP MEKANIK (BAWAH)
                // ==========================================
                
                $startRowMekanik = $lastRowData + 3;

                // Judul Tabel Mekanik
                $sheet->mergeCells('E' . $startRowMekanik . ':G' . $startRowMekanik);
                $sheet->setCellValue('E' . $startRowMekanik, 'REKAP PENGHASILAN PER MEKANIK');
                $sheet->getStyle('E' . $startRowMekanik . ':G' . $startRowMekanik)->applyFromArray([
                    'font' => [
                        'bold' => true,
                        'size' => 12,
                        'color' => ['argb' => 'FFFFFFFF']
                    ],
                    'fill' => [
                        'fillType' => Fill::FILL_SOLID,
                        'startColor' => ['argb' => 'FF8E44AD'] // Ungu
                    ],
                    'alignment' => [
                        'horizontal' => Alignment::HORIZONTAL_CENTER,
                        'vertical' => Alignment::VERTICAL_CENTER
                    ]
                ]);
                $sheet->getRowDimension($startRowMekanik)->setRowHeight(25);

                // Header Tabel Mekanik
                $headerRowMekanik = $startRowMekanik + 1;
                $sheet->setCellValue('E' . $headerRowMekanik, 'NAMA MEKANIK');
                $sheet->setCellValue('F' . $headerRowMekanik, 'JML SERVIS');
                $sheet->setCellValue('G' . $headerRowMekanik, 'TOTAL JASA (Rp)');

                $rangeHeaderMekanik = 'E' . $headerRowMekanik . ':G' . $headerRowMekanik;
                $sheet->getStyle($rangeHeaderMekanik)->applyFromArray([
                    'font' => [
                        'bold' => true,
                        'size' => 10,
                        'color' => ['argb' => 'FFFFFFFF']
                    ],
                    'fill' => [
                        'fillType' => Fill::FILL_SOLID,
                        'startColor' => ['argb' => 'FF9B59B6'] // Ungu lebih terang
                    ],
                    'alignment' => [
                        'horizontal' => Alignment::HORIZONTAL_CENTER,
                        'vertical' => Alignment::VERTICAL_CENTER
                    ]
                ]);

                // Hitung Data Per Mekanik
                $dataMekanik = $penjualan->where('biaya_jasa', '>', 0)->whereNotNull('mekanik')->groupBy('mekanik');

                $currentRow = $headerRowMekanik + 1;
                $grandTotalJasaMekanik = 0;
                $grandTotalServis = 0;

                foreach ($dataMekanik as $nama => $trxs) {
                    if(empty($nama) || $nama == '-') continue;

                    $totalPerMekanik = $trxs->sum('biaya_jasa');
                    $jumlahServis = $trxs->count();
                    $grandTotalJasaMekanik += $totalPerMekanik;
                    $grandTotalServis += $jumlahServis;

                    $sheet->setCellValue('E' . $currentRow, $nama);
                    $sheet->setCellValue('F' . $currentRow, $jumlahServis);
                    $sheet->setCellValue('G' . $currentRow, $totalPerMekanik);
                    
                    // Zebra striping untuk tabel mekanik juga
                    if (($currentRow - $headerRowMekanik - 1) % 2 == 0) {
                        $sheet->getStyle('E' . $currentRow . ':G' . $currentRow)->getFill()
                            ->setFillType(Fill::FILL_SOLID)
                            ->getStartColor()->setARGB('FFF8F9FA');
                    }
                    
                    $currentRow++;
                }

                // Total Bawah Tabel Mekanik
                $sheet->setCellValue('E' . $currentRow, 'TOTAL');
                $sheet->setCellValue('F' . $currentRow, $grandTotalServis . ' Unit');
                $sheet->setCellValue('G' . $currentRow, $grandTotalJasaMekanik);
                
                $sheet->getStyle('E' . $currentRow . ':G' . $currentRow)->applyFromArray([
                    'font' => [
                        'bold' => true,
                        'size' => 11,
                        'color' => ['argb' => 'FFFFFFFF']
                    ],
                    'fill' => [
                        'fillType' => Fill::FILL_SOLID,
                        'startColor' => ['argb' => 'FF8E44AD']
                    ],
                    'alignment' => [
                        'horizontal' => Alignment::HORIZONTAL_CENTER
                    ]
                ]);

                // Border Tabel Mekanik
                $tableRangeMekanik = 'E' . $startRowMekanik . ':G' . $currentRow;
                $sheet->getStyle($tableRangeMekanik)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
                $sheet->getStyle('E' . $startRowMekanik . ':G' . $currentRow)->getBorders()->getOutline()->setBorderStyle(Border::BORDER_MEDIUM);
                
                // Format Angka
                $sheet->getStyle('G' . ($headerRowMekanik + 1) . ':G' . $currentRow)->getNumberFormat()->setFormatCode('#,##0');
                $sheet->getStyle('G' . ($headerRowMekanik + 1) . ':G' . $currentRow)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);
                
                // Rata Tengah
                $sheet->getStyle('F' . ($headerRowMekanik + 1) . ':F' . ($currentRow - 1))->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);

                // ==========================================
                // E. FOOTER LAPORAN
                // ==========================================
                
                $footerRow = $currentRow + 3;
                $sheet->mergeCells('A' . $footerRow . ':J' . $footerRow);
                $sheet->setCellValue('A' . $footerRow, 'Dicetak pada: ' . date('d F Y, H:i:s') . ' WIB');
                $sheet->getStyle('A' . $footerRow)->applyFromArray([
                    'font' => [
                        'italic' => true,
                        'size' => 9,
                        'color' => ['argb' => 'FF7F8C8D']
                    ],
                    'alignment' => [
                        'horizontal' => Alignment::HORIZONTAL_CENTER
                    ]
                ]);

            },
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [];
    }
}