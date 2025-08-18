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

        <!-- Privacy Policy -->
        <section class="bg-gray-50 dark:bg-gray-900">
            <div class="privacy-policy p-6 max-w-4xl mx-auto text-justify">
                <h1 class="text-3xl font-bold mb-6">Data Privacy Statement</h1>

                <p class="mb-4">
                    This Data Privacy Statement (“Statement”) is issued in compliance with
                    Republic Act No. 10173, otherwise known as the <em>Data Privacy Act of 2012</em>
                    (“DPA”), and its Implementing Rules and Regulations (IRR).
                </p>

                <p class="mb-4">
                    It explains how Surigao Del Norte State University (SNSU), through its
                    <strong>Worklinker</strong> platform, collects, uses, stores, and shares
                    personal data of its users, including workers, homeowners, job posters,
                    applicants, and other service participants (“Clients”).
                </p>

                <h2 class="text-2xl font-semibold mt-6 mb-3">1. Personal Data Collected</h2>
                <p class="mb-2">
                    SNSU may collect and store personal information, including but not limited to:
                </p>
                <ul class="list-disc pl-6 mb-4">
                    <li>Full name, date/place of birth, gender, civil status, nationality</li>
                    <li>Address and contact details (phone, email)</li>
                    <li>Profile photo and account verification details</li>
                    <li>Educational background, work experience, certifications</li>
                    <li>Skills, proficiencies, and related attachments</li>
                    <li>Job postings, applications, requirements, and preferences</li>
                    <li>Messages, payments, reviews, bids, and favorite listings</li>
                    <li>Login sessions, OTP codes, role and permission details</li>
                    <li><strong>Location data</strong> (precise or approximate) for location-based services and job recommendations</li>
                </ul>

                <h2 class="text-2xl font-semibold mt-6 mb-3">2. Purpose of Data Processing</h2>
                <p class="mb-2">SNSU processes personal data to:</p>
                <ul class="list-disc pl-6 mb-4">
                    <li>Create, maintain, and manage user accounts</li>
                    <li>Facilitate communication between clients and workers</li>
                    <li>Publish, manage, and fulfill job postings</li>
                    <li>Process bids, offers, and applications</li>
                    <li>Verify skills and manage worker profiles</li>
                    <li>Process payments and maintain transaction records</li>
                    <li>Record and display reviews and ratings</li>
                    <li>Enforce platform security through authentication and monitoring</li>
                    <li>Provide location-based services, job matches, and recommendations</li>
                    <li>Comply with legal and regulatory requirements</li>
                </ul>

                <h2 class="text-2xl font-semibold mt-6 mb-3">3. Methods of Collection</h2>
                <p class="mb-4">
                    SNSU collects personal data through account registration, profile
                    completion, job postings and applications, messaging features, payment
                    transactions, uploaded documents, GPS/location permissions, and automated system logging.
                </p>

                <h2 class="text-2xl font-semibold mt-6 mb-3">4. Recipients of Personal Data</h2>
                <p class="mb-4">
                    Personal information may be shared with SNSU units for operational
                    purposes, verified platform users (as needed), third-party service
                    providers for secure processing, government agencies as required by
                    law, and partners providing location-based services.
                </p>

                <h2 class="text-2xl font-semibold mt-6 mb-3">5. Retention & Disposal</h2>
                <p class="mb-4">
                    Data is retained in line with SNSU’s Records Disposal Policy and securely
                    disposed of when no longer required, in accordance with RA 9470.
                </p>

                <h2 class="text-2xl font-semibold mt-6 mb-3">6. Data Security Measures</h2>
                <p class="mb-4">
                    SNSU applies organizational, physical, and technical safeguards to protect
                    personal data, including role-based access controls, encryption, secure
                    authentication, regular security audits, and access restrictions for location data.
                </p>

                <h2 class="text-2xl font-semibold mt-6 mb-3">7. Client Rights</h2>
                <ul class="list-disc pl-6 mb-4">
                    <li>Be informed about the processing of their personal data</li>
                    <li>Access their personal data</li>
                    <li>Request correction or updates to their data</li>
                    <li>
                        Request deletion, blocking, or withdrawal of data, including location data,
                        subject to legal and contractual obligations
                    </li>
                    <li>Opt out of location tracking or location-based recommendations via app settings</li>
                </ul>

                <h2 class="text-2xl font-semibold mt-6 mb-3">8. Contact Information</h2>
                <p>
                    <strong>Data Protection Officer</strong><br />
                    Surigao Del Norte State University<br />
                    Narciso Street, Surigao City, Philippines<br />
                </p>
            </div>
        </section>

        <!-- Footer -->
        <footer class="mt-auto bg-gray-100 py-6 text-center text-sm text-gray-500 dark:bg-gray-900 dark:text-gray-400" data-aos="fade-up">
            © 2025 {{ appName}}. All rights reserved.
        </footer>
    </div>
</template>
