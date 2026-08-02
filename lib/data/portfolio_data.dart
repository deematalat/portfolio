import 'models.dart';

/// All real content sourced from Deema Talat's CV.
/// Items marked "PLACEHOLDER" in comments have no source material yet —
/// replace with real content whenever it's available.
class PortfolioData {
  PortfolioData._();

  static const name = 'Deema Talat';
  static const fullName = 'Deema Talat Abu Samra';
  static const title = 'Data Analyst · Power BI, SQL, Excel';
  static const location = 'Khan Younis, Gaza Strip, Palestine';
  static const email = 'deematalat3@gmail.com';
  static const phone = '+970 592 685 916';
  static const portfolioUrl = 'https://deematalat.github.io/portfolio';
  static const upworkUrl = 'https://upwork.com/fl/deematalat';
  static const linkedinUrl = 'https://www.linkedin.com/in/deematalat-520686360';
  static const githubUrl = 'https://github.com/deematalat';
  static const surveyGeniusUrl = 'https://surveygenius.app';

  static const heroTagline =
      'I take data the whole way — extraction and cleaning, through modelling and SQL, '
      'to dashboards people actually make decisions with.';

  static const profile =
      'Data Analyst with a Software Engineering background, covering the full analytics '
      'pipeline from data extraction and cleaning through to dashboard delivery. I have '
      'completed 80 hours of certified training in SQL, Microsoft Excel, Power BI, and '
      'Tableau, including a data analysis programme delivered in partnership with UNDP. '
      'I have built and published multiple end-to-end analytics projects on real datasets, '
      'and designed a survey platform handling data collection, validation, and reporting '
      'as my graduation project (92/100). Two years of engineering experience in database '
      'design, data modelling, and building production systems.';

  static const stats = [
    StatItem('80', 'Hours certified training'),
    StatItem('92', 'Graduation project score /100'),
    StatItem('50K+', 'App downloads shipped'),
    StatItem('4', 'Client projects delivered'),
  ];

  static const experience = [
    ExperienceItem(
      role: 'Trainer',
      org: 'Youth Council, Save the Youth Future Society',
      location: 'Gaza, Palestine',
      period: 'July 2026',
      bullets: [
        'Delivered a training session to more than 10 participants on CV preparation using AI tools.',
      ],
    ),
    ExperienceItem(
      role: 'Application Developer',
      org: 'Uplancer',
      location: 'Gaza, Palestine',
      period: 'Dec 2024 – Oct 2025',
      bullets: [
        'Designed the data model for a two-interface booking system, covering entity relationships, storage, and retrieval logic.',
        'Implemented validation rules and role-based access control across user records.',
        'Delivered all assigned modules within agreed timelines as part of a development team.',
      ],
    ),
    ExperienceItem(
      role: 'Freelance Software Developer',
      org: 'Self-employed',
      location: 'Remote',
      period: 'Jan 2023 – Jun 2026',
      bullets: [
        'Delivered four client projects end to end, from requirement analysis and data structure design through to deployment.',
        'Published a mobile application that has exceeded 50,000 downloads.',
        'Managed client communication, requirement documentation, and delivery scheduling independently.',
      ],
    ),
  ];

