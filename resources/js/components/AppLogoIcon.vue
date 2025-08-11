<script setup lang="ts">
import type { HTMLAttributes } from 'vue';

defineOptions({
    inheritAttrs: false,
});

interface Props {
    className?: HTMLAttributes['class'];
}

defineProps<Props>();
</script>

<template>
    <img
        src="/images/launcher_icon.png"
        :class="className"
        v-bind="$attrs"
        alt="Worklinker Logo"
    />

</template>
