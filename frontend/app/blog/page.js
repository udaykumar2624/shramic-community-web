import Link from "next/link";

const posts = [
  {
    slug: "fair-wage-system",
    title: "Fair Wage System",
    desc: "Transparent labour pricing for workers.",
  },
  {
    slug: "shramic-community",
    title: "Shramic Community",
    desc: "Connecting labour ecosystem digitally.",
  },
];

export default function BlogPage() {
  return (
    <div className="p-10">
      <h1 className="text-4xl font-bold mb-6">Blog</h1>

      <div className="grid md:grid-cols-2 gap-6">
        {posts.map((post) => (
          <Link href={`/blog/${post.slug}`} key={post.slug}>
            <div className="border rounded-lg p-6 hover:shadow cursor-pointer">
              <h2 className="text-2xl font-semibold">{post.title}</h2>
              <p className="text-gray-600 mt-2">{post.desc}</p>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
}