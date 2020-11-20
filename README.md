# README

# 概要

* categoriesテーブルとideasテーブルの投稿と取得ができるRailsのAPI

# 使い方

* 取得の方法（例）　curl -X POST http://localhost:3000/categories -d'category_name=category_test1body=body_test1'

* 投稿の方法（例）　curl -X GET http://localhost:3000/ideas -d 'category_name=category_test10'