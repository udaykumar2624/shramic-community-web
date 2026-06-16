'use client';

import Link from "next/link";
import { useEffect, useState } from "react";
import { Menu, X } from "lucide-react";

export default function Navbar() {
  const [isOpen, setIsOpen] = useState(false);
  const [isScrolled, setIsScrolled] = useState(false);

  const navItems = [
    { label: 'Home', href: '/' },
    { label: 'Ecosystem', href: '/ecosystem' },
    { label: 'Blog', href: '/blog' },
    { label: 'About', href: '/about' },
    { label: 'Contact', href: '/contact' },
  ];

  useEffect(() => {
    const onScroll = () => setIsScrolled(window.scrollY > 20);
    window.addEventListener('scroll', onScroll);
    return () => window.removeEventListener('scroll', onScroll);
  }, []);

  return (
    <nav className={`sticky top-0 z-50 transition-all duration-300 ${
      isScrolled 
        ? 'bg-white shadow-lg' 
        : 'bg-gradient-to-r from-blue-600 to-purple-600'
    }`}>
      <div className="max-w-7xl mx-auto px-6 py-4">
        <div className="flex justify-between items-center">
          {/* Logo */}
          <Link href="/" className="flex items-center gap-2 group">
            <div className="w-10 h-10 bg-white rounded-lg flex items-center justify-center group-hover:scale-110 transition-transform">
              <span className="text-xl font-bold text-blue-600">S</span>
            </div>
            <span className={`text-2xl font-bold transition-colors ${
              isScrolled ? 'text-gray-900' : 'text-white'
            }`}>
              Shramic
            </span>
          </Link>

          {/* Desktop Menu */}
          <div className={`hidden md:flex gap-8 items-center ${
            isScrolled ? 'text-gray-700' : 'text-white'
          }`}>
            {navItems.map((item, idx) => (
              <Link
                key={idx}
                href={item.href}
                className="relative group font-medium transition-colors hover:text-opacity-80"
              >
                {item.label}
                <span className={`absolute bottom-0 left-0 w-0 h-0.5 bg-current transition-all duration-300 group-hover:w-full ${
                  isScrolled ? 'bg-blue-600' : 'bg-white'
                }`} />
              </Link>
            ))}
          </div>

          {/* CTA Buttons */}
          <div className="hidden md:flex gap-3 items-center">
            <Link href="/signin" className={`px-4 py-2 rounded-lg font-medium transition-all duration-300 ${
              isScrolled
                ? 'border border-blue-600 text-blue-600 hover:bg-blue-50'
                : 'border border-white text-white hover:bg-white/10'
            }`}>
              Sign In
            </Link>
            <Link href="/join-community" className={`px-6 py-2 rounded-lg font-bold transition-all duration-300 ${
              isScrolled
                ? 'bg-gradient-to-r from-blue-600 to-purple-600 text-white hover:shadow-lg'
                : 'bg-white text-blue-600 hover:shadow-lg'
            }`}>
              Join Now
            </Link>
          </div>

          {/* Mobile Menu Button */}
          <button
            onClick={() => setIsOpen(!isOpen)}
            className={`md:hidden p-2 rounded-lg transition-colors ${
              isScrolled ? 'text-gray-900' : 'text-white'
            }`}
          >
            {isOpen ? <X size={24} /> : <Menu size={24} />}
          </button>
        </div>

        {/* Mobile Menu */}
        {isOpen && (
          <div className={`md:hidden mt-4 pb-4 space-y-3 animate-fadeIn ${
            isScrolled ? 'text-gray-700' : 'text-white'
          }`}>
            {navItems.map((item, idx) => (
              <Link
                key={idx}
                href={item.href}
                className="block py-2 px-4 rounded-lg hover:bg-white/10 transition-colors"
              >
                {item.label}
              </Link>
            ))}
            <div className="flex gap-2 pt-4">
              <Link href="/signin" className="flex-1 px-4 py-2 border rounded-lg text-center hover:bg-white/10 transition-colors">
                Sign In
              </Link>
              <Link href="/join-community" className="flex-1 px-4 py-2 bg-white text-blue-600 rounded-lg font-bold text-center hover:shadow-lg transition-all">
                Join Now
              </Link>
            </div>
          </div>
        )}
      </div>
    </nav>
  );
}