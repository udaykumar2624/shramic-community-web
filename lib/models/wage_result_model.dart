class WageResultModel {
  final double baseWage;
  final double skillPremium;
  final double regionAdjustment;
  final double overheadCost;
  final double totalMonthly;
  final double hourlyRate;
  final bool isFairLabourCompliant;

  const WageResultModel({
    required this.baseWage,
    required this.skillPremium,
    required this.regionAdjustment,
    required this.overheadCost,
    required this.totalMonthly,
    required this.hourlyRate,
    required this.isFairLabourCompliant,
  });
}
