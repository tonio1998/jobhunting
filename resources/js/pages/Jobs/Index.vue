<script setup lang="ts">
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { Link } from '@inertiajs/vue3';
import {
    CalendarDaysIcon,
    MapPinIcon,
    UserIcon,
    ClockIcon,
    CurrencyDollarIcon,
} from '@heroicons/vue/24/solid';

const jobs = ref([]);
const loading = ref(true);
const pagination = ref({ current_page: 1, last_page: 1 });

const user = ref({ role: 'skilled_worker' });

const fetchJobs = async (page = 1) => {
    loading.value = true;
    try {
        const res = await axios.get(`/job/fetch?page=${page}`);
        jobs.value = res.data.data;
        pagination.value = {
            current_page: res.data.current_page,
            last_page: res.data.last_page,
        };
    } finally {
        loading.value = false;
    }
};

const formatPeso = (value) => {
    if (!value) return '0.00';
    return parseFloat(value).toLocaleString('en-PH', { minimumFractionDigits: 2 });
};

const formatDate = (date) => {
    if (!date) return '';
    return new Date(date).toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'short',
        day: 'numeric',
    });
};

const getDateDifferenceFormatted = (start, end) => {
    if (!start || !end) return 'N/A';
    const diff = Math.ceil((new Date(end).getTime() - new Date(start).getTime()) / (1000 * 60 * 60 * 24));
    return diff <= 1 ? '1 day' : `${diff} days`;
};

onMounted(fetchJobs);
</script>

<template>
    <section class="min-h-screen bg-gray-50 font-sans">
        <!-- Header -->
        <header
            class="bg-gradient-to-r from-indigo-600 via-purple-600 to-pink-600 text-white shadow-md sticky top-0 z-50"
        >
            <div class="mx-auto max-w-7xl px-6 py-5 flex items-center justify-between">
                <h1 class="text-3xl font-extrabold tracking-wide">Job Openings</h1>
                <nav class="space-x-6 text-sm font-medium flex items-center">
                    <Link href="/" class="hover:underline">Home</Link>
                    <Link href="/privacy" class="text-white underline decoration-white decoration-2 rounded px-2 py-1">Privacy</Link>
                    <Link href="/job" class="text-white underline decoration-white decoration-2 rounded px-2 py-1">Jobs</Link>
                </nav>
            </div>
        </header>

        <div class="mx-auto max-w-7xl px-6 py-10">
            <div v-if="loading" class="text-center py-20 text-gray-400 text-lg">Loading jobs...</div>

            <div
                v-else
                class="grid gap-8 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3"
            >
                <div
                    v-for="job in jobs"
                    :key="job.id"
                    class="bg-white rounded-xl shadow-md hover:shadow-2xl transition-transform duration-300 ease-in-out transform hover:scale-[1.03] border border-gray-100 p-6 flex flex-col"
                >
                    <h2 class="text-xl font-semibold text-gray-900 line-clamp mb-2">{{ job.title }}</h2>
                    <p class="text-gray-600 text-sm mb-6 line-clamp-2">{{ job.description }}</p>

                    <div class="flex justify-between text-sm text-gray-700 mb-6">
                        <div class="flex items-center gap-1">
                            <CalendarDaysIcon class="w-5 h-5 text-indigo-500" />
                            <span class="font-medium">{{ getDateDifferenceFormatted(job.start_date, job.end_date) }}</span>
                        </div>
                        <div class="flex items-center gap-1">
                            <CurrencyDollarIcon class="w-5 h-5 text-green-500" />
                            <span class="font-semibold">₱{{ formatPeso(job.rate_amount) }} ({{ job.rate_type }})</span>
                        </div>
                    </div>

                    <!-- Skills -->
                    <div v-if="job.skills_required?.length" class="mb-6">
                        <p class="text-gray-400 text-sm font-semibold mb-1">Skills Required</p>
                        <div class="flex flex-wrap gap-2">
              <span
                  v-for="skill in job.skills_required"
                  :key="skill.id ?? skill.skill?.description"
                  class="bg-indigo-100 text-indigo-800 px-3 py-1 rounded-full text-xs font-medium"
              >
                {{ skill.skill?.description ?? 'Unnamed Skill' }}
              </span>
                        </div>
                    </div>

                    <!-- Place of Assignment -->
                    <div v-if="job.placeOfAssignmentText" class="mb-6">
                        <p class="text-gray-400 text-sm font-semibold mb-1 flex items-center gap-1">
                            <MapPinIcon class="w-4 h-4" />
                            Place of Assignment
                        </p>
                        <p class="font-semibold text-gray-800 line-clamp">{{ job.placeOfAssignmentText }}</p>
                    </div>

                    <!-- Apply Button -->
                    <div v-if="user?.role === 'skilled_worker'" class="mt-auto text-right">
                        <div class="mt-auto text-right">
                            <Link
                                :href="`/job/fetch/${job.id}`"
                                class="inline-block bg-gradient-to-r from-indigo-500 to-purple-600 hover:from-purple-600 hover:to-indigo-700 text-white px-5 py-2 rounded-lg shadow-md transition-colors duration-300 font-semibold focus:outline-none focus:ring-2 focus:ring-indigo-400"
                            >
                                View Details
                            </Link>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pagination -->
            <div
                v-if="pagination.last_page > 1"
                class="flex justify-center items-center gap-4 mt-12"
            >
                <button
                    class="px-4 py-2 bg-white border border-gray-300 rounded-md shadow-sm hover:bg-gray-100 disabled:opacity-40 disabled:cursor-not-allowed transition"
                    @click="fetchJobs(pagination.current_page - 1)"
                    :disabled="pagination.current_page === 1"
                >
                    Prev
                </button>
                <span class="text-gray-700 font-medium">
          Page {{ pagination.current_page }} of {{ pagination.last_page }}
        </span>
                <button
                    class="px-4 py-2 bg-white border border-gray-300 rounded-md shadow-sm hover:bg-gray-100 disabled:opacity-40 disabled:cursor-not-allowed transition"
                    @click="fetchJobs(pagination.current_page + 1)"
                    :disabled="pagination.current_page === pagination.last_page"
                >
                    Next
                </button>
            </div>
        </div>
    </section>
</template>

<style scoped>
.line-clamp-2 {
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}
.line-clamp {
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

/* Bonus: Smooth fade in on cards */
div[v-cloak] > * {
    opacity: 0;
    transform: translateY(10px);
    transition: opacity 0.3s ease, transform 0.3s ease;
}
div[v-cloak] > *[data-loaded] {
    opacity: 1;
    transform: translateY(0);
}
</style>
