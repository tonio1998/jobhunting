export function handleFormError(
    error: any,
    showAlert: (type: 'error' | 'success' | 'info', message: string) => void
) {
    if (!error) {
        showAlert('error', 'Unknown error occurred.')
        return
    }

    if (error.response && error.response.data) {
        const errors = error.response.data.errors || error.response.data

        if (typeof errors === 'string') {
            showAlert('error', errors)
        } else if (typeof errors === 'object') {
            Object.values(errors)
                .flat()
                .forEach(msg => {
                    showAlert('error', msg)
                })
        } else {
            showAlert('error', 'Something went wrong.')
        }
    } else {
        showAlert('error', error.message || 'Unexpected error.')
    }
}
