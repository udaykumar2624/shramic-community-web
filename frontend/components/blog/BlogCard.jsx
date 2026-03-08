export default function BlogCard({ title, excerpt, slug }) {
  return (
    <div style={{border:"1px solid #ccc", padding:"16px", marginBottom:"12px"}}>
      <h2>{title}</h2>
      <p>{excerpt}</p>

      <a href={`/blog/${slug}`}>
        Read More →
      </a>
    </div>
  );
}