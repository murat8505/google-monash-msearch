
YUI().use('autocomplete', 'autocomplete-highlighters', function(Y) {
    Y.one('#yui-ac').plug(Y.Plugin.AutoComplete, {
        resultHighlighter: 'phraseMatch',
        source: 'select * from search.suggest where query="{query}"',
        yqlEnv: 'http://pieisgood.org/yql/tables.env'
    });
});
