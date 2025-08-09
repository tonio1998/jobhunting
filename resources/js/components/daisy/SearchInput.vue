<template>
    <label class="input w-full max-w-sm bg-white border border-accent-content/20 items-center gap-2 pr-2">
        <!-- Search icon -->
        <svg
            class="h-[1em] opacity-50"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
        >
            <g
                stroke-linejoin="round"
                stroke-linecap="round"
                stroke-width="2.5"
                fill="none"
                stroke="currentColor"
            >
                <circle cx="11" cy="11" r="8" />
                <path d="m21 21-4.3-4.3" />
            </g>
        </svg>

        <!-- Search input -->
        <input
            type="search"
            class="grow outline-none bg-transparent"
            :placeholder="placeholder"
            :value="modelValue"
            @input="$emit('update:modelValue', $event.target.value)"
        />

        <!-- Clear icon -->
        <button
            v-if="modelValue"
            type="button"
            class="text-gray-400 hover:text-black"
            @click="$emit('update:modelValue', '')"
        >
            <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-4 w-4"
                viewBox="0 0 20 20"
                fill="currentColor"
            >
                <path
                    fill-rule="evenodd"
                    d="M10 8.586L4.707 3.293 3.293 4.707 8.586 10l-5.293 5.293 1.414 1.414L10 11.414l5.293 5.293 1.414-1.414L11.414 10l5.293-5.293-1.414-1.414L10 8.586z"
                    clip-rule="evenodd"
                />
            </svg>
        </button>
    </label>
</template>

<script setup>
defineProps({
    modelValue: String,
    placeholder: {
        type: String,
        default: 'Search',
    },
})

defineEmits(['update:modelValue'])
</script>
