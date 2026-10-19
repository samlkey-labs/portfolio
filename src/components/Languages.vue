<template>
  <div id="languageScroll" name="scroll">
    <div class="experience-wrapper">
      <div class="exp-header">
        <span class="exp-eyebrow">Career &amp; Education</span>
        <h1 class="exp-title">Experience</h1>
        <div class="exp-divider"></div>
        <p class="exp-subtitle">
          A timeline of my professional experience and academic background.
        </p>
      </div>

      <div class="timeline" ref="timeline">
        <div
          v-for="(item, i) in items"
          :key="i"
          :class="[
            'tl-row',
            item.type === 'marker' ? 'tl-marker' : 'tl-item',
            { 'tl-visible': revealed },
          ]"
          :style="{ transitionDelay: i * 0.13 + 's' }"
        >
          <!-- Education section marker -->
          <template v-if="item.type === 'marker'">
            <div class="tl-marker-line"></div>
            <span class="tl-marker-label">{{ item.label }}</span>
            <div class="tl-marker-line"></div>
          </template>

          <!-- Timeline entry -->
          <template v-else>
            <div class="tl-cell-left">
              <div class="tl-card" v-if="item.side === 'left'">
                <span class="tl-year">{{ item.year }}</span>
                <h3 class="tl-org">
                  {{ item.type === "edu" ? item.role : item.org }}
                </h3>
                <p class="tl-role">
                  {{ item.type === "edu" ? item.org : item.role }}
                </p>
                <p class="tl-desc" v-if="item.desc">{{ item.desc }}</p>
                <p class="tl-desc-short" v-if="item.shortDesc">
                  {{ item.shortDesc }}
                </p>
              </div>
            </div>

            <div class="tl-cell-center">
              <div class="tl-dot" :class="'tl-dot--' + item.type"></div>
            </div>

            <div class="tl-cell-right">
              <div class="tl-card" v-if="item.side === 'right'">
                <span class="tl-year">{{ item.year }}</span>
                <h3 class="tl-org">
                  {{ item.type === "edu" ? item.role : item.org }}
                </h3>
                <p class="tl-role">
                  {{ item.type === "edu" ? item.org : item.role }}
                </p>
                <p class="tl-desc" v-if="item.desc">{{ item.desc }}</p>
                <p class="tl-desc-short" v-if="item.shortDesc">
                  {{ item.shortDesc }}
                </p>
              </div>
            </div>
          </template>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Languages",

  data() {
    return {
      revealed: false,

      // Ordered top-to-bottom: newest (top) → oldest (bottom)
      items: [
        {
          type: "work",
          side: "right",
          year: "2025",
          org: "Anglian Water",
          role: "Software Engineer",
          desc: "Built and maintained enterprise-scale applications supporting critical infrastructure operations across one of the UK's largest water utilities, with a focus on system reliability, performance, and cross-team collaboration.",
          shortDesc:
            "Enterprise apps for one of the UK's largest water utilities.",
        },
        {
          type: "work",
          side: "left",
          year: "2022",
          org: "Advantage Finance",
          role: "Software Developer",
          desc: "Developed and led multiple business-critical systems, increasing operational efficiency and reducing manual workload.",
          shortDesc:
            "Led business-critical systems, boosting operational efficiency.",
        },
        { type: "marker", label: "Education" },
        {
          type: "edu",
          side: "right",
          year: "2022",
          org: "Sheffield Hallam University",
          role: "PgDip Cyber Security",
          desc: "Developed advanced expertise in network security, cryptography, ethical hacking, and digital forensics, applying security-first principles to complex real-world threat scenarios.",
          shortDesc: "Network security, cryptography & ethical hacking.",
        },
        {
          type: "edu",
          side: "left",
          year: "2019",
          org: "Sheffield Hallam University",
          role: "BSc Computer Science",
          desc: "Built a strong foundation in software engineering, algorithms, data structures, and systems design through a mix of rigorous theory and hands-on practical development.",
          shortDesc:
            "Software engineering fundamentals, algorithms & systems design.",
        },
      ],
    };
  },

  mounted() {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          this.revealed = true;
          observer.disconnect();
        }
      },
      { threshold: 0.2 },
    );
    observer.observe(this.$el);
  },
};
</script>

<style src="../css/Languages.scss" lang="scss" />
