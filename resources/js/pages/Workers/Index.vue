<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head } from '@inertiajs/vue3';
import { ref, watch, onMounted } from 'vue';
import SearchInput from '@/components/daisy/SearchInput.vue';
import { useDateFormatter } from '@/composables/useDateFormatter';
import ClickableDropdown from '@/components/daisy/ClickableDropdown.vue';
import { handleFormError } from '@/composables/useFormErrorHandler';
import AlertStack from '@/components/AlertStack.vue';
import LoadingOverlay from '@/components/LoadingOverlay.vue';
import { useStackedAlerts } from '@/composables/useStackedAlerts';
import { formatDate } from '@/composables/useDateFormatter';
import axios from 'axios';

const { alerts, showAlert, closeAlert } = useStackedAlerts();

const isLoading = ref(false);
const datalist = ref({
    data: [],
    links: [],
});

const props = defineProps({
    filters: Object
});

const search = ref(props.filters?.search ?? '');
const sort = ref('fullName');
const direction = ref(props.filters?.direction ?? 'asc');

const showModal = ref(false);
const modalData = ref({
    username: '',
    password: ''
});

const fetchGuardians = async () => {
    // isLoading.value = true;
    try {
        const response = await axios.get(route('workers.fetch'), {
            params: {
                search: search.value ?? '',
                sort: sort.value ?? 'fullName',
                direction: direction.value ?? 'asc'
            }
        });

        datalist.value = response.data;
    } catch (error) {
        handleFormError(error, showAlert);
    } finally {
        // isLoading.value = false;
    }
};

const fetchGuardiansFromUrl = async (url: string) => {
    // isLoading.value = true;
    try {
        const response = await axios.get(url);
        datalist.value = response.data;
    } catch (error) {
        handleFormError(error, showAlert);
    } finally {
        // isLoading.value = false;
    }
};

watch([search, sort, direction], fetchGuardians);
onMounted(fetchGuardians);

const breadcrumbs = [
    { title: 'Workers', href: '/workers' },
];

</script>

<template>
    <Head title="Students" />
    <LoadingOverlay :visible="isLoading" />
    <AppLayout :breadcrumbs="breadcrumbs">
        <AlertStack :alerts="alerts" @close="closeAlert" />

        <div v-if="showModal" class="fixed inset-0 flex items-center justify-center bg-black/50 z-50">
            <div class="bg-white p-6 rounded-lg shadow-md w-full max-w-sm">
                <h2 class="text-lg font-bold mb-4">Generated Credentials</h2>
                <p><strong>Username:</strong> {{ modalData.username }}</p>
                <p><strong>Password:</strong> {{ modalData.password }}</p>
                <button class="mt-4 px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700"
                        @click="showModal = false">
                    Close
                </button>
            </div>
        </div>

        <div class="w-full mx-auto py-10 px-4 sm:px-6 lg:px-8">
            <div class="mb-4 flex items-center justify-between">
                <SearchInput v-model="search" placeholder="Find something..." />
            </div>

            <div class="overflow-x-auto rounded shadow">
                <table class="table w-full">
                    <thead class="text-sm text-gray-700 bg-black/10">
                    <tr>
                        <th>Actions</th>
                        <th @click="sort = 'FirstName'; direction = direction === 'asc' ? 'desc' : 'asc'" class="cursor-pointer">
                            Name
                        </th>
                        <th>Phone</th>
                        <th>Date of Birth</th>
                        <th>Civil Status</th>
                        <th>Gender</th>
                        <th>Nationality</th>
                        <th>Created</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="list in datalist.data" :key="list.id">
                        <td class="space-x-2">
                            <ClickableDropdown
                                :items="[
                                        { label: 'Edit', href: `/guardians/${list.id}/edit` },
                                        { label: 'Show', href: `/guardians/${list.id}/show` },
                                    ]"
                            />
                        </td>
                        <td class="uppercase">
                            <b>{{ list.fullName }}</b><br>
                        </td>
                        <td>{{ list?.phoneNumber }}</td>
                        <td>{{ formatDate(list?.dob, 'date') }}</td>
                        <td>{{ list?.civilStatus }}</td>
                        <td>{{ list?.gender }}</td>
                        <td>{{ list?.Nationality }}</td>
                        <td>{{ formatDate(list?.created_at) }}</td>
                    </tr>
                    <tr v-if="datalist.data.length === 0">
                        <td colspan="7" class="text-center text-gray-500 py-4">No students found.</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div class="mt-4 flex justify-center space-x-1">
                <template v-for="page in datalist.links" :key="page.label">
                    <button
                        v-if="page.url"
                        @click="fetchGuardiansFromUrl(page.url)"
                        v-html="page.label"
                        class="px-3 py-1 border rounded text-sm"
                        :class="{
                            'bg-success text-white': page.active,
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
