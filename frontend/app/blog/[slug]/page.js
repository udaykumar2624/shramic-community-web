export default function BlogPost({ params }) {
  const slug = params?.slug || "blog-post";
  const title = slug.replace(/-/g, " ");

  return (
    <div className="max-w-3xl mx-auto p-10">
      <a href="/blog" className="text-blue-600 underline mb-6 inline-block">
        ← Back to Blog
      </a>

      <h1 className="text-4xl font-bold mb-6 capitalize">{title}</h1>

      <p className="text-gray-600 mb-6">
        This is a placeholder blog article. Once backend API integration is completed,
        this page will dynamically render real blog content.
      </p>

      <p className="text-gray-700 leading-relaxed">
        The Shramic platform focuses on improving labour transparency, fair wage
        distribution, and worker empowerment. This blog section will share
        industry insights, updates, and success stories.
      </p>
    </div>
  );
}