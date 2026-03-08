import BlogCard from "./BlogCard";

const posts = [
  {
    title: "Fair Labour Practices",
    excerpt: "Understanding fair labour systems and ethical work models.",
    slug: "fair-labour-practices",
  },
  {
    title: "Shramic Community Impact",
    excerpt: "How Shramic is helping workers across industries.",
    slug: "shramic-community-impact",
  },
];

export default function BlogList() {
  return (
    <div>
      {posts.map((post) => (
        <BlogCard
          key={post.slug}
          title={post.title}
          excerpt={post.excerpt}
          slug={post.slug}
        />
      ))}
    </div>
  );
}