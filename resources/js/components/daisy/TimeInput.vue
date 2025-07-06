<template>
  <label class="input w-full max-w-sm items-center gap-2">
    <svg
      xmlns="http://www.w3.org/2000/svg"
      class="h-5 w-5 opacity-50"
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor"
    >
      <path
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
      />
    </svg>
    <input
      type="time"
      class="grow"
      :value="modelValue"
      :placeholder="placeholder"
      @input="$emit('update:modelValue', $event.target.value)"
    />
  </label>
</template>

<script setup>
defineProps({
  modelValue: String,
  placeholder: {
    type: String,
    default: 'Select time',
  },
})

defineEmits(['update:modelValue'])
</script>
