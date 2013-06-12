%%minino application

-module(minino_web).

%% minino funs
-export([init/1,
	 dispatch_rules/0]).


%% views
-export([home_view/3,
	 download_view/3,
	 start_view/3,
	 code_view/3
	]).

%% minino funs

init(_MConf) ->
    {ok, []}.

dispatch_rules() ->
    [%% {Id::atom(), Path::[string()|atom()], view::atom()}
     {root_page, [], home_view},  
     {get_page, ["getting-started"], start_view},
     {download_page, ["download"], download_view},
     {code_page, ["code"], code_view}
    ].


%% views

home_view(MReq, _Args, _Term) ->
    {ok, Html} = minino_api:render_template("home.html", []),
    minino_api:response(Html, MReq).

start_view(MReq, _Args, _Term) ->
    {ok, Html} = minino_api:render_template("getting-started.html", []),
    minino_api:response(Html, MReq).

download_view(MReq, _Args, _Term) ->
    {ok, Html} = minino_api:render_template("download.html", []),
    minino_api:response(Html, MReq).

code_view(MReq, _Args, _Term) ->
    {ok, Html} = minino_api:render_template("code.html", []),
    minino_api:response(Html, MReq).

