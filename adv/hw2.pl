:-include(week1).

%unchecked move
move(P):-room(P),retract(here(P)),asserta(here(P)),look(P).

%checked move
move_c(P):-here(X),room(P),connection(X,P),!,retract(here(P)),asserta(here(P)),look(P).

%unchecked Take
take(I):-asserta(has(I)),location(I,L),retract(location(I,L)),asserta(location(I,inventory)).

%unchecked Put
put(I):-has(I),here(P),location(I,X),retract(has(I)),asserta(location(I,P)).
