<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, router } from '@inertiajs/vue3';
import { ref, computed } from 'vue';

const props = defineProps({
    role: Object,
    allPermissions: Array
});

const selectedPermissions = ref<number[]>(
    props.role.permissions.map((p: any) => p.id)
);

const search = ref('');

// Computed filtered permission list
const filteredPermissions = computed(() =>
    props.allPermissions.filter(p =>
        p.name.toLowerCase().includes(search.value.toLowerCase())
    )
);

const togglePermission = (id: number) => {
    const index = selectedPermissions.value.indexOf(id);
    if (index > -1) {
        selectedPermissions.value.splice(index, 1);
    } else {
        selectedPermissions.value.push(id);
    }
};

const save = () => {
    router.put(`/roles/${props.role.id}/permissions`, {
        permissions: selectedPermissions.value
    });
};
</script>

<template>
    <Head :title="`Assign Permissions - ${props.role.name}`" />

    <AppLayout>
        <div class="w-full py-10 px-4">
            <h1 class="text-3xl font-bold mb-6">
                Assign Permissions to 
                <span class="text-indigo-600">"{{ props.role.name }}"</span>
            </h1>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Left Column: All Permissions -->
                <div class="p-6 rounded-box border shadow">
                    <h2 class="text-lg font-semibold mb-3">All Permissions</h2>

                    <div class="form-control mb-4">
                        <input
                            type="text"
                            v-model="search"
                            placeholder="Search permissions..."
                            class="input input-bordered w-full bg-black/10"
                        />
                    </div>

                    <div class="overflow-y-auto max-h-[500px] space-y-2">
                        <div
                            v-for="perm in filteredPermissions"
                            :key="perm.id"
                            class="flex items-center justify-between border px-4 py-2 rounded hover:bg-base-200 cursor-pointer transition"
                            @click="togglePermission(perm.id)"
                        >
                            <span class="text-sm">{{ perm.name }}</span>
                            <input
                                type="checkbox"
                                class="checkbox checkbox-success"
                                :checked="selectedPermissions.includes(perm.id)"
                                @change.prevent
                            />
                        </div>
                        <div v-if="filteredPermissions.length === 0" class="text-sm text-gray-500 mt-2">
                            No permissions found.
                        </div>
                    </div>
                </div>

                <!-- Right Column: Assigned Permissions -->
                <div class="p-6 rounded-box border shadow">
                    <h2 class="text-lg font-semibold mb-3">Assigned Permissions</h2>

                    <div class="min-h-[500px] border-dashed border-2 border-base-300 p-4 rounded">
                        <template v-if="selectedPermissions.length > 0">
                            <ul class="space-y-2">
                                <li
                                    v-for="perm in props.allPermissions.filter(p => selectedPermissions.includes(p.id))"
                                    :key="perm.id"
                                    class="flex items-center justify-between border px-4 py-2 rounded hover:bg-base-200 transition"
                                >
                                    <span class="text-sm font-medium text-gray-700">
                                        {{ perm.name }}
                                    </span>
                                    <span class="badge badge-info badge-outline">Assigned</span>
                                </li>
                            </ul>
                        </template>
                        <template v-else>
                            <p class="text-sm text-gray-500">No permissions assigned.</p>
                        </template>
                    </div>
                </div>

            </div>

            <div class="flex justify-end mt-8">
                <button @click="save" class="btn btn-primary px-6">
                    Save Changes
                </button>
            </div>
        </div>
    </AppLayout>
</template>
