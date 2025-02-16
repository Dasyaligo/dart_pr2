import 'dart:io';

void main(List<String> arguments) {
  // Создаем папку books, если она не существует
  Directory('books').createSync(recursive: true);

  // Получаем текущую дату для имени файла
  String dateString = DateTime.now().toString().split(' ')[0];
  File myFile = File('books/books_$dateString.txt');

  // Проверяем, существует ли файл
  if (myFile.existsSync()) {
    print("Файл существует");
  } else {
    print("Файла нет, он будет создан.");
  }

  // Запрашиваем информацию о книге
  stdout.write("Введите название книги: ");
  String? bookName = stdin.readLineSync();

  stdout.write("Введите автора: ");
  String? avtors = stdin.readLineSync();

  stdout.write("Введите год издания: ");
  String? year = stdin.readLineSync();

  // Вывод информации о книге
  print("Название: $bookName");
  print("Автор: $avtors");
  print("Год издания: $year");

  // Записываем данные о книге в файл
  if (bookName != null && avtors != null && year != null) {
    myFile.writeAsStringSync("Название: $bookName, Автор: $avtors, Год: $year\n", mode: FileMode.append);
    print("Информация о книге добавлена в файл.");
  } else {
    print("Все поля должны быть заполнены.");
  }

  // Вывод времени последнего изменения файла
  print("Последнее изменение файла: ${myFile.lastModifiedSync()}");
}
