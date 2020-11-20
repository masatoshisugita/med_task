# README

# 概要

* categoriesテーブルとideasテーブルの投稿と取得ができるRailsのAPI

# 使い方
* rails sでrailsを起動。(できなければbundle exec rails sを実行)

* 投稿方法（例）

　curl -X POST http://localhost:3000/categories -d'category_name=category_test1body=body_test1'

* 取得方法（例）

　curl -X GET http://localhost:3000/ideas -d 'category_name=category_test10'