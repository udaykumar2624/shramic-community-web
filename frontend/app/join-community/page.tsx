import Link from "next/link";

export default function JoinCommunityPage() {
  return (
    <main className="min-h-screen bg-slate-50 text-slate-900 px-6 py-20 md:px-12">
      <div className="max-w-6xl mx-auto">
        <div className="rounded-[2rem] bg-gradient-to-r from-purple-700 to-sky-600 text-white p-14 shadow-2xl">
          <h1 className="text-5xl font-bold mb-6">Join the Shramic Community</h1>
          <p className="text-xl text-slate-100 max-w-3xl leading-relaxed">
            Become part of a trusted ecosystem for rural workers, local organizations, and fair labor partners. Join today and start accessing opportunities, learning resources, and community support.
          </p>
          <div className="mt-10 flex flex-col sm:flex-row gap-4">
            <Link href="/signin" className="inline-flex items-center justify-center rounded-full bg-white px-8 py-4 text-slate-900 font-bold hover:scale-105 transition">
              Create an Account
            </Link>
            <Link href="/about" className="inline-flex items-center justify-center rounded-full border border-white px-8 py-4 text-white hover:bg-white/10 transition">
              Learn More About Us
            </Link>
          </div>
        </div>

        <section className="mt-16 grid gap-8 lg:grid-cols-3">
          {[
            { title: 'Trusted Connections', text: 'Connect with employers, community leaders, and workers in a fair and transparent environment.' },
            { title: 'Fair Wages', text: 'Get matched to projects with clear pricing and right-to-know wage details for every task.' },
            { title: 'Skills & Training', text: 'Access courses, certifications, and mentoring programs to grow your career.' },
          ].map((item, idx) => (
            <div key={idx} className="rounded-3xl bg-white p-8 shadow-lg border border-slate-200">
              <h2 className="text-2xl font-semibold mb-3">{item.title}</h2>
              <p className="text-slate-600 leading-relaxed">{item.text}</p>
            </div>
          ))}
        </section>

        <section className="mt-16 bg-white rounded-3xl shadow-2xl p-10">
          <h2 className="text-3xl font-bold mb-6">How it Works</h2>
          <ol className="space-y-6 text-slate-600">
            <li>
              <span className="font-semibold">1. Register</span> - Create your profile and share your skills or community needs.
            </li>
            <li>
              <span className="font-semibold">2. Discover</span> - Explore trusted work opportunities, training programs, and community groups.
            </li>
            <li>
              <span className="font-semibold">3. Grow</span> - Track earnings, receive support, and build a stronger future.
            </li>
          </ol>
        </section>
      </div>
    </main>
  );
}
