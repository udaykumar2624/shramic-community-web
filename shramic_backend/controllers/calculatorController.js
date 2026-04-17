exports.calculate = async (req, res) => {
  try {
    const { hoursPerWeek, skillLevel, regionIndex, overheadPercent } = req.body;

    const BASE_HOURLY = 80;
    const WEEKS = 4.33;

    const baseWage = BASE_HOURLY * hoursPerWeek * WEEKS;
    const skillPremium = baseWage * ((skillLevel - 1) / 9) * 0.5;
    const regionAdjusted = (baseWage + skillPremium) * (regionIndex / 100);
    const overheadCost = regionAdjusted * (overheadPercent / 100);
    const totalMonthly = regionAdjusted + overheadCost;
    const hourlyRate = totalMonthly / (hoursPerWeek * WEEKS);

    res.json({
      baseWage,
      skillPremium,
      overheadCost,
      totalMonthly,
      hourlyRate,
      isFairLabourCompliant: totalMonthly >= 15000,
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
