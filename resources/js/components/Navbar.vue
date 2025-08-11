<script setup lang="ts">
import { Link } from '@inertiajs/vue3';
const appName = import.meta.env.VITE_APP_NAME;
</script>

<template>
    <header class="border-b border-gray-200 dark:border-gray-800" data-aos="fade-down">
        <div class="mx-auto flex max-w-7xl items-center justify-between px-6 py-4">
            <div class="text-lg font-bold">{{ appName }}</div>
            <nav class="flex gap-4 text-sm">
                <Link :href="route('job.index')" class="hover:underline">Find Jobs</Link>
                <Link href="/privacy" class="hover:underline">Privacy</Link>
                <Link v-if="$page.props.auth?.user" :href="route('dashboard.index')">
                    Dashboard
                </Link>
                <template v-else>
                    <Link :href="route('login')">Log in</Link>
                    <Link :href="route('register')">Sign Up</Link>
                </template>
            </nav>
        </div>
    </header>
</template>
