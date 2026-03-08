import BlogLayout from "../../../components/blog/BlogLayout";

export default function BlogPost({ params }) {

  const slug = params?.slug || "blog-post";

  const title = slug
    .split("-")
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(" ");

  return (
    <BlogLayout>

      <h2 className="text-2xl font-semibold mb-6">
        {title}
      </h2>

      <p className="text-gray-600">
        This is a placeholder blog article. Once backend or CMS integration
        is ready, this page will fetch and render the full blog content.
      </p>

    </BlogLayout>
  );
}