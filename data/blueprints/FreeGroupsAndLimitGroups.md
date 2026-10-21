# Roadmap: free groups, equations over groups, and limit groups

**Summary.** This roadmap builds, on top of Mathlib's `FreeGroup`, `Monoid.PushoutI`, `HNNExtension`, first-order syntax (`FirstOrder.Language`) and computability (`Primcodable`, `Computable`), a library for free groups and the groups that look like them: effective algorithms on reduced words, Stallings graphs of finitely generated subgroups, an effective first-order syntax for groups with basis coefficients, Bass–Serre theory, equations, radicals and coordinate groups over a group, surface groups and quadratic equations, Makanin's generalised equations with a terminating solver for systems of equations and inequations over a free group, fully residually free (limit) groups with their NTQ towers, Lyndon length functions and infinite words, effective JSJ decompositions and Makanin–Razborov diagrams, and finally the implicit function theorems of Kharlampovich and Myasnikov for regular quadratic equations and regular NTQ systems. Every layer ends in standalone theorems; the roadmap is useful without any formalisation of Tarski's problem for free groups, which it deliberately does not plan.

The headline targets are: the decidability of systems of equations and inequations over a free group of finite rank, with a returned solution (FG7); Merzljakov's theorem on formal solutions and Makanin's decision procedure for positive sentences (FG7); the equivalence of limit groups, finitely generated fully residually free groups and coordinate groups of irreducible algebraic sets (FG8); effective Grushko and JSJ decompositions of finitely generated fully residually free groups and effective Makanin–Razborov diagrams for finite systems over a free group (FG10); and the implicit function theorems for regular quadratic equations and regular NTQ systems, with effective formal solutions (FG11).

## Scope and ownership

This roadmap owns:

- computability of Mathlib's free-group operations through an encoding by reduced words, the word, conjugacy and root problems with witnesses, centralizers in free groups, and malnormal subgroups and CSA groups (FG1);
- Serre graphs with edge reversal, Stallings graphs and the algorithms on finitely generated subgroups of free groups, with the exact Schreier formula (FG2);
- the language of groups with basis constants, primitive-recursive encodings of its terms and formulas, the term–word correspondence and the reduction of quantifier-free formulas and of existential and universal sentences to systems of equations and inequations (FG3);
- graphs of groups, their fundamental groups and Bass–Serre trees, the structure theorem, induced splittings, the Kurosh and Grushko theorems, domination, collapses and Dehn twists (FG4);
- algebraic geometry over groups: G[X], algebraic sets, radicals, coordinate groups, separation and discrimination, domains, the Zariski topology, equational Noetherianity and irreducible components (FG5);
- surface groups with boundary and quadratic equations, regularity, radicals, and quadratically hanging vertices (FG6);
- generalised equations, Makanin's process, the solver, the existential, universal and positive fragment deciders, and Merzljakov's theorem (FG7);
- fully residually free groups, limit groups, extensions of centralizers, the embedding theorems, finite presentability, and NTQ systems (FG8);
- Lyndon length functions, Λ-trees and free actions on them, infinite words, F^{ℤ[t]} and graphs labelled by infinite words (FG9);
- JSJ theory for limit groups, promised-input algorithms for finitely generated fully residually free groups, effective Grushko and JSJ decompositions, Makanin–Razborov diagrams and effective irreducible components, and equations over a represented limit group (FG10);
- lifts to generic points, basic automorphisms and generic families, and the regular implicit function theorems (FG11).

What it builds on, and does not plan again:

- **Mathlib** (at the Tau Ceti pin) already has the free group with reduced words and cyclic reduction (`FreeGroup.reduce`, `FreeGroup.toWord`, `FreeGroup.IsCyclicallyReduced`, `FreeGroup.reduceCyclically`), torsion-freeness and uniqueness of roots for a fixed exponent (the `IsMulTorsionFree` instance on `FreeGroup α`), free bases (`FreeGroupBasis`, `IsFreeGroup`), the non-constructive Nielsen–Schreier theorem (`subgroupIsFreeOfIsFree`), the Schreier inequality `Subgroup.rank_le_index_mul_rank`, amalgamated products and HNN extensions with their normal forms (`Monoid.PushoutI.NormalWord`, `HNNExtension.NormalWord`, hence Britton's lemma), free products and the ping-pong lemma (`Monoid.CoprodI`, `Monoid.CoprodI.lift_injective_of_ping_pong`), presented and finitely presented groups, first-order syntax and semantics with prenex normal form (`FirstOrder.Language.BoundedFormula.toPrenex`), list encodings of terms and formulas, and the computability framework. These are cited, never re-planned.
- **The current Tau Ceti library** (newer than the pin) proves that free groups are residually finite and residually p (`TauCeti/GroupTheory/FreeGroup/ResiduallyP.lean`), that free groups of rank at least two are not nilpotent, and the sharper Schreier inequality rank H ≤ 1 + [G : H](rank G − 1) (`TauCeti/GroupTheory/Schreier.lean`). Residual finiteness is used (FG6) as a supplier; the exact Schreier formula for free groups is planned here (FG2) because the library has only the inequality.
- **Tau Ceti roadmaps.** AlgebraicTopology (van Kampen, Euler characteristics of CW complexes) and FuchsianOrbifolds (presentations of Fuchsian groups from fundamental polygons) treat surfaces topologically and geometrically; this roadmap treats surface groups purely through their presentations and graphs of groups, and does not use those layers. GeometricTopology's JSJ decomposition of 3-manifolds is a different notion from the group-theoretic JSJ decompositions of FG10. ProfiniteProPGroups and PeripheralActions concern free pro-p groups, not the discrete free groups planned here. No other roadmap of the atlas plans free groups, Bass–Serre theory, equations over groups or limit groups.

Out of scope (non-goals): the full first-order decision procedure for free groups and everything specific to it — effective reduction of arbitrary formulas to Boolean combinations of two-block formulas, the existential–universal decision trees, MAX-equivalence and the associated algebraic-solution bounds, complete reducing systems of that procedure, induced-NTQ enlargement algorithms, tight envelopes, projective-image and configuration machinery, and termination of the outer quantifier-elimination procedure; also the parametrisation theorem for arbitrary NTQ systems with correcting embeddings, lifts of ∀∃ formulas over arbitrary systems, implicit function theorems for non-regular NTQ systems, and the classification of groups up to elementary equivalence. A separate first-order decidability development may import this library; none of its specialised constructions are hidden prerequisites here.

## Conventions

- **Words.** A word over α is a `List (α × Bool)`, the letter `(a, true)` standing for a and `(a, false)` for a⁻¹ (Mathlib's convention). Elements of `FreeGroup α` are represented by their reduced words `toWord`. Finite bases are `Fin n` or a `Fintype` with an explicit enumeration.
- **Commutators and conjugation.** [x, y] = x⁻¹ y⁻¹ x y in the sources' formulas; in Lean statements Mathlib's `⁅x, y⁆ = x y x⁻¹ y⁻¹` is used and the two are related by inversion and conjugation where it matters (the surface relators of FG6 are stated with the source convention and checked by the tests). Conjugation g⁻¹ x g is written x^g.
- **Coefficients.** For a coefficient group G, G[X] := `Monoid.Coprod G (FreeGroup X)`; a G-group is a group with a homomorphism from G; equations over G are elements of G[X]. For G = F(A) the identification G[X] ≅ `FreeGroup (X ⊕ A)` is used for computations.
- **Graphs and graphs of groups.** Graphs are Serre graphs (edge reversal without fixed points; loops and multiple edges allowed). In a graph of groups the boundary monomorphisms satisfy α_e = ω_{ē}, and the fundamental group uses the relation e ω_e(c) e⁻¹ = α_e(c).
- **Algorithms.** An algorithm is planned as an encoded procedure on `Primcodable` data, an interpretation theorem relating it to the mathematical operation, a computability statement (`Primrec`, `Computable` or `Partrec`), termination on the stated input class, and correctness of both positive and negative answers, with witnesses where the statement asks for them. Algorithms for limit groups are stated on a promised input class (a finite presentation promised to present a finitely generated fully residually free group); no procedure recognises the class. A classical `DecidablePred` is never the algorithmic endpoint, and no complexity bound is a target.
- **Semantics.** First-order semantics is Mathlib's; prenex transformations are used in nonempty structures, which groups are.

## Exact supplier contracts

### From Mathlib (commit 082e2d3, the Tau Ceti f790474 pin)

- `Computable` (Mathlib/Computability/Partrec.lean): Computability (partial recursiveness of a total function) between Primcodable types. Used in FG7.9.
- `ComputablePred` (Mathlib/Computability/RE.lean): A predicate decided by a computable Boolean function. Used in FG1.6, FG1.15, FG2.14, FG7.12.
- `FirstOrder.Language` (Mathlib/ModelTheory/Basic.lean): A first-order language: function and relation symbols graded by arity. Used in FG3.1.
- `FirstOrder.Language.BoundedFormula` (Mathlib/ModelTheory/Syntax.lean): Formulas with free variables in α and n de Bruijn-indexed bound variables (capture is impossible by construction). Used in FG3.3.
- `FirstOrder.Language.BoundedFormula.IsExistential` (Mathlib/ModelTheory/Complexity.lean): Existential formulas: quantifier-free formulas under a block of existential quantifiers. Used in FG3.7.
- `FirstOrder.Language.BoundedFormula.IsQF` (Mathlib/ModelTheory/Complexity.lean): Quantifier-free bounded formulas. Used in FG3.6.
- `FirstOrder.Language.BoundedFormula.IsUniversal` (Mathlib/ModelTheory/Complexity.lean): Universal formulas. Used in FG3.7.
- `FirstOrder.Language.BoundedFormula.Realize` (Mathlib/ModelTheory/Semantics.lean): Satisfaction of a bounded formula. Used in FG3.3.
- `FirstOrder.Language.BoundedFormula.listEncode` (Mathlib/ModelTheory/Encoding.lean): List encoding of a bounded formula at a fixed number n of bound variables; listDecode and its round trip listDecode_encode_list go through Σ n, BoundedFormula α n. Mathlib gives Countable instances, no Encodable or Primcodable structure on formulas. Used in FG3.2.
- `FirstOrder.Language.BoundedFormula.realize_toPrenex` (Mathlib/ModelTheory/Complexity.lean): toPrenex preserves satisfaction in every nonempty structure. Used in FG3.3.
- `FirstOrder.Language.BoundedFormula.toPrenex` (Mathlib/ModelTheory/Complexity.lean): A prenex normal form transformation of bounded formulas. Used in FG3.3.
- `FirstOrder.Language.Sentence` (Mathlib/ModelTheory/Syntax.lean): Sentences: formulas without free variables. Used in FG3.7.
- `FirstOrder.Language.Structure` (Mathlib/ModelTheory/Basic.lean): An interpretation of a language in a type. Used in FG3.1.
- `FirstOrder.Language.Term` (Mathlib/ModelTheory/Syntax.lean): First-order terms over a language with variables in a type. Used in FG3.4.
- `FirstOrder.Language.Term.listEncode` (Mathlib/ModelTheory/Encoding.lean): List encoding of terms, with listDecode and the round trip listDecode_encode_list; Encodable instance on terms. Used in FG3.2.
- `FirstOrder.Language.withConstants` (Mathlib/ModelTheory/LanguageMap.lean): The language L[[A]] obtained by adding constant symbols for the elements of A. Used in FG3.1.
- `FreeGroup` (Mathlib/GroupTheory/FreeGroup/Basic.lean): The free group on a type, as the quotient of words List (α × Bool) by one-step reduction; (a, true) is the letter a and (a, false) its inverse. Used in FG1.1, FG1.11, FG2.2, FG2.3, FG3.4, FG3.5, FG5.1, FG5.8, FG6.1, FG7.1, FG8.3, FG9.1, FG9.4.
- `FreeGroup.IsCyclicallyReduced` (Mathlib/GroupTheory/FreeGroup/CyclicallyReduced.lean): A word is cyclically reduced when it is reduced and its last letter is not the inverse of its first. Used in FG1.7.
- `FreeGroup.IsReduced` (Mathlib/GroupTheory/FreeGroup/Basic.lean): A word is reduced when no letter is followed by its inverse (List.IsChain condition). Used in FG1.1, FG2.3, FG7.1.
- `FreeGroup.lift` (Mathlib/GroupTheory/FreeGroup/Basic.lean): The universal property: (α → β) ≃ (FreeGroup α →* β), with lift_mk computing on words. Used in FG1.3, FG3.5, FG5.1.
- `FreeGroup.map` (Mathlib/GroupTheory/FreeGroup/Basic.lean): Functoriality of FreeGroup in the basis. Used in FG1.3.
- `FreeGroup.norm` (Mathlib/GroupTheory/FreeGroup/Reduce.lean): Word length: the length of the reduced word, with norm_mul_le, norm_inv_eq, norm_eq_zero. Used in FG1.2, FG9.1.
- `FreeGroup.reduce` (Mathlib/GroupTheory/FreeGroup/Reduce.lean): Free reduction of a word, a structurally recursive (computable) function on List (α × Bool) given DecidableEq α. Used in FG1.2, FG1.4.
- `FreeGroup.reduce.exact` (Mathlib/GroupTheory/FreeGroup/Reduce.lean): reduce L₁ = reduce L₂ implies mk L₁ = mk L₂. Used in FG1.5.
- `FreeGroup.reduce.sound` (Mathlib/GroupTheory/FreeGroup/Reduce.lean): mk L₁ = mk L₂ implies reduce L₁ = reduce L₂. Used in FG1.5.
- `FreeGroup.reduceCyclically` (Mathlib/GroupTheory/FreeGroup/CyclicallyReduced.lean): Cyclic reduction of a word (defined on every list), with the conjugator; reduceCyclically L is cyclically reduced when L is reduced. Used in FG1.7, FG1.8, FG1.13.
- `FreeGroup.reduceCyclically.conj_conjugator_reduceCyclically` (Mathlib/GroupTheory/FreeGroup/CyclicallyReduced.lean): A word equals conjugator · reduceCyclically · conjugator⁻¹ (as words, so in the group). Used in FG1.7, FG1.13.
- `FreeGroup.toWord` (Mathlib/GroupTheory/FreeGroup/Reduce.lean): The reduced word of an element of FreeGroup α, with toWord_injective and mk_toWord. Used in FG1.1, FG1.5.
- `FreeGroup.toWord_injective` (Mathlib/GroupTheory/FreeGroup/Reduce.lean): toWord is injective on FreeGroup α. Used in FG1.1.
- `FreeGroup.toWord_inv` (Mathlib/GroupTheory/FreeGroup/Reduce.lean): toWord x⁻¹ = invRev (toWord x). Used in FG1.2.
- `FreeGroup.toWord_mul` (Mathlib/GroupTheory/FreeGroup/Reduce.lean): toWord (x * y) = reduce (toWord x ++ toWord y). Used in FG1.2.
- `FreeGroupBasis` (Mathlib/GroupTheory/FreeGroup/IsFreeGroup.lean): A free basis of a group: an isomorphism with FreeGroup ι, with lift and ext_hom. Used in FG1.12, FG2.8.
- `Group.IsFinitelyPresented` (Mathlib/GroupTheory/FinitelyPresentedGroup.lean): A group is finitely presented: a quotient of a free group of finite rank by the normal closure of finitely many elements. Used in FG8.7, FG10.2.
- `Group.ResiduallyFinite` (Mathlib/GroupTheory/ResiduallyFinite.lean): Residually finite groups. Used in FG6.2.
- `Group.rank` (Mathlib/GroupTheory/Rank.lean): The minimal cardinality of a finite generating set of a group with [Group.FG G] (noncomputable). Used in FG2.12, FG4.11.
- `HNNExtension` (Mathlib/GroupTheory/HNNExtension.lean): The HNN extension of G along an isomorphism φ : A ≃* B of subgroups, with of, t, lift and t_mul_of. Used in FG4.5, FG4.13, FG8.5.
- `HNNExtension.NormalWord` (Mathlib/GroupTheory/HNNExtension.lean): Normal words for HNN extensions relative to a transversal pair, with equiv : HNNExtension ≃ NormalWord (the normal form theorem; noncomputable). Britton's lemma is the separate theorem HNNExtension.ReducedWord.toList_eq_nil_of_mem_of_range. Used in FG4.3.
- `HNNExtension.ReducedWord.toList_eq_nil_of_mem_of_range` (Mathlib/GroupTheory/HNNExtension.lean): Britton's lemma: a reduced word whose product lies in the image of the base group contains no occurrence of t. Used in FG4.3.
- `HNNExtension.of_injective` (Mathlib/GroupTheory/HNNExtension.lean): The base group embeds in the HNN extension. Used in FG4.3.
- `IsConj` (Mathlib/Algebra/Group/Conj.lean): Conjugacy of two elements of a monoid. Used in FG1.7.
- `IsFreeGroup` (Mathlib/GroupTheory/FreeGroup/IsFreeGroup.lean): A group admitting a free basis. Used in FG1.12, FG2.8, FG6.2, FG8.1.
- `IsIrreducible` (Mathlib/Topology/Irreducible.lean): Irreducible subsets of a topological space. Used in FG5.10.
- `IsMulTorsionFree` (Mathlib/Algebra/Group/Monoid.lean): Injectivity of x ↦ x ^ n for n ≠ 0; FreeGroup α carries an instance in Mathlib/GroupTheory/FreeGroup/CyclicallyReduced.lean (unique roots and torsion-freeness). Used in FG1.14.
- `Lex` (Mathlib/Order/Lex.lean): The lexicographic order type synonym; Lex (Fin n → ℤ) is a linearly ordered abelian group. Used in FG9.1, FG9.2, FG9.4.
- `Matrix.SpecialLinearGroup` (Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean): The special linear group SL(n, R). Used in FG5.8, FG5.9.
- `Monoid.Coprod` (Mathlib/GroupTheory/Coprod/Basic.lean): The binary free product M ∗ N of monoids (groups), with inl, inr and lift. Used in FG4.2, FG4.5, FG5.1.
- `Monoid.Coprod.lift` (Mathlib/GroupTheory/Coprod/Basic.lean): The universal property of the binary free product. Used in FG5.1.
- `Monoid.CoprodI` (Mathlib/GroupTheory/CoprodI.lean): The free product of a family of monoids or groups, with reduced words Word and the ping-pong lemma. Used in FG4.2.
- `Monoid.CoprodI.lift_injective_of_ping_pong` (Mathlib/GroupTheory/CoprodI.lean): The ping-pong lemma for free products: given an action with nonempty pairwise disjoint ping-pong sets X i (and the cardinality hypothesis on the factors), the lift from the free product is injective. Used in FG5.8.
- `Monoid.PushoutI` (Mathlib/GroupTheory/PushoutI.lean): The pushout (amalgamated free product) of a family of groups over a common group H, with of, base, lift. Used in FG4.5, FG4.13, FG8.5.
- `Monoid.PushoutI.NormalWord` (Mathlib/GroupTheory/PushoutI.lean): Normal words for amalgamated products relative to a Transversal (which bundles injectivity of every φ i), with equiv : PushoutI ≃ NormalWord (normal form theorem; noncomputable, needs DecidableEq on the index and factors). Used in FG4.3.
- `Monoid.PushoutI.of_injective` (Mathlib/GroupTheory/PushoutI.lean): When every φ i is injective, every factor embeds in the amalgamated product. Used in FG4.3.
- `Partrec` (Mathlib/Computability/Partrec.lean): Partial recursiveness of a partial function α →. σ between Primcodable types. Used in FG7.10, FG11.8.
- `PresentedGroup` (Mathlib/GroupTheory/PresentedGroup.lean): The group FreeGroup α ⧸ normalClosure rels presented by generators α and relators rels. Used in FG6.1.
- `Primcodable` (Mathlib/Computability/Primrec/Basic.lean): A type with an Encodable structure whose decoding is primitive recursive; the input carrier of Primrec and Computable. Used in FG1.1, FG3.2.
- `Primrec` (Mathlib/Computability/Primrec/Basic.lean): Primitive recursiveness of a function between Primcodable types. Used in FG1.2, FG1.3, FG3.2.
- `Primrec.list_append` (Mathlib/Computability/Primrec/List.lean): List append is primitive recursive (one of the list combinators: list_rec, list_foldr, list_cons, list_reverse, ...). Used in FG1.2.
- `Quiver` (Mathlib/Combinatorics/Quiver/Basic.lean): Quivers (directed multigraphs with loops), with paths in Mathlib/Combinatorics/Quiver/Path.lean. Used in FG2.1.
- `SimpleGraph` (Mathlib/Combinatorics/SimpleGraph/Basic.lean): Simple graphs (no loops, no multiple edges). Used in FG2.1.
- `SimpleGraph.Dart` (Mathlib/Combinatorics/SimpleGraph/Dart.lean): Darts (oriented edges) of a simple graph, with Dart.symm, Dart.symm_symm and Dart.symm_ne (no dart is its own reverse). Used in FG2.1.
- `Subgroup.centralizer` (Mathlib/GroupTheory/Subgroup/Centralizer.lean): The centralizer of a subset of a group. Used in FG1.17, FG1.18, FG4.13, FG8.5.
- `Subgroup.index` (Mathlib/GroupTheory/Index.lean): The index of a subgroup (0 when infinite). Used in FG2.12.
- `Subgroup.normalClosure` (Mathlib/Algebra/Group/Subgroup/Basic.lean): The normal closure of a subset of a group. Used in FG4.2, FG5.2, FG8.3.
- `Subgroup.rank_le_index_mul_rank` (Mathlib/GroupTheory/Schreier.lean): For [Group.FG G] and [H.FiniteIndex]: rank H ≤ index H · rank G (an inequality only). Used in FG2.12.
- `Subgroup.zpowers` (Mathlib/Algebra/Group/Subgroup/ZPowers/Basic.lean): The cyclic subgroup generated by an element. Used in FG1.17.
- `TopologicalSpace.NoetherianSpace` (Mathlib/Topology/NoetherianSpace.lean): Noetherian topological spaces (descending chain condition on closed sets), with finite decomposition into irreducible components. Used in FG5.10.
- `TopologicalSpace.generateFrom` (Mathlib/Topology/Order.lean): The topology generated by a family of sets declared open. Used in FG5.6.
- `subgroupIsFreeOfIsFree` (Mathlib/GroupTheory/FreeGroup/NielsenSchreier.lean): Nielsen–Schreier: every subgroup of a free group is free (non-constructive, via free groupoids). Used in FG2.8.

### From Tau Ceti

- No Tau Ceti declaration at the pin is required. The current library (newer than the pin) proves residual finiteness of free groups (`TauCeti/GroupTheory/FreeGroup/ResiduallyP.lean`, instance `FreeGroup.instResiduallyFinite`); FG6.2 uses that fact, and at the pin it follows from FG5.8 (free groups embed in SL(2, ℤ)) by reduction modulo integers, with Mathlib's `Group.ResiduallyFinite` as the carrier.

### From other roadmaps

- None: every prerequisite is Mathlib or an earlier layer of this roadmap.


## How to read the build

FG1 makes Mathlib's free group effective and proves its elementary structure (conjugacy, roots, centralizers). FG2 adds graphs and Stallings foldings for subgroups; FG3, independent of FG2, adds an effective first-order syntax. FG4 develops Bass–Serre theory on the graphs of FG2. FG5 sets up algebraic geometry over a coefficient group, using FG1 and the term–word correspondence of FG3. FG6 specialises to surface groups and quadratic equations, using the graphs of groups of FG4. FG7 is the core of equation solving: Makanin's generalised equations and the solver, with the existential, universal and positive fragments. FG8 assembles the theory of limit groups and NTQ towers from FG4–FG7. FG9 develops length functions and infinite words, the tool of the subgroup algorithms. FG10 makes the structure effective (JSJ decompositions, Makanin–Razborov diagrams) on promised inputs, with existence proved before any algorithm. FG11 proves the regular implicit function theorems. Each layer ends with its dependencies; within a layer, subsections are in build order.

## Layer FG1: Free-group words, normal forms, and elementary algorithms

Mathlib already has reduced words, free reduction, cyclic reduction and torsion-freeness. This layer makes them algorithms in the computability sense, without replacing `FreeGroup α` by another carrier, and proves the elementary structure theory that the following layers use: conjugacy, maximal roots and cyclic centralizers. Being a proper power and failing to be primitive are kept as different predicates, and the identity is treated explicitly in the root and centralizer algorithms.

*Targets of the layer.* On Mathlib's FreeGroup α and its reduced words (toWord, reduce, IsReduced, IsCyclicallyReduced): a primitive-recursive encoding of FreeGroup α through reduced words; primitive recursiveness of reduction, multiplication, inversion, powers, word length and homomorphism evaluation, with Mathlib's word formulas as interpretation theorems; the word-problem procedure with correctness of both answers and computability; the conjugacy criterion (cyclic reductions agree up to rotation) and a conjugacy procedure returning a conjugator; proper powers and primitive elements as distinct predicates; maximal roots, computed by maxRoot with the identity handled explicitly (maxRoot 1 = (1, 0)); commuting elements are powers of a common element; centralizers of nontrivial elements are the cyclic groups of their maximal roots, with a computable generator; maximal cyclic subgroups are malnormal (free groups are CSA). Torsion-freeness and uniqueness of roots for a fixed exponent are Mathlib's IsMulTorsionFree instance.

### FG1.1 Primitive-recursive encoding of a free group through reduced words

**Construction (`FreeGroup.instPrimcodable`).** Let α be a type with DecidableEq α and Primcodable α. Equip FreeGroup α with the Primcodable structure transported along the injection toWord : FreeGroup α → List (α × Bool), whose range is the decidable set of reduced words: encode x is the code of toWord x, and decoding a code n returns mk L when n decodes to a list L with IsReduced L, and nothing otherwise. The carrier is Mathlib's FreeGroup α itself; no second free-group type is introduced.

*Hypotheses.* α has decidable equality and a Primcodable structure (for a finite basis, α = Fin n or any Fintype with an explicit equivalence to Fin n).

*Construction.*
1. The range of toWord is exactly the set of reduced words (Mathlib's isReduced_toWord, and reduce_toWord for the converse via IsReduced.reduce_eq).
2. IsReduced is a primitive recursive predicate on List (α × Bool): it is a chain condition checked by List recursion, using decidable equality of α and Bool; record this as the lemma primrec_isReduced.
3. Transport Primcodable along the subtype {L // IsReduced L} ≃ FreeGroup α given by toWord and mk (Mathlib's Primcodable.subtype for a primitive recursive predicate, then Primcodable.ofEquiv).

*API.*
- `FreeGroup.instPrimcodable` (instance): Primcodable (FreeGroup α) for Primcodable α with DecidableEq α, encoding x by toWord x.
- `FreeGroup.encode_eq` (characterisation): Encodable.encode x = Encodable.encode x.toWord.
- `FreeGroup.primrec_isReduced` (other): The predicate IsReduced on List (α × Bool) is primitive recursive.
- `FreeGroup.primrec_toWord` (projection): toWord : FreeGroup α → List (α × Bool) is primitive recursive.
- `FreeGroup.primrec_mk` (constructor): mk : List (α × Bool) → FreeGroup α is primitive recursive.

**Checks.**
- `FreeGroup.encode_one` (degenerate): encode (1 : FreeGroup α) equals the code of the empty list.
- `FreeGroup.encode_mk_cancel` (computation): For a : α, encode (mk [(a,true),(a,false)]) = encode (1 : FreeGroup α).
- `FreeGroup.decode_nonreduced` (non-example): The code of the non-reduced list [(a,true),(a,false)] decodes to none, so the encoding is not the naive encoding of all words.
- `FreeGroup.encode_injective` (characterisation): encode is injective on FreeGroup α, so equality of codes decides equality in the group.

*Examples.* encode (mk L) = encode (reduce L) for every word L. Decoding the code of a non-reduced word, such as [(a,true),(a,false)], returns none.

*Used by.* FG1 word-problem, conjugacy and root algorithms: inputs and outputs of the algorithms are elements of FreeGroup α encoded by their reduced words; FG3 term evaluation and FG7 equation solver: coefficients and solutions are free-group elements passed to computable functions; IFT §4.2 (Lemma 14): systems of equations with coefficients given as words over the basis A.

*Source.* [LEAN] Mathlib/GroupTheory/FreeGroup/Reduce.lean (toWord, toWord_injective, isReduced_toWord) and Mathlib/Computability/Primrec/Basic.lean (Primcodable.subtype, Primcodable.ofEquiv): The free group is a quotient of words with a canonical reduced representative; Primcodable structures transport along equivalences and restrict to primitive recursive subtypes.

*Needs.* Mathlib `FreeGroup`; Mathlib `FreeGroup.toWord`; Mathlib `FreeGroup.toWord_injective`; Mathlib `FreeGroup.IsReduced`; Mathlib `Primcodable`.

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Computable`, namespace `FreeGroup`.

### FG1.2 Free reduction and the group operations are primitive recursive

**Theorem.** For Primcodable α with DecidableEq α: (1) FreeGroup.reduce : List (α × Bool) → List (α × Bool) is primitive recursive; (2) multiplication, inversion and natural and integer powers on FreeGroup α are primitive recursive for the encoding of FG1/primcodable-free-group; (3) the word length norm : FreeGroup α → ℕ is primitive recursive; (4) the interpretation theorems hold: toWord (x * y) = reduce (toWord x ++ toWord y), toWord x⁻¹ = invRev (toWord x), toWord (x ^ n) = reduce (n-fold concatenation of toWord x).

*Hypotheses.* α is Primcodable with decidable equality.

*Proof sketch.*
1. reduce is defined by List recursion with a case split on the head of the recursively reduced tail; express it with Primrec.list_foldr (or list_rec) and the primitive recursive test that two letters cancel.
2. Multiplication is reduce applied to an append (Primrec.list_append); inversion is invRev, a list reverse composed with a letter map; powers iterate multiplication (Primrec.nat_iterate), and integer powers split on the sign.
3. The interpretation theorems are Mathlib's toWord_mul, toWord_inv and toWord_pow; norm is the length of toWord.

*Examples.* Instantiating at α = Fin 2 gives a primitive recursive multiplication on F(a,b) whose value on (a b, b⁻¹ a) has reduced word [a, a]. The theorem is false for the naive concatenation of words, which is not an operation on FreeGroup α: the test is that toWord of the product is reduced.

*Source.* [LEAN] Mathlib/GroupTheory/FreeGroup/Reduce.lean (reduce, toWord_mul, toWord_inv, toWord_pow) and Mathlib/Computability/Primrec/List.lean: The reduction function and the word-level formulas for the group law are Mathlib's; the list combinators give primitive recursiveness.; [SUBGROUPS] §2.1, pp. 3–4 of the author copy: Reduced words over X (finite and infinite) with partial multiplication, inversion and reduction introduced as in a free group; the finite case is the free group F(X).

*Needs.* FG1.1 (Primitive-recursive encoding of a free group through reduced words); Mathlib `FreeGroup.reduce`; Mathlib `FreeGroup.toWord_mul`; Mathlib `FreeGroup.toWord_inv`; Mathlib `FreeGroup.norm`; Mathlib `Primrec`; Mathlib `Primrec.list_append`.

### FG1.3 Homomorphism evaluation and substitution are computable

**Theorem.** Let α be a finite type with DecidableEq α, Primcodable α and an explicit enumeration (α = Fin n, or a Fintype with a given equivalence to Fin n). (1) For a group H with a Primcodable structure in which multiplication, inversion and the identity are primitive recursive, the evaluation map (α → H) × FreeGroup α → H, (f, w) ↦ lift f w, is primitive recursive, where α → H carries the Primcodable structure of finite functions. (2) In particular substitution FreeGroup α × (α → FreeGroup β) → FreeGroup β, (w, σ) ↦ w >>= σ, is primitive recursive for Primcodable β with DecidableEq β, and map f is primitive recursive for every function f : α → β.

*Hypotheses.* α finite with an explicit enumeration; H has primitive recursive group operations for its encoding.

*Proof sketch.*
1. Mathlib's lift_mk computes lift f (mk L) as the product of f a or its inverse along L; this is a list fold (Primrec.list_foldl) of primitive recursive operations.
2. Finite functions α → H are encoded as lists of values indexed by an enumeration of α; evaluation at a letter is list lookup.
3. Substitution is the case H = FreeGroup β using FG1/reduce-primrec for the group law of the target.

*Examples.* For α = Fin 2, H = FreeGroup (Fin 2), σ(a) = a b, σ(b) = b: the substitution of [a,b] = a⁻¹ b⁻¹ a b returns the reduced word of b⁻¹ a⁻¹ b⁻¹ a b b, namely b⁻¹ a⁻¹ b⁻¹ a b². Evaluation into a finite group given by its multiplication table (Fin m with primitive recursive table lookup) is an instance.

*Source.* [LEAN] Mathlib/GroupTheory/FreeGroup/Basic.lean, lift and lift_mk: The universal property of the free group computes a homomorphism on a word as an ordered product of the images of its letters.; [IFT] §2.1, p. 4 (G-groups, G[X], evaluation of words at tuples): Kharlampovich–Myasnikov evaluate words of G[X] at tuples of elements; this node makes that evaluation an algorithm when the target has computable operations.

*Needs.* FG1.2 (Free reduction and the group operations are primitive recursive); Mathlib `FreeGroup.lift`; Mathlib `FreeGroup.map`; Mathlib `Primrec`.

### FG1.4 The word-problem procedure for a free group

**Construction (`FreeGroup.isTrivialWord`).** For α with DecidableEq α, define isTrivialWord : List (α × Bool) → Bool by isTrivialWord L = (reduce L).isEmpty, and the equality test eqWord L₁ L₂ = isTrivialWord (invRev L₁ ++ L₂). These are the encoded procedures for the word problem of FreeGroup α (inputs are arbitrary, possibly unreduced, words over the basis).

*Hypotheses.* α has decidable equality.

*Construction.*
1. Both procedures are compositions of reduce, invRev and append, total by structural recursion.

*API.*
- `FreeGroup.isTrivialWord` (data): isTrivialWord L = (reduce L).isEmpty.
- `FreeGroup.eqWord` (data): eqWord L₁ L₂ = isTrivialWord (invRev L₁ ++ L₂).
- `FreeGroup.isTrivialWord_append_invRev` (simp): isTrivialWord (L ++ invRev L) = true.
- `FreeGroup.eqWord_comm` (relation): eqWord L₁ L₂ = eqWord L₂ L₁.

**Checks.**
- `FreeGroup.isTrivialWord_nil` (degenerate): isTrivialWord [] = true.
- `FreeGroup.isTrivialWord_commutator` (non-example): For a ≠ b, isTrivialWord [(a,true),(b,true),(a,false),(b,false)] = false: a procedure that only cancels letters adjacent in the input (or that ignores order, as in the abelianisation) answers wrongly here.
- `FreeGroup.isTrivialWord_nested` (computation): isTrivialWord [(a,true),(b,true),(b,false),(a,false)] = true, which needs cancellation after an earlier cancellation.
- `FreeGroup.isTrivialWord_iff_mk` (compatibility): isTrivialWord L = true ↔ FreeGroup.mk L = 1, agreeing with Mathlib's DecidableEq instance on FreeGroup α.

*Examples.* isTrivialWord [(a,true),(b,true),(a,false),(b,false)] = false for a ≠ b (the commutator is nontrivial). isTrivialWord [(a,true),(b,true),(b,false),(a,false)] = true.

*Used by.* FG1 conjugacy and root procedures: used as the equality test inside the conjugacy search and root extraction; FG2 membership algorithm: final comparison of the label of a path with the input word; FG7 equation solver: checking a candidate solution of a system of equations and inequations.

*Source.* [LEAN] Mathlib/GroupTheory/FreeGroup/Reduce.lean (reduce, reduce.sound, reduce.exact): Equality in the free group is decided by comparing free reductions.; [SUBGROUPS] §2.1, pp. 3–4 of the author copy: Reduced words with multiplication followed by cancellation, the normal form on which the paper's algorithms run.

*Needs.* Mathlib `FreeGroup.reduce`.

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Computable`, namespace `FreeGroup`.

### FG1.5 Correctness of the word-problem procedure (both answers)

**Theorem.** For every word L, isTrivialWord L = true if and only if mk L = 1 in FreeGroup α; for all words L₁ L₂, eqWord L₁ L₂ = true if and only if mk L₁ = mk L₂. Hence a true answer certifies triviality and a false answer certifies nontriviality.

*Hypotheses.* α has decidable equality.

*Proof sketch.*
1. mk L = 1 ↔ toWord (mk L) = [] (Mathlib's toWord_eq_nil_iff) and toWord (mk L) = reduce L (toWord_mk).
2. For eqWord use mk (invRev L₁ ++ L₂) = (mk L₁)⁻¹ * mk L₂ (inv_mk and mul_mk).

*Examples.* Applied to the commutator word of FG1/word-problem-procedure it yields [a,b] ≠ 1 in FreeGroup α for a ≠ b.

*Source.* [LEAN] Mathlib/GroupTheory/FreeGroup/Reduce.lean (toWord_mk, toWord_eq_nil_iff, reduce.sound, reduce.exact): The reduced word is a complete invariant of an element of the free group.

*Needs.* FG1.4 (The word-problem procedure for a free group); Mathlib `FreeGroup.reduce.sound`; Mathlib `FreeGroup.reduce.exact`; Mathlib `FreeGroup.toWord`.

### FG1.6 The word problem of a free group is primitive recursive

**Theorem.** For Primcodable α with DecidableEq α, isTrivialWord and eqWord are primitive recursive, and the predicates {L | mk L = 1} and {(L₁,L₂) | mk L₁ = mk L₂} are ComputablePred, decided by these procedures (not by a classical DecidablePred instance).

*Hypotheses.* α Primcodable with decidable equality.

*Proof sketch.*
1. Compose FG1/reduce-primrec with Primrec.list_append, list reverse and List.isEmpty.
2. ComputablePred follows from the computable Boolean decider together with FG1/word-problem-correct.

*Examples.* The decider is total, so termination holds on every input word.

*Source.* [LEAN] Mathlib/Computability/RE.lean (ComputablePred) and Mathlib/Computability/Primrec/List.lean: A predicate is computable when a computable Boolean function decides it.

*Needs.* FG1.4 (The word-problem procedure for a free group); FG1.5 (Correctness of the word-problem procedure (both answers)); FG1.2 (Free reduction and the group operations are primitive recursive); Mathlib `ComputablePred`.

### FG1.7 Conjugacy criterion: cyclic reductions agree up to cyclic permutation

**Theorem.** For x, y ∈ FreeGroup α, x and y are conjugate if and only if the cyclically reduced words reduceCyclically (toWord x) and reduceCyclically (toWord y) are cyclic permutations of each other (List.IsRotated). Moreover every element is conjugate, by the explicit word conjugator (toWord x), to the element of its cyclic reduction.

*Hypotheses.* α has decidable equality.

*Proof sketch.*
1. By Mathlib's conj_conjugator_reduceCyclically, x is conjugate to the element u of its cyclic reduction; likewise y to v.
2. Rotating a cyclically reduced word is conjugation by a prefix, so rotated words give conjugate elements.
3. Conversely if g⁻¹ u g = v with u, v cyclically reduced, induct on the length of g: if |g| ≤ |u| then u = g ∘ u₁ and v = u₁ ∘ g, a rotation (the ℤ case of MRS-REGULAR Lemma 3.8(3)); if |g| > |u| then g = u^k g' after cancellation and u^k commutes with u, which reduces the length of the conjugator.

*Examples.* a b and b a are conjugate in F(a,b); a b and a b⁻¹ are not (their cyclic reductions are not rotations of each other). The criterion fails for words that are not cyclically reduced: a b a⁻¹ and b are conjugate though a b a⁻¹ is not a rotation of b, which is why the cyclic reduction is taken first.

*Source.* [MRS-REGULAR] §3, Lemma 3.8, p. 13 of the author copy: For infinite words over a discretely ordered abelian group, a conjugate of a cyclically reduced word by a short enough conjugator is a cyclic permutation; the case of the ordered group ℤ is ordinary reduced words.; [LEAN] Mathlib/GroupTheory/FreeGroup/CyclicallyReduced.lean (reduceCyclically, conjugator, conj_conjugator_reduceCyclically): Cyclic reduction of a reduced word with the explicit conjugating prefix.

*Needs.* Mathlib `FreeGroup.reduceCyclically.conj_conjugator_reduceCyclically`; Mathlib `FreeGroup.IsCyclicallyReduced`; Mathlib `FreeGroup.reduceCyclically`; Mathlib `IsConj`.

### FG1.8 The conjugacy procedure with witness

**Construction (`FreeGroup.conjWitness`).** Define conjWitness : List (α × Bool) → List (α × Bool) → Option (List (α × Bool)): reduce both inputs, cyclically reduce them recording the conjugators c₁, c₂ (FreeGroup.reduceCyclically.conjugator), then search the splittings u = p ++ s of the cyclic reduction u of the first input with |p| < |u| (the single splitting p = s = [] when u is empty) for one with s ++ p equal to the cyclic reduction v of the second; on success at rotation u = p ++ s, v = s ++ p, return the word c of the element c₁ · p · c₂⁻¹ (so that c⁻¹ · x · c = y with this convention), and return none if no rotation matches.

*Hypotheses.* α has decidable equality.

*Construction.*
1. The search is a bounded search over at most max(|u|, 1) splittings, so the procedure is total.
2. The conjugator returned is assembled from the recorded prefixes; its correctness is FG1/conjugacy-correct.

*API.*
- `FreeGroup.conjWitness` (data): The procedure described, returning a conjugating word or none.
- `FreeGroup.conjWitness_self` (simp): (conjWitness L L).isSome = true, and the returned word lies in the centralizer of mk L.
- `FreeGroup.conjWitness_isSome_iff` (characterisation): (conjWitness L₁ L₂).isSome ↔ IsConj (mk L₁) (mk L₂).
- `FreeGroup.conjWitness_spec` (characterisation): conjWitness L₁ L₂ = some c → (mk c)⁻¹ * mk L₁ * mk c = mk L₂.

**Checks.**
- `FreeGroup.conjWitness_ab_ba` (computation): conjWitness [(a,true),(b,true)] [(b,true),(a,true)] is some c with (mk c)⁻¹ (a b) (mk c) = b a.
- `FreeGroup.conjWitness_nil` (degenerate): conjWitness [] L = some [] if mk L = 1 and none otherwise.
- `FreeGroup.conjWitness_inverse` (non-example): conjWitness [(a,true),(b,true)] [(b,false),(a,false)] = none: a b is not conjugate to its inverse, which a procedure comparing only cyclic words up to reversal would accept.
- `FreeGroup.conjWitness_unreduced` (compatibility): conjWitness [(a,true),(b,true),(a,false)] [(b,true)] is some c: inputs are reduced and cyclically reduced first, consistent with IsConj in FreeGroup α.

*Examples.* conjWitness [a,b] [b,a] returns a word c with c⁻¹ (a b) c = b a (for instance c = a). conjWitness [a] [b] returns none for a ≠ b.

*Used by.* FG1 conjugacy decider: the decision procedure and its witness; FG2 subgroup conjugacy algorithm: conjugating base points of Stallings graphs uses element conjugacy; FG10 conjugacy problem for limit groups: base case F of the induction over centralizer extensions (SUBGROUPS Theorem 10).

*Source.* [MRS-REGULAR] §3, Lemma 3.8, p. 13 of the author copy: Conjugacy of cyclically reduced words is witnessed by a cyclic permutation.; [SUBGROUPS] §6, Theorem 10, p. 38 of the author copy: The conjugacy algorithm for subgroups of F^{Z[t]} returns a conjugating element; the free-group case is the base of that algorithm.

*Needs.* FG1.7 (Conjugacy criterion: cyclic reductions agree up to cyclic permutation); FG1.4 (The word-problem procedure for a free group); Mathlib `FreeGroup.reduceCyclically`.

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Computable`, namespace `FreeGroup`.

### FG1.9 Correctness of the conjugacy procedure (both answers, with witness)

**Theorem.** For all words L₁ L₂: if conjWitness L₁ L₂ = some c then (mk c)⁻¹ * mk L₁ * mk c = mk L₂; and conjWitness L₁ L₂ = none if and only if mk L₁ and mk L₂ are not conjugate.

*Proof sketch.*
1. The positive answer is checked by FG1/word-problem-correct after assembling the conjugator from the cyclic-reduction prefixes and the rotation prefix.
2. The negative answer uses the converse direction of FG1/conjugacy-criterion: if the elements were conjugate, one of the finitely many rotations would match.

*Examples.* For L₁ = [a] and L₂ = [b] with a ≠ b the procedure answers none, and indeed a and b are not conjugate (their images in the abelianisation differ).

*Source.* [MRS-REGULAR] §3, Lemma 3.8, p. 13 of the author copy: Conjugacy is a cyclic permutation of cyclically reduced forms.

*Needs.* FG1.8 (The conjugacy procedure with witness); FG1.7 (Conjugacy criterion: cyclic reductions agree up to cyclic permutation); FG1.5 (Correctness of the word-problem procedure (both answers)).

### FG1.10 The conjugacy problem of a free group is primitive recursive

**Theorem.** For Primcodable α with DecidableEq α, conjWitness is primitive recursive, and conjugacy {(x,y) | IsConj x y} on FreeGroup α is a ComputablePred decided by (conjWitness (toWord x) (toWord y)).isSome.

*Proof sketch.*
1. Rotations of a list are primitive recursive (List.rotate by bounded iteration); the bounded search is Primrec.list_find or a fold over range |u|.
2. Compose with FG1/reduce-primrec and FG1/word-problem-computable; correctness of both answers is FG1/conjugacy-correct.

*Examples.* The decider is total; termination holds on every pair of words.

*Source.* [LEAN] Mathlib/Computability/Primrec/List.lean: Bounded list search and rotation are built from the list combinators.

*Needs.* FG1.8 (The conjugacy procedure with witness); FG1.9 (Correctness of the conjugacy procedure (both answers, with witness)); FG1.6 (The word problem of a free group is primitive recursive).

### FG1.11 Proper powers

**Definition (`Group.IsProperPower`).** An element x of a group G is a proper power when there are y ∈ G and n ∈ ℕ with n ≥ 2 and x = y ^ n. This is a predicate on any group (Group.IsProperPower), used here for free groups and in FG8 for limit groups.

*Construction.*
1. Definition by an existential statement over G × ℕ.

*API.*
- `Group.IsProperPower` (data): IsProperPower x ↔ ∃ y n, 2 ≤ n ∧ x = y ^ n.
- `Group.IsProperPower.map` (functoriality): A homomorphism maps proper powers to proper powers (the converse fails).
- `Group.IsProperPower.one` (simp): 1 is a proper power (1 = 1 ^ 2); the root algorithms therefore treat the identity separately.
- `Group.isProperPower_zpow` (relation): For |n| ≥ 2, y ^ n is a proper power.

**Checks.**
- `FreeGroup.isProperPower_of_sq` (computation): of a ^ 2 is a proper power in FreeGroup α.
- `FreeGroup.not_isProperPower_of` (non-example): of a is not a proper power: in particular not every nontrivial element of a free group is a proper power, and a definition allowing n = 1 is wrong.
- `FreeGroup.not_isProperPower_commutator` (non-example): For a ≠ b, the commutator ⁅of a, of b⁆ is not a proper power, although it is not primitive either (FG1/is-primitive): the two notions differ.
- `Group.isProperPower_one` (degenerate): The identity is a proper power, so ‘not a proper power’ is used only for nontrivial elements.

*Examples.* In F(a,b), a² and (a b)³ are proper powers; a, a b and [a,b] are not.

*Used by.* FG1 maximal roots: a maximal root is a root that is not a proper power; FG8 centralizer extensions: the extended element u is taken not to be a proper power (IFT p. 6); FG7 periodic structures: periods are cyclically reduced non-proper-powers (IFT §5, p. 40).

*Source.* [IFT] §5.4, p. 40: A period is defined there as a cyclically reduced word that is not a proper power; periods organise the analysis of periodic solutions of generalised equations.; [VAR-I] §1, Lemma 12 and its proof, p. 17: A nontrivial commutator in a free group is not a proper power (Schützenberger), used to identify commuting commutators.

*Needs.* Mathlib `FreeGroup`.

*Suggested home.* `TauCeti/GroupTheory/ProperPower`, namespace `Group`.

### FG1.12 Primitive elements of a free group

**Definition (`FreeGroup.IsPrimitive`).** An element x of a group G with IsFreeGroup G is primitive when it belongs to some free basis of G: there are a type ι, a basis b : FreeGroupBasis ι G and i : ι with b i = x. For FreeGroup α this is the existence of an automorphism sending x to of a for some a.

*Construction.*
1. Definition by quantifying over Mathlib's FreeGroupBasis.

*API.*
- `FreeGroup.IsPrimitive` (data): IsPrimitive x ↔ ∃ (ι) (b : FreeGroupBasis ι G) (i : ι), b i = x.
- `FreeGroup.IsPrimitive.of` (constructor): of a is primitive in FreeGroup α.
- `FreeGroup.IsPrimitive.map_mulEquiv` (functoriality): Primitivity is invariant under group isomorphisms.
- `FreeGroup.IsPrimitive.not_isProperPower` (relation): A primitive element is not a proper power (its image in the abelianisation is part of a basis of ℤ^(α)).

**Checks.**
- `FreeGroup.isPrimitive_of_mul` (computation): of a * of b is primitive in F(a,b), witnessed by the basis (a b, b).
- `FreeGroup.not_isPrimitive_commutator` (non-example): ⁅of a, of b⁆ is not primitive and not a proper power (its abelianisation is 0): being primitive is not the negation of being a proper power.
- `FreeGroup.not_isPrimitive_one` (degenerate): 1 is not primitive.
- `FreeGroup.not_isPrimitive_sq` (non-example): of a ^ 2 is not primitive.

*Examples.* In F(a,b): a, a b (basis (a b, b)) and a b² (basis (a b², b)) are primitive; a², [a,b] and 1 are not.

*Used by.* FG1 maximal roots: the specification keeps proper powers distinct from non-primitive elements; FG11 generic families: Merzljakov words and the basic automorphisms are built from primitive elements of F; FG2 free factors: Stallings graphs detect free factors.

*Source.* [KM02] §11 (algebraic extensions and free factors), pp. 31–33: Free factors of finitely generated subgroups of F are detected on subgroup graphs (Theorem 11.2); KM02 does not use the word primitive, and the node's notion is the rank-one free-factor case.; [LEAN] Mathlib/GroupTheory/FreeGroup/IsFreeGroup.lean (FreeGroupBasis): Free bases of a free group as data.

*Needs.* Mathlib `IsFreeGroup`; Mathlib `FreeGroupBasis`.

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Primitive`, namespace `FreeGroup`.

### FG1.13 Maximal-root extraction

**Construction (`FreeGroup.maxRoot`).** Define maxRoot : FreeGroup α → FreeGroup α × ℕ as follows. If x = 1 return (1, 0). Otherwise write toWord x = c ++ u ++ invRev c with u = reduceCyclically (toWord x) nonempty and c its conjugator; let d be the least divisor of |u| such that u is the (|u|/d)-fold repetition of its prefix p of length d; return (mk (c ++ p ++ invRev c), |u|/d). The identity is handled explicitly: maxRoot 1 = (1, 0).

*Hypotheses.* α has decidable equality.

*Construction.*
1. The divisor search is bounded by |u|; checking that u is a repetition of a prefix is a list comparison.
2. Correctness (FG1/max-root-correct) uses that the power of a cyclically reduced word is the concatenation of copies (Mathlib's reduce_flatten_replicate).

*API.*
- `FreeGroup.maxRoot` (data): The procedure described, with maxRoot 1 = (1, 0).
- `FreeGroup.maxRoot_pow` (characterisation): (maxRoot x).1 ^ (maxRoot x).2 = x.
- `FreeGroup.maxRoot_conj` (relation): maxRoot (g * x * g⁻¹) = (g * (maxRoot x).1 * g⁻¹, (maxRoot x).2).
- `FreeGroup.maxRoot_zpow` (relation): For x ≠ 1 and n ≥ 1, maxRoot (x ^ n) = ((maxRoot x).1, n * (maxRoot x).2).
- `FreeGroup.centralizerGen` (data): centralizerGen x = none if x = 1 and some (maxRoot x).1 otherwise: the generator of the centralizer of a nontrivial element.

**Checks.**
- `FreeGroup.maxRoot_one` (degenerate): maxRoot 1 = (1, 0): the identity is not given a root.
- `FreeGroup.maxRoot_abab` (computation): maxRoot (of a * of b * of a * of b) = (of a * of b, 2).
- `FreeGroup.maxRoot_conj_sq` (computation): maxRoot (of b * of a ^ 2 * (of b)⁻¹) = (of b * of a * (of b)⁻¹, 2): roots are taken after cyclic reduction, not of the raw word.
- `FreeGroup.maxRoot_commutator` (non-example): maxRoot ⁅of a, of b⁆ = (⁅of a, of b⁆, 1): the commutator is its own maximal root although it is not primitive.
- `FreeGroup.maxRoot_inv` (compatibility): maxRoot x⁻¹ = ((maxRoot x).1⁻¹, (maxRoot x).2), with exponent always ≥ 1 for x ≠ 1.

*Examples.* maxRoot (a b a b) = (a b, 2); maxRoot (b a² b⁻¹) = (b a b⁻¹, 2); maxRoot (a b a) = (a b a, 1).

*Used by.* FG1 centralizer theorem: centralizerGen returns a generator of the centralizer of a nontrivial element; FG8 centralizer extensions and FG10 centralizer algorithms: SUBGROUPS Lemma 21 starts its induction with maximal roots in F; FG7 periodic structures: periods are maximal roots of cyclically reduced words.

*Source.* [SUBGROUPS] §5, proof of Lemma 21, p. 36 of the author copy: The centralizer of a nontrivial element of F is cyclic, generated by its maximal root, and the root can be found effectively.; [LEAN] Mathlib/GroupTheory/FreeGroup/CyclicallyReduced.lean (reduce_flatten_replicate): Powers of a cyclically reduced word are concatenations.

*Needs.* Mathlib `FreeGroup.reduceCyclically`; Mathlib `FreeGroup.reduceCyclically.conj_conjugator_reduceCyclically`; FG1.11 (Proper powers).

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Computable`, namespace `FreeGroup`.

### FG1.14 Existence and uniqueness of maximal roots, and correctness of maxRoot

**Theorem.** For x ∈ FreeGroup α with x ≠ 1: (1) (r, k) := maxRoot x satisfies r ^ k = x, k ≥ 1 and r is not a proper power; (2) uniqueness: if s ^ m = x with m ≥ 1 and s not a proper power then s = r and m = k; (3) every root of x is a power of r: if y ^ n = x with n ≥ 1 then y = r ^ (k / n) and n ∣ k. For x = 1, maxRoot x = (1, 0).

*Proof sketch.*
1. Reduce to the cyclically reduced case by conjugation (FG1/conjugacy-criterion).
2. If s ^ m = x with s cyclically reduced then toWord x is the m-fold concatenation of toWord s (reduce_flatten_replicate); two primitive-period decompositions of the same word coincide by the Lyndon–Schützenberger periodicity argument (a word with two periods p, q with p + q ≤ length has period gcd(p, q)).
3. Root uniqueness for fixed exponent is Mathlib's torsion-freeness instance (pow_left_injective).

*Examples.* For x = (a b)⁶: maxRoot x = (a b, 6), and the roots of x are (a b)^d for d ∣ 6. The identity case is excluded from (1)–(3): 1 = 1² = 1³, so uniqueness of the exponent fails at 1.

*Source.* [SUBGROUPS] §5, proof of Lemma 21, p. 36 of the author copy: Nontrivial elements of F have a maximal root generating their centralizer.; [IFT] §5.4, p. 40: A period is a cyclically reduced non-proper-power; P-periodic words are subwords of powers of P.

*Needs.* FG1.13 (Maximal-root extraction); FG1.7 (Conjugacy criterion: cyclic reductions agree up to cyclic permutation); Mathlib `IsMulTorsionFree`; FG1.11 (Proper powers).

### FG1.15 Root extraction and centralizer generators are primitive recursive

**Theorem.** For Primcodable α with DecidableEq α, maxRoot : FreeGroup α → FreeGroup α × ℕ and centralizerGen : FreeGroup α → Option (FreeGroup α) are primitive recursive; IsProperPower is a ComputablePred on FreeGroup α, decided by x ≠ 1 ∧ (maxRoot x).2 ≥ 2 together with the explicit answer true at x = 1.

*Proof sketch.*
1. Bounded divisor search and list comparisons are primitive recursive; compose with FG1/reduce-primrec.
2. The decision of IsProperPower uses FG1/max-root-correct (2)–(3): a nontrivial x is a proper power iff its maximal-root exponent is at least 2.

*Examples.* The decider answers true at 1, true at a², false at a b.

*Source.* [SUBGROUPS] §5, Lemma 21, p. 36 of the author copy: Maximal roots in F can be found effectively.

*Needs.* FG1.13 (Maximal-root extraction); FG1.14 (Existence and uniqueness of maximal roots, and correctness of maxRoot); FG1.2 (Free reduction and the group operations are primitive recursive); Mathlib `ComputablePred`.

### FG1.16 Commuting elements of a free group are powers of a common element

**Theorem.** For x, y ∈ FreeGroup α: x * y = y * x if and only if there are r ∈ FreeGroup α and m, n ∈ ℤ with x = r ^ m and y = r ^ n. If x ≠ 1 one can take r = (maxRoot x).1.

*Proof sketch.*
1. If x = 1 take r = y. Otherwise conjugate so that x is cyclically reduced; y commutes with x, so y⁻¹ x y = x, and by FG1/conjugacy-criterion y conjugates the cyclically reduced word x to itself; induct on |y| as in that proof to get y ∈ ⟨maxRoot x⟩.
2. The converse is immediate.

*Examples.* a b and (a b)³ commute; a and b do not. In ℤ² (not free) the conclusion fails: (1,0) and (0,1) commute but are not powers of one element; the theorem uses freeness.

*Source.* [SUBGROUPS] §5, proof of Lemma 21, p. 36 of the author copy: Centralizers of nontrivial elements of F are cyclic, generated by maximal roots.; [ALG] §2.1, p. 15 of the author copy: In a CSA group centralizers of nontrivial elements are abelian and commutation is transitive on nontrivial elements; free groups are CSA.

*Needs.* FG1.14 (Existence and uniqueness of maximal roots, and correctness of maxRoot); FG1.7 (Conjugacy criterion: cyclic reductions agree up to cyclic permutation).

### FG1.17 Centralizers of nontrivial elements are the cyclic groups of their maximal roots

**Theorem.** For x ∈ FreeGroup α with x ≠ 1: Subgroup.centralizer {x} = Subgroup.zpowers (maxRoot x).1. For x = 1 the centralizer is ⊤. Consequently centralizerGen x is correct: it is none exactly when x = 1, and otherwise generates the centralizer.

*Proof sketch.*
1. Combine FG1/commuting-elements with FG1/max-root-correct (3): an element commuting with x is a power of the common root, which is a power of the maximal root.

*Examples.* The centralizer of a² b a² b in F(a,b) is ⟨a² b⟩. The centralizer of 1 is the whole group, which is not cyclic when |α| ≥ 2: the identity is handled explicitly.

*Source.* [SUBGROUPS] §5, proof of Lemma 21, p. 36 of the author copy: C_F(h) is cyclic, generated by the maximal root of h, for h ≠ 1.

*Needs.* FG1.16 (Commuting elements of a free group are powers of a common element); FG1.14 (Existence and uniqueness of maximal roots, and correctness of maxRoot); Mathlib `Subgroup.centralizer`; Mathlib `Subgroup.zpowers`.

### FG1.18 Malnormal subgroups, CSA groups and commutation transitivity

**Definition (`Subgroup.IsMalnormal`).** A subgroup M of a group G is malnormal when g M g⁻¹ ∩ M = 1 for every g ∈ G ∖ M. G is a CSA group when every maximal abelian subgroup of G is malnormal. G is commutative transitive when for all x, y, z ∈ G with y ≠ 1, [x, y] = 1 and [y, z] = 1 imply [x, z] = 1. A CSA group is commutative transitive, and in a CSA group the centralizer of every nontrivial element is abelian (it is the unique maximal abelian subgroup containing the element).

*Construction.*
1. Predicates on subgroups and groups, with maximality of abelian subgroups quantified over subgroups.
2. CSA implies commutative transitive: if y ≠ 1 commutes with x and z, let M be a maximal abelian subgroup containing y; for x ∉ M some element of x M x⁻¹ ∩ M would be the nontrivial y = x y x⁻¹, contradicting malnormality, so x ∈ M, likewise z ∈ M, and M is abelian (ALG §2.1, p. 15).

*API.*
- `Subgroup.IsMalnormal` (data): M.IsMalnormal ↔ ∀ g ∉ M, (conj g • M) ⊓ M = ⊥.
- `Group.IsCSA` (data): Every maximal abelian subgroup is malnormal.
- `Group.IsCommTransitive` (data): Commutation is transitive on nontrivial elements.
- `Group.IsCSA.isCommTransitive` (relation): CSA groups are commutative transitive.
- `Group.IsCSA.centralizer_isMaximalAbelian` (characterisation): In a CSA group, for g ≠ 1 the centralizer of g is abelian and is the unique maximal abelian subgroup containing g.
- `Group.IsCSA.of_injective` (functoriality): Subgroups of CSA groups are CSA (a maximal abelian subgroup of a subgroup is its intersection with a maximal abelian subgroup of the group, by the previous item).
- `Group.IsCSA.of_commGroup` (constructor): Abelian groups are CSA.

**Checks.**
- `Group.isCSA_freeGroup` (computation): FreeGroup α is CSA (FG1/maximal-cyclic-malnormal).
- `Group.isCSA_of_commGroup` (degenerate): Multiplicative ℤ is CSA, so CSA does not imply nonabelian; the trivial group is CSA.
- `Group.not_isCSA_prod_int` (non-example): FreeGroup (Fin 2) × Multiplicative ℤ is not commutative transitive, hence not CSA, although the centralizers of the generators (a, 0), (b, 0), (a, 1) are abelian: a definition testing only the elements of some generating set would accept it.
- `Group.not_isCSA_amalgam_sq` (non-example): F(a,b) ∗_{⟨a²⟩} (⟨a²⟩ × ⟨t⟩) is not CSA: a commutes with a², a² commutes with t, but a and t do not commute (the test LimitGroup.centralizerExt_proper_power of FG8).
- `Group.IsCSA.center_eq_bot` (compatibility): A nonabelian CSA group has trivial centre (Mathlib's Subgroup.center G = ⊥): a nontrivial central element would make every two elements commute by commutation transitivity.

*Examples.* Every abelian group is CSA (its only maximal abelian subgroup is the whole group, and there is no g outside it). F(a,b) × ℤ is not commutative transitive: (a, 0) and (b, 0) both commute with (1, 1) but not with each other.

*Used by.* FG1/maximal-cyclic-malnormal: free groups are CSA; FG5/domain-examples (ALG Proposition 1): CSA G-groups with nonabelian G are G-domains; FG7/positive-normal-form (IFT §3.1, class T): Mal'tsev's equation has only the trivial solution in torsion-free CSA groups satisfying Vaught's condition; FG8 limit groups and extensions of centralizers: fully residually free groups are CSA; extensions of centralizers of CSA groups.

*Source.* [ALG] §1, p. 4, and §2.1, pp. 15–16: Malnormal subgroups and CSA groups (every maximal abelian subgroup malnormal); in a CSA group centralizers of nontrivial elements are abelian and commutation is transitive on nontrivial elements; Proposition 1 uses the notion for G-domains.; [IFT] §2.6, p. 7: Freely discriminated groups are torsion-free CSA groups.

*Needs.* Mathlib `Subgroup.centralizer`.

*Suggested home.* `TauCeti/GroupTheory/CSA`, namespace `Group`.

### FG1.19 Maximal cyclic subgroups are malnormal; free groups are CSA

**Theorem.** Let u ∈ FreeGroup α be nontrivial and not a proper power, and M = zpowers u. Then M is a maximal abelian subgroup and is malnormal: for g ∉ M, g M g⁻¹ ⊓ M = ⊥. Consequently FreeGroup α is a CSA group (FG1/csa-group) (every maximal abelian subgroup is malnormal), and commutation is transitive on nontrivial elements.

*Proof sketch.*
1. Maximal abelian subgroups of F are trivial or the centralizers of nontrivial elements (FG1/centralizer-cyclic), i.e. zpowers of non-proper-powers.
2. If g u^m g⁻¹ = u^n with m, n ≠ 0, then |m| = |n| by comparing cyclically reduced lengths; n = −m is impossible because a nontrivial element of a free group is not conjugate to its inverse (if h x h⁻¹ = x⁻¹ then h² commutes with x, so h and x are powers of one element by FG1/commuting-elements, and then x = x⁻¹, x = 1). Hence m = n, g commutes with u^m, and g ∈ centralizer (u^m) = zpowers u.

*Examples.* For u = a, g = b: b⟨a⟩b⁻¹ ∩ ⟨a⟩ = 1. For u = a², a proper power, the conclusion fails: g = a lies outside ⟨a²⟩ but a ⟨a²⟩ a⁻¹ ∩ ⟨a²⟩ = ⟨a²⟩, so the hypothesis that u is not a proper power is needed.

*Source.* [ALG] §1, p. 4 and §2.1, Proposition 1, p. 16 of the author copy: Definition of CSA groups (maximal abelian subgroups malnormal); a CSA group containing a non-abelian coefficient group is a domain.; [SUBGROUPS] §4, malnormality, p. 16 of the author copy: Malnormal subgroups and the malnormality problem.

*Needs.* FG1.17 (Centralizers of nontrivial elements are the cyclic groups of their maximal roots); FG1.7 (Conjugacy criterion: cyclic reductions agree up to cyclic permutation); FG1.11 (Proper powers); FG1.16 (Commuting elements of a free group are powers of a common element); FG1.18 (Malnormal subgroups, CSA groups and commutation transitivity).

### Dependencies

Within this roadmap: none. Libraries: Mathlib only (see the supplier contracts). Other roadmaps: none.

## Layer FG2: Stallings graphs and finitely generated free subgroups

Stallings' method represents a finitely generated subgroup of a free group by a finite folded labelled graph. The graphs are Serre graphs with edge reversal (shared with FG4). Folding terminates and preserves the accepted subgroup; the resulting correspondence between subgroups and based folded core graphs gives explicit free bases (a constructive Nielsen–Schreier theorem), membership, intersections, the index and the exact Schreier formula, and conjugacy of subgroups. Based equality and conjugacy are distinguished throughout.

*Targets of the layer.* Serre graphs (edge reversal without fixed points, loops and multiple edges allowed), paths, reduced paths, trees and maximal trees, and the freeness of π₁ of a graph with rank #E⁺ − #V + 1; α-labelled graphs with the subgroup accepted at a base vertex, folded graphs and core graphs; Stallings folds, their termination and preservation of the accepted subgroup; the Stallings graph of a finitely generated subgroup from a list of words; the Stallings correspondence (unique based folded core graph per subgroup, finite exactly for finitely generated subgroups, containment as based morphisms, conjugacy as isomorphism of unbased cores); explicit Nielsen bases and the isomorphism FreeGroup (E⁺ ∖ T) ≃* H; procedures for membership, intersections (product graphs; Howson property), index (complete graphs; the exact Schreier formula rank H − 1 = [F : H](rank F − 1)), subgroup conjugacy and conjugate containment, each with correctness of both answers and computability.

### FG2.1 Serre graphs: graphs with edge reversal, loops and multiple edges

**Definition (`SerreGraph`).** A Serre graph consists of a vertex type V, an edge type E, an origin map src : E → V and a reversal rev : E → E with rev (rev e) = e and rev e ≠ e for every edge; the terminus is tgt e := src (rev e). Loops (src e = tgt e) and multiple edges are allowed. An orientation is a subset E⁺ ⊆ E containing exactly one edge of each pair {e, rev e}. A path from u to w is a list of edges e₁ … e_k with src e₁ = u, tgt e_i = src e_{i+1} and tgt e_k = w (the empty path at u has u = w); a path is reduced when no e_{i+1} = rev e_i. The graph is connected when any two vertices are joined by a path, and is a tree when it is connected, nonempty and has no reduced closed path of positive length.

*Construction.*
1. Structure with the four fields and two axioms; paths as lists with a chain condition; reduced paths by a second chain condition.

*API.*
- `SerreGraph` (structure): Fields V, E, src, rev with rev_rev and rev_ne; tgt e = src (rev e).
- `SerreGraph.Path` (data): Paths as lists of composable edges between two vertices, with nil, cons, append and reverse (reverse reverses the list and applies rev).
- `SerreGraph.Path.IsReduced` (data): No backtracking: no edge immediately followed by its reverse.
- `SerreGraph.Path.reduce` (constructor): Every path is homotopic (by removing backtracks) to a unique reduced path with the same ends.
- `SerreGraph.IsTree` (data): Connected, nonempty, and every reduced closed path is empty.
- `SerreGraph.IsTree.unique_reduced_path` (characterisation): In a tree, between two vertices there is exactly one reduced path.
- `SerreGraph.toQuiver` (compatibility): A Serre graph gives a Quiver on V (hom-type from u to w the edges with those ends) with Mathlib's HasInvolutiveReverse structure given by rev.
- `SerreGraph.Hom` (functoriality): Morphisms: maps on vertices and edges commuting with src and rev; composition and identity.
- `SerreGraph.ofSimpleGraph` (compatibility): A Mathlib SimpleGraph G gives a Serre graph with E = G.Dart, src = Dart.fst and rev = Dart.symm (rev_rev from Dart.symm_symm, rev_ne from Dart.symm_ne); it is a tree in the sense here iff it is a nonempty Mathlib tree (SimpleGraph.IsTree).

**Checks.**
- `SerreGraph.rose_one_not_tree` (non-example): The rose with one petal (one vertex, edges e and rev e, a loop) is connected but not a tree: the path [e] is a reduced closed path. A definition of graphs that drops loops (for instance through Mathlib's SimpleGraph) would call it a tree.
- `SerreGraph.segment_isTree` (computation): The segment (vertices 0, 1; edges e: 0→1 and rev e) is a tree and the unique reduced path from 0 to 1 is [e].
- `SerreGraph.single_vertex_isTree` (degenerate): One vertex and no edges is a tree; the empty graph is not (trees are nonempty).
- `SerreGraph.double_edge_not_tree` (non-example): Two vertices joined by two edge pairs e, f is not a tree ([e, rev f] is a reduced closed path): multiple edges are allowed and detected.
- `SerreGraph.toQuiver_reverse` (compatibility): Under toQuiver, Mathlib's Quiver.reverse of the arrow e is rev e.

*Examples.* The one-vertex graph with one pair of loop edges {e, ē} (the rose with one petal) is connected and not a tree. The segment with two vertices and one edge pair is a tree.

*Used by.* FG2 labelled graphs and Stallings foldings: the underlying graph of an X-digraph with inverse edges; FG4 graphs of groups and Bass–Serre trees: the underlying graph of a graph of groups and the tree on which the fundamental group acts; FG9 Λ-trees: the simplicial case Λ = ℤ of Λ-trees is a Serre tree.

*Source.* [TREES] Chapter I, §2.1, Definition 1 (graphs with edge reversal), §2.2 (trees): Serre's graphs: vertices, edges, origin and terminus, and a fixed-point-free involution on edges; trees are connected nonempty graphs without circuits.; [FOLD] §2, Convention 2.1, p. 5: The graph underlying a graph of groups: vertices, edges with a fixed-point-free involution e ↦ e⁻¹ and origin and terminus maps with o(e) = t(e⁻¹), loops and multiple edges allowed.; [KM02] §2, Definition 2.1 and Convention 2.2, p. 2: X-digraphs with the formal inverse edges added give the same combinatorics of paths and reduced paths.

*Needs.* Mathlib `Quiver`; Mathlib `SimpleGraph`; Mathlib `SimpleGraph.Dart`.

*Suggested home.* `TauCeti/Combinatorics/SerreGraph`, namespace `SerreGraph`.

### FG2.2 Maximal trees exist and the fundamental group of a graph is free

**Theorem.** Let Γ be a connected Serre graph and v a vertex. (1) Γ has a maximal subtree T containing every vertex; for finite Γ, T is computed by breadth-first search. (2) The set π₁(Γ, v) of reduced closed paths at v, with concatenation followed by reduction, is a group, free with basis indexed by the positive edges of Γ outside T: the basis element for e is the reduced loop (path in T from v to src e) · e · (path in T from tgt e to v). (3) For finite Γ, rank π₁(Γ, v) = #E⁺ − #V + 1.

*Hypotheses.* Γ connected (for (2), (3)); for (3), Γ finite.

*Proof sketch.*
1. (1) Zorn's lemma on subtrees for general Γ (Serre I.2.3, Proposition 11); for finite Γ a search tree.
2. (2) Every reduced closed path factors uniquely as a reduced product of the T-loops of the edges it crosses outside T.
3. (3) A finite tree has #E⁺ = #V − 1 (KM02 Lemma 8.2 counts #E⁺(Γ − T)).

*Examples.* For the rose with n petals, T is the vertex and π₁ is free of rank n. For the theta graph (two vertices, three edges) the rank is 3 − 2 + 1 = 2.

*Source.* [TREES] Chapter I, §2.3, Proposition 11, and §3.1 (graphs with free fundamental group): Connected graphs contain maximal trees containing all vertices; a group acting freely on a tree is free with basis given by the edges outside a maximal tree of the quotient.; [KM02] §6, Lemma 6.1, p. 12, and §8, Lemma 8.2, p. 20: A spanning tree of a folded core graph gives a free basis of its subgroup, and #E⁺(Γ − T) = #E⁺Γ − #VΓ + 1.

*Needs.* FG2.1 (Serre graphs: graphs with edge reversal, loops and multiple edges); Mathlib `FreeGroup`.

### FG2.3 α-labelled graphs (X-digraphs) and the subgroup they accept

**Definition (`StallingsGraph`).** For a type α, an α-labelled graph is a Serre graph Γ with a labelling μ : E → α × Bool such that μ (rev e) = (a, !b) when μ e = (a, b). The label of a path is the word of its edge labels, an element of List (α × Bool). For a vertex v, the subgroup accepted at v is subgroup Γ v := {mk (label p) | p a closed path at v} ≤ FreeGroup α; it equals the set of freely reduced labels of reduced closed paths when Γ is folded. A morphism of labelled graphs is a Serre-graph morphism preserving labels; a based graph (Γ, v) is a labelled graph with a base vertex. A labelled graph is folded when no vertex is the origin of two distinct edges with the same label, and it is a core graph at v when every vertex and edge lies on a reduced closed path at v.

*Construction.*
1. Structure extending SerreGraph with the labelling and its equivariance axiom; subgroup Γ v is the image of the label map on closed paths, which is closed under products (concatenation) and inverses (reversal).

*API.*
- `StallingsGraph` (structure): An α-labelled Serre graph with a base vertex; Fintype V and E for the finite case.
- `StallingsGraph.subgroup` (data): subgroup Γ v : Subgroup (FreeGroup α), the elements read by closed paths at v.
- `StallingsGraph.IsFolded` (data): At each vertex, at most one edge with each label in α × Bool.
- `StallingsGraph.IsCore` (data): Every edge lies on a reduced closed path at the base vertex.
- `StallingsGraph.Hom.subgroup_le` (functoriality): A based morphism (Γ, v) → (Δ, w) gives subgroup Γ v ≤ subgroup Δ w (KM02 Lemma 4.1).
- `StallingsGraph.subgroup_conj` (relation): If p is a path from v to w with label g then subgroup Γ w = (mk g)⁻¹ · subgroup Γ v · mk g.
- `StallingsGraph.mem_subgroup_iff_folded` (characterisation): For folded Γ, a reduced word is in subgroup Γ v iff it is the label of a (necessarily reduced) closed path at v.

**Checks.**
- `StallingsGraph.rose_subgroup_top` (computation): For the rose R_α (one vertex, one petal per letter), subgroup R_α = ⊤.
- `StallingsGraph.edge_subgroup_bot` (degenerate): A tree (for instance one edge labelled a) accepts ⊥ at every vertex.
- `StallingsGraph.unfolded_reads_nonreduced` (non-example): In the unfolded graph with two loops labelled a at v, the closed path a · ā (first loop, then the reverse of the second) has label a a⁻¹ although it is a reduced path; so for unfolded graphs reduced paths need not have reduced labels, and the characterisation by reduced paths needs IsFolded.
- `StallingsGraph.subgroup_basepoint` (characterisation): In the cycle of length 2 labelled a, b, the subgroups at the two vertices are ⟨a b⟩ and ⟨b a⟩: conjugate and distinct, so based equality differs from conjugacy.

*Examples.* The rose with petals labelled a, b accepts F(a,b) at its vertex. A single edge labelled a from v to w ≠ v accepts the trivial subgroup at v.

*Used by.* KM02 §§3–9: every algorithm on finitely generated subgroups of F reads words along paths of Γ(H); FG9 (ℤ[t],X)-graphs: the infinite-word generalisation keeps the same accepted-subgroup semantics; FG10 effective subgroup algorithms: subgroups of limit groups represented by labelled graphs.

*Source.* [KM02] §2, Definitions 2.1, 2.3 and 2.7, pp. 2–4; §3, Proposition 3.1 and Lemma 3.2, p. 6; Definition 3.5 and Lemma 3.7, p. 7: X-digraphs, folded graphs, the language L(Γ, v) of reduced closed paths, the fact that the freely reduced labels of closed paths form a subgroup, and core graphs.; [FOLD] §3, A-graphs, pp. 8–10: The same notions for graphs labelled by a graph of groups; the free-group case is X-digraphs.

*Needs.* FG2.1 (Serre graphs: graphs with edge reversal, loops and multiple edges); Mathlib `FreeGroup`; Mathlib `FreeGroup.IsReduced`.

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Stallings`, namespace `FreeGroup.StallingsGraph`.

### FG2.4 Stallings folds and their termination

**Construction (`StallingsGraph.foldAt`).** For an α-labelled graph Γ with two distinct edges f₁, f₂ of the same origin and the same label, foldAt Γ f₁ f₂ is the graph obtained by identifying tgt f₁ with tgt f₂ and the pairs {f₁, rev f₁} with {f₂, rev f₂} (KM02 Definition 2.4, including the cases where one or both edges are loops). For finite Γ, fold Γ applies foldAt to the first unfolded pair in a fixed enumeration until none remains. The result is folded, connected if Γ is, and comes with a surjective based morphism Γ → fold Γ.

*Hypotheses.* For fold Γ: Γ finite with decidable equality on vertices, edges and α.

*Construction.*
1. A single fold decreases the number of edges by two (one pair) (KM02 Lemma 2.5(3)), so the iteration terminates after at most #E/2 steps: termination is a well-founded recursion on #E.
2. Each fold induces a based morphism, so composition gives the morphism Γ → fold Γ.

*API.*
- `StallingsGraph.foldAt` (constructor): The single fold of two edges with common origin and label.
- `StallingsGraph.fold` (constructor): Iterated folding of a finite graph, terminating by the edge count.
- `StallingsGraph.fold_isFolded` (characterisation): (fold Γ).IsFolded.
- `StallingsGraph.card_edge_foldAt` (simp): Fintype.card (foldAt Γ f₁ f₂).E + 2 = Fintype.card Γ.E.
- `StallingsGraph.foldHom` (projection): The surjective based morphism Γ → fold Γ.
- `StallingsGraph.fold_of_isFolded` (simp): fold Γ = Γ when Γ is folded.

**Checks.**
- `StallingsGraph.fold_flower_ab_ac` (computation): Folding the flower with petals a b and a c gives the graph with vertices v, w, one a-edge v → w and b, c edges w → v (2 vertices, 3 edge pairs).
- `StallingsGraph.fold_rose` (degenerate): The rose R_α is folded, so fold R_α = R_α.
- `StallingsGraph.fold_flower_a_a` (computation): Folding the flower with two petals labelled a gives the one-petal rose (petals with equal labels collapse).
- `StallingsGraph.fold_loops` (non-example): Folding a loop labelled a at v with an edge labelled a from v to w identifies w with v: a fold that only identified edges without identifying their termini would not produce a graph map.

*Examples.* For distinct letters a, b, c, folding the flower with petals a b and a c identifies the two a-edges: the result has two vertices v, w, one a-edge from v to w and b- and c-edges from w to v. A folded graph is a fixed point: fold Γ = Γ when Γ.IsFolded.

*Used by.* FG2 Stallings graph of a finitely generated subgroup: the flower graph of the generators is folded; FG2 subgroup preservation: folding does not change the accepted subgroup; FG4 and FOLD §4: folding moves for graphs of groups generalise these folds.

*Source.* [KM02] §2, Definition 2.4 and Lemma 2.5, pp. 3–4: Definition of folding two edges with common origin and label, preserving connectivity and decreasing the number of edges of a finite graph by one (one positive edge).

*Needs.* FG2.3 (α-labelled graphs (X-digraphs) and the subgroup they accept).

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Stallings`, namespace `FreeGroup.StallingsGraph`.

### FG2.5 Folding preserves the accepted subgroup; cores do not change it

**Theorem.** For a finite α-labelled graph Γ with base vertex v: (1) subgroup (foldAt Γ f₁ f₂) v' = subgroup Γ v where v' is the image of v; hence subgroup (fold Γ) v' = subgroup Γ v. (2) The core Core(Γ, v), the union of the reduced closed paths at v, is connected, contains v, has no vertex of degree one except possibly v, and subgroup (Core Γ v) v = subgroup Γ v.

*Proof sketch.*
1. (1) The image of a closed path is a closed path with the same label (KM02 Lemma 2.5(2)); conversely a closed path in the folded graph lifts to a path whose label differs by inserting backtracks a a⁻¹ at the folded edge, so the elements agree (KM02 Lemma 3.4).
2. (2) KM02 Lemma 3.7: closed reduced paths at v stay in the core.

*Examples.* For the flower with petals a b and a c, the folded graph still accepts ⟨a b, a c⟩ at v. Deleting a hanging edge not on any closed path at v does not change the subgroup.

*Source.* [KM02] §3, Lemma 3.4, p. 7, and Lemma 3.7, p. 7: A single folding does not change the language of the graph at the base vertex; the core has the same language.; [FOLD] §4, Proposition 4.15, pp. 17–18: Folding moves on A-graphs preserve the subgroup L(B, u₀) of π₁(A, v₀) that the graph defines.

*Needs.* FG2.4 (Stallings folds and their termination); FG2.3 (α-labelled graphs (X-digraphs) and the subgroup they accept).

### FG2.6 The Stallings graph of a finitely generated subgroup

**Construction (`FreeGroup.stallingsGraph`).** For a finite list ws of words over α, stallingsGraph ws is Core(fold (flower ws), v): the flower has one vertex v and, for each reduced nonempty word w in ws, a petal (a cycle of length |w| through v reading w); fold is FG2/folding and Core removes the hanging trees. The output is a finite, connected, folded based graph that is a core graph at v.

*Hypotheses.* α has decidable equality; ws a finite list of words (they need not be reduced; they are reduced first).

*Construction.*
1. Build the flower, fold it (terminating by FG2/folding), and take the core by repeatedly deleting degree-one vertices other than v.

*API.*
- `FreeGroup.stallingsGraph` (constructor): The finite based graph Core(fold (flower ws), v).
- `FreeGroup.subgroup_stallingsGraph` (characterisation): subgroup (stallingsGraph ws) v = Subgroup.closure {mk w | w ∈ ws}.
- `FreeGroup.stallingsGraph_isFolded` (characterisation): stallingsGraph ws is folded, connected and a core graph at v.
- `FreeGroup.stallingsGraph_perm` (relation): Permuting, inverting or Nielsen-transforming the generating list yields an isomorphic based graph (FG2/stallings-correspondence).
- `FreeGroup.stallingsGraph_nil` (simp): stallingsGraph [] is the one-vertex graph with no edges.

**Checks.**
- `FreeGroup.stallingsGraph_ab_ac` (computation): stallingsGraph [a b, a c] has two vertices and three edge pairs, and accepts ⟨a b, a c⟩.
- `FreeGroup.stallingsGraph_nil_bot` (degenerate): stallingsGraph [] accepts ⊥.
- `FreeGroup.stallingsGraph_a_a2` (computation): stallingsGraph [a², a³] is the rose with one petal labelled a: ⟨a², a³⟩ = ⟨a⟩.
- `FreeGroup.stallingsGraph_conj_basepoint` (non-example): stallingsGraph [b a b⁻¹] is a cycle labelled a with a hanging b-edge at the base vertex: the core is taken at the base vertex, so a definition removing every degree-one vertex would change the accepted subgroup to ⟨a⟩.

*Examples.* stallingsGraph [a b, a c] has 2 vertices and 3 edge pairs. stallingsGraph [] is the single vertex with no edges.

*Used by.* FG2 membership, intersection, index and conjugacy algorithms: every algorithm starts from stallingsGraph of the given generators; FG2 Nielsen bases: spanning trees of the Stallings graph give free bases; FG6 finite covers of surfaces with boundary: finite-index subgroups of free groups are described by complete Stallings graphs.

*Source.* [KM02] §3, Proposition 3.8, p. 8, and §7, Proposition 7.1, p. 16: For a finitely generated subgroup given by finitely many freely reduced words, the folded core graph of the flower is constructed algorithmically and accepts exactly that subgroup.

*Needs.* FG2.4 (Stallings folds and their termination); FG2.5 (Folding preserves the accepted subgroup; cores do not change it); FG1.2 (Free reduction and the group operations are primitive recursive).

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Stallings`, namespace `FreeGroup.StallingsGraph`.

### FG2.7 Stallings correspondence: subgroups and based folded core graphs

**Theorem.** Let α be finite. (1) For every subgroup H ≤ FreeGroup α there is a connected folded based graph (Γ(H), 1_H), a core graph at 1_H, with subgroup Γ(H) 1_H = H; it is unique up to a unique based isomorphism. (2) Γ(H) is finite if and only if H is finitely generated, and then Γ(H) ≅ stallingsGraph ws for any finite generating list ws. (3) For subgroups K, H: K ≤ H if and only if there is a based morphism Γ(K) → Γ(H), which is then unique. (4) Forgetting base points: the type graph (unbased core) of Γ(H), obtained by deleting the hanging path from 1_H to the first vertex of degree at least three, determines H up to conjugacy: H and K are conjugate if and only if their type graphs are isomorphic as labelled graphs.

*Hypotheses.* α finite (the basis of F is finite); H any subgroup for (1), finitely generated for the finiteness clause of (2).

*Proof sketch.*
1. (1) Existence from the coset graph H\F with its core (KM02 Theorem 5.1); uniqueness from uniqueness of morphisms between folded graphs (Lemma 4.2) and the existence of morphisms for containments (Proposition 4.3) (KM02 Theorem 5.2).
2. (2) KM02 Lemma 5.4 with Proposition 3.8.
3. (3) KM02 Lemma 4.1 and Proposition 4.3.
4. (4) KM02 §7, Proposition 7.7 (subgroups are conjugate iff their unbased cores are isomorphic as labelled graphs).

*Examples.* Γ(⟨a b⟩) and Γ(⟨b a⟩) are distinct based graphs with isomorphic unbased cores. Γ(F(a,b)) is the rose with two petals; Γ(⟨a, b a b⁻¹⟩) is not complete.

*Source.* [KM02] §4, Lemmas 4.1–4.2 and Proposition 4.3, pp. 9–10; §5, Theorems 5.1–5.2, Definition 5.3, Lemma 5.4, pp. 11–12; §7, Proposition 7.7, p. 17: Existence and uniqueness of the subgroup graph, finiteness exactly for finitely generated subgroups, containment as based morphisms, and conjugacy as isomorphism of unbased cores.

*Needs.* FG2.6 (The Stallings graph of a finitely generated subgroup); FG2.5 (Folding preserves the accepted subgroup; cores do not change it); FG2.3 (α-labelled graphs (X-digraphs) and the subgroup they accept).

### FG2.8 Explicit free bases and embeddings from a Stallings graph

**Construction (`StallingsGraph.basisWords`).** For a finite connected folded based graph (Γ, v) and a maximal tree T (FG2/maximal-tree), basisWords Γ T assigns to each positive edge e outside T the reduced label of the T-loop through e. The map ι : FreeGroup (E⁺ ∖ T) →* FreeGroup α sending e to mk (basisWords Γ T e) is injective with range subgroup Γ v; its corestriction is an explicit isomorphism FreeGroup (E⁺ ∖ T) ≃* subgroup Γ v, and the inverse is computed by reading a word along Γ and recording the non-tree edges crossed. Hence rank (subgroup Γ v) = #E⁺ − #V + 1.

*Hypotheses.* Γ finite, connected and folded.

*Construction.*
1. Folded graphs have no reduced closed path with trivial label, so the T-loop words form a free basis (KM02 Proposition 6.7).
2. The inverse map reads the input word from v (unique since Γ is folded) and lists the non-tree edges in order.
3. The rank formula is KM02 Lemma 8.2.

*API.*
- `StallingsGraph.basisWords` (data): The T-loop word of each positive non-tree edge.
- `StallingsGraph.basisEquiv` (equivalence): FreeGroup (E⁺ ∖ T) ≃* subgroup Γ v, explicit in both directions.
- `StallingsGraph.freeGroupBasis` (compatibility): A FreeGroupBasis (E⁺ ∖ T) (subgroup Γ v), agreeing with Mathlib's IsFreeGroup instance from subgroupIsFreeOfIsFree.
- `StallingsGraph.rank_subgroup` (characterisation): Group.rank (subgroup Γ v) = #E⁺ − #V + 1 for finite connected folded Γ.
- `StallingsGraph.basisEquiv_symm_apply` (simp): The inverse reads the word along Γ from v and records non-tree edges.

**Checks.**
- `StallingsGraph.rank_ab_ac` (computation): rank ⟨a b, a c⟩ = 2 computed from stallingsGraph [a b, a c].
- `StallingsGraph.rank_bot` (degenerate): For the one-vertex graph without edges, the basis is empty and the subgroup is ⊥.
- `StallingsGraph.rank_a2_a3` (non-example): For ws = [a², a³] the Stallings graph has rank 1 although ws has two elements: the rank is not the length of the generating list.
- `StallingsGraph.basisEquiv_compat` (compatibility): The composition FreeGroup (E⁺ ∖ T) ≃* subgroup Γ v → FreeGroup α equals FreeGroup.lift of the basis words.

*Examples.* For Γ(⟨a b, a c⟩) with T the a-edge, the basis words are a b and a c and the rank is 3 − 2 + 1 = 2. For the index-2 subgroup ⟨a², a b, a b⁻¹⟩ of F(a,b) (words of even length) the graph is complete with 2 vertices and 4 edge pairs, and the rank is 4 − 2 + 1 = 3.

*Used by.* FG2 Schreier formula and Howson property: ranks of subgroups and of intersections are read from graphs; FG4 Grushko decompositions of subgroups of free groups: explicit bases of free factors; FG10 explicit embedding data: the specification asks for explicit words and maps between graph presentations and subgroups.

*Source.* [KM02] §6, Lemma 6.1, p. 12, Proposition 6.7 and Corollary 6.8, p. 15; §8, Lemma 8.2, p. 20: A spanning tree of a folded graph yields a free basis of its subgroup (Lemma 6.1); for a geodesic spanning tree of a folded core graph the basis is Nielsen-reduced (Proposition 6.7); the rank is the number of positive edges outside the tree (Lemma 8.2).; [LEAN] Mathlib/GroupTheory/FreeGroup/NielsenSchreier.lean (subgroupIsFreeOfIsFree): Mathlib proves the Nielsen–Schreier theorem non-constructively; this node provides explicit bases compatible with it.

*Needs.* FG2.7 (Stallings correspondence: subgroups and based folded core graphs); FG2.2 (Maximal trees exist and the fundamental group of a graph is free); Mathlib `IsFreeGroup`; Mathlib `FreeGroupBasis`; Mathlib `subgroupIsFreeOfIsFree`.

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Stallings`, namespace `FreeGroup.StallingsGraph`.

### FG2.9 Procedures for membership, intersection, index and subgroup conjugacy

**Construction (`FreeGroup.memberTest`).** For finite lists of words: (1) memberTest ws w reads the reduced word of w from the base vertex of stallingsGraph ws and answers true exactly when the reading succeeds and ends at the base vertex; (2) interGens ws us builds the product graph of stallingsGraph ws and stallingsGraph us (vertex pairs, an edge with label x between pairs joined by x-edges in both factors), takes its core at the pair of base vertices and returns the basis words of FG2/nielsen-basis; (3) indexOf ws returns some (number of vertices) when stallingsGraph ws is complete (every vertex has an outgoing edge with every label in α × Bool) and none otherwise; (4) conjSubgroupWitness ws us returns a word g with g⁻¹ ⟨ws⟩ g = ⟨us⟩ when the unbased cores of the two Stallings graphs are isomorphic as labelled graphs (searching the finitely many label-preserving bijections and base-point paths) and none otherwise; (5) conjContainWitness ws us returns g with g⁻¹ ⟨us⟩ g ≤ ⟨ws⟩ when there is a morphism from the unbased core of Γ(⟨us⟩) to Γ(⟨ws⟩), and none otherwise.

*Hypotheses.* α finite with decidable equality.

*Construction.*
1. Each procedure is a finite search over finite graphs built by FG2/stallings-graph-procedure; product graphs and isomorphism searches are bounded.

*API.*
- `FreeGroup.memberTest` (data): Membership test reading a word along the Stallings graph.
- `FreeGroup.interGens` (data): Generators of the intersection from the core of the product graph.
- `FreeGroup.indexOf` (data): Some index or none (infinite index).
- `FreeGroup.conjSubgroupWitness` (data): A conjugating word between two finitely generated subgroups, or none.
- `FreeGroup.conjContainWitness` (data): A word conjugating one subgroup into another, or none.
- `StallingsGraph.prod` (constructor): The product (pullback) graph of two labelled graphs over the rose.

**Checks.**
- `FreeGroup.memberTest_bc` (computation): memberTest [a b, a c] (b⁻¹ c) = true, since b⁻¹ c = (a b)⁻¹ (a c).
- `FreeGroup.memberTest_nil` (degenerate): memberTest [] w = true iff w reduces to the empty word.
- `FreeGroup.memberTest_ba` (non-example): memberTest [a b] (b a) = false although b a is conjugate to a b: membership is based.
- `FreeGroup.indexOf_ab` (non-example): indexOf [a, b a b⁻¹] = none: this subgroup has rank 2 = rank F(a,b) and is proper, of infinite index, so rank alone does not detect finite index.
- `FreeGroup.interGens_a2_a3` (computation): interGens [a²] [a³] generates ⟨a⁶⟩.

*Examples.* memberTest [a b, a c] (b⁻¹ c) = true; memberTest [a b] (b a) = false. indexOf [a², a b, a b⁻¹] = some 2.

*Used by.* FG2 correctness theorems: the procedures whose answers are certified; FG9 and FG10 algorithms in limit groups: SUBGROUPS §3 builds the same product-graph construction over ℤ[t]-words; FG4 effective free decompositions of subgroups of F: free-factor and index tests.

*Source.* [KM02] §7, Propositions 7.1–7.2, p. 16, Corollaries 7.8, 7.11, 7.13, pp. 17–20; §8, Corollary 8.5, p. 21; §9, Corollary 9.5, p. 26: Algorithms deciding membership, computing generators of intersections, computing the index, and deciding conjugacy and conjugate containment of finitely generated subgroups, all by Stallings graphs; KM02 states a witness only for conjugate containment (Corollary 7.13), and the conjugating word for conjugacy is read from the isomorphism of type graphs and the hanging paths in the proof of Proposition 7.7.

*Needs.* FG2.6 (The Stallings graph of a finitely generated subgroup); FG2.8 (Explicit free bases and embeddings from a Stallings graph); FG1.4 (The word-problem procedure for a free group); FG1.8 (The conjugacy procedure with witness).

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Stallings`, namespace `FreeGroup.StallingsGraph`.

### FG2.10 Correctness of the membership test (generalised word problem)

**Theorem.** For a finite list ws and a word w over finite α: memberTest ws w = true if and only if mk w ∈ Subgroup.closure {mk u | u ∈ ws}. When true, reading w along Γ(⟨ws⟩) and applying the inverse of FG2/nielsen-basis expresses mk w as an explicit product of the basis words, hence of the generators.

*Proof sketch.*
1. For folded Γ, a reduced word lies in the accepted subgroup iff it labels a closed path at v (FG2/labelled-graph, mem_subgroup_iff_folded), and such a path is found by deterministic reading since Γ is folded.

*Examples.* b⁻¹ c ∈ ⟨a b, a c⟩ and the procedure returns the expression (a b)⁻¹(a c). b a ∉ ⟨a b⟩.

*Source.* [KM02] §7, Proposition 7.2, p. 16: The generalised word problem in F is solved by reading the word in the subgroup graph.

*Needs.* FG2.9 (Procedures for membership, intersection, index and subgroup conjugacy); FG2.7 (Stallings correspondence: subgroups and based folded core graphs); FG1.5 (Correctness of the word-problem procedure (both answers)).

### FG2.11 Intersections: product graphs and the Howson property

**Theorem.** For subgroups H, K ≤ FreeGroup α: the core at the pair of base vertices (1_H, 1_K) of the product graph Γ(H) × Γ(K) is the subgroup graph of H ∩ K; at another pair of vertices (v, w) the product graph accepts the intersection of the conjugates of H and K accepted at v and w. Consequently (Howson) the intersection of two finitely generated subgroups of a free group is finitely generated, and interGens computes a free basis of it: Subgroup.closure (interGens ws us) = ⟨ws⟩ ⊓ ⟨us⟩.

*Proof sketch.*
1. The product of folded graphs is folded (KM02 Lemma 9.2) and a closed path at (v, w) projects to closed paths in both factors; conversely two closed paths with the same reduced label combine (KM02 Proposition 9.4).
2. Finiteness: the product of finite graphs is finite (KM02 Corollary 9.6).

*Examples.* ⟨a²⟩ ∩ ⟨a³⟩ = ⟨a⁶⟩. ⟨a, b a b⁻¹⟩ ∩ ⟨b⟩ = ⊥.

*Source.* [KM02] §9, Lemma 9.2, p. 25, Proposition 9.4, pp. 25–26, Corollaries 9.5–9.6, p. 26: The product of subgroup graphs computes the intersection; finitely generated subgroups of free groups have finitely generated intersections, computable algorithmically.

*Needs.* FG2.9 (Procedures for membership, intersection, index and subgroup conjugacy); FG2.7 (Stallings correspondence: subgroups and based folded core graphs); FG2.8 (Explicit free bases and embeddings from a Stallings graph).

### FG2.12 Finite index, the index algorithm and the Schreier formula

**Theorem.** Let α be finite and H ≤ FreeGroup α. (1) H has finite index if and only if Γ(H) is finite and complete (every vertex has an outgoing edge with each label in α × Bool), and then H.index = #V(Γ(H)); hence indexOf ws = some n iff ⟨ws⟩.index = n ≠ 0. (2) (Schreier formula, exact form) If H has finite index i then H is finitely generated and, as integers, Group.rank H − 1 = i · (|α| − 1).

*Hypotheses.* α finite (for α empty the formula reads −1 = −1); H of finite index for (2).

*Proof sketch.*
1. (1) KM02 Proposition 8.3: coset representatives are the labels of tree paths to the vertices.
2. (2) KM02 Corollary 8.4: in a complete graph #E⁺ = |α| · #V, and rank H − 1 = #E⁺ − #V by FG2/nielsen-basis. Mathlib's Subgroup.rank_le_index_mul_rank gives only an inequality, and the current Tau Ceti library (newer than the pin) has the sharper inequality rank H ≤ 1 + [G : H](rank G − 1) (Subgroup.rank_le_one_add_index_mul_rank_sub_one, TauCeti/GroupTheory/Schreier.lean); the equality for free groups is planned here.

*Examples.* The kernel of F(a,b) → ℤ/2 sending a, b to 1 has index 2 and rank 1 + 2·1 = 3. ⟨a, b a b⁻¹⟩ has infinite index; its graph is not complete.

*Source.* [KM02] §8, Proposition 8.3, pp. 20–21, Corollaries 8.4–8.5, p. 21: A subgroup has finite index iff its graph is finite and X-regular; the index is the number of vertices; Schreier's formula rk(H) − 1 = i(rk(F) − 1).

*Needs.* FG2.9 (Procedures for membership, intersection, index and subgroup conjugacy); FG2.8 (Explicit free bases and embeddings from a Stallings graph); FG2.7 (Stallings correspondence: subgroups and based folded core graphs); Mathlib `Subgroup.rank_le_index_mul_rank`; Mathlib `Group.rank`; Mathlib `Subgroup.index`.

### FG2.13 Correctness of the subgroup conjugacy and conjugate-containment procedures

**Theorem.** For finite lists ws, us over finite α: (1) conjSubgroupWitness ws us = some g implies (mk g)⁻¹ ⟨ws⟩ (mk g) = ⟨us⟩, and it is none iff ⟨ws⟩ and ⟨us⟩ are not conjugate; (2) conjContainWitness ws us = some g implies (mk g)⁻¹ ⟨us⟩ (mk g) ≤ ⟨ws⟩, and it is none iff no conjugate of ⟨us⟩ lies in ⟨ws⟩.

*Proof sketch.*
1. (1) KM02 Proposition 7.7: conjugate subgroups have isomorphic unbased cores, and an isomorphism together with a path from the base point gives the conjugator.
2. (2) KM02 Lemma 7.12: g K g⁻¹ ≤ H iff there is a morphism of the unbased core of Γ(K) into Γ(H).

*Examples.* ⟨a b⟩ and ⟨b a⟩ are conjugate by a; ⟨a⟩ and ⟨a²⟩ are not conjugate but a conjugate of ⟨a²⟩ lies in ⟨a⟩.

*Source.* [KM02] §7, Proposition 7.7 and Corollary 7.8, p. 17; Lemma 7.12 and Corollary 7.13, pp. 19–20: Conjugacy and conjugate containment of finitely generated subgroups are decided by isomorphisms and morphisms of type graphs; Corollary 7.13 returns a witness g with g K g⁻¹ ≤ H (the node's procedure takes the arguments in the other order and uses the convention g⁻¹ ⟨us⟩ g); the conjugacy witness is read off the isomorphism in the proof of Proposition 7.7.

*Needs.* FG2.9 (Procedures for membership, intersection, index and subgroup conjugacy); FG2.7 (Stallings correspondence: subgroups and based folded core graphs); FG1.7 (Conjugacy criterion: cyclic reductions agree up to cyclic permutation).

### FG2.14 The Stallings procedures are computable and total

**Theorem.** For finite α with decidable equality and a Primcodable encoding of finite labelled graphs (vertex and edge sets Fin n with lists of incidences), stallingsGraph, memberTest, interGens, indexOf, conjSubgroupWitness and conjContainWitness are primitive recursive; in particular the generalised word problem, the index and subgroup conjugacy of finitely generated subgroups of FreeGroup α are ComputablePred (decided by these procedures, with the witnesses of FG2/subgroup-conjugacy-correct).

*Proof sketch.*
1. Finite graphs are encoded as natural-number data; folds, cores, product graphs and bounded searches over bijections are compositions of primitive recursive list operations with bounded iteration (termination by the edge count, FG2/folding).
2. Combine with FG1/reduce-primrec and the correctness theorems FG2/membership-correct, FG2/howson-intersection, FG2/finite-index-schreier and FG2/subgroup-conjugacy-correct.

*Examples.* Each procedure is total, so termination holds on all finite input lists.

*Source.* [KM02] §7, Proposition 7.1, p. 16: The construction of Γ(H) from generators is algorithmic; the other algorithms of §§7–9 are built on it.

*Needs.* FG2.9 (Procedures for membership, intersection, index and subgroup conjugacy); FG2.6 (The Stallings graph of a finitely generated subgroup); FG2.10 (Correctness of the membership test (generalised word problem)); FG2.11 (Intersections: product graphs and the Howson property); FG2.12 (Finite index, the index algorithm and the Schreier formula); FG2.13 (Correctness of the subgroup conjugacy and conjugate-containment procedures); FG1.2 (Free reduction and the group operations are primitive recursive); Mathlib `ComputablePred`.

### Dependencies

Within this roadmap: FG1. Libraries: Mathlib only (see the supplier contracts). Other roadmaps: none.

## Layer FG3: Effective first-order group syntax and elementary logical transformations

The first-order language of groups with constants for a basis, an encoding of its syntax with primitive-recursive transformations, and the dictionary between terms and words. The end of the layer reduces quantifier-free formulas, and existential and universal sentences, to finitely many systems of equations and inequations; no decision theorem for formulas with more than one quantifier block is a target.

*Targets of the layer.* Using Mathlib's first-order syntax and semantics: the language of groups with constants for a basis A (L_A), and every group with c : A → G as an L_A-structure; primitive-recursive encodings of terms, bounded formulas and sentences with decode-encode round trips; primitive recursiveness and semantic correctness of substitution, renaming, bound-variable shifting and prenex normal form (capture-free by de Bruijn indexing; semantics in nonempty structures, which groups are); the term–word correspondence (terms of L_A ↔ words of FreeGroup (X ⊕ A), atomic formulas ↔ word equations); finite systems of equations and inequations with word coefficients and their solutions; the computable reduction of quantifier-free formulas to finite disjunctions of systems, and of existential and universal sentences to finitely many systems. No decision theorem for formulas with more than one quantifier block is a target.

### FG3.1 The language of groups and its coefficient extensions

**Definition (`FirstOrder.Language.group`).** Language.group is the first-order language with one constant symbol one, one unary function symbol inv and one binary function symbol mul, and no relation symbols. Every group G is a Language.group-structure by interpreting the symbols as 1, x ↦ x⁻¹ and multiplication. For a type A of coefficient names, L_A := Language.group[[A]] adds a constant for each a ∈ A; a group G together with c : A → G is an L_A-structure. For a coefficient group generated by A (in particular F(A) with c = of), the sentences of L_A over (G, c) are the sentences of the source's language L_A. The theory of groups is the set of the three group axioms as L-sentences.

*Construction.*
1. Define the language by its function-symbol family indexed by arity (0, 1, 2) and the empty relation family.
2. Instances: Group G gives Language.group.Structure G; a map c : A → G gives the constants structure, hence an L_A-structure (Mathlib's constantsOn structure for withConstants).

*API.*
- `FirstOrder.Language.group` (data): The language with symbols one, inv, mul of arities 0, 1, 2.
- `FirstOrder.Language.group.instStructure` (instance): A group G is a Language.group-structure with the standard interpretations.
- `FirstOrder.Language.group.realize_mul` (simp): Term.realize v (mul t s) = Term.realize v t * Term.realize v s, and similarly for inv and one.
- `FirstOrder.Language.group.Lcoeff` (constructor): Language.group[[A]] with the constants structure given by c : A → G.
- `FirstOrder.Language.group.theory` (data): The theory of groups (associativity, identity, inverse) as Language.group-sentences; G ⊨ theory for every group G.
- `FirstOrder.Language.group.homomorphism` (functoriality): A group homomorphism φ : G → H commuting with the coefficient maps is a homomorphism of L_A-structures; realize of terms commutes with φ.

**Checks.**
- `FirstOrder.Language.group.realize_comm_false` (non-example): The L_A-sentence mul(a,b) = mul(b,a) is false in FreeGroup (Fin 2) with c = of: a language with only equality and no constants could not express this.
- `FirstOrder.Language.group.realize_comm_true` (computation): The same sentence is true in Multiplicative (Fin 2 → ℤ) with the standard basis as constants.
- `FirstOrder.Language.group.trivial_models` (degenerate): In the trivial group every atomic sentence is true.
- `FirstOrder.Language.group.models_theory` (compatibility): Every Group G satisfies the theory of groups; for a Language.group-structure satisfying the theory, the induced operations form a group whose structure agrees with instStructure.

*Examples.* Every group is a model of the theory of groups; a monoid that is not a group (ℕ under addition, with inv interpreted arbitrarily) is not. With A = Fin 2 and c = of : Fin 2 → F(a,b), the atomic L_A-sentence mul(a, b) = mul(b, a) is false in F(a,b) and true in ℤ² with c(0) = (1,0), c(1) = (0,1).

*Used by.* FG3 effective syntax: terms and formulas of L_A are the objects encoded and transformed; FG7 existential, universal and positive fragments: sentences of L_A over F(A) are the inputs of the deciders; IFT §2.3 and §3: formulas in L_A and their equivalence modulo the axioms of group theory.

*Source.* [IFT] §2.3, p. 4: The standard language of group theory has symbols for multiplication, inversion and identity; for G generated by A one adds constants for the elements of A only, giving L_A.; [LEAN] Mathlib/ModelTheory/Basic.lean (Language, Structure) and Mathlib/ModelTheory/LanguageMap.lean (withConstants): First-order languages, structures and the extension of a language by constants.

*Needs.* Mathlib `FirstOrder.Language`; Mathlib `FirstOrder.Language.Structure`; Mathlib `FirstOrder.Language.withConstants`.

*Suggested home.* `TauCeti/ModelTheory/Groups`, namespace `FirstOrder.Language.group`.

### FG3.2 Primitive-recursive encodings of terms, formulas and sentences of L_A

**Construction (`FirstOrder.Language.Term.instPrimcodable`).** For a Primcodable type A of coefficient names and variables indexed by Fin k (or a Primcodable type X), equip L_A.Term X and Σ n, L_A.BoundedFormula X n with Primcodable structures whose encodings are Mathlib's list encodings (Term.listEncode, BoundedFormula.listEncode) followed by the list code, and prove that listEncode and listDecode are primitive recursive; Mathlib's round-trip theorems then make decode ∘ encode = some. Sentences are the formulas with X empty.

*Hypotheses.* A is Primcodable (for instance Fin n).

*Construction.*
1. The symbol type Σ i, L_A.Functions i is Primcodable (finitely many group symbols plus A).
2. listEncode is defined by structural recursion, hence primitive recursive by Primrec.list_rec-style combinators on the tree encoding; listDecode is a stack machine over the list, primitive recursive with a fuel bound equal to the list length.
3. Round trips are Mathlib's listDecode_encode_list.

*API.*
- `FirstOrder.Language.Term.instPrimcodable` (instance): Primcodable (L_A.Term X) via listEncode.
- `FirstOrder.Language.BoundedFormula.instPrimcodable` (instance): Primcodable (Σ n, L_A.BoundedFormula X n) via listEncode.
- `FirstOrder.Language.Term.primrec_listEncode` (other): listEncode on terms is primitive recursive.
- `FirstOrder.Language.BoundedFormula.primrec_listDecode` (other): listDecode on formula codes is primitive recursive.
- `FirstOrder.Language.BoundedFormula.decode_encode` (simp): decode (encode φ) = some φ.

**Checks.**
- `FirstOrder.Language.BoundedFormula.decode_encode_comm` (computation): decode (encode φ) = some φ for φ = ∀x (mul(x,a) = mul(a,x)).
- `FirstOrder.Language.BoundedFormula.decode_garbage` (non-example): The list consisting of a single binary function symbol with no arguments decodes to no formula: decoding is partial, and a total decoder that pads missing arguments would be wrong.
- `FirstOrder.Language.Term.encode_var` (degenerate): The code of a variable term var x is determined by the code of x alone.
- `FirstOrder.Language.Term.encode_compat` (compatibility): Encodable.encode on terms agrees with Mathlib's Encodable instance of Mathlib/ModelTheory/Encoding.lean.

*Examples.* encode then decode of the sentence ∀x (mul(x, a) = mul(a, x)) returns that sentence. decode of a code that is not a well-formed encoding returns none.

*Used by.* FG3 syntax operations: computability of substitution, renaming and normal forms is stated for these encodings; FG7 deciders: sentences are given to the existential, universal and positive deciders by their codes.

*Source.* [LEAN] Mathlib/ModelTheory/Encoding.lean (Term.listEncode, listDecode, listDecode_encode_list; BoundedFormula.listEncode and its round trip): Mathlib encodes terms and bounded formulas as lists of symbols and proves the round trip; it gives Encodable and Countable instances but not primitive recursiveness.; [IFT] §3, Corollaries 2–7, pp. 11–13: Kharlampovich–Myasnikov say ‘one can effectively find’ for transformations of formulas; this node gives those words their computability meaning.

*Needs.* FG3.1 (The language of groups and its coefficient extensions); Mathlib `FirstOrder.Language.Term.listEncode`; Mathlib `FirstOrder.Language.BoundedFormula.listEncode`; Mathlib `Primcodable`; Mathlib `Primrec`.

*Suggested home.* `TauCeti/ModelTheory/Groups`, namespace `FirstOrder.Language.group`.

### FG3.3 Substitution, renaming, variable shifting and prenex forms are computable

**Theorem.** For the encodings of FG3/effective-encoding: (1) Term.subst and BoundedFormula.subst (simultaneous substitution of terms for free variables, given as a finite table), (2) relabel (renaming of free variables along a computable map), (3) liftAt (shifting bound-variable indices), (4) the Boolean connectives and quantifiers, and (5) toPrenex are primitive recursive; and each preserves semantics: realize of a substitution is realize under the composed assignment, and realize_toPrenex holds in every nonempty structure (every group is nonempty).

*Hypotheses.* Free-variable tables are finite; prenex semantics uses a nonempty structure (automatic for groups).

*Proof sketch.*
1. Each operation is defined by structural recursion on terms or formulas; on codes it is a list transformation with bounded recursion.
2. Capture is impossible: bound variables are de Bruijn indices in Mathlib's BoundedFormula, and liftAt performs the shift that substitution under a binder needs.
3. Semantic correctness is Mathlib's realize_subst, realize_relabel and realize_toPrenex.

*Examples.* Substituting mul(y, a) for x in ∃z (mul(x, z) = one) yields ∃z (mul(mul(y,a), z) = one) without capturing z. toPrenex of (∀x φ) ∧ (∃y ψ) is a prenex formula equivalent in every group.

*Source.* [LEAN] Mathlib/ModelTheory/Syntax.lean (subst, relabel, liftAt) and Mathlib/ModelTheory/Complexity.lean (toPrenex, realize_toPrenex): Syntax operations on terms and bounded formulas and their semantic correctness; prenex normal form needs a nonempty structure.; [IFT] §2.3, p. 5: Every formula of L_A is logically equivalent to a prenex formula with a quantifier-free matrix, and fictitious quantifiers give the alternating ∀∃ form.

*Needs.* FG3.2 (Primitive-recursive encodings of terms, formulas and sentences of L_A); Mathlib `FirstOrder.Language.BoundedFormula.toPrenex`; Mathlib `FirstOrder.Language.BoundedFormula.realize_toPrenex`; Mathlib `FirstOrder.Language.BoundedFormula`; Mathlib `FirstOrder.Language.BoundedFormula.Realize`.

### FG3.4 Group terms as words: the term–word correspondence

**Construction (`FirstOrder.Language.group.Term.toWord`).** Define toWord : L_A.Term X → FreeGroup (X ⊕ A) by recursion: var x ↦ of (inl x), the constant a ↦ of (inr a), one ↦ 1, inv t ↦ (toWord t)⁻¹, mul t s ↦ toWord t * toWord s; and ofWord : FreeGroup (X ⊕ A) → L_A.Term X sending the reduced word to the left-nested product of letters and inverted letters (the identity to one). An atomic formula t = s corresponds to the word equation toWord t * (toWord s)⁻¹ = 1.

*Construction.*
1. Structural recursion on terms; ofWord by recursion on toWord of the element.

*API.*
- `FirstOrder.Language.group.Term.toWord` (data): The word of a term.
- `FirstOrder.Language.group.Term.ofWord` (constructor): The term of a word (left-nested product).
- `FirstOrder.Language.group.Term.toWord_ofWord` (simp): toWord (ofWord w) = w.
- `FirstOrder.Language.group.Term.realize_eq_lift` (characterisation): For every group G, c : A → G and v : X → G: Term.realize (v, c) t = FreeGroup.lift (Sum.elim v c) (toWord t).
- `FirstOrder.Language.group.Term.realize_equal_iff` (characterisation): (t = s) holds under (v, c) iff FreeGroup.lift (Sum.elim v c) (toWord t * (toWord s)⁻¹) = 1.
- `FirstOrder.Language.group.Term.primrec_toWord` (other): toWord and ofWord are primitive recursive for the encodings of FG1 and FG3.

**Checks.**
- `FirstOrder.Language.group.Term.toWord_conj` (computation): toWord (mul(inv(a), mul(x, a))) = (of (inr a))⁻¹ * of (inl x) * of (inr a).
- `FirstOrder.Language.group.Term.toWord_one` (degenerate): toWord one = 1 and toWord (mul(t, inv t)) = 1 although mul(t, inv t) and one are distinct terms.
- `FirstOrder.Language.group.Term.ofWord_toWord_ne` (non-example): ofWord (toWord (mul(t, inv t))) = one ≠ mul(t, inv t): the correspondence is a bijection up to the group axioms, not on syntax.
- `FirstOrder.Language.group.Term.realize_lift_compat` (compatibility): In G = FreeGroup A with c = of, realize (v, of) t = FreeGroup.lift (Sum.elim v of) (toWord t), i.e. substitution of FG1/evaluation-primrec.

*Examples.* toWord (mul(inv(a), mul(x, a))) = a⁻¹ x a. toWord (ofWord w) = w for every w.

*Used by.* FG3 quantifier-free normal form: atomic formulas become word equations; FG5 systems of equations over G: equations S(X, A) = 1 are elements of G[X] = G ∗ F(X); FG7 equation solver: the solver works on words; formulas reach it through toWord.

*Source.* [IFT] §2.3, p. 4: Every term of L_A is equivalent modulo the group axioms to a group word in the variables and the constants; atomic formulas are equations S(X, A) = 1.; [LEAN] Mathlib/ModelTheory/Syntax.lean (Term) and Mathlib/GroupTheory/FreeGroup/Basic.lean: Terms as an inductive type and the free group as the target of word normal forms.

*Needs.* FG3.1 (The language of groups and its coefficient extensions); Mathlib `FreeGroup`; Mathlib `FirstOrder.Language.Term`.

*Suggested home.* `TauCeti/ModelTheory/Groups`, namespace `FirstOrder.Language.group`.

### FG3.5 Finite systems of equations and inequations with word coefficients

**Definition (`FreeGroup.EqIneqSystem`).** For finite types X (variables) and A (basis of the coefficient free group), an equation–inequation system is a pair (S, T) of finite lists of words in FreeGroup (X ⊕ A). An assignment v : X → G into a group G with coefficients c : A → G solves (S, T) when FreeGroup.lift (Sum.elim v c) s = 1 for every s ∈ S and FreeGroup.lift (Sum.elim v c) t ≠ 1 for every t ∈ T. Solutions in FreeGroup A use c = of.

*Construction.*
1. A structure with two lists and a solution predicate.

*API.*
- `FreeGroup.EqIneqSystem` (structure): Fields eqs, ineqs : List (FreeGroup (X ⊕ A)).
- `FreeGroup.EqIneqSystem.IsSolution` (data): The solution predicate for v : X → G and coefficients c : A → G.
- `FreeGroup.EqIneqSystem.isSolution_map` (functoriality): If φ : G →* H commutes with the coefficients and is injective, φ ∘ v solves (S, T) in H iff v solves it in G; for non-injective φ only the equations transfer.
- `FreeGroup.EqIneqSystem.decidable_isSolution` (other): For G = FreeGroup A and a given assignment, IsSolution is decided by the word problem procedure FG1/word-problem-procedure.
- `FreeGroup.EqIneqSystem.append` (constructor): Conjunction of two systems.

**Checks.**
- `FreeGroup.EqIneqSystem.solution_commuting` (computation): In F(a,b), x = a, y = a² solves ([x y x⁻¹ y⁻¹], [x]).
- `FreeGroup.EqIneqSystem.empty_system` (degenerate): The empty system ([], []) is solved by every assignment.
- `FreeGroup.EqIneqSystem.ineq_not_eq` (non-example): The system ([], [x]) is solved by x = a but not by x = 1: inequations are not equations, and a definition storing all constraints as equations w = 1 is wrong.
- `FreeGroup.EqIneqSystem.isSolution_iff_formula` (compatibility): v solves (S, T) iff the conjunction of the atomic formulas (toWord-preimages of S, negated preimages of T) is realized by (v, c) in G.

*Examples.* The system ([x y x⁻¹ y⁻¹], [x]) over F(a,b) has the solution x = a, y = a². The system ([x a x⁻¹ a⁻¹, x b x⁻¹ b⁻¹], [x]) has no solution in F(a,b): an element commuting with a and b is trivial.

*Used by.* FG3 existential reduction: existential sentences reduce to finitely many systems; FG7 equation solver: the input class of the solver; FG5 algebraic sets: the equations S give the algebraic set V_G(S); inequations cut out its constructible subsets.

*Source.* [IFT] §2.3, pp. 4–5: A Boolean combination of atomic formulas of L_A is a disjunction of conjunctions of equations S_j(X, A) = 1 and inequations T_k(X, A) ≠ 1.; [VAR-II] §0, Definition 9, p. 6 of the author copy: The existential theory consists of sentences ∃X (⋀ u_i = 1 ∧ ⋀ v_j ≠ 1) true in G.

*Needs.* Mathlib `FreeGroup`; Mathlib `FreeGroup.lift`; FG3.4 (Group terms as words: the term–word correspondence).

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Equations`, namespace `FreeGroup.EqIneqSystem`.

### FG3.6 Quantifier-free formulas are finite disjunctions of systems

**Theorem.** There is a primitive recursive function toSystems sending a quantifier-free L_A-formula φ with free variables in X to a finite list of equation–inequation systems (S_i, T_i) over FreeGroup (X ⊕ A) such that, in every group G with coefficients c : A → G and every v : X → G, φ is realized by (v, c) if and only if v solves (S_i, T_i) for some i.

*Hypotheses.* φ is quantifier-free (Mathlib's IsQF).

*Proof sketch.*
1. Push negations to atoms and distribute conjunction over disjunction (disjunctive normal form, by recursion on IsQF using Mathlib's IsQF.induction_on_sup_not).
2. Replace each atom t = s by the word toWord t * (toWord s)⁻¹ (FG3/term-to-word), positive atoms into S_i and negated atoms into T_i.
3. Correctness by induction using realize_equal_iff; computability by FG3/syntax-operations-computable and the primitive recursiveness of toWord.

*Examples.* φ = ¬(x = a) ∨ (x y = y x) gives the two systems ([], [x a⁻¹]) and ([x y x⁻¹ y⁻¹], []). In a nontrivial group the source's further normalisation (each disjunct with exactly one equation and one inequation) is not used: inequations are kept as a list.

*Source.* [IFT] §2.3, pp. 4–5: Every quantifier-free formula of L_A is equivalent modulo the group axioms to a disjunction of conjunctions of equations and inequations (disjunctive normal form).; [LEAN] Mathlib/ModelTheory/Complexity.lean (IsQF, IsQF.induction_on_sup_not): Induction principles for quantifier-free formulas.

*Needs.* FG3.5 (Finite systems of equations and inequations with word coefficients); FG3.4 (Group terms as words: the term–word correspondence); FG3.3 (Substitution, renaming, variable shifting and prenex forms are computable); Mathlib `FirstOrder.Language.BoundedFormula.IsQF`.

### FG3.7 Existential and universal sentences reduce to systems

**Theorem.** There are primitive recursive functions existsToSystems and forallToSystems on codes of L_A-sentences such that: (1) if σ is an existential sentence ∃x₁…∃x_k φ with φ quantifier-free (Mathlib's IsExistential: a block of existential quantifiers over a quantifier-free matrix), then G ⊨ σ (with coefficients c) iff some system in existsToSystems σ has a solution in G; (2) if σ is universal, then G ⊨ σ iff no system in forallToSystems σ (the systems of the negated matrix) has a solution in G. The reduction is uniform in G: it uses only the group axioms.

*Hypotheses.* σ existential (respectively universal) in Mathlib's sense; G any group with coefficients.

*Proof sketch.*
1. Strip the existential block to obtain φ with free variables Fin k and apply FG3/quantifier-free-normal-form.
2. For universal sentences, negate: ∀x φ holds iff ∃x ¬φ fails, and ¬φ is quantifier-free.
3. Computability from FG3/syntax-operations-computable.

*Examples.* σ = ∃x (x a = a x ∧ x ≠ 1) reduces to the single system ([x a x⁻¹ a⁻¹], [x]), solvable in F(a,b) (x = a). σ = ∀x ∀y (x y x⁻¹ y⁻¹ = 1) holds in ℤ² and fails in F(a,b): the negated system ([], [x y x⁻¹ y⁻¹]) is solvable exactly in nonabelian groups.

*Source.* [IFT] §2.3, p. 5, and §3.2, pp. 13–16: Formulas are brought to prenex form with a Boolean matrix; universal formulas over F are analysed through their negations, which are existential.; [VAR-II] §0, Definition 9, p. 6 of the author copy: The existential theory as the set of true sentences ∃X(⋀ u_i = 1 ∧ ⋀ v_j ≠ 1); its decidability gives the word problem of coordinate groups.

*Needs.* FG3.6 (Quantifier-free formulas are finite disjunctions of systems); FG3.3 (Substitution, renaming, variable shifting and prenex forms are computable); Mathlib `FirstOrder.Language.BoundedFormula.IsExistential`; Mathlib `FirstOrder.Language.BoundedFormula.IsUniversal`; Mathlib `FirstOrder.Language.Sentence`.

### Dependencies

Within this roadmap: FG1. Libraries: Mathlib only (see the supplier contracts). Other roadmaps: none.

## Layer FG4: Bass–Serre theory and relative splittings

Graphs of groups, their fundamental groups and Bass–Serre trees, built on the Serre graphs of FG2 and compared with Mathlib's amalgams and HNN extensions. The layer proves the structure theorem, the normal form theorem, induced splittings (finite under finite generation), the Kurosh and Grushko theorems with their uniqueness statements, the moves relating splittings, and Dehn twists. Effective JSJ decompositions are in FG10, not consequences of this layer.

*Targets of the layer.* Graphs of groups over Serre graphs; the fundamental group via 𝔸-paths and via a maximal tree, isomorphic, and independent of the maximal tree and base vertex; the normal form theorem and injectivity of vertex groups; compatibility of one-edge graphs of groups with Mathlib's Monoid.PushoutI and HNNExtension (Britton's lemma); G-trees (actions without inversions), elliptic and hyperbolic elements, (𝒜, ℋ)-trees, minimality, domination and deformation spaces; the Bass–Serre tree; the structure theorem for actions on trees; the elliptic–hyperbolic dichotomy and fixed points of finitely generated groups of elliptic elements; induced splittings of subgroups, finite when the subgroup is finitely generated; the Kurosh subgroup theorem, the Grushko–Neumann rank formula and Grushko decompositions with their uniqueness, also relative to a finite family of subgroups; collapses, standard refinements and the moves preserving a deformation space; Dehn twists of amalgams and HNN extensions by elements centralizing the edge group, with their action on vertex and edge groups.

### FG4.1 Graphs of groups

**Definition (`GraphOfGroups`).** A graph of groups 𝔸 over a Serre graph A (FG2/serre-graph) assigns a group A_v to each vertex, a group A_e to each edge with A_{rev e} = A_e, and for each edge an injective homomorphism ω_e : A_e →* A_{tgt e}, with α_e := ω_{rev e} : A_e →* A_{src e}. Loops and multiple edges are allowed; no finiteness is assumed in the definition, and ‘finite graph of groups’ means a finite underlying graph.

*Construction.*
1. Structure over a Serre graph with dependent families of groups and monomorphisms satisfying the reversal compatibility.

*API.*
- `GraphOfGroups` (structure): Fields: graph, vertexGroup, edgeGroup, edgeGroup_rev, ω with injectivity.
- `GraphOfGroups.α` (projection): α_e := ω_{rev e} composed with the identification A_{rev e} = A_e.
- `GraphOfGroups.segment` (constructor): The graph of groups of an amalgam: two vertices, one edge pair.
- `GraphOfGroups.loop` (constructor): The graph of groups of an HNN extension: one vertex, one loop pair.
- `GraphOfGroups.Hom` (functoriality): Morphisms: a graph morphism with compatible group homomorphisms and twisting elements, composing associatively.
- `GraphOfGroups.restrict` (other): Restriction to a subgraph (used for collapses and for the maximal-tree presentation).

**Checks.**
- `GraphOfGroups.segment_eq_pushout` (compatibility): For the segment with groups A, B, C and maps C → A, C → B, π₁ is isomorphic to Mathlib's Monoid.PushoutI over the two-element index (FG4/one-edge-compatibility).
- `GraphOfGroups.trivial_groups` (degenerate): If all vertex and edge groups are trivial, π₁(𝔸, v) is the free group π₁(A, v) of FG2/maximal-tree.
- `GraphOfGroups.noninjective_rejected` (non-example): Data with a non-injective ω_e is not a graph of groups: with ω_e non-injective the vertex groups would not embed (the normal form theorem fails).
- `GraphOfGroups.BS12` (computation): The loop with A_v = A_e = ℤ = ⟨a⟩, α = id, ω = ×2 has π₁ ≅ ⟨a, t | t a² t⁻¹ = a⟩ ≅ BS(1,2), with the convention of FG4/fundamental-group: e ω_e(c) e⁻¹ = α_e(c).

*Examples.* The segment with vertex groups ℤ, ℤ and edge group ℤ mapped by 2 and 3 is a graph of groups (π₁ is the torus-knot-type group ⟨x, y | x² = y³⟩). A one-vertex graph with one loop pair, A_v = A_e = ℤ, α_e = id, ω_e = ×2, is a graph of groups (π₁ ≅ BS(1,2)).

*Used by.* FG4 Bass–Serre tree and structure theorem: the data from which the fundamental group and its tree are built; FG6 surface-group splittings and QH vertices: surfaces are cut along curves into graphs of groups; FG8 NTQ groups and FG10 JSJ decompositions: limit groups are described by graphs of groups with abelian edge groups.

*Source.* [FOLD] §2, Convention 2.1, p. 5: A graph of groups: an underlying Serre graph with vertex and edge groups, boundary monomorphisms α_e, ω_e, with A_{e⁻¹} = A_e and α_{e⁻¹} = ω_e.; [TREES] Chapter I, §4.4, Definition 8: Serre's definition of a graph of groups (G, Y).; [GL-JSJ] §1.1, pp. 15–16: Graphs of groups as quotients of actions on trees; conventions on minimality and edge orientation.

*Needs.* FG2.1 (Serre graphs: graphs with edge reversal, loops and multiple edges).

*Suggested home.* `TauCeti/GroupTheory/BassSerre`, namespace `GraphOfGroups`.

### FG4.2 The fundamental group of a graph of groups, via paths and via a maximal tree

**Construction (`GraphOfGroups.Path`).** For a graph of groups 𝔸 and a vertex v₀: (1) an 𝔸-path from v to v′ is a sequence a₀, e₁, a₁, …, e_k, a_k with e₁…e_k an edge path from v to v′, a₀ ∈ A_v, a_k ∈ A_{v′}, a_i ∈ A_{tgt e_i} = A_{src e_{i+1}}; π₁(𝔸, v₀) is the set of 𝔸-paths from v₀ to v₀ modulo the equivalence generated by a, e, ω_e(c), rev e, a′ ∼ a α_e(c) a′, with concatenation as product. (2) For a maximal tree T of A, π₁(𝔸, T) is the quotient of the free product of the A_v (Monoid.CoprodI) and the free group on E by the relations rev e = e⁻¹, e ω_e(c) e⁻¹ = α_e(c) (convention fixed here, matching (1)), and e = 1 for e ∈ T. There is a canonical isomorphism π₁(𝔸, v₀) ≃* π₁(𝔸, T) sending the loop [v₀, src e]_T e [tgt e, v₀]_T to e.

*Hypotheses.* A connected (for (2) and the isomorphism).

*Construction.*
1. (1) Define 𝔸-paths and elementary equivalences; concatenation descends to the quotient (FOLD Definition 2.3).
2. (2) Define the presentation as a quotient of Monoid.Coprod (Monoid.CoprodI A_·) (FreeGroup E) by a normal closure.
3. The isomorphism sends a generator to the corresponding T-loop; its inverse reads an 𝔸-path letter by letter (FOLD Proposition 2.4(3) gives the generating set).

*API.*
- `GraphOfGroups.Path` (data): 𝔸-paths with concatenation and elementary reduction.
- `GraphOfGroups.π₁` (constructor): π₁(𝔸, v₀): closed 𝔸-paths modulo equivalence, a group.
- `GraphOfGroups.π₁Tree` (constructor): π₁(𝔸, T) as a presented group.
- `GraphOfGroups.π₁Equiv` (equivalence): π₁(𝔸, v₀) ≃* π₁(𝔸, T) for a maximal tree T.
- `GraphOfGroups.vertexHom` (projection): For v and a path p from v₀ to v, the homomorphism A_v →* π₁(𝔸, v₀), a ↦ p a p⁻¹.
- `GraphOfGroups.π₁.lift` (universal-property): Homomorphisms π₁(𝔸, T) →* H correspond to families φ_v : A_v →* H and elements h_e ∈ H with h_e = 1 on T, h_{rev e} = h_e⁻¹ and h_e φ(ω_e c) h_e⁻¹ = φ(α_e c).
- `GraphOfGroups.π₁.map` (functoriality): Functoriality in morphisms of graphs of groups.

**Checks.**
- `GraphOfGroups.π₁_segment` (computation): π₁ of the segment with ℤ ← ℤ → ℤ by 2 and 3 is ⟨x, y | x² = y³⟩, whose abelianisation is ℤ.
- `GraphOfGroups.π₁_trivial` (degenerate): For a single vertex with group G and no edges, π₁ = G.
- `GraphOfGroups.π₁_rose_trivial` (computation): For the rose with n petals and trivial groups, π₁ is free of rank n.
- `GraphOfGroups.π₁_tree_relation_needed` (non-example): Omitting the relations e = 1 for e ∈ T in (2) adds a free factor of rank #E⁺(T): the presentation must kill tree edges.

*Examples.* For the segment, π₁(𝔸, T) is the amalgam A ∗_C B. Changing the maximal tree gives isomorphic groups (FG4/maximal-tree-independence).

*Used by.* FG4 normal form and vertex-group injectivity: the group in which reduced paths are compared; FG4 Bass–Serre tree: vertices are cosets of conjugated vertex groups in π₁; FG6, FG8, FG10: every splitting of a surface group, limit group or NTQ group is π₁ of a graph of groups.

*Source.* [FOLD] §2, Definitions 2.2–2.3 and Proposition 2.4(3), pp. 5–6: 𝔸-paths, the equivalence relation generated by elementary reductions, π₁(𝔸, v₀) as classes of closed 𝔸-paths, and generators from a maximal subtree.; [TREES] Chapter I, §5.1, the groups F(G, Y), π(G, Y), π₁(G, Y, T) and π₁(G, Y, P₀): Serre defines both versions of the fundamental group and identifies them.

*Needs.* FG4.1 (Graphs of groups); FG2.2 (Maximal trees exist and the fundamental group of a graph is free); Mathlib `Monoid.CoprodI`; Mathlib `Monoid.Coprod`; Mathlib `Subgroup.normalClosure`.

*Suggested home.* `TauCeti/GroupTheory/BassSerre`, namespace `GraphOfGroups`.

### FG4.3 Normal form theorem and injectivity of vertex groups

**Theorem.** Let 𝔸 be a graph of groups. (1) A nontrivial element a ∈ A_v, as a length-zero path, is not equivalent to the trivial path; hence each vertexHom A_v →* π₁(𝔸, v₀) is injective. (2) A reduced 𝔸-path (one containing no subsequence a, e, ω_e(c), rev e, a′) of positive length is not equivalent to a shorter path, and two equivalent reduced 𝔸-paths have the same underlying edge path. (3) In particular, for the segment, Mathlib's normal form for Monoid.PushoutI is recovered, and for the loop Mathlib's normal form for HNNExtension (Britton's lemma: a word t^{ε₁} g₁ … with no pinch t c t⁻¹, c ∈ A, or t⁻¹ c t, c ∈ B, is nontrivial).

*Proof sketch.*
1. Construct an action of π₁(𝔸, v₀) on the set of reduced normal-form words relative to transversals of the edge-group images, as Mathlib does for PushoutI and HNNExtension, and check the relations (FOLD Proposition 2.4, Serre I §5.2 Theorem 11).
2. (1) and (2) follow because the action sends the empty word to the normal form of the path.

*Examples.* In ⟨a, t | t a² t⁻¹ = a⟩ the path t a t⁻¹ is reduced because a ∉ ω(ℤ) = ⟨a²⟩, so t a t⁻¹ ∉ ⟨a⟩; the path t a² t⁻¹ is not reduced and equals a. For the segment with C → A, C → B the identity maps of a common group, π₁ = A and a reduced path of positive length does not exist.

*Source.* [FOLD] §2, Proposition 2.4 (Normal Form Theorem), p. 6: Nontrivial vertex-group elements are nontrivial in π₁; reduced 𝔸-paths of positive length are not equivalent to shorter paths, and equivalent reduced paths share the edge path.; [TREES] Chapter I, §5.2, Theorem 11 and its corollaries: Reduced words in the fundamental group of a graph of groups are nontrivial; vertex groups embed.; [LEAN] Mathlib/GroupTheory/PushoutI.lean (NormalWord, of_injective) and Mathlib/GroupTheory/HNNExtension.lean (NormalWord, of_injective): The one-edge cases are in Mathlib.

*Needs.* FG4.2 (The fundamental group of a graph of groups, via paths and via a maximal tree); Mathlib `Monoid.PushoutI.NormalWord`; Mathlib `HNNExtension.NormalWord`; Mathlib `HNNExtension.ReducedWord.toList_eq_nil_of_mem_of_range`; Mathlib `Monoid.PushoutI.of_injective`; Mathlib `HNNExtension.of_injective`.

### FG4.4 Independence of the maximal tree and the base vertex

**Theorem.** For a connected graph of groups 𝔸, vertices v₀, v₁ and maximal trees T, T′: π₁(𝔸, T) ≃* π₁(𝔸, T′) and π₁(𝔸, v₀) ≃* π₁(𝔸, v₁), by isomorphisms that carry each vertex group A_v to a conjugate of its image and each edge-group image to a conjugate of its image.

*Proof sketch.*
1. Both are isomorphic to π₁(𝔸, v₀) through FG4/fundamental-group; change of base vertex is conjugation by an 𝔸-path from v₀ to v₁.

*Examples.* For the theta graph of groups with trivial groups, the two choices of maximal tree give two free bases of F₂ related by a Nielsen automorphism.

*Source.* [TREES] Chapter I, §5.1, Proposition 20: The groups π₁(G, Y, T) for different maximal trees and π₁(G, Y, P₀) for different base points are isomorphic.; [FOLD] §2, Proposition 2.4(3), p. 6: Generators of π₁(𝔸, v₀) attached to an arbitrary maximal subtree.

*Needs.* FG4.2 (The fundamental group of a graph of groups, via paths and via a maximal tree).

### FG4.5 One-edge graphs of groups are Mathlib's amalgams and HNN extensions

**Comparison.** (1) For the segment graph of groups with vertex groups A, B, edge group C and monomorphisms C → A, C → B, π₁ ≃* Monoid.PushoutI over the index Bool with these maps, compatibly with the inclusions of A and B. (2) For the loop graph of groups with vertex group G, edge group C and monomorphisms α, ω : C → G, π₁ ≃* HNNExtension G (α C) (ω C) φ with φ = ω ∘ α⁻¹ on the image, sending G to of and the loop edge e to t⁻¹: with A := α(C), B := ω(C) and φ = ω ∘ α⁻¹, Mathlib's relation t a t⁻¹ = φ(a) (a ∈ A) is e⁻¹ α(c) e = ω(c), which is the relation e ω(c) e⁻¹ = α(c) of FG4/fundamental-group.

*Proof sketch.*
1. Compare universal properties: π₁.lift of FG4/fundamental-group with Monoid.PushoutI.lift and HNNExtension.lift.

*Examples.* The free product A ∗ B is the segment with trivial edge group and equals Monoid.Coprod A B up to the canonical isomorphism.

*Source.* [TREES] Chapter I, §1.1 (amalgams) and §5.1 (examples of fundamental groups of graphs of groups): Amalgamated products and HNN extensions are the fundamental groups of the segment and the loop.; [LEAN] Mathlib/GroupTheory/PushoutI.lean (lift) and Mathlib/GroupTheory/HNNExtension.lean (lift, t_mul_of): Universal properties of Mathlib's amalgams and HNN extensions.; [GL-JSJ] §1.1, p. 16: A one-edge splitting, that is a graph of groups with one edge, is an amalgam A ∗_C B or an HNN extension A ∗_C.

*Needs.* FG4.2 (The fundamental group of a graph of groups, via paths and via a maximal tree); Mathlib `Monoid.PushoutI`; Mathlib `HNNExtension`; Mathlib `Monoid.Coprod`.

### FG4.6 Group actions on trees: elliptic and hyperbolic elements, relative trees

**Definition (`GTree`).** A G-tree is a Serre tree T with an action of G by graph automorphisms without inversions (g · e ≠ rev e for all g, e). An element g is elliptic when it fixes a vertex and hyperbolic otherwise; a subgroup H is elliptic when it fixes a vertex. For a family 𝒜 of subgroups closed under conjugation and taking subgroups and a family ℋ of subgroups, an (𝒜, ℋ)-tree is a G-tree whose edge stabilizers lie in 𝒜 and in which every H ∈ ℋ is elliptic. T is minimal when it has no proper G-invariant subtree. T dominates T′ when there is a G-equivariant map T → T′, equivalently when every vertex stabilizer of T is elliptic in T′; two trees are in the same deformation space when each dominates the other.

*Construction.*
1. Define the action structure, the predicates elliptic, hyperbolic, minimal, the relative-tree predicate and domination.

*API.*
- `GTree` (structure): A Serre tree with a G-action without inversions.
- `GTree.IsElliptic` (data): g (or H) fixes a vertex.
- `GTree.IsHyperbolic` (data): g fixes no vertex.
- `GTree.IsRelative` (data): Edge stabilizers in 𝒜 and every H ∈ ℋ elliptic.
- `GTree.Dominates` (relation): T dominates T′: an equivariant map T → T′ exists; characterisation by vertex stabilizers.
- `GTree.SameDeformationSpace` (relation): Mutual domination; an equivalence relation.
- `GTree.translationLength` (other): ℓ(g) = min over vertices of d(x, g x); ℓ(g) = 0 iff g elliptic.

**Checks.**
- `GTree.cayley_hyperbolic` (computation): In the Cayley tree of F(a,b), ℓ(a b) = 2 and ℓ(a b a⁻¹) = 1.
- `GTree.point_all_elliptic` (degenerate): On the one-vertex tree every subgroup is elliptic, and every G-tree dominates the one-vertex tree.
- `GTree.inversion_excluded` (non-example): The action of ℤ/2 on the segment swapping its two vertices inverts the edge, so it is not a G-tree action; after subdivision it becomes one with an elliptic generator.
- `GTree.dominates_iff` (characterisation): T dominates T′ iff every vertex stabilizer of T is elliptic in T′ (checked on the Bass–Serre trees of A ∗ B and of the trivial splitting).

*Examples.* F(a,b) acting on its Cayley tree: every nontrivial element is hyperbolic. In the Bass–Serre tree of A ∗_C B, A and B are elliptic and a b (a ∈ A ∖ C, b ∈ B ∖ C) is hyperbolic.

*Used by.* FG4 structure theorem and induced splittings: subgroups act on the Bass–Serre tree; FG10 JSJ theory: universal ellipticity, domination and deformation spaces of (𝒜, ℋ)-trees; FG9 Λ-trees: the simplicial case of Λ-tree actions.

*Source.* [GL-JSJ] §1.1, pp. 15–17 (actions without inversions, elliptic and hyperbolic elements, minimal subtrees), Definition 2.1, p. 22, and §2.2 (domination, deformation spaces): Trees with actions, ellipticity, domination as existence of an equivariant map, equivalently ellipticity of vertex stabilizers, and (𝒜, ℋ)-trees.; [TREES] Chapter I, §6.1 and §6.4, Propositions 24–25: Fixed points and hyperbolic automorphisms of trees.

*Needs.* FG2.1 (Serre graphs: graphs with edge reversal, loops and multiple edges).

*Suggested home.* `TauCeti/GroupTheory/BassSerre/Action`, namespace `GTree`.

### FG4.7 The Bass–Serre tree of a graph of groups

**Construction (`GraphOfGroups.bassSerreTree`).** For a graph of groups 𝔸 with base vertex v₀, the Bass–Serre tree X(𝔸, v₀) has as vertices the classes p A_v of 𝔸-paths p from v₀ to v (p ≈ p′ when p ∼ p′ a with a ∈ A_v), with an edge between p A_v and p a e A_{v′} for a ∈ A_v and an edge e from v to v′. π₁(𝔸, v₀) acts by left concatenation, without inversions. X is a tree; the stabilizer of p A_v is p A_v p⁻¹ and the stabilizer of the edge from p A_v to p a e A_{v′} is p a α_e(A_e) a⁻¹ p⁻¹; the quotient graph is A.

*Construction.*
1. Define the vertex and edge sets as quotients of 𝔸-paths and the action by concatenation (FOLD Definition 2.5).
2. Connectedness by induction on path length; absence of reduced circuits from FG4/normal-form-theorem (2).

*API.*
- `GraphOfGroups.bassSerreTree` (constructor): X(𝔸, v₀) as a GTree for π₁(𝔸, v₀).
- `GraphOfGroups.bassSerreTree_isTree` (characterisation): X(𝔸, v₀) is a tree.
- `GraphOfGroups.stabilizer_vertex` (characterisation): Stab(p A_v) = p A_v p⁻¹.
- `GraphOfGroups.stabilizer_edge` (characterisation): Edge stabilizers are conjugates of edge-group images.
- `GraphOfGroups.quotient_bassSerreTree` (equivalence): The quotient graph X/π₁ is isomorphic to A.

**Checks.**
- `GraphOfGroups.bassSerreTree_free_product` (computation): For ℤ ∗ ℤ the vertex ⟨a⟩ has neighbours a^k⟨b⟩ for k ∈ ℤ, so degree ℵ₀.
- `GraphOfGroups.bassSerreTree_point` (degenerate): For a one-vertex graph of groups without edges, X is a point.
- `GraphOfGroups.bassSerreTree_BS12` (computation): For BS(1,2) the vertex A_v has 1 + 2 = 3 incident edge orbits representatives: index [A : α(C)] = 1 and [A : ω(C)] = 2, so each vertex has degree 3.
- `GraphOfGroups.bassSerreTree_not_quotient_paths` (non-example): Taking all 𝔸-paths without the relation ≈ gives a graph with a vertex for each element of A_v at the base, not a tree with the correct stabilizers.

*Examples.* For F(a,b) = ℤ ∗ ℤ with the segment of trivial edge group, X is the tree whose vertices are cosets of ⟨a⟩ and ⟨b⟩, bipartite with all vertices of infinite degree. For a graph of groups with all groups trivial, X is the universal cover of A.

*Used by.* FG4 structure theorem: the canonical example of a G-tree with given quotient graph of groups; FG4 induced splittings: subgroups of π₁ act on X; FG10 JSJ trees: trees of splittings of limit groups.

*Source.* [FOLD] §2, Definition 2.5 and the paragraphs following it, pp. 6–7: The Bass–Serre covering tree as classes of 𝔸-paths, its tree property from the normal form theorem, the action and the stabilizers.; [TREES] Chapter I, §5.3, Theorem 12: The universal covering tree of a graph of groups.

*Needs.* FG4.2 (The fundamental group of a graph of groups, via paths and via a maximal tree); FG4.3 (Normal form theorem and injectivity of vertex groups); FG4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees).

*Suggested home.* `TauCeti/GroupTheory/BassSerre`, namespace `GraphOfGroups`.

### FG4.8 Structure theorem: actions on trees are graphs of groups

**Theorem.** Let a group U act on a tree Y without inversions. Then the quotient graph B = Y/U carries a graph of groups 𝔹 (vertex groups stabilizers of lifts of vertices along a lift T₁ of a maximal tree and a fundamental domain T₂, edge groups edge stabilizers, monomorphisms inclusions twisted by chosen elements t_v) such that U ≃* π₁(𝔹, v₀′) and Y is U-equivariantly isomorphic to the Bass–Serre tree of 𝔹. The resulting graph of groups is independent of the choices up to isomorphism of graphs of groups.

*Proof sketch.*
1. Choose T₁ ⊆ T₂ ⊆ Y as in FOLD Remark 2.7 and define 𝔹.
2. The map π₁(𝔹, T) → U is surjective since U is generated by the vertex stabilizers along T₁ and the t_v; injectivity and the tree isomorphism come from comparing Y with the Bass–Serre tree (Serre I §5.4 Theorem 13).

*Examples.* SL(2, ℤ) acting on its Bass–Serre tree (from the amalgam ℤ/4 ∗_{ℤ/2} ℤ/6) recovers that amalgam. A free action gives trivial vertex groups and U free (FG2/maximal-tree).

*Source.* [FOLD] §2, Proposition 2.6 and Remark 2.7, pp. 7–8: For U acting on a tree without inversions the quotient carries a graph of groups with U ≅ π₁ and the tree equivariantly isomorphic to its Bass–Serre tree; explicit construction from a lifted maximal tree and fundamental domain.; [TREES] Chapter I, §5.4, Theorem 13: The structure theorem for groups acting on trees.

*Needs.* FG4.7 (The Bass–Serre tree of a graph of groups); FG4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees); FG2.2 (Maximal trees exist and the fundamental group of a graph is free); FG4.4 (Independence of the maximal tree and the base vertex).

### FG4.9 Elliptic–hyperbolic dichotomy and fixed points of finitely generated groups

**Theorem.** Let G act on a tree T without inversions. (1) Every g ∈ G is either elliptic or hyperbolic; a hyperbolic g has a unique axis, a g-invariant bi-infinite line on which it translates by ℓ(g) > 0. (2) If H ≤ G is finitely generated and every element of H is elliptic, then H fixes a vertex (for a finite generating set, it suffices that every generator and every product of two generators is elliptic). (3) If H contains a hyperbolic element then T contains a unique minimal H-invariant subtree μ_T(H), the union of the axes of hyperbolic elements of H.

*Hypotheses.* Action without inversions; H finitely generated in (2).

*Proof sketch.*
1. (1) Serre I §6.4, Propositions 24–25: consider the minimum of d(x, g x).
2. (2) Serre I §6.5, Corollary 2 (Serre's lemma on pairs of elliptic elements); GL-JSJ Proposition 1.1 shows the third alternative (fixing an end) only occurs for infinitely generated H.
3. (3) GL-JSJ Proposition 1.1(2).

*Examples.* In F(a,b) on its Cayley tree, a and b are hyperbolic, with axes meeting in one vertex. ℚ (infinitely generated) can act on a tree with all elements elliptic and no global fixed point, so the finite-generation hypothesis in (2) is needed.

*Source.* [TREES] Chapter I, §6.4, Propositions 24–25 and §6.5, Corollary 2: Automorphisms of trees without inversion are elliptic or hyperbolic; finitely generated groups of elliptic automorphisms have a fixed point.; [GL-JSJ] §1.1, Proposition 1.1, p. 17: Trichotomy: a global fixed point, or hyperbolic elements and a unique minimal invariant subtree, or an infinitely generated group fixing a unique end.

*Needs.* FG4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees).

### FG4.10 Induced splittings of subgroups, with finiteness under finite generation

**Construction (`GraphOfGroups.inducedSplitting`).** Let G = π₁(𝔸, v₀) with Bass–Serre tree X and base vertex x₀, and let U ≤ G. For a U-invariant subtree Y ⊆ X containing x₀, the induced splitting of U is the graph of groups of the structure theorem for the action of U on Y; its vertex groups are U ∩ conjugates of vertex groups of 𝔸 and its edge groups U ∩ conjugates of edge groups. The preferred subtree is X_{U,x₀} := ⋃_{u ∈ U} [x₀, u x₀]. If U is generated by a finite set S, then X_{U,x₀} = U · ⋃_{s ∈ S} [x₀, s x₀], so the induced graph of groups on X_{U,x₀}/U is finite; without finite generation it may be infinite.

*Hypotheses.* For finiteness: U finitely generated.

*Construction.*
1. Apply FG4/structure-theorem to the action of U on Y.
2. For finite S: the union of the geodesics [x₀, s x₀] meets every U-orbit of edges of X_{U,x₀}, because [x₀, s₁⋯s_k x₀] ⊆ ⋃ s₁⋯s_{i−1}[x₀, s_i x₀].

*API.*
- `GraphOfGroups.inducedSplitting` (constructor): The graph of groups of U acting on a U-invariant subtree.
- `GraphOfGroups.minimalSubtreeAt` (constructor): X_{U,x₀} = ⋃_{u ∈ U} [x₀, u x₀].
- `GraphOfGroups.inducedSplitting_finite` (characterisation): For finitely generated U the induced graph on X_{U,x₀} is finite.
- `GraphOfGroups.inducedSplitting_vertexGroup` (characterisation): Each vertex group of the induced splitting is U ∩ g A_v g⁻¹ for some g and v.
- `GraphOfGroups.inducedSplitting_equiv` (equivalence): U ≃* π₁ of the induced splitting (structure theorem).

**Checks.**
- `GraphOfGroups.induced_cyclic` (computation): For U = ⟨a b⟩ in ⟨a⟩ ∗ ⟨b⟩ the induced splitting on X_{U,x₀} is a cycle with two vertices and two edge pairs, all groups trivial: a definition that quotients by the subgroup generated by a and b separately, or that forgets one vertex orbit, gives a one-vertex loop instead.
- `GraphOfGroups.induced_vertex_subgroup` (degenerate): For U ≤ A_{v₀}, U fixes x₀, X_{U,x₀} = {x₀}, and the induced splitting is the single vertex U.
- `GraphOfGroups.induced_infinite` (non-example): For the commutator subgroup of F(a,b) the induced graph is infinite: finiteness needs finite generation.
- `GraphOfGroups.induced_kurosh` (compatibility): For 𝔸 with trivial edge groups (a free product), the induced splitting gives the Kurosh decomposition of U (FG4/kurosh-grushko).

*Examples.* For U = ⟨a b⟩ ≤ ℤ ∗ ℤ = ⟨a⟩ ∗ ⟨b⟩, X_{U,x₀} is the axis of a b, on which a b translates by two edges, so the induced graph of groups is a cycle with two vertices (one orbit of cosets of ⟨a⟩, one of ⟨b⟩) and two edge pairs, all groups trivial, with π₁ ≅ ℤ. The commutator subgroup of F(a,b) (infinitely generated) has an infinite induced graph on the Cayley tree.

*Used by.* FG4 Kurosh and Grushko theorems: subgroups of free products; FG10 subgroup algorithms: induced splittings of finitely generated subgroups of limit groups (FOLD Theorem 5.8); FG6 finite covers: finite-index subgroups of surface groups inherit splittings.

*Source.* [FOLD] §2, Definition 2.8, p. 8: Induced splittings of a subgroup with respect to an invariant subtree, the preferred subtree X_{U,x₀}, and vertex and edge groups conjugate into those of 𝔸.; [TREES] Chapter I, §5.5: Subgroups of fundamental groups of graphs of groups act on the same tree.

*Needs.* FG4.8 (Structure theorem: actions on trees are graphs of groups); FG4.7 (The Bass–Serre tree of a graph of groups); FG4.9 (Elliptic–hyperbolic dichotomy and fixed points of finitely generated groups).

*Suggested home.* `TauCeti/GroupTheory/BassSerre`, namespace `GraphOfGroups`.

### FG4.11 Kurosh subgroup theorem, Grushko–Neumann theorem and Grushko decompositions

**Theorem.** (1) (Kurosh) Every subgroup U of a free product ∗_i G_i is a free product of a free group and of subgroups U ∩ g G_i g⁻¹ (one for each double coset U g G_i with nontrivial intersection). (2) (Grushko–Neumann) For finitely generated nontrivial G₁, G₂, rank (G₁ ∗ G₂) = rank G₁ + rank G₂. (3) (Grushko decomposition) Every finitely generated group G is a free product G = G₁ ∗ ⋯ ∗ G_p ∗ F_q with each G_i nontrivial, not ℤ and freely indecomposable; p, q are unique and the G_i are unique up to conjugacy and permutation. (4) (Relative version) For a finite family ℋ of finitely generated subgroups, the same holds for free decompositions in which every H ∈ ℋ is conjugate into some factor, with the G_i freely indecomposable relative to the conjugates of ℋ they contain; the trees of these decompositions form one deformation space (the Grushko deformation space relative to ℋ).

*Hypotheses.* (2)–(4): finitely generated groups; (4): ℋ finite family of finitely generated subgroups.

*Proof sketch.*
1. (1) Apply FG4/induced-splitting to U acting on the tree of the free product (trivial edge stabilizers).
2. (2) Folding argument on 𝔸-graphs with the complexity of FOLD Definition 6.1 (FOLD Theorem 6.2).
3. (3) Existence by induction on rank using (2); uniqueness by (1) applied to two decompositions (the factors of one are elliptic in the tree of the other).
4. (4) The same argument for (trivial edge group, ℋ)-trees; GL-JSJ §3.2 identifies the Grushko deformation space.

*Examples.* rank(ℤ/2 ∗ ℤ/3) = 2; rank(F₂ ∗ ℤ) = 3. The Grushko decomposition of ℤ² ∗ F₂ has p = 1, q = 2, G₁ = ℤ².

*Source.* [FOLD] §6, Definition 6.1 and Theorem 6.2, pp. 27–29: A proof of Grushko's theorem rk(G₁ ∗ G₂) = rk G₁ + rk G₂ by foldings of 𝔸-graphs.; [TREES] Chapter I, §5.5, Theorem 14: Kurosh's subgroup theorem from the action on the Bass–Serre tree of a free product.; [GL-JSJ] Introduction, pp. 1–3, and §3.2, p. 30: Grushko decompositions G = G₁ ∗ ⋯ ∗ G_p ∗ F_q with q and the G_i unique up to conjugacy and permutation; the Grushko deformation space, also relative to a family of subgroups.

*Needs.* FG4.10 (Induced splittings of subgroups, with finiteness under finite generation); FG4.8 (Structure theorem: actions on trees are graphs of groups); FG4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees); FG2.8 (Explicit free bases and embeddings from a Stallings graph); Mathlib `Group.rank`.

### FG4.12 Collapses, refinements and domination of splittings

**Theorem.** For a G-tree T and a G-invariant set of edges E′, the collapse T/E′ (contract each edge of E′) is a G-tree dominated by T, whose vertex stabilizers are the stabilizers of the collapsed subtrees. If T₁ is elliptic with respect to T₂ (every edge stabilizer of T₁ is elliptic in T₂), there is a refinement T̂₁ of T₁ dominating T₂ (the standard refinement) with a collapse map T̂₁ → T₁, in which a subgroup is elliptic iff it is elliptic in both T₁ and T₂; if moreover the edge stabilizers of T₂ are finitely generated, T₂ is obtained from T̂₁ by finitely many collapses and folds. Moves that preserve the set of elliptic subgroups (collapses of edges e with G_e = G_{src e}, their inverse expansions, and slides) preserve the deformation space.

*Proof sketch.*
1. Collapses: quotient of a tree by a G-invariant forest is a tree; the induced map is equivariant.
2. Standard refinement: blow up each vertex v of T₁ into a G_v-invariant subtree of T₂ (GL-JSJ Proposition 2.2).
3. Deformation-space moves: GL-JSJ Remark 2.13 and the references there.

*Examples.* Collapsing the edge of A ∗_C B gives the trivial tree, dominated by every tree. For the two cyclic splittings of a closed surface group along intersecting curves, neither is elliptic with respect to the other, so no common refinement exists.

*Source.* [GL-JSJ] §2.1, Definition 2.1, Proposition 2.2 and Remark 2.3, pp. 22–23; Definition 2.5 and Lemma 2.6, pp. 23–24; Remark 2.13, p. 25: Ellipticity of one tree with respect to another; the standard refinement dominating the second tree, with its elliptic subgroups (Proposition 2.2(iv)); for finitely generated edge stabilizers the second tree is obtained from it by collapses and folds (Remark 2.3, citing Bestvina–Feighn); collapse maps and the moves relating trees of a deformation space.

*Needs.* FG4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees); FG4.8 (Structure theorem: actions on trees are graphs of groups).

### FG4.13 Dehn twists of one-edge splittings

**Construction (`GraphOfGroups.dehnTwistAmalgam`).** (1) For G = A ∗_C B (Mathlib's Monoid.PushoutI over Bool) and z ∈ Subgroup.centralizer C with z ∈ B (or z ∈ A), the Dehn twist τ_z is the automorphism with τ_z(a) = a for a ∈ A and τ_z(b) = z b z⁻¹ for b ∈ B (well defined since z centralizes C). (2) For G = HNNExtension A C₁ C₂ φ (Mathlib’s convention t a t⁻¹ = φ(a) for a ∈ C₁) and z ∈ A centralizing C₁, τ_z is the automorphism fixing A pointwise and sending t to t z; it is well defined because (t z) a (t z)⁻¹ = t a t⁻¹ = φ(a) for a ∈ C₁. (3) τ_z fixes the vertex group containing the base pointwise, acts on the other vertex group by conjugation, fixes the edge group pointwise, preserves the conjugacy class of every subgroup elliptic in the splitting, and τ_z τ_w = τ_{zw} for z, w in the same centralizer.

*Hypotheses.* z centralizes the edge group (inside the vertex group indicated).

*Construction.*
1. Define τ_z by the universal property (Monoid.PushoutI.lift, HNNExtension.lift), check the relations using that z centralizes the amalgamated subgroup, and invert by τ_{z⁻¹}.

*API.*
- `GraphOfGroups.dehnTwistAmalgam` (constructor): τ_z for an amalgam, as a MulEquiv.
- `GraphOfGroups.dehnTwistHNN` (constructor): τ_z for an HNN extension, as a MulEquiv.
- `GraphOfGroups.dehnTwist_apply_left` (simp): τ_z a = a for a ∈ A.
- `GraphOfGroups.dehnTwist_apply_right` (simp): τ_z b = z b z⁻¹ for b ∈ B; τ_z t = t z in the HNN case.
- `GraphOfGroups.dehnTwist_mul` (relation): τ_z ∘ τ_w = τ_{z w}; τ_1 = id.
- `GraphOfGroups.dehnTwist_edge` (characterisation): τ_z fixes the edge group pointwise and preserves the conjugacy class of every elliptic subgroup.

**Checks.**
- `GraphOfGroups.dehnTwist_one` (degenerate): τ_1 = MulEquiv.refl.
- `GraphOfGroups.dehnTwist_surface` (computation): On ⟨a₁,b₁⟩ ∗_{c = [a₁,b₁] = [b₂,a₂]} ⟨a₂,b₂⟩, τ_c maps a₂ ↦ c a₂ c⁻¹ and fixes a₁.
- `GraphOfGroups.dehnTwist_requires_centralizer` (non-example): For z ∈ B not centralizing C, the rule a ↦ a, b ↦ z b z⁻¹ does not respect c ∈ C (it sends c to both c and z c z⁻¹ ≠ c), so no homomorphism is defined: the centralizer hypothesis is necessary.
- `GraphOfGroups.dehnTwist_inner` (compatibility): If z is central in G then τ_z = id.

*Examples.* For F(a,b) = ⟨a⟩ ∗ ⟨b⟩ (C trivial) and z = b, τ_b fixes a and b: twisting a free splitting by an element of the factor B is inner on B and the identity on A. For the closed surface group ⟨a₁,b₁,a₂,b₂ | [a₁,b₁][a₂,b₂]⟩ split along c = [a₁,b₁], τ_c fixes a₁, b₁ and conjugates a₂, b₂ by c: it is the classical Dehn twist along the separating curve.

*Used by.* FG10 Makanin–Razborov diagrams: modular groups generated by Dehn twists act on solution sets; FG11 generic families: the basic automorphisms of quadratic equations are products of Dehn twists; FG6 surface groups: Dehn twists along simple closed curves of surfaces.

*Source.* [GL-JSJ] §9, p. 97, and §5.1.4, p. 46: Dehn twists of a one-edge splitting A ∗_C B by a central element of C (conjugation on one factor, identity on the other), and twists along simple closed curves of surfaces; the node's version twists by an element centralizing the edge group, which contains GL's case.; [SELA-I] §5, Definition 5.2, p. 62: The modular group of a freely indecomposable limit group is generated by inner automorphisms, Dehn twists along edges of the cyclic JSJ decomposition, Dehn twists along curves in quadratically hanging vertex groups, and generalized Dehn twists of abelian vertex groups.; [TREES] Chapter I, §1.1 and §1.4: Universal properties of amalgams and HNN extensions used to define automorphisms.

*Needs.* FG4.5 (One-edge graphs of groups are Mathlib's amalgams and HNN extensions); Mathlib `Monoid.PushoutI`; Mathlib `HNNExtension`; Mathlib `Subgroup.centralizer`.

*Suggested home.* `TauCeti/GroupTheory/BassSerre`, namespace `GraphOfGroups`.

### Dependencies

Within this roadmap: FG1, FG2. Libraries: Mathlib only (see the supplier contracts). Other roadmaps: none.

## Layer FG5: Equations, radicals, and algebraic geometry over groups

Algebraic geometry over a group G (Baumslag–Myasnikov–Remeslennikov): G[X], algebraic sets, radicals and coordinate groups, with the distinction between the normal closure and the radical; separation versus discrimination; domains, the Zariski topology (whose points are closed when the coefficients reach every point, for instance over H = G, but not over every G-group) and equational Noetherianity (proved for free groups of finite rank through linearity); irreducible components and the characterisation of irreducibility by discrimination. A radical quotient need not be fully residually free, and Noetherianity is not an algorithm.

*Targets of the layer.* For a coefficient group G: G-groups and G-homomorphisms; G[X] = G ∗ F(X) and evaluation of its elements at tuples; systems of equations, algebraic sets V_G(S), radicals Rad(S) and coordinate groups G_{R(S)} = G[X]/Rad(S), with the comparison ncl(S) ≤ Rad(S) and the surjection G_S → G_{R(S)}; points as G-homomorphisms (Hom_G(G_{R(S)}, G) ≃ V_G(S)) and the anti-equivalence between algebraic sets with word maps and coordinate groups with G-homomorphisms, including changes of coordinates by G-automorphisms of G[X]; G-separation and G-discrimination (residually and fully residually G) and their difference; domains, under which finite unions of algebraic sets are algebraic and algebraic sets are the closed sets of the Zariski topology; equational Noetherianity, proved for free groups of finite rank through their embedding in SL(2, ℤ) and the theorem for linear groups; the Noetherian Zariski topology, finite irredundant decompositions into irreducible components, unique up to order, and finite subsystems; irreducibility of an algebraic set over an equationally Noetherian domain as G-discrimination of its coordinate group by G. Noetherianity is not an algorithm; components are computed in FG10.

### FG5.1 G-groups and the free G-group G[X]

**Construction (`GroupAlgGeom.GGroup`).** For a group G, a G-group is a group H with a homomorphism ι_H : G →* H (in the sources ι_H is injective and G is identified with its image; here injectivity is a hypothesis where used), and a G-homomorphism H →_G K is a homomorphism φ with φ ∘ ι_H = ι_K. For a type X, G[X] := Monoid.Coprod G (FreeGroup X) = G ∗ F(X), a G-group through the left inclusion. For a G-group H and v : X → H, evaluation eval v : G[X] →* H is Monoid.Coprod.lift ι_H (FreeGroup.lift v); for w ∈ G[X] and v, w(v) := eval v w.

*Construction.*
1. Define the bundled G-group structure (a group with a homomorphism from G) and its morphisms.
2. G[X] and eval from Mathlib's Monoid.Coprod and FreeGroup.lift.

*API.*
- `GroupAlgGeom.GGroup` (structure): A group H with ι : G →* H.
- `GroupAlgGeom.GHom` (functoriality): G-homomorphisms, with identity and composition.
- `GroupAlgGeom.GX` (constructor): G[X] := Monoid.Coprod G (FreeGroup X).
- `GroupAlgGeom.eval` (data): eval v : G[X] →* H for a G-group H and v : X → H.
- `GroupAlgGeom.eval_inl` (simp): eval v (inl g) = ι_H g.
- `GroupAlgGeom.eval_inr_of` (simp): eval v (inr (of x)) = v x.
- `GroupAlgGeom.homEquiv` (universal-property): G-homomorphisms G[X] →_G H are in bijection with X → H via v ↦ eval v.
- `GroupAlgGeom.eval_comp` (functoriality): For a G-homomorphism φ : H → K, φ ∘ eval v = eval (φ ∘ v).

**Checks.**
- `GroupAlgGeom.eval_commutator` (computation): For G = FreeGroup (Fin 2), X = Unit, eval (fun _ => a ^ 2) (x a x⁻¹ a⁻¹) = 1 and eval (fun _ => b) (x a x⁻¹ a⁻¹) ≠ 1.
- `GroupAlgGeom.GX_empty` (degenerate): For X empty, G[X] ≅ G (Monoid.Coprod G (FreeGroup Empty) with trivial right factor).
- `GroupAlgGeom.GX_trivial_G` (compatibility): For G trivial, G[X] ≅ FreeGroup X and eval agrees with FreeGroup.lift.
- `GroupAlgGeom.GX_not_product` (non-example): G[X] is not G × F(X): in G[X] the elements inl a and inr (of x) do not commute for a ≠ 1.

*Examples.* For G = F(a,b) and X = {x}, the element x a x⁻¹ a⁻¹ ∈ G[X] evaluated at x = a² is 1. eval is the unique G-homomorphism G[X] → H sending x to v x.

*Used by.* FG5 algebraic sets and radicals: equations are elements of G[X] and solutions are evaluations; FG3 equation systems: for G = F(A), G[X] is identified with FreeGroup (X ⊕ A) (both are free on X ⊔ A); FG7, FG8, FG11: coordinate groups G_{R(S)} are quotients of G[X].

*Source.* [IFT] §2.2, p. 4: G-groups, G-homomorphisms, and the free G-group G[X] = G ∗ F(X), free in the category of G-groups.; [ALG] §1 (introduction) and §2, pp. 2–5: G-groups, G-homomorphisms, G[X] and evaluation of its elements at points of H^n.

*Needs.* Mathlib `Monoid.Coprod`; Mathlib `Monoid.Coprod.lift`; Mathlib `FreeGroup.lift`; Mathlib `FreeGroup`.

*Suggested home.* `TauCeti/GroupTheory/AlgebraicGeometry`, namespace `GroupAlgGeom`.

### FG5.2 Algebraic sets, radicals and coordinate groups

**Definition (`GroupAlgGeom.V`).** Let H be a G-group and S ⊆ G[X]. The algebraic set V_H(S) ⊆ (X → H) is {v | ∀ s ∈ S, s(v) = 1}. For Y ⊆ (X → H), the ideal I_H(Y) = {w ∈ G[X] | ∀ v ∈ Y, w(v) = 1} is a normal subgroup. The radical of S over H is Rad_H(S) := I_H(V_H(S)), and the coordinate group of an algebraic set Y is Γ(Y) := G[X] ⧸ I_H(Y); for Y = V_H(S) this is G_{R(S)} := G[X] ⧸ Rad_H(S). The group of the system is G_S := G[X] ⧸ ncl(S). When H = G one writes V(S), Rad(S).

*Construction.*
1. Define V, I as sets and normal subgroups; Rad and Γ by composition and quotient.

*API.*
- `GroupAlgGeom.V` (data): V_H(S) as a Set (X → H).
- `GroupAlgGeom.I` (data): I_H(Y) as a normal subgroup of G[X].
- `GroupAlgGeom.Rad` (data): Rad_H(S) = I_H(V_H(S)).
- `GroupAlgGeom.coordGroup` (constructor): G_{R(S)} = G[X] ⧸ Rad_H(S), a G-group.
- `GroupAlgGeom.systemGroup` (constructor): G_S = G[X] ⧸ ncl(S), with the surjection G_S →* G_{R(S)}.
- `GroupAlgGeom.V_antitone` (relation): S ⊆ T → V T ⊆ V S; Y ⊆ Z → I Z ≤ I Y.
- `GroupAlgGeom.V_ncl` (simp): V_H(ncl S) = V_H(S); hence ncl S ≤ Rad_H(S).
- `GroupAlgGeom.V_I_V` (characterisation): V (I (V S)) = V S.

**Checks.**
- `GroupAlgGeom.rad_sq` (computation): Over G = FreeGroup (Fin 2) and X = Unit, Rad({x²}) = ncl({x}) while ncl({x²}) ≠ ncl({x}): the radical is not the normal closure.
- `GroupAlgGeom.V_empty` (degenerate): V(∅) = everything and Rad(∅) = I(X → G), which is ⊥ when G is a nonabelian free group and X finite (G[X] is G-separated by G).
- `GroupAlgGeom.V_centralizer` (computation): V({x a x⁻¹ a⁻¹}) = {v | v ∈ zpowers a} over F(a,b) (FG1/centralizer-cyclic).
- `GroupAlgGeom.rad_abelian` (non-example): Over G = ℤ (abelian), Rad({x²}) = ncl(x) as well, but over G = ℤ/2, V({x²}) is everything and Rad({x²}) = I(G): the radical depends on H, so Rad must carry the group H in which points are taken.

*Examples.* Over G = F(a,b), X = {x}: V({x²}) = {1} and Rad({x²}) = ncl(x) ≠ ncl(x²), so G_S ≠ G_{R(S)}. V({x a x⁻¹ a⁻¹}) = ⟨a⟩ (the centralizer of a).

*Used by.* FG5 Zariski topology and irreducibility: closed sets and their ideals; FG6 radicals of quadratic equations: explicit radicals R(S) of standard quadratic equations; FG8 and FG11: coordinate groups of NTQ systems and lifts into G_{R(S)}.

*Source.* [ALG] §1, p. 5 (roots, V_H(S)); §3.1–3.4, pp. 26–36 (I_H(Y), Lemmas 8–9, the coordinate group Γ(Y) ≅ G[X]/I_H(Y), Corollary 8): Algebraic sets as sets of roots, the annihilating ideal of a set of points, and the coordinate group as the quotient by it.; [IFT] §2.4, pp. 5–6: Systems S = 1 over G, V_G(S), the radical R(S) and the coordinate group G_{R(S)} = G[X]/R(S).

*Needs.* FG5.1 (G-groups and the free G-group G[X]); Mathlib `Subgroup.normalClosure`.

*Suggested home.* `TauCeti/GroupTheory/AlgebraicGeometry`, namespace `GroupAlgGeom`.

### FG5.3 G-separation and G-discrimination (residual and full residual properties)

**Definition (`GroupAlgGeom.IsSeparatedBy`).** Let K, H be G-groups. K is G-separated by H when for every k ≠ 1 in K there is a G-homomorphism φ : K → H with φ k ≠ 1; K is G-discriminated by H when for every finite set k₁, …, k_n of nontrivial elements of K there is a G-homomorphism φ : K → H with φ k_i ≠ 1 for all i. For G = 1 these are ‘K is residually H’ and ‘K is fully residually H’. Discrimination implies separation; the converse fails.

*Construction.*
1. Two predicates quantified over G-homomorphisms.

*API.*
- `GroupAlgGeom.IsSeparatedBy` (data): K is G-separated by H.
- `GroupAlgGeom.IsDiscriminatedBy` (data): K is G-discriminated by H.
- `GroupAlgGeom.IsDiscriminatedBy.isSeparatedBy` (relation): Discrimination implies separation.
- `GroupAlgGeom.IsDiscriminatedBy.subgroup` (functoriality): Passing to G-subgroups preserves both properties.
- `GroupAlgGeom.isSeparatedBy_iff_iInf_ker` (characterisation): K is separated by H iff the intersection of the kernels of G-homomorphisms K → H is trivial.

**Checks.**
- `GroupAlgGeom.prod_separated_not_discriminated` (non-example): FreeGroup (Fin 2) × FreeGroup (Fin 2) is separated by FreeGroup (Fin 2) through the two projections, but not discriminated: no homomorphism to a free group keeps both (1, b) and (⁅a, b⁆, 1) nontrivial, since the image of (1, b) would commute with the images of (a, 1) and (b, 1), forcing them to commute with each other.
- `GroupAlgGeom.self_discriminated` (degenerate): Every G-group H is H-discriminated by itself through the identity.
- `GroupAlgGeom.Z2_not_separated_by_Z` (non-example): ℤ/2 is not separated by ℤ (G = 1): no nontrivial homomorphism ℤ/2 → ℤ.
- `GroupAlgGeom.free_discriminated_compat` (compatibility): For G = 1 and H free, IsDiscriminatedBy K H is FG8's IsFullyResiduallyFree K when H has rank at least 2.

*Examples.* F × F (with G = 1, H = F free nonabelian) is separated but not discriminated by F. Every G-subgroup of a G-group discriminated by H is discriminated by H.

*Used by.* FG5 irreducibility criterion: irreducible algebraic sets have G-discriminated coordinate groups; FG8 fully residually free groups: the coefficient-free case G = 1; FG11 generic families: discriminating families of solutions.

*Source.* [ALG] §1, pp. 6–7 (definitions of G-separation and G-discrimination, Theorem C1): A G-group is G-separated by H when nontrivial elements survive in some G-homomorphism to H, and G-discriminated when finitely many do simultaneously; these are the residual and fully residual properties.; [IFT] §2.5, p. 6: Discrimination and separation of G-groups by G, and the big powers condition.

*Needs.* FG5.1 (G-groups and the free G-group G[X]).

*Suggested home.* `TauCeti/GroupTheory/AlgebraicGeometry`, namespace `GroupAlgGeom`.

### FG5.4 Zero divisors and G-domains

**Definition (`GroupAlgGeom.IsZeroDivisor`).** In a G-group H, a nontrivial x is a G-zero divisor when there is a nontrivial y ∈ H with [x, g y g⁻¹] = 1 for every g ∈ G (the image of G in H). H is a G-domain when it has no G-zero divisors; for G = H one says H is a domain.

*Construction.*
1. A predicate on G-groups.

*API.*
- `GroupAlgGeom.IsZeroDivisor` (data): x is a G-zero divisor in H.
- `GroupAlgGeom.IsGDomain` (data): No G-zero divisors.
- `GroupAlgGeom.IsGDomain.mono` (relation): If H is a G-domain then H is a domain (larger conjugating set).
- `GroupAlgGeom.IsGDomain.of_CSA` (constructor): A CSA G-group with non-abelian G is a G-domain (ALG Proposition 1).

**Checks.**
- `GroupAlgGeom.free_isDomain` (computation): FreeGroup (Fin 2) is a domain.
- `GroupAlgGeom.abelian_not_domain` (non-example): A nontrivial abelian group is not a domain (x = y works), so ℤ is not a domain although ℤ is torsion-free: being a domain is not torsion-freeness.
- `GroupAlgGeom.trivial_domain` (degenerate): The trivial group is a domain (no nontrivial elements).
- `GroupAlgGeom.prod_not_domain` (non-example): F × F is not a domain: (a,1) commutes with every conjugate of (1,b).

*Examples.* A nonabelian free group is a domain (FG5/domain-examples). ℤ² is not a domain: any two nontrivial elements commute.

*Used by.* FG5 Zariski topology: for a G-domain, finite unions of algebraic sets are algebraic; FG5 irreducibility criterion: hypothesis of ALG Theorem 5; FG8 limit groups: nonabelian fully residually free groups are domains (CSA).

*Source.* [ALG] §2.1, Definition 1, p. 14: G-zero divisors and G-domains.

*Needs.* FG5.1 (G-groups and the free G-group G[X]).

*Suggested home.* `TauCeti/GroupTheory/AlgebraicGeometry`, namespace `GroupAlgGeom`.

### FG5.5 CSA groups with nonabelian coefficients are domains; free groups are domains

**Theorem.** If G is nonabelian and H is a CSA G-group, then H is a G-domain; in particular every nonabelian free group F is a domain and an F-domain, and so is every CSA group containing F.

*Proof sketch.*
1. Let x, y ≠ 1 with [x, g y g⁻¹] = 1 for all g ∈ G and a, b ∈ G with [a, b] ≠ 1; y and a y a⁻¹ both lie in the centralizer M of x, the maximal abelian subgroup containing x, so a M a⁻¹ ∩ M ≠ 1 and malnormality gives a ∈ M; likewise b ∈ M, so [a, b] = 1 (ALG Proposition 1).

*Examples.* F(a,b) is a domain; F(a,b) × ℤ is not (it is not CSA).

*Source.* [ALG] §2.1, Proposition 1 and Corollary 1, p. 16: A CSA G-group with non-abelian G is a G-domain.

*Needs.* FG5.4 (Zero divisors and G-domains); FG1.19 (Maximal cyclic subgroups are malnormal; free groups are CSA); FG1.18 (Malnormal subgroups, CSA groups and commutation transitivity).

### FG5.6 The Zariski topology on H^X

**Construction (`GroupAlgGeom.zariski`).** For a G-group H and a type X, the Zariski topology on X → H is the topology whose closed sets are the intersections of families of finite unions of algebraic sets V_H(S), S ⊆ G[X] (equivalently TopologicalSpace.generateFrom of the complements of algebraic sets). Points v with every coordinate in the image of G are closed, since {v} = V({x ι(g_x)⁻¹ | x ∈ X}); hence the topology is T1 when ι : G → H is onto (in particular for H = G), but not for every G-group (ALG Theorem 3 claims T1 in general; see the source issue FreeGroupsAndLimitGroups/E2). If H is a G-domain, a finite union of algebraic sets is algebraic, so the closed sets are exactly the algebraic sets and the closure of Y is V(I(Y)).

*Construction.*
1. Define by generateFrom; closedness of points with coordinates ι(g_x) from V({x ι(g_x)⁻¹}).

*API.*
- `GroupAlgGeom.zariski` (instance): The Zariski TopologicalSpace on X → H (as a type synonym).
- `GroupAlgGeom.isClosed_V` (characterisation): Algebraic sets are closed.
- `GroupAlgGeom.isClosed_iff_algebraic` (characterisation): For a G-domain H, closed iff algebraic.
- `GroupAlgGeom.closure_eq_V_I` (characterisation): For a G-domain H, closure Y = V (I Y).
- `GroupAlgGeom.zariski_t1` (instance): The Zariski topology is T1 when ι : G → H is surjective (in particular for H = G); points with coordinates in ι(G) are always closed.
- `GroupAlgGeom.eval_continuous` (functoriality): Word maps (X → H) → (Y → H) given by tuples of elements of G[X] are continuous (ALG Lemma 11).

**Checks.**
- `GroupAlgGeom.union_cyclic_closed` (computation): For H = G = FreeGroup (Fin 2), X = Unit: zpowers a ∪ zpowers b is algebraic, cut out by the words [[x,a], g [x,b] g⁻¹] for g ∈ G.
- `GroupAlgGeom.zariski_finite_discrete` (degenerate): For a finite group H = G (with ι the identity) every subset of X → H (X finite) is closed, because points are closed and there are finitely many.
- `GroupAlgGeom.zariski_not_algebraic_abelian` (non-example): For H = G = Multiplicative ℤ (not a domain) and X = Unit, the set {0, 1} is closed (a union of two points) but not algebraic: every algebraic subset of ℤ is ∅, a point or ℤ (the solutions of one linear equation n x = m), so the domain hypothesis is necessary.
- `GroupAlgGeom.zariski_t1_points` (characterisation): For H = G, singletons are closed: {v} = V({x (v x)⁻¹ | x ∈ X}); for G = 1 and H = FreeGroup (Fin 2) the closure of {of 0} is all of H, so T1 needs coefficients for every point (FreeGroupsAndLimitGroups/E2).

*Examples.* Over F(a,b) with X = {x}, the set ⟨a⟩ ∪ ⟨b⟩ is closed and algebraic. Over ℤ² (not a domain) the topology is still defined but closed sets need not be algebraic.

*Used by.* FG5 irreducible components: irreducibility in this topology; FG8 limit groups: irreducible coordinate groups; FG10 effective irreducible components: components are closed sets of this topology.

*Source.* [ALG] §3.2, Theorem 3, p. 32, and Lemma 10, p. 34: The Zariski topology on H^n with closed sets the intersections of finite unions of algebraic sets; T1; for a G-domain the closed sets are the algebraic sets and the closure of Y is V(I(Y)).

*Needs.* FG5.2 (Algebraic sets, radicals and coordinate groups); FG5.4 (Zero divisors and G-domains); Mathlib `TopologicalSpace.generateFrom`.

*Suggested home.* `TauCeti/GroupTheory/AlgebraicGeometry`, namespace `GroupAlgGeom`.

### FG5.7 Equationally Noetherian groups

**Definition (`GroupAlgGeom.IsEquationallyNoetherian`).** A G-group H is G-equationally Noetherian when for every finite type X (equivalently every n) and every S ⊆ G[X] there is a finite S₀ ⊆ S with V_H(S₀) = V_H(S). For G = H one says H is equationally Noetherian.

*Construction.*
1. A predicate quantifying over finite variable types and subsets of G[X].

*API.*
- `GroupAlgGeom.IsEquationallyNoetherian` (data): Every system has a finite subsystem with the same solutions in H.
- `GroupAlgGeom.IsEquationallyNoetherian.exists_finite` (projection): For S ⊆ G[X], a finite S₀ ⊆ S with V S₀ = V S (existence only, not an algorithm).
- `GroupAlgGeom.IsEquationallyNoetherian.subgroup` (functoriality): G-subgroups of G-equationally Noetherian groups are G-equationally Noetherian.
- `GroupAlgGeom.IsEquationallyNoetherian.rad_finite` (characterisation): Rad_H(S) = Rad_H(S₀) for the finite subsystem.

**Checks.**
- `GroupAlgGeom.abelian_eqNoetherian` (computation): ℤ is equationally Noetherian: every system in one variable over ℤ is equivalent to one equation n x = m.
- `GroupAlgGeom.finite_eqNoetherian` (degenerate): Every finite group is equationally Noetherian.
- `GroupAlgGeom.eqNoetherian_not_effective` (non-example): The predicate gives no procedure for S₀; the finite subsystem is a classical existence statement (FG10 computes components instead).
- `GroupAlgGeom.restrictedProduct_not_eqNoetherian` (non-example): The restricted direct product of countably many copies of FreeGroup (Fin 2), as a group over itself, is not equationally Noetherian: the system {[x, a_n] : n ∈ ℕ}, with a_n the letter a in the n-th factor, is equivalent to none of its finite subsystems (ALG Proposition 4(1)); so the property is not automatic.

*Examples.* Abelian groups are equationally Noetherian (ALG Theorem 1). Equivalently the Zariski topology on H^n is Noetherian for all n (FG5/noetherian-components).

*Used by.* FG5 Noetherian topology and irreducible components: hypothesis of ALG Theorem D1 and Corollary 11; FG8 limit groups: finite presentability of coordinate groups uses equational Noetherianity of F; FG11: finite subsystems in the compatibility arguments.

*Source.* [ALG] §1, p. 5 (definition), §2.2 (Theorem B1, Theorem 1 and Proposition 4), pp. 19–23: H is G-equationally Noetherian when every system over G is equivalent over H to a finite subsystem; linear groups over commutative Noetherian rings and abelian groups are examples, infinite restricted products of non-abelian groups are not.

*Needs.* FG5.2 (Algebraic sets, radicals and coordinate groups).

*Suggested home.* `TauCeti/GroupTheory/AlgebraicGeometry`, namespace `GroupAlgGeom`.

### FG5.8 Free groups of finite rank are linear over ℤ

**Theorem.** The matrices [[1, 2], [0, 1]] and [[1, 0], [2, 1]] generate a free subgroup of rank 2 of SL(2, ℤ), so FreeGroup (Fin 2) embeds in Matrix.SpecialLinearGroup (Fin 2) ℤ; and FreeGroup (Fin n) embeds in FreeGroup (Fin 2) (sending the i-th generator to b^i a b^{−i}), hence in SL(2, ℤ), for every n.

*Proof sketch.*
1. Ping-pong on ℤ² (or ℚ²) with the sets {|x| > |y|} and {|x| < |y|}: Mathlib's Monoid.CoprodI.lift_injective_of_ping_pong.
2. The elements b^i a b^{−i} (0 ≤ i < n) form a free basis of the subgroup they generate (FG2/nielsen-basis on their Stallings graph).

*Examples.* The image of ⁅a, b⁆ has trace tr(A)² + tr(B)² + tr(AB)² − tr(A) tr(B) tr(AB) − 2 = 4 + 4 + 36 − 24 − 2 = 18 ≠ 2, so it is not the identity.

*Source.* [ALG] §2.2, p. 20 and the introduction, p. 5: Free groups are linear; the equational Noetherianity of free groups (Guba) is a special case of Theorem B1.; [LEAN] Mathlib/GroupTheory/CoprodI.lean (lift_injective_of_ping_pong): The ping-pong lemma for free products.

*Needs.* Mathlib `Monoid.CoprodI.lift_injective_of_ping_pong`; Mathlib `Matrix.SpecialLinearGroup`; Mathlib `FreeGroup`.

### FG5.9 Linear groups are equationally Noetherian; so are free groups of finite rank

**Theorem.** If H embeds in GL(n, R) for a commutative Noetherian ring R, then H is equationally Noetherian (with coefficients in H, hence G-equationally Noetherian for every G ≤ H). In particular every free group of finite rank, and every finitely generated free group as an F-group, is equationally Noetherian.

*Proof sketch.*
1. A system S over H in variables X becomes a system of polynomial equations over R in the matrix entries of the variables together with det · det⁻¹ = 1; by the Hilbert basis theorem the ideal it generates is finitely generated, and finitely many members of S suffice (ALG Theorem B1, after Bryant and Guba).
2. Apply to SL(2, ℤ) with R = ℤ and FG5/free-group-linear.

*Examples.* FreeGroup (Fin 3) is equationally Noetherian.

*Source.* [ALG] §2.2, Theorem B1, pp. 19–20 (stated in the introduction, p. 5): Linear groups over commutative Noetherian unital rings are equationally Noetherian; free groups (Guba) as a special case.

*Needs.* FG5.7 (Equationally Noetherian groups); FG5.8 (Free groups of finite rank are linear over ℤ); Mathlib `Matrix.SpecialLinearGroup`.

### FG5.10 Noetherian Zariski topology and irreducible components

**Theorem.** Let H be G-equationally Noetherian. (1) For every finite X the Zariski topology on X → H is Noetherian (descending chain condition on closed sets), and conversely Noetherianity for all n implies G-equational Noetherianity. (2) Every closed set Y is a finite union Y = Y₁ ∪ … ∪ Y_m of irreducible closed sets with Y_i ⊄ Y_j for i ≠ j, and this irredundant decomposition is unique up to order (the Y_i are the maximal irreducible closed subsets). (3) The coordinate group Γ(Y) embeds canonically in Γ(Y₁) × … × Γ(Y_m).

*Hypotheses.* H G-equationally Noetherian (no domain hypothesis is needed for (1)–(3)).

*Proof sketch.*
1. (1) ALG Proposition 10 and Theorem D1: chains of algebraic sets stabilise.
2. (2) Mathlib's NoetherianSpace gives finitely many irreducible components (ALG Corollary 11).
3. (3) ALG Proposition 12: I(Y) = ⋂ I(Y_i).

*Examples.* Over F(a,b), V({[[x,a],[x,b]^g] : g}) = ⟨a⟩ ∪ ⟨b⟩ has the two components ⟨a⟩ and ⟨b⟩, and Γ embeds in Γ(⟨a⟩) × Γ(⟨b⟩).

*Source.* [ALG] §3.6, Proposition 10, p. 37; Theorem D1 (introduction p. 9, proof §3.6, p. 38); Corollaries 10–11 and Proposition 12, p. 39: Equational Noetherianity is the descending chain condition on algebraic sets; closed sets are finite unions of uniquely determined irreducible components; the coordinate group embeds in the product of those of the components.

*Needs.* FG5.6 (The Zariski topology on H^X); FG5.7 (Equationally Noetherian groups); Mathlib `TopologicalSpace.NoetherianSpace`; Mathlib `IsIrreducible`.

### FG5.11 Irreducibility is discrimination of the coordinate group

**Theorem.** Let H be a G-equationally Noetherian G-domain and Y ⊆ (X → H) closed. Then Y is irreducible if and only if Γ(Y) is G-discriminated by H. Every coordinate group Γ(Y) is G-separated by H, and for any S, Rad_H(S) = ncl(S) if and only if G_S is G-separated by H. In particular, for a reducible Y, Γ(Y) is G-separated but not G-discriminated by H: a radical quotient need not be fully residually H.

*Hypotheses.* H a G-equationally Noetherian G-domain (for the irreducibility criterion).

*Proof sketch.*
1. Separation: I(Y) is the intersection of the kernels of the evaluations at points of Y (ALG Corollary 8); the same argument gives the criterion for Rad = ncl.
2. Irreducible ⇒ discriminated: for finitely many nontrivial elements, each is nonzero on a proper closed subset's complement, and irreducibility makes the intersection of the nonempty open sets nonempty (ALG Lemma 15).
3. Discriminated ⇒ irreducible: if Y = Y₁ ∪ Y₂ properly, pick w_i ∈ I(Y_i) ∖ I(Y); a G-homomorphism nonzero on both w₁, w₂ is a point of Y outside Y₁ ∪ Y₂ (ALG Theorem 5).

*Examples.* Γ(⟨a⟩ ∪ ⟨b⟩) over F(a,b) is F-separated but not F-discriminated by F. Γ(V([x, a])) = F ∗_{⟨a⟩} ⟨a, t | [a,t]⟩ is F-discriminated by F (an extension of a centralizer).

*Source.* [ALG] §3.4, Corollary 8, p. 36; §4, Lemma 15 and Theorem 5, p. 40; Theorem C1, introduction p. 7: Coordinate groups are G-separated by H; for a G-equationally Noetherian G-domain a closed set is irreducible iff its coordinate group is G-discriminated by H; discrimination is separation plus being a domain.; [VAR-I] §1, Lemmas 2–4, p. 5: Over a torsion-free group, separation of G_S by G gives R(S) = ncl(S) (Lemma 3; the converse is immediate because coordinate groups are separated); over an equationally Noetherian CSA group, V(S) is irreducible iff G_{R(S)} is discriminated by G (Lemma 4).

*Needs.* FG5.10 (Noetherian Zariski topology and irreducible components); FG5.3 (G-separation and G-discrimination (residual and full residual properties)); FG5.4 (Zero divisors and G-domains); FG5.2 (Algebraic sets, radicals and coordinate groups).

### FG5.12 Points as homomorphisms; word maps and changes of coordinates

**Theorem.** Let H be a G-group. (1) For an algebraic set Y ⊆ (X → H), evaluation gives a bijection Hom_G(Γ(Y), H) ≃ Y. (2) Word maps (morphisms of algebraic sets given by tuples of elements of G[X]) correspond contravariantly to G-homomorphisms of coordinate groups, giving an equivalence (anti-equivalence) between algebraic sets over H with word maps and their coordinate groups with G-homomorphisms. (3) A G-automorphism σ of G[X] (a change of coordinates) maps V_H(S) bijectively onto V_H(σ⁻¹(S)) and induces G_{R(S)} ≅ G_{R(σ⁻¹ S)}.

*Proof sketch.*
1. (1) A G-homomorphism Γ(Y) → H is determined by the images of X, which form a point of V(I(Y)) = Y.
2. (2) ALG Theorem 4 and Corollary 9.
3. (3) Specialisation of (2) to invertible word maps.

*Examples.* For Y = V([x, a]) over F(a,b), Hom_F(Γ(Y), F) ≃ ⟨a⟩. The change of coordinates x ↦ x a sends V([x, a]) to itself.

*Source.* [ALG] §3.5, Lemma 13, Proposition 9, Lemma 14, Corollary 8, Theorem 4 and Corollary 9, pp. 35–37: Polynomial (word) maps between algebraic sets, coordinate groups as groups of polynomial functions, and the equivalence of the category of algebraic sets with that of coordinate groups.; [IFT] §2.4, pp. 5–6: Points of V(S) correspond to G-homomorphisms G_{R(S)} → G.

*Needs.* FG5.2 (Algebraic sets, radicals and coordinate groups); FG5.1 (G-groups and the free G-group G[X]); FG5.3 (G-separation and G-discrimination (residual and full residual properties)).

### Dependencies

Within this roadmap: FG1, FG3. Libraries: Mathlib only (see the supplier contracts). Other roadmaps: none.

## Layer FG6: Surface groups and quadratic equations

Surface groups are given by presentations with their peripheral elements and connected to graphs of groups; quadratic equations, their standard forms, regularity and radicals follow Kharlampovich–Myasnikov, with the low-genus exceptions kept. Quadratically hanging vertices are defined here; rigidity is relative to a splitting family and belongs to FG10.

*Targets of the layer.* Orientable and non-orientable surface groups of genus g with m boundary components given by their standard presentations, with boundary (peripheral) elements and Euler characteristic χ = 2 − 2g − m or 2 − g − m; surface groups with boundary are free of rank 1 − χ and closed surface groups are not free; cutting along a two-sided simple closed curve as a one-edge graph of groups; finite-index subgroups are surface groups of Euler characteristic multiplied by the index; quadratic and strictly quadratic words and equations over G, the standard forms and the effective reduction of a quadratic equation to standard form by a G-automorphism of G[X]; consistency, non-commutative solutions, the invariant κ(S) and regular standard quadratic equations; the radicals of standard quadratic equations over freely discriminated groups, with the low-genus exceptions; the coordinate group of a regular quadratic equation as a graph of groups with a surface vertex; quadratically hanging (QH) vertex groups with their peripheral data.

### FG6.1 Surface groups with boundary and their peripheral structure

**Definition (`SurfaceGroup.orientable`).** For g, m ∈ ℕ: the orientable surface group S⁺(g, m) is PresentedGroup on generators a₁, b₁, …, a_g, b_g, p₁, …, p_m with the single relator [a₁,b₁] ⋯ [a_g,b_g] p₁ ⋯ p_m (commutator convention [x, y] = x⁻¹ y⁻¹ x y), and the non-orientable surface group S⁻(g, m), g ≥ 1, has generators c₁, …, c_g, p₁, …, p_m and relator c₁² ⋯ c_g² p₁ ⋯ p_m. The peripheral (boundary) elements are p₁, …, p_m, and the boundary subgroups are their cyclic subgroups and conjugates. The Euler characteristic is χ = 2 − 2g − m (orientable) or χ = 2 − g − m (non-orientable). Closed surface groups are the case m = 0.

*Construction.*
1. Instances of Mathlib's PresentedGroup with a one-element relator set; the peripheral tuple as a function Fin m → the group.

*API.*
- `SurfaceGroup.orientable` (constructor): S⁺(g, m) as a PresentedGroup.
- `SurfaceGroup.nonorientable` (constructor): S⁻(g, m) as a PresentedGroup.
- `SurfaceGroup.peripheral` (projection): The boundary elements p_i, and the boundary subgroups zpowers p_i.
- `SurfaceGroup.eulerChar` (data): χ as an integer, 2 − 2g − m or 2 − g − m.
- `SurfaceGroup.lift` (universal-property): Homomorphisms out of S±(g, m) correspond to tuples satisfying the relator (PresentedGroup.toGroup).
- `SurfaceGroup.abelianization` (characterisation): The abelianisation of S⁺(g, 0) is ℤ^{2g}; of S⁻(g, 0) is ℤ^{g−1} × ℤ/2; of S±(g, m), m ≥ 1, free abelian of rank 1 − χ.

**Checks.**
- `SurfaceGroup.torus` (computation): S⁺(1, 0) ≃* Multiplicative (Fin 2 → ℤ).
- `SurfaceGroup.projectivePlane` (computation): S⁻(1, 0) has order 2.
- `SurfaceGroup.disc` (degenerate): S⁺(0, 1) is trivial (the relator is p₁), and S⁺(0, 0) is trivial (the sphere).
- `SurfaceGroup.pants_free` (compatibility): S⁺(0, 3) is free of rank 2 on p₁, p₂ (IsFreeGroup with FreeGroupBasis), agreeing with FG6/bounded-surface-free.
- `SurfaceGroup.klein_not_torus` (non-example): S⁻(2, 0) (Klein bottle) has abelianisation ℤ × ℤ/2 and is not isomorphic to S⁺(1, 0) although both have χ = 0: the orientability type is part of the data.

*Examples.* S⁺(1, 0) ≅ ℤ² (χ = 0); S⁻(1, 0) ≅ ℤ/2 (the projective plane, χ = 1); S⁺(0, 3) is free of rank 2 with p₃ = (p₁ p₂)⁻¹ (pair of pants, χ = −1). S⁺(2, 0) is the genus-two surface group, χ = −2.

*Used by.* FG6 quadratic equations: standard quadratic equations are surface relators with coefficients; FG6 QH vertices: vertex groups of QH type are surface groups with boundary; FG10 JSJ of limit groups: flexible vertices are surface (QH) vertices; FG11 basic automorphisms: automorphisms of S⁺(g, m) fixing boundary elements up to conjugacy.

*Source.* [IFT] §2.7, Definition 3, p. 8: Standard quadratic words of types (1)–(4): products of commutators or squares, followed by conjugates of coefficients; the left sides of surface relators with boundary.; [GL-JSJ] §5.1, Definition 5.1, p. 42, and §5.1.2, pp. 42–43: Fundamental groups of compact surfaces (and 2-orbifolds) with boundary subgroups, and their Euler characteristic; hyperbolic exactly when χ < 0.; [VAR-I] §1, Definition of standard quadratic equations and Lemma 6, pp. 8–9: Standard forms of quadratic equations over G, whose coefficient-free parts are surface relators.

*Needs.* Mathlib `PresentedGroup`; Mathlib `FreeGroup`.

*Suggested home.* `TauCeti/GroupTheory/SurfaceGroup`, namespace `SurfaceGroup`.

### FG6.2 Surface groups with boundary are free; closed ones are not

**Theorem.** (1) For m ≥ 1, S±(g, m) is free of rank 1 − χ, with free basis a₁, b₁, …, a_g, b_g, p₁, …, p_{m−1} (respectively c₁, …, c_g, p₁, …, p_{m−1}); p_m is the inverse of the product of the others in the relator order. (2) For m = 0 and χ ≤ 0, S±(g, 0) is not free: for the orientable case, a free group of rank 2g with this abelianisation would make the defining surjection FreeGroup (Fin 2g) → S⁺(g, 0) an isomorphism (free groups of finite rank are Hopfian), contradicting the nontriviality of the relator; for the non-orientable case the abelianisation has torsion.

*Proof sketch.*
1. (1) Eliminate p_m using the relator (a Tietze move), leaving no relator.
2. (2) Free groups of finite rank are Hopfian: they are residually finite (embed in SL(2, ℤ) by FG5/free-group-linear and reduce modulo large integers; at the pin no library declaration states it; the current Tau Ceti library, newer than the pin, has the instance FreeGroup.instResiduallyFinite in TauCeti/GroupTheory/FreeGroup/ResiduallyP.lean) and finitely generated residually finite groups are Hopfian (Malcev's argument with the finitely many homomorphisms to each finite group); the relator is nontrivial by FG1/word-problem-correct.

*Examples.* S⁺(0, 3) ≅ F₂ and S⁺(1, 1) ≅ F₂ (both χ = −1). S⁺(1, 0) ≅ ℤ² is not free.

*Source.* [GL-JSJ] §5.1, p. 42: Compact surfaces with nonempty boundary have free fundamental group; closed hyperbolic surface groups are one-ended relative to their boundary subgroups (Proposition 5.4 and the remark after Corollary 5.6).; [IFT] §2.7, Definition 3, p. 8: The surface relators of standard quadratic equations.

*Needs.* FG6.1 (Surface groups with boundary and their peripheral structure); FG2.8 (Explicit free bases and embeddings from a Stallings graph); FG5.8 (Free groups of finite rank are linear over ℤ); Mathlib `Group.ResiduallyFinite`; Mathlib `IsFreeGroup`.

### FG6.3 Cutting and gluing: surface groups as graphs of groups

**Theorem.** (1) Gluing: for g = g₁ + g₂, S⁺(g, m₁ + m₂) is the amalgam S⁺(g₁, m₁ + 1) ∗_{ℤ} S⁺(g₂, m₂ + 1) along the last boundary elements (with inverse orientation), and S⁺(g, m) is the HNN extension of S⁺(g − 1, m + 2) identifying two boundary elements (a non-separating curve); the analogous statements hold for non-orientable surfaces with the standard curves. (2) Each of these is the fundamental group of a one-edge graph of groups (FG4/one-edge-compatibility) whose vertex groups are surface groups with boundary and whose edge group is the boundary subgroup of the cut curve; the peripheral structure of the result is the union of the remaining boundary subgroups. (3) Iterating, every S±(g, m) with χ < 0 is π₁ of a graph of groups whose vertex groups are pairs of pants S⁺(0, 3) (and, for non-orientable surfaces, S⁻(1, 2)) and whose edge groups are infinite cyclic boundary subgroups. (4) Closed surface groups with χ ≤ 0 are torsion-free: each is π₁ of a one-edge graph of groups with free vertex groups (cut along a non-separating two-sided curve), and a finite subgroup of π₁ of a graph of groups fixes a vertex of the Bass–Serre tree, hence is conjugate into a vertex group.

*Hypotheses.* Genus and boundary counts as indicated; χ < 0 for (3).

*Proof sketch.*
1. Write the relator as a product of the relators of the pieces and apply Tietze transformations; compare universal properties with FG4/one-edge-compatibility.

*Examples.* S⁺(2, 0) = S⁺(1, 1) ∗_{ℤ} S⁺(1, 1) along [a₁, b₁] = [b₂, a₂] (separating curve). S⁺(2, 0) is also an HNN extension of S⁺(1, 2) ≅ F₃ (non-separating curve).

*Source.* [GL-JSJ] §5.1.2, pp. 42–43: Any essential two-sided simple closed curve (geodesic) on a surface defines a cyclic splitting of its fundamental group relative to the boundary subgroups, and families of disjoint curves give dual graphs of groups.; [TREES] Chapter I, §4.1 and §5.1: Amalgams and HNN extensions as fundamental groups of segments and loops of groups.

*Needs.* FG6.1 (Surface groups with boundary and their peripheral structure); FG6.2 (Surface groups with boundary are free; closed ones are not); FG4.5 (One-edge graphs of groups are Mathlib's amalgams and HNN extensions); FG4.2 (The fundamental group of a graph of groups, via paths and via a maximal tree); FG4.9 (Elliptic–hyperbolic dichotomy and fixed points of finitely generated groups); FG4.7 (The Bass–Serre tree of a graph of groups).

### FG6.4 Finite-index subgroups of surface groups and the Euler characteristic

**Theorem.** Let Σ = S±(g, m) and H ≤ Σ of finite index n. Then H, with the induced peripheral structure (the subgroups H ∩ x⟨p_j⟩x⁻¹, one H-conjugacy class for each double coset H x ⟨p_j⟩), is isomorphic to a surface group S±(g′, m′) with its peripheral structure, where χ′ = n · χ, m′ is the number of such double cosets, and the orientability type is orientable when Σ is orientable. For m ≥ 1 this refines the Schreier formula: rank H − 1 = n (rank Σ − 1).

*Hypotheses.* [Σ : H] = n finite.

*Proof sketch.*
1. Build the finite cover of the presentation 2-complex of Σ (one vertex, the generators as edges, one polygon) corresponding to H; each edge lies on exactly two polygon sides and vertex links are circles or arcs, so the cover is a combinatorial surface with n polygons.
2. Bring its polygon gluing to one polygon with a standard boundary word by the moves of FG6/quadratic-standard-form (cut-and-paste moves are changes of generators); this gives the standard presentation of H and the boundary count.
3. χ is the alternating count of cells, multiplied by n under the cover; for m ≥ 1 compare with FG2/finite-index-schreier.

*Examples.* The index-2 subgroup of S⁺(2, 0) (kernel of a map to ℤ/2) is S⁺(3, 0): χ = −4 = 2 · (−2). The orientable double cover of S⁻(3, 0) (χ = −1) is S⁺(2, 0) (χ = −2).

*Source.* [GL-JSJ] §5.1, Definition 5.1, p. 42: The Euler characteristic of a compact surface (or orbifold) and its role in hyperbolicity; finite-index subgroups correspond to finite covers.; [KM02] §8, Proposition 8.3 and Corollary 8.4, pp. 20–21: Finite-index subgroups of a free group (the case m ≥ 1, where Σ is free) correspond to finite X-regular subgroup graphs, the index is the number of vertices, and Schreier's formula holds.

*Needs.* FG6.1 (Surface groups with boundary and their peripheral structure); FG6.3 (Cutting and gluing: surface groups as graphs of groups); FG6.6 (Effective reduction of quadratic words to standard form); FG2.12 (Finite index, the index algorithm and the Schreier formula); FG2.7 (Stallings correspondence: subgroups and based folded core graphs).

### FG6.5 Quadratic words, standard quadratic equations and their solutions

**Definition (`GroupAlgGeom.Quadratic.IsQuadratic`).** Let G be a group and S ⊆ G[X]. S is quadratic when every variable occurring in S occurs at most twice (as x or x⁻¹) in the reduced forms of the elements of S, and strictly quadratic when exactly twice. A standard quadratic equation over G is one of: (1) ∏_{i=1}^{n} [x_i, y_i] = 1, n > 0; (2) ∏_{i=1}^{n} [x_i, y_i] ∏_{j=1}^{m} z_j⁻¹ c_j z_j d = 1, n, m ≥ 0, n + m ≥ 1; (3) ∏_{i=1}^{n} x_i² = 1, n > 0; (4) ∏_{i=1}^{n} x_i² ∏_{j=1}^{m} z_j⁻¹ c_j z_j d = 1, n, m ≥ 0, n + m ≥ 1, with d, c_j nontrivial elements of G; types (1)–(2) are orientable and (3)–(4) non-orientable of genus n. Atoms are [x, y], x², z⁻¹ c z; the atomic rank r(S) is the number of atoms. A solution φ of a standard equation written r₁ ⋯ r_k d = 1 (k ≥ 2) is degenerate if some r_i^φ = 1, commutative if [r_i^φ, r_{i+1}^φ] = 1 for all i, and in general position if [r_i^φ, r_{i+1}^φ] ≠ 1 for all i. S is consistent when it has a solution in G.

*Construction.*
1. Predicates on elements of G[X] (occurrence counts in the reduced form of Monoid.Coprod words) and an inductive description of the four standard shapes.

*API.*
- `GroupAlgGeom.Quadratic.IsQuadratic` (data): Every variable occurs at most twice.
- `GroupAlgGeom.Quadratic.IsStrictlyQuadratic` (data): Every occurring variable occurs exactly twice.
- `GroupAlgGeom.Quadratic.Standard` (structure): The standard equations of types (1)–(4), with genus n, coefficients c_j, d.
- `GroupAlgGeom.Quadratic.Standard.toWord` (projection): The left side as an element of G[X].
- `GroupAlgGeom.Quadratic.atomicRank` (data): r(S).
- `GroupAlgGeom.Quadratic.eulerChar` (data): χ(S) = 2 − 2n − (m + 1) or 2 − n − (m + 1) when the coefficient d is present (the surface of the equation has m + 1 boundary components, one for each c_j and one for d), and 2 − 2n or 2 − n otherwise.
- `GroupAlgGeom.Quadratic.Solution.IsGeneralPosition` (data): General-position solutions.
- `GroupAlgGeom.Quadratic.surfaceHom` (compatibility): The coefficient-free part of a standard equation is the relator of a surface group: solutions of type (1) are homomorphisms S⁺(n, 0) → G.

**Checks.**
- `GroupAlgGeom.Quadratic.isStandard_x2y2z2` (computation): x² y² z² = 1 is standard of type (3) with genus 3 and atomic rank 3.
- `GroupAlgGeom.Quadratic.not_quadratic_cubic` (non-example): x y x⁻¹ y⁻¹ x = 1 is not quadratic, although it has length 5 and only two variables.
- `GroupAlgGeom.Quadratic.commutator_solution_degenerate` (degenerate): For [x₁,y₁][x₂,y₂] = 1 the solution x_i = y_i = 1 is degenerate and commutative.
- `GroupAlgGeom.Quadratic.genus2_no_general_position` (non-example): In F(a,b), x₁ = a, y₁ = b, x₂ = b, y₂ = a solves [x₁,y₁][x₂,y₂] = 1 but is commutative: r₂ = [b,a] = r₁⁻¹. Indeed every solution of this equation has r₂^φ = (r₁^φ)⁻¹, so it has no solution in general position (IFT Theorem 1 needs n > 2 for type (1)); a definition of general position that ignored the order of the atoms would wrongly accept it.
- `GroupAlgGeom.Quadratic.genus3_general_position` (computation): In F(a,b), x₁ = a, y₁ = b, x₂ = b, y₂ = a², x₃ = a, y₃ = a⁻¹ b a solves [x₁,y₁][x₂,y₂][x₃,y₃] = 1 ([a,b][b,a²] = [a⁻¹ b a, a], and r₃ = [a, a⁻¹ b a] is its inverse) and is in general position: [a,b] and [b,a²] do not commute, nor do [b,a²] and r₃ = ([a,b][b,a²])⁻¹.
- `GroupAlgGeom.Quadratic.not_strict` (non-example): z⁻¹ c z = 1 with c ≠ 1 is strictly quadratic but inconsistent, so standard equations need not be consistent.

*Examples.* x² y² z² = 1 is standard of type (3), genus 3, r(S) = 3. x y x⁻¹ y⁻¹ x = 1 is not quadratic (x occurs three times).

*Used by.* FG6 radicals and regularity: the objects classified; FG7 generalised equations: quadratic sections of generalised equations correspond to quadratic equations; FG8 NTQ systems: quadratic levels; FG11 implicit function theorem: regular standard quadratic equations.

*Source.* [IFT] §2.7, Definitions 2–5, p. 8: Quadratic and strictly quadratic sets, the four types of standard quadratic equations, atoms and atomic rank, degenerate, commutative and general-position solutions.; [VAR-I] §1, pp. 8–9 (standard forms and Lemma 6): Standard quadratic equations over a group and reduction of strictly quadratic words to them.

*Needs.* FG5.1 (G-groups and the free G-group G[X]); FG6.1 (Surface groups with boundary and their peripheral structure).

*Suggested home.* `TauCeti/GroupTheory/AlgebraicGeometry/Quadratic`, namespace `GroupAlgGeom.Quadratic`.

### FG6.6 Effective reduction of quadratic words to standard form

**Theorem.** For every strictly quadratic word W ∈ G[X] there is a G-automorphism f of G[X] (a change of coordinates, FG5/points-and-coordinate-changes) such that f(W) is a standard quadratic word (up to cyclic permutation and conjugation by an element of G); f is a product of elementary Nielsen-type automorphisms and is computed by a terminating procedure toStandardForm on words, primitive recursive when G = F(A) with word coefficients. Consequently V_G(W) is in bijection with V_G(f(W)) and the coordinate groups are G-isomorphic.

*Hypotheses.* W strictly quadratic; for the procedure, G = F(A) with A finite and coefficients given as words.

*Proof sketch.*
1. Classical cut-and-paste normalisation: collect squares, then commutators, then conjugates of coefficients, each step an elementary automorphism (IFT Lemma 1, referring to Comerford–Edmunds; VAR-I Lemma 6).
2. Termination by the number of letters not yet in standard position; computability by FG1/reduce-primrec.

*Examples.* x y x⁻¹ y⁻¹ already standard; x y x y⁻¹ = 1 is sent to a non-orientable standard form x′² y′² = 1 (the Klein bottle relator).

*Source.* [IFT] §2.7, Lemma 1, p. 8: Every strictly quadratic word is sent to a standard quadratic word by a G-automorphism of G[X].; [VAR-I] §1, Lemma 6, p. 8: The same statement with the elementary automorphisms used.

*Needs.* FG6.5 (Quadratic words, standard quadratic equations and their solutions); FG5.12 (Points as homomorphisms; word maps and changes of coordinates); FG1.12 (Primitive elements of a free group).

### FG6.7 Regular standard quadratic equations

**Definition (`GroupAlgGeom.Quadratic.kappa`).** Let S = 1 be a standard quadratic equation over a freely discriminated group G (written r₁ ⋯ r_k d = 1). Put κ(S) = |X| + ε(S), with ε(S) = 1 when the coefficient d occurs and 0 otherwise. S = 1 is regular when it is [x, y] = d with d ≠ 1, or [x₁, y₁][x₂, y₂] = 1, or r(S) ≥ 2, S has a non-commutative solution and S is not of one of the types c₁^{z₁} c₂^{z₂} = c₁ c₂, x² c^z = a² c, x₁² x₂² = a₁² a₂². Equivalently, S is regular when κ(S) ≥ 4 and S has a non-commutative solution in G, or S is [x, y] d = 1 (d ≠ 1), or S is [x₁, y₁][x₂, y₂] = 1; the last clause is needed because that equation has κ = 4 but only commutative solutions (r₂^φ = (r₁^φ)⁻¹), which IFT's equivalent formulation overlooks (source issue FreeGroupsAndLimitGroups/E3).

*Construction.*
1. A predicate combining the shape of S with the existence of a non-commutative solution.

*API.*
- `GroupAlgGeom.Quadratic.kappa` (data): κ(S) = |X| + ε(S).
- `GroupAlgGeom.Quadratic.IsRegular` (data): The regularity predicate.
- `GroupAlgGeom.Quadratic.isRegular_iff` (characterisation): IsRegular S ↔ (κ S ≥ 4 ∧ ∃ non-commutative solution) ∨ S is [x, y] d = 1 with d ≠ 1 ∨ S is [x₁, y₁][x₂, y₂] = 1.
- `GroupAlgGeom.Quadratic.IsRegular.of_genus` (constructor): Consistent orientable equations of positive genus other than [x, y] = 1 are regular (IFT Corollary 1(1)).

**Checks.**
- `GroupAlgGeom.Quadratic.isRegular_genus2` (computation): [x₁,y₁][x₂,y₂] = 1 over F(a,b) is regular, by its explicit clause: all its solutions are commutative, so a definition by ‘κ ≥ 4 and a non-commutative solution’ alone would reject it.
- `GroupAlgGeom.Quadratic.not_isRegular_comm` (non-example): [x, y] = 1 is consistent and orientable of genus 1 but not regular: all its solutions commute.
- `GroupAlgGeom.Quadratic.not_isRegular_lyndon` (non-example): x₁² x₂² x₃² = 1 has κ = 3 and only commutative solutions in a free group (Lyndon), so it is not regular; a definition by genus alone would wrongly accept it.
- `GroupAlgGeom.Quadratic.isRegular_xy_d` (degenerate): [x, y] = d with d ≠ 1 (κ = 3) is regular by the explicit clause.

*Examples.* [x₁,y₁][x₂,y₂] = 1 is regular; [x, y] = 1 is not; x₁² x₂² x₃² = 1 is not (all its solutions commute, Lyndon).

*Used by.* FG11 implicit function theorem for quadratic equations: the hypothesis of IFT Theorem 9; FG8 regular NTQ systems: quadratic levels of regular NTQ systems are regular; FG6 radical theorem: regular equations have R(S) = ncl(S).

*Source.* [IFT] §2.7, Definition 6 and the remark after it, p. 9: Definition of regular standard quadratic equations (over F; used over any G in §7.1, p. 67), the invariant κ(S), and an equivalent formulation that omits the equation [x₁,y₁][x₂,y₂] = 1 (corrected here, source issue E3).; [VAR-I] §1, Theorem 1 and Propositions 1–8, pp. 7–27: Analysis of standard quadratic equations over fully residually free groups by type.

*Needs.* FG6.5 (Quadratic words, standard quadratic equations and their solutions).

*Suggested home.* `TauCeti/GroupTheory/AlgebraicGeometry/Quadratic`, namespace `GroupAlgGeom.Quadratic`.

### FG6.8 Radicals of consistent standard quadratic equations

**Theorem.** Let G be freely discriminated (fully residually free, nonabelian or not) and S = 1 a standard quadratic equation over G with a solution in G. Then: (1) for S = [x, y] d or [x₁, y₁][x₂, y₂], R(S) = ncl(S); (2) for S = x² d, R(S) = ncl(x b) where b² = d; (3) for S = c^z d, R(S) = ncl([z b⁻¹, c]) where d⁻¹ = c^b; (4) for S = x₁² x₂², R(S) = ncl([x₁, x₂]); (5) for S = x₁² x₂² x₃², R(S) = ncl([x₁,x₂], [x₁,x₃], [x₂,x₃]); (6) if r(S) ≥ 2 and S has a non-commutative solution, R(S) = ncl(S); (7) if S is of type (4) and all its solutions are commutative, R(S) is the normal closure of the explicit system of commutation relations of IFT Theorem 2(7), and G_{R(S)} is an extension of a centralizer. In addition (general position) the equation has a solution in general position in the cases listed in IFT Theorem 1 (type (1) with n > 2, type (2) with n > 0 and n + m > 1, type (3) with n > 3, type (4) with n > 2, and r(S) ≥ 2 with a non-commutative solution).

*Hypotheses.* G freely discriminated; S consistent over G (has a solution in G).

*Proof sketch.*
1. VAR-I §§2–3 treat the standard types one by one (Propositions 3–8), using discrimination by big powers and Lemma 9.
2. The general-position statement is VAR-I Theorem 1 as recalled in IFT Theorem 1.

*Examples.* Over F(a,b), R(x² a²) = ncl(x a) (b = a). Over F(a,b), R(x₁² x₂² x₃²) contains [x₁, x₂] although [x₁, x₂] ∉ ncl(x₁² x₂² x₃²): the low-genus exceptions are real.

*Source.* [IFT] §2.7, Theorems 1–2, pp. 8–9: General-position solutions in the listed cases, and the explicit radicals of consistent standard quadratic equations over freely discriminated groups.; [VAR-I] §1, Theorems 1 and 3, pp. 7–9; §§2–3, Propositions 3–8, pp. 14–27: Proofs of the radical descriptions type by type.

*Needs.* FG6.5 (Quadratic words, standard quadratic equations and their solutions); FG6.7 (Regular standard quadratic equations); FG5.2 (Algebraic sets, radicals and coordinate groups); FG5.3 (G-separation and G-discrimination (residual and full residual properties)).

### FG6.9 Coordinate groups of regular quadratic equations as surface amalgams

**Theorem.** Let S = 1 be a regular standard quadratic equation of type (2) or (4) over a freely discriminated group G, with genus n and coefficients c₁, …, c_m, d. Then G_{R(S)} = G_S, and G_S is the fundamental group of the graph of groups with one vertex group G, one vertex group the surface group S±(n, m + 1) (orientable for type (2), non-orientable for type (4)), and m + 1 edges with infinite cyclic edge groups identifying the boundary elements p_j with conjugates of c_j (j ≤ m) and p_{m+1} with d (with the orientation fixed by the relator). For types (1) and (3), G_S = G ∗ S±(n, 0). The surface vertex is a QH vertex (FG6/qh-vertex) whose boundary subgroups are exactly the edge groups.

*Hypotheses.* S regular (so R(S) = ncl(S) by FG6/quadratic-radicals (1), (6)).

*Proof sketch.*
1. G_S = (G ∗ F(X)) / ncl(S); rewriting S as the surface relator with p_j := z_j⁻¹ c_j z_j and p_{m+1} := d gives the amalgam presentation (Tietze moves), and FG4/one-edge-compatibility iterated identifies it with π₁ of the graph of groups.

*Examples.* For S = [x, y] a = 1 over F(a,b): G_S = F(a,b) ∗_{a = p} S⁺(1, 1), an amalgam of F(a,b) with F(x, y) along a ~ p = [x, y]⁻¹.

*Source.* [IFT] §2.7, Theorem 2 and Definition 6, p. 9: Regular standard quadratic equations have R(S) = ncl(S), so their coordinate group is the group of the system.; [GL-JSJ] §5.2, Definition 5.13, p. 47: A surface group attached along boundary subgroups is a QH vertex group of the resulting splitting.

*Needs.* FG6.8 (Radicals of consistent standard quadratic equations); FG6.3 (Cutting and gluing: surface groups as graphs of groups); FG4.5 (One-edge graphs of groups are Mathlib's amalgams and HNN extensions); FG6.1 (Surface groups with boundary and their peripheral structure).

### FG6.10 Quadratically hanging (QH) vertices and their peripheral data

**Definition (`GTree.IsQH`).** Let T be an (𝒜, ℋ)-tree of a group G (FG4/tree-action). A vertex v is quadratically hanging (QH) when its stabilizer Q = G_v is an extension 1 → F → Q → π₁(Σ) → 1 with Σ a compact hyperbolic 2-orbifold (for the torsion-free CSA groups of this roadmap: F = 1 and Σ a compact surface with χ < 0 and π₁(Σ) a surface group S±(g, m)), such that every incident edge stabilizer and every Q ∩ g H g⁻¹ (H ∈ ℋ) is an extended boundary subgroup: its image in π₁(Σ) is finite or contained in a boundary subgroup. The peripheral data of v are the boundary subgroups of Σ, and a boundary component is used when its boundary subgroup contains with finite index the image of an incident edge stabilizer or of a conjugate of some H ∈ ℋ. Being QH is a property of a vertex in a given tree; rigidity and flexibility are defined relative to the splitting family in FG10.

*Construction.*
1. A structure on a vertex of a G-tree recording F, Σ, the surjection and the extended-boundary condition.

*API.*
- `GTree.IsQH` (data): The QH structure on a vertex: fiber, orbifold, projection, extended-boundary condition.
- `GTree.IsQH.boundarySubgroups` (projection): The peripheral (boundary) subgroups of a QH vertex.
- `GTree.IsQH.usedBoundary` (data): Used boundary components.
- `GTree.IsQH.torsionFree` (characterisation): For torsion-free G, the fiber is trivial and Q is a surface group S±(g, m) with χ < 0.
- `GTree.IsQH.dualSplitting` (constructor): A family of disjoint essential simple closed curves on Σ gives a splitting of G refining T at v (GL-JSJ Definition 5.14).

**Checks.**
- `GTree.isQH_surface_vertex` (computation): In F(a,b) ∗_{a ~ [x,y]⁻¹} F(x, y) the vertex F(x, y) = S⁺(1, 1) is QH with one used boundary component.
- `GTree.not_isQH_abelian` (non-example): A vertex with stabilizer ℤ² is not QH: χ(torus) = 0 is not negative, so a definition omitting hyperbolicity would accept it.
- `GTree.not_isQH_unbounded_edge` (non-example): If an incident edge group maps onto a non-peripheral cyclic subgroup of π₁(Σ) (for instance a simple closed curve that is not a boundary), the vertex is not QH for that tree.
- `GTree.isQH_pants_degenerate` (degenerate): A pair-of-pants vertex S⁺(0, 3) with its three boundary subgroups as incident edge groups is QH (χ = −1) but admits no essential simple closed curve, so its dual splittings are trivial.

*Examples.* In the splitting of FG6/regular-quadratic-coordinate-group, the surface vertex is QH with Σ of genus n and m + 1 boundary components, all used. A vertex group ℤ² is never QH (ℤ² is not an extension of a hyperbolic surface group by a fiber F = 1).

*Used by.* FG10 JSJ decompositions: flexible vertices of abelian JSJ decompositions of limit groups are QH; FG10 modular groups: automorphisms of QH vertex groups fixing the peripheral structure; FG11 implicit function theorems: quadratic levels of NTQ systems are QH vertices of their coordinate groups.

*Source.* [GL-JSJ] §5.2, Definitions 5.13 and 5.15, p. 47: QH subgroups: vertex stabilizers that are extensions of hyperbolic orbifold groups by a fiber, with incident edge groups and the ℋ-subgroups extended boundary subgroups; used boundary components.; [SELA-I] §2, Theorem 2.7, p. 43: In the abelian JSJ decomposition of a freely indecomposable limit group, QH vertex groups are surface groups with boundary attached along their boundary subgroups.

*Needs.* FG4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees); FG6.1 (Surface groups with boundary and their peripheral structure); FG4.8 (Structure theorem: actions on trees are graphs of groups).

*Suggested home.* `TauCeti/GroupTheory/BassSerre/QH`, namespace `GTree.IsQH`.

### Dependencies

Within this roadmap: FG1, FG2, FG4, FG5. Libraries: Mathlib only (see the supplier contracts). Other roadmaps: none.

*Refinements still to plan.* Refine FG6/finite-index-surface to lemma level: the combinatorial classification of polygon gluings used for covers is planned only through FG6/quadratic-standard-form.

## Layer FG7: Generalised equations, equation solving, and positive formal solutions

Makanin's generalised equations, the reduction of systems of equations and inequations to them, and the elementary transformations, lead to a terminating solver over a free group of finite rank that returns a solution or certifies that there is none; the search bound is Makanin's bound on minimal solutions (Makanin 1982, as corrected and extended to alphabet constraints in Makanin 1984). With FG3 this decides the existential and universal fragments. Positive sentences are handled by Merzljakov's theorem on formal solutions and Makanin's procedure, with the quantifier dependence of the witnesses preserved. A finite description of all solutions is FG10.

*Targets of the layer.* Generalised equations (boundaries, items, bases with orientations and dual bases, constant bases labelled by A^{±1}, boundary connections, parameter sections), their solutions in F(A) and their coordinate groups; the effective reduction of a finite system of equations and inequations with word coefficients over F(A) to finitely many generalised equations, preserving solutions in both directions, with inequations encoded by nonempty items; elementary and derived transformations with their applicability hypotheses, forward and backward preservation of solutions and computability; the finiteness theorem for the transformation process (bounded exponent of periodicity of minimal solutions); a terminating procedure deciding systems of equations and inequations over a nonabelian free group of finite rank, returning a solution on satisfiable input and proving unsatisfiability otherwise, with alphabet (sub-basis) constraints on variables; the existential and universal fragment deciders through FG3; positive formulas and their reduction to single equations (Malcev's equation); Merzljakov's theorem on formal solutions with the quantifier dependence of the witnesses, and Makanin's decision procedure for positive sentences returning the formal witnesses.

### FG7.1 Generalised equations with constants and parameters

**Definition (`FreeGroup.GenEq`).** A (combinatorial) generalised equation Ω over the basis A consists of: boundaries 1, …, ρ + 1 and items h₁, …, h_ρ (h_i between boundaries i and i + 1); a set of bases, each with left and right end-points α(μ) < β(μ), an orientation ε(μ) ∈ {±1}, and either a dual base Δ(μ) (with Δ(Δ(μ)) = μ, a variable base) or a label in A^{±1} (a constant base of length one); and boundary connections (p, μ, q) relating a boundary p inside μ to a boundary q inside Δ(μ). Its basic equations are h[α(μ), β(μ)]^{ε(μ)} = h[α(Δμ), β(Δμ)]^{ε(Δμ)}, its coefficient equations h_i = a for constant bases, and its boundary equations those of the boundary connections. A solution is a tuple U = (U₁, …, U_ρ) of nonempty reduced words over A^{±1} such that every side of every equation is reduced as written and the equations hold graphically; group solutions drop the reduced-as-written condition. Ω is formally consistent when the combinatorial conditions of IFT Definition 10 hold. A parametric generalised equation additionally partitions its closed sections into variable (active, non-active), parametric and constant sections, and is in standard form when these occur in that order. The coordinate group F_{R(Ω)} is the coordinate group (FG5) of the system of group equations Ω* over F(A).

*Construction.*
1. A finite combinatorial structure (natural-number data), with decidable formal consistency (IFT Lemma 12).

*API.*
- `FreeGroup.GenEq` (structure): The combinatorial data: ρ, bases with end-points, orientation, duals or labels, boundary connections, and (for parametric equations) the section partition.
- `FreeGroup.GenEq.Solution` (data): Tuples of nonempty reduced words satisfying the equations graphically.
- `FreeGroup.GenEq.IsFormallyConsistent` (data): The conditions of IFT Definition 10, decidable.
- `FreeGroup.GenEq.toSystem` (projection): The system Ω* of group equations over F(A) in the items.
- `FreeGroup.GenEq.coordGroup` (constructor): F_{R(Ω)} := coordGroup of Ω* (FG5/algebraic-set-radical).
- `FreeGroup.GenEq.Solution.toHom` (coercion): A solution gives an F-homomorphism F_{R(Ω)} → F(A).
- `FreeGroup.GenEq.decidable_isFormallyConsistent` (other): Formal consistency is decidable by a primitive recursive check (IFT Lemma 12(2)).

**Checks.**
- `FreeGroup.GenEq.fig2_solution` (computation): The generalised equation of IFT Fig. 2 has the solution read off the cancellation tree there (h₃ = b, h₄ = a, h₉ = a, h₁₀ = b and the corresponding variable items).
- `FreeGroup.GenEq.empty` (degenerate): The generalised equation with ρ = 0 and no bases has exactly one solution (the empty tuple).
- `FreeGroup.GenEq.items_nonempty` (non-example): Assigning the empty word to an item is not a solution: items are nonempty, which is how inequations w ≠ 1 are encoded (FG7/reduction-to-generalized-equations).
- `FreeGroup.GenEq.graphical_vs_group` (non-example): For the basic equation h₁ h₂ = h₃ with U = (a, a⁻¹ b, b), the group equation holds but U₁U₂ = a a⁻¹ b is not reduced as written, so U is a group solution and not a solution.
- `FreeGroup.GenEq.coordGroup_compat` (compatibility): coordGroup Ω is FG5's coordGroup of the system toSystem Ω over G = FreeGroup A.

*Examples.* The generalised equation of IFT Fig. 2 has ten items h₁, …, h₁₀, eleven boundaries, basic equations h₁ = h₇, h₂ = h₈, h₅ = h₆, h₁h₂h₃h₄ = h₆h₇, h₅ = h₈h₉h₁₀ and coefficient equations h₃ = b, h₄ = a, h₉ = a, h₁₀ = b. A generalised equation with a solution is formally consistent (IFT Lemma 12(1)).

*Used by.* FG7 reduction and transformations: the objects on which Makanin's process acts; FG10 Makanin–Razborov diagrams: vertices of the solution tree are generalised equations; FG11 cut equations: IFT §5.7 builds cut equations from generalised equations.

*Source.* [IFT] §4.1, Definitions 8–10 and Lemma 12, pp. 17–20; §4.3, Definitions 11–12, pp. 23–24: Combinatorial generalised equations (boundaries, items, bases, duals, orientations, constant bases, boundary connections), their solutions as tuples of nonempty reduced words, formal consistency and its decidability, and parametric generalised equations in standard form.; [JSJ] §4.1, pp. 125–129: The same definitions in the effective JSJ paper.; [VAR-II] §1, pp. 7–9: Generalised equations as used for the triangular quasi-quadratic description.

*Needs.* Mathlib `FreeGroup`; Mathlib `FreeGroup.IsReduced`; FG5.2 (Algebraic sets, radicals and coordinate groups).

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/GeneralizedEquation`, namespace `FreeGroup.GenEq`.

### FG7.2 Reduction of systems of equations and inequations to generalised equations

**Construction (`FreeGroup.GenEq.GE`).** For an equation–inequation system (S, T) over F(A) (FG3/equation-system) with variables X, rewrite each inequation t ≠ 1 as the equation t z_t⁻¹ = 1 with a fresh variable z_t constrained to be nontrivial, and allow alphabet constraints (a variable required to lie in the subgroup generated by a sub-basis B ⊆ A, encoded by labels). GE(S, T) is the finite set of generalised equations Ω_P, one for each partition table P (cancellation scheme) of the resulting system, in which every constrained z_t occupies at least one item, together with word maps P_x(H, A) ∈ F[H] of length at most |H| for x ∈ X.

*Hypotheses.* A finite; X finite; coefficients given as words.

*Construction.*
1. Partition tables are bounded in size by a function of the total length of the system, hence finitely many and effectively enumerable (IFT Lemma 13).
2. Each table determines the bases and their duals of Ω_P and the word maps P_x (IFT Lemma 14).

*API.*
- `FreeGroup.GenEq.GE` (data): The finite list of generalised equations with their word maps.
- `FreeGroup.GenEq.GE_card_le` (other): The length of GE(S, T) is bounded by a computable function of the total length of (S, T).
- `FreeGroup.GenEq.GE_wordMap` (projection): The word maps P_x ∈ F[H] for x ∈ X.
- `FreeGroup.GenEq.primrec_GE` (other): GE is primitive recursive on codes.

**Checks.**
- `FreeGroup.GenEq.GE_trivial` (degenerate): For the empty system, GE has one generalised equation with no items, and the word maps are trivial.
- `FreeGroup.GenEq.GE_x_eq_a` (computation): For x = a, GE has a single generalised equation with one item labelled a.
- `FreeGroup.GenEq.GE_ineq_x` (non-example): For the inequation x ≠ 1 alone, GE has no member assigning z_x zero items: dropping the nonemptiness requirement would admit x = 1.
- `FreeGroup.GenEq.GE_inconsistent` (computation): For x² = a (no solution in F(a,b)), every member of GE has no solution, matching FG7/solver-complete.

*Examples.* For the single equation x y = a b (no inequations) GE contains the generalised equations of the cancellation patterns of x y against a b.

*Used by.* FG7 solver: the decision procedure runs on GE(S, T); FG7 Merzljakov's theorem: IFT §4.4 applies Lemma 14 to Merzljakov words; FG10 solution trees: the root of the Makanin–Razborov process.

*Source.* [IFT] §4.2, Lemmas 13–14, pp. 20–23: Partition tables of a system are finite in number and effectively enumerable; GE(S) is constructed with word maps P_x of bounded length such that solutions correspond in both directions.; [JSJ] §4.2, Lemma 4.7, pp. 129–132: The same reduction, due to Makanin.; [RECOMP] §2, Proposition 1, p. 8: An independent reduction: systems of equations and inequalities with rational constraints over a free group become word equations with regular constraints over a free monoid with involution.; [MAK] §2, Lemma 1, p. 76: An inequation in a free group is reduced to finitely many systems of equations in the paired alphabet, whose solutions with noncontractible (nonempty) components correspond to its solutions: the source of the encoding of inequations by nonempty items.

*Needs.* FG7.1 (Generalised equations with constants and parameters); FG3.5 (Finite systems of equations and inequations with word coefficients).

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/GeneralizedEquation`, namespace `FreeGroup.GenEq`.

### FG7.3 Correctness of the reduction to generalised equations (both directions)

**Theorem.** (1) If GE(S, T) is empty, (S, T) has no solution in F(A). (2) For every Ω ∈ GE(S, T) and every solution U of Ω, x ↦ P_x(U, A) is a solution of (S, T) (including the inequations, since the z_t are nonempty reduced). (3) For every solution W of (S, T) there are Ω ∈ GE(S, T) and a solution U of Ω with W = P(U). The map Hom_F(F_{R(Ω)}, F) → Hom_F(F_{R(S)}, F) is induced by the F-homomorphism π_Ω : F_{R(S)} → F_{R(Ω)} of the word maps, and (2) holds in every F-group in place of F(A) (IFT Lemma 14(2), (4)).

*Proof sketch.*
1. IFT Lemma 14 for equations; inequations through the fresh nonempty variables; alphabet constraints are preserved because labels are read from the solution words.

*Examples.* For x y = a b, the solution x = a, y = b comes from the table without cancellation, and x = a c, y = c⁻¹ b from the table with a cancelling segment c.

*Source.* [IFT] §4.2, Lemma 14, pp. 22–23: Both directions of the correspondence between solutions of S and solutions of the generalised equations in GE(S).; [JSJ] §4.2, Lemma 4.7, p. 132: The same lemma.

*Needs.* FG7.2 (Reduction of systems of equations and inequations to generalised equations); FG7.1 (Generalised equations with constants and parameters); FG1.5 (Correctness of the word-problem procedure (both answers)).

### FG7.4 Elementary and derived transformations of generalised equations

**Construction (`FreeGroup.GenEq.ET`).** The elementary transformations ET1 (cutting a base at a boundary connection), ET2 (transferring a base), ET3 (removing a pair of matched bases), ET4 (removing a lonely base), ET5 (introducing a boundary) and the derived transformations D1–D6 (closing a section, transporting a closed section, complete cut, the kernel of a generalised equation, the entire transformation, identifying closed constant sections) associate to a formally consistent Ω a finite list of generalised equations Ω₁, …, Ω_r and surjective F-homomorphisms θ_i : F_{R(Ω)} → F_{R(Ω_i)} such that every solution U of Ω determines a unique pair (Ω_i, U_i), U_i a solution of Ω_i, with U = U_i ∘ θ_i (as F-homomorphisms from F_{R(Ω)}). Each transformation has explicit applicability hypotheses; the exceptional cases of the sources are kept.

*Construction.*
1. Each transformation is a finite combinatorial operation on the data of FG7/generalized-equation, defined by cases (IFT §5.1–§5.2).

*API.*
- `FreeGroup.GenEq.ET` (data): The five elementary transformations as functions to lists of generalised equations with homomorphisms.
- `FreeGroup.GenEq.Derived` (data): The derived transformations D1–D6.
- `FreeGroup.GenEq.ET.solution_forward` (characterisation): Every solution of Ω transfers uniquely to a solution of some Ω_i (forward preservation).
- `FreeGroup.GenEq.ET.solution_backward` (characterisation): Every solution of Ω_i composes with θ_i to a solution of Ω (backward preservation).
- `FreeGroup.GenEq.ET.primrec` (other): Each transformation is primitive recursive on codes.
- `FreeGroup.GenEq.ET.applicable` (other): The applicability hypotheses as decidable predicates.

**Checks.**
- `FreeGroup.GenEq.ET3_matched` (computation): On a generalised equation with one pair of matched bases and nothing else, ET3 returns the empty generalised equation.
- `FreeGroup.GenEq.ET_identity_case` (degenerate): When a transformation is not applicable it returns the one-element list [Ω] with the identity homomorphism.
- `FreeGroup.GenEq.ET5_branches` (computation): ET5 on a base of length two produces as many branches as positions of the new boundary in the dual base.
- `FreeGroup.GenEq.ET_not_injective` (non-example): The θ_i are surjective but need not be isomorphisms (ET5 can add an equation to the radical): treating them as isomorphisms would lose the proper quotients that FG10 records.

*Examples.* ET3 applied to two matched bases μ, Δ(μ) with α(μ) = α(Δμ) removes them and leaves the solutions unchanged. ET5 introduces a new boundary inside a base and branches over the finitely many positions of its image in the dual base.

*Used by.* FG7 finiteness of the process: the process applies these transformations; FG10 Makanin–Razborov diagrams: edges of the solution tree are compositions of the θ_i; FG11 cut equations: transformations of cut equations follow those of generalised equations.

*Source.* [IFT] §5.1, ET1–ET5, pp. 27–30; §5.2, D1–D6, pp. 30–35: Makanin's elementary transformations with the associated surjections of coordinate groups and the unique transfer of solutions; derived transformations realised as finite sequences of elementary ones.; [JSJ] §5.1–§5.2, pp. 135–143 (printed): The same transformations in the effective JSJ paper.

*Needs.* FG7.1 (Generalised equations with constants and parameters).

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/GeneralizedEquation`, namespace `FreeGroup.GenEq`.

### FG7.5 Elementary transformations preserve solutions and are computable

**Theorem.** For every formally consistent generalised equation Ω and every elementary or derived transformation E applicable to Ω: (1) every solution of Ω is U_i ∘ θ_i for a unique pair (Ω_i, U_i) with Ω_i ∈ E(Ω) and U_i a solution of Ω_i (forward preservation), and for every solution U_i of some Ω_i the composite U_i ∘ θ_i is an F-homomorphism F_{R(Ω)} → F(A), that is a group solution of Ω, which for ET1–ET3 is again a solution (backward preservation); (2) E is primitive recursive on codes; (3) formal consistency is preserved or the branch is discarded with no solutions lost.

*Proof sketch.*
1. Case analysis following IFT §5.1, checking for each case that a solution of Ω induces one of the listed branches and conversely.

*Examples.* For ET1 at a boundary connection (p, λ, q) the two new bases λ₁, λ₂ carry exactly the restrictions of the solution words.

*Source.* [IFT] §5.1, pp. 27–30 (the commutative diagram defining elementary transformations and the cases ET1–ET5): Every pair (Ω, U) is sent to a unique pair (Ω_i, U_i) with U = U_i ∘ θ_i.

*Needs.* FG7.4 (Elementary and derived transformations of generalised equations); FG7.1 (Generalised equations with constants and parameters).

### FG7.6 Makanin's finiteness theorem: a computable bound for minimal solutions

**Theorem.** There is a computable function f : ℕ → ℕ such that every formally consistent generalised equation Ω over a finite basis A (with alphabet constraints on items) that has a solution has one whose total length Σ |U_i| is at most f(‖Ω‖), where ‖Ω‖ is the size of the code of Ω. Consequently, for every equation–inequation system (S, T) over F(A) with alphabet constraints, if (S, T) has a solution then it has one of length at most a computable function of its size.

*Hypotheses.* A finite; generalised equations formally consistent.

*Proof sketch.*
1. Exponent of periodicity: the components of a minimal solution of a system in a paired alphabet contain no power P^s with s above a computable bound in the notational length (MAK82 Lemma 1.4, p. 487; IFT §5.4 periodic structures).
2. Makanin's process: generalised equations are transformed by the elementary transformations (FG7/elementary-transformations), and the length of a minimal solution is bounded by recursion on the number of pairs of bases (MAK82 §§2–10, Theorem 10.3 as re-proved in MAK §6 after Razborov found that E.11 need not preserve minimality); the bounding functions of MAK82 §11 (Lemmas 11.1–11.4, Theorem 11.5, pp. 545–546) give the computable f. IFT §5.3–§5.5 gives the same process in its formalism (the tree T(Ω), Lemmas 30–32, the finite subtree T₀(Ω)).
3. Alphabet constraints on the unknowns are added as in MAK §5 (pp. 79–80: restricted subalphabets on intervals, intersected under E.11, with a new transformation deleting inconsistent equations); inequations are first reduced to systems in the paired alphabet by MAK Lemmas 1–2 (pp. 76–78).
4. The proof uses neither the universal-theory decider nor any statement of FG10; IFT Lemma 15, which does use the universal theory, concerns isomorphism of coordinate groups and is not needed here.
5. Independent route: RECOMP Proposition 1 and Corollary 1 give a finite (PSPACE-computable) graph representation of all solutions of a system with inequalities and rational constraints, hence an independent decision procedure that can replace the bounded search; it is not itself a length bound.

*Examples.* For x y x⁻¹ y⁻¹ = [a, b], a minimal solution is x = a, y = b, of total length 2. For a system without solutions the statement is vacuous, and the solver must still prove unsatisfiability: that is the role of the bound.

*Source.* [IFT] §5.3–§5.5, pp. 35–58 (the tree T(Ω), periodized equations, Lemmas 30–32, the finite subtree T₀(Ω) and Proposition 1): Makanin's process: the tree of transformations, periodic structures and the bound on the exponent of periodicity, cutting off long branches to a finite tree that contains the paths of minimal solutions.; [MAK82] §1, Lemma 1.4, p. 487; §10, Theorem 10.3, p. 539; §11, Lemmas 11.1–11.4 and Theorem 11.5, pp. 545–546: Makanin's bound on the exponent of periodicity of minimal solutions, the bound for normalized complete generalized equations, and the bounding function: each component of a minimal solution of an equation of notational length b in a free group has length at most a computable Φ(b) (Theorem 11.5), with the analogous bound for systems in a paired alphabet (Lemma 11.4).; [MAK] §2, Lemmas 1–2, pp. 76–78; §5, pp. 79–80; §6, pp. 80–88: Reduction of inequations to systems in the paired alphabet; extension of the bounds of MAK82 Theorem 11.5 to unknowns restricted to subalphabets; corrections to MAK82 (minimality is not preserved by E.11, so Theorem 10.3 is re-proved with larger bounds).; [RECOMP] Proposition 1, p. 8, and Theorem 1 and Corollary 1, p. 12: An independent route: systems with inequalities and rational constraints over a free group are transformed into word equations with regular constraints, and a PSPACE transducer produces a finite graph representation of all solutions (no explicit length bound is stated).

*Needs.* FG7.4 (Elementary and derived transformations of generalised equations); FG7.5 (Elementary transformations preserve solutions and are computable); FG7.3 (Correctness of the reduction to generalised equations (both directions)).

### FG7.7 The equation–inequation solver over a free group

**Construction (`FreeGroup.Solver.solve`).** For a nonabelian free group F(A) of finite rank, solve : EqIneqSystem X A → Option (X → FreeGroup A) (with or without alphabet constraints) is the bounded search: enumerate all assignments of reduced words of total length at most the bound of FG7/minimal-solution-bound (computed from the code of the input), and return the first one that is a solution by FG1/word-problem-procedure, or none if there is none.

*Hypotheses.* A finite (the rank of F(A) is finite); the procedure is total on all inputs.

*Construction.*
1. Compute the bound, enumerate candidate tuples of words up to that total length in a fixed order, test each by the word problem.

*API.*
- `FreeGroup.Solver.solve` (data): The bounded-search solver.
- `FreeGroup.Solver.solveConstrained` (data): The version with alphabet constraints (each variable restricted to the subgroup of a sub-basis).
- `FreeGroup.Solver.decode_solve` (projection): The returned value is an assignment X → FreeGroup A given by reduced words.
- `FreeGroup.Solver.solve_isSome_iff` (characterisation): (solve s).isSome ↔ ∃ v, s.IsSolution v (FG7/solver-sound and FG7/solver-complete).

**Checks.**
- `FreeGroup.Solver.solve_commutator` (computation): solve ([x y x⁻¹ y⁻¹ ⁅a,b⁆⁻¹], []) is some v with v solving the system.
- `FreeGroup.Solver.solve_empty` (degenerate): solve ([], []) = some (fun _ => 1).
- `FreeGroup.Solver.solve_center` (non-example): solve ([x a x⁻¹ a⁻¹, x b x⁻¹ b⁻¹], [x]) = none: an unbounded search would never answer here, which is why the bound is needed.
- `FreeGroup.Solver.solve_constrained` (computation): With the constraint y ∈ ⟨a⟩, solveConstrained ([y² a⁻²], []) returns y = a, and solveConstrained ([y b⁻¹], []) returns none.

*Examples.* solve ([x y x⁻¹ y⁻¹ [a,b]⁻¹], []) returns some solution (for instance x = a, y = b). solve ([x a x⁻¹ a⁻¹, x b x⁻¹ b⁻¹], [x]) returns none.

*Used by.* FG7 existential and universal deciders: each system of the FG3 reduction is decided by solve; FG7 positive-theory decider: solveConstrained with y_i ∈ F(A ∪ X_i) over F(A ∪ X); FG10 effective algorithms: word problems of coordinate groups reduce to systems with inequations.

*Source.* [IFT] §4.4, proof of Corollary 9, p. 26, and §5.1 (Lemma 15 uses decidability of the universal theory): Decidability of equations over free groups with constraints (Makanin) is the basis of the positive-theory algorithm.; [RECOMP] Abstract and §1, pp. 1–2: Solving equations with inequalities and rational constraints over free groups.; [MAK] §3, Theorem 1 and its proof, p. 78: Decidability of existential sentences with equations and inequations, obtained from the bound on the length of minimal solutions of systems in a paired alphabet (MAK82 Lemma 11.4): the bounded search planned here.

*Needs.* FG7.6 (Makanin's finiteness theorem: a computable bound for minimal solutions); FG3.5 (Finite systems of equations and inequations with word coefficients); FG1.4 (The word-problem procedure for a free group); FG1.1 (Primitive-recursive encoding of a free group through reduced words).

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Solver`, namespace `FreeGroup.Solver`.

### FG7.8 Interpretation of the solver's output

**Theorem.** If solve s = some v then v : X → FreeGroup A is the decoding of the encoded output (a tuple of reduced words) and FG3/equation-system's IsSolution s v holds with coefficients of; the encoded procedure on codes commutes with decoding: decode (solveCode (encode s)) = solve s.

*Proof sketch.*
1. The procedure tests each candidate with the word problem before returning it; decoding is FG1/primcodable-free-group.

*Examples.* For the commutator system, the returned words evaluate the left side to 1.

*Source.* [IFT] §4.2, Lemma 14, p. 22: Solutions of generalised equations give solutions of the system through explicit word maps.

*Needs.* FG7.7 (The equation–inequation solver over a free group); FG1.5 (Correctness of the word-problem procedure (both answers)); FG1.3 (Homomorphism evaluation and substitution are computable).

### FG7.9 The solver is computable

**Theorem.** solve and solveConstrained are computable functions EqIneqSystem X A → Option (X → FreeGroup A) for the encodings of FG1 and FG3 (the node claims computability only; whether this particular search is primitive recursive depends on the bound f, and satisfiability itself is decidable in PSPACE by recompression, RECOMP).

*Proof sketch.*
1. The bound f of FG7/minimal-solution-bound is computable; bounded enumeration and the word problem are primitive recursive; composition gives Computable.

*Examples.* The statement is Computable; no complexity bound is a target (RECOMP, introduction: Makanin's original bounds, and PSPACE by recompression).

*Source.* [RECOMP] Introduction, pp. 2–3: History of the bounds: Makanin's triply exponential bound on the length of minimal solutions (as stated there), the subsequent improvements, and the PSPACE recompression algorithm.

*Needs.* FG7.7 (The equation–inequation solver over a free group); FG7.6 (Makanin's finiteness theorem: a computable bound for minimal solutions); FG1.2 (Free reduction and the group operations are primitive recursive); Mathlib `Computable`.

### FG7.10 Termination of the solver on its input class

**Theorem.** For every finite basis A and every finite equation–inequation system s over F(A) with alphabet constraints, the computation of solve s halts: the partial-recursive presentation of solve (Partrec) has domain everything.

*Proof sketch.*
1. The search range is finite, of size bounded by a computable function of the input; the bound itself is computed by a total procedure (FG7/minimal-solution-bound).

*Examples.* Halts on the unsatisfiable system of FG7/solver-procedure's test, returning none.

*Source.* [IFT] §5.5.3, p. 51: The finite subtree T₀(Ω) is constructed effectively, so the search for minimal solutions terminates.

*Needs.* FG7.7 (The equation–inequation solver over a free group); FG7.9 (The solver is computable); Mathlib `Partrec`.

### FG7.11 Soundness: a returned assignment is a solution

**Theorem.** For every system s, if solve s = some v then v solves s in F(A) (all equations hold and all inequations fail to hold), and v satisfies the alphabet constraints of solveConstrained.

*Proof sketch.*
1. Immediate from FG7/solver-interpretation.

*Examples.* The returned solution of the commutator system satisfies x y x⁻¹ y⁻¹ = [a, b].

*Source.* [IFT] §4.2, Lemma 14(4), p. 23: Solutions of the generalised equations are solutions of the system.

*Needs.* FG7.8 (Interpretation of the solver's output).

### FG7.12 Completeness: none means unsatisfiable

**Theorem.** For every system s over a free group F(A) of finite rank, solve s = none if and only if s has no solution in F(A) (respecting the alphabet constraints). Hence satisfiability of finite systems of equations and inequations with word coefficients over F(A) is a ComputablePred.

*Proof sketch.*
1. If s had a solution, by FG7/minimal-solution-bound it would have one within the search range, and the procedure would return some solution.
2. Combine with FG7/solver-sound and FG7/solver-computable.

*Examples.* solve ([x² a⁻¹], []) = none and indeed a is not a square in F(a,b).

*Source.* [IFT] §4.4, proof of Corollary 9, p. 26 (decidability of equations with constraints, Makanin): Equations over free groups with constraints are decidable.; [RECOMP] Proposition 1, p. 8, and Corollary 1, p. 12: The solution set of a system with inequalities and rational constraints is described effectively; in particular emptiness is decidable.

*Needs.* FG7.7 (The equation–inequation solver over a free group); FG7.6 (Makanin's finiteness theorem: a computable bound for minimal solutions); FG7.3 (Correctness of the reduction to generalised equations (both directions)); FG7.11 (Soundness: a returned assignment is a solution); Mathlib `ComputablePred`.

### FG7.13 Deciders for the existential and universal fragments

**Construction (`FreeGroup.Solver.existsDecide`).** existsDecide : codes of existential L_A-sentences → Bool runs existsToSystems (FG3/existential-reduction) and returns true iff solve finds a solution of some system (returning the witnessing assignment as well); forallDecide on universal sentences returns true iff solve finds no solution of any system of forallToSystems. Correctness: for every existential sentence σ, existsDecide σ = true iff F(A) ⊨ σ, and for every universal σ, forallDecide σ = true iff F(A) ⊨ σ; both are computable and total on their input classes. No decider for sentences with more quantifier alternations is claimed.

*Hypotheses.* A finite with |A| ≥ 1 (the coefficients); sentences existential, respectively universal.

*Construction.*
1. Compose the FG3 reductions with the solver; correctness of both answers from FG7/solver-sound and FG7/solver-complete; computability by composition.

*API.*
- `FreeGroup.Solver.existsDecide` (data): Decider for existential sentences, with witness.
- `FreeGroup.Solver.forallDecide` (data): Decider for universal sentences.
- `FreeGroup.Solver.existsDecide_iff` (characterisation): existsDecide σ = true ↔ FreeGroup A ⊨ σ (σ existential).
- `FreeGroup.Solver.forallDecide_iff` (characterisation): forallDecide σ = true ↔ FreeGroup A ⊨ σ (σ universal).
- `FreeGroup.Solver.computable_existsDecide` (other): Both deciders are computable.

**Checks.**
- `FreeGroup.Solver.existsDecide_centralizer` (computation): existsDecide (∃x ([x, a] = 1 ∧ x ≠ 1)) = true.
- `FreeGroup.Solver.forallDecide_commutative` (non-example): forallDecide (∀x∀y [x,y] = 1) = false in F(a,b) though true in F(a): the answer depends on the rank, so a decider ignoring A is wrong.
- `FreeGroup.Solver.existsDecide_true` (degenerate): existsDecide of the sentence ∃x (x = x) is true.
- `FreeGroup.Solver.forallDecide_vaught` (computation): forallDecide (∀x∀y∀z (x² y² z² = 1 → [x, y] = 1)) = true (Lyndon's theorem, IFT Definition 7).

*Examples.* existsDecide (∃x ([x, a] = 1 ∧ x ≠ 1)) = true with witness x = a. forallDecide (∀x∀y ([x, y] = 1)) = false over F(a,b), true over F(a).

*Used by.* FG8 and FG10: word problems of coordinate groups and universal equivalence with F; IFT §3: universal formulas over F in canonical radical form.

*Source.* [VAR-II] §0, Definition 9, p. 6 of the author copy: The existential theory of a free group is decidable (Makanin), which also gives the word problem of coordinate groups of finite systems.; [IFT] §3.2, p. 13, and §5.1, Lemma 15, p. 30: Universal formulas over F and the decidability of the universal theory of a free group (Makanin).; [MAK] §2, Lemmas 1–2, pp. 76–78, and §3, Theorem 1, p. 78: Makanin reduces an existential sentence with equations and inequations to systems in the paired alphabet and decides it with the length bound of MAK82; this is the decidability of the universal theory of a free group.

*Needs.* FG3.7 (Existential and universal sentences reduce to systems); FG7.7 (The equation–inequation solver over a free group); FG7.11 (Soundness: a returned assignment is a solution); FG7.12 (Completeness: none means unsatisfiable); FG7.9 (The solver is computable).

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Solver`, namespace `FreeGroup.Solver`.

### FG7.14 Positive formulas as single equations (Malcev's equation)

**Theorem.** Let G be torsion-free, CSA, nonabelian and satisfying Vaught's condition ∀x∀y∀z (x² y² z² = 1 → [x,y] = [x,z] = [y,z] = 1) — in particular any nonabelian free group — and a, b ∈ G with [a, b] ≠ 1. (1) The equation x² a x² a⁻¹ = (y b y b⁻¹)² has only the trivial solution in G. (2) For equations S₁ = 1, …, S_k = 1 one effectively finds single equations S = 1 with V_G(S) = V_G(S₁, …, S_k) and S′ = 1 with V_G(S′) = V_G(S₁) ∪ … ∪ V_G(S_k). (3) Every positive quantifier-free formula of L_A is equivalent over G to a single equation, and every positive sentence to one of the form ∀x₁∃y₁ … ∀x_k∃y_k (S(X, Y, A) = 1), effectively.

*Hypotheses.* G torsion-free, CSA, nonabelian, satisfying Vaught's condition; a, b ∈ A non-commuting.

*Proof sketch.*
1. (1) IFT Lemma 3 (after Malcev), using Vaught's condition and commutation transitivity.
2. (2) IFT Corollaries 2–5, with IFT Lemma 4 for disjunctions.
3. (3) IFT Corollary 6 and the prenex form of §2.3 with fictitious quantifiers.

*Examples.* Over F(a,b), the system {x = 1, y = 1} is equivalent to the single equation x² a x² a⁻¹ = (y b y b⁻¹)².

*Source.* [IFT] §3.1, Definition 7 and Lemma 3, pp. 10–11; Corollaries 2–6 and Lemma 4, pp. 11–12; §2.3, p. 5; §4.4, p. 25: Malcev's equation with only the trivial solution in groups of the class T (torsion-free, CSA, Vaught's condition, two non-commuting elements), the effective encoding of finite conjunctions and disjunctions of equations into one equation over such groups (modulo the axioms of T), and the prenex ∀∃ form of positive sentences used for Merzljakov's theorem (p. 25).; [MAK] §4, Lemma 3 (Mal'tsev) and Lemma 4 (Gurevich), pp. 78–79: In a free group the equation x₁² a₁ x₁² a₁⁻¹ = (x₂ a₂ x₂ a₂⁻¹)² is equivalent to x₁ = 1 ∧ x₂ = 1 (Lemma 3), and a conjunction of four equations is equivalent to the disjunction x₁ = 1 ∨ x₂ = 1 (Lemma 4).

*Needs.* FG1.19 (Maximal cyclic subgroups are malnormal; free groups are CSA); FG3.6 (Quantifier-free formulas are finite disjunctions of systems); FG3.3 (Substitution, renaming, variable shifting and prenex forms are computable); FG1.18 (Malnormal subgroups, CSA groups and commutation transitivity).

### FG7.15 Merzljakov's theorem: formal solutions of positive sentences

**Theorem.** Let F = F(A) be a nonabelian free group of finite rank and S(X, Y, A) = 1 an equation with X = (x₁, …, x_k), Y = (y₁, …, y_k). If F ⊨ ∀x₁∃y₁ … ∀x_k∃y_k (S(X, Y, A) = 1), then there are words q₁(x₁), q₂(x₁, x₂), …, q_k(x₁, …, x_k) with q_i ∈ F[x₁, …, x_i] (the free product F ∗ F(x₁, …, x_i)) such that S(x₁, q₁(x₁), …, x_k, q_k(x₁, …, x_k), A) = 1 in F[X]: the equation has a solution in the free group F[X] whose i-th component depends only on x₁, …, x_i.

*Hypotheses.* F nonabelian of finite rank; a single equation (by FG7/positive-normal-form every positive sentence reduces to this case).

*Proof sketch.*
1. Choose Merzljakov words g_i = b a^{m_{i1}} b ⋯ a^{m_{in_i}} b with increasing exponents, n_i larger than (max number of items of the members of GE(S)) · |S|, and no subword b a^{m} b shared with earlier g_l, h_l; choose h_i inductively so the remaining sentence holds.
2. Apply FG7/reduction-correct to the solution (g, h); each g_i contains a marked subword occurring inside a single item and exactly once; replace each marked occurrence b a^{m} b by b a^{m} x_i b throughout (IFT §4.4).
3. The modified tuple is a solution of the generalised equation over F[X] (the equations hold graphically), so X ↦ x_i, Y ↦ Q(Ũ) solves S over F[X]; the dependence of q_i on x₁, …, x_i comes from the marking order.

*Examples.* For ∀x∃y (y = x a), the formal solution is q(x) = x a. For ∀x∃y ([x, y] = 1) a formal solution is q(x) = x (or 1).

*Source.* [IFT] §4.4, Merzljakov's Theorem and its proof, pp. 24–26: If a positive ∀∃ sentence holds in F, the equation has a solution in F[X] with q_i depending on x₁, …, x_i; proof by Merzljakov words and generalised equations.; [LIFT] §1, p. 217: Statement of Merzljakov's theorem as the basic implicit function theorem.; [MAK] §4, Lemma 5 (Merzlyakov), p. 79: A ∀∃-sentence with one equation holds in F iff the equation in the existential variables is solvable over a free group of larger rank with each unknown restricted to the subalphabet of the coefficients and the earlier universal variables (the constrained form used by the decider).

*Needs.* FG7.3 (Correctness of the reduction to generalised equations (both directions)); FG7.14 (Positive formulas as single equations (Malcev's equation)); FG5.1 (G-groups and the free G-group G[X]).

### FG7.16 Makanin's decision procedure for positive sentences, with formal witnesses

**Construction (`FreeGroup.Solver.positiveDecide`).** positiveDecide takes a positive L_A-sentence, brings it to the form ∀x₁∃y₁ … ∀x_k∃y_k (S(X, Y, A) = 1) by FG7/positive-normal-form, and runs solveConstrained over the free group F(A ∪ X) on the equation S(X, Y, A) = 1 in the variables Y with the constraints y_i ∈ F(A ∪ {x₁, …, x_i}). It returns some (q₁, …, q_k) if a constrained solution exists and none otherwise. Correctness: the sentence holds in F(A) iff the answer is some q, and then q is a tuple of formal witnesses with the quantifier dependence of Merzljakov's theorem; the procedure is computable and total.

*Hypotheses.* A finite with at least two letters (F nonabelian).

*Construction.*
1. If the sentence holds, FG7/merzljakov-theorem gives a constrained solution, which solveConstrained finds (FG7/solver-complete).
2. If solveConstrained returns q, then for every specialisation of X the tuple q(X) witnesses the sentence, so the sentence holds (soundness).
3. Computability and totality from the FG7 solver nodes.

*API.*
- `FreeGroup.Solver.positiveDecide` (data): The decider returning formal witnesses.
- `FreeGroup.Solver.positiveDecide_iff` (characterisation): (positiveDecide σ).isSome ↔ FreeGroup A ⊨ σ for positive σ.
- `FreeGroup.Solver.positiveDecide_witness` (characterisation): positiveDecide σ = some q → q_i ∈ F[x₁, …, x_i] and S(x, q(x)) = 1 in F[X].
- `FreeGroup.Solver.computable_positiveDecide` (other): positiveDecide is computable.

**Checks.**
- `FreeGroup.Solver.positiveDecide_translate` (computation): positiveDecide (∀x∃y (y = x a)) returns q(x) = x a.
- `FreeGroup.Solver.positiveDecide_sqrt` (non-example): positiveDecide (∀x∃y (y² = x)) = none; a decider checking only finitely many specialisations of x could not certify this.
- `FreeGroup.Solver.positiveDecide_trivial` (degenerate): For the sentence with k = 0 and S = 1 (the empty word), the answer is some ().
- `FreeGroup.Solver.positiveDecide_dependence` (characterisation): For ∀x₁∃y₁∀x₂∃y₂ (y₁ = x₁ ∧ y₂ = x₂ x₁) the witnesses are q₁ = x₁, q₂ = x₂ x₁, and q₁ does not depend on x₂.

*Examples.* positiveDecide (∀x∃y (y = x a)) = some (x a). positiveDecide (∀x∃y (y² = x)) = none (x = a has no square root).

*Used by.* FG11 implicit function theorems: Merzljakov's theorem is the case of the empty equation S(X) = 1 of the implicit function theorem; IFT §4.4: the positive theory of F and free lifting of sentences.

*Source.* [IFT] §4.4, Corollary 9 and its proof, p. 26; Definition 13 and Theorem 4, pp. 26–27: An algorithm decides positive ∀∃ sentences over F and finds the words q_i; the proof combines Merzljakov's theorem with the decidability of equations with constraints y_i ∈ F[X_i]; F freely lifts true sentences.; [MAK] §4, Lemmas 3–5, pp. 78–79, and §5, Theorem 2, pp. 79–80: Makanin's decision procedure for positive sentences: Mal'tsev's and Gurevich's lemmas turn the positive formula into one equation, Merzlyakov's lemma turns the quantifier prefix into alphabet restrictions on the unknowns, and the bounds of MAK82 Theorem 11.5, extended to restricted unknowns, decide the resulting equation.

*Needs.* FG7.15 (Merzljakov's theorem: formal solutions of positive sentences); FG7.14 (Positive formulas as single equations (Malcev's equation)); FG7.7 (The equation–inequation solver over a free group); FG7.12 (Completeness: none means unsatisfiable); FG7.11 (Soundness: a returned assignment is a solution); FG7.9 (The solver is computable).

*Suggested home.* `TauCeti/GroupTheory/FreeGroup/Solver`, namespace `FreeGroup.Solver`.

### Dependencies

Within this roadmap: FG1, FG3, FG5. Libraries: Mathlib only (see the supplier contracts). Other roadmaps: none.

*Refinements still to plan.* Refine FG7/minimal-solution-bound to lemma level from Makanin's own proof (MAK82 §§1–11, read by the review at statement level: Lemma 1.4 p. 487, Theorem 10.3 p. 539, Lemmas 11.1–11.4 and Theorem 11.5 pp. 545–546), with the corrections and the extension to alphabet-restricted unknowns of MAK §§5–6 (pp. 79–88); for systems combining inequations with alphabet constraints, combine MAK Lemmas 1–2 with MAK §5 or use RECOMP Proposition 1 with Corollary 1.

## Layer FG8: Fully residually free groups, limit groups, and ordinary NTQ towers

Fully residually free groups (free discrimination), limit groups as limits of marked free groups, and their identification with coordinate groups of irreducible algebraic sets; extensions of centralizers, the embedding theorems and finite presentability; triangular quasi-quadratic and NTQ systems with their coordinate groups, level maps and the regular subclass used in FG11. The cyclic-centralizer theorem of free groups is not transferred: centralizers in limit groups are free abelian, not cyclic.

*Targets of the layer.* Residually free and fully residually free (freely discriminated) groups, and the F-versions for F-groups; subgroup and embedding invariance; torsion-freeness, commutation transitivity and the CSA property, abelian centralizers (not necessarily cyclic) and free abelian subgroups of finite rank; the space of marked groups, limit groups as limits of marked free groups, and the equivalence with finitely generated fully residually free groups; the identification with coordinate groups of irreducible algebraic sets over F, with coefficients explicit; extensions of centralizers and iterated extensions, fully residually free over a CSA base; the embedding theorems into iterated centralizer extensions and into F^{ℤ[x]}; finite presentability of finitely generated fully residually free groups (hence of their finitely generated subgroups); triangular quasi-quadratic and NTQ systems with quadratic, centralizer-extension, free-abelian and empty (free) levels, the NTQ group as the coordinate group, the level inclusions, retractions given by solutions and specialisations, and regular NTQ systems. No classification up to elementary equivalence is included.

### FG8.1 Residually free and fully residually free groups

**Definition (`LimitGroup.IsResiduallyFree`).** A group G is residually free when for every g ≠ 1 there are a free group F and a homomorphism φ : G → F with φ g ≠ 1, and fully residually free (freely discriminated, ω-residually free) when for every finite set g₁, …, g_n of nontrivial elements there are a free group F and φ : G → F with φ g_i ≠ 1 for all i. Free groups are quantified as Mathlib's IsFreeGroup over types in the universe of G (equivalently, by Nielsen–Schreier, FreeGroup (Fin 2) for countable G). For an F-group (F free nonabelian with fixed embedding) the coefficient version is FG5's F-discrimination by F.

*Construction.*
1. Two predicates; the F-version is FG5/separation-discrimination with G = H = F.

*API.*
- `LimitGroup.IsResiduallyFree` (data): Residually free.
- `LimitGroup.IsFullyResiduallyFree` (data): Fully residually free.
- `LimitGroup.IsFullyResiduallyFree.isResiduallyFree` (relation): Full residual freeness implies residual freeness.
- `LimitGroup.IsFullyResiduallyFree.of_injective` (functoriality): Subgroups (injective homomorphisms into) of fully residually free groups are fully residually free.
- `LimitGroup.isFullyResiduallyFree_iff_discriminatedBy` (compatibility): IsFullyResiduallyFree G ↔ G is discriminated by FreeGroup (Fin 2) (FG5 with trivial coefficient group), for countable G.

**Checks.**
- `LimitGroup.free_prod_int_not_frf` (non-example): FreeGroup (Fin 2) × Multiplicative ℤ is residually free and not fully residually free.
- `LimitGroup.zn_frf` (computation): Multiplicative (Fin n → ℤ) is fully residually free (discriminate by maps to ℤ).
- `LimitGroup.trivial_frf` (degenerate): The trivial group is fully residually free (the condition is vacuous).
- `LimitGroup.Z2_not_rf` (non-example): ℤ/2 is not residually free (free groups are torsion-free).
- `LimitGroup.closed_surface_frf` (computation): S⁺(2, 0) is fully residually free (Baumslag), while S⁻(3, 0) (relator x² y² z²) is not even residually free: by Lyndon's theorem every homomorphism to a free group kills ⁅x, y⁆ ≠ 1.

*Examples.* F₂ × ℤ is residually free and not fully residually free (not commutative transitive). ℤⁿ and free groups are fully residually free.

*Used by.* FG8 limit groups and coordinate groups: the central class of the layer; FG10 algorithms: the promised input class of the effective algorithms; FG11: coefficient groups of the implicit function theorem.

*Source.* [LIMITS] §2.3, Definition 2.5, p. 12: Residually free and fully residually free groups; F₂ × ℤ separates the two notions.; [IFT] §2.6, p. 7: Freely discriminated groups are torsion-free CSA groups; F-discrimination for F-groups.

*Needs.* FG5.3 (G-separation and G-discrimination (residual and full residual properties)); Mathlib `IsFreeGroup`.

*Suggested home.* `TauCeti/GroupTheory/LimitGroup`, namespace `LimitGroup`.

### FG8.2 Structure of fully residually free groups

**Theorem.** Let G be fully residually free. Then: (1) G is torsion-free, commutative transitive and CSA; (2) every finitely generated subgroup is fully residually free; (3) centralizers of nontrivial elements are abelian (maximal abelian subgroups are malnormal), and, for G finitely generated, every abelian subgroup is free abelian of finite rank, so centralizers are free abelian of finite rank but need not be cyclic; (4) two elements generate 1, ℤ, ℤ² or a nonabelian free group of rank 2; (5) a nonabelian fully residually free group is a domain (FG5).

*Proof sketch.*
1. (1), (2), (4): LIMITS Proposition 3.1, by transferring finitely many relations or non-relations to a free quotient.
2. (3) Abelian subgroups embed, through discriminating maps, in centralizers of free groups (FG1/centralizer-cyclic) only for finitely many elements at a time, so they are torsion-free abelian; finite generation of abelian subgroups of finitely generated fully residually free groups uses the embedding of FG8/embedding-theorems (SUBGROUPS Lemma 20).
3. (5) FG5/domain-examples.

*Examples.* In ℤ² ∗ ℤ, a fully residually free group, the centralizer of (1,0) is ℤ²: centralizers are abelian but not cyclic. The free-group statement ‘centralizers are cyclic’ (FG1/centralizer-cyclic) fails for limit groups, as ℤ² shows.

*Source.* [LIMITS] §3.1, Proposition 3.1, pp. 4 and 20: Limit groups are torsion-free, commutative transitive, CSA and bi-orderable; finitely generated subgroups are limit groups; two-generated subgroups are 1, ℤ, ℤ² or F₂.; [SUBGROUPS] §5, Lemma 20, p. 36: Proper centralizers of finitely generated fully residually free groups are free abelian of finite rank and their ranks form a finite set.

*Needs.* FG8.1 (Residually free and fully residually free groups); FG1.19 (Maximal cyclic subgroups are malnormal; free groups are CSA); FG5.5 (CSA groups with nonabelian coefficients are domains; free groups are domains); FG1.17 (Centralizers of nontrivial elements are the cyclic groups of their maximal roots); FG8.7 (Embedding theorems and finite presentability); FG1.18 (Malnormal subgroups, CSA groups and commutation transitivity).

### FG8.3 The space of marked groups and limit groups

**Construction (`LimitGroup.MarkedGroup`).** For n ∈ ℕ, the space 𝒢_n of n-marked groups is the set of normal subgroups of FreeGroup (Fin n), topologised as a closed subset of the Cantor space Set (FreeGroup (Fin n)) = 2^{F_n} (product topology); a marked group (G, S) with S : Fin n → G generating G corresponds to the kernel of FreeGroup.lift S. A limit group is a finitely generated group G some (equivalently every) marking of which is a limit in 𝒢_n of markings of free groups.

*Construction.*
1. Topology induced from the product topology on Set (FreeGroup (Fin n)); normal subgroups form a closed, hence compact, subset.

*API.*
- `LimitGroup.MarkedGroup` (data): Normal subgroups of FreeGroup (Fin n) with the subspace topology from Set (FreeGroup (Fin n)).
- `LimitGroup.MarkedGroup.compactSpace` (instance): 𝒢_n is compact (and totally disconnected).
- `LimitGroup.MarkedGroup.ofMarking` (constructor): The point of 𝒢_n given by a generating n-tuple of a group.
- `LimitGroup.IsLimitGroup` (data): G finitely generated and some marking is a limit of markings of free groups.
- `LimitGroup.IsLimitGroup.marking_independent` (characterisation): If one marking of G is a limit of free markings then every marking is.

**Checks.**
- `LimitGroup.Z2_isLimitGroup` (computation): Multiplicative (Fin 2 → ℤ) is a limit group: the markings (ℤ, (1, k)) converge to its marking as k → ∞.
- `LimitGroup.free_isLimitGroup` (degenerate): Every free group of finite rank is a limit group (constant sequence).
- `LimitGroup.finite_not_limit` (non-example): ℤ/2 is not a limit group: its marking is isolated from free markings (a relator a² survives in a neighbourhood but holds in no nontrivial free marking).
- `LimitGroup.marked_topology_compat` (compatibility): Convergence in 𝒢_n is pointwise convergence of the indicator functions of the kernels.

*Examples.* The 2-markings (ℤ, (1, k)) of ℤ converge, as k → ∞, to the marking of ℤ² = ⟨x, y | [x, y]⟩: a fixed word dies for all large k iff both its exponent sums vanish. Finite non-trivial groups are isolated from free groups' markings and are not limit groups.

*Used by.* FG8 equivalence of definitions: the marked-limit formulation of limit groups; SELA-I §1: Sela's limit groups via limiting actions.

*Source.* [LIMITS] §2.1, Definition 2.1, p. 8, and Definition 2.4, p. 12: The set of n-marked groups as normal subgroups of F_n with the Cantor topology, compact and totally disconnected; limit groups as limits of marked free groups.

*Needs.* Mathlib `FreeGroup`; Mathlib `Subgroup.normalClosure`.

*Suggested home.* `TauCeti/GroupTheory/LimitGroup`, namespace `LimitGroup`.

### FG8.4 Limit groups are the finitely generated fully residually free groups

**Theorem.** For a finitely generated group G the following are equivalent: (1) G is a limit group (FG8/marked-groups); (2) G is fully residually free; (3) G has the same universal theory as some free group (in the language of groups without constants; as F₂ when G is nonabelian, as ℤ when G is nontrivial abelian); and, for an F-group G (F ≤ G free nonabelian, finitely generated as an F-group): (4) G is F-discriminated by F; (5) G is F-isomorphic to the coordinate group F_{R(S)} of an irreducible nonempty algebraic set over F, with S a finite system (by equational Noetherianity).

*Hypotheses.* G finitely generated; for (4)–(5), G is an F-group.

*Proof sketch.*
1. (1) ⇔ (2) ⇔ (3): LIMITS Theorem 1.1 (Propositions 3.10, 5.1, 6.5, 6.6).
2. (4) ⇔ (5): FG5/irreducible-iff-discriminated over the equationally Noetherian domain F, with G = G[X]/Rad(S) for a presentation of G over F; finiteness of S from FG5/linear-equationally-noetherian.

*Examples.* The coordinate group of [x, a] = 1 over F(a,b) is fully residually free (an extension of the centralizer of a). The coordinate group of the reducible set ⟨a⟩ ∪ ⟨b⟩ is not.

*Source.* [LIMITS] §1, Theorem 1.1 and the remark following it, p. 4: Equivalence of: limit group in Sela's sense, limit of free markings, same universal theory as a free group, subgroup of a non-standard free group, fully residually free; fully residually free groups are the coordinate groups of irreducible algebraic sets.; [IFT] §2.6, the theorems attributed to [47], [4], [19], [20], p. 7: A finitely generated F-group is F-discriminated by F iff it is F-universally equivalent to F iff it is the coordinate group of an irreducible algebraic set over F iff it F-embeds in F^{ℤ[t]}.

*Needs.* FG8.1 (Residually free and fully residually free groups); FG8.3 (The space of marked groups and limit groups); FG5.11 (Irreducibility is discrimination of the coordinate group); FG5.9 (Linear groups are equationally Noetherian; so are free groups of finite rank); FG5.3 (G-separation and G-discrimination (residual and full residual properties)).

### FG8.5 Extensions of centralizers and iterated extensions

**Construction (`LimitGroup.centralizerExt`).** For a group G, u ∈ G and n ≥ 1, the extension of the centralizer of u by ℤⁿ is G(u, ℤⁿ) := G ∗_{C_G(u)} (C_G(u) × ℤⁿ), the amalgam (Monoid.PushoutI) of G and C_G(u) × ℤⁿ along C_G(u); for n = 1 it is the HNN extension ⟨G, t | [c, t] = 1, c ∈ C_G(u)⟩. In the CSA setting u is taken not to be a proper power, so that C_G(u) is the maximal abelian subgroup containing u (cyclic when G is free). An iterated extension of centralizers (ICE group) over F is a finite chain F = G₀ < G₁ < ⋯ < G_m with G_{i+1} = G_i(u_i, ℤ^{n_i}).

*Construction.*
1. Defined through Monoid.PushoutI with the two inclusions; the HNN description through HNNExtension with A = B = C_G(u) and φ = id.

*API.*
- `LimitGroup.centralizerExt` (constructor): G(u, ℤⁿ) as Monoid.PushoutI.
- `LimitGroup.centralizerExt.of_injective` (characterisation): G embeds in G(u, ℤⁿ) (Mathlib's PushoutI.of_injective).
- `LimitGroup.centralizerExt.lift` (universal-property): Homomorphisms out of G(u, ℤⁿ) are pairs (φ on G, commuting tuple in the centralizer of φ(C_G(u))).
- `LimitGroup.centralizerExt.retraction` (projection): For k ∈ ℤⁿ, the G-homomorphism t_i ↦ u^{k_i} (a retraction onto G).
- `LimitGroup.ICE` (structure): Iterated extensions of centralizers over F as finite chains.

**Checks.**
- `LimitGroup.centralizerExt_Z` (computation): centralizerExt (Multiplicative ℤ) (ofAdd 1) ℤ ≅ ℤ² (the centralizer of a generator of ℤ is ℤ).
- `LimitGroup.centralizerExt_free` (computation): centralizerExt F(a,b) a ℤ ≅ ⟨a, b, t | [a, t] = 1⟩.
- `LimitGroup.centralizerExt_proper_power` (non-example): Extending the centralizer of a² in F(a,b) with the centralizer taken as ⟨a²⟩ instead of C(a²) = ⟨a⟩ gives a group in which a and t do not commute but a² and t do; it is not CSA, so the construction must use the full centralizer.
- `LimitGroup.centralizerExt_trivial_n` (degenerate): For n = 0, G(u, ℤ⁰) = G.

*Examples.* F(a,b)(a, ℤ) = F(a,b) ∗_{⟨a⟩} (⟨a⟩ × ⟨t⟩) ≅ ⟨a, b, t | [a, t] = 1⟩. ℤ(1, ℤ) = ℤ².

*Used by.* FG8 embedding theorems: ICE groups receive embeddings of limit groups; FG8 NTQ systems: centralizer-extension levels of NTQ systems; FG10 centralizer and conjugacy algorithms: SUBGROUPS Lemma 21 inducts over the chain; FG9 F^{ℤ[t]}: F^{ℤ[t]} is the union of a countable chain of extensions of centralizers.

*Source.* [IFT] §2.5, pp. 6–7: The extension G(u, t) of the centralizer of a non-proper-power u in a non-abelian CSA group, discriminated into G by the maps t ↦ u^k.; [SUBGROUPS] §5, p. 36: Centralizer extensions H(u, s) = H ∗_⟨u⟩ (⟨u⟩ × ⟨s⟩) and chains of them.; [VAR-I] §1, Definition 5, p. 5, and Lemma 5, p. 7: Free extensions of centralizers K(u, t) = ⟨K, t | [C(u), t] = 1⟩ (Definition 5); a group obtained from a CSA group by a sequence of free extensions of centralizers embeds in G^{ℤ[x]} (Lemma 5).

*Needs.* Mathlib `Monoid.PushoutI`; Mathlib `HNNExtension`; Mathlib `Subgroup.centralizer`; FG4.5 (One-edge graphs of groups are Mathlib's amalgams and HNN extensions); FG1.18 (Malnormal subgroups, CSA groups and commutation transitivity).

*Suggested home.* `TauCeti/GroupTheory/LimitGroup`, namespace `LimitGroup`.

### FG8.6 Extensions of centralizers are discriminated by the base group

**Theorem.** Let G be a nonabelian CSA group with the big powers property (in particular a nonabelian fully residually free group) and u ∈ G not a proper power. Then G(u, ℤ) is G-discriminated by G by the retractions ξ_k : t ↦ u^k for k large: for every w ∈ G(u, ℤ) there is N_w with ξ_k(w) ≠ 1 for all k ≥ N_w when w ≠ 1. Consequently every ICE group over F is F-discriminated by F (fully residually free), and so is G[X] for G nonabelian CSA with the big powers property.

*Hypotheses.* G nonabelian, CSA, big powers (BP); u not a proper power.

*Proof sketch.*
1. Write w in normal form for the amalgam (FG4/normal-form-theorem) and apply big powers to the alternating product g₀ u^{k m₁} g₁ ⋯ (IFT §2.5, Theorem of [40]).

*Examples.* In ⟨a, b, t | [a, t]⟩, w = [b, t] maps to [b, a^k] ≠ 1 for k ≥ 1.

*Source.* [IFT] §2.5, the theorem of [40], pp. 6–7: For a nonabelian CSA BP-group, the maps t ↦ u^k discriminate G(u, t) into G; G[X] G-embeds into G(u, t).; [VAR-II] §0, Lemma 2 and Theorem 1, p. 4: Groups obtained by free extensions of centralizers embed in G^{ℤ[x]} and are discriminated by G.

*Needs.* FG8.5 (Extensions of centralizers and iterated extensions); FG4.3 (Normal form theorem and injectivity of vertex groups); FG8.1 (Residually free and fully residually free groups); FG5.5 (CSA groups with nonabelian coefficients are domains; free groups are domains); FG1.18 (Malnormal subgroups, CSA groups and commutation transitivity).

### FG8.7 Embedding theorems and finite presentability

**Theorem.** (1) (Kharlampovich–Myasnikov) A finitely generated group is fully residually free if and only if it embeds in Lyndon's group F^{ℤ[x]}; equivalently it embeds in an iterated extension of centralizers over a free group of finite rank. (2) Every finitely generated residually free group embeds in a direct product of finitely many fully residually free groups. (3) Every finitely generated fully residually free group is finitely presented, and so is every finitely generated subgroup of it (they are themselves fully residually free). (4) Every finitely generated subgroup of an ICE group over F is built from free abelian groups of finite rank by finitely many free products, amalgams over abelian groups one of which is maximal abelian, free extensions of centralizers, and separated HNN extensions with abelian associated subgroups one of which is maximal abelian.

*Proof sketch.*
1. (1) VAR-II Theorems 3–4: irreducible coordinate groups embed in coordinate groups of nondegenerate TQ systems, which embed in ICE groups (VAR-II Theorem 1), and conversely ICE groups are discriminated (FG8/centralizer-extension-discriminated).
2. (2) VAR-II Corollary 2, via FG5/noetherian-components (the coordinate group embeds in the product over the irreducible components).
3. (3)–(4) VAR-II Theorem 6 and Corollary 3 (structure of finitely generated subgroups of ICE groups by induced splittings, FG4).

*Examples.* The closed surface group S⁺(2, 0) embeds in an ICE group over F₂. F₂ × F₂ (residually, not fully residually free) embeds in a product of two fully residually free groups, as (2) allows.

*Source.* [VAR-II] §0, Theorems 1, 3, 4, 6 and Corollaries 2–3, pp. 4–5: Nondegenerate TQ systems have coordinate groups in ICE groups; a finitely generated group is fully residually free iff it embeds in F^{ℤ[x]}; residually free groups embed in finite products; the structure of finitely generated subgroups of ICE groups and finite presentability.; [LIMITS] §4, Theorem 4.2, p. 30: First characterisation: limit groups are exactly the finitely generated subgroups of iterated extensions of centralizers of free groups.; [SUBGROUPS] §2.3, Theorems 1–2, p. 6: Effective versions: from a finite presentation one constructs the embedding into F^{ℤ[t]} and into an ICE group.

*Needs.* FG8.5 (Extensions of centralizers and iterated extensions); FG8.6 (Extensions of centralizers are discriminated by the base group); FG8.4 (Limit groups are the finitely generated fully residually free groups); FG5.10 (Noetherian Zariski topology and irreducible components); Mathlib `Group.IsFinitelyPresented`.

### FG8.8 Triangular quasi-quadratic and NTQ systems

**Definition (`LimitGroup.NTQ.System`).** Over a group G, a triangular quasi-quadratic (TQ) system is a finite system S = S₁ ∪ ⋯ ∪ S_n in disjoint tuples of variables X₁, …, X_n where each S_i(X_i, …, X_n, G) is of one of the types: (1) a standard quadratic equation in X_i with coefficients in G_{i+1} := G_{R(S_{i+1}, …, S_n)} (quadratic level); (2) commutation equations [x, y] = 1, [x, u] = 1 for x, y ∈ X_i and u in a finite set U_i ⊆ G_{i+1} generating a centralizer of G_{i+1} (centralizer-extension level; IFT Definition 43 and LIFT use a single word u whose image in G_{i+1} is not a proper power, which gives the same level in the CSA groups G_{i+1} that occur); (3) [x, y] = 1 for x, y ∈ X_i (free abelian level); (4) the empty system (free level). With G_{n+1} := G, S is nondegenerate (NTQ) when each S_i = 1 has a solution in G_{i+1} (with X_{i+1}, … as constants). The coordinate group G_{R(S)} of an NTQ system is an NTQ group. An NTQ system is regular when each level is of type (1) with S_i in standard form and regular (FG6/regular-quadratic) or of type (4).

*Construction.*
1. A structure listing the levels with their types and coefficient data; nondegeneracy as a Prop referring to FG5 coordinate groups of the lower levels.

*API.*
- `LimitGroup.NTQ.System` (structure): Levels with their types (quadratic, centralizer, abelian, free) and coefficients.
- `LimitGroup.NTQ.levelGroup` (data): G_i := coordinate group of S_i ∪ ⋯ ∪ S_n.
- `LimitGroup.NTQ.IsNondegenerate` (data): Each level has a solution in the next coordinate group.
- `LimitGroup.NTQ.IsRegular` (data): Every level regular quadratic or empty.
- `LimitGroup.NTQ.inclusion` (projection): The G-homomorphisms G_{i+1} → G_i (injective for NTQ systems).
- `LimitGroup.NTQ.retraction` (projection): A solution of S_i in G_{i+1} gives a retraction G_i → G_{i+1}.

**Checks.**
- `LimitGroup.NTQ.genus2` (computation): The one-level system [x₁,y₁][x₂,y₂] = 1 over F(a,b) is regular NTQ.
- `LimitGroup.NTQ.empty` (degenerate): The system with one empty level in X has NTQ group F ∗ F(X) = F[X].
- `LimitGroup.NTQ.lyndon_not_regular` (non-example): The level x₁² x₂² x₃² = 1 is nondegenerate (trivial solution) but not regular: regular NTQ is a proper subclass, and FG11 applies only to it.
- `LimitGroup.NTQ.degenerate_example` (non-example): The level [x, y] = a over F(a,b) has no solution (a is not a commutator: its image in the abelianisation is nonzero), so a system containing it is degenerate and not NTQ.

*Examples.* The one-level system [x₁,y₁][x₂,y₂] = 1 over F is a regular NTQ system with NTQ group F ∗ S⁺(2, 0). The system [x, a] = 1 over F is NTQ of type (2) with NTQ group F(a, ℤ).

*Used by.* FG8 NTQ coordinate groups: NTQ groups are fully residually free; FG10 Makanin–Razborov diagrams: fundamental sequences end in NTQ systems (IFT Theorem 6); FG11 implicit function theorem: regular NTQ systems.

*Source.* [IFT] §7.6, the definition of TQ, NTQ and regular NTQ systems, p. 137: Triangular quasi-quadratic systems with quadratic, centralizer, abelian and empty levels; non-degenerate when each level has a solution in the coordinate group of the lower levels; regular when every level is a regular standard quadratic equation or empty.; [VAR-II] §0, Definition 8, p. 4: Triangular quasi-quadratic systems and nondegeneracy.

*Needs.* FG6.5 (Quadratic words, standard quadratic equations and their solutions); FG6.7 (Regular standard quadratic equations); FG5.2 (Algebraic sets, radicals and coordinate groups); FG8.5 (Extensions of centralizers and iterated extensions).

*Suggested home.* `TauCeti/GroupTheory/LimitGroup`, namespace `LimitGroup`.

### FG8.9 NTQ groups: radicals, discrimination and level maps

**Theorem.** Let S be an NTQ system over a fully residually free group G. Then: (1) R(S) = ncl(S) when every quadratic level is regular (and in general R(S) is computed level by level by FG6/quadratic-radicals); (2) G_{R(S)} is G-discriminated by G, hence V(S) is irreducible; (3) each G_{i+1} → G_i is injective and G_i is obtained from G_{i+1} by attaching a QH vertex (type 1), extending a centralizer (type 2), a free abelian free factor (type 3) or a free factor (type 4); (4) G_{R(S)} embeds in an ICE group over G. Specialisations: every solution of S in G factors through the retractions of FG8/ntq-system level by level after composing with automorphisms of the levels.

*Hypotheses.* S nondegenerate (NTQ); G fully residually free.

*Proof sketch.*
1. Induction on the number of levels using FG6/regular-quadratic-coordinate-group, FG8/centralizer-extension-discriminated and VAR-I Theorem 2 (nondegenerate TQ systems over fully residually free groups have coordinate groups embedding in ICE groups).

*Examples.* For [x₁,y₁][x₂,y₂] = 1 over F, G_{R(S)} = F ∗ S⁺(2, 0) is F-discriminated by F.

*Source.* [VAR-I] §1, Theorem 2 and Corollary 1, pp. 7–8: If S is a nondegenerate TQ system over a fully residually free group G, G_{R(S)} is a subgroup of a group obtained from G by free extensions of centralizers; the algebraic set is irreducible.; [VAR-II] §0, Theorem 1 and Corollary 1, p. 4: The same statements as recalled in part II.; [IFT] §7.6, p. 137: NTQ groups and regular NTQ systems.

*Needs.* FG8.8 (Triangular quasi-quadratic and NTQ systems); FG6.9 (Coordinate groups of regular quadratic equations as surface amalgams); FG8.6 (Extensions of centralizers are discriminated by the base group); FG8.7 (Embedding theorems and finite presentability); FG5.11 (Irreducibility is discrimination of the coordinate group).

### Dependencies

Within this roadmap: FG4, FG5, FG6, FG7. Libraries: Mathlib only (see the supplier contracts). Other roadmaps: none.

## Layer FG9: Length functions and infinite-word representations

Lyndon length functions with values in ordered abelian groups, freeness and regularity as separate properties, actions on Λ-trees, infinite words and Lyndon's group F^{ℤ[t]}; the free ℤⁿ-length functions of limit groups, and graphs labelled by infinite words for subgroup algorithms. Computations act only on finite data.

*Targets of the layer.* Lyndon length functions with values in an ordered abelian group Λ (axioms on the Gromov product), free and regular length functions as separate properties, and their correspondence with based Λ-tree actions; the lexicographically ordered ℤ^n and ℤ[t]; infinite words R(Λ, X) with partial multiplication, cyclic decompositions and the free Lyndon length function on CDR(Λ, X); Lyndon's group F^{ℤ[t]} represented by infinite ℤ[t]-words; embeddings of finitely generated fully residually free groups into F^{ℤ[t]} and the resulting free length functions in ℤ^n, with regularity obtained after an enlargement where the source requires one; (ℤ[t], X)-labelled graphs of finitely generated subgroups, U-folding, and the membership problem, with all computations on the finite data of the representation.

### FG9.1 Lyndon length functions: free and regular

**Definition (`LyndonLength`).** Let Λ be an ordered abelian group and G a group. A Lyndon length function is l : G → Λ with (L1) l(1) = 0; (L2) l(g⁻¹) = l(g); (L3) c(g, f) > c(g, h) → c(g, h) = c(f, h) for all g, f, h, where the Gromov product c(g, f) = ½(l(g) + l(f) − l(g⁻¹ f)) is taken in the divisible hull Λ ⊗ ℚ. It is free when moreover (L4) c(g, f) ∈ Λ for all g, f and (L5) l(g²) > l(g) for g ≠ 1; it is regular when (L6) for all g, f there are u, g₁, f₁ with g = u ∘ g₁, f = u ∘ f₁ and l(u) = c(g, f), where x = y ∘ z means x = y z and l(x) = l(y) + l(z). Freeness and regularity are independent properties.

*Construction.*
1. A structure with a function to Λ and the axioms; Gromov products valued in the divisible hull (Mathlib's ℚ-module of a torsion-free abelian group, or Λ ⊗ ℚ).

*API.*
- `LyndonLength` (structure): A Lyndon length function G → Λ.
- `LyndonLength.gromov` (data): c(g, f) in the divisible hull of Λ.
- `LyndonLength.IsFree` (data): (L4) and (L5).
- `LyndonLength.IsRegular` (data): (L6).
- `LyndonLength.le_add` (relation): l(g f) ≤ l(g) + l(f) and 0 ≤ c(g, f) ≤ min(l(g), l(f)).
- `LyndonLength.comap` (functoriality): Restriction along an injective homomorphism is a Lyndon length function, free if the original is.

**Checks.**
- `LyndonLength.freeGroup_norm` (compatibility): FreeGroup.norm (Mathlib, ℕ-valued), cast to ℤ, is a free regular Lyndon length function with values in ℤ.
- `LyndonLength.zero` (degenerate): l ≡ 0 is a Lyndon length function on any group, free only on the trivial group.
- `LyndonLength.torsion_not_free` (non-example): On ℤ/2 the function l(1) = 0, l(g) = 1 for g ≠ 1 is a Lyndon length function failing (L5): it is not free (l(g²) = 0).
- `LyndonLength.Z2_lex` (computation): On ℤ² with Λ = Lex (Fin 2 → ℤ), l(g) = |g| (absolute value for the lexicographic order) is a free regular Lyndon length function: ℤ² acts freely on the Λ-tree Λ by translations.

*Examples.* The word length on FreeGroup α is a free regular ℤ-valued Lyndon length function. The function l ≡ 0 on ℤ is a Lyndon length function that is not free.

*Used by.* FG9 infinite words: infinite words carry the standard free length function; FG9 embedding theorems: free ℤⁿ-length functions on limit groups; FG10 subgroup algorithms: Nielsen cancellation for the length function on F^{ℤ[t]}.

*Source.* [LENGTH] §2.1–§2.2, axioms (L1)–(L6) and Example 1, pp. 4–5: Lyndon length functions, the Gromov product c(g, f), free length functions (L4)–(L5), regular length functions (L6); word length on a free group is free and regular.; [MRS-REGULAR] §2, pp. 3–8: Lyndon length functions with values in ordered abelian groups and their properties.

*Needs.* Mathlib `FreeGroup.norm`; Mathlib `Lex`; Mathlib `FreeGroup`.

*Suggested home.* `TauCeti/GroupTheory/LengthFunction`, namespace `LyndonLength`.

### FG9.2 Λ-metric spaces, Λ-trees and free actions

**Definition (`LambdaTree.MetricSpace`).** Let Λ be an ordered abelian group. A Λ-metric space is a nonempty set X with d : X × X → Λ such that d(x, y) ≥ 0, d(x, y) = 0 iff x = y, d(x, y) = d(y, x) and d(x, y) ≤ d(x, z) + d(z, y). A segment is the image of an isometry from an interval [a, b] of Λ; X is geodesic when any two points are the endpoints of a segment. A Λ-tree is a geodesic Λ-metric space in which (T2) two segments meeting in a single common endpoint have a segment as union and (T3) two segments with a common endpoint intersect in a segment. A group G acts on a Λ-tree by isometries; an isometry g is elliptic if it fixes a point, an inversion if g² fixes a point and g does not, and hyperbolic otherwise; the action is free (and without inversions) when every g ≠ 1 is hyperbolic. For a base point x, l_x(g) = d(x, g x) is the based length function of the action.

*Hypotheses.* Λ an ordered abelian group (a linear order compatible with addition).

*Construction.*
1. Structures for Λ-metric spaces and the tree axioms (T1)–(T3), segments as images of isometries from intervals of Λ, and the elliptic/inversion/hyperbolic trichotomy of isometries (KMS-ACTIONS §§4.2–4.3).
2. Every Λ-tree is 0-hyperbolic and its Gromov products (x · y)_v lie in Λ (KMS-ACTIONS Lemma 8, p. 26), which is what makes l_x a Lyndon length function satisfying (L4).

*API.*
- `LambdaTree.MetricSpace` (structure): A Λ-valued metric satisfying (M1)–(M4).
- `LambdaTree` (structure): A geodesic Λ-metric space satisfying (T2) and (T3).
- `LambdaTree.segment` (data): The segment [x, y], unique in a Λ-tree.
- `LambdaTree.gromov_mem` (characterisation): In a Λ-tree, d(x, v) + d(y, v) − d(x, y) ∈ 2Λ, so Gromov products lie in Λ, and the space is 0-hyperbolic.
- `LambdaTree.IsHyperbolic` (data): An isometry with no fixed point and no fixed point of its square.
- `LambdaTree.IsFreeAction` (data): Every nontrivial group element acts as a hyperbolic isometry.
- `LambdaTree.basedLength` (constructor): l_x(g) = d(x, g x) for a base point x.
- `LambdaTree.ofSerreTree` (compatibility): The vertex set of a Serre tree (FG2/serre-graph) with the path metric is a ℤ-tree, and every ℤ-tree arises this way.

**Checks.**
- `LambdaTree.self` (computation): Λ itself with d(a, b) = |a − b| is a Λ-tree; ℤ acts freely on the ℤ-tree ℤ by translations.
- `LambdaTree.point` (degenerate): A one-point space is a Λ-tree, on which every isometry is elliptic, so only the trivial group acts freely on it.
- `LambdaTree.circle_not_tree` (non-example): The vertex set of a cycle of length 4 with the path metric is a geodesic ℤ-metric space but not a ℤ-tree: two segments between opposite vertices meet only in their endpoints, so (T3) fails; a definition asking only for geodesics would accept it.
- `LambdaTree.reflection_inversion` (non-example): On the ℤ-tree ℤ, the isometry n ↦ 1 − n is an inversion (no fixed point, its square is the identity), so an action of ℤ/2 by it is not free without inversions.
- `LambdaTree.cayley_compat` (compatibility): For the Cayley tree of FreeGroup α (a ℤ-tree) and the base point 1, the based length function is Mathlib's FreeGroup.norm.

*Examples.* Λ with d(a, b) = |a − b| is a Λ-tree, and so is every convex subset of Λ (KMS-ACTIONS Example 9). A ℤ-metric space is a ℤ-tree iff it is the vertex set of a simplicial tree with the path metric (KMS-ACTIONS Example 10), which links ℤ-trees to the Serre trees of FG2.

*Used by.* FG9/length-functions-and-trees: free Λ-valued length functions are the based length functions of free actions on Λ-trees; FG9/lyndon-group-infinite-words and VAR-II Corollary 6: finitely generated fully residually free groups act freely on ℤⁿ-trees; FG4 Bass–Serre theory: for Λ = ℤ, Λ-trees are the simplicial trees of the Bass–Serre theory.

*Source.* [KMS-ACTIONS] §4.2, pp. 25–26 (axioms (M1)–(M4), segments, (T1)–(T3), Examples 9–10, Lemma 8); §4.3, pp. 26–28 (elliptic, inversion, hyperbolic, axis and translation length, Theorem 6); §4.4, p. 28 (Λ-free groups): Λ-metric spaces and Λ-trees, the classification of isometries of a Λ-tree, and free actions (every nontrivial element hyperbolic); ℤ-trees are simplicial trees.; [LENGTH] §2.1, Theorem 1, p. 5: Free Lyndon length functions with values in A correspond to free actions on A-trees (Chiswell), which is the use made of Λ-trees in this layer.

*Needs.* Mathlib `Lex`; FG2.1 (Serre graphs: graphs with edge reversal, loops and multiple edges); FG4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees).

*Suggested home.* `TauCeti/Topology/LambdaTree`, namespace `LambdaTree`.

### FG9.3 Length functions and actions on Λ-trees

**Theorem.** For an ordered abelian group Λ, a group G has a free Lyndon length function with values in Λ if and only if G acts freely on a Λ-tree; the length function is l(g) = d(x, g x) for a base point x. For Λ = ℤ, Λ-trees are the simplicial (Serre) trees of FG2 with their path metric, and a free action without inversions on such a tree corresponds to a free ℤ-valued length function.

*Proof sketch.*
1. From an action, l(g) = d(x, g x) satisfies (L1)–(L5) (free action: no fixed points and no inversions).
2. Conversely Chiswell's construction builds a Λ-tree from the length function (LENGTH Theorem 1 citing Chiswell).

*Examples.* F(a,b) acting on its Cayley tree gives the word length.

*Source.* [LENGTH] §2.1, Theorem 1, p. 5: A group has a free Lyndon length function with values in A iff it acts freely on an A-tree (Chiswell).; [MRS-REGULAR] §2, pp. 3–8: Λ-trees and the correspondence with length functions.; [KMS-ACTIONS] §5, pp. 34–36: The based length function l_x(g) = d(x, g x) of an action on a Λ-tree is a Lyndon length function; free actions give free length functions, and Chiswell's construction goes back.

*Needs.* FG9.1 (Lyndon length functions: free and regular); FG9.2 (Λ-metric spaces, Λ-trees and free actions); FG4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees); FG2.1 (Serre graphs: graphs with edge reversal, loops and multiple edges).

### FG9.4 Infinite words over an ordered abelian group

**Construction (`InfWord`).** Let Λ be a discretely ordered abelian group (least positive element 1) and X a set. An infinite (Λ-)word is a function w : [1, α_w] → X^{±1} on the interval [1, α_w] = {β ∈ Λ | 1 ≤ β ≤ α_w}, α_w ≥ 0, with |w| := α_w; it is reduced when w(β + 1) ≠ w(β)⁻¹. R(Λ, X) is the set of reduced Λ-words with the partial multiplication u ∗ v (defined when the maximal common initial segment com(u⁻¹, v) exists, removing it), and inversion. CDR(Λ, X) is the subset of words admitting a cyclic decomposition c⁻¹ ∘ v ∘ c with v cyclically reduced. For Λ = ℤ, R(ℤ, X) is the set of reduced words and ∗ is the multiplication of FreeGroup X.

*Construction.*
1. Words as functions on intervals of Λ; ∗ defined when the cancellation segment is an interval with a maximal element (MRS-REGULAR §3).

*API.*
- `InfWord` (structure): Reduced Λ-words: a length α and a function on [1, α] with no cancelling adjacent letters.
- `InfWord.mul` (data): The partial product u ∗ v.
- `InfWord.inv` (data): w⁻¹(β) = w(α_w + 1 − β)⁻¹.
- `InfWord.CDR` (data): Words with a cyclic decomposition c⁻¹ ∘ v ∘ c.
- `InfWord.length_isLyndon` (characterisation): On any subgroup of CDR(Λ, X), w ↦ |w| is a free Lyndon length function (MRS-REGULAR Corollary 4.2).
- `InfWord.equivFreeGroup` (compatibility): For Λ = ℤ, the reduced words with ∗ form a group isomorphic to FreeGroup X, with |·| = FreeGroup.norm.

**Checks.**
- `InfWord.ZFreeGroup` (compatibility): For Λ = ℤ and X = Fin 2, InfWord ℤ X ≃ FreeGroup (Fin 2) as groups, matching toWord.
- `InfWord.empty` (degenerate): The empty word (α = 0) is the identity for ∗.
- `InfWord.at_mul_a` (computation): In R(ℤ[t], {a, b}), a^t ∗ a = a^{t+1} and |a^t ∗ b| = t + 1.
- `InfWord.undefined_product` (non-example): In R(ℤ[t], {a, b}) let v be the word on [1, t] that is a at the integers 1, 2, 3, … and b at the other elements of [1, t]; the common initial segment of a^t and v is {1, 2, 3, …}, which has no largest element, so (a^t)⁻¹ ∗ v is undefined: ∗ is genuinely partial, and R(Λ, X) is not a group.

*Examples.* For Λ = ℤ[t] with t ≫ 1, the word a^t (the constant function a on [1, t]) is an infinite word of length t; a^t ∗ a = a^{t+1}. R(ℤ, X) with ∗ is FreeGroup X via toWord.

*Used by.* FG9 F^{ℤ[t]}: elements of Lyndon's group are infinite ℤ[t]-words; FG9 infinite-word graphs: edge labels of (ℤ[t], X)-graphs; FG10 algorithms in limit groups: standard decompositions of elements as infinite words.

*Source.* [MRS-REGULAR] §3, Theorem 3.4, p. 10; §4, Theorem 4.1 and Corollary 4.2, p. 14: Reduced A-words with partial multiplication form a pregroup; on CDR(A, X) the length is a free Lyndon length function, inherited by every subgroup.; [LENGTH] §2.3, Theorems 2–4 and Corollary 1, p. 9: Infinite words and length functions: subgroups of CDR(A, X) have free length functions (Theorem 2); a group with a free length function in a discretely ordered A embeds length-preservingly in CDR(A, X) (Theorem 3), for arbitrary A after passing to ℤ ⊕ A (Corollary 1), and a free regular length function embeds in R(A′, X) with regular induced length (Theorem 4).

*Needs.* Mathlib `Lex`; Mathlib `FreeGroup`.

*Suggested home.* `TauCeti/GroupTheory/InfiniteWords`, namespace `InfWord`.

### FG9.5 Lyndon's group F^{ℤ[t]} as infinite words, and free length functions on limit groups

**Theorem.** (1) Lyndon's free ℤ[t]-group F^{ℤ[t]} (the union of the chain of extensions of centralizers of FG8/centralizer-extension over F = F(X) adjoining ℤ[t]-exponents) embeds in CDR(ℤ[t], X), and the induced length L(w) = |w| is a free regular Lyndon length function with values in ℤ[t] ordered with t ≫ 1. (2) Consequently every finitely generated fully residually free group has a free Lyndon length function with values in ℤⁿ with the lexicographic order, for some n (restrict to the finitely generated subgroup, whose lengths lie in a finitely generated subgroup ℤⁿ of ℤ[t]). (3) Regularity is not inherited by subgroups: a finitely generated subgroup of F^{ℤ[t]} has a free length function that need not be regular; LENGTH shows every group acting freely on a ℤⁿ-tree embeds isometrically in a group acting freely and regularly on a ℤᵐ-tree (an enlargement), and a finitely generated group with a free regular ℤⁿ-length function is the union of a finite chain G₁ < ⋯ < G_n = G with G₁ free of finite rank and each G_{i+1} obtained from G_i by finitely many HNN extensions associating cyclically reduced centralizers by length-preserving isomorphisms (LENGTH Theorem 7).

*Proof sketch.*
1. (1) MRS-REGULAR §§5–7: Lyndon's exponentiation on CDR(ℤ[t], X) (Theorem 5.5) and the embedding of each extension of centralizers (Theorems 6.15, 6.17) into CDR, with regularity of the length.
2. (2) FG8/embedding-theorems with (1).
3. (3) LENGTH, introduction (the second paper of the series) and Theorems 6–7 for the structure of regular ℤⁿ-free groups.

*Examples.* The ICE group ⟨a, b, t | [a, t]⟩ acts freely on a ℤ²-tree: t ↦ a^t in F^{ℤ[t]} has length t. A closed surface group S⁺(2, 0) has a free ℤⁿ-length function for some n (it is fully residually free).

*Source.* [MRS-REGULAR] Abstract and §1; §5, Theorem 5.5; §6, Theorems 6.15 and 6.17; §7, pp. 1–32: F^{ℤ[t]} is represented by infinite ℤ[t]-words with a free regular Lyndon length function; every finitely generated fully residually free group has a free length function in ℤⁿ.; [LENGTH] §1, p. 4, and §4.3, Theorems 6–7, pp. 20–21: Groups acting freely on ℤⁿ-trees embed in groups acting freely and regularly on ℤᵐ-trees; finitely generated groups with a free regular ℤⁿ-length function are iterated HNN extensions of a free group along centralizers.; [VAR-II] §0, Corollary 6, p. 6: Every finitely generated fully residually free group acts freely on a ℤⁿ-tree with the lexicographic order.

*Needs.* FG9.4 (Infinite words over an ordered abelian group); FG9.1 (Lyndon length functions: free and regular); FG8.5 (Extensions of centralizers and iterated extensions); FG8.7 (Embedding theorems and finite presentability); FG9.3 (Length functions and actions on Λ-trees).

### FG9.6 (ℤ[t], X)-labelled graphs of finitely generated subgroups

**Construction (`InfWord.Graph`).** A (ℤ[t], X)-graph is a finite graph whose edges are labelled by infinite words of R(ℤ[t], X) given by finite data (standard decompositions: products of ordinary words and powers u^{f(t)} of cyclically reduced words with polynomial exponents), with edge reversal inverting labels. For finitely many elements h₁, …, h_k of F^{ℤ[t]} given by standard decompositions, a U-folded (ℤ[t], X)-graph Γ with base vertex v and L(Γ, v) = ⟨h₁, …, h_k⟩ is constructed by U-folding (folding of edges whose labels share an initial segment, with the finite data updated); product graphs compute intersections. All computations act on the finite data, never on infinite words as such.

*Construction.*
1. Generalise FG2/folding to labels in R(ℤ[t], X): fold along the longest common initial segment com(u, v) of two labels at the same vertex, which is computable from standard decompositions (MRS-REGULAR §8).

*API.*
- `InfWord.Graph` (structure): Finite graphs labelled by finitely described ℤ[t]-words.
- `InfWord.Graph.ofGens` (constructor): The U-folded graph of finitely many standard decompositions.
- `InfWord.Graph.accepts` (characterisation): L(ofGens hs, v) = Subgroup.closure hs.
- `InfWord.Graph.prod` (constructor): Product graphs, with L(Γ₁ × Γ₂, (v₁, v₂)) = L(Γ₁, v₁) ∩ L(Γ₂, v₂).
- `InfWord.Graph.compat_stallings` (compatibility): For words of ℤ-length, ofGens is FG2's stallingsGraph.

**Checks.**
- `InfWord.Graph.single_loop` (computation): ofGens [a^t b] is one loop labelled a^t b.
- `InfWord.Graph.empty` (degenerate): ofGens [] is a single vertex with L = ⊥.
- `InfWord.Graph.compat_stallings_test` (compatibility): For the ordinary words [a b, a c], ofGens agrees with stallingsGraph.
- `InfWord.Graph.no_infinite_input` (non-example): An arbitrary function [1, t] → X^{±1} without a finite standard decomposition is not an admissible input: the algorithms are stated for finitely described words only.

*Examples.* For H = ⟨a^t b⟩ the graph is a single loop labelled a^t b. For Λ = ℤ the construction is the Stallings graph of FG2/stallings-graph-procedure.

*Used by.* FG10 membership, intersection and conjugacy in limit groups: SUBGROUPS Theorems 4–11 run on these graphs; FG2 analogy: Stallings graphs are the case Λ = ℤ.

*Source.* [SUBGROUPS] §2.4 and Proposition 5, pp. 6–10; §3, Definitions 1–2, Corollaries 1–2, Lemma 10, Theorems 4–5, pp. 10–15: (ℤ[t], X)-labelled graphs, U-folded graphs with L(Γ, v) = ⟨h₁, …, h_k⟩, the membership problem, product graphs and intersections.; [MRS-REGULAR] §8, Proposition 8.3 and Corollaries 8.4, 8.6, pp. 34–36: Effective conversion between representations of elements of F^{ℤ[t]}, effective lengths and cyclic decompositions.; [INFINITE-WORDS] the paper as cited in SUBGROUPS §2.4: The original construction of graphs labelled by infinite words (not read).

*Needs.* FG9.4 (Infinite words over an ordered abelian group); FG9.5 (Lyndon's group F^{ℤ[t]} as infinite words, and free length functions on limit groups); FG2.3 (α-labelled graphs (X-digraphs) and the subgroup they accept); FG2.4 (Stallings folds and their termination); FG2.6 (The Stallings graph of a finitely generated subgroup).

*Suggested home.* `TauCeti/GroupTheory/InfiniteWords/Graph`, namespace `InfWord.Graph`.

### FG9.7 Membership and intersections for finitely generated subgroups of F^{ℤ[t]}

**Theorem.** For finitely many elements g, h₁, …, h_k of F^{ℤ[t]} given by standard decompositions, it is decidable (by a computable procedure on the finite data) whether g ∈ ⟨h₁, …, h_k⟩, and generators of ⟨h₁, …, h_k⟩ ∩ ⟨g₁, …, g_m⟩ are computable; in particular finitely generated subgroups of F^{ℤ[t]}, and of finitely generated fully residually free groups, have the Howson property.

*Proof sketch.*
1. Read g along the U-folded graph (SUBGROUPS Proposition 5); for intersections use the product graph (SUBGROUPS Theorem 4 and Corollary 3; Theorem 6 for fully residually free groups via the embedding of SUBGROUPS Theorem 3).

*Examples.* a^{2t} ∈ ⟨a^t⟩ and a^{t+1} ∉ ⟨a^t⟩.

*Source.* [SUBGROUPS] §2.4, Proposition 5, p. 10; §3, Theorems 4–6 and Corollaries 3–4, pp. 14–16: Solvable membership problem in finitely generated subgroups of F^{ℤ[t]}; effective intersections; Howson property for finitely generated fully residually free groups.

*Needs.* FG9.6 ((ℤ[t], X)-labelled graphs of finitely generated subgroups); FG2.11 (Intersections: product graphs and the Howson property).

### Dependencies

Within this roadmap: FG2, FG4, FG8. Libraries: Mathlib only (see the supplier contracts). Other roadmaps: none.

## Layer FG10: Effective structure and finite solution diagrams

JSJ theory for finitely generated fully residually free groups (existence first), then promised-input algorithms: embeddings, finite presentations of subgroups, membership, intersection, centralizer and conjugacy algorithms, mono- and epimorphism tests, effective Grushko and JSJ decompositions, Makanin–Razborov diagrams with soundness and completeness, and effective irreducible components. Equations over a represented limit group are a separate target with its own proof route.

*Targets of the layer.* Relative abelian and cyclic JSJ theory for finitely generated fully residually free groups: the admissible splitting family, universally elliptic trees, JSJ trees and the JSJ deformation space, rigid and flexible vertices, existence for finitely presented groups and for torsion-free CSA groups, and the description of flexible vertices of limit groups as abelian or QH; promised-input algorithms (input: a finite presentation of a finitely generated fully residually free group, or the coordinate group of a finite system over F) computing the embedding into an iterated centralizer extension, the relative Grushko and abelian JSJ decompositions with explicit vertex groups, edge maps and embedding data, finite presentations of finitely generated subgroups, membership, intersection, centralizer and conjugacy algorithms, and tests of injectivity and surjectivity of given homomorphisms; Makanin–Razborov (Hom-) diagrams for finite systems over F, with the maps, modular automorphism groups and terminal free groups as data, soundness (every branch gives solutions) and completeness (every solution factors through a branch), and the effective list of irreducible components; equations with coefficients in a represented limit group as a separate target.

### FG10.1 Universal ellipticity, JSJ trees and the JSJ deformation space

**Definition (`GTree.JSJ.IsUniversallyElliptic`).** Fix a group G, a family 𝒜 of subgroups closed under conjugation and taking subgroups (cyclic, or abelian), and a finite family ℋ of subgroups. Among (𝒜, ℋ)-trees (FG4/tree-action): a subgroup is universally elliptic when it is elliptic in every (𝒜, ℋ)-tree, and a tree is universally elliptic when its edge stabilizers are. A JSJ tree is a universally elliptic (𝒜, ℋ)-tree dominating every universally elliptic (𝒜, ℋ)-tree; the JSJ deformation space is the set of JSJ trees (when nonempty it is one deformation space over the universally elliptic groups of 𝒜). A vertex stabilizer of a JSJ tree is rigid when it is elliptic in every (𝒜, ℋ)-tree and flexible otherwise. Two JSJ decompositions are equivalent when they lie in the same deformation space; no single displayed graph of groups is canonical.

*Construction.*
1. Predicates on (𝒜, ℋ)-trees defined from FG4's ellipticity and domination.

*API.*
- `GTree.JSJ.IsUniversallyElliptic` (data): Elliptic in every (𝒜, ℋ)-tree.
- `GTree.JSJ.IsJSJ` (data): Universally elliptic and dominating every universally elliptic tree.
- `GTree.JSJ.IsRigidVertex` (data): Vertex stabilizer elliptic in every (𝒜, ℋ)-tree.
- `GTree.JSJ.IsFlexibleVertex` (data): Not rigid.
- `GTree.JSJ.equivalent_iff` (characterisation): Two JSJ trees are in the same deformation space, i.e. have the same elliptic subgroups.

**Checks.**
- `GTree.JSJ.free_group` (computation): For FreeGroup (Fin 2) over cyclic groups, every free action on a tree is a JSJ tree (vertex stabilizers trivial).
- `GTree.JSJ.surface_flexible` (computation): For S⁺(2, 0) over cyclic groups the JSJ tree is a point and the vertex is flexible: the cyclic splittings along intersecting curves are not universally elliptic.
- `GTree.JSJ.trivial_group` (degenerate): For the trivial group the point is the JSJ tree.
- `GTree.JSJ.not_unique_tree` (non-example): JSJ trees are not unique up to isomorphism (outer space for F₂ has many points): a definition demanding a unique displayed graph of groups is wrong; equality is equality of deformation spaces.

*Examples.* For F_n (any 𝒜) the JSJ trees are the free actions of F_n on trees (outer space); all vertex stabilizers are trivial. For a closed surface group S⁺(g, 0), g ≥ 2, over cyclic groups, the JSJ tree is a point and the vertex is flexible (QH).

*Used by.* FG10 existence and effective construction: the objects computed; FG10 Makanin–Razborov diagrams: modular groups are generated by twists along JSJ edges and automorphisms of flexible vertices; FG11: QH vertices of NTQ groups.

*Source.* [GL-JSJ] Introduction, pp. 3–5; §2, Definition 2.7, p. 24, Definition 2.12, p. 25, Definition 2.14, p. 26: Universally elliptic subgroups and trees, JSJ trees as universally elliptic trees dominating all universally elliptic trees, the JSJ deformation space, rigid and flexible vertices.; [JSJ] §2 (splittings), pp. 101–120: Cyclic and abelian splittings of fully residually free groups and their JSJ decompositions in Kharlampovich–Myasnikov's formulation; there 'rigid' means a non-QH, non-abelian vertex group (p. 106), whereas the node uses Guirardel–Levitt's universal definition.

*Needs.* FG4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees); FG4.12 (Collapses, refinements and domination of splittings); FG6.10 (Quadratically hanging (QH) vertices and their peripheral data).

*Suggested home.* `TauCeti/GroupTheory/BassSerre/JSJ`, namespace `GTree.JSJ`.

### FG10.2 Existence of abelian and cyclic JSJ decompositions of limit groups

**Theorem.** (1) If G is finitely presented (relative to a finite family ℋ of finitely generated subgroups), the JSJ deformation space of G over any family 𝒜 (relative to ℋ) is nonempty and contains a tree with finitely generated edge and vertex stabilizers. (2) If G is a finitely generated torsion-free CSA group, it has a JSJ decomposition over abelian subgroups (relative to any ℋ). (3) For a finitely generated fully residually free group G (finitely presented and CSA by FG8), the cyclic and abelian JSJ decompositions relative to a finite family of finitely generated subgroups exist, and their flexible vertices are QH (surface) vertices or abelian vertices; rigid vertices are elliptic in every abelian splitting.

*Hypotheses.* G finitely presented relative to ℋ for (1); torsion-free CSA for (2); fully residually free and finitely generated for (3).

*Proof sketch.*
1. (1) Dunwoody accessibility gives a bound on reduced splittings dominating a given one, and the standard refinements of FG4/collapse-and-refinement converge (GL-JSJ Theorem 2.16, relative Theorem 2.20).
2. (2) GL-JSJ Theorem 9.5 via acylindrical accessibility for CSA groups.
3. (3) Combine with FG8/embedding-theorems (finite presentability) and FG8/frf-properties; the description of flexible vertices is GL-JSJ §9 for CSA groups and SELA-I §2 for limit groups.

*Examples.* For G = F(a,b) ∗_{a = [x,y]⁻¹} F(x, y) relative to ℋ = {F(a,b)}, the abelian JSJ decomposition has the rigid vertex F(a,b) and the QH vertex F(x, y). Without ℋ it does not: G = ⟨b, x, y⟩ is free of rank 3, so its JSJ trees have trivial vertex groups.

*Source.* [GL-JSJ] §2, Theorem 2.16 and Theorem 2.20, pp. 26–27; §9, Theorem 9.5, p. 91: Finitely presented (relatively finitely presented) groups have JSJ decompositions over any family; torsion-free finitely generated CSA groups have abelian JSJ decompositions.; [SELA-I] §2, Theorem 2.7, p. 43, and §3, Theorem 3.2, p. 44: Freely indecomposable limit groups admit abelian JSJ decompositions with QH, abelian and rigid vertices, and non-abelian ones admit principal cyclic splittings.; [JSJ] §9, Theorem 9.1, and §13, pp. 179–207: Non-degenerate JSJ ℤ-decompositions of freely indecomposable fully residually free groups.

*Needs.* FG10.1 (Universal ellipticity, JSJ trees and the JSJ deformation space); FG8.7 (Embedding theorems and finite presentability); FG8.2 (Structure of fully residually free groups); FG4.12 (Collapses, refinements and domination of splittings); FG6.10 (Quadratically hanging (QH) vertices and their peripheral data); Mathlib `Group.IsFinitelyPresented`.

### FG10.3 Basic algorithms for finitely generated fully residually free groups (promised input)

**Construction (`LimitGroup.Effective.Input`).** Input class: a finite presentation ⟨X | S⟩ of a group G that is promised to be finitely generated and fully residually free (equivalently, a finite system S over F with G = F_{R(S)} irreducible, coefficient-free or with coefficients). Procedures: (1) wordProblemFRF decides w = 1 in G (w ∈ R(S)) by the universal-theory decider applied to ∀X (S = 1 → w = 1); (2) embedICE computes an iterated extension of centralizers F < G₁ < ⋯ < G_m (u_i and n_i explicit) and the images of the generators of G under an embedding G ↪ G_m (equivalently into an NTQ group, or into F^{ℤ[t]} as standard decompositions); (3) subgroupPresentation computes a finite presentation of the subgroup generated by a finite set Y ⊆ G in the generators Y; (4) membershipFRF, intersectionFRF, centralizerFRF and conjugacyFRF solve membership, compute generators of intersections and of centralizers, and decide conjugacy (returning a conjugator); (5) isMonoFRF, isEpiFRF decide injectivity and surjectivity of a homomorphism between two such groups given by images of generators.

*Hypotheses.* The promise: the input presents a finitely generated fully residually free group. Correctness and termination are stated only on this class; no procedure recognises the class.

*Construction.*
1. (1) JSJ Theorem 3.1 (universal theory, FG7/existential-universal-deciders).
2. (2) JSJ Theorems 3.2, 3.4, 3.6 (NTQ covering by the elimination process, embedding of NTQ groups in F^{ℤ[t]}, choice of the monic map by (5)); SUBGROUPS Theorems 1–2.
3. (3) JSJ Theorems 3.20–3.21 (finite presentations of finitely generated subgroups of NTQ groups via ICE groups).
4. (4) SUBGROUPS Proposition 5 and Theorems 4–11 on the infinite-word graphs of FG9.
5. (5) JSJ Theorem 3.22: compare radicals via (1) and (3).

*API.*
- `LimitGroup.Effective.Input` (structure): A finite presentation with the promise that it presents a finitely generated fully residually free group.
- `LimitGroup.Effective.wordProblem` (data): The word-problem decider.
- `LimitGroup.Effective.embedICE` (data): The ICE chain and the embedding data.
- `LimitGroup.Effective.subgroupPresentation` (data): Finite presentations of finitely generated subgroups.
- `LimitGroup.Effective.conjugacy` (data): Conjugacy decider with conjugator.
- `LimitGroup.Effective.isMono` (data): Injectivity test for homomorphisms given on generators.

**Checks.**
- `LimitGroup.Effective.wordProblem_free` (compatibility): On a presentation of a free group with no relators, wordProblem agrees with FG1/word-problem-procedure.
- `LimitGroup.Effective.embedICE_ice` (computation): For ⟨a, b, t | [a, t]⟩ embedICE returns the one-step chain F(a,b) < F(a,b)(a, ℤ).
- `LimitGroup.Effective.conjugacy_Z2` (computation): In ℤ² ∗ ℤ, conjugacy of (1,0) and (0,1) is false; of (1,0) and t (1,0) t⁻¹ is true with conjugator t.
- `LimitGroup.Effective.promise_needed` (non-example): On the presentation ⟨x, y | x² y² ⟩ (not fully residually free: the Klein bottle group fails commutation transitivity) the procedures carry no guarantee; the specification states correctness only on the promised class.
- `LimitGroup.Effective.trivial` (degenerate): On the empty presentation (the trivial group) every procedure returns the trivial answers.

*Examples.* For G = ⟨a, b, t | [a, t]⟩ (an ICE group over F(a,b)), embedICE returns G itself with u₁ = a, n₁ = 1. isMonoFRF of the map F(x,y) → F(a,b), x ↦ a², y ↦ b² returns true; of x ↦ a, y ↦ a returns false.

*Used by.* FG10 Grushko and JSJ algorithms: subroutines; FG10 Makanin–Razborov diagrams: proper quotients and radicals are computed; FG11: coordinate groups of NTQ systems as inputs.

*Source.* [JSJ] §3, Theorems 3.1, 3.2, 3.4–3.7, 3.20–3.22, pp. 121–125: Algorithms over coordinate groups of finite systems and over groups of the class F: word problem through the universal theory, NTQ covers, embeddings into F^{ℤ[t]}, finite presentations of finitely generated subgroups, and tests of mono-, epi- and isomorphisms.; [SUBGROUPS] §2.3, Theorems 1–3, p. 6; §§3–6, Theorems 4–11, pp. 14–38: Effective embeddings and the membership, intersection, centralizer and conjugacy algorithms for finitely generated fully residually free groups.; [FOLD] §5, Theorem 5.8, p. 22: For a benign graph of groups, folding computes the induced splitting of a finitely generated subgroup, and with coherent vertex groups a finite presentation of the subgroup.

*Needs.* FG7.13 (Deciders for the existential and universal fragments); FG8.7 (Embedding theorems and finite presentability); FG8.9 (NTQ groups: radicals, discrimination and level maps); FG9.7 (Membership and intersections for finitely generated subgroups of F^{ℤ[t]}); FG9.6 ((ℤ[t], X)-labelled graphs of finitely generated subgroups); FG8.5 (Extensions of centralizers and iterated extensions).

*Suggested home.* `TauCeti/GroupTheory/LimitGroup/Effective`, namespace `LimitGroup.Effective`.

### FG10.4 Correctness, termination and computability of the basic algorithms

**Theorem.** On the promised input class of FG10/frf-basic-algorithms: each procedure is computable and halts; wordProblemFRF answers true exactly when w = 1 in G; embedICE returns an injective homomorphism into the returned ICE group (and into F^{ℤ[t]}); subgroupPresentation returns a presentation of ⟨Y⟩ in the generators Y; membership, intersection, centralizer and conjugacy answers are correct in both directions with the returned witnesses; isMonoFRF and isEpiFRF answer correctly in both directions.

*Hypotheses.* Promised input class only.

*Proof sketch.*
1. Each statement is the correctness clause of the cited theorem, with the subroutines of FG7 and FG9 supplying computability; termination holds because every search is bounded by an effectively computed object (NTQ cover, ICE chain, finite graph) on the promised class.

*Examples.* The word problem in the closed surface group S⁺(2, 0) (fully residually free) is decided correctly.

*Source.* [JSJ] §3, Theorems 3.1–3.22, pp. 121–125: Correctness of the algorithms over groups of the class F.; [SUBGROUPS] §§3–6, Theorems 4–11: Correctness of the subgroup algorithms.

*Needs.* FG10.3 (Basic algorithms for finitely generated fully residually free groups (promised input)); FG7.13 (Deciders for the existential and universal fragments); FG7.9 (The solver is computable); FG9.7 (Membership and intersections for finitely generated subgroups of F^{ℤ[t]}); FG8.7 (Embedding theorems and finite presentability).

### FG10.5 Effective relative Grushko decompositions

**Theorem.** There is a procedure which, for a promised input G (finitely generated fully residually free, by a finite presentation) and a finitely generated subgroup H (by a generating set), decides whether G has a nontrivial free decomposition relative to H (H in a factor) and, iterating, computes a Grushko decomposition G = G₁ ∗ ⋯ ∗ G_p ∗ F_q relative to H: finite generating sets of the factors (as words in the generators of G), finite presentations of the factors, and the isomorphism data. It is computable and halts on the promised class, and its output is correct up to the uniqueness of FG4/kurosh-grushko (factors up to conjugacy and permutation).

*Hypotheses.* Promised input class; H a finitely generated subgroup given by generators.

*Proof sketch.*
1. JSJ Theorem 10.1 decides the existence of a free decomposition with H in a factor, using the elimination process on generalised equations of FG7 and the algorithms of FG10/frf-basic-algorithms; induction on the rank (Grushko–Neumann, FG4/kurosh-grushko) bounds the iteration.

*Examples.* For G = ℤ² ∗ F(c, d) the output has p = 1 (G₁ = ℤ²), q = 2. For the closed surface group the output is the trivial decomposition (freely indecomposable).

*Source.* [JSJ] §10, Theorem 10.1, p. 186 (announced in the introduction, p. 93): An algorithm that, for a finitely generated fully residually free group G and a finitely generated subgroup H, decides whether G has a nontrivial free decomposition with H in a factor and finds one.; [FOLD] §6, Theorem 6.2, p. 28: Grushko's theorem through foldings, giving the rank bound used in the iteration.

*Needs.* FG10.3 (Basic algorithms for finitely generated fully residually free groups (promised input)); FG10.4 (Correctness, termination and computability of the basic algorithms); FG4.11 (Kurosh subgroup theorem, Grushko–Neumann theorem and Grushko decompositions); FG7.4 (Elementary and derived transformations of generalised equations).

### FG10.6 Effective cyclic and abelian JSJ decompositions

**Theorem.** There is a procedure which, for a promised input G (finitely generated, freely indecomposable relative to ℋ, fully residually free) and a finite family ℋ of finitely generated subgroups, computes a cyclic (respectively abelian) JSJ decomposition of G relative to ℋ: a finite graph of groups with explicit vertex groups (generators as words in G, finite presentations), edge groups with their monomorphisms (as images of generators), the identification of G with π₁ (images of the generators of G and of π₁), and the labelling of vertices as rigid, abelian or QH with the surface data of each QH vertex. It is computable and halts on the promised class; its output lies in the JSJ deformation space (FG10/jsj-existence), so it is correct up to equivalence of JSJ decompositions, not as a literal displayed graph.

*Hypotheses.* Promised input class; existence (FG10/jsj-existence) is proved before and independently of the algorithm.

*Proof sketch.*
1. JSJ Theorem 13.1: run the elimination process on a generalised equation for G (FG7), recognise from its infinite branches the cyclic splittings (JSJ §7), assemble a sufficient splitting (JSJ Theorem 9.1) and refine to a JSJ decomposition.
2. The input is promised freely indecomposable relative to ℋ (for a single subgroup this is tested by FG10/effective-grushko); FG10/frf-basic-algorithms supplies the isomorphism tests; it does not use itself to prove its prerequisites.

*Examples.* For G = F(a,b) ∗_{a = [x,y]⁻¹} F(x, y) and ℋ = {F(a,b)} (G is freely indecomposable relative to F(a,b)), the output has two vertices: F(a,b) rigid and F(x, y) QH of genus one with one boundary component.

*Source.* [JSJ] Introduction, Theorem 1 and Theorem 13.1, p. 93; §13, pp. 199–207; §9, Theorem 9.1: Algorithms constructing cyclic and abelian JSJ decompositions of finitely generated fully residually free groups modulo a finite family of finitely generated subgroups, as presentations of the group as fundamental groups of JSJ graphs of groups.; [GL-JSJ] Introduction, pp. 3–5: JSJ decompositions are defined by a universal property and unique only up to deformation; existence statements are not algorithms.

*Needs.* FG10.2 (Existence of abelian and cyclic JSJ decompositions of limit groups); FG10.5 (Effective relative Grushko decompositions); FG10.4 (Correctness, termination and computability of the basic algorithms); FG7.4 (Elementary and derived transformations of generalised equations); FG6.10 (Quadratically hanging (QH) vertices and their peripheral data).

### FG10.7 Makanin–Razborov (Hom-) diagrams

**Definition (`LimitGroup.Effective.MRDiagram`).** For a finitely generated group G and the free group F, a Hom(G, F)-diagram (Makanin–Razborov diagram) is a finite rooted tree with: the root labelled G; every other vertex v labelled by a finitely generated fully residually free group G_v (given by a finite presentation) with a modular group Mod(G_v) ≤ Aut(G_v) (generated by Dehn twists along edges of its abelian JSJ decomposition, automorphisms of its QH vertex groups fixing the peripheral structure, and automorphisms of abelian vertex groups fixing the peripheral subgroups); every edge labelled by a homomorphism (from the root: a homomorphism G → G_v; otherwise a proper epimorphism G_v ↠ G_w); and every leaf labelled by a free group (a free product of F with a free group in the coefficient version). A branch B: G → G_{v₁} → ⋯ → G_{v_k} = F_B together with σ_i ∈ Mod(G_{v_i}) and a homomorphism ψ : F_B → F gives the composite homomorphism ψ ∘ π_k ∘ σ_k ∘ ⋯ ∘ π₁ ∘ σ₁ ∘ π₀ (the branch restrictions, if any, are part of the data). The diagram is complete when every homomorphism G → F is such a composite; the F-version uses F-homomorphisms.

*Construction.*
1. A finite tree datatype with group presentations, homomorphisms on generators and generating sets of modular groups.

*API.*
- `LimitGroup.Effective.MRDiagram` (structure): The finite rooted tree with vertex groups, modular generators and edge maps.
- `LimitGroup.Effective.MRDiagram.branchHoms` (data): The set of composites along branches.
- `LimitGroup.Effective.MRDiagram.IsComplete` (data): Every homomorphism G → F is a branch composite.
- `LimitGroup.Effective.MRDiagram.IsSound` (data): Every branch composite is a homomorphism G → F (automatic for homomorphisms) and, for G = F_{R(S)}, a solution of S.
- `LimitGroup.Effective.MRDiagram.modular` (projection): Generators of the modular group of each vertex.

**Checks.**
- `LimitGroup.Effective.MRDiagram.free_root` (degenerate): For G free, the one-edge diagram G → G (leaf G free) is complete.
- `LimitGroup.Effective.MRDiagram.centralizer` (computation): For S = [x, a] = 1 over F(a,b), the diagram root ⟨F, t | [a, t]⟩ → (identity) the same group with modular generator t ↦ t a → (t ↦ 1) leaf F is F-complete; its composites are exactly x ↦ a^k.
- `LimitGroup.Effective.MRDiagram.need_modular` (non-example): For S = [x₁,y₁][x₂,y₂] = 1 over F, the leaf maps without the modular group of the QH vertex S⁺(2, 0) miss solutions: completeness requires precomposing with Mod(G_v).
- `LimitGroup.Effective.MRDiagram.proper_quotients` (non-example): Edges below the root are proper epimorphisms; a diagram with an isomorphism edge has a redundant vertex, so the canonical diagrams exclude it.

*Examples.* For the empty system over F (G = F[X]), the one-edge diagram with leaf F[X] and the identity is F-complete: every solution is a specialisation of the leaf. For S = [x, a] = 1 over F(a,b): the root is G = F_{R(S)} = ⟨F, t | [a, t]⟩ (x = t), with one edge (the identity) to a vertex labelled G itself whose modular group is generated by the twist t ↦ t a, and one proper epimorphism t ↦ 1 from it to the leaf F; the composites are t ↦ a^k, exactly the solutions.

*Used by.* FG10 effective construction: the output of the algorithm; FG10 irreducible components: the vertices adjacent to the root give the components; FG11 parametrisation: fundamental sequences are branches.

*Source.* [JSJ] §11, Theorems 11.1–11.3, pp. 191–194 (stated in the introduction, pp. 93–94): Complete canonical Hom(G, F)- and Hom_F(G, F)-diagrams, effectively constructed for finitely presented G; for a finite system S, the solutions of S in F are exactly the F-homomorphisms of the diagram.; [SELA-I] §5, Definition 5.2, p. 62, Proposition 5.6, p. 67, and Theorem 5.7, p. 68: Modular groups of limit groups (Definition 5.2); every homomorphism to a free group factors, after a modular automorphism, through a maximal shortening quotient (Proposition 5.6); the canonical Makanin–Razborov diagram encodes all homomorphisms to a free group as compositions of modular automorphisms, quotient maps and homomorphisms of free groups (Theorem 5.7).; [IFT] §5.6, Theorems 5–7, pp. 59–61: The solution tree T_sol(Ω, Λ), fundamental sequences, the finite family of NTQ systems covering V(S), and the effective finite rooted tree describing Hom(G, F).

*Needs.* FG8.1 (Residually free and fully residually free groups); FG10.2 (Existence of abelian and cyclic JSJ decompositions of limit groups); FG4.13 (Dehn twists of one-edge splittings); FG6.10 (Quadratically hanging (QH) vertices and their peripheral data).

*Suggested home.* `TauCeti/GroupTheory/LimitGroup/Effective`, namespace `LimitGroup.Effective`.

### FG10.8 Effective Makanin–Razborov diagrams: soundness and completeness

**Theorem.** There is a computable procedure which, for every finite system S(X) = 1 over a free group F of finite rank (word coefficients), halts and returns an F-complete Hom_F(F_{R(S)}, F)-diagram C such that: (soundness) every branch composite is an F-homomorphism F_{R(S)} → F, i.e. a solution of S; (completeness) every solution of S in F factors as a branch composite (through an allowed branch, with modular automorphisms and a final specialisation of the leaf). Edges below the root are proper epimorphisms between finitely generated fully residually free groups, so every branch is finite; the leaves are F ∗ (free group).

*Hypotheses.* F free of finite rank; S finite with word coefficients.

*Proof sketch.*
1. Build the solution tree T_sol(Ω, Λ) of the generalised equations of FG7/reduction-to-generalized-equations (IFT §5.6, Theorems 5–7); every solution is a composition along a path (IFT Theorem 5).
2. Replace coordinate groups by their maximal fully residually free quotients and compute modular groups from effective JSJ decompositions (JSJ §11, using FG10/effective-jsj); finiteness from the descending chain condition for limit groups (proper epimorphisms terminate: LIMITS Proposition 3.13).
3. Soundness is by construction (composites of homomorphisms); completeness from IFT Theorem 5 and JSJ Theorem 11.3.

*Examples.* For S = [x, y] = 1 over F, the diagram's branches give all commuting pairs (u^m, u^n) after specialisation.

*Source.* [JSJ] §11, Theorem 11.3, p. 94 (proved in §11): For a finite system S(X) = 1, an F-complete canonical Hom(G, F)-diagram is constructed effectively, whose F-homomorphisms are exactly the solutions.; [IFT] §5.6, Theorem 5, Theorem 7, pp. 59–61: Every solution factors through a fundamental sequence of the solution tree; Hom(G, F) is described effectively by a finite rooted tree with proper quotients and free leaves.; [LIMITS] §3, Proposition 3.13, p. 23: Descending chains of proper epimorphisms between limit groups are finite.; [SELA-I] §5, Theorem 5.7, p. 68: Independent construction of Makanin–Razborov diagrams; the interfaces agree (finite tree, proper quotients, modular groups).

*Needs.* FG10.7 (Makanin–Razborov (Hom-) diagrams); FG10.6 (Effective cyclic and abelian JSJ decompositions); FG10.4 (Correctness, termination and computability of the basic algorithms); FG7.6 (Makanin's finiteness theorem: a computable bound for minimal solutions); FG7.4 (Elementary and derived transformations of generalised equations); FG7.3 (Correctness of the reduction to generalised equations (both directions)).

### FG10.9 Effective irreducible components and radicals

**Theorem.** There is a computable procedure which, for every finite system S(X) = 1 over F, returns finite systems S₁, …, S_m over F such that V(S) = V(S₁) ∪ ⋯ ∪ V(S_m) is the decomposition into irreducible components (FG5/noetherian-components) and each F_{R(S_i)} is given by a finite presentation; it also returns finitely many normal generators of R(S) for irreducible S, and finitely many nondegenerate triangular quasi-quadratic systems U_i with word maps p_i : V(U_i) → V(S) whose images cover V(S) and whose closures are the components.

*Proof sketch.*
1. IFT Theorem 6 / VAR-II Theorem 2 (TQ covering) and JSJ Theorem 3.9 and Corollary 3.8, using the radical test of FG10/frf-basic-algorithms.

*Examples.* For a finite system S over F(a,b) with V(S) = ⟨a⟩ ∪ ⟨b⟩ (finitely many of the equations [[x,a], g[x,b]g⁻¹] = 1, g ∈ F, suffice by equational Noetherianity), the procedure returns the two systems [x, a] = 1 and [x, b] = 1.

*Source.* [IFT] §5.6, Theorem 6, p. 60: Effective finite family of nondegenerate TQ systems and word maps covering V(S), with irreducible images whose closures are the components.; [VAR-II] §0, Theorem 2, p. 4: The same statement in part II.; [JSJ] §3, Corollary 3.8 and Theorem 3.9, p. 122: Effective radicals of irreducible systems and effective irreducible components.

*Needs.* FG10.8 (Effective Makanin–Razborov diagrams: soundness and completeness); FG10.4 (Correctness, termination and computability of the basic algorithms); FG5.10 (Noetherian Zariski topology and irreducible components); FG8.8 (Triangular quasi-quadratic and NTQ systems).

### FG10.10 Equations with coefficients in a represented limit group

**Theorem.** There is a computable procedure which, for a finitely generated fully residually free group H given by a finite presentation (promised input) and a finite system S(X) = 1 with coefficients in H (as words in the generators of H), decides whether S has a solution in H and returns one if it exists; moreover a complete Hom_H(H_{R(S)}, H)-diagram can be computed. This is a separate target with its own proof: the solver over free groups does not establish it.

*Hypotheses.* Promised input: H finitely generated fully residually free, given by a finite presentation.

*Proof sketch.*
1. Embed H in an NTQ group N with a free regular Lyndon length function in ℤⁿ (FG10/frf-basic-algorithms, FG9/lyndon-group-infinite-words; JSJ Theorem 12.7).
2. Run the elimination process for equations over N (generalised equations whose items are labelled by infinite words) to obtain a complete Hom(G, N)-diagram (JSJ Theorem 14.1), and restrict to homomorphisms landing in H using the membership algorithm (FG9/infinite-word-membership).
3. The elimination process over NTQ groups is only sketched in JSJ §§13–14, which cites its proof elsewhere, and KM06 Theorem 32 was not read: the replacement route is recorded as a gap and not assumed.

*Examples.* For H = F(a,b) the procedure agrees with the free-group solver of FG7. For H = ℤ² ∗ ℤ, the equation [x, (1,0)] = 1 has the solutions x ∈ ℤ².

*Source.* [JSJ] §3, Theorem 3.23, p. 125; §12, Theorems 12.6–12.7, p. 94; §14, Theorem 14.1 and Corollary 14.2, p. 207: The Diophantine problem is decidable in finitely generated fully residually free groups (cited from elsewhere); NTQ groups carry free regular Lyndon length functions in ℤᵗ; complete Hom(G, N)-diagrams into NTQ groups, effective for finitely presented G, obtained by the elimination process over NTQ groups (cited, with a sketch).; [KM06] Theorem 32 (as named in the specification): The prerequisite cited by Kharlampovich–Myasnikov for equations over limit groups; not read.; [SUBGROUPS] §2.3, Theorems 1–3, p. 6: Effective embeddings of finitely generated fully residually free groups into F^{ℤ[t]}.

*Needs.* FG10.4 (Correctness, termination and computability of the basic algorithms); FG9.5 (Lyndon's group F^{ℤ[t]} as infinite words, and free length functions on limit groups); FG9.7 (Membership and intersections for finitely generated subgroups of F^{ℤ[t]}); FG10.8 (Effective Makanin–Razborov diagrams: soundness and completeness).

### Dependencies

Within this roadmap: FG2, FG4, FG5, FG6, FG7, FG8, FG9. Libraries: Mathlib only (see the supplier contracts). Other roadmaps: none.

*Refinements still to plan.* Resolve the gap on FG10/equations-over-limit-groups: the elimination process over NTQ groups (KM06 Theorem 32 and its cited source) is not planned here. Split FG10 into dependency-checked subpackages for the follow-up (presentations and basic algorithms; Grushko and JSJ; Makanin–Razborov diagrams; equations over limit groups), as the specification asks. Plan the effective Grushko decomposition relative to a finite family ℋ of several subgroups: JSJ Theorem 10.1 treats one finitely generated subgroup H, so FG10/effective-grushko is stated for one subgroup.

## Layer FG11: Regular implicit-function theorems over free groups

Lifts of compatible equations to generic points, the basic automorphisms and generic families of solutions of regular quadratic equations, and the implicit function theorems for regular quadratic equations and regular NTQ systems, with complete lifts (inequations allowed) and an effective procedure returning formal solutions. The theorems are not extended to arbitrary NTQ systems.

*Targets of the layer.* Compatibility of an equation T(X, Y) = 1 with S(X) = 1 over G, S-lifts (formal solutions in the coordinate group), complete S-lifts (also for every compatible inequation), and generic families of solutions; the implicit function theorem for regular standard quadratic equations over F (complete lifts), the basic automorphisms and the generic families of solutions built from them, including the discriminating families over finitely generated fully residually free coefficient groups that the NTQ case uses; the implicit function theorem for regular NTQ systems with complete lifts; the effective version returning the formal solution; compatibility with substitution and changes of coordinates. The parametrisation theorem for arbitrary NTQ systems (with correcting embeddings) and lifts of ∀∃ formulas over arbitrary systems are not targets, and the claims are not extended to arbitrary NTQ systems.

### FG11.1 Compatible equations, S-lifts and complete S-lifts

**Definition (`GroupAlgGeom.Lift.IsCompatible`).** Let G be a group, S(X) = 1 a system over G with a solution in G, and μ : G[X] → G_{R(S)} the canonical map. A formula Φ(X, Y) of L_A (in particular T(X, Y) = 1, or T(X, Y) = 1 ∧ W(X, Y) ≠ 1) is compatible with S over G when for every solution a of S in G there is b with Φ(a, b) true in G (V_G(S) is the projection of the truth set of Φ ∧ S = 1). A compatible Φ admits an S-lift (a lift to a generic point) when ∃Y Φ(X^μ, Y) is true in G_{R(S)}, the elements X^μ treated as constants; a solution Y(X) ∈ G_{R(S)}^{|Y|} is a formal solution. A compatible equation T(X, Y) = 1 admits a complete S-lift when every formula T = 1 ∧ W ≠ 1 compatible with S admits an S-lift. A family Θ of solutions of S is generic when every equation V(X, Y) = 1 such that V(X^θ, Y) = 1 is solvable in G for all θ ∈ Θ admits a complete S-lift.

*Construction.*
1. Predicates on systems and formulas, using FG5 coordinate groups and FG3 formulas.

*API.*
- `GroupAlgGeom.Lift.IsCompatible` (data): Φ is compatible with S over G.
- `GroupAlgGeom.Lift.HasLift` (data): Φ admits an S-lift: ∃Y Φ(X^μ, Y) in G_{R(S)}.
- `GroupAlgGeom.Lift.HasCompleteLift` (data): Every compatible T = 1 ∧ W ≠ 1 admits an S-lift.
- `GroupAlgGeom.Lift.IsGenericFamily` (data): Generic families of solutions.
- `GroupAlgGeom.Lift.hasLift_isCompatible` (relation): A lift specialises to compatibility: if Φ admits an S-lift then Φ is compatible (compose with the points G_{R(S)} → G).

**Checks.**
- `GroupAlgGeom.Lift.hasLift_square` (computation): For S empty over F(a,b), T = (y² = x²) admits the lift y = x.
- `GroupAlgGeom.Lift.not_compatible_sqrt` (non-example): T = (y² = x) is not compatible with the empty system over F(a,b).
- `GroupAlgGeom.Lift.compatible_no_lift` (non-example): For S = ([x, y] = 1), which is not regular, the formula x = z² ∨ y = z² ∨ x y = z² (a single equation over F by FG7/positive-normal-form) is compatible with S, since for x = u^m, y = u^n one of m, n, m + n is even, but admits no S-lift: in F_{R(S)} = F ∗ ⟨x, y | [x, y]⟩ none of x, y, x y is a square. Compatibility does not imply lifting outside the regular class.
- `GroupAlgGeom.Lift.trivial` (degenerate): Every T with a solution Y(X) ∈ G[X] (a formal solution over the free G-group) admits an S-lift for every S, by composing with μ.

*Examples.* Over F, T = (y² = x²) is compatible with the empty system S and admits the lift y = x. Over F, T = (y² = x) is not compatible with the empty system (x = a has no square root).

*Used by.* FG11 implicit function theorems: the conclusions; FG7 Merzljakov's theorem: the case S empty of complete lifts with formal solutions in F[X].

*Source.* [IFT] §6, Definitions 25–27 and the definition of S-lift, pp. 63–67: Compatibility of a formula with S = 1 over G, lifts to a generic point (S-lifts) as solvability in G_{R(S)}, and complete S-lifts.; [LIFT] §1, pp. 215–216 (printed), and §2, Propositions 2.5 and 2.8, pp. 224–226: The same notions, with their characterisations by coordinate groups.; [IFT] §7.6, p. 141: Generic families of solutions of regular quadratic equations and NTQ systems.

*Needs.* FG5.2 (Algebraic sets, radicals and coordinate groups); FG5.1 (G-groups and the free G-group G[X]); FG5.12 (Points as homomorphisms; word maps and changes of coordinates).

*Suggested home.* `TauCeti/GroupTheory/AlgebraicGeometry/ImplicitFunction`, namespace `GroupAlgGeom.Lift`.

### FG11.2 Compatibility and lifts in terms of coordinate groups

**Theorem.** Let S(X) = 1 have a solution in G. (1) T(X, Y) = 1 is compatible with S over G iff G_{R(S)} embeds canonically in G_{R(S ∪ T)} and every G-homomorphism G_{R(S)} → G extends to G_{R(S ∪ T)}. (2) T is compatible with S and admits an S-lift iff there is a G-retraction G_{R(S ∪ T)} → G_{R(S)} (identity on G_{R(S)}); a solution of T(X^μ, Y) = 1 in G_{R(S)} gives the retraction and conversely. (3) Discrimination does not suffice: G_{R(S)} may be G-discriminated by G while a compatible equation admits no S-lift (S = [x, y] over F: F_{R(S)} = F ∗ ℤ² is F-discriminated, and the equation equivalent to x = z² ∨ y = z² ∨ x y = z² is compatible without S-lift, FG11/compatibility-and-lifts); lifts come from generic families (IFT Definition 44), which exist for regular quadratic equations and regular NTQ systems (FG11/generic-families, FG11/ift-regular-quadratic).

*Proof sketch.*
1. (1) LIFT Proposition 2.5 (IFT Proposition 2); (2) LIFT Proposition 2.8 (IFT Proposition 3, with Lemma 40 for the retraction); (3) the example of FG11/compatibility-and-lifts.

*Examples.* For S empty, (2) says T admits a lift iff F[X] is a retract of F_{R(T)} over F[X].

*Source.* [LIFT] §2, Proposition 2.5, p. 224, and Proposition 2.8, p. 226: Compatibility as embedding plus extension of homomorphisms; lifts as retractions of coordinate groups.; [IFT] §6, Lemmas 36–40 and Propositions 2–3, pp. 64–67: Separating families and G_{R(S)}-homomorphisms (Lemmas 36–40); compatibility as an embedding of coordinate groups with extension of homomorphisms (Proposition 2) and lifts as retractions (Proposition 3).

*Needs.* FG11.1 (Compatible equations, S-lifts and complete S-lifts); FG5.3 (G-separation and G-discrimination (residual and full residual properties)); FG5.11 (Irreducibility is discrimination of the coordinate group).

### FG11.3 The basic sequence of automorphisms of a regular quadratic equation

**Construction (`GroupAlgGeom.Lift.basicSeq`).** For a regular standard orientable quadratic equation S(X) = 1 over G (genus n, coefficients c₁, …, c_m, d), the basic sequence Γ = (γ₁, …, γ_K), K = K(m, n) (K = m + 4n − 1 when m, n ≠ 0, 4n − 1 when m = 0, and m − 1 when n = 0, where regularity forces m ≥ 3), consists of G-automorphisms of G[X] fixing the left side of S, each a Dehn twist of the surface splitting of FG6/regular-quadratic-coordinate-group along a simple closed curve of a fixed chain of curves. For a tuple p = (p₁, …, p_K) of positive integers, φ_{K,p} := γ_K^{p_K} ⋯ γ₁^{p₁}; the same construction with the curve system of a non-orientable surface gives the basic automorphisms of non-orientable regular equations.

*Hypotheses.* S regular, in standard form.

*Construction.*
1. Define each γ_i on the generators X by the explicit formulas of IFT §7.1 (Nielsen-type substitutions conjugating a block of variables by a product of atoms); check that γ_i fixes S, i.e. is a Dehn twist (FG4/dehn-twist) of the surface vertex.

*API.*
- `GroupAlgGeom.Lift.basicSeq` (data): The list (γ₁, …, γ_K) of G-automorphisms of G[X].
- `GroupAlgGeom.Lift.basicSeq_fix` (characterisation): γ_i(S) = S.
- `GroupAlgGeom.Lift.phi` (constructor): φ_{K,p} = γ_K^{p_K} ∘ ⋯ ∘ γ₁^{p₁}.
- `GroupAlgGeom.Lift.basicSeq_dehn` (compatibility): Each γ_i is the Dehn twist of FG4/dehn-twist along a curve of the surface splitting.

**Checks.**
- `GroupAlgGeom.Lift.basicSeq_length` (computation): For m = 0, n = 2 the basic sequence has K = 4 · 2 − 1 = 7 automorphisms.
- `GroupAlgGeom.Lift.basicSeq_fixes_S` (characterisation): Each γ_i fixes [x₁,y₁][x₂,y₂] in F[X].
- `GroupAlgGeom.Lift.phi_zero` (degenerate): φ_{K,(0,…,0)} = id.
- `GroupAlgGeom.Lift.not_for_irregular` (non-example): For x₁² x₂² x₃² = 1 (not regular) no such family produces non-commutative solutions: all solutions commute, so the construction is restricted to regular equations.

*Examples.* For S = [x₁,y₁][x₂,y₂] over F (no coefficient d, so the surface is closed of genus two) the basic sequence has K = 7 automorphisms, twists along a chain of curves; they fix the word S₀ = [x₁,y₁][x₂,y₂] (IFT p. 68). Each γ_i fixes the word S(X) in G[X].

*Used by.* FG11 generic families: generic solutions are β ∘ φ_{K,p} for large p; FG10 modular groups: the basic automorphisms generate a subgroup of the modular group of the QH vertex.

*Source.* [IFT] §7.1, the basic automorphisms and Lemma 41, pp. 67–75: The basic sequence Γ = (γ₁, …, γ_{m+4n−1}) of automorphisms of G[X] fixing a regular orientable standard quadratic word, and the automorphisms φ_{K,p}.; [LIFT] §4, the basic sequence and Definition 4.2, pp. 230–232: The basic sequence of automorphisms of a regular orientable standard quadratic equation, K(m, n) and the automorphisms φ_{K,p}.

*Needs.* FG6.7 (Regular standard quadratic equations); FG6.9 (Coordinate groups of regular quadratic equations as surface amalgams); FG4.13 (Dehn twists of one-edge splittings); FG5.12 (Points as homomorphisms; word maps and changes of coordinates).

*Suggested home.* `TauCeti/GroupTheory/AlgebraicGeometry/ImplicitFunction`, namespace `GroupAlgGeom.Lift`.

### FG11.4 Generic families of solutions of regular quadratic equations

**Theorem.** Let G be a finitely generated fully residually free group, S = 1 a regular standard orientable quadratic equation over G other than [x₁,y₁][x₂,y₂] = 1, Γ its basic sequence and β : G_S → G a solution in general position (one exists by FG6/quadratic-radicals; the excluded equation has none, and IFT p. 99 treats it as [x₁,y₁] = [y₂,x₂] over G ∗ F(x₂, y₂)). For any J ≥ 2 and any unbounded set P ⊆ ℕ^{JK}, the family Ξ_{P,β} = {φ_{JK,p} β | p ∈ P} G-discriminates G_{R(S)} into G, and so does Ξ_{P,β,p′} = {φ_{tK,p′} θ | θ ∈ Ξ_{P,β}} for any t and any fixed p′ ∈ ℕ^{tK} (IFT Theorem 10). Over G = F such families are generic in the sense of FG11/compatibility-and-lifts (IFT Definition 44): this is what the proof of the implicit function theorem (IFT §7.4) establishes. Non-orientable regular equations are treated by the same method in IFT §7.5.

*Hypotheses.* G finitely generated fully residually free; S regular; β in general position (exists by FG6/quadratic-radicals).

*Proof sketch.*
1. Big powers and the Nielsen property of φ_{K,p} with respect to the words of Γ (IFT Lemmas 42–65, §7.2–7.3): long products of large powers do not cancel.
2. G_{R(S)} embeds in an extension of centralizers of G (LIFT Propositions 5.1–5.2), discriminated by FG8/centralizer-extension-discriminated.

*Examples.* For S = ([x, y] = [a, b]) over F(a,b) (regular by its explicit clause; with one atom every solution counts as in general position), β = (a, b) and P unbounded, the solutions φ_{2K,p} β discriminate F_{R(S)} into F.

*Source.* [IFT] §7.2, Theorem 10, p. 104, the exception on p. 99, and §7.6, Definition 44, p. 141: For a finitely generated fully residually free G, a regular orientable standard quadratic S and a general-position solution β, the families Ξ_{P,β} discriminate G_{R(S)} into G; [x₁,y₁][x₂,y₂] = 1 has no general-position solution and is treated over a larger coefficient group; generic families are defined in Definition 44.; [LIFT] §5, Propositions 5.1–5.2, pp. 266–270: General-position solutions of regular quadratic equations give embeddings into extensions of centralizers.

*Needs.* FG11.3 (The basic sequence of automorphisms of a regular quadratic equation); FG8.6 (Extensions of centralizers are discriminated by the base group); FG6.8 (Radicals of consistent standard quadratic equations); FG8.1 (Residually free and fully residually free groups).

### FG11.5 Implicit function theorem for regular quadratic equations

**Theorem.** Let S(X, A) = 1 be a regular standard quadratic equation over F = F(A). Every equation T(X, Y, A) = 1 compatible with S over F admits a complete S-lift: for every W(X, Y) such that T = 1 ∧ W ≠ 1 is compatible with S, there is Y(X) ∈ F_{R(S)}^{|Y|} (words in X ∪ A modulo R(S) = ncl(S)) with T(X, Y(X)) = 1 and W(X, Y(X)) ≠ 1 in F_{R(S)}. The lift is effective: FG11/lift-procedure computes it. The theorem is stated over F; for finitely generated fully residually free coefficient groups the sources provide the discriminating families (IFT Theorem 10, Corollary 12) used at the levels of NTQ systems, not a separate implicit function theorem.

*Hypotheses.* S regular standard quadratic over F; T compatible with S (and W such that T ∧ W ≠ 1 is compatible).

*Proof sketch.*
1. Apply the solution tree of T ∧ S with parameters X to the generic family of FG11/generic-families; cut equations (IFT §5.7, LIFT Theorem 3.4) show that for large p the solutions over the generic family factor through a single branch whose values are words in X (IFT §7.4, proof of Theorem 9).
2. The inequality W ≠ 1 is preserved by choosing the branch where W does not vanish on the discriminating family (IFT p. 135).

*Examples.* For S = [x₁,y₁][x₂,y₂] and T = (z = x₁ y₁), the lift is z = x₁ y₁ (trivially). For S = [x₁,y₁][x₂,y₂] and T = ([z, x₁] = 1 ∧ z ≠ 1), a lift is z = x₁.

*Source.* [IFT] §7.4, Theorem 9, p. 67 (statement) and pp. 109–136 (proof, including Case 1 and Case 2 on pp. 135–136): Every equation compatible with a regular standard quadratic equation over F admits a complete S-lift.; [LIFT] §1, Theorem A, p. 216: The same theorem with effective complete S-lifts.; [IFT] §7.2, Theorem 10 and Corollary 12, pp. 104–105: Discriminating families of solutions over finitely generated fully residually free coefficient groups (not an implicit function theorem over them).

*Needs.* FG11.4 (Generic families of solutions of regular quadratic equations); FG11.2 (Compatibility and lifts in terms of coordinate groups); FG7.4 (Elementary and derived transformations of generalised equations); FG7.3 (Correctness of the reduction to generalised equations (both directions)); FG7.15 (Merzljakov's theorem: formal solutions of positive sentences).

### FG11.6 Implicit function theorem for regular NTQ systems

**Theorem.** Let U(X, A) = 1 be a regular NTQ system over F = F(A) (every level a regular standard quadratic equation or empty). Every equation V(X, Y, A) = 1 compatible with U admits a complete U-lift, effectively. When U is entirely empty this is Merzljakov's theorem in the form with inequations (formal solutions in F[X]). The claim is not extended to NTQ systems with non-regular quadratic levels, abelian levels or centralizer-extension levels.

*Hypotheses.* U regular NTQ; V compatible with U.

*Proof sketch.*
1. Induction on the number of levels (IFT proof of Theorem 11): build the solution tree of V ∧ U with parameters X = X₁ ∪ ⋯ ∪ X_n; on the top level use FG11/ift-regular-quadratic (or Merzljakov words for empty levels, FG7/merzljakov-theorem); lift level by level through the coordinate groups of FG8/ntq-coordinate-group.

*Examples.* For U the two-level system with level 1: [x₁,y₁][x₂,y₂] = z (coefficients from level 2) and level 2 empty in z, a compatible V lifts by combining Merzljakov words for z with the quadratic theorem.

*Source.* [IFT] §7.6, Theorem 11 and its proof, pp. 137–141: Every equation compatible with a regular NTQ system admits a complete U-lift, by induction on levels with Merzljakov words for empty levels.; [LIFT] §1, Theorem B, p. 217, and §8: The same theorem with effective lifts.

*Needs.* FG11.5 (Implicit function theorem for regular quadratic equations); FG8.8 (Triangular quasi-quadratic and NTQ systems); FG8.9 (NTQ groups: radicals, discrimination and level maps); FG7.15 (Merzljakov's theorem: formal solutions of positive sentences); FG11.4 (Generic families of solutions of regular quadratic equations).

### FG11.7 The effective lift: computing formal solutions

**Construction (`GroupAlgGeom.Lift.liftSolve`).** liftSolve takes a regular NTQ system U over F(A) (a regular standard quadratic equation is the one-level case) and an equation V(X, Y, A) = 1 with the promise that V is compatible with U, and searches the words Y(X) over X ∪ A in a fixed enumeration, testing V(X, Y(X)) = 1 in F_{R(U)} with the word-problem decider of FG10/frf-basic-algorithms (F_{R(U)} is fully residually free); it returns the first Y found. With an inequation W, it also tests W(X, Y(X)) ≠ 1. This is weaker than LIFT's notion of an effective lift (p. 216), which also decides whether a lift exists; that decision is not planned here (FG11 coverage).

*Hypotheses.* Promise: V (and V ∧ W ≠ 1) compatible with the regular NTQ system U.

*Construction.*
1. Enumerate candidate tuples of words; decide the equations in F_{R(U)} by FG10's word problem; stop at the first success.

*API.*
- `GroupAlgGeom.Lift.liftSolve` (data): The search procedure.
- `GroupAlgGeom.Lift.liftSolve_spec` (characterisation): On compatible input, liftSolve halts and returns Y with V(X, Y) = 1 (and W ≠ 1) in F_{R(U)}.
- `GroupAlgGeom.Lift.liftSolve_partrec` (other): liftSolve is partial recursive, total on the promised class.

**Checks.**
- `GroupAlgGeom.Lift.liftSolve_trivial` (degenerate): For V = (y = 1) the procedure returns y = 1 at once.
- `GroupAlgGeom.Lift.liftSolve_root` (computation): For U = [x₁,y₁][x₂,y₂] and V = ([z, x₁] = 1 ∧ z ≠ 1) it returns a nontrivial element of the centralizer of x₁ in F_{R(U)}.
- `GroupAlgGeom.Lift.liftSolve_noncompatible` (non-example): For V = (y² = x₁), which is not compatible with U, the search does not halt: termination is claimed only on the promised class, and the procedure does not decide compatibility.
- `GroupAlgGeom.Lift.liftSolve_merzljakov` (compatibility): For U empty, liftSolve returns a formal solution in F[X], agreeing with FG7's positiveDecide on positive ∀∃ sentences.

*Examples.* For U = [x₁,y₁][x₂,y₂] and V = ([z, x₁] = 1 ∧ z ≠ 1), liftSolve returns z = x₁ (or another nontrivial power of the root of x₁ in F_{R(U)}).

*Used by.* FG11 effective implicit function theorem: the effective form of the theorems; Downstream first-order work: formal solutions as Skolem functions (LIFT §1 discussion of Theorem A).

*Source.* [LIFT] §1, Theorems A–B, pp. 216–217: The complete lifts are effective: given S (or U) and T compatible, a solution in the coordinate group can be constructed.; [JSJ] §3, Theorem 3.1, p. 121: The word problem in coordinate groups of finite systems is decidable.

*Needs.* FG10.3 (Basic algorithms for finitely generated fully residually free groups (promised input)); FG11.6 (Implicit function theorem for regular NTQ systems).

*Suggested home.* `TauCeti/GroupTheory/AlgebraicGeometry/ImplicitFunction`, namespace `GroupAlgGeom.Lift`.

### FG11.8 Correctness, computability and termination of the effective lift

**Theorem.** liftSolve is partial recursive; on every input (U, V, W) in the promised class (U regular NTQ, V ∧ W ≠ 1 compatible with U) it halts, and its output Y satisfies V(X, Y) = 1 and W(X, Y) ≠ 1 in F_{R(U)}, i.e. it is a complete-lift witness. Termination is FG11/ift-regular-ntq (a solution exists, so the enumeration reaches it); correctness of the returned answer is the word-problem test; no negative answer is produced.

*Proof sketch.*
1. Combine FG11/ift-regular-ntq (existence), FG10/frf-basic-algorithms-correct (the word-problem test is correct and total on F_{R(U)}), and enumeration of words.

*Examples.* On U = [x₁,y₁][x₂,y₂], V = (z = x₁ y₁), the output is z = x₁ y₁.

*Source.* [LIFT] §1, Theorems A–B, pp. 216–217: Effective complete lifts for regular quadratic equations and regular NTQ systems.

*Needs.* FG11.7 (The effective lift: computing formal solutions); FG11.6 (Implicit function theorem for regular NTQ systems); FG10.4 (Correctness, termination and computability of the basic algorithms); Mathlib `Partrec`.

### FG11.9 Lifts under substitution and changes of coordinates

**Theorem.** (1) If σ is a G-automorphism of G[X] (a change of coordinates) and T(X, Y) = 1 admits a (complete) S-lift, then T(σX, Y) = 1 admits a (complete) S^σ-lift, where S^σ is the transformed system, and the formal solutions correspond under the induced isomorphism of coordinate groups. (2) If T(X, Y) = 1 admits an S-lift Y(X) and T′(X, Y, Z) = 1 admits an (S ∪ T)-lift Z(X, Y), then T ∧ T′ admits an S-lift (X, Y(X), Z(X, Y(X))) when G_{R(S∪T)} retracts onto G_{R(S)}. (3) In particular regularity and the conclusions of FG11/ift-regular-quadratic are invariant under the reduction to standard form of FG6/quadratic-standard-form, so the theorem applies to every quadratic equation whose standard form is regular.

*Proof sketch.*
1. (1) FG5/points-and-coordinate-changes; (2) compose the retractions of FG11/lift-characterisation (2); (3) apply (1) to the automorphism of FG6/quadratic-standard-form.

*Examples.* The non-standard equation x y x⁻¹ y⁻¹ z w z⁻¹ w⁻¹ = 1 has a regular standard form and inherits the implicit function theorem.

*Source.* [IFT] §2.7, Lemma 1, p. 8, and §6, Lemmas 36–40, pp. 63–67: Standard forms by G-automorphisms; lifts and retractions of coordinate groups.; [LIFT] §2, Propositions 2.5 and 2.8, pp. 224–226: Coordinate-group characterisations used to transport lifts.

*Needs.* FG11.2 (Compatibility and lifts in terms of coordinate groups); FG5.12 (Points as homomorphisms; word maps and changes of coordinates); FG6.6 (Effective reduction of quadratic words to standard form); FG11.5 (Implicit function theorem for regular quadratic equations).

### Dependencies

Within this roadmap: FG5, FG6, FG7, FG8, FG9, FG10. Libraries: Mathlib only (see the supplier contracts). Other roadmaps: none.

*Refinements still to plan.* Refine the proof of FG11/generic-families (the Nielsen-property lemmas of IFT §§7.1–7.3) to lemma level. Plan LIFT's stronger effectiveness (LIFT p. 216: an algorithm deciding whether a given formula T = 1 ∧ W ≠ 1 admits an S-lift, and constructing it): FG11/lift-procedure is a search on the promised class of compatible inputs and does not decide compatibility.

## Open inputs

- **Equations over a represented limit group: the elimination process over NTQ groups** (needed by FG10.10 (Equations with coefficients in a represented limit group)). The specification requires the prerequisite proof cited by KM06 Theorem 32 to be resolved or replaced by a proved route. KM06 (J. Algebra 302, 2006) could not be read (the publisher refused automated access, and the review REV-DESIGN-FGLG found no author copy). The available sources give: JSJ Theorem 3.23 (decidability of the Diophantine problem in finitely generated fully residually free groups, cited from another paper of Kharlampovich–Myasnikov), JSJ Theorem 14.1 (complete Hom(G, N)-diagrams into NTQ groups, ‘proved in [41]’ and only sketched via the elimination process over groups with free regular Lyndon length functions, JSJ §§12–13), and Theorems 12.6–12.7 (free regular length functions on NTQ groups, proved in JSJ §12). A follow-up must read the elimination process over NTQ groups (JSJ [41] and KM06 Theorem 32) at declaration level and plan its generalised equations over infinite words, or adopt another proved route; until then FG10/equations-over-limit-groups rests on this gap and nothing downstream may use it as an oracle.

## Downstream consumers

A separate development of the first-order theory of free groups (Tarski's problems) may import this library: it would consume the deciders of FG7, the Makanin–Razborov diagrams of FG10 and the implicit function theorems of FG11, and own its specialised constructions (induced NTQ systems, envelopes, the decision trees and the termination of quantifier elimination). Within the atlas, any roadmap needing free groups, Bass–Serre theory, surface groups or equations over groups imports the corresponding layer of this roadmap.

## References

- [LEAN] The Mathlib Community, *Mathlib (free groups, amalgams, HNN extensions, model theory, computability)*, Mathlib commit 082e2d37e8b0463410cdb532e111cd43d5a66174 (the Tau Ceti f790474 pin). <https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174>
- [TREES] Jean-Pierre Serre, *Trees*, Springer Monographs in Mathematics, corrected 2nd printing 2003 (translation of Arbres, amalgames, SL₂, Astérisque 46, 1977). <https://link.springer.com/book/10.1007/978-3-642-61856-7>
- [FOLD] Ilya Kapovich, Richard Weidmann, Alexei Myasnikov, *Foldings, graphs of groups and the membership problem*, Internat. J. Algebra Comput. 15 (2005), 95–128; arXiv:math/0302206v2 (PDF pages cited). <https://arxiv.org/abs/math/0302206>
- [KM02] Ilya Kapovich, Alexei Myasnikov, *Stallings foldings and subgroups of free groups*, J. Algebra 248 (2002), 608–668; arXiv:math/0202285v1 (PDF pages cited). <https://arxiv.org/abs/math/0202285>
- [ALG] Gilbert Baumslag, Alexei Myasnikov, Vladimir Remeslennikov, *Algebraic geometry over groups I. Algebraic sets and ideal theory*, J. Algebra 219 (1999), 16–79; authors' copy from A. Myasnikov's publication page (58 pp.; PDF pages cited). <https://web.stevens.edu/algebraic/alexeim/Publications/All_files_new/FINAL_AL_51_38.pdf>
- [VAR-I] Olga Kharlampovich, Alexei Myasnikov, *Irreducible affine varieties over a free group. I: Irreducibility of quadratic equations and Nullstellensatz*, J. Algebra 200 (1998), 472–516; authors' copy (46 pp.; PDF pages cited). <https://web.stevens.edu/algebraic/alexeim/Publications/All_files_new/pp1_34.pdf>
- [VAR-II] Olga Kharlampovich, Alexei Myasnikov, *Irreducible affine varieties over a free group. II: Systems in triangular quasi-quadratic form and description of residually free groups*, J. Algebra 200 (1998), 517–570; authors' copy (40 pp.; PDF pages cited). <https://web.stevens.edu/algebraic/alexeim/Publications/All_files_new/pp_ff_35.pdf>
- [MAK] G. S. Makanin, *Decidability of the universal and positive theories of a free group*, Izv. Akad. Nauk SSSR Ser. Mat. 48 (1984), 735–749; English translation Math. USSR-Izv. 25 (1985), 75–88 (the translation's printed pages are cited). <https://www.mathnet.ru/eng/im1489>
- [MAK82] G. S. Makanin, *Equations in a free group*, Izv. Akad. Nauk SSSR Ser. Mat. 46 (1982), 1199–1273; English translation Math. USSR-Izv. 21 (1983), 483–546 (the translation's printed pages are cited). <https://www.mathnet.ru/eng/im1703>
- [RECOMP] Volker Diekert, Artur Jeż, Wojciech Plandowski, *Finding all solutions of equations in free groups and monoids with involution*, Inform. and Comput. 251 (2016), 263–286; arXiv:1405.5133v2. <https://arxiv.org/abs/1405.5133>
- [LIMITS] Christophe Champetier, Vincent Guirardel, *Limit groups as limits of free groups*, Israel J. Math. 146 (2005), 1–75; arXiv:math/0401042v2. <https://arxiv.org/abs/math/0401042>
- [GL-JSJ] Vincent Guirardel, Gilbert Levitt, *JSJ decompositions of groups*, Astérisque 395 (2017); arXiv:1602.05139v2 (PDF pages cited). <https://arxiv.org/abs/1602.05139>
- [JSJ] Olga Kharlampovich, Alexei Myasnikov, *Effective JSJ decompositions*, Groups, Languages, Algorithms, Contemp. Math. 378 (2005), 87–212; arXiv:math/0407089v2 (PDF pages cited). <https://arxiv.org/abs/math/0407089>
- [SUBGROUPS] Olga Kharlampovich, Alexei Myasnikov, Vladimir Remeslennikov, Denis Serbin, *Subgroups of fully residually free groups: algorithmic problems*, Group theory, statistics, and cryptography, Contemp. Math. 360 (2004), 63–101; authors' copy (39 pp., internal page numbers 1–39 cited). <https://web.stevens.edu/algebraic/alexeim/Publications/All_files_temp/KMRS_FRFG_AlgProb_65.pdf>
- [LENGTH] Olga Kharlampovich, Alexei Myasnikov, Vladimir Remeslennikov, Denis Serbin, *Groups with free regular length functions in Z^n*, Trans. Amer. Math. Soc. 364 (2012), 2847–2882; arXiv:0907.2356v2. <https://arxiv.org/abs/0907.2356>
- [KMS-ACTIONS] Olga Kharlampovich, Alexei Myasnikov, Denis Serbin, *Actions, length functions, and non-archimedean words*, Internat. J. Algebra Comput. 23 (2013), 325–455; arXiv:1211.3207v2 (printed page numbers of the arXiv version cited). <https://arxiv.org/abs/1211.3207>
- [INFINITE-WORDS] Alexei Myasnikov, Vladimir Remeslennikov, Denis Serbin, *Fully residually free groups and graphs labeled by infinite words*, Internat. J. Algebra Comput. 16 (2006), 689–737. <https://doi.org/10.1142/S0218196706003141>
- [MRS-REGULAR] Alexei Myasnikov, Vladimir Remeslennikov, Denis Serbin, *Regular free length functions on Lyndon's free Z[t]-group F^{Z[t]}*, Groups, Languages, Algorithms, Contemp. Math. 378 (2005), 37–77; authors' copy (40 pp.; internal page numbers cited). <https://web.stevens.edu/algebraic/alexeim/Publications/All_files_new/conm_borovik2_MRSc_85.pdf>
- [SELA-I] Zlil Sela, *Diophantine geometry over groups I: Makanin–Razborov diagrams*, Publ. Math. IHÉS 93 (2001), 31–105 (Numdam). <https://www.numdam.org/item/PMIHES_2001__93__31_0/>
- [IFT] Olga Kharlampovich, Alexei Myasnikov, *Implicit function theorem over free groups*, J. Algebra 290 (2005), 1–203; arXiv:math/0312509v2 (printed page numbers of the arXiv version cited). <https://arxiv.org/abs/math/0312509>
- [LIFT] Olga Kharlampovich, Alexei Myasnikov, *Algebraic geometry over free groups: lifting solutions into generic points*, Groups, Languages, Algorithms, Contemp. Math. 378 (2005), 213–318; arXiv:math/0407110v4. <https://arxiv.org/abs/math/0407110>
- [KM06] Olga Kharlampovich, Alexei Myasnikov, *Elementary theory of free non-abelian groups*, J. Algebra 302 (2006), 451–552. <https://doi.org/10.1016/j.jalgebra.2006.03.033>
