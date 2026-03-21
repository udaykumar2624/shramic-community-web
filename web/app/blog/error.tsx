"use client";

export default function Error() {
  return (
    <div className="min-h-screen bg-black text-white flex items-center justify-center">
      <div className="text-center">
        <h1 className="text-4xl font-bold mb-4">Something went wrong</h1>
        <p className="text-gray-400">
          Unable to load blog content. Please try again later.
        </p>
      </div>
    </div>
  );
}