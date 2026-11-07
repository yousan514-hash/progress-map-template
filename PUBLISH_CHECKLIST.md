# 公開前の確認リスト

このリポジトリ（`ai-staff-template`）を GitHub に公開する前に確かめたことと、公開の手順です。
決めたこと（2026-11-07）: **公開する。ただし無料・GitHub だけ・見本のデータだけ。公開の操作は本人が実行する。**

確認日: 2026-11-08（Git / GitHub の担当が確認）

## 1. 本物のデータが入っていないか（grep）

対象: 追跡している全ファイル（`git grep -i`）と、全コミットの差分（`git log -p --all | grep -i`）。

| 語 | ファイル | 履歴 | 判断 |
|---|---|---|---|
| 勤め先の社名 | 0 | 0 | 問題なし |
| 副業先の社名（カナ・英字） | 0 | 0 | 問題なし |
| 報酬や給与の金額 | 0 | 0 | 問題なし |
| 個人のメールアドレス | 0 | 0 | 問題なし |
| 本人の姓 | 0 | 0 | 問題なし |
| 本物の進捗マップの共有 URL | 0 | 0 | 問題なし |
| PC のユーザー名を含むパス | 0 | 0 | 問題なし（README の「ユーザー名」の置き場所の説明は、山かっこの書き方だけ） |
| PC のユーザー名 / GitHub の ID | 0 | 1 | 履歴の1件はコミットの作者メール（GitHub の noreply アドレス）。公開しても問題なし |
| GitHub の表示名（fujita-sim） | 1 | 2 | LICENSE の著作権表示と作者名。公開アカウントの名前なので問題なし |

見本のデータの確認:
- 社員4人（ハル・ソラ・ミオ・コウ）、求人は「架空のA社・B社」、リポジトリ名は `ros2-practice` / `count-tool`（架空）、数字は丸い見本の値（20通り中15通り、テスト12件など）
- 本物の進捗マップ（本人の保管庫の map.json）からのコピーはない

## 2. ライセンス
- `LICENSE`: MIT、`Copyright (c) 2026 fujita-sim`
- README の末尾にも MIT と書いてある

## 3. コミットの作者
- 作者・コミッターのメール: GitHub の noreply アドレス（`<番号>+<GitHub の ID>@users.noreply.github.com` の形）
- 個人のメールアドレスは履歴に入っていない
- この確認リストにも、PC のユーザー名・メールアドレス・本物の名前は書かない（下のコマンドのパスは `$HOME` で書く）

## 4. .gitignore
- `progress-map/index.html`（毎回作り直す）、`.env`、`*.key`、`*.pem`、`Thumbs.db`、`.DS_Store` を除外
- 秘密情報のファイルは手元にもない

## 5. 大きなファイル
- いちばん大きいのは `docs/screenshot.png`（約 250KB）。次が `progress-map/template.html`（約 23KB）
- 1MB を超えるファイルはない。バイナリは画像1枚だけ

## 6. 動作の確認（実行したこと）
- `build.ps1` を Windows PowerShell 5.1 で実行し、`index.html` ができた
- できた `index.html` を Chrome（ヘッドレス）で開いて `docs/screenshot.png` を撮った。見本の3カテゴリ・16項目・17本の線が表示された
- 実行していないこと: PowerShell 7（`pwsh`）と macOS / Linux での `build.ps1`。Claude Code に `agents/*.md` を置いて呼び出す手順

## 7. 公開は本人が実行する

リポジトリ名の案: **`progress-map-template`**。
（別案: `ai-staff-progress-map`。README の題名「AI社員と進捗マップ」の両方を含み、フォルダ名 `ai-staff-template` とも近い。どちらでもよい）

本人が PowerShell で実行するコマンド（`gh` にログイン済みであること。`$HOME\dev\ai-staff-template` はこのフォルダの場所）:

```powershell
cd $HOME\dev\ai-staff-template
gh repo create progress-map-template --public --source . --remote origin --description "Hire Claude Code subagents as AI staff from job-posting requirements, and track their work on a one-page progress map (JSON + HTML, Japanese)." --push
```

このコマンドは、公開リポジトリを作り、`origin` を追加し、`main` を push します。

公開したあとに見ること:
- [ ] GitHub のページで README の画像（`docs/screenshot.png`）が表示される
- [ ] `index.html` が入っていない（.gitignore が効いている）
- [ ] About の description が英語の1行になっている
- [ ] 必要なら Topics を付ける（例: `claude-code`, `subagents`, `progress-map`, `japanese`）

## 8. 公開のあとで直すなら
- 見本の「2027年秋」（`template.html` の2か所）は、使う人が自分の時期に置き換える前提。README の「注意」に書いてある
