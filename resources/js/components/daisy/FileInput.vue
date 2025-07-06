<template>
  <label class="input w-full max-w-sm items-center gap-2 cursor-pointer">
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
        d="M12 4v16m8-8H4"
      />
    </svg>
    <input
      type="file"
      class="hidden"
      @change="handleFileChange"
      :accept="accept"
    />
    <span class="grow truncate">{{ fileName || placeholder }}</span>
  </label>
</template>

<script setup>
import { ref, watch } from 'vue'

const emit = defineEmits(['update:modelValue'])
const props = defineProps({
  modelValue: File,
  placeholder: {
    type: String,
    default: 'Choose a file',
  },
  accept: {
    type: String,
    default: '', // e.g., "image/*,.pdf"
  },
})

const fileName = ref('')

const handleFileChange = (event) => {
  const file = event.target.files[0]
  if (file) {
    fileName.value = file.name
    emit('update:modelValue', file)
  }
}

watch(() => props.modelValue, (newFile) => {
  fileName.value = newFile?.name || ''
})
</script>
