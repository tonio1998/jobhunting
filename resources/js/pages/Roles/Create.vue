<script setup>
import AppLayout from '@/layouts/AppLayout.vue';
import { useForm, Head, router } from '@inertiajs/vue3';

const props = defineProps({
    permissions: Array
});

const form = useForm({
    name: '',
    permissions: []
});

function submit() {
    form.post(route('roles.store'));
}
</script>

<template>
    <Head title="Create Role" />
    <AppLayout>
        <div class="max-w-3xl mx-auto py-10">
            <h1 class="text-2xl font-bold mb-6">Create Role</h1>

            <form @submit.prevent="submit" class="space-y-4">
                <div>
                    <label class="block font-medium">Role Name</label>
                    <input v-model="form.name" type="text" class="input input-bordered w-full" required />
                </div>

                <div>
                    <label class="block font-medium">Permissions</label>
                    <div class="grid grid-cols-2 gap-2">
                        <label v-for="perm in permissions" :key="perm.id" class="flex items-center gap-2">
                            <input type="checkbox" :value="perm.name" v-model="form.permissions" />
                            {{ perm.name }}
                        </label>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        </div>
    </AppLayout>
</template>