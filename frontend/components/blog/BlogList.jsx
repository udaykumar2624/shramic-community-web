import BlogCard from "./BlogCard";

export default function BlogList() {

  const posts = []; // later this will come from API

  if (posts.length === 0) {
    return (
      <p className="text-gray-500">
        Blog posts will appear here once the API is connected.
      </p>
    );
  }

  return (
    <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
      {posts.map((post, index) => (
        <BlogCard
          key={index}
          slug={post.slug}
          title={post.title}
          excerpt={post.excerpt}
        />
      ))}
    </div>
  );
}