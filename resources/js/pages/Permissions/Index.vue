<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, Link, router } from '@inertiajs/vue3';

const props = defineProps({
    permissions: Array, // make sure it's an array of permission objects
});

const deletePermission = (id: number) => {
    if (confirm('Are you sure you want to delete this permission?')) {
        router.delete(`/permissions/${id}`);
    }
};
</script>

<template>
    <Head title="Permissions" />

    <AppLayout>
        <div class="w-full mx-auto py-10 px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center mb-6">
                <h1 class="text-2xl font-bold text-gray-800">Permissions</h1>
                <Link
                    href="/permissions/create"
                    class="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700 text-sm"
                >
                    + New Permission
                </Link>
            </div>

            <table class="table w-full border">
                <thead>
                    <tr class="bg-gray-100 text-sm text-left">
                        <th class="py-2 px-4">Permission</th>
                        <th class="py-2 px-4">Assigned to Roles</th>
                        <th class="py-2 px-4">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="permission in permissions" :key="permission.id" class="border-t hover:bg-gray-50">
                        <td class="py-2 px-4 font-medium">{{ permission.name }}</td>
                        <td class="py-2 px-4">
                            <div class="flex flex-wrap gap-1">
                                <span
                                    v-for="role in permission.roles"
                                    :key="role.id"
                                    class="inline-block bg-green-100 text-green-800 text-xs px-2 py-1 rounded"
                                >
                                    {{ role.name }}
                                </span>
                            </div>
                        </td>
                        <td class="py-2 px-4 space-x-2 whitespace-nowrap">
                            <Link
                                :href="`/permissions/${permission.id}/edit`"
                                class="text-blue-600 text-sm hover:underline"
                            >
                                Edit
                            </Link>
                            <button
                                @click="deletePermission(permission.id)"
                                class="text-red-600 text-sm hover:underline"
                            >
                                Delete
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </AppLayout>
</template>
