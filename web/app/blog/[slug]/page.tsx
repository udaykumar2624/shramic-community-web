async function getPosts() {
  const res = await fetch("http://localhost:5000/api/blog/posts", {
    cache: "no-store",
  });
  
  return res.json();
}

export default async function BlogPage() {
  const posts = await getPosts();

  return (
    <main className="bg-gradient-to-b from-slate-950 to-black min-h-screen text-white px-6 md:px-12 lg:px-24 py-16">

      <h1 className="text-5xl font-bold mb-12 text-center">
        Shramic Blog
      </h1>

      <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-10">
        {posts.map((post: any) => (
          <a href={`/blog/${post.slug}`} key={post.slug}>
            <div className="bg-white/5 border border-white/10 rounded-2xl overflow-hidden p-6 hover:scale-[1.03] transition cursor-pointer">

              <h2 className="text-xl font-bold mb-2">
                {post.title}
              </h2>

              <p className="text-slate-400 text-sm">
                {post.content.substring(0, 100)}...
              </p>

            </div>
          </a>
        ))}
      </div>

    </main>
  );
}