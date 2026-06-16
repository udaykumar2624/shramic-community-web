'use client';

import { useState } from 'react';
import { ArrowRight, CheckCircle, Mail, User, Briefcase } from 'lucide-react';

export default function CTA() {
  const [email, setEmail] = useState('');
  const [name, setName] = useState('');
  const [role, setRole] = useState('worker');
  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (email && name) {
      setSubmitted(true);
      setTimeout(() => {
        setEmail('');
        setName('');
        setRole('worker');
        setSubmitted(false);
      }, 3000);
    }
  };

  return (
    <section className="relative py-24 overflow-hidden">
      {/* Animated background */}
      <div className="absolute inset-0 bg-gradient-to-r from-blue-900 via-purple-900 to-blue-900" />
      <div className="absolute top-0 right-0 w-96 h-96 bg-blue-500 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-pulse" />
      <div className="absolute bottom-0 left-0 w-96 h-96 bg-purple-500 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-pulse" />

      <div className="relative z-10 max-w-6xl mx-auto px-6">
        <div className="grid md:grid-cols-2 gap-12 items-center">
          {/* Left Side - Content */}
          <div className="text-white">
            <h2 className="text-5xl md:text-6xl font-bold mb-6 leading-tight">
              Join the Digital Movement
            </h2>
            <p className="text-xl text-blue-100 mb-8 leading-relaxed">
              Be part of a transformative ecosystem empowering rural and unorganized workers with fair opportunities, transparent wages, and skill development.
            </p>

            {/* Features List */}
            <div className="space-y-4 mb-8">
              {[
                'Access to 10K+ job opportunities',
                'Transparent wage calculations',
                'Skill development programs',
                'Community support & networking',
                'Secure payments & benefits',
              ].map((feature, idx) => (
                <div key={idx} className="flex gap-3 items-start group">
                  <CheckCircle size={24} className="text-green-400 flex-shrink-0 mt-1 group-hover:scale-110 transition-transform" />
                  <span className="text-lg">{feature}</span>
                </div>
              ))}
            </div>

            <p className="text-sm text-blue-200 italic">
              💡 Tip: Join now to get exclusive early-bird benefits
            </p>
          </div>

          {/* Right Side - Form */}
          <div>
            <div className="bg-white rounded-2xl p-8 shadow-2xl">
              {!submitted ? (
                <>
                  <h3 className="text-2xl font-bold text-gray-900 mb-6">Get Started Today</h3>

                  <form onSubmit={handleSubmit} className="space-y-5">
                    {/* Name Input */}
                    <div>
                      <label className="block text-sm font-semibold text-gray-700 mb-2">
                        Full Name
                      </label>
                      <div className="relative">
                        <User size={20} className="absolute left-3 top-3 text-gray-400" />
                        <input
                          type="text"
                          value={name}
                          onChange={(e) => setName(e.target.value)}
                          placeholder="John Doe"
                          className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
                          required
                        />
                      </div>
                    </div>

                    {/* Email Input */}
                    <div>
                      <label className="block text-sm font-semibold text-gray-700 mb-2">
                        Email Address
                      </label>
                      <div className="relative">
                        <Mail size={20} className="absolute left-3 top-3 text-gray-400" />
                        <input
                          type="email"
                          value={email}
                          onChange={(e) => setEmail(e.target.value)}
                          placeholder="your@email.com"
                          className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
                          required
                        />
                      </div>
                    </div>

                    {/* Role Selection */}
                    <div>
                      <label className="block text-sm font-semibold text-gray-700 mb-2">
                        I am a
                      </label>
                      <div className="flex gap-3">
                        {[
                          { value: 'worker', label: 'Worker', icon: '👨‍💼' },
                          { value: 'organization', label: 'Organization', icon: '🏢' },
                        ].map((option) => (
                          <button
                            key={option.value}
                            type="button"
                            onClick={() => setRole(option.value)}
                            className={`flex-1 py-2 px-3 rounded-lg border-2 font-semibold transition-all duration-300 flex items-center justify-center gap-2 ${
                              role === option.value
                                ? 'border-blue-600 bg-blue-50 text-blue-600'
                                : 'border-gray-200 text-gray-600 hover:border-blue-300'
                            }`}
                          >
                            <span>{option.icon}</span>
                            {option.label}
                          </button>
                        ))}
                      </div>
                    </div>

                    {/* Submit Button */}
                    <button
                      type="submit"
                      className="w-full py-3 bg-gradient-to-r from-blue-600 to-purple-600 text-white font-bold rounded-lg hover:shadow-lg transition-all duration-300 transform hover:scale-105 flex items-center justify-center gap-2 group"
                    >
                      Join Now <ArrowRight size={20} className="group-hover:translate-x-1 transition-transform" />
                    </button>
                  </form>

                  <p className="text-xs text-gray-500 text-center mt-4">
                    By joining, you agree to our Terms & Privacy Policy
                  </p>
                </>
              ) : (
                <div className="text-center py-8">
                  <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4 animate-bounce">
                    <CheckCircle size={32} className="text-green-600" />
                  </div>
                  <h4 className="text-2xl font-bold text-gray-900 mb-2">Welcome! 🎉</h4>
                  <p className="text-gray-600 mb-4">Check your email for next steps</p>
                  <p className="text-sm text-gray-500">We'll be in touch shortly with exclusive resources</p>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}