# WFFs-Parser
A Prolog-based parser for well-formed formulas (WFFs) of a first-order logic language using definite clause grammars (DCGs). The language specifications include a predefined alphabet, sets of variables, constants, function symbols, predicate symbols, and syncategorematic symbols. The parser should be capable of generating a parse tree for valid WFFs according to the given grammar rules.

# Description
In this assignment, we will need to do some (simple) research and read about definite clause grammars[^1]. Using Prolog, we write a parser for well-formed formulas (WFFs) of a language of first-order logic given by the following specifications.

[^1]: [Definite Clause Grammar](https://en.wikipedia.org/wiki/Definite_clause_grammar)
- The alphabet of the language is the union of the following sets.
  
   a) The set of variables V = {x,y,z,w,t}.
 
   b) The set of constants C = {J,K,L,M,N}.
 
   c) The set of function symbols F = {f,g,h}.
 
   d) The set of predicate symbols P = {P,Q,R,S,T}.
 
   e) The set of syncategorematic symbols {~,&,|,=>,<=>,A,E,(,),.,*}
 
- The set T of terms of the language is smallest set satisfying the following.

   a) V ⊆ T.
 
   b) C ⊆ T.
 
   c) {f(t1 * t2 *...*tn | f ∈ F and ti ∈ T} ⊆ T.

- The set of atoms A = {p(t1 * t2 *...*tn | p ∈ P and ti ∈ T}.

- The set of WFFs of the language is the smallest set containing all of the following forms.
  
   a) Atoms.
 
   b) ~Φ, provided that Φ is a WFF.
 
   c) Φ&Ψ ,provided that Φ and Ψ are WFFs.
 
   d) Φ|Ψ , provided that Φ and Ψ are WFFs.
 
   e) Φ=>Ψ , provided that Φ and Ψ are WFFs.
 
   f) Φ<=>Ψ , provided that Φ and Ψ are WFFs.
 
   g) Ax(Φ), where x V and Φ is a WFF.
 
   h) Ex(Φ), where x V and Φ is a WFF.
 
   i) (Φ), where Φ is a WFF.
 
- All boolean operators are left associative and their order of precedence is ~,&,|,=>,<=> and then <=>. Parenthesizing has top precedence.

- The grammar should contain no ε-rules and should have the symbol ***s*** as its start variable.
  
- A successful parse should result in building a parse tree for the input; make sure your parser generates such a tree. We linearly represent a parse tree as follows:
  
   a) l, where l is the label of a leaf.
 
   b) p(l1,l2,...,ln), where p is a label of a parent node and li is the ith sub-tree thereof, where left-to-right order is assumed.

# Test Cases:
- The soundness and completeness of the grammar needs be auto-tested. we need to make sure that queries are of the following format:
```plaintext
s(T,[’A’, ’x’, ’(’, ’P’, ’(’, ’J’, ’*’, ’K’, ’)’, ’)’],[])
```
- There is a text file uploaded with private and public test cases to test both soundness and completness of the grammer, where completeness, in WFFs that should be accepted, and a parse tree is generated and in soundness, incorrect WFFs that should be rejected, and no parse tree is generated.

 # Technologies
- Prolog

- SWI-Prolog

- Notebook++
