---
title: RUMランディングページの確認
linkTitle: RUMランディングページの確認
weight: 2
isCJKLanguage: true
---

* RUMランディングページにアクセスし、アプリケーションサマリーダッシュボード（モバイルおよびウェブベース）でRUM対応アプリケーションすべてのパフォーマンスの概要を確認します。

---

## 1. RUMランディングページにアクセス

Splunk IMT/APM/RUM ウェブサイトにログインします。左側のメニューバーから **RUM** を選択します ![RUM-ico](../../images/RUM_ico.png) 。RUMのランディングページが表示されます。

このページの目的は、アプリケーションの健全性、パフォーマンス、潜在的なエラーを1つのページで明確に示し、Webページ/アプリケーションから収集したユーザーセッションに関する情報をより深く掘り下げることができるようにすることです。アクティブなRUMアプリケーションごとにペインが表示されます。(以下のビューは、デフォルトの拡張ビューです。）

![RUM-App-sum](../../images/Applicationsummarydashboard.png)

複数のアプリケーションがある場合（RUMワークショップの参加者全員が自分のec2インスタンスを使用する場合）、以下のようにペインを折りたたむことで自動的にペインビューが縮小される場合があります。

![RUM-App-sum-collapsed](../../images/multiple_apps_collapsed.png)

アプリケーション名の前にある左側の赤い矢印で強調されている ![RUM-browser](../../images/browser.png) または ![RUM-mobile](../../images/mobile.png) アイコン(アプリケーションの種類が *モバイル* か *ブラウザー* かによる）をクリックすると、RUM Application Summryビューをフルダッシュボードに展開することが可能です。
 
まず、ワークショップに使用する適切なアプリケーションを見つけます。

単独のRUMワークショップに参加する場合、ワークショップ講師が使用するアプリケーションの名前を教えてくれます。複合ワークショップの場合、IMTとAPMで使用した命名規則に従い、上のスクリーンショットの一番最後に表示されているように、 **jmcj-rum-app** のようにユニークIDとしてEC2ノードの名前に従います。

## 2. RUM Application Summary ダッシュボード のヘッダーセクションを設定する

RUM Application Summary ダッシュボードは5つの主要なセクションで構成されています。一つ目は選択ヘッダーで、多くのオプションを設定/フィルタリングすることができます。

* 表示対象時間のための **タイム・ウィンドウ** ドロップダウン（デフォルトでは過去15分間）
* **Environment**[^1] を選択するためのドロップダウン。これにより、その環境に属するアプリケーションのサブセットのみにフォーカスすることができます。
* 監視対象のさまざまな **Apps** を含むドロップダウンリスト。ワークショップ講師によって提供されたものを使用するか、あなた自身のものを選択することができます。これにより、1つのアプリケーションにフォーカスすることができます。
* **Source** 、 **Browser** 、 **Mobile** アプリケーションを選択するためのドロップダウン。ワークショップの場合は、 *All* を選択したままにしてください。
* ヘッダーの右側にあるハンバーガーメニューで、Splunk RUM アプリケーションのいくつかの設定を行うことができます(これについては、後のセクションで説明します)。

![RUM-SummaryHeader](../../images/RUM_SummaryHeader.png)

次のセクションでは「Application Summary」画面をより深く掘り下げて説明します。
[Check Health Browser Application](../browserapp-summary/)

---

[^1]: デプロイメント環境（Environment）は、システムまたはアプリケーションの個別のデプロイメントであり、同じアプリケーションの他のデプロイメントの設定と重複しないように設定を行うことができます。開発、ステージング、本番など、開発プロセスの段階ごとに別々のデプロイメント環境を使用することがよくあります。
</br></br>
一般的なアプリケーションのデプロイメントパターンとして、互いに直接影響し合わない複数の異なるアプリケーション環境を持ち、それらをすべて Splunk APM または RUM で監視することがあります。たとえば、品質保証 (QA) 環境と本番環境、または異なるデータセンター、地域、クラウドプロバイダーでの複数の異なるデプロイメントが挙げられます。