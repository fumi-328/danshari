# 断捨離memo(仮)

## サービス概要
-どんなサービスなのかを３行で説明してください。

* 断捨離をしたいけれど、なかなか行動に移せない人への背中を押すサービス。
自分だけだと捨てるのに勇気がいったり、本当に必要かどうかの基準がわからない事もあると思い他の人と共有できるサービスを考えました。

## このサービスへの思い・作りたい理由
-このサービスの題材となるものに関してのエピソードがあれば詳しく教えてください。
-このサービスを思いつくにあたって元となる思いがあれば詳しく教えてください。

* ものが少ない友人を見習って自分も断捨離しようと思いましたが、中々行動には移せなかったので後押しがほしい！と思い考えました。
ものが多いと何が必要で、何が必要ではないかが分からなくなってしまいがちです。
それに伴い、部屋が散らかっている状態で暮らすことでストレスが溜まってしまったりとメンタルの悪循環が起こってしまいます。
他の利用者の断捨離を見て共有する事で、自分も同じようなものを持っていて必要かどうか分からない場合、１つの考えるきっかけになると思いました。

## ユーザー層について
-決めたユーザー層についてどうしてその層を対象にしたのかそれぞれ理由を教えてください。

* 物を捨てれずついつい物が増えがちな人
現状解決してない人は、後押しされれば物を減らせると思った為
部屋や身の回りの必要のないものを捨てることで、心身ともに健康になれると考えている為


## サービスの利用イメージ
-ユーザーがこのサービスをどのように利用できて、それによってどんな価値を得られるかを簡単に説明してください。

* 「これだけ捨てれた」という達成感が1つでもできれば、もっと楽しく行動できるのではと思った為。
褒めてもらえないのは頑張っていても辛いので、出来たことを褒められるシステムにし、意識を高める。
えらいボタンを作り、合計でどれがけ褒めてもらえたのか・自分がどれだけ捨てられたかの総数を表示し、数が見えることによりモチベーションを高めてもらう。

## ユーザーの獲得について
-想定したユーザー層に対してそれぞれどのようにサービスを届けるのか現状考えていることがあれば教えてください。

* 本当に必要なものかどうかを再確認し期間を決め、使っていなかったら捨てようというサイクルを作るきっかけとなってほしい。
SNS（XやInstagram）にて断捨離についてお話しをしている方を多く見かけるので、
それを見て自分もやってみようと思った方をSNSを通してユーザー獲得をできるようにしたい。

## サービスの差別化ポイント・推しポイント
-似たようなサービスが存在する場合、そのサービスとの明確な差別化ポイントとその差別化ポイントのどこが優れているのか教えてください。
-独自性の強いサービスの場合、このサービスの推しとなるポイントを教えてください。

* 自分自身が断捨離を確認出来る事に加えて、他人と共有出来るようにし達成感を倍増してもらいたい。
リマインド機能をつけ、意識を高めてもらいたい。

## 機能候補
-現状作ろうと思っている機能、案段階の機能をしっかりと固まっていなくても構わないのでMVPリリース時に作っていたいもの、本リリースまでに作っていたいものをそれぞれ分けて教えてください。

* 会員登録
* ログイン/ログアウト
* マイページ
* 検索機能
* ユーザー全員の物一覧
* 断捨離する物の詳細機能
* えらいボタン
* 捨てたボタン
* LINE通知のリマインド機能

### 本リリース
* 他ユーザーからのコメント機能

## 機能の実装方針予定
-一般的なCRUD以外の実装予定の機能についてそれぞれどのようなイメージ(使用するAPIや)で実装する予定なのか現状考えているもので良いので教えて下さい。
* LINEログイン/ログアウト
=>Deviseを使用

* マイページ
=>自分が登録した物一覧、捨てられた物の総数、総えらい数

* 検索機能
=>ユーザー全員の物の名前、捨てるまでの期限

* 断捨離する物の詳細機能
=>名前、写真、理由、捨てるまでの期限

* LINE通知のリマインド機能(LINE Messaging API)
=>期限登録された物のリマインド

---

### 画面遷移図
Figma：https://www.figma.com/file/lWkYuoR51vhuPJw90Rn2HP/%E7%84%A1%E9%A1%8C?type=design&node-id=2%3A70&mode=design&t=0rgFeGmcDWR6U7Fb-1

### READMEに記載した機能
- [x] LINEログイン機能
- [x] マイページ
- [x] 検索機能
- [x] ユーザー全員の物一覧閲覧機能（未ログインでも閲覧可能）
- [x] 断捨離する物の投稿機能（画像投稿含む,詳細の登録）
- [x] 断捨離する物の編集機能
- [x] 断捨離する物の削除機能
- [x] えらいボタン機能
- [x] 捨てたボタン機能
- [x] LINE通知リマインド機能

### 未ログインでも閲覧または利用できるページ
以下の項目は適切に未ログインでも閲覧または利用できる画面遷移になっているか？
- [x] LINEログイン機能
- [x] ユーザー全員の物一覧閲覧機能
- [x] トップページ
- [x] お問合せ
- [x] 利用規約
- [x] プライバシーポリシー