  static const projects = [
    ProjectItem(
      icon: '🏦',
      title: 'Bank Marketing Campaign Analysis',
      tagline: 'Excel Power Query · SQL · Power BI · Tableau',
      description:
          'End-to-end project. Cleaned and standardised a raw marketing dataset in Excel Power '
          'Query — removing duplicates and resolving missing and inconsistent values. Wrote SQL '
          'to segment customers and identify the factors most associated with campaign response, '
          'then built interactive dashboards in both Tableau and Power BI and presented the '
          'findings as a structured case study.',
      tools: ['Excel Power Query', 'SQL', 'Power BI', 'Tableau'],
    ),
    ProjectItem(
      icon: '✈️',
      title: 'Airline Operational Performance Dashboard',
      tagline: 'Power BI · DAX',
      description:
          'Modelled flight and delay data and defined a set of operational KPIs using DAX '
          'measures. Built a multi-page dashboard covering on-time performance, delay causes, '
          'and route-level comparisons.',
      tools: ['Power BI', 'DAX', 'Data Modelling'],
    ),
    ProjectItem(
      icon: '📋',
      title: 'Survey Genius — Survey & Data Analysis Platform',
      tagline: 'Graduation Project · 92/100',
      description:
          'Designed and built a platform covering the full data cycle: form design, data '
          'collection, validation, and analysis. Implemented data type classification and '
          'quality rules at the point of entry to prevent invalid and missing values, and '
          'generated automated analysis reports with AI-assisted question suggestions based '
          'on the collected data.',
      tools: ['Flutter', 'Firebase', 'REST APIs', 'Data Validation'],
      link: surveyGeniusUrl,
      linkLabel: 'Live at surveygenius.app',
    ),
    ProjectItem(
      icon: '🏥',
      title: 'Health Facilities Dashboard',
      tagline: 'Power BI · DAX',
      description:
          'Sector dashboard built on public health-facility data, including data model design, '
          'relationship mapping, and fixed KPI measures in DAX.',
      tools: ['Power BI', 'DAX', 'Data Modelling'],
    ),
    ProjectItem(
      icon: '⚡',
      title: 'Global Energy Transition Dashboard',
      tagline: 'Power BI · Statistical Analysis',
      description:
          'Sector dashboard on public global energy data: multi-page drill-through covering '
          'executive KPIs, country deep-dive, renewables versus fossil fuels, and source-type '
          'analytics, with relationship mapping and DAX measures.',
      tools: ['Power BI', 'Statistical Analysis', 'DAX'],
    ),
    ProjectItem(
      icon: '🎓',
      title: 'Nama Education Database',
      tagline: 'SQL Server · KoboToolbox · Power BI · Python',
      description:
          'Relational SQL Server database (tables, views, stored functions, role-based '
          'permissions) paired with KoboToolbox/XLSForms for collection, a Python API pipeline '
          'for automated daily import, and an interactive Power BI dashboard for reporting.',
      tools: ['SQL Server', 'KoboToolbox', 'Power BI', 'Python'],
      link: 'https://github.com/deematalat/nama-education-db',
      linkLabel: 'View on GitHub',
    ),
  ];

  static const skillCategories = [
    SkillCategory(
      title: 'Business Intelligence',
      icon: '📊',
      skills: [
        'Power BI',
        'Data Modelling',
        'DAX Measures',
        'Relationships',
        'Interactive Dashboards',
        'Tableau'
      ],
    ),
    SkillCategory(
      title: 'SQL & Databases',
      icon: '🗄️',
      skills: [
        'SQL Server',
        'DuckDB',
        'DBeaver',
        'Joins & Aggregations',
        'Window Functions',
        'Subqueries',
        'Database Design & Normalisation'
      ],
    ),
    SkillCategory(
      title: 'Microsoft Excel',
      icon: '📗',
      skills: [
        'Power Query',
        'Pivot Tables',
        'VLOOKUP / XLOOKUP',
        'INDEX/MATCH',
        'Conditional Formatting',
        'Data Validation',
        'Dashboarding'
      ],
    ),
    SkillCategory(
      title: 'Programming',
      icon: '💻',
      skills: ['Python (pandas, NumPy)', 'Dart', 'Git & GitHub'],
    ),
    SkillCategory(
      title: 'Data Preparation',
      icon: '🧹',
      skills: [
        'Data Cleaning',
        'Deduplication',
        'Handling Missing Values',
        'Data Type Standardisation',
        'ETL Pipelines'
      ],
    ),
    SkillCategory(
      title: 'Data Collection',
      icon: '📝',
      skills: [
        'KoboToolbox',
        'XLSForm Design',
        'Google Forms',
        'Survey Design',
        'Validation Rules at Point of Entry'
      ],
    ),
    SkillCategory(
      title: 'Statistics & Reporting',
      icon: '📈',
      skills: [
        'Descriptive Statistics',
        'KPI Definition',
        'Trend & Cohort Analysis',
        'Technical Reporting',
        'Presentations'
      ],
    ),
  ];

