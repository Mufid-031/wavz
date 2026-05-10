# design_reference.md — WAVZ Music App
> File ini adalah referensi visual lengkap untuk Gemini CLI.
> Baca file ini setiap kali akan membuat atau memodifikasi UI component / screen apapun.
> Letakkan di: `wavz/design/design_reference.md`

---

## 🎨 Design Tokens

### Color Palette

#### Background Hierarchy
| Token | Hex | Penggunaan |
|---|---|---|
| `background` | `#0A0A0F` | Background utama semua screen |
| `surface` | `#13131A` | Card, bottom sheet, modal |
| `surfaceElevated` | `#1C1C26` | Card terangkat, dropdown |
| `surfaceHighest` | `#252532` | Chip, badge, input field |
| `divider` | `#1F1F2E` | Garis pemisah, border tipis |

#### Brand Colors & Gradients
| Token | Nilai | Penggunaan |
|---|---|---|
| `primaryStart` | `#7C3AED` | Awal gradient (Electric Purple) |
| `primaryEnd` | `#06B6D4` | Akhir gradient (Neon Cyan) |
| `accentPink` | `#EC4899` | Liked/heart icon, highlight |
| `accentOrange` | `#F97316` | Badge "New", notifikasi warm |

**Primary Gradient:**
```
LinearGradient(
  colors: [#7C3AED, #06B6D4],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
)
```

**Secondary Gradients (per genre tile):**
- Hip-Hop: `#1A0533` → `#6D28D9`
- Electronic: `#001A2E` → `#0EA5E9`
- Jazz: `#1A0A00` → `#B45309`
- Pop: `#1A0020` → `#A21CAF`
- R&B: `#001A10` → `#059669`
- Rock: `#1A0000` → `#DC2626`
- Classical: `#0A0A1A` → `#4338CA`
- Latin: `#1A1000` → `#D97706`

#### Text Colors
| Token | Hex | Penggunaan |
|---|---|---|
| `textPrimary` | `#FFFFFF` | Judul, body utama |
| `textSecondary` | `#AAAAAA` | Subtitle, metadata |
| `textMuted` | `#666680` | Placeholder, disabled |
| `textOnGradient` | `#FFFFFF` | Teks di atas gradient |

#### Status Colors
| Token | Hex | Penggunaan |
|---|---|---|
| `success` | `#22C55E` | Downloaded, online |
| `warning` | `#F59E0B` | Peringatan, low storage |
| `error` | `#EF4444` | Error, hapus |
| `info` | `#3B82F6` | Info, link |
| `liked` | `#EC4899` | Lagu yang di-like |

---

### Typography

#### Font Families
| Font | File | Penggunaan |
|---|---|---|
| **Clash Display** | `ClashDisplay-Bold.otf` | Semua heading, judul screen, nama lagu di Now Playing |
| **Clash Display** | `ClashDisplay-Semibold.otf` | Subheading, section title |
| **Satoshi** | `Satoshi-Regular.otf` | Body text, metadata, deskripsi |
| **Satoshi** | `Satoshi-Medium.otf` | Label, button text kecil |
| **Satoshi** | `Satoshi-Bold.otf` | Emphasis body text |

#### Type Scale
| Style | Font | Size | Weight | Letter Spacing | Penggunaan |
|---|---|---|---|---|---|
| `displayXL` | Clash Display | 40px | 700 | -1.5 | Judul Now Playing (nama lagu besar) |
| `displayLG` | Clash Display | 32px | 700 | -1.0 | Judul halaman splash/onboarding |
| `displayMD` | Clash Display | 24px | 600 | -0.5 | Section hero, featured card title |
| `headingLG` | Clash Display | 20px | 600 | 0 | Nama playlist/album di detail screen |
| `headingMD` | Clash Display | 18px | 600 | 0 | Section header (Trending Now, dll) |
| `headingSM` | Clash Display | 16px | 600 | 0 | Card title, settings section |
| `bodyLG` | Satoshi | 16px | 400 | 0 | Deskripsi utama |
| `bodyMD` | Satoshi | 14px | 400 | 0 | Metadata (artist, album, durasi) |
| `bodySM` | Satoshi | 12px | 400 | 0 | Caption, secondary info |
| `labelLG` | Satoshi | 14px | 500 | 0.3 | Button, tab label |
| `labelSM` | Satoshi | 12px | 500 | 0.2 | Badge, chip, tag |
| `button` | Clash Display | 15px | 600 | 0.3 | CTA button text |

