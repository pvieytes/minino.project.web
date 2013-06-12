%%minino application

-module(minino_web).

%% minino funs
-export([init/1,
	 dispatch_rules/0]).


%% views
-export([home_view/3,
	 test_view/3]).

%% minino funs

init(_MConf) ->
    {ok, []}.

dispatch_rules() ->
    [%% {Id::atom(), Path::[string()|atom()], view::atom()}
     {root_page, [], home_view},
     {home_page, ["home"], home_view},
     {test_page, ["test", testvalue], test_view}
    ].


%% views

home_view(MReq, _Args, _Term) ->
    {ok, Html} = minino_api:render_template("home.html", [{text, "Meow!!"}]),
    minino_api:response(Html, MReq).

test_view(MReq, Args, _Term) ->
    TestVal = proplists:get_value(testvalue, Args),
    Html = lists:flatten(io_lib:format("<html><body>test: ~s</body></html>", [TestVal])),
    minino_api:response(Html, MReq).
