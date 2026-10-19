<template>
  <div class="resume-page">
    <div class="resume-scrollbar" ref="scrollTrack">
      <div
        class="resume-scrollbar-thumb"
        ref="scrollThumb"
        @mousedown="onThumbMousedown"
      ></div>
    </div>

    <!-- ── Hero ─────────────────────────────── -->
    <section class="resume-hero">
      <div class="resume-hero-inner">
        <div class="resume-hero-text">
          <span class="resume-eyebrow">Curriculum Vitae</span>
          <h1 class="resume-name">Sam Key</h1>
          <p class="resume-role">Software Engineer &amp; Security Specialist</p>
          <p class="resume-tagline">
            Full-stack developer with expertise in enterprise systems, cyber
            security, and cloud infrastructure. Based in North Lincolnshire, UK.
          </p>
        </div>
        <div class="resume-hero-actions">
          <button
            class="resume-dl-btn"
            @click="openCV"
            aria-label="Download CV as PDF"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 20 20"
              fill="currentColor"
              aria-hidden="true"
            >
              <path
                d="M10.75 2.75a.75.75 0 00-1.5 0v8.614L6.295 8.235a.75.75 0 10-1.09 1.03l4.25 4.5a.75.75 0 001.09 0l4.25-4.5a.75.75 0 00-1.09-1.03l-2.955 3.129V2.75z"
              />
              <path
                d="M3.5 12.75a.75.75 0 00-1.5 0v2.5A2.75 2.75 0 004.75 18h10.5A2.75 2.75 0 0018 15.25v-2.5a.75.75 0 00-1.5 0v2.5c0 .69-.56 1.25-1.25 1.25H4.75c-.69 0-1.25-.56-1.25-1.25v-2.5z"
              />
            </svg>
            Download CV
          </button>
          <a href="/" class="resume-back-btn" aria-label="Back to portfolio">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 20 20"
              fill="currentColor"
              aria-hidden="true"
            >
              <path
                fill-rule="evenodd"
                d="M17 10a.75.75 0 01-.75.75H5.612l4.158 3.96a.75.75 0 11-1.04 1.08l-5.5-5.25a.75.75 0 010-1.08l5.5-5.25a.75.75 0 111.04 1.08L5.612 9.25H16.25A.75.75 0 0117 10z"
                clip-rule="evenodd"
              />
            </svg>
            Portfolio
          </a>
        </div>
      </div>
    </section>

    <!-- ── Body ──────────────────────────────── -->
    <div class="resume-body">
      <!-- Sidebar -->
      <aside class="resume-sidebar">
        <div class="sidebar-section">
          <h3 class="sidebar-heading">Contact</h3>
          <div class="contact-list">
            <a
              href="mailto:samkey726@gmail.com"
              class="contact-item"
              aria-label="Email Sam Key"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 20 20"
                fill="currentColor"
                aria-hidden="true"
              >
                <path
                  d="M3 4a2 2 0 00-2 2v1.161l8.441 4.221a1.25 1.25 0 001.118 0L19 7.162V6a2 2 0 00-2-2H3z"
                />
                <path
                  d="M19 8.839l-7.77 3.885a2.75 2.75 0 01-2.46 0L1 8.839V14a2 2 0 002 2h14a2 2 0 002-2V8.839z"
                />
              </svg>
              <span>samkey726@gmail.com</span>
            </a>
            <a
              href="https://www.linkedin.com/in/samkey726/"
              target="_blank"
              rel="noopener noreferrer"
              class="contact-item"
              aria-label="LinkedIn profile"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 24 24"
                fill="currentColor"
                aria-hidden="true"
              >
                <path
                  d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.064 2.064 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"
                />
              </svg>
              <span>linkedin.com/in/samkey726</span>
            </a>
            <a
              href="https://github.com/samlkey"
              target="_blank"
              rel="noopener noreferrer"
              class="contact-item"
              aria-label="GitHub profile"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 24 24"
                fill="currentColor"
                aria-hidden="true"
              >
                <path
                  d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                />
              </svg>
              <span>github.com/samlkey</span>
            </a>
            <div class="contact-item contact-item--plain">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 20 20"
                fill="currentColor"
                aria-hidden="true"
              >
                <path
                  fill-rule="evenodd"
                  d="M9.69 18.933l.003.001C9.89 19.02 10 19 10 19s.11.02.308-.066l.002-.001.006-.003.018-.008a5.741 5.741 0 00.281-.14c.186-.096.446-.24.757-.433.62-.384 1.445-.966 2.274-1.765C15.302 15.988 17 13.493 17 10a7 7 0 10-14 0c0 3.492 1.698 5.988 3.355 7.584a13.731 13.731 0 002.273 1.765 11.842 11.842 0 00.976.544l.062.029.018.008.006.003zM10 11.25a1.25 1.25 0 100-2.5 1.25 1.25 0 000 2.5z"
                  clip-rule="evenodd"
                />
              </svg>
              <span>North Lincolnshire, UK</span>
            </div>
          </div>
        </div>

        <div
          v-for="group in skillGroups"
          :key="group.title"
          class="sidebar-section"
        >
          <h3 class="sidebar-heading">{{ group.title }}</h3>
          <div class="skill-chips">
            <span
              v-for="skill in group.skills"
              :key="skill"
              class="skill-chip"
              >{{ skill }}</span
            >
          </div>
        </div>
      </aside>

      <!-- Main content -->
      <main class="resume-main">
        <!-- Profile -->
        <section class="resume-section">
          <h2 class="section-heading">
            <span class="section-label">Profile</span>
          </h2>
          <p class="profile-text">
            Passionate Software Engineer with expertise in full-stack
            development, cyber security, and server management. Experienced in
            enterprise-scale C# / .NET systems, modern web frameworks, and
            security-first engineering principles. Demonstrated ability to lead
            technical initiatives, optimise performance, and deliver robust
            solutions under pressure.
          </p>
        </section>

        <!-- Experience -->
        <section class="resume-section">
          <h2 class="section-heading">
            <span class="section-label">Experience</span>
          </h2>

          <div class="resume-card">
            <div class="card-header">
              <div class="card-header-left">
                <span class="card-year">2025 – Present</span>
                <h3 class="card-org">Anglian Water</h3>
                <span class="card-role">Software Engineer</span>
              </div>
              <span class="card-badge card-badge--work">Full-time</span>
            </div>
            <ul class="card-bullets">
              <li>
                Delivered features across multiple business-critical
                applications using Angular and .NET/Azure Functions within a
                cross-functional Digital Services team.
              </li>
              <li>
                Built and maintained Azure Functions using the isolated worker
                model, integrated with Azure API Management for secure, scalable
                service exposure.
              </li>
              <li>
                Led regression testing and QA analysis across Desktop, Mobile,
                and Tablet platforms to safeguard release quality.
              </li>
            </ul>
            <div class="card-tags">
              <span
                v-for="t in [
                  'C#',
                  'ASP.NET',
                  '.NET',
                  'Blazor',
                  'SQL Server',
                  'OAuth2',
                  'Jenkins',
                ]"
                :key="t"
                class="card-tag"
                >{{ t }}</span
              >
            </div>
          </div>

          <div class="resume-card">
            <div class="card-header">
              <div class="card-header-left">
                <span class="card-year">2023 - 2025</span>
                <h3 class="card-org">Advantage Finance</h3>
                <span class="card-role">Software Developer</span>
              </div>
              <span class="card-badge card-badge--work">Full-time</span>
            </div>
            <ul class="card-bullets">
              <li>
                Developed and led multiple business-critical systems using C#,
                ASP.NET, .NET, Blazor, and SQL Server, increasing operational
                efficiency and reducing manual workload.
              </li>
              <li>
                Improved application security and performance through
                authentication hardening (OAuth2, JWT) and database query
                optimisation.
              </li>
              <li>
                Automated deployments via CI/CD pipelines (Jenkins, GitHub
                Actions), streamlining release processes.
              </li>
            </ul>
          </div>
        </section>

        <!-- Education -->
        <section class="resume-section">
          <h2 class="section-heading">
            <span class="section-label">Education</span>
          </h2>

          <div class="resume-card">
            <div class="card-header">
              <div class="card-header-left">
                <span class="card-year">2021 – 2022</span>
                <h3 class="card-org">Sheffield Hallam University</h3>
                <span class="card-role">PgDip Cyber Security</span>
              </div>
            </div>
            <p class="card-desc">
              Developed advanced expertise in network security, cryptography,
              ethical hacking, and digital forensics, applying security-first
              principles to complex real-world threat scenarios.
            </p>
          </div>

          <div class="resume-card">
            <div class="card-header">
              <div class="card-header-left">
                <span class="card-year">2018 – 2021</span>
                <h3 class="card-org">Sheffield Hallam University</h3>
                <span class="card-role">BSc (Hons) Computer Science</span>
              </div>
            </div>
            <p class="card-desc">
              Built a strong foundation in software engineering, algorithms,
              data structures, and systems design through rigorous theory and
              hands-on practical development.
            </p>
          </div>
        </section>

        <!-- Projects -->
        <section class="resume-section resume-section--last">
          <h2 class="section-heading">
            <span class="section-label">Projects</span>
          </h2>
          <p class="profile-text">
            A selection of personal and open-source projects can be found at
            <a href="/projects" class="resume-link">samkey.site/projects</a> —
            spanning full-stack web apps, security tooling, and infrastructure
            automation. Want to know more?
            <a href="mailto:samkey726@gmail.com" class="resume-link"
              >Let's chat.</a
            >
          </p>
        </section>
      </main>
    </div>
  </div>
