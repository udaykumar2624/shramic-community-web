import PlatformCard from "../../components/PlatformCard";

export default function Ecosystem() {
  return (
    <main className="p-10">

      <section className="text-center mb-12">
        <h1 className="text-4xl font-bold">
          Shramic Ecosystem
        </h1>

        <p className="mt-4 text-gray-600">
          Our ecosystem connects workers, communities, and digital platforms
          to create transparency and fair labour pricing.
        </p>
      </section>

      <section className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

        <PlatformCard
          title="Worker Platform"
          description="Connect rural workers to digital job opportunities."
        />

        <PlatformCard
          title="Community Network"
          description="Enable collaboration and support among workers."
        />

        <PlatformCard
          title="Fair Pricing Engine"
          description="Transparent wage calculation and labour pricing."
        />

        <PlatformCard
          title="Skill Development"
          description="Access to training and digital education resources."
        />

        <PlatformCard
          title="Digital Access"
          description="Technology tools for rural and unorganised workers."
        />

      </section>

    </main>
  );
}