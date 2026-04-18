export default function Loading() {
  return (
    <div className="bg-black min-h-screen text-white px-6 md:px-12 lg:px-24 py-16">
      <div className="animate-pulse space-y-8">

        <div className="h-10 bg-gray-800 rounded w-1/3 mx-auto"></div>

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-10 mt-16">
          {[1,2,3,4,5,6].map((i) => (
            <div key={i} className="bg-gray-900 rounded-2xl h-80"></div>
          ))}
        </div>

      </div>
    </div>
  );
}