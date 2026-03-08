import Link from "next/link";

export default function BlogCard({ title, excerpt, slug }) {
  return (
   <div className="border rounded-xl p-6 shadow-sm hover:shadow-lg transition duration-300 hover:-translate-y-1">
      <h2 className="text-xl font-semibold mb-2">{title}</h2>

      <p className="text-gray-600 mb-4">{excerpt}</p>

      <Link
        href={`/blog/${slug}`}
        className="text-blue-600 font-medium hover:underline"
      >
        Read More →
      </Link>
    </div>
  );
}