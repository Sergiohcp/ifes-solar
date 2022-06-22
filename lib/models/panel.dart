class Panel {
  int id;
  String image;
  String producer;
  String name;
  double power;
  double temperature;
  double area;
  double efficiency;
  double ptc;
  String datasheet;

  Panel(
      {this.id = 0,
      this.image = "",
      this.producer = "",
      this.name = "",
      this.power = 0,
      this.temperature = 0,
      this.area = 0,
      this.efficiency = 0,
      this.ptc = 0,
      this.datasheet = ""});

  factory Panel.fromJson(Map<String, dynamic> json) {
    return Panel(
      id: json['id'] ?? 0,
      image: json['image'] ?? "",
      producer: json['producer'] ?? "",
      name: json['name'] ?? "",
      power: json['power'] ?? 0,
      temperature: json['temperature'] ?? 0,
      area: json['area'] ?? 0,
      efficiency: json['efficiency'] ?? 0,
      datasheet: json['datasheet'] ?? "",
    );
  }
}
