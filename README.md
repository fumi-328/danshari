# 断捨離memo(仮)

## サービス概要
-どんなサービスなのかを３行で説明してください。

断捨離をしたいけれど、なかなか行動に移せない人への背中を押すサービス。
自分だけだと捨てるのに勇気がいったり、本当に必要かどうかの基準がわからない事もあると思い他の人と共有できるサービスを考えました。

## このサービスへの思い・作りたい理由
-このサービスの題材となるものに関してのエピソードがあれば詳しく教えてください。
-このサービスを思いつくにあたって元となる思いがあれば詳しく教えてください。

ものが少ない友人を見習って自分も断捨離しようと思いましたが、中々行動には移せなかったので後押しがほしい！と思い考えました。

## ユーザー層について
-決めたユーザー層についてどうしてその層を対象にしたのかそれぞれ理由を教えてください。

物を捨てれずついつい物が増えがちな人
現状解決してない人は、後押しされれば物を減らせると思った為


## サービスの利用イメージ
-ユーザーがこのサービスをどのように利用できて、それによってどんな価値を得られるかを簡単に説明してください。

「これだけ捨てれた」という達成感が1つでもできれば、もっと楽しく行動できるのではと思った為。
褒めてもらえないのは頑張っていても辛いので、出来たことを褒められるシステムにし、意識を高める。

## ユーザーの獲得について
-想定したユーザー層に対してそれぞれどのようにサービスを届けるのか現状考えていることがあれば教えてください。

本当に必要なものかどうかを再確認し期間を決め、使っていなかったら捨てようというサイクルを作るきっかけとなってほしい。

## サービスの差別化ポイント・推しポイント
-似たようなサービスが存在する場合、そのサービスとの明確な差別化ポイントとその差別化ポイントのどこが優れているのか教えてください。
-独自性の強いサービスの場合、このサービスの推しとなるポイントを教えてください。

自分自身が断捨離を確認出来る事に加えて、他人と共有出来るようにし達成感を倍増してもらいたい。
リマインド機能をつけ、意識を高めてもらいたい。

## 機能候補
-現状作ろうと思っている機能、案段階の機能をしっかりと固まっていなくても構わないのでMVPリリース時に作っていたいもの、本リリースまでに作っていたいものをそれぞれ分けて教えてください。

* 会員登録
* ログイン/ログアウト
* 検索機能
* 断捨離する物の詳細機能
* えらいボタン
* LINE通知のリマインド機能

### 本リリース
* 他ユーザーからのコメント機能

## 機能の実装方針予定
-一般的なCRUD以外の実装予定の機能についてそれぞれどのようなイメージ(使用するAPIや)で実装する予定なのか現状考えているもので良いので教えて下さい。

* 検索機能
=>ユーザー全員の物一覧、自分だけ一覧、捨てるまでの期限

* 断捨離する物の詳細機能
=>名前、写真、理由、期限

* LINE通知のリマインド機能
=>期限登録された物のリマインド