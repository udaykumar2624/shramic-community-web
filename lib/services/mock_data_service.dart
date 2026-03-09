import 'package:flutter/material.dart';
import '../models/metric_model.dart';
import '../models/story_model.dart';
import '../models/persona_model.dart';
import '../models/eco_node_model.dart';

class MockDataService {
  static List<MetricModel> getMetrics() {
    return const [
      MetricModel(
        icon: '👷',
        value: '48,200',
        label: 'Workers Protected via Fair Pricing Engine',
        color: 'accent',
      ),
      MetricModel(
        icon: '💰',
        value: '₹12 Cr+',
        label: 'Fair Wages Distributed This Year',
        color: 'yellow',
      ),
      MetricModel(
        icon: '🏢',
        value: '320',
        label: 'Organizations Using Fair Labour Standards',
        color: 'accent',
      ),
      MetricModel(
        icon: '📍',
        value: '18',
        label: 'States Covered Across India',
        color: 'red',
      ),
    ];
  }

  static List<StoryModel> getStories() {
    return const [
      StoryModel(
        id: '1',
        name: 'Priya Sharma',
        role: 'Textile Worker',
        location: 'Surat, Gujarat',
        quote:
            'The wage calculator showed I was underpaid by 40%. After using this platform, my employer agreed to revise my salary.',
        impact: '+40% wage increase',
        avatarLetter: 'P',
        avatarColor: 'accent',
      ),
      StoryModel(
        id: '2',
        name: 'Ramesh Kumar',
        role: 'Construction Contractor',
        location: 'Delhi NCR',
        quote:
            'The pricing engine helped me quote fairly and win 3 new projects. Clients trust transparent pricing data.',
        impact: '3 new projects won',
        avatarLetter: 'R',
        avatarColor: 'yellow',
      ),
      StoryModel(
        id: '3',
        name: 'Amla NGO Trust',
        role: 'Non-Profit Organization',
        location: 'Chennai, Tamil Nadu',
        quote:
            'We use the dashboard metrics to report to donors and government bodies. The data is credible and always updated.',
        impact: '1200 workers helped',
        avatarLetter: 'A',
        avatarColor: 'red',
      ),
      StoryModel(
        id: '4',
        name: 'Sunita Devi',
        role: 'Domestic Worker',
        location: 'Pune, Maharashtra',
        quote:
            'For the first time I could see what a fair wage looks like for my work. I shared the report with my employer.',
        impact: '+28% wage increase',
        avatarLetter: 'S',
        avatarColor: 'blue',
      ),
    ];
  }

  static List<PersonaModel> getPersonas() {
    return const [
      PersonaModel(
        key: 'worker',
        emoji: '👷',
        name: 'The Worker',
        title: 'Daily Wage / Skilled Labour',
        description:
            'A daily wage or skilled worker seeking to understand their fair market value. They use the Wage Calculator to compare against industry benchmarks.',
        painPoint: 'Lack of transparent data on fair wages in their sector.',
        needs: [
          'Understand fair wage',
          'Compare with peers',
          'Generate proof document',
        ],
      ),
      PersonaModel(
        key: 'employer',
        emoji: '🏢',
        name: 'The Employer',
        title: 'SME / Contractor',
        description:
            'SME owners and contractors who want to offer competitive fair wages to attract talent and stay legally compliant.',
        painPoint: 'Balancing cost efficiency with fair pay obligations.',
        needs: [
          'Set fair budgets',
          'Stay legally compliant',
          'Build employee trust',
        ],
      ),
      PersonaModel(
        key: 'ngo',
        emoji: '🌱',
        name: 'The NGO',
        title: 'Community Org / Advocate',
        description:
            'Community organizations using the platform to monitor local labour conditions and train workers on their rights.',
        painPoint: 'Credible real-time data for reporting to donors.',
        needs: [
          'Data for advocacy',
          'Track regional trends',
          'Train workers',
        ],
      ),
      PersonaModel(
        key: 'policy',
        emoji: '⚖️',
        name: 'The Policy Maker',
        title: 'Government / Researcher',
        description:
            'Government officers and researchers who rely on Dashboard Metrics to understand wage trends and design effective policies.',
        painPoint: 'Fragmented outdated labour data from traditional sources.',
        needs: [
          'Sector wage analysis',
          'Geographic coverage data',
          'Policy impact metrics',
        ],
      ),
    ];
  }

  static List<EcoNodeModel> getEcoNodes() {
    return [
      EcoNodeModel(
        id: 'platform',
        emoji: '🌐',
        label: 'Platform',
        description:
            'The central FairWork platform connecting all stakeholders with transparent labour data and tools.',
        connections: ['workers', 'ngo', 'employers', 'government', 'unions'],
        color: const Color(0xFF3DFFA0),
        x: 0.5,
        y: 0.45,
        size: 80,
      ),
      EcoNodeModel(
        id: 'workers',
        emoji: '👷',
        label: 'Workers',
        description:
            'Daily wage and skilled workers who use the platform to understand fair wages and negotiate better pay.',
        connections: ['platform', 'unions'],
        color: const Color(0xFFFFCD3D),
        x: 0.2,
        y: 0.2,
        size: 65,
      ),
      EcoNodeModel(
        id: 'ngo',
        emoji: '🌱',
        label: 'NGOs',
        description:
            'Community organizations that advocate for workers rights and use platform data for reporting.',
        connections: ['platform', 'workers', 'government'],
        color: const Color(0xFF8AB4FF),
        x: 0.78,
        y: 0.18,
        size: 62,
      ),
      EcoNodeModel(
        id: 'employers',
        emoji: '🏢',
        label: 'Employers',
        description:
            'SMEs and contractors who use fair pricing engine to set compliant wages and build trust.',
        connections: ['platform', 'workers'],
        color: const Color(0xFFFF6B6B),
        x: 0.15,
        y: 0.72,
        size: 62,
      ),
      EcoNodeModel(
        id: 'government',
        emoji: '⚖️',
        label: 'Government',
        description:
            'Policy makers who use dashboard metrics to design minimum wage policies and track compliance.',
        connections: ['platform', 'ngo'],
        color: const Color(0xFFFF9F43),
        x: 0.82,
        y: 0.72,
        size: 60,
      ),
      EcoNodeModel(
        id: 'unions',
        emoji: '✊',
        label: 'Unions',
        description:
            'Worker unions that use platform data to negotiate collective bargaining agreements.',
        connections: ['platform', 'workers', 'employers'],
        color: const Color(0xFFE056FD),
        x: 0.5,
        y: 0.85,
        size: 58,
      ),
    ];
  }
}
