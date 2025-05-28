import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/iphones.dart';

class DetailPage extends StatelessWidget {
  final Iphone iphone;

  const DetailPage({super.key, required this.iphone});

  @override
  Widget build(BuildContext context) {
    return ProductDetailPage(iphone: iphone);
  }
}

class ProductDetailPage extends StatefulWidget {
  final Iphone iphone;

  const ProductDetailPage({super.key, required this.iphone});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final price = widget.iphone.storagePrices.values.first;
    final formattedPrice = 'Rp ${NumberFormat('#,###', 'id_ID').format(price)}';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: 16,
                right: 16,
                bottom: 10,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // kembali ke halaman sebelumnya
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Fitur pesan akan segera hadir!'),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.message,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Product Images
            Container(
              height: 300,
              child: PageView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Image.network(
                        widget.iphone.imageUrl,
                        height: 250,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.phone_iphone,
                                size: 80,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'iPhone 15 128GB\n256GB 512GB',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildColorCircle(Colors.black),
                                  _buildColorCircle(Colors.white),
                                  _buildColorCircle(Colors.blue[100]!),
                                  _buildColorCircle(Colors.yellow[100]!),
                                  _buildColorCircle(Colors.pink[100]!),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formattedPrice,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.iphone.title,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Detail Produk Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detail produk',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),

                  _buildDetailRow('Status Sinyal', 'Sinyal Aktif'),
                  _buildDetailRow('Tahun Rilis', '2023'),
                  _buildDetailRow('Tipe Garansi', 'Garansi Distributor'),
                  _buildDetailRow(
                    'Etalase',
                    'New FS',
                    valueColor: Colors.green,
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Deskripsi produk',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),

                  Text(
                    _isExpanded
                        ? 'Seluruh produk yang kami jual merupakan 100% original, 100% baru, 100% garansi resmi dan kepuasan pelanggan adalah prioritas utama kami.\n\nLink Aksesoris iPhone : https://www.tokopedia.com/studioponsel/etalase/iphone-accessories\n\nReview pelanggan STUDIO PONSEL : https://www.tokopedia.com/studioponsel/review\n\nSekilas info tentang kami:\n1. Brand new - Original - Segel\n2. Garansi resmi dari distributor\n3. Sudah termasuk dus, charger, dan aksesoris standar\n4. Pengiriman aman dengan bubble wrap dan dus tambahan\n5. Tersedia berbagai pilihan warna\n6. Stock selalu ready dan update\n7. Pelayanan customer service 24/7\n8. Proses pengiriman cepat dan terpercaya'
                        : 'Seluruh produk yang kami jual merupakan 100% original, 100% baru, 100% garansi resmi dan kepuasan pelanggan adalah prioritas utama kami.',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 15),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Text(
                      _isExpanded ? 'Baca Lebih Sedikit' : 'Baca Selengkapnya',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Extra space untuk bottom bar
            const SizedBox(height: 100),
          ],
        ),
      ),
      // Bottom App Bar untuk tombol order
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: MediaQuery.of(context).padding.bottom + 12,
        ),
        child: SafeArea(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                final storageList = widget.iphone.storagePrices.keys.toList();
                int counter = 1;
                int selectedColor = 0;
                final result = await showModalBottomSheet<Map<String, int>>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return FractionallySizedBox(
                      heightFactor: 0.70,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: StatefulBuilder(
                            builder: (context, setModalState) {
                              final selectedStorage =
                                  storageList[selectedColor];
                              final price =
                                  widget.iphone.storagePrices[selectedStorage];
                              final formattedPrice =
                                  'Rp ${NumberFormat('#,###', 'id_ID').format(price)}';
                              return WillPopScope(
                                onWillPop: () async {
                                  Navigator.pop(context, {
                                    'counter': counter,
                                    'selectedColor': selectedColor,
                                  });
                                  return false;
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            child: Image.network(
                                              widget.iphone.imageUrl,
                                              width: 256,
                                              height: 256,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Text(
                                            formattedPrice,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    const Text(
                                      'Ukuran Penyimpanan:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: List.generate(
                                        storageList.length,
                                        (index) {
                                          final isSelected =
                                              selectedColor == index;
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              right: 8.0,
                                            ),
                                            child: ChoiceChip(
                                              label: Text(storageList[index]),
                                              selected: isSelected,
                                              onSelected: (_) {
                                                setModalState(() {
                                                  selectedColor = index;
                                                });
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    const Text(
                                      'Durasi Sewa (Hari):',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: counter > 1
                                              ? () => setModalState(
                                                  () => counter--,
                                                )
                                              : null,
                                        ),
                                        Text(
                                          '$counter',
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () =>
                                              setModalState(() => counter++),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, {
                                              'counter': counter,
                                              'selectedColor': selectedColor,
                                            });
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            final confirm = await showDialog<bool>(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text('Konfirmasi'),
                                                content: const Text(
                                                  'Apakah Anda yakin dengan pilihan ini?',
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                          context,
                                                          false,
                                                        ),
                                                    child: const Text('Tidak'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                          context,
                                                          true,
                                                        ),
                                                    child: const Text('Ya'),
                                                  ),
                                                ],
                                              ),
                                            );
                                            if (confirm == true) {
                                              Navigator.pop(context, {
                                                'counter': counter,
                                                'selectedColor': selectedColor,
                                              });
                                            }
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
                if (result != null) {
                  // Handle result
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'ORDER',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorCircle(Color color) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: valueColor ?? Colors.black87,
                fontWeight: valueColor != null
                    ? FontWeight.w500
                    : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
