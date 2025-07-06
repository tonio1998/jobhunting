<script setup>
import AppLayout from '@/layouts/AppLayout.vue';
import { useForm, Head } from '@inertiajs/vue3';

const props = defineProps({
    permission: Object
});

const form = useForm({
    name: props.permission.name
});

function submit() {
    form.put(route('permissions.update', props.permission.id));
}
</script>

<template>
    <Head title="Edit Permission" />
    <AppLayout>
        <div class="max-w-3xl mx-auto py-10">
            <h1 class="text-2xl font-bold mb-6">Edit Permission</h1>

            <form @submit.prevent="submit" class="space-y-4">
                <div>
                    <label class="block font-medium">Permission Name</label>
                    <input v-model="form.name" type="text" class="input input-bordered w-full" required />
                </div>

                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
    </AppLayout>
</template>
