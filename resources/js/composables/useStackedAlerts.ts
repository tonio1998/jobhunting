import { ref } from 'vue'

type AlertType = 'success' | 'error' | 'info'

interface AlertItem {
    id: number
    type: AlertType
    message: string
}

let idCounter = 0

export function useStackedAlerts() {
    const alerts = ref<AlertItem[]>([])

    const showAlert = (
        type: AlertType,
        message: string,
        duration = 5000
    ) => {
        const id = ++idCounter
        alerts.value.push({ id, type, message })

        setTimeout(() => {
            alerts.value = alerts.value.filter(a => a.id !== id)
        }, duration)
    }

    const closeAlert = (id: number) => {
        alerts.value = alerts.value.filter(a => a.id !== id)
    }

    return {
        alerts,
        showAlert,
        closeAlert
    }
}
