class Contact {
  final int id;
  String name;
  final int? accountNumber;

  Contact(this.id, this.name, this.accountNumber);

  @override
  String toString() {
    return 'Contact{name: $name, accountNumber: $accountNumber}';
  }
}
