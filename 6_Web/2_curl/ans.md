## 問題 1

```
curl -H 'X-Test:hello' https://httpbin.org/headers
```

```
{
  "headers": {
    "Accept": "*/*",
    "Host": "httpbin.org",
    "User-Agent": "curl/8.1.2",
    "X-Amzn-Trace-Id": "Root=1-668a7950-296db00603523a461eb61157",
    "X-Test": "hello"
  }
}
```

## 問題 2

```
curl -X POST -H 'Content-Type:application/json' -d '{"name": "hoge"}' https://httpbin.org/post

{
  "args": {},
  "data": "{\"name\": \"hoge\"}",
  "files": {},
  "form": {},
  "headers": {
    "Accept": "*/*",
    "Content-Length": "16",
    "Content-Type": "application/json",
    "Host": "httpbin.org",
    "User-Agent": "curl/8.1.2",
    "X-Amzn-Trace-Id": "Root=1-668a7970-0800a00410892b6c0aa3932e"
  },
  "json": {
    "name": "hoge"
  },
  "origin": "39.111.5.35",
  "url": "https://httpbin.org/post"
}
```

## 問題 3

```
curl -X POST -H 'Content-Type:application/json' -d '{userA: {name: "hoge", age: 29}}' https://httpbin.org/post

{
  "args": {},
  "data": "{userA: {name: \"hoge\", age: 29}}",
  "files": {},
  "form": {},
  "headers": {
    "Accept": "*/*",
    "Content-Length": "32",
    "Content-Type": "application/json",
    "Host": "httpbin.org",
    "User-Agent": "curl/8.1.2",
    "X-Amzn-Trace-Id": "Root=1-668a798d-050599117609b052691e4b2f"
  },
  "json": null,
  "origin": "39.111.5.35",
  "url": "https://httpbin.org/post"
}
```

## 問題 4

```
curl -X POST -H 'Content-Type:application/x-www-form-urlencoded' -d 'name=hoge' https://httpbin.org/post
{
  "args": {},
  "data": "",
  "files": {},
  "form": {
    "name": "hoge"
  },
  "headers": {
    "Accept": "*/*",
    "Content-Length": "9",
    "Content-Type": "application/x-www-form-urlencoded",
    "Host": "httpbin.org",
    "User-Agent": "curl/8.1.2",
    "X-Amzn-Trace-Id": "Root=1-668a79a5-696f8fac34ca552506493a7f"
  },
  "json": null,
  "origin": "39.111.5.35",
  "url": "https://httpbin.org/post"
}
```

curl クイズ

<details>
 <summary>curl で proxy 認証を突破する方法を教えてください。</summary>
1. -x オプションを利用

```
$ curl www.yahoo.co.jp -x http://{username}:{password}@{proxyサーバIP}:{port}　
```

2. 環境変数に設定

```
export http_proxy=http://{username}:{password}@{proxyサーバIP}:{port}
export https_proxy=http://{username}:{password}@{proxyサーバIP}:{port}　
```

 </details>

 <details>
 <summary>basic認証が必要な場合は、何のオプションを利用すればいいですか？</summary>
1. -u オプションを利用

```
$  curl 'http://localhost:8080/api/json' -u hugahuga:hogehoge
```

 </details>

Postman クイズ

  <details>
 <summary>Postmanで設定したAPIリクエスト例をcurlなどの他の手段で利用したい場合、どうすればいいか。</summary>
1. Code snippetを利用すると良い。
![postman1](https://raw.githubusercontent.com/baron7151/praha-challenge/main/6_Web/2_curl/postman1.png)
 </details>

 <details>
 <summary>Postmanを利用して、APIのmock serverを作ることができるのか？</summary>
 Yes.
 https://qiita.com/CharlieW-JP/items/dd2cd4252e5869653494
 </details>
