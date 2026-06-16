import { notFound } from "next/navigation";

const localStories = {
  'women-led-farming-collective': {
    title: 'Women-Led Farming Collective Finds Fair Pay',
    content: 'A group of women farmers in Maharashtra found renewed opportunity after joining Shramic, helping them access steady contracts and transparent pricing. Their story highlights how fair pay can empower families and build trust in rural markets.',
  },
  'organic-village-labour-network': {
    title: 'Organic Village Labour Network Blossoms',
    content: 'A village cooperative adopted digital wage tracking and now shares profits more fairly across 120 workers. The new system improved trust, reduced disputes, and helped the network scale organically.',
  },
  'tech-training-boosts-income': {
    title: 'Tech Training Boosts Rural Income by 2x',
    content: 'Digital skill programs helped a young worker move from daily wages to field tech support with a stable salary. This story shows how training makes blue-collar work more sustainable.',
  },
};

async function getPost(slug: string) {
  const res = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/blog/posts/${slug}`,
    { cache: "no-store" }
  );

  if (res.ok) return res.json();
  if (localStories[slug]) return localStories[slug];
  return null;
}

export default async function BlogPost({ params }: any) {
  const { slug } = await params;

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
