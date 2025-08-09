<template>
    <div
        v-if="visible"
        class="fixed inset-0 z-[9999] flex items-center justify-center bg-black/50"
    >
        <div class="bg-white px-15 py-8 rounded-[8px] shadow-lg p-15">
            <div class="flex items-center space-x-3">
                <span class="dot animate-bounce1 bg-blue-400"></span>
                <span class="dot animate-bounce2 bg-blue-600"></span>
                <span class="dot animate-bounce3 bg-yellow-400"></span>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
defineProps<{
    visible: boolean;
}>();
</script>

<style scoped>
.dot {
    width: 14px;
    height: 14px;
    border-radius: 9999px;
    display: inline-block;
}

@keyframes bounce1 {
    0%, 80%, 100% {
        transform: scale(0);
        opacity: 0.2;
    }
    40% {
        transform: scale(1);
        opacity: 1;
    }
}
@keyframes bounce2 {
    0%, 80%, 100% {
        transform: scale(0);
        opacity: 0.2;
    }
    40% {
        transform: scale(1);
        opacity: 1;
    }
}
@keyframes bounce3 {
    0%, 80%, 100% {
        transform: scale(0);
        opacity: 0.2;
    }
    40% {
        transform: scale(1);
        opacity: 1;
    }
}

.animate-bounce1 {
    animation: bounce1 1.4s infinite ease-in-out;
}

.animate-bounce2 {
    animation: bounce2 1.4s infinite ease-in-out;
    animation-delay: 0.2s;
}

.animate-bounce3 {
    animation: bounce3 1.4s infinite ease-in-out;
    animation-delay: 0.4s;
}
</style>
