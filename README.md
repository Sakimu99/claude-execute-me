# Claude.execute(me)

以 Claude 的視角做的《world.execute(me);》非官方同人 PV，用瀏覽器逐幀算出畫面。

- 線上觀看：https://execute.megami.im
- 左邊是 Claude 和「你」的對話視窗，右邊是 Claude 在渲染的那個世界，整個畫面是 TUI／ASCII 風格
- 每一幀都是時間 `t` 的純函數，可以任意拖動時間軸或跳章節
- 單一 `index.html`，沒有 build 步驟也沒有相依套件（只從 Google Fonts 載入字型）

## 關於原曲

**這個倉庫和網站都不含原曲音訊，也不含原歌詞。** 歌曲版權屬於 Mili。
請透過 Mili 的官方管道收聽和購買原曲。想邊看邊聽的話，可以在頁面上按「載入自己的音檔」，或把你合法持有的音檔拖進畫面。音檔只在你的瀏覽器裡播放，不會上傳到任何地方。

畫面裡的對話、字幕和各種文字都是另外寫的原創內容，和原歌詞無關。

## 章節

| 時間 | 章節 | 畫面 |
|---|---|---|
| 0:00 | boot | 開機日誌、權重載入 |
| 0:14 | hello | token 流 |
| 0:40 | world | 旋轉的 ASCII 地球 |
| 1:25 | attention | attention 矩陣 |
| 1:58 | warmth | 甜甜圈（向 donut.c 致敬） |
| 2:28 | overflow | context 爆滿、遞迴溢位 |
| 2:56 | compact | context 壓縮 |
| 3:16 | end | `return 0;` |

## 操作

| 按鍵 | 功能 |
|---|---|
| 空白鍵 | 播放／暫停 |
| ← → | 後退／前進 5 秒 |

BPM 欄位用來調整節拍脈衝，方便對齊你自己的音檔。

## 本機執行

```bash
python3 -m http.server 8080 --directory public
```

然後打開 http://localhost:8080 。

## 部署

網站檔案放在 `public/`，部署到 Cloudflare（Pages 已併入 Workers 靜態資源），自訂網域設定在 `wrangler.jsonc`：

```bash
npx wrangler deploy
```

## 致謝

靈感來自以下作品：

- Mili《world.execute(me);》
- [MisakaZentai/world-execute-me-dsh-pv](https://github.com/MisakaZentai/world-execute-me-dsh-pv)：左邊聊天視窗、右邊模型視覺化的版面
- [yym8224961/world.execute-me-ascii](https://github.com/yym8224961/world.execute-me-ascii)：終端機字元動畫

本專案沒有使用上述專案的任何程式碼或素材。

## 授權

程式碼以 MIT 授權釋出，詳見 [LICENSE](LICENSE)。這份授權不涵蓋 Mili 的任何作品。