---

### Spacing System (8px Grid)

```
xs  = 4px   → icon padding internal, gap antar badge
sm  = 8px   → padding kecil dalam card, gap icon-text
md  = 12px  → padding card compact, gap antar item list
lg  = 16px  → padding card standard, section gap
xl  = 20px  → screen horizontal padding
xl2 = 24px  → gap antar card besar
xl3 = 32px  → section gap vertikal
xl4 = 40px  → padding hero area
xl5 = 48px  → bottom navigation height
xl6 = 64px  → top of screen to first content
```

### Border Radius
```
radiusSM  = 8px   → chip, badge, small button, input
radiusMD  = 12px  → card compact, song tile
radiusLG  = 16px  → card standard, bottom sheet
radiusXL  = 20px  → featured card, modal
radiusXXL = 24px  → large card, genre tile
radiusFull = 999px → pill button, avatar, tag
```

### Elevation & Shadow
```dart
// Tidak menggunakan box-shadow klasik.
// Gunakan kombinasi border + blur untuk glass effect.

// Card border (default)
Border.all(color: Color(0xFF1F1F2E), width: 0.5)

// Glass card border
Border.all(color: Colors.white.withOpacity(0.08), width: 0.5)

// Album art glow (di Now Playing)
BoxShadow(
  color: dominantColor.withOpacity(0.6),
  blurRadius: 60,
  spreadRadius: -10,
)
```

---

## 📱 Screen-by-Screen Design Specs

### 1. Splash Screen
- **Background:** Solid `#0A0A0F`
- **Logo:** Centered, "WAVZ" dalam Clash Display Bold 48px, gradient text (`#7C3AED` → `#06B6D4`)
- **Tagline:** "Feel Every Beat" — Satoshi Regular 16px, `#666680`
- **Animation:** Logo fade in + scale dari 0.8 → 1.0 (600ms), tagline fade in delay 400ms
- **Duration:** 2.5 detik lalu navigate ke onboarding/home

---

### 2. Onboarding Screen
- **Background:** `#0A0A0F` dengan subtle noise texture
- **Layout:** Full-screen PageView, 3 slide
- **Ilustrasi:** Centered, 60% lebar layar
- **Progress:** 3 dots di bawah ilustrasi, active dot = gradient, inactive = `#252532`
- **Heading:** Clash Display Bold 28px, white, centered
- **Body:** Satoshi Regular 15px, `#AAAAAA`, centered, max 2 baris
- **CTA Button:** Full-width, gradient background, Clash Display 15px, radius 14px, height 56px
- **Skip button:** Top right, Satoshi Medium 14px, `#666680`

**Slide content:**
1. *Discover* — "Temukan jutaan lagu dari seluruh dunia"
2. *Connect* — "Ikuti artis favoritmu, real-time"
3. *Listen* — "Kualitas audio premium, di mana saja"

---

### 3. Login / Register Screen
- **Background:** `#0A0A0F`
- **Logo small:** Top center, 32px
- **Heading:** "Selamat datang kembali" — Clash Display 28px
- **Input fields:**
  - Background: `#13131A`
  - Border: `0.5px solid #1F1F2E` (default) → `#7C3AED` (focused)
  - Border radius: 12px
  - Height: 56px
  - Label: floating label, Satoshi 12px `#666680`
  - Text: Satoshi 15px white
- **OAuth buttons:**
  - Background: `#13131A`
  - Border: `0.5px solid #1F1F2E`
  - Height: 52px, radius: 12px
  - Icon: 20px, teks Satoshi Medium 14px white
- **CTA:** Full-width gradient button, 56px height
- **Divider:** "atau" dengan garis `#1F1F2E` di kiri kanan
- **Forgot password:** Satoshi 13px, `#7C3AED`, right-aligned

---

