export default function Home() {
  return (
    <main className="min-h-screen flex flex-col items-center justify-center bg-white">
      <h1 className="text-5xl font-bold text-black">
        Shramic Community Website
      </h1>

      <p className="mt-6 text-lg text-gray-600">
        Blog module integrated successfully.
      </p>

      <a
        href="/blog"
        className="mt-8 px-6 py-3 bg-black text-white rounded-lg"
      >
        Go to Blog
      </a>
    </main>
  );
}