import Link from "next/link";

export default function AboutPage() {
  return (
    <main className="min-h-screen bg-white text-slate-900">
      <section className="bg-gradient-to-r from-indigo-600 to-sky-500 text-white py-24 px-6 text-center">
        <div className="max-w-5xl mx-auto">
          <p className="uppercase text-sm tracking-[0.3em] mb-4">About Shramic</p>
          <h1 className="text-5xl md:text-6xl font-bold mb-6">A mission to empower rural workers with technology</h1>
          <p className="text-lg md:text-xl text-slate-200 max-w-3xl mx-auto leading-relaxed">
            Shramic connects rural and unorganised workers with fair jobs, transparent pricing, and digital skills. We build communities, trust, and opportunity across India.
          </p>
          <div className="mt-10 flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/join-community" className="px-8 py-4 rounded-full bg-white text-indigo-700 font-bold hover:bg-slate-100 transition">
              Join Our Community
            </Link>
            <Link href="/contact" className="px-8 py-4 rounded-full border border-white text-white hover:bg-white/10 transition">
              Contact Us
            </Link>
          </div>
        </div>
      </section>

      <section className="py-20 px-6 md:px-12">
        <div className="max-w-6xl mx-auto grid gap-12 lg:grid-cols-3">
          {[
            {
              title: 'Our Vision',
              description: 'To create a fair digital ecosystem that ensures workers are paid transparently and communities thrive together.',
            },
            {
              title: 'Our Values',
              description: 'Integrity, inclusion, transparency, and long-term impact guide every product and partnership we build.',
            },
            {
              title: 'Our Promise',
              description: 'We prioritize worker rights, clear wage data, and locally relevant digital tools across every service.',
            },
          ].map((item, idx) => (
            <div key={idx} className="rounded-3xl border border-slate-200 p-8 shadow-sm hover:shadow-lg transition">
              <h2 className="text-2xl font-bold mb-4">{item.title}</h2>
              <p className="text-slate-600 leading-relaxed">{item.description}</p>
            </div>
          ))}
        </div>
      </section>

      <section className="bg-slate-50 py-20 px-6 md:px-12">
        <div className="max-w-6xl mx-auto">
          <div className="grid gap-10 lg:grid-cols-3">
            <div className="rounded-3xl bg-white p-8 shadow-xl">
              <h3 className="text-2xl font-semibold mb-4">Digital access</h3>
              <p className="text-slate-600 leading-relaxed">Tools and training that help rural workers use apps, track wages, and find good work from anywhere.</p>
            </div>
            <div className="rounded-3xl bg-white p-8 shadow-xl">
              <h3 className="text-2xl font-semibold mb-4">Fair wages</h3>
              <p className="text-slate-600 leading-relaxed">Transparent pricing and wage calculations ensure every worker sees how their pay is derived.</p>
            </div>
            <div className="rounded-3xl bg-white p-8 shadow-xl">
              <h3 className="text-2xl font-semibold mb-4">Community support</h3>
              <p className="text-slate-600 leading-relaxed">Communities have a trusted platform for sharing opportunities, mentoring, and organizing together.</p>
            </div>
          </div>
        </div>
      </section>
    </main>
  );
}
