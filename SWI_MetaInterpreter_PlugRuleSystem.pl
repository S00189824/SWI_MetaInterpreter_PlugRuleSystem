:- op(1150, xfx, <- ).
% `&' is the object level conjunction.
% It is an infix meta-level binary function symbol:

:- op(950,xfy, &).

% wired(plug) <- connectedto(blue,lt) & connectedto(brown,rt) &
% connectedto(green,ct).
wired(plug) <- internal_wire(blue,lt) & internal_wire(brown,rt)& internal_wire(green,ct).

socket(plug) <- true.

live(W)<-
   connectedto(W,W1) &
   live(W1).

live(outside)<- true.


wiredcorrect(plug) <- connected(b,lt) & connected(brown,lt) & connected(b,lt).


connectedto(w3,w5) <- ok(cb1).
connectedto(toaster,plug) <- wiredcorrect(plug).
connectedto(w6,w5) <- ok(cb2).
connectedto(w5,outside) <- true.
connectedto(toaster,plug)<- wired(plug) & ok(plug).
connectedto(socket,wire2) <- true.
connectedto(wire2,wire1) <- up(cb).
% connectedto(blue,lt) & connectedto(brown,rt) &
% connectedto(green,ct)<-true.
connectedto(w1,outside) <- up(ts).

ok(plug) <- true.
ok(toaster) <- connectedto(toaster,plug)& live(plug).
ok(socket) <- true.
connectedto(plug,socket) <- true.
ok(wire)<- connectedto(toaster,plug) & live(plug).

connectedto(p1,l1)<- true.

plugIn(p) <- true.
live(socket) <- true.

askable(up(_)).
askable(down(_)).
askable(internal_wire(_,_)).
askable(connected(b,lt)).
askable(connected(g,ct)).
askable(connected(brown,lt)).


prove(true).
prove((P & B)):-
    prove(P),
    prove(B).
