'use client';

import { FormEvent, useState } from 'react';
import Link from 'next/link';

export default function SignInPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [message, setMessage] = useState('');

  const handleSubmit = (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    if (email.trim() && password.trim()) {
      setMessage('Welcome back! You can now explore ecosystem opportunities.');
      setEmail('');
      setPassword('');
    }
  };

  return (
    <main className="min-h-screen bg-slate-100 px-6 py-20 md:px-12 text-slate-900">
      <div className="max-w-4xl mx-auto grid gap-10 lg:grid-cols-2 items-center">
        <div>
          <p className="text-sm uppercase tracking-[0.24em] text-blue-600 mb-4">Sign In</p>
          <h1 className="text-5xl font-bold mb-6">Access your Shramic profile</h1>
          <p className="text-slate-600 leading-relaxed mb-8">
            Log in to manage your opportunities, review your earnings, and connect with your community.
          </p>
          <div className="rounded-3xl bg-white p-8 shadow-lg">
            <p className="font-semibold mb-4">New here?</p>
            <Link href="/join-community" className="inline-flex items-center justify-center rounded-full border border-slate-300 px-5 py-3 text-sm font-semibold hover:bg-slate-100 transition">
              Create a new account
            </Link>
          </div>
        </div>

        <div className="rounded-[2rem] bg-white p-10 shadow-2xl border border-slate-200">
          <form onSubmit={handleSubmit} className="space-y-6">
            <div>
              <label className="block text-sm font-semibold mb-2">Email</label>
              <input
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="w-full rounded-2xl border border-slate-300 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-blue-500"
                placeholder="you@example.com"
                required
              />
            </div>
            <div>
              <label className="block text-sm font-semibold mb-2">Password</label>
              <input
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="w-full rounded-2xl border border-slate-300 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-blue-500"
                placeholder="Enter your password"
                required
              />
            </div>
            <button type="submit" className="w-full rounded-2xl bg-blue-600 text-white px-6 py-4 font-bold hover:bg-blue-700 transition">
              Sign In
            </button>
            {message && <p className="text-green-600 font-medium">{message}</p>}
          </form>
        </div>
      </div>
    </main>
  );
}
