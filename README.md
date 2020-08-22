# Parrot
http://parrot-live.work/

## 概要
ライブ情報をアーティスト様、イベント主催者様、ユーザーが自由に投稿できるSNSアプリケーションです。

### サイトテーマ
今日、様々なアーティストがライブ（ストリーミング）情報を発信しています。ですが、好きなアーティストが増えていくにつれ、「いつの間に発表していたの！？」「あれ、こんなライブあったっけ？」等の見落としが増えていくこともしばしば、、、
そのため、見落としがないよう、アーティスト、イベント主催者様、ユーザーが自由にライブ情報を投稿でき、共有できるアプリケーションを作成しました。

### テーマを選んだ理由
自分自身が音楽に携わるPFを作成したいという強い気持ちがあり、今の力で作りあげられる物を考えた際、自分自身も困っていた、ライブ情報をまとめたアプリケーションを作り上げるのが最適だと考えたためです。

### ターゲットユーザー
好きなアーティストが多数おり、ライブ情報を知りたいユーザー

### 主な利用シーン
・好きなアーティストがライブ情報を発表した時
・好きなアーティストのライブ情報を確認したい時

## 機能一覧

https://docs.google.com/spreadsheets/d/1pI-j59RWkMLTq4uabcSISurS_G3MS_nBvy6bCSiL6UE/edit#gid=0


* ユーザー管理
    * 新規ユーザー登録機能
    * ユーザーログイン機能
    * ユーザー詳細表示機能
    * ユーザアカウント編集機能
    * SNS認証（Twitter）での新規登録・ログイン機能
    * ゲストログイン機能（編集・退会不可）

* アーティスト機能
    * アーティスト一覧表示機能
    * アーティスト詳細表示機能
    * アーティストごとのライブ情報表示機能
    * インクリメンタルサーチ機能（Ajax）

* 記事機能
    * 新規記事投稿機能
    * 記事詳細表示機能
    * 記事への画像アップロード機能
    * 記事編集・削除機能
    * 記事一覧表示機能（日付昇順・当日以前の投稿は非表示）

* 記事へのいいね機能
    * 記事へのいいね作成・削除機能
    * ユーザー詳細にていいね一覧表示機能

* 記事へのコメント機能
    * 記事へのコメント作成・削除機能

* カレンダー機能
    * 記事一覧ページにて週間ライブスケジュールの表示

* 管理者機能
    * 管理画面にてユーザー・記事・アーティストの追加・編集・削除機能
    * 権限管理

## 設計書
Ui Flows
https://app.diagrams.net/#G1szAT4dekCyNPXteURBgdRKmryPQtcDS7

フレームワーク
https://prottapp.com/p/5a2109

ER図
https://drive.google.com/file/d/1-O5g50_qcmrEGNelLHsyxd8yeS4FFk5R/view?usp=sharing

テーブル定義書
https://docs.google.com/spreadsheets/d/1cwnO8aRQIcE20hDY7lqbX1puF89CN0nhmTM66EFGuog/edit#gid=17655762

アプリケーション詳細設計
https://docs.google.com/spreadsheets/d/10lZUbr1hXZaX3YLeLyK3E_s4TlIPktK6wuqyl19Fkvs/edit#gid=251423500


## デモ画像

![デモ画像1](https://user-images.githubusercontent.com/61319401/87299135-69b3e000-c546-11ea-8732-efdcde5cd984.png)

![デモ画像2](https://user-images.githubusercontent.com/61319401/87299213-91a34380-c546-11ea-9952-77c9313abb0f.png)

![デモ画像3](https://user-images.githubusercontent.com/61319401/87299219-936d0700-c546-11ea-90ca-f006872d81c8.png)