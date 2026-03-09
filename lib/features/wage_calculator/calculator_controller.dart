import 'package:flutter/material.dart';
import '../../models/wage_result_model.dart';
import '../../services/pricing_service.dart';

class CalculatorController extends ChangeNotifier {
  double hours = 40;
  double skill = 5;
  double region = 100;
  double overhead = 20;

  // Industry dropdown
  String selectedIndustry = 'Construction';
  final List<String> industries = [
    'Construction',
    'Textile',
    'Agriculture',
    'Domestic Work',
    'Manufacturing',
    'Transport',
    'Healthcare',
    'Education',
  ];

  // State dropdown
  String selectedState = 'Maharashtra';
  final List<String> states = [
    'Maharashtra',
    'Delhi',
    'Gujarat',
    'Tamil Nadu',
    'Karnataka',
    'Rajasthan',
    'Uttar Pradesh',
    'West Bengal',
  ];

  late WageResultModel result;

  CalculatorController() {
    _calculate();
  }

  void updateHours(double v) {
    hours = v;
    _calculate();
    notifyListeners();
  }

  void updateSkill(double v) {
    skill = v;
    _calculate();
    notifyListeners();
  }

  void updateRegion(double v) {
    region = v;
    _calculate();
    notifyListeners();
  }

  void updateOverhead(double v) {
    overhead = v;
    _calculate();
    notifyListeners();
  }

  void updateIndustry(String v) {
    selectedIndustry = v;
    // Different industries have different base rates
    switch (v) {
      case 'Healthcare':
        region = 120;
        break;
      case 'Education':
        region = 110;
        break;
      case 'Agriculture':
        region = 70;
        break;
      case 'Domestic Work':
        region = 75;
        break;
      default:
        region = 100;
    }
    _calculate();
    notifyListeners();
  }

  void updateState(String v) {
    selectedState = v;
    // Different states have different cost indices
    switch (v) {
      case 'Delhi':
        region = 140;
        break;
      case 'Maharashtra':
        region = 120;
        break;
      case 'Karnataka':
        region = 115;
        break;
      case 'Gujarat':
        region = 110;
        break;
      case 'Tamil Nadu':
        region = 108;
        break;
      case 'Rajasthan':
        region = 85;
        break;
      case 'Uttar Pradesh':
        region = 80;
        break;
      case 'West Bengal':
        region = 90;
        break;
      default:
        region = 100;
    }
    _calculate();
    notifyListeners();
  }

  void reset() {
    hours = 40;
    skill = 5;
    region = 100;
    overhead = 20;
    selectedIndustry = 'Construction';
    selectedState = 'Maharashtra';
    _calculate();
    notifyListeners();
  }

  void _calculate() {
    result = PricingService.calculate(
      hoursPerWeek: hours,
      skillLevel: skill,
      regionIndex: region,
      overheadPercent: overhead,
    );
  }
}
