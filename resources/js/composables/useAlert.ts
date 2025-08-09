import { ref } from 'vue'

export function useAlert() {
    const alert = ref<{
        show: boolean
        type: 'success' | 'error' | 'info'
        message: string
    }>({
        show: false,
        type: 'success',
        message: ''
    })

    const showAlert = (
        type: 'success' | 'error' | 'info',
        message: string,
        duration = 5000
    ) => {
        alert.value = { show: true, type, message }

        setTimeout(() => {
            alert.value.show = false
        }, duration)
    }

    return {
        alert,
        showAlert
    }
}
