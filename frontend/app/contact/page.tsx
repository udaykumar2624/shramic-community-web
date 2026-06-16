'use client';

import { FormEvent, useState } from 'react';

export default function ContactPage() {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [message, setMessage] = useState('');
  const [sent, setSent] = useState(false);

  const handleSubmit = (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    if (name.trim() && email.trim() && message.trim()) {
      setSent(true);
      setName('');
      setEmail('');
      setMessage('');
    }
  };

  return (
    <main className="min-h-screen bg-white text-slate-900 px-6 py-20 md:px-12">
      <div className="max-w-5xl mx-auto">
        <div className="text-center mb-16">
          <p className="text-sm uppercase tracking-[0.2em] text-blue-600">Contact</p>
          <h1 className="text-5xl font-bold mt-4">Get in touch with the Shramic team</h1>
          <p className="text-slate-600 mt-4 max-w-2xl mx-auto">
            Send us your questions, partnership requests, or community support needs. We’re here to help rural workers and organizations thrive.
          </p>
        </div>

        <div className="grid gap-12 lg:grid-cols-2">
          <div className="rounded-3xl bg-gradient-to-br from-blue-600 to-purple-600 p-10 text-white shadow-2xl">
            <h2 className="text-3xl font-bold mb-6">Reach our support team</h2>
            <div className="space-y-6 text-sm text-slate-100">
              <div>
                <p className="font-semibold">Email</p>
                <p>support@shramic.com</p>
              </div>
              <div>
                <p className="font-semibold">Phone</p>
                <p>+91 1234 567 890</p>
              </div>
              <div>
                <p className="font-semibold">Location</p>
                <p>Multiple community centers across India</p>
              </div>
            </div>
          </div>

          <div className="rounded-3xl border border-slate-200 p-8 shadow-sm">
            <h2 className="text-3xl font-bold mb-6">Send a message</h2>
            <form onSubmit={handleSubmit} className="space-y-5">
              <div>
                <label className="block text-sm font-semibold mb-2">Name</label>
                <input
                  type="text"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  className="w-full rounded-2xl border border-slate-200 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="Your name"
                  required
                />
              </div>
              <div>
                <label className="block text-sm font-semibold mb-2">Email</label>
                <input
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  className="w-full rounded-2xl border border-slate-200 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="you@example.com"
                  required
                />
              </div>
              <div>
                <label className="block text-sm font-semibold mb-2">Message</label>
                <textarea
                  value={message}
                  onChange={(e) => setMessage(e.target.value)}
                  rows={5}
                  className="w-full rounded-2xl border border-slate-200 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="How can we help you?"
                  required
                />
              </div>
              <button type="submit" className="w-full rounded-2xl bg-blue-600 text-white px-6 py-4 font-bold hover:bg-blue-700 transition">
                Send Message
              </button>
              {sent && (
                <p className="text-sm text-green-600 font-medium">Thanks! Your message has been received.</p>
              )}
            </form>
          </div>
        </div>
      </div>
    </main>
  );
}