  static const education = [
    EducationItem(
      title: 'B.Sc. in Software Engineering',
      org: 'Palestine University',
      location: 'Gaza, Palestine',
      period: 'Sep 2021 – Jun 2025',
      detail:
          'GPA 80.6%. Coursework included statistics, database systems, and data structures.',
    ),
    EducationItem(
      title: 'General Secondary Certificate — Scientific Stream',
      org: 'Ministry of Education',
      location: 'Gaza, Palestine',
      period: 'Jun 2020',
      detail: 'Final grade 90.6%.',
    ),
  ];

  static const certifications = [
    EducationItem(
      title: 'Data Analysis Program',
      org: 'Avatar Co. in partnership with UNDP',
      location: '60 hours',
      period: 'Jun 2026',
      detail:
          'Excel data cleaning, SQL analysis in DuckDB and DBeaver, Tableau and Power BI '
          'dashboards, with an applied capstone project.',
    ),
    EducationItem(
      title: 'Data Analysis with Power BI',
      org: 'Palestinian Engineers Association',
      location: '20 hours',
      period: 'Feb 2026',
    ),
    EducationItem(
      title: 'Backend Development and SQL Databases',
      org: 'Manara',
      location: '',
      period: '2023',
    ),
    EducationItem(
      title: 'Remote Work Readiness',
      org: 'Education for Employment (EFE)',
      location: '',
      period: 'Jun 2026',
    ),
    EducationItem(
      title: 'English Language — 12 levels completed',
      org: 'Al-Salam Center',
      location: '',
      period: 'Jun 2026',
      detail: 'IELTS Level B2.',
    ),
  ];

  static const languages = [
    'Arabic — Native',
    'English — B2, IELTS certified',
  ];

  static const dashboardEmbeds = [
    DashboardEmbedItem(
      title: 'Bank Performance Dashboard',
      description:
          'Tracks key banking metrics, customer account activity, and financial indicators '
          'to evaluate regional branch performance.',
      embedUrl:
          'https://app.powerbi.com/view?r=eyJrIjoiNWU1OWY3NmUtNDg4ZS00NzIwLWI2OTUtNTBhMWE5YjA4YTQ0IiwidCI6ImRhMzE5MTBiLTJlNTYtNGQ1My05ZmNiLTJmMDBiMjAyMDJmMiIsImMiOjEwfQ%3D%3D',
    ),
    DashboardEmbedItem(
      title: 'Airline Route & Delay Analytics',
      description:
          'Analyzes airline route efficiency, flight delays, passenger volume trends, and '
          'schedule reliability metrics.',
      embedUrl:
          'https://app.powerbi.com/view?r=eyJrIjoiYmU0ZmU2NjAtOTE3Yy00NWVjLTg1ZTQtM2JiMmI4NGE1YjEwIiwidCI6ImRhMzE5MTBiLTJlNTYtNGQ1My05ZmNiLTJmMDBiMjAyMDJmMiIsImMiOjEwfQ%3D%3D',
    ),
  ];

  // PLACEHOLDER — no blog posts supplied yet; replace with real articles/insights.
  static const insights = [
    InsightItem(
      title: 'Placeholder: Cleaning a Messy Marketing Dataset',
      excerpt:
          'Write a short article here about your Power Query cleaning approach — '
          'duplicates, missing values, type standardisation. This card is a placeholder.',
      tag: 'Excel',
    ),
    InsightItem(
      title: 'Placeholder: Writing DAX Measures That Scale',
      excerpt:
          'Write a short article here about defining KPIs and structuring measures '
          'in Power BI. This card is a placeholder.',
      tag: 'Power BI',
    ),
    InsightItem(
      title: 'Placeholder: Validation at the Point of Entry',
      excerpt:
          'Write a short article here about preventing bad data at collection time '
          'rather than fixing it later. This card is a placeholder.',
      tag: 'Data Quality',
    ),
  ];
}
