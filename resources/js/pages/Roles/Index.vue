<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, Link, router } from '@inertiajs/vue3';
import { ref } from 'vue';
import type { BreadcrumbItem } from '@/types';

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Roles Management',
        href: '/roles',
    },
];

const props = defineProps({
    roles: Array,
});

const newRole = ref('');

const addRole = () => {
    if (!newRole.value.trim()) return;
    router.post('/roles', { name: newRole.value }, {
        onSuccess: () => newRole.value = '',
    });
};

const deleteRole = (roleId: number) => {
    if (confirm('Are you sure you want to delete this role?')) {
        router.delete(`/roles/${roleId}`);
    }
};
</script>

<template>
    <Head title="Roles" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="w-full mx-auto py-10 px-4 sm:px-6 lg:px-8">
            <h1 class="text-2xl font-bold text-gray-800 mb-6">Roles Management</h1>

            <!-- Add Role -->
            <div class="mb-6 flex gap-4">
                <input
                    type="text"
                    v-model="newRole"
                    placeholder="New Role Name"
                    class="border rounded px-4 py-2 w-64"
                />
                <button @click="addRole" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">
                    Add Role
                </button>
            </div>

            <!-- Roles Table -->
            <div class="overflow-x-auto bg-white shadow rounded-lg">
                <table class="table-auto w-full text-left border border-gray-200">
                    <thead class="bg-gray-100 text-gray-700 text-sm">
                        <tr>
                            <th class="px-4 py-3">Role</th>
                            <th class="px-4 py-3">Permissions</th>
                            <th class="px-4 py-3">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="role in props.roles" :key="role.id" class="border-t">
                            <td class="px-4 py-3 font-medium text-gray-800">
                                {{ role.name }}
                            </td>
                            <td class="px-4 py-3">
                                <div class="flex flex-wrap gap-1">
                                    <span
                                        v-for="perm in role.permissions"
                                        :key="perm.id"
                                        class="bg-indigo-100 text-indigo-800 text-xs px-2 py-1 rounded"
                                    >
                                        {{ perm.name }}
                                    </span>
                                </div>
                            </td>
                            <td class="px-4 py-3 whitespace-nowrap space-x-2">
                                <Link
                                    :href="`/roles/${role.id}/edit`"
                                    class="btn btn-sm bg-green-100 border border-0 text-green-800"
                                >
                                    <IconHeroiconsOutlinePencilSquare  class="w-5 h-5" />
                                    Edit
                                </Link>
                                <Link
                                    :href="`/roles/${role.id}/permissions`"
                                    class="btn btn-sm bg-blue-100 border border-0 text-blue-800"
                                >
                                    <IconHeroiconsOutlineKey   class="w-5 h-5" />
                                    Assign Permissions
                                </Link>
                                <button
                                    @click="deleteRole(role.id)"
                                    class="btn btn-sm bg-red-100 border border-0 text-red-800"
                                >
                                    <IconHeroiconsOutlineTrash   class="w-5 h-5" />
                                    Delete
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </AppLayout>
</template>
