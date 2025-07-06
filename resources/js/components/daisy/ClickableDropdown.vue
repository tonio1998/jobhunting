<template>
  <div class="dropdown" ref="dropdownRef">
    <button
      class="btn m-1"
      @click="toggleDropdown"
      :aria-expanded="isOpen"
    >
      {{ buttonText }}
    </button>

    <ul
      v-if="isOpen"
      class="dropdown-content menu bg-base-100 rounded-box z-10 w-52 p-2 shadow-sm"
    >
      <li v-for="(item, index) in items" :key="index">
        <a
          v-if="item.href"
          :href="item.href"
          class="block"
          @click="isOpen = false"
        >
          {{ item.label }}
        </a>
        <a
          v-else
          href="#"
          class="block"
          @click.prevent="handleSelect(item)"
        >
          {{ item.label }}
        </a>
      </li>
    </ul>
  </div>
</template>

<!-- <ClickableDropdown
  :items="[
    { label: 'Home', href: '/' },
    { label: 'Profile', href: '/profile' },
    { label: 'Custom Action', value: 'doSomething' }
  ]"
  button-text="Options"
  @select="onDropdownSelect"
/> -->

<script setup>
import { ref } from 'vue';
import { onClickOutside } from '@vueuse/core';

const props = defineProps({
  items: {
    type: Array,
    default: () => [
      { label: 'Item 1', href: '/item-1' },
      { label: 'Item 2', value: 'custom-action' }
    ]
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
  emit('select', item);
  isOpen.value = false;
};

onClickOutside(dropdownRef, () => {
  isOpen.value = false;
});
</script>
