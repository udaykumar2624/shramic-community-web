export default function BlogLayout({ children }) {
  return (
    <div className="max-w-6xl mx-auto px-6 py-12">

      <div className="mb-10">
        <h1 className="text-3xl font-bold">
          Shramic Blog
        </h1>

        <p className="text-gray-600 mt-2">
          Insights, updates, and stories from the Shramic community.
        </p>
      </div>

      {children}

    </div>
  );
}