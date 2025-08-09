<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import TextLink from '@/components/TextLink.vue';
import { Button } from '@/components/ui/button';
import { Checkbox } from '@/components/ui/checkbox';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Head, useForm } from '@inertiajs/vue3';
import { LoaderCircle } from 'lucide-vue-next';
import Navbar from '@/components/Navbar.vue';
const appName = import.meta.env.VITE_APP_NAME;
defineProps<{
    status?: string;
    canResetPassword: boolean;
}>();

const form = useForm({
    email: '',
    password: '',
    remember: false,
});

const submit = () => {
    form.post(route('login'), {
        onFinish: () => form.reset('password'),
    });
};
</script>

<template>
    <div class="flex min-h-screen flex-col bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 text-white">
        <!-- Header -->
        <Navbar />

        <!-- Main -->
        <main class="flex flex-1 items-center justify-center px-4">
            <div class="w-full max-w-md rounded-2xl bg-white/90 p-8 text-gray-900 shadow-2xl backdrop-blur-md">
                <Head title="Log in" />

                <h1 class="text-center text-3xl font-bold tracking-tight">Log in to your account</h1>
                <p class="mt-2 text-center text-sm text-gray-600">Enter your email and password below to log in</p>

                <div v-if="status" class="mt-4 mb-4 text-center text-sm font-medium text-green-600">
                    {{ status }}
                </div>

                <form @submit.prevent="submit" class="mt-6 flex flex-col gap-6">
                    <div class="grid gap-6">
                        <!-- Email -->
                        <div class="grid gap-2">
                            <Label for="email">Email address</Label>
                            <Input
                                id="email"
                                type="email"
                                required
                                autofocus
                                :tabindex="1"
                                autocomplete="email"
                                v-model="form.email"
                                placeholder="email@example.com"
                                class="rounded-lg border-gray-300 focus:border-purple-500 focus:ring-purple-500"
                            />
                            <InputError :message="form.errors.email" />
                        </div>

                        <!-- Password -->
                        <div class="grid gap-2">
                            <div class="flex items-center justify-between">
                                <Label for="password">Password</Label>
                                <TextLink
                                    v-if="canResetPassword"
                                    :href="route('password.request')"
                                    class="text-sm text-purple-600 hover:underline"
                                    :tabindex="5"
                                >
                                    Forgot password?
                                </TextLink>
                            </div>
                            <Input
                                id="password"
                                type="password"
                                required
                                :tabindex="2"
                                autocomplete="current-password"
                                v-model="form.password"
                                placeholder="Password"
                                class="rounded-lg border-gray-300 focus:border-purple-500 focus:ring-purple-500"
                            />
                            <InputError :message="form.errors.password" />
                        </div>

                        <!-- Remember -->
                        <div class="flex items-center">
                            <Checkbox id="remember" v-model="form.remember" :tabindex="3" />
                            <Label for="remember" class="ml-2 text-sm text-gray-700">Remember me</Label>
                        </div>

                        <!-- Submit -->
                        <Button
                            type="submit"
                            class="mt-4 w-full rounded-xl bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 text-white shadow-lg transition-all duration-200 hover:opacity-90"
                            :tabindex="4"
                            :disabled="form.processing"
                        >
                            <LoaderCircle v-if="form.processing" class="mr-2 h-4 w-4 animate-spin" />
                            Log in
                        </Button>
                    </div>

                    <div class="text-center text-sm text-gray-600">
                        Don't have an account?
                        <TextLink :href="route('register')" :tabindex="5" class="text-purple-600 hover:underline"> Sign up </TextLink>
                    </div>
                </form>
            </div>
        </main>
    </div>
</template>
