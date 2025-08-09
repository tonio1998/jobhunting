// composables/useCountUp.ts
import { ref, Ref } from 'vue';

export function useCountUp(initialValue = 0): [Ref<number>, (newValue: number, duration?: number) => void] {
    const count = ref(initialValue);

    const animate = (newValue: number, duration = 500) => {
        if (newValue <= count.value) {
            count.value = newValue; // just set it (or skip entirely if you prefer)
            return;
        }

        const start = count.value;
        const change = newValue - start;
        const startTime = performance.now();

        const step = (now: number) => {
            const elapsed = now - startTime;
            const progress = Math.min(elapsed / duration, 1);
            count.value = Math.floor(start + change * progress);

            if (progress < 1) {
                requestAnimationFrame(step);
            }
        };

        requestAnimationFrame(step);
    };

    return [count, animate];
}