### 4. Home Screen
- **AppBar:**
  - Transparent background
  - Greeting: Satoshi 14px `#AAAAAA` + nama user Clash Display 20px white
  - Avatar: 36px circular, top right
  - Notification bell: 24px icon, `#AAAAAA`

- **"Recently Played" Row:**
  - Section title: Clash Display SemiBold 16px white
  - Item: 80×80px album art (radius 10px) + judul 12px + artist 11px `#AAAAAA`
  - Gap antar item: 12px
  - Horizontal scroll, no scrollbar

- **Featured Card ("Top Picks"):**
  - Width: full screen minus 40px padding
  - Height: 180px
  - Background: album art sebagai full background
  - Gradient overlay: `transparent` → `#0A0A0F` (bottom 60%)
  - Badge "TOP PICK" — Satoshi Bold 10px, background gradient, radius full, top-left
  - Judul: Clash Display Bold 22px white, bottom-left
  - Artist: Satoshi 13px `#AAAAAA`, di bawah judul
  - Play button: 40px circle, gradient background, bottom-right

- **"Trending Now" Row:**
  - Item: rank number (Clash Display Bold 32px, `#1F1F2E`) + 64×64px art + judul + artist
  - Rank number di belakang album art (overflow kiri)

- **"New Releases" Grid:**
  - 2 kolom, gap 12px
  - Card: 100% lebar kolom, height 160px
  - Art: full card, gradient overlay bawah
  - Badge "NEW" — top right, merah kecil

- **"Your Daily Mix" Chips:**
  - Horizontal scroll
  - Chip: 80px circle art + label di bawah "Daily Mix 1" dst
  - Radius full pada outer container chip

- **Bottom Navigation:**
  - Height: 72px + safe area
  - Background: `#0A0A0F` dengan border top `0.5px solid #1F1F2E`
  - 4 tab: Home / Search / Library / Profile
  - Active: gradient icon + gradient label text
  - Inactive: `#666680` icon, no label
  - Active indicator: subtle gradient pill behind icon (24×4px)

---

### 5. Now Playing Screen (PALING PENTING)
- **Background:** `#0A0A0F` dengan dynamic color tint dari album art (opacity 0.15)
- **Top bar:**
  - Swipe down indicator: 4×36px pill, `#252532`, centered top
  - "Playing from [Playlist name]": Satoshi 12px `#666680`, centered
  - 3-dot menu: top right

- **Album Art:**
  - Size: 80% lebar layar (square)
  - Border radius: 20px
  - Shadow/Glow: `BoxShadow` dengan `dominantColor.withOpacity(0.6)`, blurRadius 60
  - **PENTING:** Glow warna berubah mengikuti palette dari album art (gunakan `palette_generator`)
  - Animation: scale 0.95 → 1.0 saat ganti lagu

- **Song Info:**
  - Judul: Clash Display Bold 24px white, max 1 baris + overflow ellipsis
  - Artist: Satoshi Regular 16px `#AAAAAA`
  - Row ikon: Heart (liked = `#EC4899`) + Add to playlist + Share — spacing even

- **Progress Bar:**
  - Height: 4px, background `#252532`
  - Fill: gradient `#7C3AED` → `#06B6D4`
  - Thumb: 12px circle, white
  - Waktu: Satoshi 12px `#666680`, kiri dan kanan

- **Player Controls:**
  - Shuffle icon: 24px, aktif = gradient, nonaktif = `#666680`
  - Previous: 32px
  - Play/Pause: 72px circle, gradient background, icon 32px white — **TOMBOL TERBESAR**
  - Next: 32px
  - Repeat: 24px, aktif = gradient, nonaktif = `#666680`

- **Bottom row:**
  - Lyrics button (kiri): "Lyrics" text + icon mic
  - Queue button (kanan): icon list + "Queue"
  - Keduanya: Satoshi Medium 12px `#AAAAAA`

---

