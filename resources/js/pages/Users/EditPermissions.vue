<script setup>
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, router } from '@inertiajs/vue3';
import { ref, computed } from 'vue';
import draggable from 'vuedraggable';

const props = defineProps({
    user: Object,
    permissions: Array,
});

const selectedPermissions = ref(props.user.permissions.map(p => p.name));

const availablePermissions = computed(() =>
    props.permissions.map(p => p.name).filter(name => !selectedPermissions.value.includes(name))
);

const updatePermissions = () => {
    router.put(route('users.permissions.update', props.user.id), {
        permissions: selectedPermissions.value,
    });
};
</script>
<template>
    <Head title="Edit Permissions" />
    <AppLayout>
        <div class="flex items-center justify-center min-h-screen bg-gray-100 px-4">
            <div class="w-full max-w-4xl bg-white p-6 rounded shadow">
                <h1 class="text-2xl font-bold mb-6 text-center">
                    Edit Permissions for {{ user.name }}
                </h1>

                <form @submit.prevent="updatePermissions" class="grid grid-cols-2 gap-6">
                    <!-- Available Permissions -->
                    <div>
                        <h2 class="font-semibold mb-2">Available Permissions</h2>
                        <draggable
                            :list="availablePermissions"
                            :group="{ name: 'permissions', pull: 'clone', put: false }"
                            item-key="name"
                            class="bg-gray-50 border rounded p-4 min-h-[150px] space-y-2"
                        >
                            <template #item="{ element }">
                                <div class="p-2 border rounded bg-gray-100">{{ element }}</div>
                            </template>
                        </draggable>
                    </div>

                    <!-- Assigned Permissions -->
                    <div>
                        <h2 class="font-semibold mb-2">Assigned Permissions</h2>
                        <draggable
                            v-model="selectedPermissions"
                            :group="{ name: 'permissions', pull: true, put: true }"
                            item-key="name"
                            class="bg-gray-50 border rounded p-4 min-h-[150px] space-y-2"
                        >
                            <template #item="{ element }">
                                <div class="p-2 border rounded bg-green-100 flex justify-between items-center">
                                    <span>{{ element }}</span>
                                    <button
                                        type="button"
                                        @click="selectedPermissions = selectedPermissions.filter(p => p !== element)"
                                        class="text-red-500 hover:text-red-700"
                                    >
                                        ✕
                                    </button>
                                </div>
                            </template>
                        </draggable>
                    </div>

                    <div class="col-span-2 text-center">
                        <button
                            type="submit"
                            class="mt-4 bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700"
                        >
                            Update Permissions
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </AppLayout>
</template>
