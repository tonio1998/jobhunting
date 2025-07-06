<script setup>
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, router } from '@inertiajs/vue3';
import { ref } from 'vue';

const props = defineProps({
    user: Object,
    permissions: Array,
});

const selectedPermissions = ref(props.user.permissions.map(p => p.name));

const updatePermissions = () => {
    router.put(route('users.permissions.update', props.user.id), {
        permissions: selectedPermissions.value,
    });
};
</script>

<template>
    <Head title="Edit Permissions" />
    <AppLayout>
        <div class="max-w-xl mx-auto py-10">
            <h1 class="text-2xl font-bold mb-6">Edit Permissions for {{ user.name }}</h1>

            <form @submit.prevent="updatePermissions" class="space-y-4">
                <div v-for="permission in permissions" :key="permission.id">
                    <label class="inline-flex items-center">
                        <input
                            type="checkbox"
                            :value="permission.name"
                            v-model="selectedPermissions"
                            class="form-checkbox"
                        />
                        <span class="ml-2">{{ permission.name }}</span>
                    </label>
                </div>

                <button
                    type="submit"
                    class="mt-4 bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700"
                >
                    Update Permissions
                </button>
            </form>
        </div>
    </AppLayout>
</template>
