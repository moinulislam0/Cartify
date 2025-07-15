class Note {
  final String username;
  final String number;
  final String address;

  Note({required this.username, required this.address, required this.number});

  static Map<String, dynamic>  toMap(Note note) {
    return {
      'username': note.username,
      'number': note.number,
      'address': note.address
    };
  }

  factory Note.fromMap(Map<String, dynamic> note) {
    return Note(
        username: note['username'],
        address: note['address'],
        number: note['number']);
  }
}
