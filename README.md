# This repository is not maintained. We also recommend that you stop using this library because Flash will not be available after 2020.

ActionScript library for clipboard copy 
==================================================
(Japanese follows English)

What's this ?
--------------------------------------

ASClip is a tiny ActionScript library which helps you to copy text onto clipboard. This works on most popular browsers: the latest version of Google Chrome, Firefox, Safari and IE with Flash Player 10 or later. 

In loading this flash library, it dynamically generates a button for copying since mouse click should be occured on the flash itself for security reason. When user clicks the button, text will be copied. You can change look &amp; feel of the button by setting label text or images.

How to use
--------------------------------------

Download a Flash file from [here](https://github.com/nulab/asclip/raw/master/bin/asclip.swf) and save it to your desired location. You should set "Flashvars" parameter to control this library.

<span style='font-weight:bold;'>Basic parameters</span>
<dl>
  <dt>clipString</dt>
  <dd>Text to copy</dd>
  <dt>getClipString</dt>
  <dd>Name of a function called when button is clicked. Return value of this function will be copied.</dd>
  <dt>onCopyCompleted</dt>
  <dd>Name of a function executed after copy is done.</dd>  
</dl>
You have to set parameter for either "clipString" or "getClipString" otherwise nothing will be copied. If you set both, "getClipString" is used.

An object is passed as an argument in calling functions specified by "getClipString" or "onCopyCompleted" and you can see whether shift key, control key or alt key are pressed or not from properties of the object. Here's an example that
"getPressedKey" is set to "getClipString" parameter.
```javascript
var getPressedKey = function(e){
    if (e.shiftKey){
        return 'shift key pressed';
    }else if (e.ctrlKey){
        return 'control key pressed';
    }else if (e.altKey){
        return 'alt key pressed';
    }
    return 'no keys pressed';
}
```

<span style='font-weight:bold;'>UI related parameters</span>
<dl>
  <dt>labelString</dt>
  <dd>Label displayed on a button</dd>
  <dt>labelSize</dt>
  <dd>Size of the label</dd>
  <dt>labelFont</dt>
  <dd>Font for the label</dd>
  <dt>imageNormal</dt>
  <dd>Path of an background image of a button</dd>
  <dt>imageOver</dt>
  <dd>Path of an background image of a button appeared in mouseover</dd>
  <dt>imagePress</dt>
  <dd>Path of an background image of a button appeared in mousedown</dd>    
</dl>

<span style='font-weight:bold;'>HTML example (partial)</span>
```html
 <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="150" height="36" id="asclip">
    <param value="asclip.swf" name="movie">
    <param name="FlashVars" value="clipString=test&amp;labelString=Copy%20the%20Link&amp;labelFont=Arial%20Black&amp;labelSize=14">
　  <embed src="asclip.swf" width="150" height="36" name="asclip" quality="high" allowscriptaccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="clipString=test&amp;labelString=Copy%20the%20Link&amp;labelFont=Arial%20Black&amp;labelSize=14" bgcolor="#eeeeee">    
 </object>
```

Examples
--------------------------------------

See <a href="http://nulab.github.io/asclip/">exmaples here</a>. You can get these files by checking out to gh-pages branch after clone of this repository.

```bash
$ git clone https://github.com/nulab/asclip.git
$ git checkout gh-pages
```


Who uses this ?
--------------------------------------
1. [Cacoo](http://cacoo.com/)
2. [Backlog](http://backlogtool.com/) ([for Japanese user](http://www.backlog.jp))



# このリポジトリはメンテナンスされていません。また、Flashは2020年以降利用できなくなるため、このライブラリーの利用をやめることをお勧めします。

これは何？
--------------------------------------

ASClip は Flashを使ったシステムのクリップボードに文字列をセットできるライブラリです。Flash Player 10 以降が利用できる Google Chrome, Firefox, Safari そして IE の各々の最新バージョンで動作します。

セキュリティ上の制約からクリックイベントを Flash 上で発生させる必要があるため、このライブラリはローディング時にコピー処理用のボタンを動的に生成します。そのボタンをクリックした時に文字列がクリップボードにコピーされます。そのボタンに対してラベルや画像を設定することで見た目を柔軟に変更することが可能です。


使い方
--------------------------------------

[ここ](https://github.com/nulab/asclip/raw/master/bin/asclip.swf) から Flash ファイルをダウンロードし、適当な場所に保存してください。HTML からその Flash をローディングする際に Flashvars という名前でパラメータを設定することで振る舞いを変更することができます。

<span style='font-weight:bold;'>コピー処理に関するパラメータ</span>
<dl>
  <dt>clipString</dt>
  <dd>クリックした時にここで設定した文字列がクリップボードにコピーされます。</dd>
  <dt>getClipString</dt>
  <dd>クリックした時に呼び出される関数名を指定します。クリップボードにはその関数を実行した結果がコピーされます。</dd>
  <dt>onCopyCompleted</dt>
  <dd>文字列がコピーされた後に呼び出されるコールバック関数の名前を指定します。</dd>  
</dl>
clipString もしくは getClipString のどちらかを指定しない限り、クリップボードにコピーされません。両方が指定された場合は getClipString の値が優先されます。

getClipString や onCopyCompleted で指定した関数の実行時に、引数で渡されるオブジェクトのプロパティから、マウスクリック時にシフトキー、コントロールキー、alt キーが押されているかどうかの情報を取得することが出来ます。
getPressedKey という関数が getClipString に指定されている場合の例を以下に示します。
```javascript
var getPressedKey = function(e){
    if (e.shiftKey){
        return 'shift key pressed';
    }else if (e.ctrlKey){
        return 'control key pressed';
    }else if (e.altKey){
        return 'alt key pressed';
    }
    return 'no keys pressed';
}
```

<span style='font-weight:bold;'>コピーボタンの見た目に関するパラメータ</span>
<dl>
  <dt>labelString</dt>
  <dd>ボタンに表示される文字列を指定します</dd>
  <dt>labelSize</dt>
  <dd>文字列のサイズを指定します</dd>
  <dt>labelFont</dt>
  <dd>文字列のフォントを指定します</dd>
  <dt>imageNormal</dt>
  <dd>通常時の画像のパスを指定します</dd>
  <dt>imageOver</dt>
  <dd>マウスオーバーしたときの画像のパスを指定します</dd>
  <dt>imagePress</dt>
  <dd>マウスダウンしたときの画像のパスを指定します</dd>    
</dl>

<span style='font-weight:bold;'>パラメータ設定の例(抜粋)</span>
```html
 <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="150" height="36" id="asclip">
    <param value="asclip.swf" name="movie">
    <param name="FlashVars" value="clipString=test&amp;labelString=Copy%20the%20Link&amp;labelFont=Arial%20Black&amp;labelSize=14">
　  <embed src="asclip.swf" width="150" height="36" name="asclip" quality="high" allowscriptaccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="clipString=test&amp;labelString=Copy%20the%20Link&amp;labelFont=Arial%20Black&amp;labelSize=14" bgcolor="#eeeeee">    
 </object>
```

サンプル
--------------------------------------

<a href="http://nulab.github.io/asclip/">こちら</a>をご覧ください。これらのサンプルは、このリポジトリをクローンした後に gh-pages ブランチにチェックアウトすることでも確認することが出来ます。

```bash
$ git clone https://github.com/nulab/asclip.git
$ git checkout gh-pages
```


このライブラリが利用されているサイト
--------------------------------------
1. [Cacoo](http://cacoo.com/)
2. [Backlog](http://www.backlog.jp) ([海外向け](http://backlogtool.com))

