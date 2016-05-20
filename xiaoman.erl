-module(xiaoman).
-export([buildtree/2]).
% This is a comment.
% Everything on a line after % is ignored.
buildtree([],[]) -> 'nil';
buildtree([ [InLeft],  Root, [InRight] ], [ [PostInit], Root]) -> 
    {[PostLeft], [PostRight]} = lists:split(length(InLeft), PostInit),
    {node, Root, buildtree(InLeft, PostLeft), buildtree(InRight, PostRight)};
buildtree(_, _) -> {error, invalid_object}.

%buildtree(Va, Vb) -> Va * Vb .
