# LeetCode-in-Dart video workflow

Runbook để biến một screen recording (giọng tiếng Việt) thành video YouTube hoàn chỉnh:
transcript → phụ đề Việt/Anh → thumbnail → title/description. Đúc kết từ tập LeetCode 222.

## 0. Prereqs (đã cài sẵn trên máy Mac)

- `ffmpeg` + `whisper-cpp` (Homebrew) — `whisper-cli` chạy Metal.
- Models: `~/whisper-models/ggml-large-v3.bin` (STT) + `~/whisper-models/ggml-silero-v5.1.2.bin` (VAD).
- Google Chrome (render thumbnail → PNG).

## 1. Transcribe (audio → SRT + TXT)

```bash
# tách audio
ffmpeg -y -i "video.mov" -vn -ac 1 -ar 16000 -c:a pcm_s16le audio.wav

# transcribe — LUÔN có -mc 0 + VAD
whisper-cli -m ~/whisper-models/ggml-large-v3.bin -f audio.wav -l vi \
  --vad -vm ~/whisper-models/ggml-silero-v5.1.2.bin \
  -mc 0 -ml 60 -sow -osrt -otxt -of transcript
```

⚠️ **Bug repetition-loop của whisper (đã dính 1 lần):** nếu chạy KHÔNG có `-mc 0`, whisper
tiếng Việt hay bị kẹt lặp một câu và **đè lên lời nói thật** — mất cả nửa video mà không báo lỗi.
`-mc 0` (max-context 0) + VAD (bỏ khoảng lặng) là thuốc chữa. **Luôn verify sau khi chạy:**

```bash
# 1) độ phủ: timestamp cuối phải ≈ thời lượng video
tail -12 transcript.srt
# 2) không có dòng lặp bất thường
sort transcript.txt | uniq -c | sort -rn | head
```

- `-ml 60 -sow` = cue ngắn ~1 dòng, cắt theo từ (hợp phụ đề).
- Thời lượng video: `ffprobe -v error -show_entries format=duration -of csv=p=0 video.mov`

## 2. Cap thời gian hiển thị mỗi cue (≤ 8s)

VAD hay gộp lời liền mạch → có cue treo cả phút. Cắt đuôi thừa, giữ nguyên start-time
(script Python: `new_end = min(orig_end, start + 8.0)`). Lúc im lặng thì không có phụ đề
treo lơ lửng.

## 3. Sửa/polish nội dung

- Sửa lỗi ASR + thuật ngữ: `nhị phân` (không phải nhịp/nhiệt phân), `node`, `root`, `duyệt`
  (không phải "diệt"), `đệ quy`, `O(n)`, `completely filled`, `2^h − 1`, `bit shift`.
- Sửa cả nội dung cho đúng kỹ thuật (vd "2 con" chứ không "2 lá"; chốt `O(log²n)`).
- `.txt` = bản đọc (đoạn văn liền mạch); `.srt` = phụ đề (giữ timestamp).
- Kỹ thuật giữ đồng bộ: sửa text theo từng cue (1 dòng/cue), rồi ghép lại với timestamp gốc
  bằng script (đảm bảo số dòng == số cue).

## 4. Thumbnail (1280×720 → PNG)

Template: `tools/thumbnail.html` (CONFIG-driven, blueprint luci-studio, brand + fonts embed).
Sửa block `CONFIG` cho bài mới (number, title, difficulty, language, complexity…).
**Bài array/two-pointer** → dùng schematic mảng sẵn có. **Bài cây/khác** → thay schematic
bên phải bằng SVG phù hợp (xem bản LeetCode 222 làm mẫu: cây nhị phân, node khuyết cam
gạch chéo, men trái tô xanh = leftHeight).

Render ra PNG (Chrome headless — nó chụp xong nhưng KHÔNG tự thoát, timeout ~2 phút là bình
thường, ảnh vẫn ra):

```bash
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless=new --disable-gpu --hide-scrollbars --no-first-run \
  --user-data-dir=/tmp/chrome-thumb \
  --window-size=1280,720 --force-device-scale-factor=2 \
  --virtual-time-budget=5000 \
  --screenshot="thumb.png" "file://$PWD/thumbnail_custom.html"
# ra 2560×1440 (2×, sắc nét). Logo base64: copy nguyên từ template, ĐỪNG gõ tay lại.
```

## 5. Title + Description (YouTube)

Title mẫu: `LeetCode <#>: <Tên bài> — O(<độ phức tạp>) Solution in Dart`

Description theo format của series (xem tập 27 Remove Element):
dòng tóm tắt → 🔗 Problem → "In this video:" bullets → ⏱️ Chapters → 💻 Code (link GitHub
`blob/main/...`, path có dấu cách nhớ encode `%20`) → dòng series + `👉 luci studio · https://luci-studio.com`
→ hashtags.

Chapters lấy mốc từ `.srt`:
```bash
for n in <cue numbers>; do awk -v N=$n 'BEGIN{RS="";FS="\n"} $1+0==N{print $2}' transcript.srt; done
```

⚠️ **YouTube Description CHẶN ký tự `<` và `>`** ("Angled brackets aren't allowed").
→ Không viết `1 << h` trong description; đổi thành "left bit-shift". (`→ − ²` thì OK.)

## 6. Upload phụ đề

YouTube Studio → **Subtitles** → chọn video → set video language = **Vietnamese** →
dòng ngôn ngữ → cột Subtitles → **Add → Upload file → "With timing"** → chọn `.srt`.

## 7. Track tiếng Anh

- **Phụ đề Anh:** dịch từng cue sang tiếng Anh, GIỮ NGUYÊN timestamp của bản Việt
  (ghép English text vào timestamp cũ, số dòng phải khớp) → `video.en.srt`.
  Upload: Subtitles → **Add language → English → Upload file → With timing**.
  Title & description tiếng Anh cũng thêm được ở cột "Title & description" của dòng English.
- **Lồng tiếng (dub, audio Anh):** cần tính năng multi-language audio — kênh này CHƯA bật
  (menu Subtitles không có mục "Audio tracks"). Khi có: upload file audio + đặt English.
  Tạo dub bằng ElevenLabs Dubbing / Rask.ai / HeyGen, hoặc YouTube Aloud.

## Gotchas (tóm tắt)

1. whisper thiếu `-mc 0` → repetition-loop nuốt mất lời — luôn verify độ phủ + dòng lặp.
2. Chrome headless không tự thoát sau `--screenshot` — timeout là bình thường, ảnh vẫn ra.
3. Đừng gõ tay lại base64 logo — copy nguyên từ template.
4. YouTube Description cấm `<` `>`.
5. Upload phụ đề: chọn **"With timing"** (không phải Auto-sync) vì SRT đã có timestamp.
