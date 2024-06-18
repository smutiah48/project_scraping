# project_scraping
Tugas Praktikum UAS MDS

# Project Scraping Weather Data

Tugas Praktikum UAS MDS

<p align="center">
  <img width="900" height="343" src="https://github.com/smutiah48/project_scraping/blob/main/Weather.PNG">
</p>

<div align="center">

# Scraping Weather Data from The Weather Channel

[Tentang](#tentang) 🌍
•
[Deskripsi](#deskripsi) 📝
•
[Tujuan](#tujuan) 🎯
•
[Pentingnya](#pentingnya) ⚡
•
[Requirements](#requirements) ❗
•
[Dokumentasi](#dokumentasi) 📚
•
[Visualisasi](#visualisasi-data) 📊
•
[Developer](#menu-developer) 👩‍💻
</div>

## 🌍 Tentang
  <div align="justify">
The Weather Channel adalah salah satu platform media yang dikenal luas sebagai sumber informasi terkemuka mengenai prakiraan cuaca dan berita terkait cuaca. Platform ini menyediakan berbagai layanan informasi cuaca, termasuk prakiraan jangka pendek dan jangka panjang, kondisi cuaca saat ini, serta berita terkait fenomena cuaca yang sedang terjadi di berbagai belahan dunia termasuk Indonesia.
</div>

## 📝 Deskripsi Data
  <div align="justify">
The Weather Channel menyediakan informasi cuaca untuk banyak negara di seluruh dunia, termasuk tetapi tidak terbatas pada:
- Amerika Serikat: Menyediakan informasi cuaca terperinci untuk setiap negara bagian, termasuk prakiraan harian, suhu, kelembapan, dan kondisi cuaca mendetail seperti hujan, salju, atau badai.
- Eropa: Meliputi negara-negara di Eropa dengan prakiraan cuaca yang disesuaikan untuk setiap negara atau wilayahnya.
- Asia: Informasi cuaca untuk negara-negara Asia, dari Timur Tengah hingga Asia Tenggara, yang mencakup prakiraan suhu, kelembapan, dan kondisi cuaca lainnya.
- Amerika Selatan: Prakiraan cuaca untuk negara-negara di Amerika Selatan, yang memperhitungkan variabilitas iklim di kawasan ini.
- Afrika: Informasi cuaca untuk negara-negara di Afrika, dengan memperhatikan kondisi iklim yang bervariasi dari wilayah gurun hingga daerah hutan hujan.
- Oseania: Meliputi negara-negara di Australia, Selandia Baru, dan kepulauan lain di Samudra Pasifik, dengan memperhitungkan cuaca laut dan fenomena iklim lainnya.
</div>

## 🎯 Tujuan
  <div align="justify">
Scraping data cuaca dari The Weather Channel bertujuan untuk:
- Memungkinkan pengguna untuk mengakses prakiraan cuaca yang akurat dari berbagai wilayah.
- Mendukung aplikasi dan layanan yang memerlukan data cuaca real-time.
- Memberikan informasi penting untuk kegiatan sehari-hari, perencanaan perjalanan, dan manajemen risiko.
</div>

## ⚡ Pentingnya
  <div align="justify">
Scraping data cuaca dari The Weather Channel penting karena:
- Memberikan akses terhadap informasi cuaca yang dapat diandalkan dan aktual.
- Mendukung pengambilan keputusan yang tepat dalam perencanaan aktivitas luar ruangan, perjalanan, dan bisnis.
- Menyediakan data penting untuk aplikasi dan layanan yang bergantung pada informasi cuaca, seperti aplikasi perjalanan, pertanian, dan industri penerbangan.
</div>

## ❗ Requirements
  <div align="justify">
Proyek ini menggunakan teknologi dan alat sebagai berikut:
- **Bahasa Pemrograman**: R
- **Database**: MongoDB Atlas
- **Tool Visualisasi Database**: MongoDB Compass
- **Jadwal Scraping**: Setiap jam sekali
</div>

### Detail Requirements:
  <div align="justify">
1. **Bahasa Pemrograman R**: Digunakan untuk melakukan scraping data cuaca dari The Weather Channel.
2. **MongoDB Atlas**: Digunakan sebagai database cloud untuk menyimpan data cuaca yang telah di-scrape.
3. **MongoDB Compass**: Digunakan untuk visualisasi dan manajemen data yang tersimpan di MongoDB Atlas.
4. **Jadwal Scraping**: Proses scraping diatur untuk menjalankan scraping data cuaca dari The Weather Channel setiap jam sekali untuk memastikan data tetap terkini.
</div>

## 📚 Dokumentasi

  <div align="justify">
Berikut adalah contoh data cuaca yang telah di-scrape dan disimpan ke dalam MongoDB Atlas:

```json
{
  "_id": {
    "$oid": "666d824c15502fada40a86b1"
  },
  "Location": "Kota Bogor Jawa Barat",
  "Day": "Sabtu 15 Juni",
  "Time": "Per 18.55 WIB",
  "Temperature": "27°",
  "Weather": "Sedikit Hujan Curah",
  "Description": "Hujan berhenti pukul 8 pm. Lebih banyak badai mungkin terjadi nanti.",
  "Humidity": "31°",
  "Wind": "T 6 km/j"
}
```
### 📊 Visualisasi Data
Untuk visualisasi data cuaca yang telah diambil dari The Weather Channel, Anda dapat mengakses informasi lebih lanjut melalui:

- [Rpubs - Analisis Cuaca](https://example.com/link_rpubs)
- [Presentasi PowerPoint - Analisis Cuaca](https://example.com/link_ppt)

## 👨‍💻 Developer

<div style="float: right; margin-left: 20px; margin-bottom: 20px;">
  <img src="https://github.com/smutiah48/Project_MDS6/blob/main/scr/Mutiah.JPG" alt="Siti Mutiah" style="border-radius: 50%; border: 2px solid white; margin-left: 5cm;" width="175" height="200">
</div>

[Siti Mutiah-G1501231027]<br>
Statistika dan Sains Data