</template>

<script>
export default {
  name: "Resume",
  data() {
    return {
      skillGroups: [
        {
          title: "Languages",
          skills: [
            "C#",
            "JavaScript",
            "TypeScript",
            "Python",
            "C++",
            "Java",
            "HTML / CSS",
          ],
        },
        {
          title: "Frameworks",
          skills: ["React", "Vue.js", "ASP.NET", "Blazor", ".NET", "Node.js"],
        },
        {
          title: "Databases",
          skills: ["SQL Server", "MySQL", "PostgreSQL", "MongoDB", "SQLite"],
        },
        {
          title: "DevOps & Cloud",
          skills: [
            "Docker",
            "Jenkins",
            "GitHub Actions",
            "Azure DevOps",
            "AWS",
            "Proxmox",
          ],
        },
        {
          title: "Security",
          skills: [
            "Penetration Testing",
            "Ethical Hacking",
            "Metasploit",
            "Wireshark",
            "Zero Trust",
            "OWASP",
          ],
        },
      ],
    };
  },
  mounted() {
    document.body.classList.add("resume-active");
    document.documentElement.classList.add("resume-active");
    this._initScrollbar();
  },
  beforeUnmount() {
    document.body.classList.remove("resume-active");
    document.documentElement.classList.remove("resume-active");
    if (this._scrollCleanup) this._scrollCleanup();
  },
  methods: {
    openCV() {
      window.open("/files/CV.pdf");
    },
    _initScrollbar() {
      const thumb = this.$refs.scrollThumb;
      const track = this.$refs.scrollTrack;
      if (!thumb || !track) return;

      const body = document.body;

      const update = () => {
        const scrollTop = body.scrollTop;
        const scrollHeight = body.scrollHeight;
        const viewportH = body.clientHeight;
        const scrollable = scrollHeight - viewportH;
        if (scrollable <= 0) {
          thumb.style.opacity = "0";
          return;
        }
        thumb.style.opacity = "1";
        const trackH = track.clientHeight;
        const thumbH = Math.min(
          Math.max(40, (viewportH / scrollHeight) * trackH),
          trackH * 0.6,
        );
        const thumbTop = (scrollTop / scrollable) * (trackH - thumbH);
        thumb.style.height = thumbH + "px";
        thumb.style.transform = `translateY(${thumbTop}px)`;
      };

      body.addEventListener("scroll", update, { passive: true });
      window.addEventListener("resize", update, { passive: true });
      update();
      this._scrollCleanup = () => {
        body.removeEventListener("scroll", update);
        window.removeEventListener("resize", update);
      };
    },
    onThumbMousedown(e) {
      e.preventDefault();
      const track = this.$refs.scrollTrack;
      const thumb = this.$refs.scrollThumb;
      const body = document.body;
      const startY = e.clientY;
      const startScrollTop = body.scrollTop;
      const trackH = track.clientHeight;
      const thumbH = thumb.clientHeight;
      const scrollable = body.scrollHeight - body.clientHeight;

      const onMove = (e) => {
        const delta = e.clientY - startY;
        body.scrollTop =
          startScrollTop + (delta / (trackH - thumbH)) * scrollable;
      };
      const onUp = () => {
        document.removeEventListener("mousemove", onMove);
        document.removeEventListener("mouseup", onUp);
        thumb.classList.remove("is-dragging");
      };
      thumb.classList.add("is-dragging");
      document.addEventListener("mousemove", onMove);
      document.addEventListener("mouseup", onUp);
    },
  },
};
</script>

<style src="../css/Resume.scss" lang="scss" />
