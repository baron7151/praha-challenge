参考記事
https://honobonolab.com/mysql-primary-unique/

DB に not null 制約をつけた場合のデメリットについて

- NULL はユニーク扱いされるため、対象のカラムにユニーク制約をかけていて、null を許容していたものを not null 制約を行った場合、アプリケーションでレコード登録しようとした際に、エラーが発生する可能性がある。
- データが欠損したときの表現ができなくなる。
- アプリ側で Null を登録しようとして、エラーになる。
