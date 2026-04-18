type Props = {
  title: string;
  description: string;
};

export default function PlatformCard({ title, description }: Props) {
  return (
    <div className="border p-6 rounded-lg shadow">
      <h3 className="text-xl font-semibold">{title}</h3>
      <p className="mt-2 text-gray-600">{description}</p>
    </div>
  );
}