### 6. Mini Player
- **Height:** 64px
- **Background:** `#13131A` dengan `BackdropFilter` blur 20
- **Border top:** `0.5px solid #1F1F2E`
- **Border radius:** 16px top only (jika floating) / 0 (jika attached ke bottom nav)
- **Layout:** [48px art] [judul + artist flex] [play/pause 32px] [next 32px]
- **Judul:** Satoshi SemiBold 14px white
- **Artist:** Satoshi 12px `#AAAAAA`
- **Progress line:** 2px tinggi, di bawah mini player, fill gradient
- **Tap area:** full width → navigate ke NowPlaying screen

---

### 7. Search Screen
- **Search bar:**
  - Background: `#13131A`
  - Border: `0.5px solid #1F1F2E`
  - Height: 48px, radius: 12px
  - Icon search: 20px `#666680` kiri
  - Icon mic: 20px `#666680` kanan
  - Placeholder: Satoshi 15px `#666680`

- **Genre tiles (masonry/grid):**
  - 2 kolom, gap 8px
  - Tile height: 80px
  - Background: gradient spesifik per genre (lihat tabel gradient di atas)
  - Icon: 28px, white, opacity 0.6, bottom-right
  - Label: Clash Display SemiBold 16px white, bottom-left, padding 12px
  - Border radius: 14px

---

### 8. Library Screen
- **Tab bar:** 4 tab (Playlists / Albums / Artists / Downloads)
  - Active tab: Clash Display SemiBold 14px white + border bottom 2px gradient
  - Inactive: Satoshi 14px `#666680`

- **Playlist list item:**
  - Art: 56×56px, radius 8px
  - Judul: Satoshi SemiBold 15px white
  - Info: "Playlist · 24 lagu" — Satoshi 12px `#666680`
  - 3-dot: kanan

- **Liked Songs (pinned):**
  - Art: gradient card `#7C3AED` → `#EC4899` dengan heart icon
  - Label: "Liked Songs"

- **Create Playlist button:**
  - Dashed border card, 56px height
  - Ikon "+" 20px gradient + "Buat Playlist Baru" Satoshi Medium 14px `#7C3AED`

---

### 9. Artist Profile Screen
- **Hero image:** Full-width, height 280px, `fit: cover`
- **Gradient overlay:** Transparent → `#0A0A0F`, bottom 50%
- **Nama artist:** Clash Display Bold 28px white, di atas gradient
- **Verified badge:** Biru, 16px, inline dengan nama
- **Monthly listeners:** Satoshi 13px `#AAAAAA` di bawah nama
- **Follow button:** Outlined, border gradient, Clash Display SemiBold 14px
- **Notif bell:** 24px icon kanan Follow button

---

### 10. Playlist Detail Screen
- **Hero:** Full-width image, height 260px, gradient fade ke background
- **Info block:**
  - Judul: Clash Display Bold 24px
  - Creator + tahun: Satoshi 13px `#AAAAAA`
  - Durasi: Satoshi 12px `#666680`
- **Action row:** [Shuffle pill button] [Play All pill button] — kiri | [Download toggle] [Follow] — kanan
- **Song list:** Song tile dengan index number, art 48×48px, judul, artist, durasi, 3-dot

---

### 11. Settings Screen
- **Section header:** Satoshi Medium 12px `#666680`, uppercase, letter-spacing 0.08em
- **Setting item:** Height 52px, icon 20px `#666680` kiri + label 15px white + chevron kanan
- **Toggle switch:** Active = gradient (thumb putih), inactive = `#252532`
- **Danger item (Logout):** Ikon + label `#EF4444`

---

## 🧩 Component Patterns

### Glass Card
```
Background: Colors.white.withOpacity(0.05)
Border: Colors.white.withOpacity(0.08), width 0.5px
Blur: BackdropFilter sigmaX: 20, sigmaY: 20
Border radius: 16px
```

### Gradient Button (Primary CTA)
```
Background: LinearGradient [#7C3AED → #06B6D4]
Height: 56px
Border radius: 14px
Text: Clash Display SemiBold 15px white
Padding horizontal: 24px
```

### Outlined Button (Secondary)
```
Background: transparent
Border: 0.5px gradient border (pakai ShaderMask atau stack trick)
Height: 48px
Border radius: 12px
Text: Satoshi Medium 14px white
```

