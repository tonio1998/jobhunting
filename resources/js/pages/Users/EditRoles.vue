<script setup>
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, router } from '@inertiajs/vue3';
import { ref } from 'vue';
import IconTextButton from '@/components/daisy/IconTextButton.vue';

const props = defineProps({
    user: Object,
    roles: Array,
});

const isLoading = ref(false);
const selectedRoles = ref(props.user.roles.map(role => role.name));

const updateRoles = async () => {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
        router.put(route('users.roles.update', props.user.id), {
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
        <div class="max-w-xl mx-auto py-10">
            <h1 class="text-2xl font-bold mb-6">Edit Roles for {{ user.name }}</h1>

            <form @submit.prevent="updateRoles" class="space-y-4">
                <div v-for="role in roles" :key="role.id">
                    <label class="inline-flex items-center">
                        <input type="checkbox" checked="checked" class="checkbox checkbox-md border" :value="role.name" v-model="selectedRoles"/>
                        <span class="ml-2">{{ role.name }}</span>
                    </label>
                </div>

                <IconTextButton
                    type="submit"
                    :loading="isLoading"
                    :disabled="isLoading"
                    @click="updateRoles"
                >
                    <template #icon>
                        <IconHeroiconsOutlinePaperAirplane class="w-5 h-5" />
                    </template>
                    Update Roles
                </IconTextButton>
            </form>
        </div>
    </AppLayout>
</template>
