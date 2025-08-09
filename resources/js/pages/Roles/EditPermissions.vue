<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, router } from '@inertiajs/vue3';
import { ref, computed } from 'vue';
import draggable from 'vuedraggable';

const props = defineProps({
    role: Object,
    allPermissions: Array
});

const search = ref('');
const selectedPermissionsObjects = ref(
    props.role.permissions.map((p: any) => ({ ...p }))
);

// Permissions not yet assigned
const availablePermissions = computed(() =>
    props.allPermissions
        .filter((p: any) =>
            p.name.toLowerCase().includes(search.value.toLowerCase())
        )
        .filter((p: any) =>
            !selectedPermissionsObjects.value.some(sp => sp.id === p.id)
        )
);

const save = () => {
    const ids = selectedPermissionsObjects.value.map(p => p.id);
    router.put(`/roles/${props.role.id}/permissions`, {
        permissions: ids
    });
};
</script>

<template>
    <Head :title="`Assign Permissions - ${props.role.name}`" />

    <AppLayout>
        <div class="flex items-center justify-center min-h-screen bg-gray-100 px-4">
            <div class="w-full max-w-6xl bg-white p-8 rounded shadow">
                <h1 class="text-3xl font-bold mb-8 text-center">
                    Assign Permissions to
                    <span class="text-indigo-600">"{{ props.role.name }}"</span>
                </h1>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <!-- Available Permissions -->
                    <div>
                        <h2 class="text-lg font-semibold mb-3">Available Permissions</h2>

                        <input
                            type="text"
                            v-model="search"
                            placeholder="Search permissions..."
                            class="w-full px-3 py-2 border border-gray-300 rounded mb-4"
                        />

                        <draggable
                            :list="availablePermissions"
                            :group="{ name: 'permissions' }"
                            item-key="id"
                            class="min-h-[400px] max-h-[500px] overflow-y-auto border rounded p-4 space-y-2 bg-gray-50"
                        >
                            <template #item="{ element }">
                                <div class="p-2 bg-white border rounded shadow-sm cursor-move hover:bg-gray-100">
                                    {{ element.name }}
                                </div>
                            </template>
                        </draggable>
                    </div>

                    <!-- Assigned Permissions -->
                    <div>
                        <h2 class="text-lg font-semibold mb-3">Assigned Permissions</h2>

                        <draggable
                            v-model="selectedPermissionsObjects"
                            :group="{ name: 'permissions' }"
                            item-key="id"
                            class="min-h-[400px] max-h-[500px] overflow-y-auto border-dashed border-2 rounded p-4 space-y-2 bg-gray-50"
                        >
                            <template #item="{ element }">
                                <div class="p-2 bg-green-50 border border-green-300 rounded shadow-sm flex justify-between items-center">
                                    <span>{{ element.name }}</span>
                                    <span class="text-xs text-green-700 border border-green-400 px-2 py-0.5 rounded">
                    Assigned
                  </span>
                                </div>
                            </template>
                        </draggable>
                    </div>
                </div>

                <div class="flex justify-end mt-8">
                    <button
                        @click="save"
                        class="bg-indigo-600 hover:bg-indigo-700 text-white px-6 py-2 rounded shadow"
                    >
                        Save Changes
                    </button>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
