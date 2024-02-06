class Library {
  String _name;
  List<Book> _books;

  Library(String name)
      : _name = name,
        _books = [];
  get name {
    return _name;
  }

  void addBook(Book book) {
    _books.add(book);
  }

  void removeBook(Book book) {
    _books.remove(book);
  }

  List<Book> findBooksByAuthor(String author) {
    return _books.where((book) => book.author == author).toList();
  }

  List<Book> findAvailableBooks() {
    return _books.where((book) => !book.isCheckedOut).toList();
  }
}

class Book {
  String _title;
  String _author;
  String _ISBN;
  bool _isCheckedOut;

  Book(String title, String author, String ISBN)
      : _title = title,
        _author = author,
        _ISBN = ISBN,
        _isCheckedOut = false;

  String get title => _title;
  String get author => _author;
  String get ISBN => _ISBN;
  bool get isCheckedOut => _isCheckedOut;

  void checkOut() {
    if (!_isCheckedOut) {
      _isCheckedOut = true;
    }
  }

  void checkIn() {
    if (_isCheckedOut) {
      _isCheckedOut = false;
    }
  }
}

class Member {
  String _name;
  List<Book> _booksCheckedOut;

  Member(String name)
      : _name = name,
        _booksCheckedOut = [];

  void checkOutBook(Book book) {
    if (!book.isCheckedOut) {
      book.checkOut();
      _booksCheckedOut.add(book);
      print("Book ${book.title} has been checked out by $_name.");
    } else {
      print("Book ${book.title} is already checked out.");
    }
  }

  void returnBook(Book book) {
    if (_booksCheckedOut.contains(book)) {
      book.checkIn();
      _booksCheckedOut.remove(book);
      print("Book ${book.title} has been returned by $_name.");
    } else {
      print("Book ${book.title} was not checked out by $_name.");
    }
  }
}

void main() {
  // Create a library
  Library myLibrary = Library("My Awesome Library");

  // Create some books
  Book book1 = Book("Book 1", "Author 1", "1234567890");
  Book book2 = Book("Book 2", "Author 2", "2345678901");

  // Add books to the library
  myLibrary.addBook(book1);
  myLibrary.addBook(book2);

  // Create a library member
  Member libraryMember = Member("John Doe");

  libraryMember.checkOutBook(book1);

  libraryMember.checkOutBook(book1);

  libraryMember.returnBook(book1);

  libraryMember.returnBook(book2);

  List<Book> availableBooks = myLibrary.findAvailableBooks();
  print(
      "Available Books in ${myLibrary.name}: ${availableBooks.map((book) => book.title)}");
}
