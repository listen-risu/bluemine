発見
・railsのcontrollerはフロントから整数を受け取ることができない（整数で渡しても文字に変換する）
自分は、再度数字文字は整数に変換するようなフィルタをかけて対応したのだが、
redmineは数字文字のまま使用していた。

・to_sメソッドを使い、nilの場合空文字になるように実装している箇所があった。
to_s特性をうまく使って余計なエラーを発生させないようにしている？

・lメソッド
ロケールの設定をしておけば、lメソッド使うだけで、時間のフォーマットをしていすることができる。
config/application.rb
config.i18n.defaut_locale = :ja

config/locales/ja.yml
ja:
  time:
    formats:
      default: "%Y/%m/%d %H:%M:%S"

redmineでは、言語ごとにymlファイル作って、アラートメッセージの言語をlメソッドを使ってdryに切り替えている。

・yieldとブロック思い出した

メソッド(inp, &block)
yield if block

raiseメソッドの返り値は、エラーオブジェクトかnil

・demodulize.
モジュール名を削除。
demodulize('ActiveRecord::CoreExtensions::String::Inflections')
# "Inflections"

・underscore
クラス名からファイル名へ変換
underscore("AdminUser")
# "admin_user"

・リクエストのフォーマットによって処理をかき分ける
response_to do |format|
  format.html ...

  format.api....
  format.json...
end

・is_a?メソッド
オブジェクトが指定されたクラスmodかサブクラスのインスタンスかを確かめるメソッド。

・クラスメソッド内でfind_byなどメソッドを使用するとき、
Model名.メソッドとせず、メソッド名だけで使用できる。

- 2024/05/14
・contextual：文脈上の

・ヘッダータイトル下のsnsバナーはposition:absoluteでタイトルに重ねている。
h1要素のスタイルを変えずに実装することで保守性を上げている

・a要素などにtitle属性をつけるとツールチップみたいなことができる