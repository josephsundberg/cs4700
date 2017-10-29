:-include(hw2).

win:-location(small_disk, pylon_c),location(medium_disk, pylon_c),location(large_disk, pylon_c), write("You win, Dr. Sundberg has been defeated").

small(small_disk).
medium(medium_disk).
large(large_disk).


rules_h(D,_):-small(D).
rules_h(D,Y):-medium(D),location(small_disk,Y),!,fail.
rules_h(D,_):-medium(D).
rules_h(D,Y):-large(D), location(medium_disk,Y),!,fail.
rules_h(D,_):-large(D).


transfer(D,P):-here(X),location(P,X),location(D,Y),rules_h(D,P),rules_h(D,Y),retract(location(D,Y)),asserta(location(D,P)),write("transfered Disk").

make(Item):-here(X),location(P,X),create_recipe(P,I,Item),has_ing(I),asserta(has(Item)),consume(I).


has_ing([]):-!.
has_ing([H|T]):-has(H),has_ing(T).

consume([]):-!.
consume([H|T]):-retract(has(H)),consume(T).
