import { notFound } from "next/navigation";

async function getPost(slug: string) {
  const res = await fetch(
    `http://localhost:5000/api/blog/posts/${slug}`,
    { cache: "no-store" }
  );

  if (!res.ok) return null;

  return res.json();
}

export default async function BlogPost({ params }: any) {
  const { slug } = await params;  // ⭐ IMPORTANT FIX

  const post = await getPost(slug);

  if (!post) return notFound();

  return (
    <main className="bg-black min-h-screen text-white px-6 py-12">

      <h1 className="text-4xl font-bold mb-6">
        {post.title}
      </h1>

      <p className="text-gray-300 text-lg leading-relaxed">
        {post.content}
      </p>

    </main>
  );
}