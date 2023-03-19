

void main(List<String> args) async {
  // States that starting day is Sunday:
    // - Kelantan
    // - Terengganu
    // - Johor
    // - Kedah

    // Campus code:
    // A - UiTM Kampus Seri Iskandar
    // A2 - UiTM Kampus Kota Ipoh
    // A3 - UiTM Kampus Teluk Intan
    // A4 - UiTM Kampus Tapah
    // B - UiTM Kampus Shah Alam
    // APB - SELANGOR CAMPUS - LANGUAGE COURSES
    // CITU - SELANGOR CAMPUS - CITU COURSES
    // HEP - SELANGOR CAMPUS - CO-CURRICULUM COURSES
    // B10 - UiTM Kampus Dengkil
    // B2 - UiTM Kampus Kuala Selangor
    // B3 - UiTM Kampus INTEC
    // B4 - UiTM Kampus Putra Jaya
    // B5 - UiTM Kampus Golden Hope
    // B6 - UiTM Kampus Hospital Sungai Buloh
    // B7 - UiTM Kampus Selayang
    // B8 - UiTM Kampus Puncak Alam
    // B9 - UiTM Kampus Puncak Perdana
    // C - UiTM Kampus Jengka
    // C2 - UiTM Kampus Kuantan
    // C3 - UiTM Kampus Raub
    // C4 - UiTM Kampus Bukit Sekilau
    // D - UiTM Kampus Machang
    // D2 - UiTM Kampus Kota Bharu
    // FAA - Kolej Poly-Tech MARA Bangi
    // FAB - KOLEJ WIDAD
    // FAC - Kolej Poly-Tech MARA Kota Bharu
    // FD - KOLEJ UNIKOP
    // FEW - EAST WEST INTERNATIONAL COLLEGE
    // FL - INS. PROFESIONAL BAITULMAL KUALA LUMPUR
    // FM - KOLEJ ANTARABANGSA UNIFIELD
    // FMA - MELAKA INTER. COLLEGE OF SCIENCE & TECH
    // FN - KOLEJ UNITI
    // FQ - KOLEJ SATT
    // J - UiTM Kampus Segamat
    // J2 - UiTM Kampus Johor Bahru
    // J4 - UiTM Kampus Pasir Gudang
    // K - UiTM Kampus Merbok
    // K2 - UiTM Kampus Alor Setar
    // M - UiTM Kampus Alor Gajah
    // M1 - UiTM Kampus Bandaraya Melaka
    // M2 - UiTM Kampus PERZIM
    // M3 - UiTM Kampus Jasin
    // N - UiTM Kampus Kuala Pilah
    // N2 - UiTM Kampus Seremban
    // N3 - UiTM Kampus Kuala Pilah (Beting)
    // N4 - UiTM Kampus Seremban 3
    // N5 - UITM Kampus Rembau
    // P - UiTM Kampus Bukit Mertajam
    // P2 - UiTM Kampus Bertam
    // P3 - UiTM Kampus Balik Pulau
    // P4 - UiTM Kampus Permatang Pauh
    // Q - UiTM Kampus Kota Samarahan
    // Q2 - UiTM Kampus Kuching
    // Q3 - UiTM Kampus Mukah
    // Q4 - UiTM Kampus Miri
    // Q5 - UiTM Kampus Kota Samarahan 2
    // Q6 - UiTM Kampus Mukah 2
    // R - UiTM Kampus Arau
    // S - UiTM Kampus Kota Kinabalu
    // S2 - UiTM Kampus Tawau
    // T - UiTM Kampus Dungun
    // T2 - UiTM Kampus Marang
    // T3 - UiTM Kampus Kuala Terengganu
    // T4 - UiTM Kampus Bukit Besi
    // T5 - UiTM Kampus Kuala Terengganu (Cendering)

    // Campus code involved:
    // D, K, J, T
    
    // Other campus besides UiTM are KIVed

    final campus = "K2";
    final trimmed = campus.substring(0,1);

    if(trimmed == "D" || trimmed == "K" || trimmed == "J" || trimmed == "T") {
      print("Sunday");
    } else {
      print ("Monday");
    }

   
}