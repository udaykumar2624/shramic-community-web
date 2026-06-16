'use client';

import { Mail, Phone, MapPin, Share2, MessageCircle, Users, Camera, Heart } from 'lucide-react';

export default function Footer() {
  const currentYear = new Date().getFullYear();

  const footerSections = [
    {
      title: 'Product',
      links: ['Features', 'Pricing', 'Security', 'Enterprise', 'Customer stories'],
    },
    {
      title: 'Company',
      links: ['About Us', 'Blog', 'Careers', 'Press', 'Partners'],
    },
    {
      title: 'Resources',
      links: ['Documentation', 'API Reference', 'Community', 'Support', 'Status'],
    },
    {
      title: 'Legal',
      links: ['Privacy Policy', 'Terms of Service', 'Cookie Policy', 'GDPR', 'Compliance'],
    },
  ];

  return (
    <footer className="bg-gradient-to-b from-gray-900 to-black text-white">
      {/* Newsletter Section */}
      <div className="bg-gradient-to-r from-blue-600 to-purple-600 py-12">
        <div className="max-w-4xl mx-auto px-6 text-center">
          <h3 className="text-3xl font-bold mb-4">Stay Updated</h3>
          <p className="text-lg mb-6 text-blue-100">Get the latest news and opportunities delivered to your inbox</p>
          <div className="flex gap-3 max-w-md mx-auto">
            <input
              type="email"
              placeholder="your@email.com"
              className="flex-1 px-4 py-3 rounded-lg text-gray-900 focus:outline-none focus:ring-2 focus:ring-white"
            />
            <button className="px-6 py-3 bg-white text-blue-600 font-bold rounded-lg hover:shadow-lg transition-all duration-300 transform hover:scale-105">
              Subscribe
            </button>
          </div>
        </div>
      </div>

      {/* Main Footer */}
      <div className="max-w-7xl mx-auto px-6 py-16">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-8 mb-12">
          {/* Brand */}
          <div className="lg:col-span-1">
            <h2 className="text-3xl font-bold mb-4 flex items-center gap-2">
              <span className="w-10 h-10 bg-gradient-to-r from-blue-400 to-purple-400 rounded-lg flex items-center justify-center">S</span>
              Shramic
            </h2>
            <p className="text-gray-400 mb-6 leading-relaxed">
              Empowering workers with fair opportunities, transparent wages, and digital access.
            </p>
            {/* Social Links */}
            <div className="flex gap-4">
              {[
                { icon: Share2, label: 'Facebook' },
                { icon: MessageCircle, label: 'Twitter' },
                { icon: Users, label: 'LinkedIn' },
                { icon: Camera, label: 'Instagram' },
              ].map((social, idx) => (
                <a
                  key={idx}
                  href="#"
                  className="w-10 h-10 rounded-full bg-gray-800 flex items-center justify-center hover:bg-gradient-to-r hover:from-blue-600 hover:to-purple-600 transition-all duration-300 transform hover:scale-110"
                  title={social.label}
                >
                  <social.icon size={20} />
                </a>
              ))}
            </div>
          </div>

          {/* Footer Links */}
          {footerSections.map((section, idx) => (
            <div key={idx}>
              <h4 className="font-bold text-lg mb-4 text-white">{section.title}</h4>
              <ul className="space-y-3">
                {section.links.map((link, linkIdx) => (
                  <li key={linkIdx}>
                    <a
                      href="#"
                      className="text-gray-400 hover:text-white transition-colors duration-300 flex items-center gap-2 group"
                    >
                      <span className="w-1 h-1 bg-gray-600 rounded-full group-hover:bg-blue-400 transition-colors" />
                      {link}
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        {/* Contact Info */}
        <div className="border-t border-gray-800 py-12 mb-12">
          <div className="grid md:grid-cols-3 gap-8">
            <div className="flex gap-4 items-start group">
              <Mail size={24} className="text-blue-400 flex-shrink-0 mt-1 group-hover:scale-110 transition-transform" />
              <div>
                <p className="text-gray-400 text-sm">Email Us</p>
                <a href="mailto:support@shramic.com" className="text-white font-semibold hover:text-blue-400 transition-colors">
                  support@shramic.com
                </a>
              </div>
            </div>
            <div className="flex gap-4 items-start group">
              <Phone size={24} className="text-purple-400 flex-shrink-0 mt-1 group-hover:scale-110 transition-transform" />
              <div>
                <p className="text-gray-400 text-sm">Call Us</p>
                <a href="tel:+911234567890" className="text-white font-semibold hover:text-purple-400 transition-colors">
                  +91 (123) 456-7890
                </a>
              </div>
            </div>
            <div className="flex gap-4 items-start group">
              <MapPin size={24} className="text-pink-400 flex-shrink-0 mt-1 group-hover:scale-110 transition-transform" />
              <div>
                <p className="text-gray-400 text-sm">Visit Us</p>
                <p className="text-white font-semibold">India (Multiple Locations)</p>
              </div>
            </div>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="border-t border-gray-800 pt-8 flex flex-col md:flex-row justify-between items-center gap-4 text-gray-400">
          <p className="flex items-center gap-2">
            Made with <Heart size={18} className="text-red-500" /> for workers worldwide
          </p>
          <p>© {currentYear} Shramic Community Platform. All rights reserved.</p>
          <div className="flex gap-6">
            <a href="#" className="hover:text-white transition-colors">Privacy</a>
            <a href="#" className="hover:text-white transition-colors">Terms</a>
            <a href="#" className="hover:text-white transition-colors">Cookies</a>
          </div>
        </div>
      </div>
    </footer>
  );
}