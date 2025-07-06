export const useDateFormatter = () => {
  const formatDate = (dateStr?: string | null): string => {
    if (!dateStr) return '—';
    const date = new Date(dateStr);
    return date.toLocaleDateString('en-US', {
      month: 'short', // e.g. Jul
      day: '2-digit', // 06
      year: 'numeric' // 2025
    });
  };

  return { formatDate };
};
