export default function ImpactStats() {
  return (
    <section className="py-16 bg-gray-100 text-center">
      <h2 className="text-3xl font-bold mb-8">Our Impact</h2>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div>
          <h3 className="text-3xl font-bold">10K+</h3>
          <p className="text-gray-600">Workers Connected</p>
        </div>

        <div>
          <h3 className="text-3xl font-bold">500+</h3>
          <p className="text-gray-600">Communities Supported</p>
        </div>

        <div>
          <h3 className="text-3xl font-bold">1M+</h3>
          <p className="text-gray-600">Fair Wage Calculations</p>
        </div>
      </div>
    </section>
  );
}