参考：
https://note.com/nviveto/n/na85c82d002ee#PDShZ

▪️ 課題 1
アトミックデザイン

- page
  > 最終的にユーザーが閲覧するものが「page」です。テンプレートに対して、Web サイトで実際に掲載する画像やテキストなどのコンテンツを追加することでページが完成します。
  > ・template
  > ページ全体の骨組みとなる「テンプレート（Templates）」です。原子や分子、生体に相当するパーツを組み合わせることでテンプレートを作成します。
  > ・organism
  > Atom や Molecule を組み合わせてできるパーツです。アトミックデザインにおける生体は、特定の機能を持ったパーツのことです。生体の具体例として、ヘッダーやフッターなどの構成要素が挙げられます。
  > ・molecule
  > Atom に相当する要素を組み合わせてできるパーツです。例えば、Atom であるボタンとインプット要素を組み合わせてできる「入力フォーム」などが分子として扱われます。
  > ・atom
  > Atom は、UI を構成する最小単位のパーツです。ボタンやフォント、アイコンなどの要素を、それ以上分解できない最小単位である原子に例えています。

関数コンポーネントとクラスコンポーネントの違い

- 文法の記載の仕方で、以下の 3 点の違いが見られる。

  - props の受け渡し

仮に呼び出し元が、以下のようにコンポーネントを使用して、props を渡していた場合。

```javascript
<Component name="Shiori" />
```

・関数コンポーネントの場合は、props をそのまま利用することができる。

```javascript
const FunctionalComponent = (props) => {
  return <h1>Hello, {props.name}</h1>;
};
```

・クラスコンポーネントの場合は、this を使用して props を参照する必要がある。

```javascript
class ClassComponent extends React.Component {
  render() {
    const { name } = this.props;
    return <h1>Hello, {name}</h1>;
  }
}
```

- state の処理

・関数コンポーネントの場合は、state 変数を使用するには初期状態の引数を取る useState フックを使用する必要があります。useState が現在の状態とそれを更新する関数を返します。

```javascript
const FunctionalComponent = () => {
  const [count, setCount] = React.useState(0);

  return (
    <div>
      <p>count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Click</button>
    </div>
  );
};
```

・クラスコンポーネントの場合は、コンストラクタを実装して super(props)の呼び出しを実行しないと、使用したいすべての state 変数を定義できません。
また、コンストラクタ内では、state キーと初期値を使用して state オブジェクトを作成します。JSX 内では`this.state`で state の参照を行い、this.setState で state の更新を行います。

```javascript
class ClassComponent extends React.Component {
 constructor(props) {
   super(props);
   this.state = {
     count: 0
   };
 }

 render() {
   return (
     <div>
       <p>count: {this.state.count} times</p>
       <button onClick={() => this.setState({ count: this.state.count + 1 })}>
         Click
       </button>
     </div>
   );
 }
```

- ライフサイクルメソッド
  - componentDidMount は、最初のレンダリングが完了した直後に呼び出します。関数コンポーネントの場合は、componentDidMount の代わりに useEffect フックと[]の 2 番目の引数を使用します。

```javascript
const FunctionalComponent = () => {
  React.useEffect(() => {
    console.log("Hello");
  }, []);
  return <h1>Hello, World</h1>;
};
```

- クラスコンポーネントの場合は、以下の通り基本通りの使用が可能です。

```javascript
class ClassComponent extends React.Component {
  componentDidMount() {
    console.log("Hello");
  }

  render() {
    return <h1>Hello, World</h1>;
  }
}
```

- マウント解除時（componentWillUnmount）
  - 関数コンポーネントの場合は、マウント解除時に実行される関数を useEffect 関数内で返す必要があります。

```javascript
const FunctionalComponent = () => {
  React.useEffect(() => {
    return () => {
      console.log("Bye");
    };
  }, []);
  return <h1>Bye, World</h1>;
};
```

- クラスコンポーネントの場合は、以下のように基本通りの使用が可能です。

```javascript
class ClassComponent extends React.Component {
  componentWillUnmount() {
    console.log("Bye");
  }

  render() {
    return <h1>Bye, World</h1>;
  }
}
```

課題２

- position: absolute のデメリット

position: absolute はある起点からどれだけ離れているかの絶対値を指定して表示するプロパティのため、
ある画面では綺麗に表示されていても、画面のサイズを変更すると表示崩れを起こしてしまう可能性が高いため、
使用は避けた方が良い。

- atomic デザインルール

  - atom:基本的な HTML 要素具体的には以下の通り

  ```html
  Button(Default,Primary,Secondary,Radio,,,etc) Title(h1,h2,h3,Label,,,etc)
  text(Paragraph,Description,Alert,,,etc) Form Icon Image
  ```

  - molecular:atom を合体させたもの　具体的には以下の通り

  ```
  Button + Form + Label
  Icon + Title
  Image + Text
  ```

- organism:一つの塊として使い回しのできるものが成形されます。具体的には以下の通り

```
Header
Footer
Card
List
Menu
```

- template:UI デザインの概念のみで成形されます。molecular と organism を組み合わせてよく使うパターンをコンポーネント化する。

- page:実際の画面イメージやビジュアルを成形する部分
