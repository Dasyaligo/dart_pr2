import 'dart:io';

void main(List<String> arguments) {
  Directory('books').createSync(recursive: true);
  DateTime now = new DateTime.now();
  String date = "${now.day.toString()}-${now.month.toString()}-${now.year.toString()}";
 
  
  File myFile = File('C:/Users/Buzun/Desktop/Practic2/pr2_p_1_23_saltykova/books/books_$date.txt');


  if (myFile.existsSync()) {
    print("Файл существует");
  } else {
    print("Файла нет");
  }

  
  stdout.write("Введите название книги: ");
  String? bookName = stdin.readLineSync();

  stdout.write("Введите автора: ");
  String? avtors = stdin.readLineSync();

  stdout.write("Введите год издания: ");
  String? year = stdin.readLineSync();

  
  print("Название: $bookName");
  print("Автор: $avtors");
  print("Год издания: $year");


  if (bookName != null && avtors != null && year != null) {
    
    myFile.writeAsStringSync("Название: $bookName, Автор: $avtors, Год: $year\n", mode: FileMode.append);
    print("Информация о книге добавлена в файл.");
  } else {
    print("Ошибка, поля должны быть заполнены.");
  }

  
  print("Последнее изменение файла: ${myFile.lastModifiedSync()}");
}
