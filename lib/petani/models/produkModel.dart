class produkModel {
  final String id;
  final String penjual_id, nama, satuan, jenis, deskripsi, harga, stok;
  // final int harga, stok;
  final Function press;
  produkModel(
    this.id,
    this.penjual_id,
    this.nama,
    this.satuan,
    this.jenis,
    this.deskripsi,
    this.harga,
    this.stok,
    this.press,
  );
}
