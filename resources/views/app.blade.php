<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <script src="/js/elm.js"></script>
        <script src="https://unpkg.com/@inertiajs/inertia@0.1.3/dist/index.umd.js"></script>
    </head>
    <body>
        @inertia

        <script>
            const node = document.getElementById("app");
            const initialPage = JSON.parse(node.dataset.page);
            const app = Elm.App.init({ node, flags: node.dataset.page });

            app.ports.visit.subscribe(url => {
                Inertia.Inertia.visit(url);
            });

            Inertia.Inertia.init({
                initialPage,
                resolveComponent: component => component,
                updatePage: (component, props) => {
                    app.ports.setPage.send(JSON.stringify({
                        component,
                        props: Array.isArray(props) ? {} : props,
                    }));
                },
            });
        </script>
    </body>
</html>
