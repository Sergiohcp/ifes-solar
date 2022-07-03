import 'dart:convert';

import 'package:get/get.dart';
import 'package:ifes_solar/models/consumption.dart';
import 'package:ifes_solar/models/location.dart';
import 'package:ifes_solar/models/panel.dart';
import 'package:ifes_solar/repositories/simulation_repository.dart';

class SimulationController {
  final SimulationRepository simulationRepository;

  final _selectedPanel = Panel().obs;
  final _selectedLocation = Location().obs;
  final _selectedArea = 0.0.obs;
  final _selectedConsumption = Consumption().obs;
  final _isSimulationLoading = false.obs;

  SimulationController({required this.simulationRepository});

  Panel get selectedPanel => _selectedPanel.value;

  Location get selectedLocation => _selectedLocation.value;

  double get selectedArea => _selectedArea.value;

  Consumption get selectedConsumption => _selectedConsumption.value;

  bool get isSimulationLoading => _isSimulationLoading.value;

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

  void setIsSimulationLoading(bool value) {
    _isSimulationLoading.value = value;
  }

  void simulate() async {
    try {
      setIsSimulationLoading(true);
      var response = await this.simulationRepository.generateEnergy(
          selectedPanel.id,
          selectedLocation.latitude,
          selectedLocation.longitude,
          selectedArea);
      if (response.body != null) {
        var body = jsonDecode(response.body);
        print('body ${body}');
      }
    } finally {
      setIsSimulationLoading(false);
    }
  }
}
