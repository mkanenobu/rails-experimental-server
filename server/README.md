# README

Apply schema (exec on container)

```sh
./bin/rails ridgepole:apply
```

GraphiQL URL

```sh
http://localhost:3000/graphiql
```

Query example

```
{
  users {
    id
    email
    posts {
      id
      title
      text
      published
    }
  }
}
```

```
{
  user(id: 1) {
    email
    posts {
      id
      title
    }
  }
}
```
