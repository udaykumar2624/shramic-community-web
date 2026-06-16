'use client';

import { useEffect, useState } from 'react';
import { Users, Home, Calculator } from 'lucide-react';

export default function ImpactStats() {
  const [isVisible, setIsVisible] = useState(false);
  const [counts, setCounts] = useState({ workers: 0, communities: 0, calculations: 0 });

  useEffect(() => {
    const interval = setInterval(() => {
      setCounts(prev => ({
        workers: prev.workers < 50000 ? prev.workers + 1000 : 50000,
        communities: prev.communities < 500 ? prev.communities + 10 : 500,
        calculations: prev.calculations < 1000000 ? prev.calculations + 20000 : 1000000,
      }));
    }, 50);
    return () => clearInterval(interval);
  }, []);

  const stats = [
    {
      icon: <Users size={48} />,
      value: '50K+',
      label: 'Workers Connected',
      description: 'Active workers using our platform',
      color: 'from-blue-500 to-blue-600',
    },
    {
      icon: <Home size={48} />,
      value: '500+',
      label: 'Communities Supported',
      description: 'Communities empowered with digital tools',
      color: 'from-purple-500 to-purple-600',
    },
    {
      icon: <Calculator size={48} />,
      value: '1M+',
      label: 'Fair Wage Calculations',
      description: 'Transparent wage transactions processed',
      color: 'from-pink-500 to-pink-600',
    },
  ];

  return (
    <section className="relative py-20 bg-gradient-to-b from-gray-50 to-white overflow-hidden">
      {/* Animated background elements */}
      <div className="absolute top-10 right-10 w-72 h-72 bg-blue-100 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-pulse" />
      <div className="absolute bottom-10 left-10 w-72 h-72 bg-purple-100 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-pulse" />

      <div className="relative z-10 max-w-7xl mx-auto px-6">
        {/* Header */}
        <div className="text-center mb-16">
          <span className="inline-block px-4 py-2 bg-blue-100 text-blue-700 rounded-full text-sm font-semibold mb-4">
            Our Real Impact
          </span>
          <h2 className="text-5xl md:text-6xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-blue-600 to-purple-600 mb-4">
            Numbers That Matter
          </h2>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Transforming lives and communities through technology and fair opportunities
          </p>
        </div>

        {/* Stats Grid */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {stats.map((stat, idx) => (
            <div
              key={idx}
              className="group relative overflow-hidden rounded-2xl p-8 bg-white border border-gray-100 hover:border-blue-300 transition-all duration-500 hover:shadow-2xl hover:-translate-y-2"
            >
              {/* Gradient background */}
              <div className={`absolute inset-0 bg-gradient-to-br ${stat.color} opacity-0 group-hover:opacity-5 transition-opacity duration-500`} />

              {/* Content */}
              <div className="relative z-10">
                {/* Icon */}
                <div className={`inline-block p-4 rounded-2xl bg-gradient-to-br ${stat.color} text-white mb-4 group-hover:scale-110 transition-transform duration-300`}>
                  {stat.icon}
                </div>

                {/* Stats Value */}
                <h3 className={`text-5xl font-bold mb-2 transition-colors duration-300 ${
                  idx === 0 ? 'text-blue-600' : idx === 1 ? 'text-purple-600' : 'text-pink-600'
                }`}>
                  {stat.value}
                </h3>

                {/* Label */}
                <h4 className="text-xl font-bold text-gray-900 mb-2">
                  {stat.label}
                </h4>

                {/* Description */}
                <p className="text-gray-600 leading-relaxed mb-4">
                  {stat.description}
                </p>

                {/* Divider */}
                <div className={`h-1 w-12 bg-gradient-to-r ${stat.color} group-hover:w-full transition-all duration-500 rounded-full`} />
              </div>

              {/* Border animation */}
              <div className="absolute inset-0 rounded-2xl border-2 border-transparent group-hover:border-blue-300 transition-colors duration-500" />
            </div>
          ))}
        </div>

        {/* Bottom CTA */}
        <div className="mt-16 text-center">
          <p className="text-gray-600 mb-6">Join thousands of workers transforming their futures</p>
          <button className="px-8 py-4 bg-gradient-to-r from-blue-600 to-purple-600 text-white font-bold rounded-lg hover:shadow-2xl transition-all duration-300 transform hover:scale-105">
            Start Your Journey Today
          </button>
        </div>
      </div>
    </section>
  );
}