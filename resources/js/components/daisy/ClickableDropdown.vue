<template>
    <div class="dropdown" ref="dropdownRef">
        <button
            class="btn m-1 btn-sm flex items-center gap-1"
            @click="toggleDropdown"
            :aria-expanded="isOpen"
        >
            {{ buttonText }}
            <svg
                :class="{ 'rotate-180': isOpen }"
                class="w-4 h-4 transition-transform duration-200"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                viewBox="0 0 24 24"
            >
                <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
            </svg>
        </button>

        <ul
            v-if="isOpen"
            class="dropdown-content  menu bg-muted rounded-box z-10 w-52 p-2 shadow-sm"
        >
            <slot v-if="$slots.default" />

            <template v-else>
                <li v-for="(item, index) in items" :key="index">
                    <a
                        v-if="item.href"
                        :href="item.href"
                        class="flex items-center gap-2"
                        @click="isOpen = false"
                    >
                        <component :is="item.icon" v-if="item.icon" class="w-4 h-4" />
                        {{ item.label }}
                    </a>
                    <a
                        v-else
                        href="#"
                        class="flex items-center gap-2"
                        @click.prevent="handleSelect(item)"
                    >
                        <component :is="item.icon" v-if="item.icon" class="w-4 h-4" />
                        {{ item.label }}
                    </a>
                </li>
            </template>
        </ul>
    </div>
</template>
<script setup>
import { ref } from 'vue';
import { onClickOutside } from '@vueuse/core';

const props = defineProps({
    items: {
        type: Array,
        default: () => []
    },
    buttonText: {
        type: String,
        default: 'Menu'
    }
});

const emit = defineEmits(['select']);

const isOpen = ref(false);
const dropdownRef = ref(null);

const toggleDropdown = () => {
    isOpen.value = !isOpen.value;
};

const handleSelect = (item) => {
    if (item.action && typeof item.action === 'function') {
        item.action(); // 💥 This is the missing piece
    }
    emit('select', item);
    isOpen.value = false;
};

onClickOutside(dropdownRef, () => {
    isOpen.value = false;
});
</script>
