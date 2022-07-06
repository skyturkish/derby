extension ImagePathExtension on String {
  String get toJPG => 'assets/images/$this.jpg';
  String get toPNG => 'assets/images/$this.png';
}
