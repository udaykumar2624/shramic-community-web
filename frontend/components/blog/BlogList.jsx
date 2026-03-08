import BlogCard from "./BlogCard";

export default function BlogList() {

  const posts = [
    {
      slug: "empowering-workers",
      title: "Empowering Workers Through Shramic",
      excerpt: "How Shramic is helping workers get fair opportunities."
    },
    {
      slug: "fair-labour-pricing",
      title: "Fair Labour Pricing",
      excerpt: "Understanding how the Shramic pricing model works."
    },
    {
      slug: "community-impact",
      title: "Building Community Impact",
      excerpt: "How community platforms can improve worker livelihoods."
    }
  ];

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