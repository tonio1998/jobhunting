<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head } from '@inertiajs/vue3';
import { getDateDifferenceFormatted, formatDate, useDateFormatter } from '@/composables/useDateFormatter';
import { formatPeso } from '@/composables/format';

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Dashboard',
        href: '/dashboard',
    },
];

defineProps<{
    totalJobs: number;
    recentJobs: any[];
    stats: {
        activeUsers: number;
        applicationsToday: number;
        applications: number;
    };
}>();


</script>

<template>
    <Head title="Dashboard" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex h-full flex-1 flex-col gap-4 rounded-xl p-4 overflow-x-auto">
            <div class="grid auto-rows-min gap-4 md:grid-cols-3">
                <div class="relative aspect-video overflow-hidden rounded-xl dark:border-sidebar-border">
                    <div class="grid auto-rows-min gap-4 md:grid-cols-2">
                        <div class="relative aspect-video overflow-hidden rounded-xl border border-sidebar-border/70 dark:border-sidebar-border">
                            <div class="p-2">
                                <h1 class="font-bold text-xl">{{ totalJobs}}</h1>
                                <div class="text-sm">
                                    Total Jobs
                                </div>
                            </div>
                        </div>
                        <div class="relative aspect-video overflow-hidden rounded-xl border border-sidebar-border/70 dark:border-sidebar-border">
                            <div class="p-2">
                                <h1 class="font-bold text-xl">{{ recentJobs.length}}</h1>
                                <div class="text-sm">
                                    Recent Jobs
                                </div>
                            </div>
                        </div>
                        <div class="relative aspect-video overflow-hidden rounded-xl border border-sidebar-border/70 dark:border-sidebar-border">
                            <div class="p-2">
                                <h1 class="font-bold text-xl">{{ stats.applications }}</h1>
                                <div class="text-sm">
                                    Applicants
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="relative aspect-video overflow-hidden rounded-xl border border-sidebar-border/70 dark:border-sidebar-border">
                    <PlaceholderPattern />
                </div>
                <div class="relative aspect-video overflow-hidden rounded-xl border border-sidebar-border/70 dark:border-sidebar-border">
                    <PlaceholderPattern />
                </div>
            </div>
            <div class="grid auto-rows-min gap-4 md:grid-cols-2">
                <div class="relative overflow-hidden rounded-xl border border-sidebar-border/70 dark:border-sidebar-border">
                    <div class="p-3">
                        <div class="p-2">
                            <h1 class="font-bold text-xl">Recent Jobs</h1>
                        </div>
                        <div
                            v-for="(bid, index) in recentJobs"
                            :key="index"
                            class="flex items-start justify-between gap-4 p-4 mb-2 rounded-lg border border-gray-100 dark:border-gray-700 bg-white dark:bg-gray-900 shadow-sm"
                        >
                            <div class="flex items-center justify-center w-10 h-10 rounded-full bg-green-100">
                                <IconHeroiconsOutlineClipboardDocument  class="w-5 h-5" />
                            </div>

                            <div class="flex-1 space-y-1">
                                <h3 class="font-semibold text-base text-gray-800 dark:text-gray-100">
                                    {{ bid?.title || 'Job Title' }}
                                </h3>
                                <p class="text-sm text-gray-500 dark:text-gray-400">
                                    Project length: {{
                                        getDateDifferenceFormatted(bid.start_date, bid.end_date) === '0 day'
                                            ? '1 day'
                                            : getDateDifferenceFormatted(bid.start_date, bid.end_date)
                                    }}
                                </p>
                                <p class="text-sm text-gray-500 dark:text-gray-400">
                                    Due Date: {{ formatDate(bid.due_date) }}
                                </p>
                            </div>
                            <div class="text-right">
                                <p class="text-lg font-bold text-green-700 dark:text-green-400">
                                    ₱{{ formatPeso(bid.rate_amount) || '0' }}
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="grid auto-rows-min gap-4 md:grid-cols-6">
            </div>
        </div>
    </AppLayout>
</template>
