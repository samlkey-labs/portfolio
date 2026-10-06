<template>
  <div class="main">
    <div class="content">
      <div class="sections-wrapper" ref="sectionsWrapper">
        <!-- ── Section 1: Projects ─────────────── -->
        <div id="projectsTop" name="scroll" class="proj-section">
          <div class="proj-section-inner">
            <!-- Header row -->
            <div class="proj-header">
              <div class="proj-header-left">
                <span class="proj-eyebrow">My Work</span>
              </div>
              <div class="proj-header-actions">
                <a
                  href="https://github.com/samlkey"
                  target="_blank"
                  rel="noopener noreferrer"
                  class="proj-hero-btn proj-hero-btn--primary"
                  aria-label="View all on GitHub"
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
                  GitHub
                </a>
                <a
                  href="/"
                  class="proj-hero-btn proj-hero-btn--ghost"
                  aria-label="Back to portfolio"
                >
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

            <!-- Cards grid / mobile carousel -->
            <div class="proj-grid" ref="grid" @scroll.passive="onGridScroll">
              <article
                v-for="(project, i) in projects"
                :key="project.title"
                class="proj-card"
                :class="{ 'is-visible': revealed }"
                :style="{ transitionDelay: i * 0.1 + 's' }"
              >
                <div class="proj-card-img-wrap">
                  <img
                    :src="isMobile ? project.mobileImage : project.image"
                    :alt="project.title"
                    class="proj-card-img"
                  />
                </div>

                <div class="proj-card-body">
                  <span class="proj-card-url">{{ project.displayUrl }}</span>
                  <h2 class="proj-title">{{ project.title }}</h2>
                  <p class="proj-desc">{{ project.description }}</p>
                  <div class="proj-actions">
                    <a
                      v-if="project.liveHref"
                      :href="project.liveHref"
                      target="_blank"
                      rel="noopener noreferrer"
                      class="proj-btn proj-btn--primary"
                    >
                      View App
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 20 20"
                        fill="currentColor"
                        aria-hidden="true"
                      >
                        <path
                          d="M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z"
                        />
                        <path
                          d="M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z"
                        />
                      </svg>
                    </a>
                    <a
                      :href="project.githubHref"
                      target="_blank"
                      rel="noopener noreferrer"
                      class="proj-btn proj-btn--ghost"
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
                      GitHub
                    </a>
                  </div>
                </div>
              </article>
            </div>

            <!-- Pagination dots — mobile carousel only -->
            <div class="proj-carousel-dots" aria-hidden="true">
              <button
                v-for="(_, i) in projects"
                :key="i"
                class="proj-carousel-dot"
                :class="{ 'is-active': i === currentCard }"
                @click="scrollToCard(i)"
              />
            </div>
          </div>
        </div>

        <!-- ── Section 2: Footer ───────────────── -->
        <Footer />
      </div>
    </div>
  </div>
  <ScrollBar @navigate="handleNavigate" />
</template>

<script>
import Footer from "../components/Footer.vue";
import ScrollBar from "../components/ScrollBar.vue";

export default {
  name: "Projects",
  components: { Footer, ScrollBar },
  data() {
    return {
      revealed: false,
      currentCard: 0,
      isMobile: false,
      projects: [
        {
          title: "Wordle Clone App",
          description:
            "A faithful recreation of the viral word-guessing game built with React. Includes full game logic, colour-coded feedback, and keyboard support.",
          image: require("@/assets/img-desktop/WordleCap.png"),
          mobileImage: require("@/assets/img-mobile/WordleCap.png"),
          tags: ["React", "JavaScript"],
          liveHref: "https://samlkey.github.io/Wordle-Clone/",
          githubHref: "https://github.com/samlkey/Wordle-Clone",
          displayUrl: "samlkey.github.io/Wordle-Clone",
        },
        {
          title: "OSRS Combat Level Guesser",
          description:
            "A higher/lower guessing game built around Old School RuneScape monsters, with a React frontend, Express.js backend, and live OSRS wiki data.",
          image: require("@/assets/img-desktop/gameScreenshot.png"),
          mobileImage: require("@/assets/img-mobile/mobhighlow_mobile.png"),
          tags: ["React", "Express.js", "JavaScript"],
          liveHref: "https://samlkey-labs.github.io/mob-high-low/",
          githubHref: "https://github.com/samlkey/MobHighLow",
          displayUrl: "samlkey.github.io/MobHighLow",
        },
        {
          title: "Vinyl Collection",
          description:
            "A full-stack web app for cataloguing and managing vinyl record collections, built with React.",
          image: require("@/assets/img-desktop/vinylscreenshot.png"),
          mobileImage: require("@/assets/img-mobile/vinyl_mobile.png"),
          tags: ["Blazor", ".NET", "Entity Framework", "C#"],
          liveHref: "https://vinyl-collection.co.uk/",
          githubHref: "https://github.com/samlkey/VinylCollection",
          displayUrl: "vinyl-collection.co.uk",
        },
      ],
    };
  },
  mounted() {
    this.revealed = true;
    this._mql = window.matchMedia(
      "(max-width: 800px), (orientation: portrait)",
    );
    this.isMobile = this._mql.matches;
    this._mqlHandler = (e) => {
      this.isMobile = e.matches;
    };
    this._mql.addEventListener("change", this._mqlHandler);
  },
  beforeUnmount() {
    this._mql?.removeEventListener("change", this._mqlHandler);
  },
  methods: {
    handleNavigate(index) {
      const wrapper = this.$refs.sectionsWrapper;
      if (wrapper) {
        wrapper.style.transform = `translateY(-${index * 100}vh)`;
      }
    },
    onGridScroll() {
      const grid = this.$refs.grid;
      if (!grid || !grid.firstElementChild) return;
      const cardWidth = grid.firstElementChild.offsetWidth;
      const gap = parseFloat(getComputedStyle(grid).columnGap) || 0;
      this.currentCard = Math.round(grid.scrollLeft / (cardWidth + gap));
    },
    scrollToCard(i) {
      const grid = this.$refs.grid;
      if (!grid) return;
      const card = grid.children[i];
      if (card) {
        card.scrollIntoView({
          behavior: "smooth",
          inline: "start",
          block: "nearest",
        });
      }
    },
  },
};
</script>

<style src="../css/ProjectsView.scss" lang="scss" />