### Song Tile (Standard)
```
Height: 64px
Padding: horizontal 20px, vertical 8px
Art: 48×48px, radius 8px
Title: Satoshi SemiBold 14px white
Artist: Satoshi 12px #AAAAAA
Duration: Satoshi 12px #666680
3-dot: 20px icon #666680
```

### Album Card (Square)
```
Width: depends on context
Art: full-width square, radius 12px
Title: Satoshi SemiBold 13px white, margin-top 8px
Subtitle: Satoshi 12px #AAAAAA
```

### Bottom Sheet (Option Menu)
```
Background: #13131A
Border radius: top 20px
Handle: 4×36px pill #252532 centered top
Item height: 52px
Icon: 20px #AAAAAA kiri
Label: Satoshi Medium 14px white
Destructive item (Report): label #EF4444
```

### Skeleton Loading
```
Color base: #1C1C2E
Color highlight: #2A2A3E
Border radius: sesuai elemen aslinya
Animation: shimmer horizontal, 1.5s infinite
```

### Toast / Snackbar
```
Background: #252532
Border: 0.5px solid #1F1F2E
Border radius: 12px
Padding: 12px 16px
Icon: 16px di kiri (success = green, error = red)
Text: Satoshi Medium 13px white
Duration: 2.5 detik auto-dismiss
Position: bottom center, 80px dari bawah (di atas bottom nav)
```

---

## 📐 Layout Rules

### Screen Padding
```
Horizontal: 20px kiri dan kanan (semua screen)
Top: 16px dari bawah status bar
Bottom: 16px dari atas bottom navigation
```

### Safe Areas
```
- Hormati dynamic island / notch di atas
- Hormati home indicator di bawah (minimal 34px iOS)
- Bottom navigation sudah include safe area
```

### Scroll Behavior
```
- Semua screen: CustomScrollView atau SingleChildScrollView
- Horizontal scroll: tidak ada scrollbar visible
- AppBar: transparent, collapse saat scroll
- Section header: sticky jika konten panjang
```

### Touch Targets
```
Minimum: 44×44px untuk semua interactable element
Icon-only button: beri padding hingga touch target 44px
```

---

## 🖼️ Screenshots Referensi

Setelah generate di Stitch, simpan file di sini:
```
design/
└── screens/
	├── WAVZ - Album Detail.png
	├── WAVZ - Artist Profile.png
	├── WAVZ - Create Playlist.png
	├── WAVZ - Equalizer.png
	├── WAVZ - Explore.png
	├── WAVZ - Go Premium.png
	├── WAVZ - Home.png
	├── WAVZ - Library.png
	├── WAVZ - Login.png
	├── WAVZ - Lyrics.png
	├── WAVZ - Now Playing.png
	├── WAVZ - Pick Your Vibes.png
	├── WAVZ - Playlist Detail.png
	├── WAVZ - Podcast & Shows.png
	├── WAVZ - Queue.png
	├── WAVZ - Search Results.png
	├── WAVZ - Settings.png
	├── WAVZ - Splash Screen.png
	└── WAVZ - Your Profile.png
```

---

## ⚡ Quick Reference untuk Gemini

Saat Gemini membuat widget apapun, pastikan selalu:

1. **Background screen** → selalu `AppColors.background` (`#0A0A0F`), **bukan** putih atau abu
2. **Card/container** → `AppColors.surface` (`#13131A`), bukan warna lain
3. **Teks judul** → selalu `fontFamily: 'ClashDisplay'`
4. **Teks body/metadata** → selalu `fontFamily: 'Satoshi'`
5. **Warna teks utama** → `AppColors.textPrimary` (putih)
6. **Warna teks sekunder** → `AppColors.textSecondary` (`#AAAAAA`)
7. **Spacing** → selalu dari `AppSpacing.xxx`, bukan angka mentah
8. **Gradient** → `AppColors.primaryGradient` atau `LinearGradient([primaryStart, primaryEnd])`
9. **Border tipis** → `0.5px` dengan `AppColors.divider` (`#1F1F2E`)
10. **Border radius** → dari `AppSpacing.radiusXxx`, bukan angka mentah

---

*Terakhir diperbarui: inisialisasi project*
*Jika ada perubahan design saat development, update file ini terlebih dahulu sebelum coding.*
