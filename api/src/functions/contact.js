const { app } = require('@azure/functions');
const { EmailClient } = require('@azure/communication-email');

const EMAIL_PATTERN = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const LIMITS = { from: 254, subject: 60, message: 500 };

let client;

function getClient() {
    client ??= new EmailClient(process.env.ACS_CONNECTION_STRING);
    return client;
}

function validate(body) {
    const from = typeof body.from === 'string' ? body.from.trim() : '';
    const subject = typeof body.subject === 'string' ? body.subject.trim() : '';
    const message = typeof body.message === 'string' ? body.message.trim() : '';

    if (!EMAIL_PATTERN.test(from) || from.length > LIMITS.from) return { error: 'A valid email address is required.' };
    if (!subject || subject.length > LIMITS.subject) return { error: `Subject must be 1-${LIMITS.subject} characters.` };
    if (!message || message.length > LIMITS.message) return { error: `Message must be 1-${LIMITS.message} characters.` };

    return { from, subject, message };
}

app.http('contact', {
    methods: ['POST'],
    authLevel: 'anonymous',
    handler: async (request, context) => {
        let body;
        try {
            body = await request.json();
        } catch {
            return { status: 400, jsonBody: { error: 'Invalid request.' } };
        }

        // Honeypot: real users never see or fill this field
        if (body.website) {
            return { status: 200, jsonBody: { ok: true } };
        }

        const result = validate(body);
        if (result.error) {
            return { status: 400, jsonBody: { error: result.error } };
        }

        try {
            const poller = await getClient().beginSend({
                senderAddress: process.env.CONTACT_SENDER,
                recipients: { to: [{ address: process.env.CONTACT_RECIPIENT }] },
                replyTo: [{ address: result.from }],
                content: {
                    subject: `[Portfolio] ${result.subject}`,
                    plainText: `From: ${result.from}\n\n${result.message}`,
                },
            });
            await poller.pollUntilDone();
        } catch (err) {
            context.error('Failed to send contact email', err);
            return { status: 502, jsonBody: { error: 'Message could not be sent. Please try again later.' } };
        }

        return { status: 200, jsonBody: { ok: true } };
    },
});
