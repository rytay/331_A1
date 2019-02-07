%% =============================================================================
%%
%%  CONCORDIA UNIVERSITY
%%  Department of Computer Science and Software Engineering
%%  SOEN 331-W:  Assingment 1
%%  Winter term, 2019
%%  Date submitted: February 11, 2019
%%
%%  Authors:
%%
%%  Rea Sharma, 40029086, reasharma091@hotmail.com
%%  Ryan Taylor, 40008505, ryan.taylor777@live.com
%%  ...
%%
%% =============================================================================

%% =============================================================================
%%  Facts
%%==============================================================================

%%  Top Level States
    state(idle).
    state(exit).
    
%%  States under active
    state('warming up').
    state(configuring).
   

%%  Initial States
    initial_state(idle, null)

%% =============================================================================
%% Transitions(source, destination, event, guard, action)
%%==============================================================================
   
   
   transition(idle, idle, null, null, null).
   transition(idle, configuring, configure, true, 'single beep/turn light on').
   
   transition(configuring, idle, complete, true, 'double beep/turn light off').
   transition(configuring, idle, cancel, true, 'prolonged beep/turn light off').
   transition(configuring, idle, 'after (1 min)', 'inactive', 'turn light off').
   
   transition(idle, idle, 'after (2 min)', 'furnace temperature >= desired temperature', null).
   transition(idle, 'warming up', 'after (2 min)', 'furnace temperature < desired temperature', 'turn on furnace').
   
   transition('warming up', configuring, configure, true , 'turn off furnace').
   transition('warming up', idle, 'after (3 min)', 'furnace temperature > desired temperature', 'turn on click/turn on fan').
   transition('warming up', 'warming up', 'after (3 min)', 'furnace temperature < desired temperature', null).
   transition(idle, exit, 'shut off' , true, 'turn off fan/turn off furnace').

%% =============================================================================
%%  Rules
%%==============================================================================

    ancestor(State):-
    get_all_transitions(Event, Guard):- .....,Event\=='null', Guard\=='null'
    get_inherited_transitions():-


%% =============================================================================
%% eof.
