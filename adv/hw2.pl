:-include(week1).

%checked look
look_c(P):-here(P),look.

list_things_i:-has(X),tab(2),write_name(X),write(" -"),tab(1),write_short(X),nl,!.

%inventory
inventory:-list_things_i.

%checked studdy
study_c(Place):-here(Place),study(Place).
study_c(Container):-container(Container),!,location(Container,P),here(P),study(Container).
study_c(Thing):-location(Thing,P),here(P),study(Thing).


%unchecked move
move(P):-here(X),room(P),retract(here(X)),asserta(here(P)),look(P).

%checked move
move_c(P):-here(X),room(P),connection(X,P),puzzle(P),retract(here(X)),asserta(here(P)),look(P).

%unchecked Take
take(I):-is_heavy(I),asserta(has(I)),location(I,L),retract(location(I,L)),asserta(location(I,inven)).
is_heavy(I):-not(heavy(I)),!.

%checked take
take_c(I):-is_heavy(I),here(X),location(I,X),asserta(has(I)),location(I,L),retract(location(I,L)),asserta(location(I,inven)).

%unchecked Put
put(I,P):-has(I),retract(has(I)),asserta(location(I,P)).

%chected put
put_c(I,P):-has(I),here(P),retract(has(I)),asserta(location(I,P)).
