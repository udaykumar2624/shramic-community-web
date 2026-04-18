import ImpactStats from "../components/ImpactStats";
import Testimonials from "../components/Testimonials";
import CTA from "../components/CTA";

export default function Home() {
  return (
    <div className="p-10">

      {/* Hero Section */}
      <section className="text-center py-20">
        <h1 className="text-4xl font-bold">
          Empowering Workers Through Digital Access
        </h1>

        <p className="mt-4 text-gray-600">
          Shramic platform enables transparency and fair labour pricing.
        </p>

        <button className="mt-6 bg-black text-white px-6 py-2 rounded">
          Join Community
        </button>
      </section>

      {/* Mission */}
      <section className="py-16 text-center">
        <h2 className="text-2xl font-semibold">Our Mission</h2>
        <p className="mt-2 text-gray-600 max-w-2xl mx-auto">
          To create a transparent digital ecosystem that connects rural
          and unorganised workers with fair opportunities and resources.
        </p>
      </section>

      {/* Vision */}
      <section className="py-16 text-center bg-gray-50">
        <h2 className="text-2xl font-semibold">Our Vision</h2>
        <p className="mt-2 text-gray-600 max-w-2xl mx-auto">
          A fair and accessible labour marketplace powered by technology
          that uplifts communities and ensures equitable wages.
        </p>
      </section>

      {/* Impact Section */}
      <ImpactStats />

      {/* Testimonials */}
      <Testimonials />

      {/* Call to Action */}
      <CTA />

    </div>
  );
}