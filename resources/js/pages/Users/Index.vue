<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, router, Link } from '@inertiajs/vue3';
import { ref, watch } from 'vue';
import SearchInput from '@/components/daisy/SearchInput.vue';
import { useDateFormatter } from '@/composables/useDateFormatter';
import ClickableDropdown from '@/components/daisy/ClickableDropdown.vue';
import { KeyIcon, UserGroupIcon } from '@heroicons/vue/24/outline'

const props = defineProps({
    users: Object,
    filters: Object
});

const search = ref(props.filters.search || '');
const sort = ref(props.filters.sort || 'name');
const direction = ref(props.filters.direction || 'asc');
const { formatDate } = useDateFormatter();

watch([search, sort, direction], () => {
    router.get(route('users.index'), {
        search: search.value,
        sort: sort.value,
        direction: direction.value
    }, {
        preserveState: true,
        replace: true
    });
});

const breadcrumbs: any[] = [
    {
        title: 'Users',
        href: '/users',
    },
];

</script>

<template>
    <Head title="Users" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="w-full mx-auto py-10 px-4 sm:px-6 lg:px-8">
            <h1 class="text-2xl font-bold text-gray-800 mb-4">Users</h1>

            <div class="mb-4 flex items-center justify-between">
                <SearchInput v-model="search" />
            </div>

            <div class="overflow-x-auto rounded shadow">
                <table class="table w-full">
                    <thead class="text-sm text-gray-700 bg-black/10">
                        <tr>
                            <th>Actions</th>
                            <th
                                @click="sort = 'name'; direction = direction === 'asc' ? 'desc' : 'asc'"
                                class="cursor-pointer"
                            >
                                Name
                            </th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Location</th>
                            <th>Joined</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="user in users.data" :key="user.id">
                            <td class="space-x-2">
                                <ClickableDropdown
                                    :items="[
                                        { label: 'Roles', href: `/users/${user.id}/roles`, icon: UserGroupIcon },
                                        { label: 'Permission', href: `/users/${user.id}/permissions`, icon: KeyIcon },
                                      ]"
                                />
                            </td>
                            <td>
                                <div class="flex items-center gap-3">
                                    <div class="avatar">
                                        <div class="mask mask-squircle w-10 h-10">
                                            <img
                                            :src="user.avatar || user.profile_pic || '/images/launcher_icon.png'"
                                            @error="e => e.target.src = '/images/launcher_icon.png'"
                                            alt="Avatar"
                                            />

                                        </div>
                                    </div>
                                    <div>
                                        <div class="font-bold uppercase">{{ user.name }}</div>
                                        <div>{{ user.email }}</div>
                                    </div>
                                </div>
                            </td>
                            <td>{{ user.phone_number || '—' }}</td>
                            <td>
                            <span v-if="user.roles.length">
                                {{ user.roles.map(role => role.name).join(', ') }}
                            </span>
                            <span v-else>--</span>
                            </td>

                            <td>{{ user.current_location || '--' }}</td>
                            <td>{{ formatDate(user.created_at) }}</td>
                        </tr>
                        <tr v-if="users.data.length === 0">
                            <td colspan="5" class="text-center text-gray-500 py-4">No users found.</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="mt-4 flex justify-center space-x-1">
                <template v-for="page in users.links" :key="page.label">
                    <Link
                    v-if="page.url"
                    :href="page.url"
                    v-html="page.label"
                    class="px-3 py-1 border rounded text-sm"
                    :class="{
                        'bg-primary-500 text-white': page.active,
                        'text-gray-700 hover:bg-gray-100': !page.active
                    }"
                    />
                    <span
                    v-else
                    v-html="page.label"
                    class="px-3 py-1 border rounded text-sm text-gray-400 cursor-not-allowed"
                    />
                </template>
            </div>


        </div>
    </AppLayout>
</template>
