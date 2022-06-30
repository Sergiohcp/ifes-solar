import 'package:get/get.dart';
import 'package:ifes_solar/models/consumption.dart';
import 'package:ifes_solar/models/location.dart';
import 'package:ifes_solar/models/panel.dart';

class SimulationController {
  final _selectedPanel = Panel().obs;
  final _selectedLocation = Location().obs;
  final _selectedArea = 0.0.obs;
  final _selectedConsumption = Consumption().obs;

  Panel get selectedPanel => _selectedPanel.value;
  Location get selectedLocation => _selectedLocation.value;
  double get selectedArea => _selectedArea.value;
  Consumption get selectedConsumption => _selectedConsumption.value;

  void setSelectedPanel(Panel value) {
    _selectedPanel.value = value;
  }

  void setSelectedLocation(Location value) {
    _selectedLocation.value = value;
  }

  void setSelectedArea(double value) {
    _selectedArea.value = value;
  }

  void setSelectedConsumption(Consumption value) {
    _selectedConsumption.value = value;
  }
}
