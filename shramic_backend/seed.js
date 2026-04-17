const mongoose = require("mongoose");
const dotenv = require("dotenv");
dotenv.config();

const Metric = require("./models/Metric");
const Story = require("./models/Story");
const Persona = require("./models/Persona");

const metrics = [
  {
    icon: "👷",
    value: "48,200",
    label: "Workers Protected via Fair Pricing Engine",
    color: "accent",
  },
  {
    icon: "💰",
    value: "₹12 Cr+",
    label: "Fair Wages Distributed This Year",
    color: "yellow",
  },
  {
    icon: "🏢",
    value: "320",
    label: "Organizations Using Fair Labour Standards",
    color: "accent",
  },
  {
    icon: "📍",
    value: "18",
    label: "States Covered Across India",
    color: "red",
  },
];

const stories = [
  {
    name: "Priya Sharma",
    role: "Textile Worker",
    location: "Surat, Gujarat",
    quote:
      "The wage calculator showed I was underpaid by 40%. After using this platform, my employer agreed to revise my salary.",
    impact: "+40% wage increase",
    avatarLetter: "P",
    avatarColor: "accent",
  },
  {
    name: "Ramesh Kumar",
    role: "Construction Contractor",
    location: "Delhi NCR",
    quote:
      "The pricing engine helped me quote fairly and win 3 new projects. Clients trust transparent pricing data.",
    impact: "3 new projects won",
    avatarLetter: "R",
    avatarColor: "yellow",
  },
  {
    name: "Amla NGO Trust",
    role: "Non-Profit Organization",
    location: "Chennai, Tamil Nadu",
    quote:
      "We use the dashboard metrics to report to donors and government bodies. The data is credible and always updated.",
    impact: "1200 workers helped",
    avatarLetter: "A",
    avatarColor: "red",
  },
  {
    name: "Sunita Devi",
    role: "Domestic Worker",
    location: "Pune, Maharashtra",
    quote:
      "For the first time I could see what a fair wage looks like for my work. I shared the report with my employer.",
    impact: "+28% wage increase",
    avatarLetter: "S",
    avatarColor: "blue",
  },
];

const personas = [
  {
    key: "worker",
    emoji: "👷",
    name: "The Worker",
    title: "Daily Wage / Skilled Labour",
    description:
      "A daily wage or skilled worker seeking to understand their fair market value.",
    painPoint: "Lack of transparent data on fair wages in their sector.",
    needs: [
      "Understand fair wage",
      "Compare with peers",
      "Generate proof document",
    ],
  },
  {
    key: "employer",
    emoji: "🏢",
    name: "The Employer",
    title: "SME / Contractor",
    description:
      "SME owners and contractors who want to offer competitive fair wages.",
    painPoint: "Balancing cost efficiency with fair pay obligations.",
    needs: [
      "Set fair budgets",
      "Stay legally compliant",
      "Build employee trust",
    ],
  },
  {
    key: "ngo",
    emoji: "🌱",
    name: "The NGO",
    title: "Community Org / Advocate",
    description:
      "Community organizations using the platform to monitor local labour conditions.",
    painPoint: "Credible real-time data for reporting to donors.",
    needs: ["Data for advocacy", "Track regional trends", "Train workers"],
  },
  {
    key: "policy",
    emoji: "⚖️",
    name: "The Policy Maker",
    title: "Government / Researcher",
    description:
      "Government officers and researchers who rely on Dashboard Metrics.",
    painPoint: "Fragmented outdated labour data from traditional sources.",
    needs: [
      "Sector wage analysis",
      "Geographic coverage data",
      "Policy impact metrics",
    ],
  },
];

async function seed() {
  await mongoose.connect(process.env.MONGO_URI);
  console.log("MongoDB connected");

  await Metric.deleteMany();
  await Story.deleteMany();
  await Persona.deleteMany();

  await Metric.insertMany(metrics);
  await Story.insertMany(stories);
  await Persona.insertMany(personas);

  console.log("✅ Metrics seeded");
  console.log("✅ Stories seeded");
  console.log("✅ Personas seeded");

  mongoose.disconnect();
  console.log("Done!");
}

seed().catch(console.error);
