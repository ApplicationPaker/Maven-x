import 'package:flutter/material.dart';

class StepperPro extends ChangeNotifier {
  int _currentStep = 0;

  int get currentStep => _currentStep;

  void goToStep(int step) {
    _currentStep = step;
    notifyListeners();
  }
void setStep() {
   
      _currentStep = 0;
      notifyListeners();
    
  }


  void nextStep() {
    if (_currentStep < 6) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }
}
