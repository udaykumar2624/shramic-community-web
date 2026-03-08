export default function BlogPost({ params }) {

  const slug = params?.slug || "blog-post";

  return (
    <div style={{ padding: "40px" }}>
      <h1>{slug.replace(/-/g, " ")}</h1>

      <p>
        This is the full blog post page for: <strong>{slug}</strong>
      </p>

      <p>
        Here we will later load the blog content from the CMS or backend API.
      </p>

      <a href="/blog">← Back to Blog</a>
    </div>
  );
}