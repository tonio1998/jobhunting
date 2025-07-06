<template>
  <button
    :type="type"
    class="btn flex items-center gap-2"
    :disabled="loading"
    :class="{ 'btn-disabled': loading }"
  >
    <span v-if="loading" class="loading loading-spinner loading-sm"></span>
    <template v-else>
      <slot name="icon" />
    </template>
    <span><slot /></span>
  </button>
</template>

<!-- <IconTextButton :loading="isLoading" @click="handleClick">
                        <template #icon>
                        <IconHeroiconsOutlinePaperAirplane class="w-5 h-5" />
                        </template>
                        Send
                    </IconTextButton> -->

<script setup>
defineProps({
  loading: {
    type: Boolean,
    default: false,
  },
  type: {
    type: String,
    default: 'button',
  },
})
</script>
