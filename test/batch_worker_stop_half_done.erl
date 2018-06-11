-module(batch_worker_stop_half_done).

-behaviour(gen_batch).
-export([init/1, process_item/3, worker_died/5, job_stopping/1, job_complete/2]).

init([WorkerNum]) ->
    {ok, WorkerNum, [1, 2, 3, 4, 5, 6 ,7, 8, 9, 10], []}.

process_item(I, _StartTime, []) ->
    case I of
    	3 ->
    		{stop, process_failed};
    	_Any ->	
    		{result, I}
    end.

worker_died(_, _WorkerPid, _StartTime, _Info, []) ->
    ok.

job_stopping([]) ->
    ok.

job_complete(_Status, []) ->
    ok.
