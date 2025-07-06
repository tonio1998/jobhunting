<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head } from '@inertiajs/vue3';

const props = defineProps({
    permissions: Object,
});
</script>

<template>
    <Head title="Permissions" />

    <AppLayout>
        <div class="max-w-7xl mx-auto py-10 px-4 sm:px-6 lg:px-8">
            <h1 class="text-2xl font-bold text-gray-800 mb-4">Permissions</h1>

            <table class="table w-full">
                <thead>
                    <tr class="bg-gray-100 text-sm">
                        <th class="py-2 px-4 text-left">Permission</th>
                        <th class="py-2 px-4 text-left">Assigned to Roles</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="permission in permissions" :key="permission.id" class="border-t">
                        <td class="py-2 px-4">{{ permission.name }}</td>
                        <td class="py-2 px-4">
                            <span
                                v-for="role in permission.roles"
                                :key="role.id"
                                class="inline-block bg-green-100 text-green-800 text-xs px-2 py-1 rounded mr-2 mb-1"
                            >
                                {{ role.name }}
                            </span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </AppLayout>
</template>
