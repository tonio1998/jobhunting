<script setup lang="ts">
import AppLogoIcon from '@/components/AppLogoIcon.vue';

const appName = import.meta.env.VITE_APP_NAME;
</script>

<template>
    <div class="flex aspect-square items-center justify-center rounded-md text-sidebar-primary-foreground">
        <AppLogoIcon class="h-[40px] w-[40px] fill-current text-white dark:text-black" />
    </div>
    <div class="ml-1 grid flex-1 text-left text-lg">
        <span class="mb-0.5 truncate leading-tight font-bold">{{ appName }}</span>
    </div>
</template>
