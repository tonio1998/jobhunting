<template>
    <div class="wrapper">
        <div class="card">
            <h1>Delete Your fgHEMIS Account</h1>
            <p class="subtitle">
                Deleting your account is permanent and cannot be undone.
                Please enter your email to confirm.
            </p>

            <form @submit.prevent="submitForm" class="form">
                <div class="form-group">
                    <label for="email">Registered Phone</label>
                    <input
                        type=""
                        id="email"
                        v-model="contact"
                        required
                        placeholder="+639XXXXXXXXX"
                    />
                </div>

                <div class="form-group">
                    <label for="reason">Reason for Deletion (optional)</label>
                    <textarea
                        id="reason"
                        v-model="reason"
                        rows="4"
                        placeholder="Tell us why you're leaving"
                    ></textarea>
                </div>

                <button type="submit" :disabled="loading">
                    {{ loading ? 'Submitting...' : 'Delete My Account' }}
                </button>
            </form>

            <p v-if="message" class="success">{{ message }}</p>

            <p class="note">
                Need help? Email us at
                <a href="mailto:support@fghemis.com">support@fghemis.com</a>
            </p>
        </div>
    </div>
</template>

<script>
import { router } from '@inertiajs/vue3';

export default {
    data() {
        return {
            contact: '',
            reason: '',
            loading: false,
            message: '',
        };
    },
    methods: {
        async submitForm() {
            this.loading = true;
            try {
                const tokenMeta = document.querySelector('meta[name="csrf-token"]');
                const csrfToken = tokenMeta ? tokenMeta.getAttribute('content') : '';

                const response = await fetch('/request-delete-otp', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json',
                        'X-CSRF-TOKEN': csrfToken,
                    },
                    body: JSON.stringify({
                        contact: this.contact,
                        reason: this.reason,
                    }),
                });


                const data = await response.json();

                router.get('/verify-delete-otp', { contact: this.contact });
            } catch (err) {
                console.error(err);
                this.message = 'Something went wrong. Please try again later.';
            } finally {
                this.loading = false;
            }
        },
    },
};
</script>

<style scoped>
.wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-color: #f4f6f8;
    padding: 2rem;
}

.card {
    background: white;
    padding: 2rem;
    max-width: 500px;
    width: 100%;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.05);
    border-radius: 12px;
}

h1 {
    font-size: 1.8rem;
    color: #004d1a;
    margin-bottom: 0.5rem;
}

.subtitle {
    font-size: 1rem;
    color: #555;
    margin-bottom: 1.5rem;
}

.form-group {
    margin-bottom: 1.5rem;
}

label {
    display: block;
    font-weight: 600;
    margin-bottom: 0.5rem;
    color: #333;
}

input,
textarea {
    width: 100%;
    padding: 0.8rem;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 1rem;
    box-sizing: border-box;
    transition: border 0.2s;
}

input:focus,
textarea:focus {
    outline: none;
    border-color: #004d1a;
}

button {
    background-color: #ffd04c;
    color: black;
    padding: 0.8rem 1.2rem;
    border: none;
    border-radius: 8px;
    font-weight: bold;
    font-size: 1rem;
    width: 100%;
    cursor: pointer;
    transition: background-color 0.2s;
}

button:hover {
    background-color: #e6bd42;
}

button:disabled {
    background-color: #ddd;
    cursor: not-allowed;
}

.success {
    color: green;
    margin-top: 1rem;
    font-weight: bold;
}

.note {
    font-size: 0.9rem;
    margin-top: 2rem;
    text-align: center;
    color: #555;
}
</style>
