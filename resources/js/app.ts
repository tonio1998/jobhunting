import '../css/app.css';

import { createInertiaApp } from '@inertiajs/vue3';
import type { DefineComponent } from 'vue';
import { createApp, h } from 'vue';
import { ZiggyVue } from 'ziggy-js';
import { initializeTheme } from './composables/useAppearance';

const appName = import.meta.env.VITE_APP_NAME || 'Laravel';

createInertiaApp({
    title: (title) => (title ? `${title} - ${appName}` : appName),
    resolve: (name) => {
        const pages = import.meta.glob<DefineComponent>('./pages/**/*.vue');
        let path = `./pages/${name}.vue`;
        if (pages[path]) {
            return pages[path]();
        }
        const foundPath = Object.keys(pages).find((key) => key.endsWith(`/${name}.vue`));
        if (foundPath) {
            return pages[foundPath]();
        }
        return import(`./pages/${name}.vue`);
    },
    setup({ el, App, props, plugin }) {
        createApp({ render: () => h(App, props) })
            .use(plugin)
            .use(ZiggyVue)
            .mount(el);
    },
    progress: {
        color: '#4B5563',
    },
});

initializeTheme();
