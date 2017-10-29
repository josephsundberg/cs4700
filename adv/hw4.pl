:-include(hw3).

game_loop:-repeat, read_words(W),parse(W,C),Cmd =..C,Cmd,close_d(C).

close_d(_):-win.
close_d([end]).
end.

parse(W,[V,O]):-verb(V,W-End),np(O,End-[]),!.
parse(W,[V,O,O2]):-verb(V,W-End),np(O,End-Y),prep(Y-Z),np(O2,Z-[]),!.
parse(W,[V]):-verb(V,W-[]),!.
parse(_,_):-write("I don't understand"),fail.

prep(["in"|X]-X).
prep(["a"|X]-X).
prep(["to"|X]-X).
prep(["up"|X]-X).

noun(animal_science, ["Animal","Science","Building"|X]-X).
noun(avenue,["A","tree","lined","avenue"|X]-X).
noun(bedroom,["Your","bedroom"|X]-X).
noun(bone,["large","dragon","bone"|X]-X).
noun(charged_bone,["a","chunk","of","dragon","bone"|X]-X).
noun(book_a,["Corpus","Hermiticum"|X]-X).
noun(book_b,["War","and","Peace"|X]-X).
noun(book_c,["Great","Expectations"|X]-X).
noun(bunsen_burner,["bunsen","burner"|X]-X).
noun(chemistry_lab,["Student","Chemistry","Lab"|X]-X).
noun(closet,["equipment","closet"|X]-X).
noun(coat,["Dr.","Sundberg's","lab","coat"|X]-X).
noun(coat,["lab","coat"|X]-X).
noun(common_room,["Dorm","common","room"|X]-X).
noun(computer_lab,["Student","Computer","Lab"|X]-X).
noun(elevator,["Elevator"|X]-X).
noun(potion,["potion"|X]-X).
noun(eslc_north,["Eccels","Science","Learning","Center"|X]-X).
noun(eslc_south,["Eccels","Science","Learning","Center"|X]-X).
noun(figurine,["alien","figurine"|X]-X).
noun(flask,["glass","flask"|X]-X).
noun(fly,["dead","fly"|X]-X).
noun(geology_building,["Geology","Building"|X]-X).
noun(goggles,["dark","saftey","goggles"|X]-X).
noun(hall,["Hallway"|X]-X).
noun(green_beam,["The","'Grean Beam'","enclosure"|X]-X).
noun(green_beam,["The","Grean Beam","enclosure"|X]-X).
noun(hub,["The","Hub"|X]-X).
noun(ice_cream, ["Aggie","Creamery"|X]-X).
noun(key,["key"|X]-X).
noun(kitchen,["Kitchen"|X]-X).
noun(large_disk,["large","energy","disk"|X]-X).
noun(laser,["laser","array"|X]-X).
noun(laser_lab,["Laser","Lab"|X]-X).
noun(library,["Merill-Caizer","Library"|X]-X).
noun(medium_disk,["medium","energy","disk"|X]-X).
noun(note,["note"|X]-X).
noun(observatory,["Observatory"|X]-X).
noun(old_main,["Old","Main"|X]-X).
noun(plaza,["Engineering","plaza"|X]-X).
noun(pylon_a,["red","pylon"|X]-X).
noun(pylon_b,["blue","pylon"|X]-X).
noun(pylon_c,["green","pylon"|X]-X).
noun(quad,["The","Quad"|X]-X).
noun(recipe,["alchemical","recipe"|X]-X).
noun(roof,["On","the","roof","of","the","SER","Building"|X]-X).
noun(roommate_room,["Your","dormmate's","room"|X]-X).
noun(secret_lab,["Dr.","Sundberg's","Secret","Lab"|X]-X).
noun(ser_1st_floor,["1st","Floor","of","SER","Building"|X]-X).
noun(ser_2nd_floor,["2nd","Floor","of","SER","Building"|X]-X).
noun(small_disk,["small","energy","disk"|X]-X).
noun(special_collections,["Special","Collections","Room"|X]-X).
noun(tsc_patio,["Patio","of","the","TSC"|X]-X).
noun(tunnels_east,["Underground","Tunnels"|X]-X).
noun(tunnels_north,["Underground","Tunnels"|X]-X).
noun(tunnels_west,["Underground","Tunnels"|X]-X).

verb(look_c, ["look"|X]-X).
verb(look_c, ["look","at"|X]-X).
verb(study_c, ["study"|X]-X).
verb(move_c, ["move"|X]-X).
verb(move_c, ["move","to"|X]-X).
verb(take_c, ["take"|X]-X).
verb(take_c, ["pick"|X]-X).
verb(take_c, ["pick","up"|X]-X).
verb(put_c, ["put","in"|X]-X).
verb(put_c, ["put"|X]-X).
verb(inventory, ["inventory"|X]-X).
verb(transfer, ["transfer"|X]-X).
verb(make, ["make"|X]-X).
verb(end,["exit"|X]-X).

article(["the"|X]-X).
article(["a"|X]-X).
article(["an"|X]-X).

np(O,L-Rest):-noun(O,L-Rest).
np(O,L-Rest):-article(L-L2),noun(O,L2-Rest).
