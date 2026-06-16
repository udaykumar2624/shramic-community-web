'use client';

import { FormEvent, useState } from 'react';
import Link from 'next/link';
import PlatformCard from "../../components/PlatformCard";
import { Users, Briefcase, TrendingUp, BookOpen, Wifi, ArrowRight } from 'lucide-react';

export default function Ecosystem() {
  const [activeTab, setActiveTab] = useState('overview');
  const [selectedFeature, setSelectedFeature] = useState(0);
  const [subscriptionEmail, setSubscriptionEmail] = useState('');
  const [subscribed, setSubscribed] = useState(false);

  const handleSubscribe = (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    if (subscriptionEmail.trim()) {
      setSubscribed(true);
      setSubscriptionEmail('');
    }
  };

  const ecosystemStats = [
    { label: 'Active Workers', value: '50K+', icon: '👥' },
    { label: 'Job Opportunities', value: '10K+', icon: '💼' },
    { label: 'Partner Organizations', value: '500+', icon: '🤝' },
    { label: 'Transactions', value: '$5M+', icon: '💰' },
  ];

  const platformFeatures = [
    {
      title: "Worker Platform",
      description: "Empower rural workers with direct access to digital job opportunities and skill monetization.",
      icon: <Users size={32} />,
      features: ['Job Discovery', 'Profile Management', 'Real-time Notifications', 'Earnings Dashboard'],
      link: '#',
    },
    {
      title: "Community Network",
      description: "Build collaborative communities where workers support each other through knowledge sharing.",
      icon: <Users size={32} />,
      features: ['Peer Support', 'Group Discussions', 'Community Events', 'Mentorship Programs'],
      link: '#',
    },
    {
      title: "Fair Pricing Engine",
      description: "Ensure transparent, equitable wage calculation using AI-powered analytics.",
      icon: <TrendingUp size={32} />,
      features: ['Real-time Pricing', 'Market Analysis', 'Wage Transparency', 'Rate Comparisons'],
      link: '#',
    },
    {
      title: "Skill Development",
      description: "Access comprehensive training programs and certifications for career advancement.",
      icon: <BookOpen size={32} />,
      features: ['Online Courses', 'Certifications', 'Expert Mentors', 'Skill Tracking'],
      link: '#',
    },
    {
      title: "Digital Access",
      description: "Bridge the digital divide with tools designed for rural and unorganized workers.",
      icon: <Wifi size={32} />,
      features: ['Offline Support', 'Low-bandwidth Tools', 'Mobile First', 'Accessibility'],
      link: '#',
    },
    {
      title: "Enterprise Solutions",
      description: "Streamlined recruitment and workforce management for businesses.",
      icon: <Briefcase size={32} />,
      features: ['Talent Recruitment', 'Worker Management', 'Analytics Dashboard', 'Integration APIs'],
      link: '#',
    },
  ];

  return (
    <main className="bg-gradient-to-b from-white to-gray-50 min-h-screen">
      
      {/* Hero Section */}
      <section className="relative overflow-hidden px-6 md:px-12 py-20 md:py-32">
        {/* Animated background shapes */}
        <div className="absolute top-0 right-0 w-96 h-96 bg-blue-100 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-pulse" />
        <div className="absolute bottom-0 left-0 w-96 h-96 bg-purple-100 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-pulse" />
        
        <div className="relative z-10 max-w-4xl mx-auto text-center">
          <div className="inline-block mb-6">
            <span className="px-4 py-2 bg-blue-100 text-blue-700 rounded-full text-sm font-semibold hover:bg-blue-200 transition-colors cursor-pointer">
              Our Unified Platform
            </span>
          </div>

          <h1 className="text-5xl md:text-7xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-blue-600 to-purple-600 mb-6 leading-tight">
            The Complete Worker Ecosystem
          </h1>

          <p className="text-xl text-gray-600 mb-8 leading-relaxed">
            Connecting workers, communities, and organizations through a transparent, fair, and 
            empowering digital ecosystem that brings dignity and opportunity to every participant.
          </p>

          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/join-community" className="px-8 py-4 bg-gradient-to-r from-blue-600 to-purple-600 text-white font-bold rounded-lg hover:shadow-2xl transition-all duration-300 transform hover:scale-105 flex items-center justify-center gap-2">
              Get Started <ArrowRight size={20} />
            </Link>
            <Link href="/about" className="px-8 py-4 border-2 border-gray-300 text-gray-700 font-bold rounded-lg hover:border-blue-600 hover:text-blue-600 transition-colors duration-300">
              Learn More
            </Link>
          </div>
        </div>
      </section>

      {/* Stats Section */}
      <section className="px-6 md:px-12 py-16">
        <div className="max-w-6xl mx-auto">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
            {ecosystemStats.map((stat, idx) => (
              <div
                key={idx}
                className="p-6 bg-white border border-gray-200 rounded-2xl text-center hover:shadow-lg transition-all duration-300 transform hover:-translate-y-2"
              >
                <div className="text-4xl mb-2">{stat.icon}</div>
                <div className="text-3xl font-bold text-blue-600 mb-2">{stat.value}</div>
                <div className="text-gray-600 font-medium">{stat.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Tab Navigation */}
      <section className="px-6 md:px-12 py-8 max-w-6xl mx-auto">
        <div className="flex gap-2 overflow-x-auto pb-4 border-b border-gray-200">
          {['overview', 'features'].map((tab) => (
            <button
              key={tab}
              onClick={() => setActiveTab(tab)}
              className={`px-6 py-3 font-semibold whitespace-nowrap transition-all duration-300 capitalize ${
                activeTab === tab
                  ? 'text-blue-600 border-b-2 border-blue-600'
                  : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              {tab}
            </button>
          ))}
        </div>
      </section>

      {/* Main Content Section */}
      <section className="px-6 md:px-12 py-16">
        <div className="max-w-6xl mx-auto">
          
          {activeTab === 'overview' && (
            <div className="space-y-12 animate-fadeIn">
              <div className="prose prose-lg max-w-none">
                <h2 className="text-3xl font-bold mb-6 text-gray-900">
                  How Our Ecosystem Works
                </h2>
                
                <div className="grid md:grid-cols-3 gap-8 mt-8">
                  {[
                    {
                      step: '01',
                      title: 'Join & Register',
                      desc: 'Workers sign up and create comprehensive profiles showcasing their skills and experience.'
                    },
                    {
                      step: '02',
                      title: 'Discover & Connect',
                      desc: 'Browse opportunities aligned with skills, connect with communities, and network professionally.'
                    },
                    {
                      step: '03',
                      title: 'Earn & Grow',
                      desc: 'Secure fair wages, develop new skills, and advance your career with our platform support.'
                    },
                  ].map((item, idx) => (
                    <div
                      key={idx}
                      className="p-8 bg-white border-2 border-gray-100 rounded-2xl hover:border-blue-300 hover:shadow-xl transition-all duration-300 group"
                    >
                      <div className="text-5xl font-bold text-blue-200 group-hover:text-blue-400 transition-colors mb-4">
                        {item.step}
                      </div>
                      <h3 className="text-xl font-bold mb-3 text-gray-900">{item.title}</h3>
                      <p className="text-gray-600 leading-relaxed">{item.desc}</p>
                    </div>
                  ))}
                </div>
              </div>
            </div>
          )}

          {activeTab === 'features' && (
            <div className="space-y-8 animate-fadeIn">
              <h2 className="text-3xl font-bold text-gray-900 mb-8">
                Platform Features & Capabilities
              </h2>
              
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {platformFeatures.map((feature, idx) => (
                  <PlatformCard
                    key={idx}
                    title={feature.title}
                    description={feature.description}
                    icon={feature.icon}
                    features={feature.features}
                    link={feature.link}
                  />
                ))}
              </div>
            </div>
          )}
        </div>
      </section>

      {/* Integration Section */}
      <section className="px-6 md:px-12 py-16 bg-gradient-to-r from-blue-50 to-purple-50">
        <div className="max-w-6xl mx-auto">
          <h2 className="text-3xl font-bold text-gray-900 mb-12 text-center">
            Seamless Integration
          </h2>
          
          <div className="grid md:grid-cols-2 gap-8">
            <div className="space-y-6">
              <h3 className="text-2xl font-bold text-gray-900">For Workers</h3>
              <ul className="space-y-4">
                {[
                  'Mobile app for on-the-go access',
                  'Real-time earnings tracking',
                  'Skill verification badges',
                  'Community-driven support',
                  'Payment options flexibility',
                ].map((item, idx) => (
                  <li key={idx} className="flex gap-3 items-start group">
                    <span className="w-6 h-6 bg-blue-500 text-white rounded-full flex items-center justify-center flex-shrink-0 group-hover:bg-purple-500 transition-colors">
                      ✓
                    </span>
                    <span className="text-gray-700 group-hover:text-gray-900 transition-colors">{item}</span>
                  </li>
                ))}
              </ul>
            </div>

            <div className="space-y-6">
              <h3 className="text-2xl font-bold text-gray-900">For Organizations</h3>
              <ul className="space-y-4">
                {[
                  'Advanced talent search & filtering',
                  'Workforce analytics dashboard',
                  'Custom deployment solutions',
                  'API & webhook integrations',
                  'Dedicated account management',
                ].map((item, idx) => (
                  <li key={idx} className="flex gap-3 items-start group">
                    <span className="w-6 h-6 bg-purple-500 text-white rounded-full flex items-center justify-center flex-shrink-0 group-hover:bg-blue-500 transition-colors">
                      ✓
                    </span>
                    <span className="text-gray-700 group-hover:text-gray-900 transition-colors">{item}</span>
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="px-6 md:px-12 py-20">
        <div className="max-w-4xl mx-auto bg-gradient-to-r from-blue-600 to-purple-600 rounded-3xl p-12 md:p-16 text-center text-white shadow-2xl">
          <h2 className="text-4xl font-bold mb-6">Ready to Join Our Ecosystem?</h2>
          <p className="text-lg mb-8 text-blue-100">
            Be part of a movement transforming how workers connect, earn, and grow.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/signin" className="px-8 py-3 bg-white text-blue-600 font-bold rounded-lg hover:shadow-xl transition-all duration-300 transform hover:scale-105">
              Start Your Journey
            </Link>
            <Link href="/contact" className="px-8 py-3 border-2 border-white text-white font-bold rounded-lg hover:bg-white hover:text-blue-600 transition-all duration-300">
              Contact Sales
            </Link>
          </div>
        </div>
      </section>

      {/* Subscribe Section */}
      <section className="px-6 md:px-12 pb-24">
        <div className="max-w-4xl mx-auto bg-white rounded-3xl p-10 shadow-2xl">
          <div className="text-center mb-8">
            <p className="text-sm font-semibold uppercase text-blue-600">Stay connected</p>
            <h2 className="text-3xl font-bold text-slate-900 mt-3">Subscribe for ecosystem updates</h2>
            <p className="text-gray-600 mt-3">Receive monthly stories, new program launches, and worker success updates.</p>
          </div>

          <form onSubmit={handleSubscribe} className="flex flex-col sm:flex-row gap-4 items-center justify-center">
            <input
              value={subscriptionEmail}
              onChange={(e) => setSubscriptionEmail(e.target.value)}
              type="email"
              placeholder="Enter your email"
              className="w-full sm:flex-1 rounded-2xl border border-slate-200 px-6 py-4 focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            <button
              type="submit"
              className="w-full sm:w-auto px-8 py-4 rounded-2xl bg-blue-600 text-white font-semibold hover:bg-blue-700 transition"
            >
              Subscribe
            </button>
          </form>

          {subscribed && (
            <p className="mt-5 text-center text-green-600 font-medium">
              Thanks for subscribing! We will send updates soon.
            </p>
          )}
        </div>
      </section>

      <style jsx>{`
        @keyframes fadeIn {
          from {
            opacity: 0;
            transform: translateY(10px);
          }
          to {
            opacity: 1;
            transform: translateY(0);
          }
        }
        .animate-fadeIn {
          animation: fadeIn 0.5s ease-out;
        }
      `}</style>
    </main>
  );
}