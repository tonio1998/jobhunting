<script setup lang="ts">
import { ref, onMounted, computed } from 'vue';
import { Link, usePage } from '@inertiajs/vue3';

const job = ref(null);
const loading = ref(true);

const { props } = usePage();

const formatPeso = (value: any) => {
    if (!value) return '0.00';
    return parseFloat(value).toLocaleString('en-PH', { minimumFractionDigits: 2 });
};

const formatDate = (date: string | null) => {
    if (!date) return '';
    return new Date(date).toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'short',
        day: 'numeric',
    });
};

const daysLeft = computed(() => {
    if (!job.value?.application_deadline) return null;
    const deadline = new Date(job.value.application_deadline);
    const now = new Date();
    const diff = deadline.getTime() - now.getTime();
    return diff > 0 ? Math.ceil(diff / (1000 * 3600 * 24)) : 0;
});

onMounted(() => {
    loading.value = true;
    try {
        job.value = props?.job;
    } finally {
        loading.value = false;
    }
});
</script>

<template>
    <section
        class="max-w-3xl mx-auto p-8 bg-white rounded-lg shadow-sm mt-12 border border-gray-300"
        aria-live="polite"
    >
        <div v-if="loading" class="text-center text-gray-400 italic text-base">Loading job details...</div>

        <div v-else-if="job">
            <header class="mb-6 flex items-center justify-between">
                <h1 class="text-3xl font-semibold text-gray-900 leading-tight">{{ job.title }}</h1>
                <div class="text-sm text-gray-500 italic">
                    Posted: {{ formatDate(job.created_at) || 'N/A' }}
                </div>
            </header>

            <p
                class="mb-6 text-gray-700 whitespace-pre-line leading-relaxed border-l-4 border-gray-300 pl-4"
            >
                {{ job.description }}
            </p>

            <div
                class="mb-6 flex flex-wrap gap-4 text-gray-700 font-medium text-sm"
            >
                <div v-if="daysLeft !== null" class="bg-yellow-100 text-yellow-800 rounded-full px-3 py-1">
                    Application ends in: <strong>{{ daysLeft }}</strong> day<span v-if="daysLeft !== 1">s</span>
                </div>
                <div v-if="job.remote" class="bg-green-100 text-green-800 rounded-full px-3 py-1">Remote</div>
                <div v-if="job.flexible_hours" class="bg-blue-100 text-blue-800 rounded-full px-3 py-1">Flexible Hours</div>
            </div>

            <!-- Job Key Details -->
            <dl class="grid grid-cols-1 sm:grid-cols-2 gap-x-8 gap-y-4 text-gray-700 mb-8">
                <div>
                    <dt class="font-medium text-gray-900">Start Date</dt>
                    <dd>{{ formatDate(job.start_date) || 'TBD' }}</dd>
                </div>
                <div>
                    <dt class="font-medium text-gray-900">End Date</dt>
                    <dd>{{ formatDate(job.end_date) || 'TBD' }}</dd>
                </div>
                <div>
                    <dt class="font-medium text-gray-900">Rate</dt>
                    <dd>₱{{ formatPeso(job.rate_amount) }} <span class="italic text-gray-600">({{ job.rate_type ?? 'N/A' }})</span></dd>
                </div>
                <div>
                    <dt class="font-medium text-gray-900">Place of Assignment</dt>
                    <dd>{{ job.placeOfAssignmentText ?? 'N/A' }}</dd>
                </div>
                <div>
                    <dt class="font-medium text-gray-900">Employment Type</dt>
                    <dd>{{ job.employment_type ?? 'N/A' }}</dd>
                </div>
                <div>
                    <dt class="font-medium text-gray-900">Job Category</dt>
                    <dd>{{ job.category?.name ?? 'N/A' }}</dd>
                </div>
                <div class="sm:col-span-2">
                    <dt class="font-medium text-gray-900">Company</dt>
                    <dd>{{ job.company?.name ?? 'N/A' }}</dd>
                </div>
            </dl>

            <!-- Skills -->
            <section v-if="job.skills_required?.length" class="mb-8" aria-labelledby="skills-title">
                <h2 id="skills-title" class="text-2xl font-semibold mb-3 text-gray-900 border-b border-gray-300 pb-1">
                    Skills Required
                </h2>
                <ul class="list-disc list-inside text-gray-700 space-y-1">
                    <li v-for="skill in job.skills_required" :key="skill.id ?? skill.skill?.description">
                        {{ skill.skill?.description ?? 'Unnamed Skill' }}
                    </li>
                </ul>
            </section>

            <section v-else class="mb-8 text-gray-500 italic" aria-live="polite">
                No specific skills required.
            </section>

            <!-- Additional Details -->
            <section class="border-t border-gray-300 pt-6 text-gray-700 space-y-4" aria-labelledby="additional-details-title">
                <h2 id="additional-details-title" class="text-2xl font-semibold mb-3 text-gray-900 border-b border-gray-300 pb-1">
                    Additional Details
                </h2>

                <p>
                    <strong>Number of Vacancies:</strong> {{ job.vacancies ?? 'N/A' }}
                </p>
                <p>
                    <strong>Qualifications:</strong><br />
                    <span class="whitespace-pre-line leading-relaxed">{{ job.qualifications ?? 'N/A' }}</span>
                </p>
                <p>
                    <strong>Responsibilities:</strong><br />
                    <span class="whitespace-pre-line leading-relaxed">{{ job.responsibilities ?? 'N/A' }}</span>
                </p>
                <p>
                    <strong>Contact Email:</strong>
                    <a href="mailto:{{ job.contact_email }}" class="text-blue-600 hover:underline">
                        {{ job.contact_email ?? 'N/A' }}
                    </a>
                </p>
                <p>
                    <strong>Contact Phone:</strong>
                    <a href="tel:{{ job.contact_phone }}" class="text-blue-600 hover:underline">
                        {{ job.contact_phone ?? 'N/A' }}
                    </a>
                </p>
            </section>

            <div class="mt-8 flex justify-center">
                <Link
                    :href="`/job/apply/${job.id}`"
                    class="inline-block bg-gradient-to-r from-indigo-500 to-purple-600 hover:from-purple-600 hover:to-indigo-700 text-white px-5 py-2 rounded-lg shadow-md transition-colors duration-300 font-semibold focus:outline-none focus:ring-2 focus:ring-indigo-400"
                >
                    Apply Now
                </Link>
            </div>
        </div>

        <div v-else class="text-red-600 text-center font-semibold text-lg mt-16">
            Job not found.
        </div>
    </section>
</template>
