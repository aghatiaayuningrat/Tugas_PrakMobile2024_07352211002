enum StatusMahasiswa { aktif, cuti, lulus }

mixin Kehadiran {
  void hadir() => print("Mahasiswa hadir di kelas.");
}

abstract class PenggunaUniversitas {
  void tampilkanIdentitas();
}

class Mahasiswa extends PenggunaUniversitas with Kehadiran {
  String nama;
  String npm;
  String jurusan;
  StatusMahasiswa status;

  Mahasiswa(this.nama, this.npm,
      {required this.jurusan, this.status = StatusMahasiswa.aktif});

  void belajar() => print("$nama sedang belajar.");

  @override
  void tampilkanIdentitas() {
    print("Nama: $nama, NPM: $npm, Jurusan: $jurusan");
  }

  // Getter dan Setter untuk NPM
  String get getNpm => npm;
  set setNpm(String npmBaru) {
    npm = npmBaru;
  }
}

class AsistenDosen extends Mahasiswa {
  String mataKuliah;

  AsistenDosen(String nama, String npm, this.mataKuliah,
      {required String jurusan})
      : super(nama, npm, jurusan: jurusan);

  void asistensi() => print("$nama mengasistensi mata kuliah $mataKuliah.");
}

void main() {
  Mahasiswa mahasiswa = Mahasiswa("Aghatia Ayu Ningrat", "07352211002",
      jurusan: "Teknik Informatika");
  mahasiswa.tampilkanIdentitas();
  mahasiswa.belajar();
  mahasiswa.hadir();

  AsistenDosen asistenDosen = AsistenDosen(
      "Ardi Salman", "07352211021", "Progstur",
      jurusan: "Teknik Informatika");
  asistenDosen.tampilkanIdentitas();
  asistenDosen.asistensi();
}
