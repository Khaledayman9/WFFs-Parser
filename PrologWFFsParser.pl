variable_symbol(X) --> [X], {member(X, ['x', 'y', 'z', 'w', 't'])}.
constant_symbol(C) --> [C], {member(C, ['J', 'K', 'L', 'M', 'N'])}.
function_symbol(F, Args) --> [F], ['('], terms_multiple(Args), [')'], {member(F, ['f', 'g', 'h'])}.

term_single(term(variable(X))) --> variable_symbol(X).
term_single(term(constant(C))) --> constant_symbol(C).
term_single(term(function(F, Args))) --> function_symbol(F, Args).
terms_multiple([T]) --> term_single(T).
terms_multiple(([asterisk(T1, Ts)])) --> term_single(T1), ['*'], terms_multiple(Ts).

atom_definition(atom(P, Args)) --> [P], ['('], terms_multiple(Args), [')'], {member(P, ['P', 'Q', 'R', 'S', 'T'])}.

wff_predicate(W) --> implication_operation(W).
implication_operation(W) --> equivalence_operation(W1), implication_endside(W1, W).
implication_endside(W1, W) --> ['=>'], equivalence_operation(W2), implication_endside(implies(W1, W2), W).
implication_endside(W, W) --> [].

equivalence_operation(W) --> logical_or_operation(W1), equivalence_endside(W1, W).
equivalence_endside(W1, W) --> ['<=>'], logical_or_operation(W2), equivalence_endside(equivalence(W1, W2), W).
equivalence_endside(W, W) --> [].

logical_or_operation(W) --> logical_and_operation(W1), logical_or_endside(W1, W).
logical_or_endside(W1, W) --> ['|'], logical_and_operation(W2), logical_or_endside(or(W1, W2), W).
logical_or_endside(W, W) --> [].

logical_and_operation(W) --> negation_operation(W1), logical_and_endside(W1, W).
logical_and_endside(W1, W) --> ['&'], negation_operation(W2), logical_and_endside(and(W1, W2), W).
logical_and_endside(W, W) --> [].

negation_operation(not(W)) --> ['~'], negation_operation(W).
negation_operation(W) --> top_precedence_operation(W).

top_precedence_operation(W) --> ['('], wff_predicate(W), [')'].
top_precedence_operation(W) --> atom_definition(W).
top_precedence_operation(W) --> quantified_operation(W).

quantified_operation(W) --> quantifier(Q), variable_symbol(X), ['('], wff_predicate(W1), [')'], {quantified_form(Q, X, W1, W)}.
quantifier(for_all) --> ['A'].
quantifier(there_exists) --> ['E'].
quantified_form(for_all, X, W1, for_all(X, W1)).
quantified_form(there_exists, X, W1, there_exists(X, W1)).

s(ParseTree) --> wff_predicate(ParseTree).