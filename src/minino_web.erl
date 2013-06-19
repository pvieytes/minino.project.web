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

    [%% {Id::atom(), RegexUrlPath::string(), view::atom()}
     {home_page, "^/$", home_view},
     {get_page, "^/getting-started", start_view},
     {download_page, "^/download", download_view},
     {code_page, "^/code", code_view}
    ]. 



%% views

home_view(MReq, _Args, _Term) ->
    Params = [{active, "home"}] ++ get_common(MReq),
    {ok, Html} = minino_api:render_template("home.html", Params),
    minino_api:response(Html, MReq).

start_view(MReq, _Args, _Term) ->
    Params = [{active, "start"}] ++ get_common(MReq),
    {ok, Html} = minino_api:render_template("getting-started.html", Params),
    minino_api:response(Html, MReq).

download_view(MReq, _Args, _Term) ->
    Params = [{active, "download"}] ++ get_common(MReq),
    {ok, Html} = minino_api:render_template("download.html", Params),
    minino_api:response(Html, MReq).

code_view(MReq, _Args, _Term) ->
    Params = [{active, "code"}] ++ get_common(MReq),
    {ok, Html} = minino_api:render_template("code.html", Params),
    minino_api:response(Html, MReq).


get_common(MReq)->
    Pages = [home_page,
	     get_page, 
	     download_page, 
	     code_page], 
    [{Page, minino_api:build_url(Page, [])} || Page <- Pages].
