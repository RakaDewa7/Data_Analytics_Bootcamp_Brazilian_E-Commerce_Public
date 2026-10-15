# Brazilian E-Commerce Public Dataset Analysis & Data Preparation

## Ringkasan
Melakukan eksplorasi data komprehensif, pengecekan *missing value*, analisis duplikasi, deteksi *outlier*, hingga analisis perilaku belanja konsumen menggunakan **SQL** pada dataset publik e-commerce Brasil (Olist). Proyek ini bertujuan untuk mengidentifikasi pola pembelian kategori produk, preferensi metode pembayaran, serta merumuskan strategi pemasaran berbasis data.

## Problem Statement
Menganalisis data transaksi e-commerce berskala besar memerlukan ketelitian tinggi karena sering kali mengandung anomali, nilai kosong (*missing value*), atau *outlier* pada berbagai tabel relasional (pelanggan, pesanan, item, pembayaran, dan produk). Tanpa persiapan data yang matang, analisis perilaku konsumen dan pemilihan strategi promosi bisa menjadi tidak akurat dan merugikan bisnis.

## Data Exploration & Schema (5 Tabel Utama)
Dataset bersumber dari Kaggle (*Olist Brazilian E-Commerce*) yang terdiri dari 5 tabel relasional utama:
1. **`olist_customers_dataset`** (99.441 baris × 5 kolom)[cite: 62]: Informasi demografi dan lokasi pelanggan (*customer_id*, *customer_unique_id*, *zip_code*, *city*, *state*)[cite: 61, 62].
2. **`olist_order_items_dataset`** (112.650 baris × 7 kolom)[cite: 64]: Data barang yang dibeli dalam pesanan, harga (*price*), dan nilai angkut (*freight_value*)[cite: 63, 64].
3. **`olist_order_payments_dataset`** (103.886 baris × 5 kolom)[cite: 66]: Data opsi pembayaran, angsuran (*installments*), dan nilai transaksi (*payment_value*)[cite: 65, 66].
4. **`olist_orders_dataset`** (99.441 baris × 8 kolom)[cite: 68]: Tabel inti status pesanan dan stempel waktu pembelian hingga pengiriman (*order_purchase_timestamp*, *order_status*)[cite: 67, 68].
5. **`olist_products_dataset`** (32.951 baris × 8 kolom)[cite: 70]: Informasi atribut produk, kategori, ukuran, berat, dan jumlah foto[cite: 69, 70].

## Data Preparation & Cleaning (SQL Queries)
- **Missing Value Checking:** Menggunakan fungsi `COUNT(*) FILTER (WHERE ... IS NULL)` di SQL. Hasilnya:
  - Tabel *Customers*, *Order Items*, *Payments*, dan *Orders* **tidak memiliki missing value (0)**[cite: 71, 72, 73, 74].
  - Tabel *Products* memiliki beberapa nilai kosong, seperti *product_name_lenght*, *description_lenght*, dan *photos_qty* sebanyak 610 baris, serta atribut berat/dimensi sebanyak 2 baris[cite: 75].
- **Duplikasi:** Pengujian duplikasi menggunakan perbandingan tabel utuh dan data unik (`DISTINCT`) menunjukkan **tidak ada duplikasi (0%)** di seluruh tabel[cite: 76, 77].
- **Analisis Outlier:** Menggunakan metode kuartil dan IQR di SQL mendeteksi adanya *outlier* pada:
  - Kode pos pelanggan (*customer_zip_code_prefix*)[cite: 78, 79].
  - Harga barang (*price*) dan nilai pengiriman (*freight_value*) pada *order_items*[cite: 80].
  - Nilai pembayaran transaksi (*payment_value*) pada *order_payments*[cite: 81].
  - Panjang nama produk (*product_name_lenght*) pada *products*[cite: 82].

## Visualization & Analysis Output
- **Total Order & Price Items:** Tercatat total 98.666 pesanan dengan total nilai harga mencapai 13.595.203 (rata-rata *price* 120,65) dan total biaya pengiriman (*freight*) sebesar 2.251.971,2 (rata-rata 19,99)[cite: 83].
- **Price per Category:** Kategori **`cama_mesa_banho`** (Bed, Bath & Table) menjadi produk yang paling banyak dibeli sebanyak 11.115 transaksi dengan total penjualan 204.691,84, disusul oleh **`beleza_saude`** (Health & Beauty) sebanyak 9.670 transaksi[cite: 84].
- **Payment Method Preference:** Metode pembayaran **`credit_card`** mendominasi secara mutlak dengan 76.795 transaksi dan total nilai pembayaran mencapai 12.542.106, diikuti oleh **`boleto`** (19.784 transaksi)[cite: 85].

## Conclusion
- Pelanggan yang membeli produk kategori unggulan seperti *cama_mesa_banho* dan *beleza_saude* memiliki volume transaksi yang besar dan mayoritas menggunakan kartu kredit (*credit_card*)[cite: 86].
- Keamanan data dan konsistensi tabel yang bersih dari duplikasi serta minimnya *missing value* memastikan keandalan analisis bisnis e-commerce ini.

## Recommendation
- Perusahaan dapat menargetkan kampanye iklan atau promosi spesifik kepada pengguna kartu kredit untuk produk-produk bernilai tinggi atau premium[cite: 86].
- Mengimplementasikan strategi pemberian *voucher* belanja khusus bagi pelanggan setia yang menggunakan kartu kredit guna mendongkrak volume penjualan lebih lanjut, serta melakukan evaluasi berkala terhadap performa transaksinya[cite: 86].

## Tools yang Digunakan
PostgreSQL / SQL · Data Preparation · Data Cleaning (Missing Value & Outlier Analysis) · Relational Database Management

---
*Bagian dari Portofolio Graphic Design & Data Analytics Career Accelerator — Tempat Belajar (2026)*  
*Disusun oleh: Raka Dewa Dipa Mahesa Arsandy*
