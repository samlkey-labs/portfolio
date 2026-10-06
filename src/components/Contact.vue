<template>
    <div id="contactScroll" name="scroll">
        <div class="contact-wrapper" ref="wrapper">

            <!-- Left: info panel -->
            <div class="contact-info" :class="{ 'is-visible': revealed }">
                <span class="contact-eyebrow">Get In Touch</span>
                <h2 class="contact-heading">Let's work<br>together.</h2>
                <p class="contact-subheading">
                    Open to new opportunities, freelance projects, and interesting collaborations.
                    Drop me a message and I'll get back to you.
                </p>

                <div class="contact-links">
                    <a href="mailto:samkey726@gmail.com" class="contact-link" aria-label="Send email to Sam Key">
                        <div class="contact-link-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                                <path d="M1.5 8.67v8.58a3 3 0 003 3h15a3 3 0 003-3V8.67l-8.928 5.493a3 3 0 01-3.144 0L1.5 8.67z"/>
                                <path d="M22.5 6.908V6.75a3 3 0 00-3-3h-15a3 3 0 00-3 3v.158l9.714 5.978a1.5 1.5 0 001.572 0L22.5 6.908z"/>
                            </svg>
                        </div>
                        <div class="contact-link-body">
                            <span class="contact-link-label">Email</span>
                            <span class="contact-link-value">samkey726@gmail.com</span>
                        </div>
                    </a>

                    <a href="https://www.linkedin.com/in/samkey726/" target="_blank" rel="noopener noreferrer" class="contact-link" aria-label="LinkedIn profile">
                        <div class="contact-link-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.064 2.064 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
                            </svg>
                        </div>
                        <div class="contact-link-body">
                            <span class="contact-link-label">LinkedIn</span>
                            <span class="contact-link-value">linkedin.com/in/samkey726</span>
                        </div>
                    </a>

                    <a href="https://github.com/samlkey" target="_blank" rel="noopener noreferrer" class="contact-link" aria-label="GitHub profile">
                        <div class="contact-link-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                                <path d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"/>
                            </svg>
                        </div>
                        <div class="contact-link-body">
                            <span class="contact-link-label">GitHub</span>
                            <span class="contact-link-value">github.com/samlkey</span>
                        </div>
                    </a>
                </div>
            </div>

            <!-- Right: form panel -->
            <div class="contact-form-panel" :class="{ 'is-visible': revealed }" style="transition-delay: 0.14s">
                <form class="contact-form" @submit.prevent="submit">
                    <!-- Honeypot: hidden from people, filled in by bots -->
                    <div class="form-honeypot" aria-hidden="true">
                        <label for="contact-website">Website</label>
                        <input type="text" id="contact-website" v-model="form.website" tabindex="-1" autocomplete="off">
                    </div>

                    <div class="form-row">
                        <div class="form-field">
                            <label for="contact-email">Email address</label>
                            <input
                                type="email"
                                id="contact-email"
                                name="from"
                                v-model="form.from"
                                placeholder="you@example.com"
                                autocomplete="email"
                                required
                            >
                        </div>
                        <div class="form-field">
                            <label for="contact-subject">Subject</label>
                            <input
                                type="text"
                                id="contact-subject"
                                name="subject"
                                v-model="form.subject"
                                placeholder="What's this about?"
                                maxlength="60"
                                required
                            >
                        </div>
                    </div>

                    <div class="form-field">
                        <label for="contact-message">
                            Message
                            <span class="char-counter">{{ charsLeft }} / 500</span>
                        </label>
                        <textarea
                            id="contact-message"
                            name="message"
                            v-model="form.message"
                            rows="5"
                            maxlength="500"
                            placeholder="Tell me about your project or opportunity…"
                            required
                        ></textarea>
                    </div>

                    <button type="submit" class="contact-submit" aria-label="Send message" :disabled="status === 'sending'">
                        {{ status === 'sending' ? 'Sending…' : 'Send Message' }}
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                            <path d="M3.105 2.289a.75.75 0 00-.826.95l1.414 4.925A1.5 1.5 0 005.135 9.25h6.115a.75.75 0 010 1.5H5.135a1.5 1.5 0 00-1.442 1.086l-1.414 4.926a.75.75 0 00.826.95 28.896 28.896 0 0015.293-7.154.75.75 0 000-1.115A28.897 28.897 0 003.105 2.289z"/>
                        </svg>
                    </button>

                    <p v-if="statusMessage" class="form-status" :class="`form-status--${status}`" role="status">
                        {{ statusMessage }}
                    </p>
                </form>
            </div>

        </div>
    </div>
</template>

<script>
export default {
    name: 'Contact',
    data() {
        return {
            revealed: false,
            form: { from: '', subject: '', message: '', website: '' },
            status: 'idle', // idle | sending | success | error
            statusMessage: '',
        };
    },
    computed: {
        charsLeft() {
            return 500 - this.form.message.length;
        },
    },
    mounted() {
        const observer = new IntersectionObserver(
            ([entry]) => {
                if (entry.isIntersecting) {
                    this.revealed = true;
                    observer.disconnect();
                }
            },
            { threshold: 0.15 }
        );
        observer.observe(this.$refs.wrapper);
    },
    methods: {
        async submit() {
            this.status = 'sending';
            this.statusMessage = '';
            try {
                const res = await fetch('/api/contact', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(this.form),
                });
                const data = await res.json().catch(() => ({}));
                if (!res.ok) throw new Error(data.error || 'Message could not be sent. Please try again later.');

                this.status = 'success';
                this.statusMessage = "Thanks! Your message has been sent. I'll get back to you soon.";
                this.form = { from: '', subject: '', message: '', website: '' };
            } catch (err) {
                this.status = 'error';
                this.statusMessage = err.message;
            }
        },
    },
};
</script>

<style src="../css/Contact.scss" lang="scss" />
