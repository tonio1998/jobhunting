<script setup>
import AppLayout from '@/layouts/AppLayout.vue';
import { useForm, Head } from '@inertiajs/vue3';

const props = defineProps({
    role: Object,
    permissions: Array
});

const form = useForm({
    name: props.role.name,
    permissions: props.role.permissions.map(p => p.name)
});

function submit() {
    form.put(route('roles.update', props.role.id));
}
</script>

<template>
    <Head title="Edit Role" />

    <AppLayout>
        <div class="max-w-7xl w-10xl mx-auto py-10 px-4">
            <h1 class="text-3xl font-bold mb-6">Edit Role</h1>

            <form @submit.prevent="submit" class="space-y-6">
                <!-- Role Name -->
                <div class="form-control">
                    <label class="label font-medium text-sm">Role Name</label>
                    <input
                        v-model="form.name"
                        type="text"
                        class="input input-bordered w-full"
                        required
                    />
                </div>

                <!-- Submit -->
                <div class="flex justify-end">
                    <button type="submit" class="btn btn-success px-6">
                        Update Role
                    </button>
                </div>
            </form>
        </div>
    </AppLayout>
</template>
