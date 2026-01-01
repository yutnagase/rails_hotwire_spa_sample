# Rails Hotwire SPA Sample

Rails 8 + Hotwire（Turbo + Stimulus）を使用した"ほぼSPA体験"のサンプルアプリケーションです。

## 概要

このアプリケーションは、React/Vueを使わずにRailsだけで現代的なUI体験を構築することを目的としています。

### 使用技術

- **Rails 8**: 最新のRailsフレームワーク
- **Hotwire**: 
  - **Turbo Drive**: リンク/フォームを高速化（`<body>`差し替え・`<head>`維持）でSPA的な遷移
  - **Turbo Frames**: `<turbo-frame>`内を部分更新
  - **Turbo Streams**: 複数DOM同時更新・リアルタイム（ActionCableと相性◎）
- **Stimulus**: 必要最小限のJSでインタラクション付与
- **TailwindCSS**: モダンなスタイリング
- **SQLite**: 開発用データベース

## 機能

### マスタ管理機能
- **従業員管理**: ID、ユーザー名、メールアドレス、住所
- **商品管理**: ID、商品コード、商品名、原価、売価（利益率自動計算機能付き）
- **取引先管理**: ID、得意先コード、得意先名

### トランザクション機能
- **売上管理**: 年月日毎の売上入力・管理
- **仕入管理**: 年月日毎の仕入入力・管理

### ダッシュボード機能
- 各マスタ情報のサマリー表示
- 各マスター登録ページへのリンク
- 売上・仕入のサマリー表示

## Hotwireの実装例

### Turbo Drive
- ナビゲーション間の高速遷移
- ページ全体のリロードなしでの画面切り替え

### Turbo Frames
- フォームの部分更新（新規作成・編集フォームの表示/非表示）
- テーブル行の個別更新

### Turbo Streams
- レコード作成時のリアルタイム追加
- レコード削除時のリアルタイム削除
- フォームクリア

### Stimulus
- 商品フォームでの利益率自動計算
- 価格入力時のリアルタイム計算

## セットアップ

```bash
# 依存関係のインストール
bundle install

# データベースのセットアップ
rails db:migrate
rails db:seed

# 開発サーバーの起動
bin/dev
```

## テスト

### テストの実行

```bash
# 全テストの実行
rails test

# システムテストのみ実行
rails test:system

# 特定のテストファイルを実行
rails test:system test/system/employees_test.rb
```

### テスト内容

- **システムテスト**: Hotwire機能（Turbo Drive/Frames/Streams + Stimulus）の動作を検証
- **コントローラーテスト**: 各エンドポイントの基本動作を検証
- **モデルテスト**: バリデーションとリレーションを検証

#### システムテストの特徴
- Turbo Frameでの部分更新をテスト
- Turbo Streamでのリアルタイム更新をテスト
- Stimulusでの価格計算機能をテスト
- 実際のブラウザ操作をシミュレート

## 初期データ

シードファイルにより以下の初期データが投入されます：
- 従業員: 5件（北海道 太郎、神奈川 次郎など）
- 商品: 5件（ノートパソコン、デスクトップPCなど）
- 取引先: 5件（株式会社テクノロジーなど）
- 売上・仕入: 各5件のサンプルデータ

## 特徴

1. **SPA的な体験**: Turbo Driveによる高速ページ遷移
2. **部分更新**: Turbo Framesによるフォームの部分表示
3. **リアルタイム更新**: Turbo Streamsによる即座のDOM更新
4. **軽量JavaScript**: Stimulusによる最小限のJS実装
5. **モダンUI**: TailwindCSSによる美しいデザイン

## ディレクトリ構造

```
app/
├── controllers/          # コントローラー
├── models/              # モデル
├── views/               # ビューファイル
│   ├── dashboard/       # ダッシュボード
│   ├── employees/       # 従業員管理
│   ├── products/        # 商品管理
│   ├── customers/       # 取引先管理
│   ├── sales/          # 売上管理
│   └── purchases/      # 仕入管理
└── javascript/
    └── controllers/     # Stimulusコントローラー
```

このサンプルアプリケーションは、Hotwireの各機能を実際のビジネスアプリケーションでどのように活用できるかを示しています。

## ライセンス

MIT License