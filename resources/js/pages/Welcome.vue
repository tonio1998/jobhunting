<script setup lang="ts">
import { Head, Link } from '@inertiajs/vue3';
import { onMounted } from 'vue';
const appName = import.meta.env.VITE_APP_NAME;

import AOS from 'aos';
import 'aos/dist/aos.css';
import Navbar from '@/components/Navbar.vue';

onMounted(() => {
    AOS.init({
        duration: 800,
        once: true,
        easing: 'ease-out-quart'
    });
});
</script>

<template>
    <Head title="Find Your Next Remote Job">
        <link rel="preconnect" href="https://rsms.me/" />
        <link rel="stylesheet" href="https://rsms.me/inter/inter.css" />
    </Head>

    <div class="flex min-h-screen flex-col bg-[#FDFDFC] text-[#1b1b18] dark:bg-[#0a0a0a] dark:text-[#EDEDEC]">

        <!-- Navbar -->
        <Navbar />

        <!-- Hero Section -->
        <section class="bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 text-white">
            <div class="mx-auto max-w-4xl px-6 py-16 text-center">
                <h1 class="text-3xl font-bold md:text-5xl" data-aos="fade-up">
                    Find Your Dream Remote Job
                </h1>
                <p class="mt-4 text-lg" data-aos="fade-up" data-aos-delay="150">
                    Search thousands of online jobs from trusted companies worldwide.
                </p>

                <!-- Search bar -->
                <div class="mt-6 flex flex-col gap-3 md:flex-row md:items-center md:justify-center" data-aos="fade-up" data-aos-delay="300">
                    <input
                        type="text"
                        placeholder="Job title, keywords..."
                        class="w-full rounded-md border px-4 py-3 text-black placeholder:text-gray-200 focus:ring-2 focus:ring-yellow-400 focus:outline-none md:w-96"
                    />
                    <button
                        class="rounded-md bg-yellow-400 px-6 py-3 font-semibold text-black hover:bg-yellow-500 hover:scale-105 transition-transform"
                    >
                        Search Jobs
                    </button>
                </div>
            </div>
        </section>

        <!-- Categories -->
        <section class="mx-auto max-w-6xl px-6 py-12">
            <h2 class="mb-6 text-center text-2xl font-bold" data-aos="fade-up">Popular Categories</h2>
            <div class="grid grid-cols-2 gap-6 md:grid-cols-4">
                <div class="rounded-lg border p-6 text-center hover:shadow-lg hover:scale-105 transition-transform" data-aos="zoom-in">
                    💻 IT & Development
                </div>
                <div class="rounded-lg border p-6 text-center hover:shadow-lg hover:scale-105 transition-transform" data-aos="zoom-in" data-aos-delay="100">
                    📞 Customer Support
                </div>
                <div class="rounded-lg border p-6 text-center hover:shadow-lg hover:scale-105 transition-transform" data-aos="zoom-in" data-aos-delay="200">
                    ✍ Writing & Content
                </div>
                <div class="rounded-lg border p-6 text-center hover:shadow-lg hover:scale-105 transition-transform" data-aos="zoom-in" data-aos-delay="300">
                    📊 Marketing & Sales
                </div>
            </div>
        </section>

        <!-- Featured Jobs -->
        <section class="bg-gray-50 dark:bg-gray-900">
            <div class="mx-auto max-w-6xl px-6 py-12">
                <h2 class="mb-6 text-center text-2xl font-bold" data-aos="fade-up">Featured Jobs</h2>
                <div class="grid gap-6 md:grid-cols-3">
                    <div class="rounded-lg border bg-white p-6 shadow-sm hover:shadow-lg hover:scale-105 transition-transform dark:bg-gray-800" data-aos="fade-up">
                        <h3 class="font-bold">Frontend Developer</h3>
                        <p class="text-sm text-gray-500">Remote - Full Time</p>
                        <p class="mt-2 text-sm">
                            Join a fast-growing SaaS company and build stunning web apps.
                        </p>
                        <button class="mt-4 w-full rounded-md bg-indigo-500 px-4 py-2 text-white hover:bg-indigo-600">
                            Apply Now
                        </button>
                    </div>
                    <div class="rounded-lg border bg-white p-6 shadow-sm hover:shadow-lg hover:scale-105 transition-transform dark:bg-gray-800" data-aos="fade-up" data-aos-delay="100">
                        <h3 class="font-bold">Virtual Assistant</h3>
                        <p class="text-sm text-gray-500">Remote - Part Time</p>
                        <p class="mt-2 text-sm">
                            Assist clients in scheduling, email handling, and admin tasks.
                        </p>
                        <button class="mt-4 w-full rounded-md bg-indigo-500 px-4 py-2 text-white hover:bg-indigo-600">
                            Apply Now
                        </button>
                    </div>
                    <div class="rounded-lg border bg-white p-6 shadow-sm hover:shadow-lg hover:scale-105 transition-transform dark:bg-gray-800" data-aos="fade-up" data-aos-delay="200">
                        <h3 class="font-bold">Content Writer</h3>
                        <p class="text-sm text-gray-500">Remote - Freelance</p>
                        <p class="mt-2 text-sm">
                            Create engaging articles and blog posts for global clients.
                        </p>
                        <button class="mt-4 w-full rounded-md bg-indigo-500 px-4 py-2 text-white hover:bg-indigo-600">
                            Apply Now
                        </button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Why Choose Us -->
        <section class="mx-auto max-w-6xl px-6 py-12">
            <h2 class="mb-6 text-center text-2xl font-bold" data-aos="fade-up">Why Choose {{ appName}}?</h2>
            <div class="grid gap-6 md:grid-cols-3">
                <div class="rounded-lg border p-6 text-center hover:scale-105 transition-transform" data-aos="fade-up">
                    🌍 Global Reach
                    <p class="mt-2 text-sm">Jobs from companies around the world.</p>
                </div>
                <div class="rounded-lg border p-6 text-center hover:scale-105 transition-transform" data-aos="fade-up" data-aos-delay="100">
                    🛡 Trusted Employers
                    <p class="mt-2 text-sm">Verified employers to ensure safe job hunting.</p>
                </div>
                <div class="rounded-lg border p-6 text-center hover:scale-105 transition-transform" data-aos="fade-up" data-aos-delay="200">
                    ⚡ Fast Application
                    <p class="mt-2 text-sm">Apply with one click using your profile.</p>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="mt-auto bg-gray-100 py-6 text-center text-sm text-gray-500 dark:bg-gray-900 dark:text-gray-400" data-aos="fade-up">
            © 2025 {{ appName}}. All rights reserved.
        </footer>
    </div>
</template>
