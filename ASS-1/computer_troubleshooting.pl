:- dynamic symptom/1.

ask_symptom(Symptom) :-
    format('Is ~w? (yes/no): ', [Symptom]),
    read(Response),
    (
        Response == yes ->
        assertz(symptom(Symptom))
    ;
        true
    ).

problem(power_problem) :-
    symptom(computer_off),
    symptom(power_cable_connected).

problem(display_problem) :-
    symptom(computer_on),
    symptom(blank_screen).

problem(slow_performance) :-
    symptom(computer_slow),
    symptom(many_programs).

problem(overheating) :-
    symptom(computer_hot),
    symptom(fan_problem).

problem(internet_problem) :-
    symptom(wifi_connected),
    symptom(no_internet).

problem(restart_problem) :-
    symptom(auto_restart),
    symptom(computer_hot).

show_problem :-
    findall(Problem, problem(Problem), Problems),
    writeln(''),
    writeln('=========================================='),
    writeln('       TROUBLESHOOTING RESULT'),
    writeln('=========================================='),
    (
        Problems = [] ->
        writeln('No matching problem found.')
    ;
        writeln('Possible problem:'),
        display_problems(Problems)
    ).

display_problems([]).

display_problems([Problem | Rest]) :-
    format('- ~w~n', [Problem]),
    display_problems(Rest).

start :-
    retractall(symptom(_)),
    writeln('=========================================='),
    writeln('  COMPUTER TROUBLESHOOTING EXPERT SYSTEM'),
    writeln('=========================================='),
    writeln(''),
    writeln('Answer each question with yes. or no.'),
    writeln(''),

    ask_symptom(computer_off),
    ask_symptom(power_cable_connected),
    ask_symptom(computer_on),
    ask_symptom(blank_screen),
    ask_symptom(computer_slow),
    ask_symptom(many_programs),
    ask_symptom(computer_hot),
    ask_symptom(fan_problem),
    ask_symptom(wifi_connected),
    ask_symptom(no_internet),
    ask_symptom(auto_restart),

    show_problem.
