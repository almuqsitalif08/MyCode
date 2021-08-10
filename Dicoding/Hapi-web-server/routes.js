const routes = [
    {
        method: 'GET',
        path: '/',
        handler: (request, h) => {
            return 'Homepage';
        }
    },
    {
        method: '*',
        path: '/',
        handler: (request, h) => {
            return `Halaman tidak dapat diakses dengan ${request.method.toUpperCase()} request`
        }
    },
    {
        method: 'GET',
        path: '/about',
        handler: (request, h) => {
            return 'About page';
        }
    },
    {
        method: '*',
        path: '/about',
        handler: (request, h) => {
            return `Halaman tidak dapat diakses menggunakan ${request.method.toUpperCase()} request`;
        }
    },
    {
        method: 'GET',
        path: '/hello/{name?}',
        handler: (request, h) => {
            const { name } = request.params;
            const { lang } = request.query;

            if(lang === 'id'){
                return `Hai ${name}!`;
            } else {
                return `Hello ${name}!`;
            }
        }
    },
    {
        method: '*',
        path: '/{any*}',
        handler: (request, h) => {
            return 'Halaman tidak ditemukan'
        }
    }
];

module.exports = routes;