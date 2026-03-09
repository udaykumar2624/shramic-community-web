import '../models/wage_result_model.dart';

class PricingService {
  static const double _baseRatePerHour = 300;
  static const double _skillBonusPerLevel = 500;
  static const double _minimumFairWage = 15000;
  static const int _weeksPerMonth = 4;

  static WageResultModel calculate({
    required double hoursPerWeek,
    required double skillLevel,
    required double regionIndex,
    required double overheadPercent,
  }) {
    final base = _baseRatePerHour * hoursPerWeek * _weeksPerMonth;
    final skillPremium = (skillLevel - 1) * _skillBonusPerLevel;
    final subtotal = base + skillPremium;
    final overheadCost = subtotal * (overheadPercent / 100);
    final beforeRegion = subtotal + overheadCost;
    final totalMonthly = beforeRegion * (regionIndex / 100);
    final hourlyRate = totalMonthly / (hoursPerWeek * _weeksPerMonth);
    final regionAdjustment = regionIndex - 100;

    return WageResultModel(
      baseWage: base,
      skillPremium: skillPremium,
      regionAdjustment: regionAdjustment,
      overheadCost: overheadCost,
      totalMonthly: totalMonthly,
      hourlyRate: hourlyRate,
      isFairLabourCompliant: totalMonthly >= _minimumFairWage,
    );
  }
}
