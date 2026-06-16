'use client';

import { useState } from 'react';
import { ChevronLeft, ChevronRight, Star } from 'lucide-react';

export default function Testimonials() {
  const [currentSlide, setCurrentSlide] = useState(0);

  const testimonials = [
    {
      name: 'Priya Sharma',
      role: 'Agricultural Worker',
      location: 'Rajasthan',
      image: '👩‍🌾',
      quote: 'Shramic helped me find fair-paying opportunities and connect with other workers. My monthly earnings doubled!',
      rating: 5,
      highlight: 'Earnings doubled',
    },
    {
      name: 'Rajesh Kumar',
      role: 'Skilled Technician',
      location: 'Gujarat',
      image: '👨‍🔧',
      quote: 'The skill development courses helped me get certified and access better job opportunities. The platform is transparent and fair.',
      rating: 5,
      highlight: 'Got certified',
    },
    {
      name: 'Anita Devi',
      role: 'Community Leader',
      location: 'Bihar',
      image: '👩‍💼',
      quote: 'Our entire community is now connected through Shramic. We support each other and have collective bargaining power.',
      rating: 5,
      highlight: 'Community empowered',
    },
    {
      name: 'Vikram Singh',
      role: 'Digital Entrepreneur',
      location: 'Madhya Pradesh',
      image: '👨‍💻',
      quote: 'I trained as a digital worker through the platform and now earn 3x my previous income. Truly transformative!',
      rating: 5,
      highlight: 'Income tripled',
    },
  ];

  const nextSlide = () => {
    setCurrentSlide((prev) => (prev + 1) % testimonials.length);
  };

  const prevSlide = () => {
    setCurrentSlide((prev) => (prev - 1 + testimonials.length) % testimonials.length);
  };

  return (
    <section className="py-20 bg-gradient-to-b from-white to-gray-50">
      <div className="max-w-7xl mx-auto px-6">
        {/* Header */}
        <div className="text-center mb-16">
          <span className="inline-block px-4 py-2 bg-purple-100 text-purple-700 rounded-full text-sm font-semibold mb-4">
            Community Stories
          </span>
          <h2 className="text-5xl md:text-6xl font-bold mb-4">
            <span className="bg-clip-text text-transparent bg-gradient-to-r from-blue-600 to-purple-600">
              Voices of Change
            </span>
          </h2>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Real stories from workers whose lives have been transformed through the Shramic platform
          </p>
        </div>

        {/* Testimonials Carousel */}
        <div className="relative">
          {/* Main Testimonial Card */}
          <div className="bg-white rounded-3xl shadow-2xl p-12 md:p-16 mb-8 border border-gray-100 hover:shadow-2xl transition-shadow duration-300">
            <div className="grid md:grid-cols-2 gap-12 items-center">
              {/* Left - Avatar & Stats */}
              <div className="text-center md:text-left">
                <div className="text-8xl mb-6 inline-block md:inline">
                  {testimonials[currentSlide].image}
                </div>
                <div className="mt-6">
                  <h3 className="text-3xl font-bold text-gray-900 mb-2">
                    {testimonials[currentSlide].name}
                  </h3>
                  <p className="text-xl text-blue-600 font-semibold mb-1">
                    {testimonials[currentSlide].role}
                  </p>
                  <p className="text-gray-600 flex items-center justify-center md:justify-start gap-2">
                    📍 {testimonials[currentSlide].location}
                  </p>

                  {/* Rating */}
                  <div className="flex gap-1 mt-4 justify-center md:justify-start">
                    {Array(testimonials[currentSlide].rating)
                      .fill(0)
                      .map((_, i) => (
                        <Star
                          key={i}
                          size={24}
                          className="fill-yellow-400 text-yellow-400"
                        />
                      ))}
                  </div>
                </div>
              </div>

              {/* Right - Quote */}
              <div>
                <div className="text-6xl text-blue-200 mb-4">"</div>
                <p className="text-2xl text-gray-800 leading-relaxed mb-6 italic font-medium">
                  {testimonials[currentSlide].quote}
                </p>
                <div className="inline-block px-6 py-3 bg-gradient-to-r from-blue-100 to-purple-100 rounded-full">
                  <span className="text-sm font-bold text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-purple-600">
                    ✨ {testimonials[currentSlide].highlight}
                  </span>
                </div>
              </div>
            </div>
          </div>

          {/* Navigation */}
          <div className="flex items-center justify-between">
            <button
              onClick={prevSlide}
              className="w-12 h-12 rounded-full bg-gradient-to-r from-blue-600 to-purple-600 text-white flex items-center justify-center hover:shadow-lg transition-all duration-300 transform hover:scale-110 group"
            >
              <ChevronLeft size={24} className="group-hover:-translate-x-1 transition-transform" />
            </button>

            {/* Dots */}
            <div className="flex gap-2">
              {testimonials.map((_, idx) => (
                <button
                  key={idx}
                  onClick={() => setCurrentSlide(idx)}
                  className={`h-3 rounded-full transition-all duration-300 ${
                    idx === currentSlide
                      ? 'w-8 bg-blue-600'
                      : 'w-3 bg-gray-300 hover:bg-gray-400'
                  }`}
                />
              ))}
            </div>

            <button
              onClick={nextSlide}
              className="w-12 h-12 rounded-full bg-gradient-to-r from-blue-600 to-purple-600 text-white flex items-center justify-center hover:shadow-lg transition-all duration-300 transform hover:scale-110 group"
            >
              <ChevronRight size={24} className="group-hover:translate-x-1 transition-transform" />
            </button>
          </div>

          {/* Stats Under Carousel */}
          <div className="grid grid-cols-3 gap-4 mt-12">
            {[
              { number: '95%', label: 'Satisfaction Rate' },
              { number: '50K+', label: 'Happy Workers' },
              { number: '4.9/5', label: 'Average Rating' },
            ].map((stat, idx) => (
              <div
                key={idx}
                className="p-6 bg-white rounded-2xl border border-gray-200 text-center hover:shadow-lg transition-all duration-300"
              >
                <div className="text-3xl font-bold text-blue-600 mb-2">{stat.number}</div>
                <p className="text-gray-600 font-medium">{stat.label}</p>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}