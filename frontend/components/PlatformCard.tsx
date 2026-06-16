'use client';

import { useState } from 'react';

type Props = {
  title: string;
  description: string;
  icon?: React.ReactNode;
  features?: string[];
  link?: string;
};

export default function PlatformCard({ title, description, icon, features = [], link }: Props) {
  const [isHovered, setIsHovered] = useState(false);

  return (
    <div
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}
      className={`group relative overflow-hidden border border-gray-200 p-8 rounded-2xl shadow-md transition-all duration-500 cursor-pointer
        ${isHovered 
          ? 'shadow-2xl border-blue-400 bg-gradient-to-br from-blue-50 to-white scale-105' 
          : 'bg-white hover:border-blue-300'
        }`}
    >
      {/* Background gradient effect */}
      <div className={`absolute inset-0 bg-gradient-to-r from-blue-500/0 to-purple-500/0 transition-opacity duration-500 ${isHovered ? 'opacity-10' : 'opacity-0'}`} />
      
      <div className="relative z-10">
        {/* Icon */}
        {icon && (
          <div className={`mb-4 transition-transform duration-500 ${isHovered ? 'scale-110 text-blue-600' : 'text-gray-400'}`}>
            {icon}
          </div>
        )}

        {/* Title */}
        <h3 className={`text-xl font-bold transition-colors duration-300 ${isHovered ? 'text-blue-700' : 'text-gray-900'}`}>
          {title}
        </h3>

        {/* Description */}
        <p className="mt-3 text-gray-600 leading-relaxed transition-colors duration-300">
          {description}
        </p>

        {/* Features List */}
        {features.length > 0 && (
          <ul className={`mt-4 space-y-2 transition-all duration-500 overflow-hidden ${isHovered ? 'max-h-64 opacity-100' : 'max-h-0 opacity-0'}`}>
            {features.map((feature, idx) => (
              <li key={idx} className="text-sm text-gray-700 flex items-center">
                <span className="w-1.5 h-1.5 bg-blue-500 rounded-full mr-2" />
                {feature}
              </li>
            ))}
          </ul>
        )}

        {/* CTA Link */}
        {link && (
          <button className={`mt-6 px-4 py-2 rounded-lg font-medium transition-all duration-300 ${
            isHovered 
              ? 'bg-blue-600 text-white shadow-lg' 
              : 'bg-gray-100 text-gray-900 hover:bg-gray-200'
          }`}>
            Learn More →
          </button>
        )}

        {/* Hover indicator */}
        <div className={`absolute top-0 left-0 h-1 bg-gradient-to-r from-blue-500 to-purple-500 transition-all duration-500 ${isHovered ? 'w-full' : 'w-0'}`} />
      </div>
    </div>
  );
}