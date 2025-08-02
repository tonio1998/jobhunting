<template>
    <div class="min-h-screen flex items-center justify-center bg-gray-100 p-4">
        <div class="bg-white shadow-xl rounded-2xl max-w-md w-full p-6 space-y-6">
            <div class="text-center">
                <h1 class="text-2xl font-bold text-gray-800">Verify OTP</h1>
                <p class="text-sm text-gray-600 mt-1">
                    An OTP has been sent to <span class="font-medium text-black">{{ contact }}</span>.
                </p>
                <p class="text-sm text-gray-500">Enter the 6-digit code to confirm deletion.</p>
            </div>

            <form @submit.prevent="verifyOtp" class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700">OTP Code</label>
                    <input
                        v-model="otp"
                        maxlength="6"
                        required
                        type="text"
                        inputmode="numeric"
                        class="w-full mt-1 px-4 py-2 border rounded-lg shadow-sm focus:ring focus:ring-yellow-300 focus:outline-none"
                        placeholder="Enter your OTP"
                    />
                </div>

                <button
                    type="submit"
                    :disabled="loading"
                    class="w-full py-2 rounded-lg font-semibold bg-yellow-500 text-white hover:bg-yellow-600 transition disabled:opacity-50"
                >
                    {{ loading ? 'Verifying...' : 'Confirm Deletion' }}
                </button>

                <p v-if="message" class="text-center text-sm text-red-600 mt-2">
                    {{ message }}
                </p>
            </form>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        contact: {
            type: String,
            required: true,
        },
    },
    data() {
        return {
            otp: '',
            message: '',
            loading: false,
        };
    },
    methods: {
        async verifyOtp() {
            this.loading = true;
            this.message = '';
            try {
                const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

                const res = await fetch('/verify-otp', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': token,
                        Accept: 'application/json',
                    },
                    body: JSON.stringify({ contact: this.contact, otp: this.otp }),
                });


                const data = await res.json();

                if (res.ok) {
                    this.message = data.message || 'Account successfully deleted.';
                    // You can also redirect here if you want:
                    // this.$inertia.visit('/account-deleted-confirmation');
                } else {
                    this.message = data.message || data.error || 'Invalid OTP. Please try again.';
                }
            } catch (error) {
                this.message = 'An unexpected error occurred. Please try again.';
            } finally {
                this.loading = false;
            }
        },
    },
};
</script>
