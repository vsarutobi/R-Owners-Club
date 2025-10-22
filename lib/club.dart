class Club {
  String _name = "";
  String _description = "";

  // constructor
  Club(this._name, this._description);

  // Getter
  String get name => _name;
  String get description => _description;

  // Setter
  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    }
  }

  set description(String newDescription) {
    if (newDescription.isNotEmpty) {
      _description = newDescription;
    }
  }
}
