# rivertodo

Just another test assignment

Для API использован https://my-json-server.typicode.com/

Отображает список задач, полученных из сети (GET /todos).
Фильтрация по категориям.
Экран создания задачи:
Поля: название, описание, категория (выпадающий список).
При нажатии "Сохранить" отправляется запрос на POST /todos.
Возврат на главный экран, обновление списка.

Стэк: flutter_riverpod, dio, auto_route, injectable

## Setup
```zsh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart run lean_builder build
```