<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <script src="/js/elm.js"></script>
    </head>
    <body>
        @inertia

        <script>
            const node = document.getElementById("app");

            const app = Elm.App.init({ node, flags: node.dataset.page });
        </script>
    </body>
</html>
