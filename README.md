# Ultra-Coins の Website

このレポジトリは、Ultra-Coins のブログとして機能します。

ブログは、zola という SSG(静的サイトジェネレータ)を使用しています。

## 記事を書くときのルール

1. 適当に作成するディレクトリ名で branch を切ってから、作業に取りかかってください。
2. 記事の追加方法は、以下の「記事の追加方法」を参照してください。

## 記事の追加方法

適当なディレクトリを`content`配下に作成し、その中に`index.md`を作成する。

`index.md`のテンプレート

```md
+++
title = "タイトル"
date = 2000-01-01
authors = ["執筆者"]
[taxonomies]
tags = ["Ultra-Coins", "network"]
+++
```

> [!WARNING]
> タグ名の表記揺れを防ぐために、`TAG_LIST.md`を確認して、存在しないタグを付けたい場合は、`TAG_LIST.md`にタグ名を追記してください。
>
> **※すでに存在しているタグの別名表記を追加するのは、やめてください。**
>
> [TAG_LIST.mdのリンク](https://github.com/ultra-coins/ultra-coins-blog/blob/main/TAG_LIST.md)

> [!WARNING]
> すでに存在するディレクトリ名は使用できません。

> [!NOTE]
> ディレクトリ名が記事の URI を識別する際の名前になります。

> [!NOTE]
> 画像などは作成したディレクトリに配置する。

## Ultra-Coins の Blog 特有の記法

### Code Block の各言語一覧

https://www.getzola.org/documentation/content/syntax-highlighting/

#### 例

````
```rs
fn main() {
    println!("Hello, world!");
}
```
````

![codeblock](https://github.com/ultra-coins/ultra-coins-blog/blob/main/assets/codeblock.png)

### 画像

```
{{ image(path="/image/path") }}
```

image は、`width=int`,`height=int`,`caption=String`をそれぞれオプションで追加できます。(Blog の sample ページを参照)

> [!NOTE] > `width`や`height`に非常に大きな自然数を入れた場合は、Markdown の結果が表示される DOM の範囲まで大きくなります。
>
> (css のレイアウトを壊そうとしても、壊せないようにしているということです。)

#### `width`,`height`,`caption`を全て適用した例

```
{{ image(path="/content/sample/image.jpg", width=1000, height=200, caption="captionの例") }}
```

![image](https://github.com/ultra-coins/ultra-coins-blog/blob/main/assets/image.png)

> [!NOTE]
> 画像は自動で webp に変換されるはずなので、画像サイズは気にしなくて良いです。

### katex

```
$$
#この中に数式を書く
$$
```

#### 例

```
$$
\frac{dy}{dx} + p(x) y^2 + q(x) y + r(x) = 0
$$
```

![katex](https://github.com/ultra-coins/ultra-coins-blog/blob/main/assets/katex.png)

### mermaid

```
{% mermaid() %}
#この中に mermaid のコードを書く
{% end %}
```

#### 例

```
{% mermaid() %}
flowchart LR
rdb["PostgreSQL (RDB)"] <--> server["server (main)"]
graphdb["Neo4j (GraphDB)"] <--> server["server (main)"]
meilisearch["Meilisearch (検索エンジン)"] <--> server["server (main)"]
cloudflare["Cloudflare R2 (画像保存)"] <--> image-server["image-server (画像専用)"]
server["server (main)"] <--> client["client"]
image-server["image-server (画像専用)"] <--> client["client"]
{% end %}
```

![marmaid](https://github.com/ultra-coins/ultra-coins-blog/blob/main/assets/marmaid.png)

### note

```
{% note() %}
# ここに note の内容を書く
{% end %}
```

#### 例

```
{% note() %}
これは note です。
{% end %}
```

![note](https://github.com/ultra-coins/ultra-coins-blog/blob/main/assets/note.png)

### tip

```
{% tip() %}
# ここに tip の内容を書く
{% end %}
```

#### 例

```
{% tip() %}
これは tip です。
{% end %}
```

![tip](https://github.com/ultra-coins/ultra-coins-blog/blob/main/assets/tip.png)

### important

```
{% important() %}
# ここに important の内容を書く
{% end %}
```

#### 例

```
{% important() %}
これは important です。
{% end %}
```

![important](https://github.com/ultra-coins/ultra-coins-blog/blob/main/assets/important.png)

### warning

```
{% warning() %}
# ここに warning の内容を書く
{% end %}
```

#### 例

```
{% warning() %}
これは warning です。
{% end %}
```

![warning](https://github.com/ultra-coins/ultra-coins-blog/blob/main/assets/warning.png)

### caution

```
{% caution() %}
# ここに caution の内容を書く
{% end %}
```

#### 例

```
{% caution() %}
これは caution です。
{% end %}
```

![caution](https://github.com/ultra-coins/ultra-coins-blog/blob/main/assets/caution.png)

## 使用した SSG

zola 0.19.2

## レスポンシブ対応

対応済み

## templates の構造

以下、疑似 html で表現している

### 記事一覧ページ

```
<base.html>
  <index.html></index.html>
</base.html>
```

### 記事ページ

```
<base.html>
    <blog-template.html></blog-template.html>
</base.html>
```

### 404 ページ

```
<base.html>
    <404.html></404.html>
</base.html>
```

## shortcodes を置く場所

`/templates/shortcodes/`配下に置いてください

## 環境の Setup

### 非 Nix ユーザーの場合

以下を参考に zola をインストールしてください。

https://www.getzola.org/documentation/getting-started/installation/

### Nix ユーザーの場合 (flake を利用できる場合)

```shell
nix develop -c $SHELL
```

## References

https://www.getzola.org/documentation/getting-started/overview/#content

https://swaits.com/adding-mermaid-js-to-zola/

https://sippo.work/blog/20231105-deploy-zola-with-cloudflare-pages/

https://zenn.dev/com4dc/scraps/c6c0f5fb87a1f9
