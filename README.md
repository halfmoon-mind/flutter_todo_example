# flutter_todo_example

This is example of todo list app using flutter.

## Getting Started

```bash
$ flutter run --release
```

## 사용한 패키지
- [Hive](https://pub.dev/packages/hive)
- [GetX](https://pub.dev/packages/get)
- [build_runner](https://pub.dev/packages/build_runner)


## 구현 설명
상태 관리 라이브러리는 GetX를 사용하였고, 해당 상태관리

클린 아키텍쳐를 도입하여 data / domain / presentation 레이어를 나누었습니다.

Hive 라이브러리를 사용하여 로컬DB를 구현하고, NoSQL 방식으로 데이터를 저장했습니다.



## TODO
- [ ] 테스트 코드 작성