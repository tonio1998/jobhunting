<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, router } from '@inertiajs/vue3';
import { ref } from 'vue';
import draggable from 'vuedraggable';

const props = defineProps({
    roles: Array, // roles with permissions
});

const roles = ref(JSON.parse(JSON.stringify(props.roles))); // clone to make draggable reactive
const newRole = ref('');

const addRole = () => {
    if (!newRole.value.trim()) return;
    router.post('/roles', { name: newRole.value }, {
        onSuccess: () => newRole.value = '',
    });
};

const updateRoleName = (role) => {
    router.put(`/roles/${role.id}`, { name: role.name });
};

const deleteRole = (roleId) => {
    if (confirm('Are you sure?')) {
        router.delete(`/roles/${roleId}`);
    }
};

const onDrop = (event) => {
    const { item, from, to } = event;
    const permission = item;
    const fromRoleId = parseInt(from.dataset.roleId);
    const toRoleId = parseInt(to.dataset.roleId);

    if (fromRoleId !== toRoleId) {
        router.post('/roles/move-permission', {
            permission_id: permission.id,
            from_role_id: fromRoleId,
            to_role_id: toRoleId,
        });
    }
};
</script>

<template>
    <Head title="Roles" />
    <AppLayout>
        <div class="max-w-7xl mx-auto py-10 px-4 sm:px-6 lg:px-8">
            <h1 class="text-2xl font-bold text-gray-800 mb-6">Roles</h1>

            <div class="mb-6 flex gap-4">
                <input
                    type="text"
                    v-model="newRole"
                    placeholder="New Role"
                    class="border rounded px-4 py-2 w-64"
                />
                <button @click="addRole" class="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700">
                    Add Role
                </button>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <div
                    v-for="role in roles"
                    :key="role.id"
                    class="bg-white rounded-lg border shadow p-4"
                >
                    <div class="flex justify-between items-center mb-2">
                        <input
                            class="font-bold text-lg text-gray-700 border-b border-gray-300 focus:outline-none focus:border-indigo-500 w-full"
                            v-model="role.name"
                            @blur="updateRoleName(role)"
                        />
                        <button @click="deleteRole(role.id)" class="text-red-500 text-sm ml-2 hover:underline">Delete</button>
                    </div>

                    <draggable
                        v-model="role.permissions"
                        group="permissions"
                        item-key="id"
                        class="min-h-[60px]"
                        @change="onDrop"
                        :data-role-id="role.id"
                    >
                        <template #item="{ element }">
                            <div
                                class="inline-block bg-indigo-100 text-indigo-800 text-xs px-2 py-1 rounded mr-2 mb-2 cursor-move"
                            >
                                {{ element.name }}
                            </div>
                        </template>
                    </draggable>
                </div>
            </div>
        </div>
    </AppLayout>
</template>

<style scoped>
/* Optional styling tweaks */
</style>
