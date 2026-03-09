import Link from "next/link";

export default function Navbar() {
  return (
    <nav className="flex justify-between items-center p-4 bg-black text-white">
      <h1 className="text-xl font-bold">Shramic</h1>

      <div className="flex gap-6">
        <Link href="/">Home</Link>
        <Link href="/ecosystem">Ecosystem</Link>
        <Link href="/blog">Blog</Link>
      </div>
    </nav>
  );
}