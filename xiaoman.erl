-module(xiaoman).
-export([apsaradb/3]).
 
buildtree([],[]) -> 'nil';
buildtree(InOrder, PostOrder) -> 
    Root = lists:last(PostOrder),
    RootIndex = string:chr( InOrder, Root),
    InLeft = lists:sublist(InOrder, RootIndex-1),
    InRight = lists:sublist(InOrder, RootIndex+1, length(InOrder)-RootIndex),
    PostLeft = lists:sublist(PostOrder, length(InLeft)),
    PostRight = lists:sublist(PostOrder, RootIndex, length(InRight)),
    {node, Root, buildtree(InLeft, PostLeft), buildtree(InRight, PostRight)}.

nodevalue({node, A, _, _}) -> A;
nodevalue(_) -> {err, error}.

leftAndRightNodes ({node, _, 'nil', 'nil'}) -> [];
leftAndRightNodes ({node, _, 'nil', B})     -> [B];
leftAndRightNodes ({node, _, A, 'nil'})     -> [A];
leftAndRightNodes ({node, _, A, B})         -> [A,B].

tbf([]) -> [];
tbf(Xs) -> lists:map(fun nodevalue/1, Xs) ++ tbf(lists:concat(lists:map(fun leftAndRightNodes/1, Xs))).

traverseBF(Tree) -> tbf( [Tree]).

dict({Key, Value}) -> lists:zip(Key, Value).

translate(Cipher, Dictionary) -> 
    lists:map(fun(X) -> element(2,lists:keyfind(X, 1, Dictionary)) end, Cipher).

apsaradb(InOrder, PostOrder, TransformTable) ->
    Tree = buildtree(InOrder, PostOrder),
    Cipher = traverseBF(Tree),
    Dictionary = dict(TransformTable),
    translate(Cipher, Dictionary).
