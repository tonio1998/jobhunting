<script setup lang="ts">
import { type NavItem } from '@/types';
import { Link } from '@inertiajs/vue3';
import {
    SidebarMenu,
    SidebarMenuItem,
    SidebarMenuButton,
} from '@/components/ui/sidebar';
import { ref } from 'vue';

const props = defineProps<{ items: NavItem[] }>();

// Manage open state per parent item
const openItems = ref<Record<string, boolean>>({});

const toggleItem = (title: string) => {
    openItems.value[title] = !openItems.value[title];
};
</script>

<template>
    <SidebarMenu>
        <template v-for="item in items" :key="item.title">
            <!-- If the item has children -->
            <SidebarMenuItem>
                <template v-if="item.children && item.children.length">
                    <SidebarMenuButton class="w-full flex items-center gap-2" @click="toggleItem(item.title)">
                        <component v-if="item.icon" :is="item.icon" class="w-4 h-4" />
                        <span>{{ item.title }}</span>
                        <span class="ml-auto text-xs">{{ openItems[item.title] ? '▾' : '▸' }}</span>
                    </SidebarMenuButton>

                    <!-- Sublinks -->
                    <div v-if="openItems[item.title]" class="ml-6 mt-1 space-y-1">
                        <SidebarMenuItem
                            v-for="child in item.children"
                            :key="child.title"
                            class="text-sm"
                        >
                            <SidebarMenuButton>
                                <Link :href="child.href">{{ child.title }}</Link>
                            </SidebarMenuButton>
                        </SidebarMenuItem>
                    </div>
                </template>

                <!-- If the item is a regular link -->
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
