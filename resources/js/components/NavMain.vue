<script setup lang="ts">
import { ref, computed } from 'vue';
import { usePage, Link } from '@inertiajs/vue3';
import type { NavItem } from '@/types';

import {
    SidebarMenu,
    SidebarMenuItem,
    SidebarMenuButton
} from '@/components/ui/sidebar';

const props = defineProps<{ items: NavItem[] }>();
const openItems = ref<Record<string, boolean>>({});

const toggleItem = (title: string) => {
    openItems.value[title] = !openItems.value[title];
};

const page = usePage();
const user = page.props.auth?.user;


const userRoles = computed(() => user?.roles ?? []);
const userPermissions = computed(() => user?.permissions ?? []);

console.log("page: ", page)

// Access check: based on permission and/or role
const hasAccess = (item: NavItem): boolean => {
    if (item.permission && !userPermissions.value.includes(item.permission)) {
        return false;
    }

    if (item.role) {
        const requiredRoles = Array.isArray(item.role) ? item.role : [item.role];
        return requiredRoles.some(role => userRoles.value.includes(role));
    }

    return true;
};

// Filter items recursively
const filteredItems = computed(() => {
    const filter = (items: NavItem[]): NavItem[] => {
        return items
            .filter(item => hasAccess(item))
            .map(item => ({
                ...item,
                children: item.children ? filter(item.children) : undefined,
            }))
            .filter(item => !item.children || item.children.length > 0);
    };

    return filter(props.items);
});
</script>

<template>
    <SidebarMenu>
        <template v-for="item in filteredItems" :key="item.title">
            <SidebarMenuItem>
                <!-- With children -->
                <template v-if="item.children && item.children.length">
                    <SidebarMenuButton class="w-full flex items-center gap-2" @click="toggleItem(item.title)">
                        <component v-if="item.icon" :is="item.icon" class="w-4 h-4" />
                        <span>{{ item.title }}</span>
                        <span class="ml-auto text-xs">{{ openItems[item.title] ? '▾' : '▸' }}</span>
                    </SidebarMenuButton>
                    <div v-if="openItems[item.title]" class="ml-6 mt-1 space-y-1">
                        <SidebarMenuItem
                            v-for="child in item.children"
                            :key="child.title"
                            class="text-sm"
                        >
                            <SidebarMenuButton as-child>
                                <Link :href="child.href" class="flex items-center gap-2">
                                    <component v-if="child.icon" :is="child.icon" class="w-4 h-4" />
                                    <span>{{ child.title }}</span>
                                </Link>
                            </SidebarMenuButton>
                        </SidebarMenuItem>
                    </div>
                </template>

                <!-- Without children -->
                <template v-else>
                    <SidebarMenuButton as-child>
                        <Link :href="item.href" class="flex items-center gap-2">
                            <component v-if="item.icon" :is="item.icon" class="w-4 h-4" />
                            <span>{{ item.title }}</span>
                        </Link>
                    </SidebarMenuButton>
                </template>
            </SidebarMenuItem>
        </template>
    </SidebarMenu>
</template>
