<script setup>
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, router } from '@inertiajs/vue3';
import { ref, computed } from 'vue';
import draggable from 'vuedraggable';
import IconTextButton from '@/components/daisy/IconTextButton.vue';

const props = defineProps({
    user: Object,
    roles: Array,
});

const isLoading = ref(false);
const selectedRoles = ref(props.user.roles.map(role => role.name));

const availableRoles = computed(() => {
    return props.roles.map(r => r.name).filter(name => !selectedRoles.value.includes(name));
});

const updateRoles = async () => {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
        await router.put(route('users.roles.update', props.user.id), {
            roles: selectedRoles.value,
        });
    } finally {
        isLoading.value = false;
    }
};
</script>
<template>
    <Head title="Edit Roles" />
    <AppLayout>
        <div class="flex items-center justify-center min-h-screen bg-gray-100 px-4">
            <div class="w-full max-w-4xl bg-white p-6 rounded shadow">
                <h1 class="text-2xl font-bold mb-6">Edit Roles for {{ user.name }}</h1>

                <form @submit.prevent="updateRoles" class="grid grid-cols-2 gap-6">
                    <!-- Available Roles -->
                    <div>
                        <h2 class="font-semibold mb-2">Available Roles</h2>
                        <draggable
                            :list="availableRoles"
                            :group="{ name: 'roles', pull: 'clone', put: false }"
                            item-key="name"
                            class="bg-white border rounded p-4 min-h-[150px] space-y-2"
                        >
                            <template #item="{ element }">
                                <div class="p-2 border rounded bg-gray-100">{{ element }}</div>
                            </template>
                        </draggable>
                    </div>


                    <!-- Assigned Roles -->
                    <div>
                        <h2 class="font-semibold mb-2">Assigned Roles</h2>
                        <draggable
                            v-model="selectedRoles"
                            :group="{ name: 'roles', pull: true, put: true }"
                            item-key="name"
                            class="bg-white border rounded p-4 min-h-[150px] space-y-2"
                        >
                            <template #item="{ element }">
                                <div class="p-2 border rounded bg-green-100 flex justify-between items-center">
                                    <span>{{ element }}</span>
                                    <button @click="selectedRoles = selectedRoles.filter(r => r !== element)" type="button" class="text-red-500">✕</button>
                                </div>
                            </template>
                        </draggable>
                    </div>

                    Drag the role to the right, then tap Submit to continue.

                    <div class="col-span-2">
                        <IconTextButton
                            type="submit"
                            :loading="isLoading"
                            :disabled="isLoading"
                            class="mt-6"
                        >
                            <template #icon>
                                <IconHeroiconsOutlinePaperAirplane class="w-5 h-5" />
                            </template>
                            Update Roles
                        </IconTextButton>
                    </div>
                </form>
            </div>
        </div>
    </AppLayout>
</template>
