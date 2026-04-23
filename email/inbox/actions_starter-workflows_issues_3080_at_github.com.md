MIME-Version: 1.0
From: Kakayu3 <notifications@github.com>
To: actions/starter-workflows <starter-workflows@noreply.github.com>
Date: Fri, 03 Oct 2025 23:29:14 -0700
Subject: [actions/starter-workflows] pip install folium (Issue #3080)
Message-ID: <actions/starter-workflows/issues/3080@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68e0beba41e98_18d8c10d81027f9"; charset="UTF-8"

Kakayu3 created an issue (actions/starter-workflows#3080)

import folium
import timeDuplicate of #3079 

import datetime

# --- 1. Fungsi untuk Mencatat Lokasi (Sama seperti sebelumnya) ---

def catat_lokasi(lintang, bujur):
    """Membuat objek lokasi (dictionary)."""
    waktu_saat_ini = datetime.datetime.now().strftime("%H:%M:%S")
    return {
        "waktu": waktu_saat_ini,
        "lintang": lintang,
        "bujur": bujur
    }

# --- 2. Pembuatan Data Simulasi ---

riwayat_pergerakan = []

# Lokasi 1: Jakarta
lokasi_1 = catat_lokasi(-6.200000, 106.816666)
riwayat_pergerakan.append(lokasi_1)

time.sleep(1)

# Lokasi 2: Bogor
lokasi_2 = catat_lokasi(-6.597722, 106.806892)
riwayat_pergerakan.append(lokasi_2)

# --- 3. Memvisualisasikan Data ke Peta dengan Folium ---

# Tentukan koordinat pusat peta (kita ambil lokasi terbaru)
pusat_peta = [lokasi_2['lintang'], lokasi_2['bujur']]

# Buat objek peta
# zoom_start: level zoom (semakin besar angkanya, semakin dekat)
m = folium.Map(location=pusat_peta, zoom_start=10) 

# Tambahkan setiap lokasi sebagai penanda (marker) pada peta
for i, lokasi in enumerate(riwayat_pergerakan):
    # Teks yang muncul saat pin diklik
    popup_text = f"Lokasi {i+1}<br>Waktu: {lokasi['waktu']}"
    
    # Tambahkan marker pada peta
    folium.Marker(
        location=[lokasi['lintang'], lokasi['bujur']],
        popup=popup_text,
        tooltip=f"Titik {i+1}",
        # Gunakan ikon pin merah untuk lokasi terakhir
        icon=folium.Icon(color='red', icon='info-sign') if i == len(riwayat_pergerakan) - 1 else None
    ).add_to(m)

# Simpan peta interaktif ke file HTML
file_html = "simulasi_pelacakan_map.html"
m.save(file_html)

print("\n---------------------------------------------------")
print("✅ Selesai! Peta telah dibuat.")
print(f"Silakan buka file '{file_html}' di browser web Anda.")
print("Anda akan melihat peta interaktif dengan pin di lokasi Jakarta dan Bogor.")
print("---------------------------------------------------")

-- 
Reply to this email directly or view it on GitHub:
https://github.com/actions/starter-workflows/issues/3080
You are receiving this because you are subscribed to this thread.

Message ID: <actions/starter-workflows/issues/3080@github.com>