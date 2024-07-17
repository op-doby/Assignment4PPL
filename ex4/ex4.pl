/*
 * **********************************************
 * Printing result depth
 *
 * You can enlarge it, if needed.
 * **********************************************
 */
maximum_printing_depth(100).

:- current_prolog_flag(toplevel_print_options, A),
   (select(max_depth(_), A, B), ! ; A = B),
   maximum_printing_depth(MPD),
   set_prolog_flag(toplevel_print_options, [max_depth(MPD)|B]).


% Signature: path(Node1, Node2, Path)/3
% Purpose: Path is a path, denoted by a list of nodes, from Node1 to Node2.

path(Node1,Node2,[Node1,Node2]):- edge(Node1,Node2).
path(Node1,Node2,[Node1 | P]):- edge(Node1,Node3), path(Node3,Node2,P).

% Signature: cycle(Node, Cycle)/2
% Purpose: Cycle is a cyclic path, denoted a list of nodes, from Node1 to Node1.

cycle(Node1,C):- path(Node1,Node1,C).

% Signature: reverse(Graph1,Graph2)/2
% Purpose: The edges in Graph1 are reversed in Graph2


reverse([],[]).
reverse([[Node1,Node2] | T], [[Node2,Node1] | R]):- reverse(T,R).


% Signature: degree(Node, Graph, Degree)/3
% Purpose: Degree is the degree of node Node, denoted by a Church number (as defined in class)


degree(Node1,[],zero).
degree(Node1,[[Node1,_] | T],succ(D)):- degree(Node1,T,D). %succ?
degree(Node1,[[Node2,_] | T],D):- Node2\=Node1 ,degree(Node1,T,D).










