# Roadmap: the first-order theory of free groups

**Summary.** This roadmap plans the proofs of Tarski's theorems on free groups. The elementary theory of a nonabelian free group of finite rank is decidable, with constants allowed. All nonabelian free groups of finite rank are elementarily equivalent. The standard embeddings F_k ≤ F_ℓ are elementary. A finitely generated group is elementarily equivalent to a free group exactly when it is an extended hyperbolic tower over the trivial group; in particular closed surface groups of Euler characteristic at most −2 are. Everything is stated on Mathlib's first-order syntax and semantics (`FirstOrder.Language`, `BoundedFormula.Realize`, `ElementarilyEquivalent`, `ElementaryEmbedding`), on Mathlib's `FreeGroup` and on Mathlib's computability (`Computable`, `ComputablePred`). The roadmap builds on FreeGroupsAndLimitGroups (layers FG1–FG11), which supplies the effective first-order syntax of groups, equations and coordinate groups, surface groups and quadratic equations, generalized equations and the equation solver, Merzljakov's theorem and the positive theory, limit groups and NTQ systems, effective JSJ decompositions, Makanin–Razborov diagrams and the implicit function theorems for regular NTQ systems. Those are consumed by stage and node id and never restated.

## Scope and ownership

This roadmap owns:

- the formula classes and normal forms over F(A), the free lifting theorem, and the definition of the target (∀∃-quantifier elimination) (FO1);
- the parametrization theorem for arbitrary NTQ systems (correcting extensions, normalization, generic families of all level types), with the fundamental-sequence infrastructure it uses: strict and well-aligned fundamental sequences, canonical NTQ systems, the canonical embedding tree, fundamental sequences modulo subgroups and groups without sufficient splitting (FO2);
- MAX-equivalence, reducing quotients, complete reducing systems, algebraic solutions and the uniform bound on their number (FO4);
- induced NTQ systems, projective images, tight enveloping NTQ groups, and certificates and configuration groups (FO3);
- the ∀∃-decision tree, its finiteness and correctness, the decidability of the ∀∃-theory, its independence of the rank, and the computation of the bound (FO5);
- the parametric tree, the elimination of ∃∀∃-formulas and the outer elimination procedure with its termination measure (FO6);
- Tarski's theorems and their stated consequences, the tower classification, and negative controls (FO7).

It leaves to FreeGroupsAndLimitGroups:

- free-group algorithms (FG1);
- Stallings graphs (FG2);
- the effective syntax of the language of groups with coefficients and the term–word correspondence (FG3);
- graphs of groups and Bass–Serre theory (FG4);
- algebraic geometry over groups (FG5);
- surface groups, quadratic equations, regularity and QH vertices (FG6);
- generalized equations, the solver, the existential and universal deciders, positive normal forms, Merzljakov's theorem and the positive-theory decider (FG7);
- fully residually free groups, limit groups and NTQ systems (FG8);
- length functions (FG9);
- JSJ decompositions, Makanin–Razborov diagrams and the algorithms in limit groups (FG10);
- compatibility, lifts, generic families and the implicit function theorems for regular quadratic equations and regular NTQ systems (FG11).

Tau Ceti and the current TauCetiRoadmap have no roadmap or library material on free groups' first-order theory. TauCeti's model theory at the pinned commit is empty, and its current library has only real-closed-field quantifier elimination. Nothing is imported from there. The decidability theorem is a target of FO7 and is never used as an input of any node.

## Conventions

- A is a finite type of coefficient letters with |A| ≥ 2, and F = F(A) = `FreeGroup A` is nonabelian. F_k = `FreeGroup (Fin k)`.
- The language of groups is FreeGroupsAndLimitGroups' `groupLang` (one constant, inverse, multiplication; no relations). Coefficients are carried by free variables: an L_A-formula with parameters P is a `groupLang`-formula with free variables A ⊕ P, realized in a group G with coefficients c : A → G under `Sum.elim c v`. Over F(A), c = `FreeGroup.of`. A formula is coefficient-free when it does not mention A.
- Two formulas are equivalent over a structure M when they are realized at the same valuations (FO1/equivalence-over). "Quantifier elimination over F(A)" means equivalence over F(A) with its constants. The uniform statement for coefficient-free formulas over every F_k is FO7/uniform-qe.
- The quantifier classes are syntactic, on Mathlib's `BoundedFormula`: ∀∃ is a block of `all` over Mathlib's `IsExistential`, ∃∀ is a block of `ex` over `IsUniversal`, and `IsBoolCombAE` is their Boolean closure. Because ∃∀-formulas are negations of ∀∃-formulas up to equivalence, eliminating to Boolean combinations of ∀∃-formulas and of ∃∀-formulas are the same task. QE-FREE uses ∃∀ and SELA-VI and HYP use ∀∃.
- The standard form of a formula (FO1/standard-form) comes in two forms: the general form, whose disjuncts are finite systems of equations and inequations, valid in every group and coefficient-free when the formula is; and the merged form, with one equation and one inequation per disjunct, valid over F(A) but introducing the constants a, b. Statements uniform in the rank (FO5/ae-rank-independence, FO7/uniform-qe) use the coefficient-free run of the constructions, never the merged form.
- An algorithm is a computable function (Mathlib's `Computable`) on Primcodable codes, with the encodings of FG3/effective-encoding, together with the correctness of both answers. A decidability statement is a `ComputablePred`. Running times, certificates and implementations are out of scope.
- Fundamental sequences, NTQ systems, generic families and correcting extensions are those of Kharlampovich–Myasnikov in the corrected form of QE-FREE (2019) and HYP (2016). Strict sequences include the envelope condition (3), and the reducing-quotient definition has two items (sourceIssues E1, E3).
- Euler characteristics follow FG6: χ = 2 − 2g − m for orientable genus g with m boundary components, and χ = 2 − g − m for non-orientable genus g.

## Exact supplier contracts

**From Mathlib** (commit 082e2d3):

- `FirstOrder.Language.BoundedFormula`, `Formula`, `Sentence`, `BoundedFormula.Realize`;
- `BoundedFormula.IsQF`, `IsPrenex`, `IsUniversal`, `IsExistential`, `toPrenex` and `realize_toPrenex`;
- `completeTheory`, `ElementarilyEquivalent` and `elementarilyEquivalent_iff`;
- `ElementaryEmbedding` and `ElementaryEmbedding.elementarilyEquivalent`, the Tarski–Vaught test `Embedding.isElementary_of_exists`, and `ElementarySubstructure`;
- `Theory.IsComplete` and `Set.Definable`;
- `Encodable`, `Primcodable`, `Computable`, `Partrec`, `ComputablePred`, `REPred` and Post's theorem `ComputablePred.computable_iff_re_compl_re'` (a predicate is computable when it and its complement are recursively enumerable);
- `FreeGroup`, `FreeGroup.map`, `FreeGroup.lift`, `PresentedGroup`, `Monoid.PushoutI` and `IsMulTorsionFree`.

Mathlib has no `Primcodable` instance for formulas at the pin. That instance is FreeGroupsAndLimitGroups FG3/effective-encoding.

**From FreeGroupsAndLimitGroups** (node ids). Each node below is assumed with exactly its stated hypotheses.

- FG3: `group-language`, `effective-encoding`, `syntax-operations-computable`, `term-to-word`, `quantifier-free-normal-form`.
- FG5: `coefficient-free-product`, `algebraic-set-radical`, `separation-discrimination`, `linear-equationally-noetherian`.
- FG6: `surface-group`, `surface-splittings`, `finite-index-surface`, `quadratic-equation`, `regular-quadratic`, `quadratic-radicals`, `qh-vertex`.
- FG7: `generalized-equation`, `reduction-to-generalized-equations`, `elementary-transformations`, `solver-procedure`, `solver-sound`, `solver-complete`, `existential-universal-deciders`, `positive-normal-form`, `merzljakov-theorem`, `positive-theory-decider`.
- FG8: `fully-residually-free`, `frf-properties`, `limit-group-equivalences`, `centralizer-extension`, `centralizer-extension-discriminated`, `embedding-theorems`, `ntq-system`, `ntq-coordinate-group`.
- FG4: `graph-of-groups`, `fundamental-group`, `tree-action`, `bass-serre-tree`, `kurosh-grushko`, `induced-splitting`, `collapse-and-refinement`, `dehn-twist`.
- FG1: `centralizer-cyclic`.
- FG2: `howson-intersection`.
- FG10: `universally-elliptic-jsj`, `jsj-existence`, `frf-basic-algorithms`, `frf-basic-algorithms-correct`, `effective-grushko`, `effective-jsj`, `makanin-razborov-diagram`, `effective-makanin-razborov`, `effective-components`, `equations-over-limit-groups`.
- FG11: `compatibility-and-lifts`, `lift-characterisation`, `basic-automorphisms`, `generic-families`, `ift-regular-quadratic`, `ift-regular-ntq`.

One statement is requested from FG8: limit groups without ℤ² are hyperbolic (see Requests).

FG10/`equations-over-limit-groups` rests on a recorded gap of FreeGroupsAndLimitGroups (the elimination process over NTQ groups). Only FO6/parametric-tree uses it, for the complete description of all formula solutions over NTQ groups (see Gaps). The ∀∃ decider of FO5 does not: it searches for one formula solution per vertex and detects false sentences by searching for a counterexample.

## How to read the build

The layers are listed in build order: FO1, FO2, FO4, FO3, FO5, FO6, FO7. FO1 fixes the formulas, the alternating standard form and the free lifting theorem. FO2 gives the description of solution sets on which everything else runs (strict and well-aligned fundamental sequences and their canonical NTQ systems) and the parametrization theorem, which produces formula solutions over correcting extensions of arbitrary NTQ systems. FO4 comes before FO3 because the configuration groups of FO3 are made of algebraic, pairwise non-MAX-equivalent solutions. FO4 gives MAX-equivalence, reducing quotients, algebraic solutions and the existence of a uniform bound on their number. FO3 gives the constructions that control solutions along a tower: induced NTQ systems, projective images, tight envelopes and configurations. FO5 builds the ∀∃-decision tree and proves it finite and correct. Run alongside a search for counterexamples, it decides the ∀∃-theory, by Post's theorem. That decider makes the bound of FO4 computable. FO6 runs the same tree with parameters, describes the parameters at which an ∃∀∃-formula holds level by level as Boolean combinations of ∃∀-sets, and wraps this in the outer elimination procedure, whose termination measure is the number of quantifier blocks. FO7 combines effective elimination with the ∀∃ decider into the decision procedure. Running the coefficient-free elimination uniformly in the rank gives elementary equivalence and the elementary embeddings, and the tower classification and its consequences follow.

## Proof route and alternatives

The proof plan follows Kharlampovich–Myasnikov, as the maintainer's milestone vocabulary does: induced NTQ systems, tight envelopes, configurations, MAX-equivalence, complete reducing systems and decision trees. It uses the form in which they last wrote it, with corrections: QE-FREE (arXiv:1207.1900v4, 2019) for the free group, HYP (arXiv:1303.0760v8, 2016) for the hyperbolic generalization, and IFT for the parametrization theorem. Their 2006 paper KM06 is cited through these texts, which give its theorem and section numbers. Sela's route is recorded at the nodes where the two differ. It uses resolutions, completions and closures, the tree of stratified sets, the sieve procedure and towers (SELA-VI, SELA-ICM). The uniform rank independence and the elementary embedding follow SELA-VI's argument. The classification uses the corrected tower definition of LPS, and Perin's corrected retraction proposition (PERIN, arXiv:0903.0945v3) for its necessity half. The correctness of KM06 was disputed in 2014 (SELA-REPORT) and defended (KM-RESPONSE). The corrections the authors themselves acknowledged are recorded under "Mistakes in the sources". The steps for which only a sketch is available are recorded under "Gaps".

## Worked examples

- ∀x∃y (y = x) is ∀∃. The first step of the decision tree returns the free lift y = x, and the exceptional system a = 1 is inconsistent, so it is true (FO5/ae-tree-first-step).
- ∀x∃y (y ≠ 1 ∧ [x, y] = 1) is true, but its free lift y = x fails at x = 1. The tree closes at level 2 with y = a (FO5/ae-tree).
- ∀x∃y ([x, y] ≠ 1) is false. The tree passes through y = a, then y = b, and reaches x = 1, where no formula solution exists. The parallel counterexample search finds x = 1, where the universal sentence ∀y [1, y] = 1 holds, so the decider answers false (FO5/ae-tree, FO5/ae-decider).
- Vaught's sentence ∀x∀y∀z (x²y²z² = 1 → [x, y] = [x, z] = [y, z] = 1) holds in every free group by Lyndon's theorem and fails in the non-orientable genus-3 surface group, so that group is not elementarily equivalent to F₂ (FO7/non-examples). The genus-4 non-orientable surface group and the orientable genus-2 surface group are elementarily equivalent to F₂ (FO7/surface-groups).

## Layer FO1: Formulas over free groups and the two-block normal form

Boolean combinations of ∀∃-sentences; the reduction of an arbitrary sentence of the language of groups (with constants from the free group) to a Boolean combination of two-block (∀∃) sentences; the general and the positive case; the statement that quantifier elimination down to ∀∃ is the target, with the precise sense in which equivalence over a free group is meant. Planned targets: the syntactic classes of ∀∃- and ∃∀-formulas and their Boolean combinations on Mathlib's bounded formulas; equivalence of formulas over a group (and over F(A) with constants); the computable alternating standard form ∀X₁∃Y₁…∀X_k∃Y_k ⋁(S = 1 ∧ T ≠ 1); free lifts and the free lifting theorem (every sentence true in F is freely lifted, Kharlampovich–Myasnikov's generalization of Merzljakov's theorem); rank independence of positive sentences; the target property of (effective) ∀∃-quantifier elimination.

Planets: ∀∃-formulas and their Boolean combinations; Alternating standard form of a formula; Free lifting theorem; Quantifier elimination to ∀∃-formulas.

#### ∀∃- and ∃∀-formulas and the Boolean combinations of ∀∃-formulas

**Definition.** Node `FO1/quantifier-classes`. Planet: *∀∃-formulas and their Boolean combinations*.
Proposed namespace `FirstOrder.Language.BoundedFormula`, module `TauCeti/ModelTheory/QuantifierClasses`.

For a first-order language L, free variables α and n bound variables, define on L.BoundedFormula α n three syntactic classes. (1) IsForallExists φ (a ∀∃-formula): the least class containing every existential formula (Mathlib's IsExistential: a block of ex over a quantifier-free formula) and closed under all; so φ = ∀x₁…∀xₖ∃y₁…∃yₘ θ with θ quantifier-free, k, m ≥ 0. (2) IsExistsForall φ (an ∃∀-formula): the least class containing every universal formula (Mathlib's IsUniversal) and closed under ex. (3) IsBoolCombAE φ: the least class containing ⊥ and every ∀∃-formula and closed under ∼, ⊓ and ⊔. The classes are syntactic. Because ∼(∀x∃y θ) is realized exactly where ∃x∀y ∼θ is, every ∃∀-formula is equivalent in every structure to the negation of a ∀∃-formula, so the Boolean combinations of ∃∀-formulas and of ∀∃-formulas define the same sets; the sources state quantifier elimination with either class (SELA-VI, HYP: ∀∃ / AE; QE-FREE: ∃∀).

**API.**

- `FirstOrder.Language.BoundedFormula.IsForallExists` (constructor): Inductive predicate: of_isExistential (an existential formula is ∀∃) and all (φ ∀∃ in n + 1 bound variables gives φ.all ∀∃).
- `FirstOrder.Language.BoundedFormula.IsExistsForall` (constructor): Inductive predicate: of_isUniversal and ex.
- `FirstOrder.Language.BoundedFormula.IsBoolCombAE` (constructor): Inductive predicate: falsum, of_isForallExists, not, inf, sup.
- `FirstOrder.Language.BoundedFormula.IsForallExists.isPrenex` (compatibility): Every ∀∃-formula and every ∃∀-formula is prenex in Mathlib's sense (IsPrenex).
- `FirstOrder.Language.BoundedFormula.IsQF.isForallExists` (compatibility): Every quantifier-free formula is ∀∃ and ∃∀ (through Mathlib's IsQF.isExistential and IsQF.isUniversal).
- `FirstOrder.Language.BoundedFormula.IsExistsForall.exists_isBoolCombAE` (relation): For φ ∃∀ there is ψ with IsBoolCombAE ψ (indeed ψ = ∼θ with θ ∀∃) realized in every structure exactly where φ is.
- `FirstOrder.Language.BoundedFormula.IsForallExists.subst` (functoriality): Simultaneous substitution of terms for free variables (Mathlib's subst) preserves each of the three classes.
- `FirstOrder.Language.BoundedFormula.IsBoolCombAE.iff` (other): The biconditional (Mathlib's iff) of two Boolean combinations is a Boolean combination.

**Uses.**

- QE-FREE, Theorem 1, p. 1: the output class of the effective quantifier elimination
- SELA-VI, Theorem 1, p. 2: the Boolean algebra of AE sets that contains every definable set
- FO5 (the ∀∃ decider): the input class of the decision procedure is the ∀∃-sentences; ∃∀-sentences are decided through negation
- FO6 (the outer procedure): the procedure returns members of IsBoolCombAE and its measure counts quantifier blocks

**Unit tests.**

- `IsForallExists.of_isQF_example` (degenerate): For θ the atomic formula x = y (two free variables, no bound variables), IsForallExists θ, IsExistsForall θ and IsBoolCombAE θ all hold.
- `IsForallExists.all_ex_example` (computation): For θ = (&0 = &1) in two bound variables, (θ.ex).all, i.e. ∀x∃y x = y, is IsForallExists, and (θ.all).ex, i.e. ∃x∀y x = y, is IsExistsForall.
- `not_isForallExists_ex_all` (non-example): For θ atomic in two bound variables, (θ.all).ex (∃x∀y θ) is not IsForallExists: its outermost symbol is ex while its body contains all, which no existential formula does; a definition of ∀∃ as 'prenex with at most one alternation' in either order would accept it.
- `not_isForallExists_all_ex_all` (non-example): For θ atomic in three bound variables, ((θ.all).ex).all (∀∃∀) is neither IsForallExists nor IsExistsForall.
- `IsForallExists.isPrenex_example` (compatibility): Every IsForallExists formula satisfies Mathlib's IsPrenex; for ∀x∃y x = y both hold.

**Construction or proof.**

1. Define IsForallExists and IsExistsForall as inductive predicates with two constructors each (base from Mathlib's IsExistential, respectively IsUniversal; closure under all, respectively ex).
2. Define IsBoolCombAE inductively with constructors falsum, of_isForallExists, not, inf, sup; ⊤ = ∼⊥ is then a member.
3. Prove the semantic duality: for θ quantifier-free, ∼(all…all (ex…ex θ)) and ex…ex (all…all ∼θ) have the same realizations (Mathlib's realize_not, realize_all, realize_ex), so every ∃∀-formula is equivalent in every structure to a member of IsBoolCombAE.

**Acceptance.**

- A quantifier-free formula is ∀∃, ∃∀ and a Boolean combination of ∀∃-formulas.
- ex (all θ) with θ atomic is ∃∀ but not ∀∃; all (ex (all θ)) is neither.

**Prerequisites.** `mathlib:FirstOrder.Language.BoundedFormula`, `mathlib:FirstOrder.Language.BoundedFormula.IsExistential`, `mathlib:FirstOrder.Language.BoundedFormula.IsUniversal`, `mathlib:FirstOrder.Language.BoundedFormula.IsQF`, `mathlib:FirstOrder.Language.BoundedFormula.IsPrenex`

**Sources.**

- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), Theorem 1, p. 2. states quantifier elimination over F_k as membership of every definable set in the Boolean algebra generated by AE sets
- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §1, Theorem 1 and formula (1), p. 1. states the effective elimination to Boolean combinations of ∃∀-formulas and singles out conjunctive ∃∀-formulas ∃X∀Y(U = 1 ∧ V ≠ 1)
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §1, Theorem 1, p. 1. the same elimination stated with ∀∃-formulas
- [The Mathlib Community, Mathlib (first-order logic, model theory, computability, free groups)](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174), Mathlib/ModelTheory/Complexity.lean (IsQF, IsPrenex, IsUniversal, IsExistential). the quantifier-free, prenex, universal and existential classes on which the new classes are built

#### Equivalence of formulas over a group, and the sense of equivalence over a free group

**Definition.** Node `FO1/equivalence-over`.
Proposed namespace `FirstOrder.Language.BoundedFormula`, module `TauCeti/ModelTheory/QuantifierClasses`.

For an L-structure M, bounded formulas φ, ψ : L.BoundedFormula α n are equivalent over M (written φ ∼_M ψ) when φ.Realize v xs ↔ ψ.Realize v xs for all v : α → M and xs : Fin n → M. For the language of groups with coefficients carried by free variables (FG3: an L_A-formula with parameters P is a formula with free variables A ⊕ P, realized in a group G with coefficients c : A → G under Sum.elim c v), two L_A-formulas are equivalent over F(A) when they define the same subset of F(A)^P with c = FreeGroup.of; they are equivalent modulo a set T of sentences when every model of T realizes them at the same tuples (IFT §2.3, p. 5, writes Φ ∼_T Ψ). Equivalence over F(A) is equivalence modulo the complete theory Th_A(F(A)) of F(A) with its constants. Quantifier elimination over F(A) (FO1/qe-target, FO6, FO7) means equivalence over F(A) in this sense; the uniform statement for coefficient-free formulas over all nonabelian free groups of finite rank is FO7/uniform-qe.

**API.**

- `FirstOrder.Language.BoundedFormula.EquivOver` (data): EquivOver M φ ψ :⇔ ∀ v xs, φ.Realize v xs ↔ ψ.Realize v xs.
- `FirstOrder.Language.BoundedFormula.EquivOver.refl` (structure): EquivOver M is reflexive, symmetric (symm) and transitive (trans).
- `FirstOrder.Language.BoundedFormula.EquivOver.not` (structure): Congruence: EquivOver M φ ψ gives EquivOver M ∼φ ∼ψ; likewise inf, sup, all, ex.
- `FirstOrder.Language.Formula.equivOver_iff_mem_completeTheory` (compatibility): For φ ψ : L.Formula (Fin k), EquivOver M φ ψ ↔ Formula.iAlls (Fin k) ((φ.iff ψ).relabel Sum.inr) ∈ L.completeTheory M: the universal closure of φ ↔ ψ, a sentence after relabelling the free variables into Empty ⊕ Fin k (Mathlib's iAlls β quantifies the Sum.inr variables of a formula over α ⊕ β).
- `FirstOrder.Language.BoundedFormula.EquivOver.of_elementarilyEquivalent` (compatibility): If M ≅[L] N and φ ∼_M ψ for formulas φ ψ : L.Formula (Fin k), then φ ∼_N ψ.
- `FirstOrder.Language.Formula.equivOver_iff_setOf` (characterisation): For formulas, EquivOver M φ ψ ↔ setOf φ.Realize = setOf ψ.Realize (equality of the defined sets).
- `FirstOrder.Language.BoundedFormula.equivOver_toPrenex` (example): In a nonempty structure, EquivOver M φ φ.toPrenex (Mathlib's realize_toPrenex).

**Uses.**

- IFT, §2.3, p. 5: equivalence of formulas modulo T and over G, the sense in which normal forms hold
- QE-FREE, Theorem 1, p. 1: 'defines the same set as φ over F': equivalence over F with constants
- FO6/qe-procedure-correct: the correctness statement of the elimination
- FO7/uniform-qe: the uniform statement over all nonabelian free groups

**Unit tests.**

- `EquivOver.trivialGroup` (degenerate): In the trivial group (Unit with the group structure), for every formula φ with free variables Fin 1, EquivOver φ ⊤ or EquivOver φ ⊥; in particular x = 1 is equivalent to ⊤.
- `EquivOver.center_freeGroup` (computation): Over FreeGroup (Fin 2), the formula ∀y (x·y = y·x) in one free variable x is equivalent to x = 1 (the centre of a nonabelian free group is trivial).
- `EquivOver.center_int_nonexample` (non-example): Over Multiplicative ℤ the same formula ∀y (x·y = y·x) is equivalent to ⊤, not to x = 1: equivalence depends on the structure, so a definition that ignored M (logical equivalence) would be wrong.
- `EquivOver.toPrenex_freeGroup` (compatibility): For every φ, EquivOver (FreeGroup (Fin 2)) φ φ.toPrenex, by Mathlib's realize_toPrenex (free groups are nonempty).

**Construction or proof.**

1. Define EquivOver M φ ψ by the displayed biconditional; it is an equivalence relation and a congruence for ∼, ⊓, ⊔, all and ex by Mathlib's realize lemmas.
2. Relate it to the complete theory: for formulas (n = 0) with finitely many free variables, φ ∼_M ψ iff the universal closure iAlls of φ.iff ψ is in L.completeTheory M.
3. Relate it to definable sets: φ ∼_M ψ iff the sets {v | φ.Realize v} and {v | ψ.Realize v} coincide.

**Acceptance.**

- Over the trivial group every formula is equivalent to ⊤ or ⊥.
- Over F(a, b) the formula ∀y (x y = y x) is equivalent to x = 1.

**Prerequisites.** `mathlib:FirstOrder.Language.BoundedFormula.Realize`, `mathlib:FirstOrder.Language.completeTheory`, `mathlib:FirstOrder.Language.Formula.iAlls`, `mathlib:FirstOrder.Language.BoundedFormula.iff`, `mathlib:Set.Definable`, `FreeGroupsAndLimitGroups:FG3/group-language`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §2.3, p. 5. defines Th_A(H), elementary equivalence in L_A and equivalence of formulas modulo a theory, written Φ ∼_T Ψ, with ∼_G for T = Th_A(G)
- [The Mathlib Community, Mathlib (first-order logic, model theory, computability, free groups)](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174), Mathlib/ModelTheory/Semantics.lean (Realize, completeTheory) and Definability.lean (Set.Definable). the realization relation, complete theories and definable sets used to state the equivalence

#### The alternating standard form ∀X₁∃Y₁…∀X_k∃Y_k ⋁(S = 1 ∧ T ≠ 1)

**Theorem.** Node `FO1/standard-form`. Planet: *Alternating standard form of a formula*.

There is a computable map stdForm on (codes of) L_A-formulas with parameters P such that stdForm φ has the shape ∀X₁∃Y₁…∀X_k∃Y_k ⋁_{i=1}^{r}(S_i = 1 ∧ T_i ≠ 1), with k ≥ 0 and tuples X_j, Y_j possibly empty, in one of two forms. (1) General form: each S_i = 1 is a finite (possibly empty) system of equations and each T_i ≠ 1 a finite (possibly empty) system of inequations, every component a word in X ∪ Y ∪ P ∪ A, and φ ∼_T stdForm φ for T the group axioms (equivalent in every group with coefficients; IFT §2.3). If φ is coefficient-free, so is its general form. (2) Merged form: over the class of torsion-free nonabelian CSA groups satisfying Vaught's condition and containing non-commuting coefficients a, b ∈ A, in particular over F(A) with |A| ≥ 2, each S_i and each T_i is a single word, computed effectively from the general form (IFT Corollaries 3, 5, Lemma 5 and Corollary 7); the merging introduces the constants a, b, so the merged form of a coefficient-free formula is not coefficient-free. The number k of ∀∃-blocks is the block count used as the termination measure in FO6.

**Hypotheses.**

- Merged form (2) only: the group is torsion-free, nonabelian, CSA, satisfies Vaught's condition and contains non-commuting coefficients a, b ∈ A (every nonabelian free group F(A) with |A| ≥ 2 does).

**Construction or proof.**

1. Apply Mathlib's toPrenex and realize_toPrenex (groups are nonempty).
2. Group equal adjacent quantifiers into blocks and insert empty blocks (fictitious quantifiers over unused variables) so that the prefix alternates and starts with ∀ and ends with ∃.
3. Rewrite the matrix with FG3/quantifier-free-normal-form as a finite disjunction of systems (the general form (1)); over F(A) merge each system into one equation and one inequation with IFT Corollaries 3, 5 and Lemma 5 (planned in FG7/positive-normal-form; the merged form (2)).
4. Each step is a primitive recursive operation on codes (FG3/syntax-operations-computable).

**Acceptance.**

- ∀x∃y([x, y] = 1) is already in standard form with k = 1.
- ∃y (y² = a) gets k = 1 with X₁ empty; a quantifier-free formula gets k = 0.
- For coefficient-free φ the general form (1) is coefficient-free, while the merged form (2) contains the constants a, b of the Malcev and commutator encodings.

**Prerequisites.** `mathlib:FirstOrder.Language.BoundedFormula.toPrenex`, `mathlib:FirstOrder.Language.BoundedFormula.realize_toPrenex`, `FreeGroupsAndLimitGroups:FG3/quantifier-free-normal-form`, `FreeGroupsAndLimitGroups:FG3/syntax-operations-computable`, `FreeGroupsAndLimitGroups:FG7/positive-normal-form`, `FO1/quantifier-classes`, `FO1/equivalence-over`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §2.3, pp. 4–5. every quantifier-free formula is a disjunction of conjunctions of equations and inequations; every formula is equivalent to a prenex one, and with fictitious quantifiers to the alternating form ∀X₁∃Y₁…∀X_k∃Y_k Ψ
- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §3.1, Corollary 7 and Lemma 5, p. 13. over the class of torsion-free nonabelian CSA groups with Vaught's condition a quantifier-free formula is effectively equivalent to ⋁(S_i = 1 ∧ T_i ≠ 1)
- [Olga Kharlampovich, Alexei Myasnikov, Tarski's problem about the elementary theory of free groups has a positive solution](https://www.ams.org/journals/era/1998-04-14/S1079-6762-98-00047-X/S1079-6762-98-00047-X.pdf), formula (1), p. 101 of the announcement. the same alternating form with a disjunction of conjunctions of equations and inequations as matrix

#### Free lifts of a sentence: formal witnesses in F[X]

**Definition.** Node `FO1/free-lift`.
Proposed namespace `FreeGroup.FirstOrder`, module `TauCeti/GroupTheory/FreeGroup/FirstOrder/FreeLift`.

Let F = F(A) and let φ = ∀x₁∃y₁…∀x_k∃y_k φ₀ be an L_A-sentence in standard form (FO1/standard-form, blocks written as single variables for brevity), with φ₀ quantifier-free. For i ≤ k write F[x₁,…,x_i] = F ∗ F(x₁,…,x_i) (FG5/coefficient-free-product). F freely lifts φ when there are words q₁(x₁) ∈ F[x₁], q₂(x₁, x₂) ∈ F[x₁, x₂], …, q_k(x₁,…,x_k) ∈ F[x₁,…,x_k] such that φ₀(x₁, q₁(x₁), …, x_k, q_k(x₁,…,x_k)) holds in the group F[X] = F ∗ F(x₁,…,x_k) with the x_i as constants. The tuple (q₁,…,q_k) is a free lift; the i-th witness depends only on the first i universal variables. For positive φ₀ (a single equation) these are Merzljakov's formal solutions (FG7/merzljakov-theorem).

**API.**

- `FreeGroup.FirstOrder.FreeLift` (data): A free lift: q : (i : Fin k) → FreeGroup (A ⊕ Fin (i + 1)) whose substitution verifies the matrix in FreeGroup (A ⊕ Fin k).
- `FreeGroup.FirstOrder.FreelyLifts` (data): The proposition that a free lift exists.
- `FreeGroup.FirstOrder.FreelyLifts.of_lift` (constructor): A tuple of words of the required triangular shape verifying the matrix in F[X] gives FreelyLifts.
- `FreeGroup.FirstOrder.FreelyLifts.holds_of_positive` (relation): If φ₀ is positive (no inequations) a free lift specializes, along every homomorphism F[X] → F fixing F, to witnesses in F; hence φ holds in F.
- `FreeGroup.FirstOrder.freelyLifts_iff_merzljakov` (compatibility): For φ₀ a single equation S = 1, FreelyLifts φ iff the formal solutions of FG7/merzljakov-theorem exist.
- `FreeGroup.FirstOrder.FreelyLifts.of_qf` (example): For k = 0, FreelyLifts φ iff φ₀ holds in F.

**Uses.**

- IFT, §4.4, Theorem 4, p. 26: every sentence true in F is freely lifted (FO1/free-lifting-theorem)
- QE-FREE, §3.4, p. 11: the first step of the ∀∃ procedure starts from a free lift Y = f(X) and continues on the set V(X, f(X)) = 1 where it fails
- QE-FREE, §5, p. 26: formula solutions of U = 1 ∧ V ≠ 1 in F(X) ∗ F at the top of the parametric tree

**Unit tests.**

- `FreelyLifts.square` (computation): The sentence ∀x∃y (y = x²) over F(a, b) is freely lifted by q₁ = x² ∈ F[x].
- `not_freelyLifts_root` (non-example): The sentence ∀x∃y (y² = x) is not freely lifted: x is not a square in F(a, b) ∗ ⟨x⟩ (its image in the abelianization has coefficient 1 at x).
- `FreelyLifts.qf_iff` (degenerate): For k = 0 the condition is φ₀ in F[∅] = F: a quantifier-free sentence is freely lifted iff it is true in F.
- `FreelyLifts.commuting_witness` (characterisation): ∀x∃y (y ≠ 1 ∧ [x, y] = 1) is freely lifted by q₁ = x (x ≠ 1 and commutes with x in F[x]), although the witness x fails at the specialization x = 1: a free lift does not by itself verify inequations at every point, which is why the ∀∃ procedure of FO5 continues on the exceptional set.

**Construction or proof.**

1. Represent F[x₁,…,x_i] as FreeGroup (A ⊕ Fin i), included in FreeGroup (A ⊕ Fin k) by FreeGroup.map.
2. A free lift is a k-tuple q with q_i in the image of FreeGroup (A ⊕ Fin i); the condition is the realization of φ₀ in FreeGroup (A ⊕ Fin k) at the valuation x_i ↦ of (inr i), y_i ↦ q_i.

**Acceptance.**

- A free lift of ∀x∃y (y = x²) is q₁ = x².
- A quantifier-free sentence is freely lifted iff it holds in F.

**Prerequisites.** `FreeGroupsAndLimitGroups:FG5/coefficient-free-product`, `FreeGroupsAndLimitGroups:FG3/term-to-word`, `FO1/standard-form`, `mathlib:FreeGroup`, `mathlib:FreeGroup.lift`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §4.4, Definition 13, p. 26. defines when a group freely lifts a sentence in standard form: words with constants from F, the i-th in F[x₁,…,x_i], verifying the matrix in F[X]
- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §4.4, Corollary 9, p. 26. for positive sentences the witnesses are the q_i of Merzljakov's theorem, found by solving the equation with the constraints y_i ∈ F[X_i]

#### Free lifting theorem: every true sentence is freely lifted

**Theorem.** Node `FO1/free-lifting-theorem`. Planet: *Free lifting theorem*.

Let F = F(A) be a nonabelian free group of finite rank. Every L_A-sentence φ in standard form (FO1/standard-form) that is true in F is freely lifted by F (FO1/free-lift): there are words q_i(x₁,…,x_i) ∈ F[x₁,…,x_i] with φ₀(x₁, q₁, …, x_k, q_k) true in F[X]. Moreover the free lift can be chosen so that, for Merzljakov's tuple g₁,…,g_k of FG7/merzljakov-theorem, q_i(g₁,…,g_i) is a witness h_i in F.

**Hypotheses.**

- F nonabelian of finite rank; φ true in F; φ in standard form.

**Construction or proof.**

1. Write φ₀ as ⋁(U_i = 1 ∧ V_i ≠ 1) (FO1/standard-form); choose the elements g₁,…,g_k of Merzljakov's proof (FG7/merzljakov-theorem) and witnesses h₁,…,h_k in F with φ₀(g, h) true.
2. For the disjunct true at (g, h), Merzljakov's argument gives q_i ∈ F[x₁,…,x_i] with U(x, q(x)) = 1 in F[X] and h_i = q_i(g).
3. V(x, q(x)) ≠ 1 in F[X], because its image under the specialization x ↦ g is V(g, h) ≠ 1.
4. Hence the disjunct, and so φ₀, holds in F[X] at (x, q(x)).

**Acceptance.**

- ∀x∃y (y ≠ 1 ∧ [x, y] = 1) is true in F and freely lifted by y = x.
- Merzljakov's theorem is the positive case (no inequations).

**Prerequisites.** `FreeGroupsAndLimitGroups:FG7/merzljakov-theorem`, `FreeGroupsAndLimitGroups:FG7/positive-normal-form`, `FO1/free-lift`, `FO1/standard-form`, `FreeGroupsAndLimitGroups:FG5/coefficient-free-product`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §4.4, Theorem 4 and its proof, pp. 26–27. F freely lifts every L_A-sentence true in F; the proof chooses Merzljakov's g_i, takes witnesses h_i, obtains words q_i with h_i = q_i(g) verifying the equation, shows the inequation is nontrivial in F[X] because it is nontrivial at x = g, and treats disjunctive matrices through Corollary 7

#### Positive sentences: rank independence and truth in every group

**Theorem.** Node `FO1/positive-sentences`.

A positive coefficient-free sentence φ = ∀x₁∃y₁…∀x_k∃y_k (S(X, Y) = 1) (no constants) holds in one nonabelian free group of finite rank iff it holds in all of them, iff it holds in every group. For positive sentences with constants from A the truth value over F(A) is decided by FG7/positive-theory-decider; that decider and Merzljakov's theorem are FreeGroupsAndLimitGroups FG7 targets and are consumed here, not restated.

**Hypotheses.**

- φ positive (no inequations) and coefficient-free.

**Construction or proof.**

1. If φ holds in F_n (n ≥ 2), the free lifting theorem (FO1/free-lifting-theorem) gives q_i ∈ F_n ∗ F(x₁,…,x_i) with φ₀(x, q(x)) true in F_n ∗ F(X); since φ₀ is positive, some conjunction of equations S_j(x, q(x)) = 1 holds in F_n ∗ F(X). (The single-equation encoding of FG7/positive-normal-form is not used here: it introduces the constants a, b, which a homomorphism to G need not preserve.)
2. For any group G and g ∈ G^X, the homomorphism F_n ∗ F(X) → G that is trivial on F_n and sends x ↦ g maps each S_j(x, q(x)) to S_j(g, q̄(g)) = 1, because S_j has no constants; the witnesses q̄_i(g) depend only on g₁,…,g_i, so φ holds in G.
3. Conversely a sentence true in every group is true in every free group.

**Acceptance.**

- ∀x∃y (y = x) holds in every group.
- ∀x∃y (y² = x) holds in no nonabelian free group and fails in ℤ: positive sentences are not all true.

**Prerequisites.** `FO1/free-lifting-theorem`, `FreeGroupsAndLimitGroups:FG7/merzljakov-theorem`, `FreeGroupsAndLimitGroups:FG7/positive-theory-decider`, `FO1/free-lift`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Tarski's problem about the elementary theory of free groups has a positive solution](https://www.ams.org/journals/era/1998-04-14/S1079-6762-98-00047-X/S1079-6762-98-00047-X.pdf), p. 103 of the announcement (history of the problem). reports Merzljakov's theorem that any two nonabelian free groups of finite rank have the same positive theory, and Makanin's decidability of the positive theory
- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §4.4, Corollary 9, p. 26. the decision procedure for positive sentences returning formal witnesses q_i ∈ F[X]

#### ∀∃-quantifier elimination: the target property, plain and effective

**Definition.** Node `FO1/qe-target`. Planet: *Quantifier elimination to ∀∃-formulas*.
Proposed namespace `FirstOrder.Language`, module `TauCeti/ModelTheory/QuantifierClasses`.

For an L-structure M: M has ∀∃-quantifier elimination (HasAEQE M) when for every α, n and φ : L.BoundedFormula α n there is ψ with IsBoolCombAE ψ (FO1/quantifier-classes) and φ ∼_M ψ (FO1/equivalence-over). For the free group F(A) with constants (L_A-formulas with parameters P, FG3), effective ∀∃-quantifier elimination means a computable function on the FG3 codes of L_A-formulas returning such ψ with the same parameters. This is the property the sources prove for F(A) (QE-FREE Theorem 1 with ∃∀; HYP Theorem 1 for torsion-free hyperbolic groups, Γ = F; SELA-VI Theorem 1, non-effective), the endpoint of FO6. It concerns formulas with parameters: restricted to sentences it would hold for every structure, since a sentence is equivalent over M to ⊤ or ⊥.

**API.**

- `FirstOrder.Language.HasAEQE` (data): HasAEQE L M :⇔ ∀ α n (φ : L.BoundedFormula α n), ∃ ψ, ψ.IsBoolCombAE ∧ EquivOver M φ ψ.
- `FreeGroup.FirstOrder.EffectiveAEQE` (data): Existence of a computable qe on codes of L_A-formulas with IsBoolCombAE (qe φ) and EquivOver (FreeGroup A) φ (qe φ).
- `FreeGroup.FirstOrder.EffectiveAEQE.hasAEQE` (projection): Effective elimination gives HasAEQE.
- `FirstOrder.Language.HasAEQE.of_elementarilyEquivalent` (compatibility): HasAEQE L M and M ≅[L] N give HasAEQE L N (for formulas with finitely many free variables).
- `FirstOrder.Language.HasAEQE.definable_iff` (characterisation): Under HasAEQE, a subset of M^α is definable (Mathlib's Set.Definable over ∅) iff it is a finite Boolean combination of sets defined by ∀∃-formulas.
- `FirstOrder.Language.elementarilyEquivalent_of_uniform_aeqe` (relation): If every sentence σ has one ψ_σ with IsBoolCombAE ψ_σ, σ ∼_M ψ_σ and σ ∼_N ψ_σ (a uniform elimination for M and N), then M ≅[L] N iff M and N satisfy the same ∀∃-sentences; this is how FO7 derives elementary equivalence.

**Uses.**

- FO6/qe-procedure-correct: the endpoint of the outer procedure is EffectiveAEQE for F(A)
- FO7/elementary-theory-decidable: effective elimination plus the ∀∃ decider decides Th(F(A))
- SELA-VI, Theorem 3, p. 4: elementary equivalence of free groups from the uniform elimination and the agreement of ∀∃-sentences

**Unit tests.**

- `HasAEQE.trivialGroup` (degenerate): HasAEQE holds for the trivial group: every formula is equivalent over it to ⊤ or ⊥, both quantifier-free.
- `hasAEQE_sentences_vacuous` (non-example): For every structure M and sentence σ, σ ∼_M ⊤ or σ ∼_M ⊥; so a definition restricted to sentences would hold for every M and cannot be the target. HasAEQE quantifies over formulas with free variables.
- `HasAEQE.of_elementarilyEquivalent_example` (compatibility): If HasAEQE (FreeGroup (Fin 2)) then HasAEQE N for every group N elementarily equivalent to FreeGroup (Fin 2) in the language of groups.
- `HasAEQE.isBoolCombAE_self` (characterisation): If φ is already IsBoolCombAE then ψ = φ witnesses the condition for φ (EquivOver.refl).

**Construction or proof.**

1. Define HasAEQE M as the displayed ∀∃ statement.
2. Define the effective version as the existence of a computable map on the Primcodable type of codes of formulas (FG3/effective-encoding) with the two properties.
3. Prove that it is invariant under elementary equivalence: if φ ∼_M ψ for formulas then the universal closure of φ.iff ψ lies in Th(M), hence holds in every N ≅[L] M.

**Acceptance.**

- The trivial group has ∀∃-quantifier elimination.
- A structure with effective ∀∃-elimination and a decidable ∀∃-theory has a decidable theory (FO7).

**Prerequisites.** `mathlib:Computable`, `FreeGroupsAndLimitGroups:FG3/effective-encoding`, `FO1/quantifier-classes`, `FO1/equivalence-over`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §1, Theorem 1, p. 1. an algorithm turning a first-order formula into a Boolean combination of ∃∀-formulas defining the same set over F
- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), Theorem 1, p. 2. every definable set over F_k is in the Boolean algebra of AE sets
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §1, Theorem 1, p. 1. the effective form over torsion-free hyperbolic groups

### Dependencies

Within this roadmap: none. Other roadmaps: `FreeGroupsAndLimitGroups:FG3`, `FreeGroupsAndLimitGroups:FG5`, `FreeGroupsAndLimitGroups:FG7`.

### Acceptance tests

The layer is accepted when every node above is stated with its hypotheses, every definition passes its unit tests, and the acceptance items of its theorems hold. Coverage: closed.

## Layer FO2: Non-regular implicit function theorems and the parametrisation theorem

Implicit function theorems for non-regular NTQ systems; the parametrisation theorem for arbitrary NTQ systems with correcting embeddings; lifts of ∀∃-formulas over arbitrary (not necessarily regular) systems. Consumes FG11 for the regular case and FG8 for NTQ towers. Planned targets: strict and well-aligned fundamental sequences (first and second restrictions), canonical NTQ systems of strict sequences and the canonical embedding tree; generic families of solutions of arbitrary NTQ systems and the lifts they force; normalization and correcting extensions of NTQ systems; the parametrization theorem (IFT Theorem 12) and its effective forms for arbitrary NTQ systems and arbitrary systems (IFT Theorems 13–14); groups without sufficient splitting modulo a subgroup and fundamental sequences modulo subgroups.

Planets: Strict fundamental sequences; Canonical NTQ groups; Well-aligned fundamental sequences; Generic families of NTQ systems; Correcting extensions; Parametrization theorem.

#### Strict fundamental sequences of solutions

**Definition.** Node `FO2/strict-fundamental-sequence`. Planet: *Strict fundamental sequences*.
Proposed namespace `LimitGroup.FundSeq`, module `TauCeti/GroupTheory/LimitGroup/FundamentalSequence`.

Let S(X, A) = 1 be a finite system over F = F(A) and G = F_{R(S)}. A fundamental sequence (fundamental set of solutions) is the set of F-homomorphisms G → F of the form π₀ σ₁ π₁ ⋯ σ_{k−1} π_{k−1} φ₀ attached to one branch G → G₁ → ⋯ → G_k = F(Y) ∗ F of a Makanin–Razborov (Hom-) diagram (FG10/makanin-razborov-diagram): π_i fixed proper F-epimorphisms between fully residually free groups, σ_i canonical automorphisms of G_i (generated by Dehn twists along edges of the Grushko-then-abelian-JSJ decomposition of G_i, automorphisms of QH vertex groups fixing peripheral structure, and automorphisms of abelian vertex groups fixing edge groups), φ₀ an arbitrary F-homomorphism F(Y) ∗ F → F. It is strict when, for every 1 ≤ i < k: (1) π_i maps every non-abelian vertex group of G_i to a non-abelian subgroup; (2) π_i is injective on rigid vertex groups, on edge groups and on the subgroups generated by images of edge groups in abelian vertex groups; (3) π_i is injective on the envelope ⟨R, Is(η₁(E₁)), …, Is(η_m(E_m))⟩ of each rigid vertex group R, where E_j are the edges from R to abelian vertex groups A_j and Is(·) is the isolator (least direct factor containing it) in A_j; (4) distinct Grushko factors of G_i go to distinct free factors of G_{i+1}. Property (3) is the correction the authors made to KM06, whose fundamental sequences satisfied only (1)–(2).

**API.**

- `LimitGroup.FundSeq` (data): A fundamental sequence: a branch of a Hom-diagram with canonical automorphism groups at its vertices.
- `LimitGroup.FundSeq.homs` (projection): The set of F-homomorphisms G → F of the sequence.
- `LimitGroup.FundSeq.IsStrict` (data): Conditions (1)–(4) above.
- `LimitGroup.FundSeq.envelope` (data): The envelope of a rigid vertex group: the subgroup generated by it and the isolators of the images of its adjacent abelian edge groups.
- `LimitGroup.FundSeq.homs_subset` (relation): Every homomorphism of the sequence factors through the terminal group F(Y) ∗ F and is a solution of S.
- `LimitGroup.FundSeq.IsStrict.injective_envelope` (projection): For a strict sequence, π_i is injective on the envelope of every rigid vertex group of G_i.

**Uses.**

- QE-FREE, §3.1, p. 7: the first restriction is imposed on strict sequences only
- IFT, §7.6, Theorem 12, p. 142: the parametrization theorem is stated for an NTQ system with a fundamental sequence of solutions
- FO2/canonical-ntq: the canonical NTQ system is built from a strict fundamental sequence
- FO5/ae-tree: every vertex of the ∀∃-tree carries a well-aligned strict fundamental sequence

**Unit tests.**

- `FundSeq.trivial_isStrict` (degenerate): For the empty system over F(a, b), G = F[X] and the one-level sequence F(X) ∗ F with no proper epimorphism is strict, and its homomorphisms are all F-homomorphisms F[X] → F.
- `FundSeq.homs_centralizer` (computation): For S = ([x, a] = 1) over F(a, b), G = ⟨a, b, x | [x, a]⟩ and the one-level sequence G → F(a, b) (x ↦ 1) through the canonical automorphisms x ↦ x a^m consists of the homomorphisms x ↦ a^m, m ∈ ℤ, which are all solutions of S.
- `not_isStrict_kills_edge` (non-example): A sequence in which some π_i (1 ≤ i < k) sends a non-trivial edge group of the decomposition of G_i to 1 violates condition (2) and is not strict. An edge group generated by constants cannot serve as an example: in F(a, b) ∗_{[a,b]=[x,y]} ⟨x, y⟩ the edge group ⟨[a, b]⟩ lies in F and is fixed by every π_i, which are F-homomorphisms.
- `FundSeq.isStrict_mono` (compatibility): A sequence strict in the sense of this node (QE-FREE Definition 1, whose envelope ⟨R, Is(η₁(E₁)), …, Is(η_m(E_m))⟩ uses isolators) is strict in the sense of HYP Definition 5 with Γ = F, whose envelope ⟨R, η₁(E₁), …, η_m(E_m)⟩ omits the isolators and is contained in the former; the converse is not claimed, and this roadmap uses the stronger QE-FREE condition.

**Construction or proof.**

1. Represent a fundamental sequence by a branch of an FG10 diagram together with the canonical automorphism groups Q_v at its vertices (finite generating lists of automorphisms, FG10/frf-basic-algorithms).
2. State conditions (1)–(4) as predicates on the branch data, using the abelian JSJ decompositions of FG10 and isolators in free abelian vertex groups.
3. The set of homomorphisms of the sequence is the image of the composite map from Q_{v₁} × ⋯ × Q_{v_{k−1}} × Hom_F(F(Y) ∗ F, F).

**Acceptance.**

- For S = ∅ (G = F[X]) the one-vertex sequence G = F(X) ∗ F with φ₀ arbitrary is strict.
- A sequence whose π₁ kills an edge group of G₁ is not strict.

**Prerequisites.** `FreeGroupsAndLimitGroups:FG10/makanin-razborov-diagram`, `FreeGroupsAndLimitGroups:FG10/universally-elliptic-jsj`, `FreeGroupsAndLimitGroups:FG4/kurosh-grushko`, `FreeGroupsAndLimitGroups:FG4/dehn-twist`, `FreeGroupsAndLimitGroups:FG6/qh-vertex`, `FreeGroupsAndLimitGroups:FG8/fully-residually-free`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §2.2, properties (i)–(iv) of the tree T and Definition 1, pp. 2–3. the fundamental sequences attached to the branches of the canonical Hom-diagram, and the four strictness conditions with the envelope of a rigid subgroup through isolators
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §3.2, Definitions 4–5 and Remark 1, pp. 10–12. the same notions over Γ, except that the envelope in property 3 is generated by R and the edge-group images η_j(E_j) themselves, without isolators; Remark 1 records that the fundamental sequences of KM06 had properties 1–2 only and should also have property 3
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), §§7.6–7.7 (as cited in QE-FREE §2.2). the augmented canonical embedding tree and its fundamental sequences

#### The canonical NTQ system of a strict fundamental sequence

**Construction.** Node `FO2/canonical-ntq`. Planet: *Canonical NTQ groups*.
Proposed namespace `LimitGroup.FundSeq`, module `TauCeti/GroupTheory/LimitGroup/FundamentalSequence`.

To a strict fundamental sequence G → G₁ → ⋯ → G_k = F(Y) ∗ F (FO2/strict-fundamental-sequence) one assigns, bottom-up, an NTQ system (FG8/ntq-system) whose coordinate group N₁ contains the image of G. At level k − 1, for each free factor of G_{k−1} with abelian JSJ decomposition D: (Step 1) for each edge of D between rigid vertex groups extend the centralizer of the image of its edge group in G_k by a new letter, adding commutation relations so that the result H₁ is commutative transitive; (Step 2) for each non-cyclic abelian vertex group A = Is(A_e) × A₀ extend the centralizer of the image of Is(A_e) by A₀ (equations [y_p, y_q] = 1, [y_p, d̄_j] = 1), identifying abelian vertex groups whose images become conjugate into one abelian subgroup; (Step 3) for each QH vertex group with relation ∏[x_i, y_i] p₁⋯p_m = 1 add a quadratic equation ∏[x_i, y_i] c₁^{z₁}⋯c_{m−1}^{z_{m−1}} c_m = 1 with the images c_j of the boundary elements as coefficients. The free product over the factors is the level-(k−1) group; repeating upwards gives N₁ = F_{R(W)} with W NTQ, and G embeds in N₁ when the sequence is strict. The construction is effective (finite presentations of the N_i and generators of their canonical automorphism groups).

**API.**

- `LimitGroup.FundSeq.canonicalNTQ` (data): The NTQ system W of a strict fundamental sequence.
- `LimitGroup.FundSeq.canonicalNTQ_embedding` (projection): The canonical embedding of the image of G in F_{R(W)}.
- `LimitGroup.FundSeq.homs_factor_canonicalNTQ` (relation): Every homomorphism of the sequence factors through F_{R(W)} and the completed fundamental sequence of W (retractions ¯π_i and canonical automorphisms ¯σ_i).
- `LimitGroup.FundSeq.canonicalNTQ_computable` (other): The finite presentation of each level and the generators of its canonical automorphism group are computed from the sequence.
- `LimitGroup.FundSeq.canonicalNTQ_free` (example): For the trivial sequence of the empty system the canonical NTQ system is empty and F_{R(W)} = F(X) ∗ F.

**Uses.**

- QE-FREE, §3.4, p. 11: the ∀∃-tree assigns to each branch b the NTQ system S(b) and its corrective extension
- IFT, §7.6, Theorem 12, p. 142: the parametrization theorem lifts formulas into corrective extensions of these NTQ groups
- FO3/induced-ntq: the induced NTQ system of a subgroup is built inside a canonical NTQ group

**Unit tests.**

- `canonicalNTQ.empty` (degenerate): For the empty system the canonical NTQ system is empty and its coordinate group is F(X) ∗ F.
- `canonicalNTQ.quadratic` (computation): For G = F(a, b) ∗_{[a,b]=[x,y]} ⟨x, y⟩ with the one-level sequence collapsing ⟨x, y⟩ through a non-abelian map, the canonical NTQ system is the single equation [x, y][a, b]⁻¹ = 1 (one QH level, Step 3) and N₁ = G.
- `canonicalNTQ.centralizer` (computation): For G = F(a, b) ∗_{a = t⁻¹at} (the extension of the centralizer of a by t), the canonical NTQ system is the centralizer-extension level [t, a] = 1 and N₁ ≅ G.
- `canonicalNTQ.not_embedding_without_strict` (non-example): If π₁ is not injective on an edge group (the sequence is not strict) the image of G need not embed in the group built by Steps 1–3: strictness is a hypothesis of the embedding.

**Construction or proof.**

1. Work level by level from the bottom; at each level treat the Grushko factors separately and take the free product.
2. Steps 1–3 as in the statement; check commutation transitivity after each extension by the conjugacy and centralizer algorithms of FG10/frf-basic-algorithms.
3. Embedding of G: strictness (conditions (2)–(3)) makes the rigid part embed in the iterated centralizer extension, the abelian vertex groups embed through Step 2 and the QH vertex groups through Step 3; FG8/ntq-coordinate-group gives that each level is an NTQ group.

**Acceptance.**

- For a one-level sequence whose G₁ is a QH-vertex group over F, the canonical NTQ system is a single regular quadratic equation over F.
- The completed sequence through N₁ contains every homomorphism of the original sequence.

**Prerequisites.** `FO2/strict-fundamental-sequence`, `FreeGroupsAndLimitGroups:FG8/ntq-system`, `FreeGroupsAndLimitGroups:FG8/ntq-coordinate-group`, `FreeGroupsAndLimitGroups:FG8/centralizer-extension`, `FreeGroupsAndLimitGroups:FG6/quadratic-equation`, `FreeGroupsAndLimitGroups:FG10/effective-jsj`, `FreeGroupsAndLimitGroups:FG10/frf-basic-algorithms-correct`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §2.2, 'Definition of a canonical NTQ system', Steps 1–3, pp. 3–4. the bottom-up construction by centralizer extensions for rigid edges, extension of centralizers by the complements A₀ of isolators, and quadratic levels for QH vertices
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §3.4, pp. 16–20, and Proposition 12, p. 22. the complete set of canonical NTQ groups of a canonical Hom-diagram, the completed fundamental sequences through retractions, and the algorithm producing finite presentations and generators of canonical automorphism groups
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), §7.3 (as cited in QE-FREE §2.2). the original construction

#### Well-aligned fundamental sequences: the first and second restrictions

**Definition.** Node `FO2/well-aligned`. Planet: *Well-aligned fundamental sequences*.
Proposed namespace `LimitGroup.FundSeq`, module `TauCeti/GroupTheory/LimitGroup/FundamentalSequence`.

A strict fundamental sequence for an irreducible system S = 1 over F, with NTQ system Q = (Q₁(X₁,…,X_n) = 1, …, Q_n(X_n) = 1) adjoined with free variables t₁,…,t_k and π_i : F_{R(Q_i,…,Q_n)} ∗ F(t₁,…,t_{k_{i−1}}) → F_{R(Q_{i+1},…,Q_n)} ∗ F(t₁,…,t_{k_i}), is well aligned when it satisfies: (First restriction) for every MQH vertex group Q of every level, with the free decomposition π(Q) = K₁ ∗ ⋯ ∗ K_p ∗ ⟨t_{j₁}⟩ ∗ ⋯ inherited from the reduced free decomposition of the next level, the surface Σ of Q is cut along a maximal family of disjoint non-homotopic simple closed curves mapped to 1 and realizing that decomposition; each piece attached to a rigid vertex group has no further essential simple closed curve mapped to 1 after capping the boundary components mapped to 1, and each piece not attached to a rigid vertex group caps to a closed surface mapped onto a free group of maximal rank. (Second restriction) at every level: images of distinct abelian free factors are distinct free factors of F(t_{k_{i−1}+1},…,t_{k_i}); likewise for surface-group factors; free variables of quadratic equations correspond to new t's and the images of their coefficients are not conjugate into the new free factor; distinct free factors go to distinct free factors. Here k_i is the number of free variables added at level i, so that the free factor at level i + 1 has the k₁ + ⋯ + k_i variables of the levels above it (QE-FREE writes it F(t₁,…,t_{k_i}), sourceIssue E12); the free variables new at level i are the k_i variables written t_{k_{i−1}+1},…,t_{k_i} in the restrictions above. The dimension of the sequence is k₁ + ⋯ + k_n, the total number of free variables, equal to the rank of the free factor of the terminal level.

**API.**

- `LimitGroup.FundSeq.IsWellAligned` (data): The conjunction of the first and second restrictions.
- `LimitGroup.FundSeq.dim` (data): The dimension k₁ + ⋯ + k_n: the total number of free variables t_j added along the sequence.
- `LimitGroup.FundSeq.IsWellAligned.isStrict` (projection): A well-aligned sequence is strict.
- `LimitGroup.FundSeq.IsWellAligned.cut_family` (characterisation): For each MQH vertex group, the family of simple closed curves mapped to 1 by π is maximal and realizes the inherited free decomposition.
- `LimitGroup.FundSeq.dim_le_rank` (relation): The dimension is at most the rank of the terminal free group F(Y).

**Uses.**

- QE-FREE, §3.4, Lemma 1, p. 13: the proof that the image of G on the terminal level is a proper quotient uses the restrictions
- QE-FREE, §3.7, Lemma 2, p. 19: the Kurosh rank count in the finiteness proof uses that abelian and surface factors go to different free factors
- KM-RESPONSE, items (6)–(11), pp. 2–3: the authors stress that all fundamental sequences of the decision procedure satisfy both restrictions

**Unit tests.**

- `IsWellAligned.empty` (degenerate): The one-level sequence F(X) ∗ F → F of the empty system is well aligned with dimension |X|.
- `not_isWellAligned_merge` (non-example): A level map sending two distinct ℤ² free factors into the same free factor of the next level violates the second restriction.
- `IsWellAligned.dim_genus2` (computation): For the coefficient-free equation [x₁, y₁][x₂, y₂] = 1 and the one-level sequence through the retraction x₁ ↦ t₁, y₁ ↦ t₂, x₂ ↦ t₂, y₂ ↦ t₁ onto F(t₁, t₂) (a solution, since [t₁, t₂][t₂, t₁] = 1), the dimension is 2.
- `IsWellAligned.isStrict_example` (compatibility): Every well-aligned sequence is strict (FO2/strict-fundamental-sequence).

**Construction or proof.**

1. State the first restriction surface by surface through the cutting family of simple closed curves (FG6/surface-splittings), and the second through the Grushko factors of each level (FG4/kurosh-grushko).
2. Define the dimension as the total number of free variables t_j added along the sequence.

**Acceptance.**

- The one-level sequence of the empty system is well aligned.
- A sequence sending two abelian free factors into one factor violates the second restriction.

**Prerequisites.** `FO2/strict-fundamental-sequence`, `FO2/canonical-ntq`, `FreeGroupsAndLimitGroups:FG6/surface-splittings`, `FreeGroupsAndLimitGroups:FG6/qh-vertex`, `FreeGroupsAndLimitGroups:FG4/kurosh-grushko`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.1–3.2 and Definition 2, pp. 7–8. the first restriction on MQH subgroups via families of simple closed curves mapped to the identity, the second restriction on free factors, and the name 'well aligned'
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §4.1–4.2 and Definition 9, pp. 26–29. the same restrictions over Γ
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), §§7.8–7.9 (as cited in QE-FREE §3). the original first and second restrictions

#### Finitely many well-aligned strict fundamental sequences cover all solutions

**Theorem.** Node `FO2/canonical-embedding-tree`.

For every finite system S(X, A) = 1 over F = F(A) one can effectively construct a finite set of strict fundamental sequences satisfying the first and second restrictions (well aligned, FO2/well-aligned), the branches of a finite tree T_CE(F_{R(S)}) (the canonical embedding tree), such that every solution of S in F factors through one of them; each comes with its canonical NTQ system (FO2/canonical-ntq) given by a finite presentation.

**Hypotheses.**

- F free of finite rank; S finite with word coefficients.

**Construction or proof.**

1. Start from the effective Makanin–Razborov diagram of FG10/effective-makanin-razborov and refine each branch to a strict one (HYP Proposition 7 reworking).
2. Impose the first restriction by cutting each MQH surface along the curves mapped to 1 and splitting the branch accordingly; impose the second by separating abelian and surface factors; finitely many branches arise at each step.
3. Completeness is preserved because each refinement replaces a set of homomorphisms by a finite union of sets of homomorphisms covering it.

**Acceptance.**

- For the empty system T_CE has one branch.
- Every solution of [x, y] = 1 factors through a branch whose terminal group is free abelian of rank ≤ 2 followed by a map to F.

**Prerequisites.** `FO2/well-aligned`, `FO2/canonical-ntq`, `FreeGroupsAndLimitGroups:FG10/effective-makanin-razborov`, `FreeGroupsAndLimitGroups:FG10/effective-jsj`, `FreeGroupsAndLimitGroups:FG10/effective-components`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.2, Proposition 2, p. 8. the effective finite set of strict fundamental sequences with both restrictions through which every solution factors, forming the canonical embedding tree
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §4.2, Proposition 15, p. 28; §3.6, Proposition 12, p. 22. the same over Γ, and the algorithm for complete sets of canonical NTQ groups
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), §7 (Proposition cited as [18] in QE-FREE Proposition 2). the original construction

#### Generic families of solutions of an NTQ system (all level types)

**Definition.** Node `FO2/ntq-generic-family`. Planet: *Generic families of NTQ systems*.
Proposed namespace `LimitGroup.NTQ`, module `TauCeti/GroupTheory/LimitGroup/GenericFamily`.

Let S(X, A) = 1 be an NTQ system of depth N over F, corresponding to a fundamental sequence (FO2/strict-fundamental-sequence), with levels G_k → G_{k+1}. A generic family Ψ(S) is built level by level from k = N downwards, vertex group by vertex group of the abelian decomposition of G_k: for an empty level, a sequence of growing distinct Merzljakov words; for an abelian vertex group with equations [x_i, x_j] = 1, [x_i, u] = 1, a family containing B-large solutions (σ(x_i) = σ(x₁)^{b₁⋯b_i} or u^{b₁⋯b_i} with all b_i > B) for every B in any increasing sequence; for a QH vertex group with surface S, the basic sequences of automorphisms φ_{L,n} built from Dehn twists along a pants-and-Möbius-band decomposition {b_j} and a filling family {d_j} with exponent tuples growing faster than any prescribed tuple (FG11/basic-automorphisms in general form), composed with generic families of the lower levels and growing powers Θ_k of Dehn twists along edges. Ψ(S) discriminates F_{R(S)} into F. For regular NTQ systems this is FG11's generic family (IFT Definition 44).

**API.**

- `LimitGroup.NTQ.IsGenericFamily` (data): The level-by-level growth condition on a family of solutions of an NTQ system.
- `LimitGroup.NTQ.exists_isGenericFamily` (constructor): Every NTQ system with a fundamental sequence has a generic family inside that sequence.
- `LimitGroup.NTQ.IsGenericFamily.discriminates` (projection): A generic family discriminates F_{R(S)} into F.
- `LimitGroup.NTQ.isGenericFamily_iff_regular` (compatibility): For a regular NTQ system, IsGenericFamily agrees with FG11's generic families (IFT Definition 44) up to passing to subfamilies.
- `LimitGroup.NTQ.IsGenericFamily.subfamily` (structure): A subfamily containing, for every growth tuple, a member growing faster is again generic.

**Uses.**

- QE-FREE, §2.3, Proposition 1, p. 6: generic families give complete lifts (regular) or lifts into corrective extensions (non-regular)
- QE-FREE, §3.7, Lemma 2, p. 19: case (i): the set of homomorphisms through c is generic for each regular quadratic equation
- QE-FREE, §5.2, p. 30: generic families of certificates of configuration groups

**Unit tests.**

- `IsGenericFamily.empty_level` (degenerate): For the empty NTQ system in one variable x over F(a, b), the family x ↦ w_n of growing distinct Merzljakov words is generic and discriminates F[x].
- `IsGenericFamily.abelian` (computation): For [x, a] = 1 over F(a, b), the family x ↦ a^{b_n} with b_n → ∞ is generic; it discriminates F_{R(S)} = ⟨a, b, x | [x, a]⟩ into F.
- `not_isGenericFamily_bounded` (non-example): For [x, a] = 1, the family x ↦ a^{b} with b ∈ {1, …, 10} is not generic: it is not B-large for B = 10, and it does not discriminate: no member keeps all ten elements x a^{−1}, …, x a^{−10} non-trivial.
- `IsGenericFamily.regular_compat` (compatibility): For the regular quadratic equation [x, y] = [a, b] over F(a, b), the families of FG11/generic-families are generic in the present sense.

**Construction or proof.**

1. Fix at each QH vertex the two curve families and the Dehn-twist automorphisms β_j, δ_j; define γ_{L,n} and φ_{L,n} recursively from the exponent tuples L.
2. Define B-large solutions for abelian vertex groups and Merzljakov words for empty levels (FG7).
3. A family is generic when for every n and every increasing tuple A it contains a homomorphism whose exponent tuple grows faster than A; discrimination of F_{R(S)} follows level by level from FG11/generic-families and FG8/centralizer-extension-discriminated.

**Acceptance.**

- For an empty NTQ system the generic families are the families of growing Merzljakov words.
- For the single equation [x, u] = 1 (u ∈ F not a proper power) the family x ↦ u^b, b → ∞, is generic.

**Prerequisites.** `FreeGroupsAndLimitGroups:FG11/basic-automorphisms`, `FreeGroupsAndLimitGroups:FG11/generic-families`, `FreeGroupsAndLimitGroups:FG11/compatibility-and-lifts`, `FreeGroupsAndLimitGroups:FG8/ntq-system`, `FreeGroupsAndLimitGroups:FG7/merzljakov-theorem`, `FO2/strict-fundamental-sequence`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §2.3, pp. 4–6. the level-by-level construction of generic families for empty, abelian (B-large) and QH vertex groups through basic sequences of Dehn twists along two curve families that fill the surface
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §3.7, pp. 22–24. the same construction, with the remark that it contains a test sequence in Sela's sense
- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §7.6, Definition 44, p. 141. generic families for regular NTQ systems and regular quadratic equations, defined by the complete-lift property
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), Definition 22 (as cited in QE-FREE §2.3). the original technical definition

#### Normalization of an NTQ system along a fundamental sequence

**Construction.** Node `FO2/normalized-ntq`.
Proposed namespace `LimitGroup.NTQ`, module `TauCeti/GroupTheory/LimitGroup/Parametrization`.

Let U(X) = 1 be an NTQ system over F with a fundamental sequence V̄(U). Its normalization U* = 1 is obtained by replacing each quadratic level that is not regular (for each of the three non-regular standard forms with a non-commutative solution: c₁^{x₁}c₂^{x₂} = c₁c₂, x₁² c^{x₂} = a² c, x₁² x₂² = a₁² a₂²) by the effectively given system of commutation equations parametrizing its solutions (for instance x₁ = z₁c₁z₃, x₂ = z₂c₂z₃, [z₁, c₁] = [z₂, c₂] = [z₃, c₁c₂] = 1). Then: (1) F_{R(U)} embeds canonically in F_{R(U*)}; (2) U* is an NTQ system each of whose levels is a regular quadratic equation, an empty equation, or a system U_com = {[x_i, x_j] = 1, [x_i, b] = 1} with b in the lower coordinate group; (3) every solution of U in V̄(U) is obtained from a solution of U*.

**API.**

- `LimitGroup.NTQ.normalize` (data): The normalized system U* of an NTQ system along a fundamental sequence.
- `LimitGroup.NTQ.normalize_embedding` (projection): The canonical embedding F_{R(U)} ↪ F_{R(U*)}.
- `LimitGroup.NTQ.normalize_levels` (characterisation): Every level of U* is regular quadratic, empty or of type U_com.
- `LimitGroup.NTQ.normalize_surj` (relation): Every solution of U in V̄(U) is the restriction of a solution of U*.
- `LimitGroup.NTQ.normalize_regular` (example): If U is regular, normalize U = U.

**Uses.**

- IFT, §7.6, p. 141: the correcting extension is applied to the normalized system
- IFT, §7.6, Theorem 12, p. 142: the set NCW(U) = C_W(U*) of the parametrization theorem

**Unit tests.**

- `normalize.regular_id` (degenerate): For the regular equation [x, y] = [a, b] over F(a, b) the normalization is the equation itself.
- `normalize.case3` (computation): For x₁² x₂² = a₁² a₂² over F(a₁, a₂), U* is {x₁ = (a₁z₁)^{z₂}, x₂ = (z₁⁻¹a₂)^{z₂}, [z₁, a₁a₂] = 1, [z₂, a₁²a₂²] = 1}, and the solution x₁ = a₁, x₂ = a₂ comes from z₁ = z₂ = 1.
- `normalize.not_surj_all` (non-example): The normalization covers the solutions in the fundamental sequence V̄(U), not every solution of U: commutative solutions of x₁²x₂² = a₁²a₂² outside V̄(U) need not lift.
- `normalize.embedding_example` (compatibility): For case 1 (c₁^{x₁}c₂^{x₂} = c₁c₂) the coordinate group of the original equation embeds in that of the commutation system, as FG8/centralizer-extension-discriminated predicts.

**Construction or proof.**

1. Go through the levels from the bottom; for each quadratic level not regular, use the classification of the non-regular cases with non-commutative solutions (FG6/quadratic-radicals) and substitute the parametrizing commutation system.
2. The embedding of F_{R(U)} follows from normal forms in the resulting centralizer extensions, or from discrimination by standard automorphisms applied to a non-commuting solution (IFT p. 141).
3. Statements (2) and (3) hold by construction.

**Acceptance.**

- A regular NTQ system is its own normalization.
- x₁² x₂² = a₁² a₂² over F(a₁, a₂) normalizes to the commutation system of case 3.

**Prerequisites.** `FreeGroupsAndLimitGroups:FG8/ntq-system`, `FreeGroupsAndLimitGroups:FG6/regular-quadratic`, `FreeGroupsAndLimitGroups:FG6/quadratic-radicals`, `FreeGroupsAndLimitGroups:FG8/centralizer-extension`, `FO2/strict-fundamental-sequence`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §7.6, the normalization construction and Lemma 76, pp. 140–141. replacement of non-regular quadratic levels by commutation systems in the three listed cases, and the embedding, level-type and lifting statements of Lemma 76

#### Correcting extensions and correcting normalizing embeddings

**Construction.** Node `FO2/correcting-extension`. Planet: *Correcting extensions*.
Proposed namespace `LimitGroup.NTQ`, module `TauCeti/GroupTheory/LimitGroup/Parametrization`.

Let U(X) = 1 be a normalized NTQ system (FO2/normalized-ntq) and W(X, Y) = 1 an equation (or W = 1 ∧ W₁ ≠ 1). Starting from the bottom, each centralizer-extending level U_com(X_i) = 1 is replaced by finitely many systems Ū_com(X_i) = 1 obtained from the periodic structures of the solution tree T_sol of W = 1 ∧ U = 1 with parameters X_i,…,X_n (FG7 generalized equations): each replacement extends the relevant centralizer by a larger free abelian group containing the old one with finite index, with embeddings φ_k between the abelian vertex groups. This yields the finite set C_W(U) of NTQ systems Ū_j with embeddings F_{R(U)} ↪ F_{R(Ū_j)}; combined with normalization, NCW(U) := C_W(U*) with the correcting normalizing embeddings θ_j : F_{R(U)} → F_{R(Ū_j)}. The abelian size ab(N) (sum of ranks of abelian vertex groups of all levels minus the ranks of their direct summands containing edge groups with finite index) is unchanged by correcting extension.

**API.**

- `LimitGroup.NTQ.correctingExt` (data): The finite set NCW(U) relative to W, with its embeddings.
- `LimitGroup.NTQ.correctingExt_embedding` (projection): θ_j : F_{R(U)} → F_{R(Ū_j)} is injective.
- `LimitGroup.NTQ.correctingExt_isNTQ` (structure): Every member of NCW(U) is an NTQ system.
- `LimitGroup.NTQ.abSize_correctingExt` (relation): ab(Ū_j) = ab(U).
- `LimitGroup.NTQ.correctingExt_cover` (characterisation): Every fundamental solution φ of U factors as θ_j ψ for some j and some fundamental solution ψ of Ū_j.
- `LimitGroup.NTQ.correctingExt_noAbelian` (example): Without levels of type U_com, NCW(U) = {U*} with θ the normalization embedding.

**Uses.**

- IFT, §7.6, Theorem 12, p. 142: formal solutions exist in every member of NCW(U)
- QE-FREE, §3.4, p. 11: S_corr(b): the corrective extension at each vertex of the ∀∃-tree
- QE-FREE, §3.5 Case 4, p. 15: G_corr, the image of the corrective extension, decides the next step
- HYP, §3.5, Theorem 4, p. 21: lifts into finitely many corrective extensions

**Unit tests.**

- `correctingExt.no_abelian` (degenerate): For U a single regular quadratic equation (no U_com level), NCW(U) = {U} with θ = id.
- `correctingExt.trivial_W` (computation): For U = ([x, a] = 1) over F(a, b) and W = (y = x), the formula ∃y (y = x) already holds in F_{R(U)}, every member of NCW(U) receives F_{R(U)} injectively, and every solution x = a^m factors through one of them.
- `correctingExt.abSize` (compatibility): For U = ([x, a] = 1) and any W, the abelian size is 1 for U and for every Ū_j.
- `correctingExt.not_identity` (non-example): In general NCW(U) ≠ {U}: for U = {[x₁, a] = 1, [x₂, a] = 1} over F(a, b) the formula ∃y (y² = x₁ ∨ y² = x₂ ∨ y² = x₁x₂) holds at every solution x₁ = a^m, x₂ = a^n (one of m, n, m + n is even) but has no solution in F_{R(U)} = F(a, b) ∗_{⟨a⟩} ⟨a, x₁, x₂⟩, where none of x₁, x₂, x₁x₂ is a square (a square root would lie in the centralizer ⟨a, x₁, x₂⟩ ≅ ℤ³); so a definition that never enlarges abelian vertex groups fails the parametrization theorem. (HYP's counter-example on pp. 21–22 concerns Sela's formulation over a non-free hyperbolic group and is not an instance of this.)

**Construction or proof.**

1. Normalize U (FO2/normalized-ntq).
2. From the bottom, for the first level of type U_com, build T_sol for W = 1 ∧ U = 1 with parameters (FG7), read off the periodic structures at the final vertices, and replace U_com by the finitely many centralizer extensions Ū_com they determine, with embeddings φ_k.
3. Proceed upward; the result is a finite set C_W(U*) with embeddings θ_j; each Ū_j is NTQ and the abelian size is preserved.

**Acceptance.**

- If U has no centralizer-extending levels, NCW(U) = {U*}.
- For U = {[x₁, a] = 1, [x₂, a] = 1} over F(a, b) (one centralizer-extending level, abelian vertex group ⟨a, x₁, x₂⟩ ≅ ℤ³) and W the single equation equivalent to y² = x₁ ∨ y² = x₂ ∨ y² = x₁x₂ (FG7/positive-normal-form), the formula ∀X(U = 1 → ∃y W = 1) is true (of the exponents m, n, m + n of x₁ = a^m, x₂ = a^n one is even), NCW(U) consists of correcting extensions whose embeddings realise index-2 sublattices of ⟨x₁, x₂⟩ on which x₁, x₂ or x₁x₂ becomes a square (for instance x₁ ↦ x₁²; x₂ ↦ x₂²; x₁ ↦ x₁x₂, x₂ ↦ x₁⁻¹x₂), and every solution of U factors through one of them.

**Prerequisites.** `FO2/normalized-ntq`, `FreeGroupsAndLimitGroups:FG8/centralizer-extension`, `FreeGroupsAndLimitGroups:FG7/generalized-equation`, `FreeGroupsAndLimitGroups:FG7/elementary-transformations`, `FreeGroupsAndLimitGroups:FG8/ntq-coordinate-group`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §7.6, Lemma 75 and its proof, pp. 138–139. for a centralizer-extending system U_com that is true at all its solutions, finitely many ⟨b⟩-embeddings φ_k of the free abelian group A(X, b) make the formula hold in the coordinate group and every solution factors through one of them; read off from the periodic structures of T_sol as integer linear systems
- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §7.6, 'correcting extension of centralizers', pp. 141–142. construction of C_W(U) from the periodic structures in T_sol, NCW(U) = C_W(U*), and the correcting normalizing embeddings θ_i
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §3.5, steps (i)–(iii) and the abelian size, pp. 20–21. corrective extensions over Γ: replace free abelian groups of each level by finite-index supergroups depending on the formula, then re-complete to a commutation-transitive NTQ group; ab(N) = ab(N_corr)

#### Parametrization theorem (implicit function theorem for arbitrary NTQ systems)

**Theorem.** Node `FO2/parametrization-theorem`. Planet: *Parametrization theorem*.

Let U(X, A) = 1 be an NTQ system over F = F(A) with a fundamental sequence of solutions V̄(U), and suppose Φ = ∀X(U(X) = 1 → ∃Y(W(X, Y, A) = 1 ∧ W₁(X, Y, A) ≠ 1)) is true in F. Then for every Ū_i ∈ NCW(U) (FO2/correcting-extension, relative to W) and its correcting normalizing embedding θ_i : F_{R(U)} → F_{R(Ū_i)}, the formula ∃Y(W(X^{θ_i}, Y, A) = 1 ∧ W₁(X^{θ_i}, Y, A) ≠ 1) holds in F_{R(Ū_i)}; this can be verified effectively and a solution Y found effectively. Furthermore every fundamental solution φ : F_{R(U)} → F factors as φ = θ_i ψ with ψ a fundamental solution of some Ū_i.

**Hypotheses.**

- U NTQ over F with a fundamental sequence V̄(U); Φ true in F.

**Construction or proof.**

1. Normalize U; on regular quadratic levels the generic families of FG11/generic-families give complete lifts (FG11/ift-regular-quadratic).
2. On centralizer-extending levels, the solutions of W over the generic family are controlled by the periodic structures of T_sol; the correcting extensions adjoin exactly the roots those structures require, so the lift exists in each Ū_i (IFT §7.6).
3. Combine level by level as in FG11/ift-regular-ntq; effectiveness: enumerate candidate Y and test with the word problem in F_{R(Ū_i)} (FG10/frf-basic-algorithms-correct), termination by existence.
4. The factorization statement is FO2/correcting-extension (correctingExt_cover).

**Acceptance.**

- For U regular and without U_com levels this is FG11/ift-regular-ntq.
- For U empty this is the free lifting theorem with one block (FO1/free-lifting-theorem).

**Alternative route and remarks.** Sela's corresponding statement (formal solutions on closures of resolutions, Diophantine geometry II Theorem 1.18 and its uses) is the alternative route; KM-RESPONSE §4(e) disputes one of its applications.

**Prerequisites.** `FO2/correcting-extension`, `FO2/normalized-ntq`, `FO2/ntq-generic-family`, `FreeGroupsAndLimitGroups:FG11/ift-regular-ntq`, `FreeGroupsAndLimitGroups:FG11/ift-regular-quadratic`, `FreeGroupsAndLimitGroups:FG11/lift-characterisation`, `FreeGroupsAndLimitGroups:FG10/frf-basic-algorithms-correct`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §7.6, Theorem 12, p. 142. the parametrization theorem in exactly this form, with effective verification and the factorization of fundamental solutions
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §3.5, Theorem 4, p. 21. the corresponding statement over Γ with corrective extensions, and the counter-example to SELA's formulation in the hyperbolic case
- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.4, p. 11 ('the parametrization theorem ([23], Theorem 12)'). the use at every step of the ∀∃-tree

#### Implicit function theorem for arbitrary NTQ systems, effectively

**Theorem.** Node `FO2/ift-arbitrary-ntq`.

Let U(X, A) = 1 be an NTQ system over F = F(A) and V̄(U) a fundamental set of its solutions. If Φ = ∀X(U(X) = 1 → ∃Y(W = 1 ∧ W₁ ≠ 1)) is true in F, one can effectively find finitely many NTQ systems U₁ = 1, …, U_k = 1 and embeddings θ_i : F_{R(U)} → F_{R(U_i)} with ∃Y(W(X^{θ_i}, Y) = 1 ∧ W₁(X^{θ_i}, Y) ≠ 1) true in each F_{R(U_i)}, and such that every solution φ of U in V̄(U) equals θ_i ψ for some i and some fundamental solution ψ of U_i.

**Hypotheses.**

- U NTQ over F; Φ true in F.

**Construction or proof.**

1. Take {U_i} = NCW(U) with the correcting normalizing embeddings and apply FO2/parametrization-theorem; the construction of NCW(U) is effective.

**Acceptance.**

- For regular U and no U_com levels, k = 1 and θ₁ = id.

**Prerequisites.** `FO2/parametrization-theorem`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §7.6, Theorem 13, p. 142. the effective form for arbitrary NTQ systems, derived from Theorem 12 and Section 5

#### Lifting ∀∃-formulas over an arbitrary system of equations

**Theorem.** Node `FO2/lift-arbitrary-system`.

Let S(X) = 1 be an arbitrary finite system over F = F(A). If Φ = ∀X∃Y(S(X) = 1 → (W(X, Y, A) = 1 ∧ W₁(X, Y, A) ≠ 1)) is true in F, one can effectively find finitely many NTQ systems U₁,…,U_k and F-homomorphisms θ_i : F_{R(S)} → F_{R(U_i)} such that ∃Y(W(X^{θ_i}, Y) = 1 ∧ W₁(X^{θ_i}, Y) ≠ 1) holds in each F_{R(U_i)}, and every solution φ of S factors as θ_i ψ through a fundamental solution ψ of some U_i.

**Hypotheses.**

- S finite over F; Φ true in F.

**Construction or proof.**

1. Cover the solutions of S by the finitely many canonical NTQ systems of FO2/canonical-embedding-tree (homomorphisms F_{R(S)} → F_{R(W_b)}).
2. Apply FO2/ift-arbitrary-ntq to each W_b and compose the homomorphisms.

**Acceptance.**

- For S empty this is the free lifting theorem in one block.

**Prerequisites.** `FO2/ift-arbitrary-ntq`, `FO2/canonical-embedding-tree`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §7.6, Theorem 14, p. 142. the lifting statement for an arbitrary system S, through finitely many NTQ systems and F-homomorphisms
- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.4, p. 11. used at the first step after the free lift: the remaining X form the algebraic set of U₀ = V(X, f(X))

#### Generic families force lifts: complete lifts (regular) and lifts into correcting extensions (general)

**Theorem.** Node `FO2/generic-family-lifts`.

Let Ψ(W) be a generic family (FO2/ntq-generic-family) for an NTQ system W(X, A) = 1 over F, and V(X, Y, A) = 1 an equation such that V(X^ψ, Y, A) = 1 has a solution for every ψ ∈ Ψ(W). If W is regular, V = 1 admits a complete W-lift (FG11/compatibility-and-lifts). If W is not regular, V = 1 admits a complete W-lift into the correcting extensions of W (FO2/correcting-extension): finitely many extensions, through one of which every solution of W factors.

**Hypotheses.**

- Ψ(W) generic; V solvable along all of Ψ(W).

**Construction or proof.**

1. Regular case: IFT Definition 44 with FG11/ift-regular-ntq.
2. General case: normalize, apply the regular case on regular quadratic levels and the correcting extension on U_com levels, as in the proof of FO2/parametrization-theorem.

**Acceptance.**

- For W regular quadratic and V compatible, this is FG11/ift-regular-quadratic.

**Prerequisites.** `FO2/ntq-generic-family`, `FO2/parametrization-theorem`, `FreeGroupsAndLimitGroups:FG11/ift-regular-ntq`, `FreeGroupsAndLimitGroups:FG11/compatibility-and-lifts`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §2.3, Proposition 1, p. 6. the two cases (regular: complete W-lift; non-regular: complete lift into corrective extensions, finitely many, covering all solutions)
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §3.7, Proposition 13, p. 24. the same over Γ with formulas U = 1 ∧ W ≠ 1
- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §7.6, Definition 44, p. 141. the regular case is the defining property of generic families

#### Groups without a sufficient splitting modulo a subgroup (rigid and solid relative limit groups)

**Definition.** Node `FO2/sufficient-splitting`.
Proposed namespace `LimitGroup`, module `TauCeti/GroupTheory/LimitGroup/Relative`.

Let F ≤ H ≤ K be finitely generated fully residually free groups (H given by generators, K by a finite presentation). K is rigid modulo H when K admits no non-trivial free or abelian splitting in which H is elliptic. K has a sufficient splitting modulo H when it admits an abelian splitting modulo H whose canonical automorphisms (modulo H) can shorten the homomorphisms K → F extending a fixed homomorphism of H, so that a fundamental sequence modulo H continues below K; K without a sufficient splitting modulo H is either rigid modulo H or has a splitting modulo H that is not sufficient (solid). Terminal groups of fundamental sequences modulo H are exactly the groups without a sufficient splitting modulo H. The exact form of 'sufficient' is KM06 §5.4; its counterpart in Sela's route is a rigid or solid limit group (Diophantine geometry III).

**API.**

- `LimitGroup.RigidModulo` (data): K has no non-trivial free or abelian splitting with H elliptic.
- `LimitGroup.HasSufficientSplitting` (data): The KM06 §5.4 condition.
- `LimitGroup.not_hasSufficientSplitting_iff` (characterisation): ¬HasSufficientSplitting K H ↔ RigidModulo K H ∨ (K splits modulo H and the splitting is not sufficient).
- `LimitGroup.HasSufficientSplitting.of_freeFactor` (constructor): A non-trivial free factor of K not containing a conjugate of H gives a sufficient splitting.
- `LimitGroup.RigidModulo.self` (example): K is rigid modulo K.

**Uses.**

- QE-FREE, §4.2, Theorem 7, p. 25: the bound on algebraic solutions is stated for K without a sufficient splitting modulo H
- QE-FREE, §5, p. 26–27: the groups F_{R(U_{m,i})}, F_{R(V_{m,i})} of the parametric tree have no sufficient splitting modulo the parameter subgroups
- FO4/algebraic-solution: algebraic solutions are defined for such K

**Unit tests.**

- `RigidModulo.self` (degenerate): Every K is rigid modulo K itself; in particular F(a, b) is rigid modulo F(a, b).
- `HasSufficientSplitting.free_factor` (computation): K = F(a, b) ∗ ⟨t⟩ has a sufficient splitting modulo H = F(a, b): the free factor ⟨t⟩ lets every extension of a homomorphism of H be shortened to t ↦ 1.
- `not_rigid_surface` (non-example): The closed genus-2 surface group with H = the image of F(a, b) under the amalgam F(a, b) ∗_{[a,b]=[x,y]} ⟨x, y⟩ is not rigid modulo H (it splits along [a, b] with H elliptic).
- `RigidModulo.rigid_hyperbolic` (compatibility): A finitely generated fully residually free group with trivial abelian JSJ decomposition relative to H in FG10's sense is rigid modulo H.

**Construction or proof.**

1. Define RigidModulo K H through the absence of a non-trivial splitting of K with H elliptic (FG4/tree-action, FG10/universally-elliptic-jsj).
2. Define HasSufficientSplitting K H following KM06 §5.4; record in the definition's docstring that the definition is matched against Sela's solid limit groups.
3. Prove the dichotomy: no sufficient splitting ⇔ rigid modulo H or solid modulo H.

**Acceptance.**

- F(a, b) is rigid modulo itself.
- F(a, b) ∗ ⟨t⟩ has a sufficient splitting modulo F(a, b) (the free factor ⟨t⟩).

**Prerequisites.** `FreeGroupsAndLimitGroups:FG10/universally-elliptic-jsj`, `FreeGroupsAndLimitGroups:FG10/jsj-existence`, `FreeGroupsAndLimitGroups:FG4/kurosh-grushko`, `FreeGroupsAndLimitGroups:FG4/tree-action`, `FreeGroupsAndLimitGroups:FG8/fully-residually-free`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §4.1, p. 22, and §4.2, Theorem 7 and its proof, pp. 24–25. groups K without sufficient splitting modulo H; the rigid case (no splitting modulo H) and the solid case (a splitting modulo H that is not sufficient), with reference to KM06 §5.4 for the definition
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §3.2, Proposition 9 and Remark 2, pp. 14–15. terminal groups of fundamental sequences modulo subgroups have no sufficient splitting; Sela's rigid and solid limit groups are the similar objects
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), §5.4 (as cited in QE-FREE §4.1). the definition of a sufficient splitting modulo a class of subgroups

#### Fundamental sequences modulo subgroups, effectively, with minimal values

**Theorem.** Node `FO2/fundamental-sequences-modulo`.

Let S(Z, A) = 1 be a finite system over F and H₁,…,H_k finitely generated subgroups of F_{R(S)} (given by generators). One can effectively construct a complete set of corrective extensions of canonical NTQ systems modulo H₁,…,H_k (the H_j elliptic in the JSJ decompositions at every level), whose terminal groups have no sufficient splitting modulo the images of the H_j, such that every homomorphism F_{R(S)} → F factors through one of them followed by a homomorphism of the terminal group. For a canonical NTQ system S₁,…,S_n of a well-aligned sequence modulo limit groups L₁,…,L_k, values of X₂,…,X_n are minimal with respect to the images of L when for each i > 1 they are minimal, in the fundamental sequences of F_{R(S_i,…,S_n)}, modulo the rigid vertex groups and edge groups of the image of L at level i − 1.

**Hypotheses.**

- S finite over F; H_j finitely generated, given by generators.

**Construction or proof.**

1. Run the elimination process for generalized equations modulo the pre-images of the H_j (FG7/FG10), so that the H_j stay elliptic.
2. Rework the branches into well-aligned strict sequences modulo the H_j and attach canonical NTQ systems and correcting extensions; stop a branch at a group without sufficient splitting modulo the images of the H_j.
3. Minimality: within each class under the canonical automorphisms modulo the stated subgroups choose shortest representatives; the existence of minimal representatives is well-ordering of lengths.

**Acceptance.**

- For k = 0 this is FO2/canonical-embedding-tree.
- For H₁ = F_{R(S)} every terminal group is F_{R(S)} itself.

**Prerequisites.** `FO2/canonical-embedding-tree`, `FO2/sufficient-splitting`, `FO2/correcting-extension`, `FreeGroupsAndLimitGroups:FG10/effective-jsj`, `FreeGroupsAndLimitGroups:FG10/effective-grushko`, `FreeGroupsAndLimitGroups:FG10/frf-basic-algorithms-correct`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §3.8, Proposition 14, p. 25, and §3.2, Proposition 9, p. 14. the effective complete set of corrective extensions of canonical NTQ groups modulo finitely many subgroups, with terminal groups without sufficient splitting
- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §2.1, Theorems 2–3, p. 2. effective cyclic and abelian JSJ decompositions relative to F and relative to finitely generated subgroups
- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.4, Definition 3, p. 11. minimality of values of X₂,…,X_n with respect to the images of L

### Dependencies

Within this roadmap: FO1. Other roadmaps: `FreeGroupsAndLimitGroups:FG4`, `FreeGroupsAndLimitGroups:FG6`, `FreeGroupsAndLimitGroups:FG7`, `FreeGroupsAndLimitGroups:FG8`, `FreeGroupsAndLimitGroups:FG10`, `FreeGroupsAndLimitGroups:FG11`.

### Acceptance tests

The layer is accepted when every node above is stated with its hypotheses, every definition passes its unit tests, and the acceptance items of its theorems hold. Coverage: planned; remaining: Replace the description of 'sufficient splitting' (FO2/sufficient-splitting) by KM06 §5.4's exact definition once KM06 is read, and check it against Sela's solid limit groups (gap 'sufficient-splitting definition')..

## Layer FO4: MAX-equivalence, algebraic-solution bounds and complete reducing systems

MAX-equivalence of solutions, the bounds on algebraic solutions, and the complete reducing systems specific to the decision procedure; the finiteness and effectivity statements for each. Planned targets: reducing quotients and special homomorphisms; fractional Dehn twists and MAX-equivalence; complete reducing systems and their effective construction; algebraic solutions; the ∃∀-definability of the number of MAX-classes; the uniform bound N(K, H). The computation of N(K, H), which needs the ∀∃ decider, is planned in FO5.

Planets: Reducing quotients; MAX-equivalence; Complete reducing systems; Algebraic solutions; Bound on algebraic solutions.

#### Reducing quotients and special homomorphisms

**Definition.** Node `FO4/reducing-quotient`. Planet: *Reducing quotients*.
Proposed namespace `LimitGroup`, module `TauCeti/GroupTheory/LimitGroup/AlgebraicSolutions`.

Let F ≤ H ≤ K be finitely generated fully residually free groups with K without a sufficient splitting modulo H (FO2/sufficient-splitting), and D an abelian JSJ decomposition of K modulo H. For a fully residually free quotient κ : K → K₁ that is an F-epimorphism, with H₁ = κ(H), an elementary abelian splitting of K₁ modulo H₁ that does not lift to a splitting of K is new. K₁ is a reducing quotient of K (modulo H) when (1) K₁ has a non-trivial free decomposition modulo H₁, or (2) K₁ has a new elementary abelian splitting modulo H₁. A homomorphism φ : K → K₁ is special when it maps an edge group of D to 1 or maps a non-abelian vertex group of D to an abelian subgroup. This is KM06 Definition 20 with its third item removed, the correction the authors adopted after N. Touikan's observation.

**API.**

- `LimitGroup.IsReducingQuotient` (data): IsReducingQuotient K H κ: condition (1) or (2).
- `LimitGroup.IsSpecialHom` (data): φ kills an edge group of D or abelianizes a non-abelian vertex group.
- `LimitGroup.IsReducingQuotient.of_freeDecomp` (constructor): A non-trivial free decomposition of K₁ modulo H₁ makes K₁ reducing.
- `LimitGroup.IsReducingQuotient.of_newSplitting` (constructor): A new elementary abelian splitting of K₁ modulo H₁ makes K₁ reducing.
- `LimitGroup.not_isReducingQuotient_self` (example): If K is freely indecomposable modulo H, the identity quotient K → K is not reducing (every splitting of K lifts to K).
- `LimitGroup.IsReducingQuotient.comp` (functoriality): If K₁ is reducing for K and K₁ → K₂ is an isomorphism over H, then K₂ is reducing.

**Uses.**

- QE-FREE, §4.1, p. 23: reducing homomorphisms are excluded from the algebraic solutions
- QE-FREE, §5.2, p. 30: failure (1) of a certificate: specializations becoming reducing
- FO4/complete-reducing-system: the reducing quotients are covered by a finite complete system

**Unit tests.**

- `not_isReducingQuotient_self` (degenerate): For K freely indecomposable modulo H, the identity K → K is not a reducing quotient.
- `not_isReducingQuotient_F` (computation): For F(a, b) ≤ H ≤ K, the quotient K → F(a, b) given by an F-homomorphism is not reducing: F(a, b) has no free decomposition and no splitting modulo F(a, b).
- `not_isReducingQuotient_genus3_to_genus2` (non-example): For K = ⟨a₁,a₂⟩ ∗_{[a₁,a₂]=[b₁,b₂]} ⟨b₁,b₂⟩ ∗_{[b₁,b₂]=[c₁,c₂]} ⟨c₁,c₂⟩, F = ⟨a₁, a₂⟩ and H the subgroup generated by the a's and b's (a closed genus-2 surface group), the quotient τ : K → H with c_i ↦ b_i is not reducing modulo H: H has no free decomposition and no splitting modulo itself. The printed three-item definition of KM06 made it reducing, and SELA-REPORT item (3) uses this example against KM06 Lemma 19; the corrected definition excludes it.
- `isReducingQuotient_freeFactor` (compatibility): If K₁ = H₁ ∗ ⟨s⟩ with s ≠ 1, then K₁ is reducing by condition (1).

**Construction or proof.**

1. State conditions (1) and (2) through the relative Grushko decomposition and the relative abelian JSJ decomposition of K₁ (FG10/effective-grushko, FG10/effective-jsj), and liftability of a splitting through κ.
2. State specialness through the vertex and edge groups of D.

**Acceptance.**

- F itself is never a reducing quotient of K modulo H ⊇ F.
- A quotient K₁ = H₁ ∗ ⟨s⟩ with s ≠ 1 (a non-trivial free decomposition modulo H₁) is reducing.

**Prerequisites.** `FO2/sufficient-splitting`, `FreeGroupsAndLimitGroups:FG10/effective-jsj`, `FreeGroupsAndLimitGroups:FG4/kurosh-grushko`, `FreeGroupsAndLimitGroups:FG4/collapse-and-refinement`, `FreeGroupsAndLimitGroups:FG8/fully-residually-free`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §4.1, Definition 4, p. 22. the two conditions for a reducing quotient (free decomposition modulo H₁, new elementary abelian splitting) and the definition of special homomorphisms
- [Olga Kharlampovich, Alexei Myasnikov, On Tarski's decidability problem: response to Sela's report](https://arxiv.org/abs/1402.0482), item (3), p. 2. the misprinted item (3) of KM06 Definition 20 was removed (observation of N. Touikan), giving the two-item definition
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §5, Definition 10, p. 41. the same definition over Γ

#### MAX-equivalence of homomorphisms (fractional Dehn twists)

**Definition.** Node `FO4/max-equivalence`. Planet: *MAX-equivalence*.
Proposed namespace `LimitGroup`, module `TauCeti/GroupTheory/LimitGroup/AlgebraicSolutions`.

Let G be a fully residually free group with F ≤ G and D an abelian JSJ decomposition of G modulo a family K of subgroups. (a) For an elementary splitting S of G corresponding to an edge of D, G = A ∗_C B or G = ⟨A, t | c^t = c′ (c ∈ C)⟩ with F ≤ A, and an F-homomorphism ψ : G → F with ψ(C) ≤ ⟨c₀⟩ (a maximal cyclic subgroup of F), and d ∈ ⟨c₀⟩: ψ_d agrees with ψ on A and is ψ(b)^d on B (amalgam), or sends t to dψ(t) (HNN); ∼_S relates ψ and ψ_d. (b) For an abelian vertex group M = M₁ × M₂ of D (M₁ the least direct summand containing the edge groups, M₂ with fixed basis g₁,…,g_s), G is an extension of the centralizer of M₁ in G′ (the fundamental group of D without M₂) by M₂; for θ with θ(M) ≤ ⟨c₀⟩ and d ∈ ⟨c₀⟩^s, θ_d agrees with θ on G′ and sends g_i to d_i θ(g_i); ∼_M relates θ and θ_d. (c) ∼_AE is the equivalence relation generated by equivalence under canonical automorphisms, all ∼_M and all ∼_S. (d) φ ∼_MAX ψ when there is θ with φ ∼_AE θ and θ agreeing with ψ up to conjugation on the fundamental group of every connected component of D with its QH vertex groups removed.

**API.**

- `LimitGroup.fractionalTwist` (data): ψ ↦ ψ_d for an edge splitting and d in the maximal cyclic subgroup containing ψ(C).
- `LimitGroup.abelianTwist` (data): θ ↦ θ_d for an abelian vertex group M = M₁ × M₂.
- `LimitGroup.AEEquiv` (data): The equivalence relation ∼_AE.
- `LimitGroup.MaxEquiv` (data): The relation ∼_MAX of (d).
- `LimitGroup.MaxEquiv.equivalence` (structure): ∼_MAX is an equivalence relation on Hom_F(G, F).
- `LimitGroup.MaxEquiv.of_canonical` (constructor): ψ and ψ ∘ σ for σ a canonical automorphism of D are ∼_MAX-equivalent.
- `LimitGroup.MaxEquiv.restrict_rigid` (projection): ∼_MAX-equivalent homomorphisms agree up to conjugation on each rigid vertex group of D.

**Uses.**

- QE-FREE, §4.1, Theorem 6, pp. 23–24: the number of MAX-classes of algebraic solutions is expressed by a Boolean combination of ∃∀-formulas
- QE-FREE, §5.2, Definition 6 (2), (4), pp. 29–30: certificates consist of pairwise non-∼_MAX-equivalent algebraic specializations
- KM-RESPONSE, item (5), p. 2: the bound on the number of MAX-classes

**Unit tests.**

- `MaxEquiv.rigid_eq` (degenerate): If D is trivial (K rigid modulo H, a single non-QH vertex containing F(a, b)), then φ ∼_MAX ψ iff φ = ψ: conjugation fixing the non-abelian F(a, b) is trivial.
- `MaxEquiv.centralizer_extension` (computation): For G = ⟨F(a, b), t | [t, a] = 1⟩ with D the abelian vertex ⟨a, t⟩, M₁ = ⟨a⟩, M₂ = ⟨t⟩: the homomorphisms t ↦ a^m (m ∈ ℤ) are all ∼_M-equivalent, so Hom_F(G, F) is a single ∼_MAX-class.
- `maxEquiv_ne_eq` (non-example): ∼_MAX is coarser than equality: for G = ⟨F(a, b), t | [t, a] = 1⟩ the distinct homomorphisms t ↦ a and t ↦ a² are ∼_MAX-equivalent; counting distinct homomorphisms instead of classes would make the number of algebraic extensions infinite where FO4/algebraic-solution-bound gives a finite bound.
- `MaxEquiv.of_canonical_example` (compatibility): For a QH vertex group of D and σ a Dehn twist along a simple closed curve of its surface, ψ ∼_MAX ψ ∘ σ.

**Construction or proof.**

1. Define ψ_d and θ_d explicitly on generators adapted to D; they are homomorphisms because d commutes with ψ(C), respectively with θ(M).
2. Define ∼_AE as an EqvGen closure and ∼_MAX as in (d); prove that ∼_MAX is an equivalence relation (the sources speak of MAX-classes). Symmetry and transitivity need, besides ∼_AE being an equivalence, that the twists generating ∼_AE are compatible with agreement up to conjugation on the non-QH components: a twist ψ_d or θ_d is determined by the values on the edge and abelian vertex groups, which lie in those components; this compatibility is part of the node's proof.

**Acceptance.**

- For K rigid modulo H with D trivial, ∼_MAX is equality on F-homomorphisms.
- All F-homomorphisms of ⟨F(a, b), t | [t, a]⟩ to F are ∼_MAX-equivalent.

**Prerequisites.** `FreeGroupsAndLimitGroups:FG10/universally-elliptic-jsj`, `FreeGroupsAndLimitGroups:FG4/dehn-twist`, `FreeGroupsAndLimitGroups:FG8/centralizer-extension`, `FreeGroupsAndLimitGroups:FG6/qh-vertex`, `FO2/strict-fundamental-sequence`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §4.1, pp. 22–23. the relations ∼_S and ∼_M (extended automorphisms, fractional Dehn twists), the generated relation ∼_AE and the definition of ∼_MAX through agreement up to conjugation off the QH vertex groups
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §5, pp. 41–42. the same over Γ
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), §5.3 (as cited in QE-FREE §4.1). where MAX-equivalence was introduced

#### Complete reducing systems

**Definition.** Node `FO4/complete-reducing-system`. Planet: *Complete reducing systems*.
Proposed namespace `LimitGroup`, module `TauCeti/GroupTheory/LimitGroup/AlgebraicSolutions`.

Let K, H be as in FO4/reducing-quotient. A complete reducing system for K (modulo H) is a finite list of reducing quotients K/R(r₁), …, K/R(r_s) of K, each given by finitely many extra relations r_i and the NTQ systems of its fundamental sequences modulo H, such that every homomorphism K → F that factors through some reducing quotient is ∼_MAX-equivalent (FO4/max-equivalence) to one that factors through one of the K/R(r_i). A homomorphism K → F is reducing when its ∼_MAX-class contains a solution factoring through one of these NTQ systems.

**API.**

- `LimitGroup.CompleteReducingSystem` (data): A finite list of reducing quotients with NTQ systems modulo H satisfying the covering condition.
- `LimitGroup.IsReducingHom` (data): A homomorphism K → F is reducing for a complete reducing system.
- `LimitGroup.CompleteReducingSystem.cover` (projection): Every homomorphism through a reducing quotient is ∼_MAX-equivalent to one through a member.
- `LimitGroup.CompleteReducingSystem.mono` (structure): Adding reducing quotients preserves completeness.
- `LimitGroup.isReducingHom_iff_independent` (characterisation): Whether a homomorphism is reducing does not depend on the complete reducing system chosen.

**Uses.**

- QE-FREE, §4.1, p. 23: algebraic solutions are the non-reducing non-special ones
- QE-FREE, §4.1, Theorem 6, p. 24: V(Y, Z, P) = 1 in the formula is the disjunction of equations defining the maximal reducing quotients

**Unit tests.**

- `CompleteReducingSystem.empty` (degenerate): If K has no reducing quotient modulo H (for instance K = H), the empty list is complete and no homomorphism is reducing.
- `CompleteReducingSystem.independent` (characterisation): For two complete reducing systems R, R′ of the same K, a homomorphism is reducing for R iff it is reducing for R′.
- `not_complete_empty` (non-example): If K has a reducing quotient K₁ (for instance one with a free decomposition H₁ ∗ ⟨s⟩, s ≠ 1, modulo H₁) and some homomorphism K → F factors through K₁, the empty list is not a complete reducing system.
- `CompleteReducingSystem.mono_example` (compatibility): Appending a reducing quotient to a complete reducing system gives a complete reducing system.

**Construction or proof.**

1. Represent a complete reducing system as a finite list of quotient presentations with their NTQ systems modulo H.
2. Define the predicate IsReducingHom through ∼_MAX-classes.

**Acceptance.**

- If K has no reducing quotient, the empty list is a complete reducing system.
- A complete reducing system stays complete after adding further reducing quotients.

**Prerequisites.** `FO4/reducing-quotient`, `FO4/max-equivalence`, `FO2/fundamental-sequences-modulo`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §4.1, p. 23. complete reducing systems: every homomorphism through a reducing quotient is ∼_MAX-equivalent to one through a member; existence proved in KM06; reducing homomorphisms
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), (existence and algorithm, as cited in QE-FREE §4.1). the original existence statement

#### Algebraic solutions (modulo a subgroup and a fixed homomorphism)

**Definition.** Node `FO4/algebraic-solution`. Planet: *Algebraic solutions*.
Proposed namespace `LimitGroup`, module `TauCeti/GroupTheory/LimitGroup/AlgebraicSolutions`.

Let F ≤ H ≤ K be finitely generated fully residually free groups with K without a sufficient splitting modulo H, H = ⟨P⟩ with P = A ∪ {p₁,…,p_k}, K = ⟨X, P, A | S(X, P, A)⟩, and fix a complete reducing system (FO4/complete-reducing-system). For an F-homomorphism φ : H → F let Sol_φ be the set of F-homomorphisms K → F extending φ (they are onto F because they fix F). A solution in Sol_φ that is neither reducing nor special (FO4/reducing-quotient) is K-algebraic modulo H and φ. In Sela's route the corresponding notion is a strictly solid (or rigid) homomorphism.

**API.**

- `LimitGroup.solExt` (data): Sol_φ: the F-homomorphisms K → F extending φ.
- `LimitGroup.IsAlgebraic` (data): ψ ∈ Sol_φ, not reducing, not special.
- `LimitGroup.algClasses` (data): The set of ∼_MAX-classes of algebraic solutions over φ.
- `LimitGroup.IsAlgebraic.not_special` (projection): Algebraic solutions are not special.
- `LimitGroup.isAlgebraic_self` (example): If K = H, then φ is algebraic and algClasses φ is a singleton.

**Uses.**

- QE-FREE, §4.2, Theorem 7, p. 25: the uniform bound N(K, H) on the number of MAX-classes of algebraic solutions
- QE-FREE, §5.2, Definition 6 (1), p. 29: certificates are built from algebraic solutions
- QE-FREE, §5.2, Lemma 3, p. 29: True(Θ)₁ is written with algebraic Z^{(1)}

**Unit tests.**

- `isAlgebraic_self` (degenerate): For K = H, Sol_φ = {φ} and φ is algebraic: one MAX-class.
- `isAlgebraic_sqrt` (computation): For F = F(a, b), H = F ∗ ⟨p⟩ (one parameter p) and K = ⟨H, x | x² = p⟩ = H ∗_{p = x²} ⟨x⟩ (D: the splitting along ⟨p⟩), an F-homomorphism φ : H → F, determined by φ(p), extends to K iff φ(p) is a square in F; the extension is unique (roots are unique in F), and it is algebraic iff φ(p) ≠ 1 (otherwise it kills the edge group ⟨p⟩ and is special).
- `not_isAlgebraic_special` (non-example): A solution sending an edge group of D to 1 is special and therefore not algebraic, even when it is not reducing.
- `isAlgebraic_rigid` (compatibility): If K is rigid modulo H (D trivial), the algebraic solutions over φ are the extensions of φ that factor through no member of the complete reducing system.

**Construction or proof.**

1. Define Sol_φ as a subset of Hom_F(K, F); algebraic solutions are those neither reducing nor special.
2. Define the set of ∼_MAX-classes of algebraic solutions over φ, whose cardinality FO4/algebraic-solution-bound bounds.

**Acceptance.**

- For K = H the unique extension φ itself is algebraic.
- For H = F ∗ ⟨p⟩ and K = ⟨H, x | x² = p⟩, the extension x ↦ √φ(p) exists iff φ(p) is a square and is algebraic iff moreover φ(p) ≠ 1.

**Prerequisites.** `FO4/reducing-quotient`, `FO4/complete-reducing-system`, `FO2/sufficient-splitting`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §4.1, p. 23. Sol_φ and the definition of K-algebraic solutions as the non-reducing non-special ones
- [Zlil Sela, A report on Tarski's decidability problem: "Elementary theory of free nonabelian groups" by O. Kharlampovich and A. Myasnikov](https://arxiv.org/abs/1401.5711), §3, item (4), p. 7. identifies these algebraic solutions with Sela's strictly solid homomorphisms in the published version of KM06

#### Complete reducing systems exist and are computable

**Theorem.** Node `FO4/reducing-quotients-effective`.

Let K be a finitely generated fully residually free group without a sufficient splitting modulo a finitely generated subgroup H (given by a finite presentation and generators). A complete reducing system for K modulo H (FO4/complete-reducing-system), with the NTQ systems of its members modulo H, exists and can be found effectively.

**Hypotheses.**

- K f.g. fully residually free without sufficient splitting modulo H; finite presentation of K and generators of H given.

**Construction or proof.**

1. Rigid case: for each reducing quotient K₁ there is a discriminating family whose restrictions to H extend in infinitely many ways; run the elimination process of FG7 for S = 1 modulo H; the new splittings of quotients appear in the process.
2. Solid case: the same with homomorphisms minimal in their AEQ-classes.
3. Compare the quotients found with the isomorphism and epimorphism tests of FG10/frf-basic-algorithms and keep the maximal ones.

**Acceptance.**

- If K has no reducing quotients the algorithm returns the empty system.

**Prerequisites.** `FO4/complete-reducing-system`, `FO2/fundamental-sequences-modulo`, `FreeGroupsAndLimitGroups:FG7/elementary-transformations`, `FreeGroupsAndLimitGroups:FG10/frf-basic-algorithms-correct`, `FreeGroupsAndLimitGroups:FG10/effective-jsj`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §5, Proposition 3 and its proof, pp. 27–28. run the elimination process for a presentation S of K modulo H; all maximal reducing quotients appear because new splittings are seen in the process; compare quotients and keep the maximal ones (KM06 Theorem 31)
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §6, Proposition 16, p. 46. the same over Γ, with corrective extensions of completed canonical fundamental sequences modulo H

#### The number of MAX-classes of algebraic solutions is ∃∀-definable

**Theorem.** Node `FO4/max-class-count-definable`.

Let H = ⟨P⟩ ≤ K be as in FO4/algebraic-solution, with K = F_{R(S(X, P))}. For each N ≥ 0 one can effectively write a Boolean combination of conjunctive ∃∀-formulas θ_N(P) ∧ ¬θ_{N+1}(P) in the parameters P that holds at P̄ ∈ F^P exactly when the equation S(X, P̄) = 1 has exactly N non-∼_MAX-equivalent algebraic solutions modulo H. θ_N(P) says: there are N solutions (X₁, …, X_N) of S(X, P) = 1 such that for all twisting parameters T and all Y, Z, no fractional Dehn twist X₂^{σ_T} of any of them is a reducing solution (V(Y, Z, P) = 1 for the equations of the maximal reducing quotients), and no two are related by such a twist.

**Hypotheses.**

- K without sufficient splitting modulo H; a complete reducing system with its equations V given (FO4/reducing-quotients-effective).

**Construction or proof.**

1. Partition the generators X = X₁ ∪ X₂ with ⟨X₂ ∪ P⟩ the fundamental group of D minus the QH vertex groups; write the generators c_e of edge groups as words c_e(X₂).
2. Write the action of a generalized fractional Dehn twist σ_T on X₂ explicitly (conjugation by c^m or multiplication by c^m) with T the exponents' carriers commuting with c_e.
3. θ₁: ∃X₁X₂ ∀Y T Z (S(X₁, X₂, P) = 1 ∧ ¬(⋀[t_i, c_i(X₂)] = 1 ∧ Z = X₂^{σ_T} ∧ S(Y, X₂, P) = 1 ∧ V(Y, Z, P) = 1)); θ_N by the same pattern with N tuples and pairwise non-equivalence clauses.

**Acceptance.**

- θ₀ is true; for K = H, θ₁ holds exactly at the P̄ that solve the defining relations S(P) = 1 of H (the F-homomorphisms φ : H → F), and θ₂ holds at none.

**Prerequisites.** `FO4/algebraic-solution`, `FO4/max-equivalence`, `FO4/reducing-quotients-effective`, `FO1/quantifier-classes`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §4.1, Theorem 6 and its proof, pp. 23–24. the formulas θ₁ and θ₂ written explicitly with the twist parameters T and the reducing-quotient equations V, θ_N similarly, and exactly N classes as θ_N ∧ ¬θ_{N+1}
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §5, Theorem 6, p. 42. the same over Γ

#### Uniform bound on the number of MAX-classes of algebraic solutions

**Theorem.** Node `FO4/algebraic-solution-bound`. Planet: *Bound on algebraic solutions*.

Let H, K be finitely generated fully residually free groups with F ≤ H ≤ K and K without a sufficient splitting modulo H, and D an abelian JSJ decomposition of K modulo H (possibly trivial). There is N = N(K, H) such that for every F-homomorphism φ : H → F there are at most N pairwise non-∼_MAX-equivalent algebraic homomorphisms K → F extending φ. (Its effective computation is FO5/effective-bound.)

**Hypotheses.**

- F ≤ H ≤ K f.g. fully residually free; K without sufficient splitting modulo H.

**Construction or proof.**

1. Suppose not: a sequence φ_n with more and more non-equivalent algebraic extensions.
2. Pass to a convergent sequence of extensions; by equational Noetherianity (FG5) and the descending chain condition on limit-group quotients (FG8), the limit factors through a proper quotient of K or gives a splitting of K modulo H.
3. A proper quotient makes almost all extensions reducing or special; a splitting would be sufficient or would make them MAX-equivalent: contradiction (KM06 §11 via generalized equations with intervals labelled by the generators of H).

**Acceptance.**

- N(H, H) = 1.
- N(⟨F ∗ ⟨p⟩, x | x² = p⟩, F ∗ ⟨p⟩) = 1 (square roots are unique in F).

**Alternative route and remarks.** Sela's counterpart is the global bound on the number of strictly solid families of Diophantine geometry III (SELA-REPORT §3 items (4)–(5), p. 7, compares KM06 Theorem 11 with Theorems 2.5 and 2.9 there). For the hyperbolic case, QE-FREE p. 25 says that Theorem 3.5 of Sela's hyperbolic-group paper is stated without proof, and KM-RESPONSE §4(f), p. 11, says the same of the bound on strictly solid families in that paper (its Theorem 3.8).

**Prerequisites.** `FO4/algebraic-solution`, `FO4/max-equivalence`, `FreeGroupsAndLimitGroups:FG10/effective-makanin-razborov`, `FreeGroupsAndLimitGroups:FG5/linear-equationally-noetherian`, `FreeGroupsAndLimitGroups:FG8/limit-group-equivalences`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §4.2, Theorem 7, p. 25. the uniform bound N(K, H), recorded as KM06 Theorem 11
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §5, Theorem 7, p. 44. the same over Γ, citing KM06 Theorem 11 for the free case
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), Theorem 11 (as cited in QE-FREE §4.2). the original statement; SELA-REPORT items (4)–(5) and KM-RESPONSE items (4)–(5) discuss its proof

### Dependencies

Within this roadmap: FO1, FO2. Other roadmaps: `FreeGroupsAndLimitGroups:FG4`, `FreeGroupsAndLimitGroups:FG5`, `FreeGroupsAndLimitGroups:FG6`, `FreeGroupsAndLimitGroups:FG7`, `FreeGroupsAndLimitGroups:FG8`, `FreeGroupsAndLimitGroups:FG10`.

### Acceptance tests

The layer is accepted when every node above is stated with its hypotheses, every definition passes its unit tests, and the acceptance items of its theorems hold. Coverage: planned; remaining: FO4/algebraic-solution-bound: read the proof of KM06 Theorem 11 (§11) and check the reduction contested in SELA-REPORT items (4)–(5) (gap 'KM06 not read')..

## Layer FO3: Induced NTQ systems, tight envelopes, projective images and configurations

Induced NTQ systems and their enlargement; tight envelopes; projective images and the configuration machinery used to control solutions of ∀∃-sentences along a tower; the finiteness statements these constructions provide. Planned targets: the complexity of fundamental sequences (Kurosh rank, regular size, abelian size); induced NTQ systems and the termination of their enlargement; projective images of a subgroup along a tower and the properness of the terminal image; tight enveloping NTQ groups and the non-increase of complexity; certificates and configuration groups with their finiteness and computability. Configurations use the algebraic solutions and MAX-equivalence of FO4.

Planets: Complexity of a fundamental sequence; Induced NTQ systems; Projective images along NTQ towers; Tight enveloping NTQ groups; Configuration groups.

#### Size, abelian size, Kurosh rank and the complexity of a fundamental sequence

**Definition.** Node `FO3/complexity`. Planet: *Complexity of a fundamental sequence*.
Proposed namespace `LimitGroup`, module `TauCeti/GroupTheory/LimitGroup/Complexity`.

For a QH vertex group Q with surface S_Q, size(Q) = (genus of S_Q, |χ(S_Q)|). For an abelian decomposition D of a freely indecomposable group, the regular size size(D) is the tuple of sizes of its MQH vertex groups in decreasing order, compared left-lexicographically; the abelian size ab(D) is the sum of the ranks of the abelian vertex groups minus the sum of the ranks of the edge groups of the edges at them (for NTQ systems: the sum over levels of the ranks of abelian vertex groups minus the ranks of their direct summands containing the edge groups with finite index). For a (block-)fundamental sequence V_fund, the Kurosh rank is dim(V_fund) + factors(V_fund), where dim is the rank of the free group of the terminal level (FO2/well-aligned) and factors is the number of freely indecomposable non-cyclic terminal factors (present only for sequences modulo subgroups). The complexity is Cmplx(V_fund) = (Kurosh rank, regular size, ab), compared left-lexicographically; it takes values in a well-ordered set.

**API.**

- `LimitGroup.QH.size` (data): size(Q) = (genus, |χ|) of the surface of a QH vertex group.
- `LimitGroup.Decomp.regularSize` (data): The decreasingly sorted tuple of sizes of MQH vertex groups.
- `LimitGroup.Decomp.abSize` (data): Abelian size ab(D).
- `LimitGroup.FundSeq.kuroshRank` (data): dim + factors.
- `LimitGroup.FundSeq.complexity` (data): Cmplx = (kuroshRank, regularSize, abSize) with the lexicographic order.
- `LimitGroup.FundSeq.complexity_wellFounded` (structure): The order on complexities is well-founded.
- `LimitGroup.Decomp.regularSize_lt_of_subsurface` (relation): Replacing an MQH vertex group by QH vertex groups of proper subsurfaces strictly decreases the regular size.

**Uses.**

- QE-FREE, §3.7, Theorem 4 and Lemma 2, pp. 18–21: the finiteness of the ∃∀-tree is proved by decrease of the complexity of the top block
- QE-FREE, §3.3, p. 10: termination of the enlargement of the induced NTQ system by decrease of (factors, edges and vertices, size)
- QE-FREE, §5.4, pp. 35–37: tight enveloping sequences of depth n + 1 do not increase the complexity

**Unit tests.**

- `complexity.empty` (degenerate): For the empty system in variables X over F, the one-level sequence F(X) ∗ F has Kurosh rank |X|, empty regular size and ab = 0.
- `QH.size_punctured_torus` (computation): A QH vertex group whose surface is a once-punctured torus (relation [x, y]c = 1) has size (1, 1); a four-punctured sphere has size (0, 2).
- `regularSize_lt_example` (compatibility): Cutting a genus-2 surface with one boundary component (size (2, 3)) along a separating curve into a once-punctured torus and a twice-punctured torus gives regular size ((1, 2), (1, 1)) < ((2, 3)) lexicographically.
- `complexity_not_dim_only` (non-example): Dimension alone is not a termination measure: Case 3 of the ∃∀-tree can keep the dimension and decrease only the regular size (QE-FREE Lemma 2 (ii)), so a measure without the size component would not decrease.

**Construction or proof.**

1. Define size(Q) from the Euler characteristic and genus of the surface of Q (FG6).
2. Define size(D), ab(D), the Kurosh rank and Cmplx as tuples of natural numbers with the lexicographic order; finite tuples of bounded length under the lexicographic order of decreasing-sorted tuples are well-ordered, which is the termination measure of FO3/induced-ntq-terminates, FO5/ae-tree-finite and FO6/true-level-two.

**Acceptance.**

- The empty system has complexity (|X|, (), 0).
- A once-punctured torus vertex has size (1, 1).

**Prerequisites.** `FO2/well-aligned`, `FreeGroupsAndLimitGroups:FG6/qh-vertex`, `FreeGroupsAndLimitGroups:FG6/surface-group`, `FreeGroupsAndLimitGroups:FG10/universally-elliptic-jsj`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.3, p. 10, and §3.7, p. 18. size of a QH subgroup as (genus, |Euler characteristic|), regular size compared lexicographically, abelian size, and the complexity (dim + factors, regular size, ab) with the remark that Sela calls the first entry the Kurosh rank
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §4.7, p. 37, and §3.5, p. 21. the complexity with its three components, after Sela's Definition 4.2, and the abelian size of an NTQ group

#### Induced NTQ systems and induced fundamental sequences

**Construction.** Node `FO3/induced-ntq`. Planet: *Induced NTQ systems*.
Proposed namespace `LimitGroup.NTQ`, module `TauCeti/GroupTheory/LimitGroup/InducedNTQ`.

Let S = 1 be an NTQ system over F with levels F_i = F_{R(S_i,…,S_n)}, fixed F_{i+1}-homomorphisms π_i : F_i → F_{i+1} (F_{n+1} a free product of F and a free group), a well-aligned fundamental sequence (FO2/well-aligned), and K a finitely generated (F-)subgroup of F_{R(S)}. Assume F_{R(S)} freely indecomposable modulo F and let D be the splitting of the top level. The induced NTQ system Q = 1 is obtained by: taking the induced splitting D_K of K and its free factors K₁ ∗ ⋯ ∗ K_k; enlarging K₁ by finitely many elements of abelian vertex groups of F_{R(S)} (chosen in the complements A₂ of isolators and corrected to die on the next level) so that non-QH non-abelian subgroups conjugate into the same subgroup of D are joined; adding conjugating elements so that each punctured surface of the refined decomposition is attached to a unique rigid subgroup and all rigid subgroups mapped to the same free factor of the next level are conjugate into one subgroup (giving K̃₁ with π₁(K) = π₁(K̃₁)); doing the same for each free factor of π₁(K) ∩ ⟨X₂,…,X_n⟩ and down all levels (giving H₁); and iterating with H₁ in place of K until H_i = H_{i+1}. The result is an NTQ system Q with K ≤ F_{R(Q)} ≤ F_{R(S)}, levels and canonical automorphisms induced from those of S, each QH subgroup of finite index in a QH subgroup of S, the image of the top j levels of F_{R(Q)} at level j + 1 contained in the image of K there; the induced fundamental sequence contains every solution of K factoring through the given sequence of S. The same construction is made modulo a subgroup.

**API.**

- `LimitGroup.NTQ.induced` (data): The induced NTQ system of a finitely generated subgroup K with respect to a well-aligned fundamental sequence of S.
- `LimitGroup.NTQ.induced_le` (projection): K ≤ F_{R(induced)} ≤ F_{R(S)}.
- `LimitGroup.NTQ.induced_qh_finiteIndex` (relation): Each QH subgroup of the induced system has finite index in a QH subgroup of S.
- `LimitGroup.NTQ.induced_homs` (characterisation): Every homomorphism of K factoring through the fundamental sequence of S factors through the induced fundamental sequence.
- `LimitGroup.NTQ.induced_self` (example): induced S (F_{R(S)}) = S.
- `LimitGroup.NTQ.induced_wellAligned` (structure): The induced fundamental sequence is well aligned.

**Uses.**

- QE-FREE, §3.4, p. 13: c₂ is the induced well-aligned fundamental sequence for G extracted from c above level p
- QE-FREE, §5.3 (a), p. 33: the tight enveloping NTQ group starts from the induced NTQ group Ind(F_{R(U)})
- KM-RESPONSE, items (17)–(25), p. 4: the induced NTQ system is the tool for building formula solutions over block-NTQ groups

**Unit tests.**

- `induced.self` (degenerate): If K = F_{R(S)} then the induced NTQ system is S with its fundamental sequence.
- `induced.coefficients` (degenerate): If K = F (the coefficient group) the induced NTQ system is empty and F_{R(Q)} = F.
- `induced.finite_index_surface` (characterisation): If K meets a QH vertex group Q of the top level of S in a subgroup of finite index, the QH subgroups of the induced system that come from Q have finite index in Q; a construction that kept a decomposition of K in which a QH subgroup is not of finite index in a QH subgroup of S would fail induced_qh_finiteIndex.
- `induced.not_subgroup_only` (non-example): The induced system is not simply a presentation of K: in general F_{R(Q)} properly contains K (it adds elements of abelian vertex groups and conjugators), and K need not itself be an NTQ group.

**Construction or proof.**

1. Compute the induced splitting D_K (FG4/induced-splitting) and its Grushko factors (FG4/kurosh-grushko) with the algorithms of FG10.
2. Perform the enlargement steps level by level from the top; each added element is found by the conjugacy and centralizer algorithms of FG10/frf-basic-algorithms.
3. Iterate; termination is FO3/induced-ntq-terminates.
4. Read off the levels, the maps between levels (restrictions of the π_i) and the canonical automorphisms (restrictions of those of S).

**Acceptance.**

- For K = F_{R(S)} the induced system is S.
- For K = F the induced system is empty.

**Prerequisites.** `FO2/well-aligned`, `FO2/canonical-ntq`, `FO3/complexity`, `FreeGroupsAndLimitGroups:FG4/induced-splitting`, `FreeGroupsAndLimitGroups:FG4/kurosh-grushko`, `FreeGroupsAndLimitGroups:FG6/finite-index-surface`, `FreeGroupsAndLimitGroups:FG10/frf-basic-algorithms-correct`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.3, pp. 8–10. the construction of the induced NTQ group, system and well-aligned fundamental sequence of a subgroup, with the enlargement steps, the iteration and its termination
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §4.3, pp. 29–31. the same construction over Γ
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), §7.12 (as cited in QE-FREE §3.3). the original construction
- [Olga Kharlampovich, Alexei Myasnikov, On Tarski's decidability problem: response to Sela's report](https://arxiv.org/abs/1402.0482), items (6)–(8), pp. 2–3. the authors state that the sentence about adding conjugating elements so that rigid subgroups mapped to the same free factor are conjugate into one subgroup is missing on KM06 p. 506 and is implied by the NTQ requirement

#### Termination of the induced-NTQ enlargement

**Theorem.** Node `FO3/induced-ntq-terminates`.

In the construction of FO3/induced-ntq the iteration K ⊆ H₁ ⊆ H₂ ⊆ ⋯ stabilizes after finitely many steps: if H_i ≠ H_{i+1} there is a level j such that the decompositions at all levels above j are unchanged and at level j one of the following decreases, in this priority: the number of free factors of the free decomposition at level j, the number of edges and vertices of the induced decomposition at level j, the size (regular size, then abelian size) of that decomposition. The resulting construction is algorithmic.

**Hypotheses.**

- S NTQ with a well-aligned fundamental sequence; K finitely generated.

**Construction or proof.**

1. Compare the decompositions of H_i and H_{i+1} level by level from the top; the first level where they differ exhibits one of the three decreases, because enlargement only joins vertex groups or replaces QH subgroups by subgroups of finite index in larger ones.
2. The triples (free factors, edges + vertices, size) are compared lexicographically level by level; they lie in a well-ordered set (FO3/complexity), so the iteration stops.

**Acceptance.**

- For K already equal to its enlargement the iteration stops at once.

**Prerequisites.** `FO3/induced-ntq`, `FO3/complexity`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.3, p. 10. the stabilization argument with the three decreasing characteristics and the statement that the construction is algorithmic (citing KM06)

#### Projective images of a subgroup along a (block-)NTQ system

**Definition.** Node `FO3/projective-images`. Planet: *Projective images along NTQ towers*.
Proposed namespace `LimitGroup.NTQ`, module `TauCeti/GroupTheory/LimitGroup/InducedNTQ`.

Let N be the coordinate group of an NTQ (or block-NTQ) system with levels N = N₁ → N₂ → ⋯ → N_m, the maps being the fixed homomorphisms π_i of a fundamental sequence (retractions in the completed sequence). For a finitely generated subgroup G ≤ N (more generally a homomorphism G → N), its projective image at level i is G^{(i)} := (π_{i−1} ∘ ⋯ ∘ π₁)(G) ≤ N_i, with the induced epimorphism G → G^{(i)}. The level of collapse of G is the least i with G → G^{(i)} not injective (a proper quotient), if any. Given finite presentations, G^{(i)} is computable (finite presentation of a finitely generated subgroup of a fully residually free group) and whether G → G^{(i)} is proper is decidable.

**API.**

- `LimitGroup.NTQ.projImage` (data): G^{(i)} ≤ N_i.
- `LimitGroup.NTQ.projImage_surj` (projection): The epimorphism G → G^{(i)}.
- `LimitGroup.NTQ.collapseLevel` (data): The least level at which G → G^{(i)} is not injective, as an Option ℕ.
- `LimitGroup.NTQ.projImage_comp` (functoriality): G^{(i+1)} is the image of G^{(i)} under π_i.
- `LimitGroup.NTQ.projImage_computable` (other): A finite presentation of G^{(i)} and the decision whether G → G^{(i)} is proper are computable.
- `LimitGroup.NTQ.projImage_coeff` (example): F^{(i)} = F for all i.

**Uses.**

- QE-FREE, §3.4, Lemma 1, p. 13: the image of G at the terminal level is a proper quotient unless G is free
- QE-FREE, §3.6, pp. 16–17: the first and second 'easy cases' of the general step are collapses of projective images of G and of the blocks M_g(r)(X, Z_g(r))
- FO5/ae-tree: every vertex records the projective images of G

**Unit tests.**

- `projImage.self` (degenerate): For G = N, G^{(i)} = N_i for every level i.
- `projImage.coeff` (degenerate): For G = F, G^{(i)} = F and collapseLevel = none.
- `projImage.quadratic` (computation): For N = ⟨F(a, b), x, y | [x, y] = [a, b]⟩ with π₁ : x ↦ a, y ↦ b and G = ⟨x, y⟩ ≅ F(x, y), G^{(2)} = ⟨a, b⟩ and G → G^{(2)} is an isomorphism, so collapseLevel G = none.
- `projImage.collapse` (non-example): Projective images are quotients of G, not subgroups of it: for the empty level N = F(a, b) ∗ F(x, y) with π₁ : x ↦ a, y ↦ a and G = ⟨x, y⟩, G^{(2)} = ⟨a⟩ is a proper quotient of F(x, y) and collapseLevel G = some 2.

**Construction or proof.**

1. Represent N_i by finite presentations (FO2/canonical-ntq) and G by generators; G^{(i)} is generated by the images of the generators.
2. A finite presentation of G^{(i)} and the properness test use the algorithms for finitely generated subgroups of fully residually free groups (FG10/frf-basic-algorithms: finite presentations of subgroups, injectivity of homomorphisms).

**Acceptance.**

- For G = N the projective images are the levels themselves.
- G = F is never collapsed (π_i fix F).

**Prerequisites.** `FO2/canonical-ntq`, `FreeGroupsAndLimitGroups:FG10/frf-basic-algorithms`, `FreeGroupsAndLimitGroups:FG10/frf-basic-algorithms-correct`, `FreeGroupsAndLimitGroups:FG8/embedding-theorems`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.4, proof of Lemma 1 and the following paragraph, p. 13. the image of G on each level of a fundamental sequence, the level p above which it is isomorphic to G and at which it becomes a proper quotient, found effectively by KM06 Theorems 29 and 31 (presentations of images, properness of epimorphisms)
- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.5–3.6, pp. 14–17. the images G^{(n)}, N_i^j and M_j(X, Z_i) of the groups of earlier steps, whose collapse defines the 'easy cases'
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §4.4, Lemma 4, p. 33. the same over Γ

#### The image of G at the terminal level is a proper quotient

**Theorem.** Node `FO3/terminal-image-proper`.

In the first step of the ∀∃-procedure (FO5/ae-tree), let G = F_{R(U₀)}, R₁,…,R_s the images of the free factors of ⟨X₂,…,X_n⟩, and c a fundamental sequence for G₁ modulo R₁,…,R_s whose dimension is less than k₁ or whose top NTQ level differs from S₁ = 1, with only homomorphisms minimal with respect to R₁,…,R_s. Then the projective image G_t of G at the terminal level t of c is a proper quotient of G, unless G is free; the level p at which the image first becomes proper is found effectively.

**Hypotheses.**

- c consists of homomorphisms minimal with respect to R₁,…,R_s, which are non-trivial.

**Construction or proof.**

1. Suppose G_t ≅ G; the abelian JSJ decomposition D_t of H_t induces one of G in which rigid subgroups and edge groups are elliptic.
2. A free factor P_i of H_t then carries a decomposition induced from D_t, so the homomorphisms could be shortened by canonical automorphisms of P_i modulo the R_j conjugate into it.
3. This contradicts minimality modulo R₁,…,R_s (FO2/fundamental-sequences-modulo); hence G_t is a proper quotient, and FO3/projective-images finds the first proper level.

**Acceptance.**

- If G is free the statement is vacuous (G may survive to the terminal level).

**Prerequisites.** `FO3/projective-images`, `FO2/fundamental-sequences-modulo`, `FO2/well-aligned`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.4, Lemma 1 and the following paragraph, p. 13. if G_t were isomorphic to G, the abelian JSJ decomposition D_t of the terminal group would induce a decomposition of a free factor allowing the homomorphisms to be shortened by canonical automorphisms modulo the R_j, contradicting minimality
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §4.4, Lemma 4, p. 33. the same over Γ

#### Tight enveloping NTQ groups and fundamental sequences

**Construction.** Node `FO3/tight-enveloping`. Planet: *Tight enveloping NTQ groups*.
Proposed namespace `LimitGroup.NTQ`, module `TauCeti/GroupTheory/LimitGroup/InducedNTQ`.

Let G = F_{R(U)}, W(X₁,…,X_n) = 1 the canonical NTQ system of a branch of T_CE(F_{R(U)}) (FO2/canonical-embedding-tree) with top level S₁, P = 1 a system with coefficients in F_{R(W)} solvable in an extension of F_{R(W)}, and F_{R(L₁)} the NTQ group of a well-aligned fundamental sequence c(L₁) for P = 1 modulo the non-cyclic free factors of the second level ⟨X₂,…,X_n⟩ of F_{R(W)}, with G ≤ F_{R(L₁)}. The tight enveloping fundamental sequence TEnv(G; L₁) and its NTQ group are obtained from the induced NTQ group Ind(G) (FO3/induced-ntq) by repeating the adjustment until it stabilizes: (b) add, top to bottom, QH subgroups of F_{R(L₁)} meeting the image at level i + 1 in a subgroup of finite index and having fewer free variables than that intersection; (c) add edge groups of abelian vertex groups meeting Ind(G) when this does not increase the Kurosh rank; (d) add, bottom to top, QH subgroups without free variables that meet Ind(G) and an adjacent vertex group, when this decreases the Kurosh rank; (e) add elements conjugating distinct QH (or abelian vertex) subgroups of Ind(G) into one QH subgroup of F_{R(L₁)} when this decreases the Kurosh rank; (f) add to each non-cyclic free factor of the image at each level the abelian vertex and edge groups it meets. The construction is algorithmic, and the bound of KM06 Lemma 28 is computable.

**API.**

- `LimitGroup.NTQ.tightEnvelope` (data): TEnv(G; L₁): the tight enveloping NTQ system and fundamental sequence.
- `LimitGroup.NTQ.induced_le_tightEnvelope` (projection): Ind(G) ≤ F_{R(TEnv(G; L₁))} ≤ F_{R(L₁)}.
- `LimitGroup.NTQ.tightEnvelope_kuroshRank_le` (relation): kuroshRank TEnv(G; L₁) ≤ kuroshRank c(L₁).
- `LimitGroup.NTQ.tightEnvelope_stable` (characterisation): TEnv(G; L₁) is a fixed point of the adjustment.
- `LimitGroup.NTQ.tightEnvelope_computable` (other): The construction is algorithmic (QE-FREE Proposition 7(1)).
- `LimitGroup.NTQ.tightEnvelope_self` (example): TEnv(F_{R(L₁)}; L₁) = c(L₁).

**Uses.**

- QE-FREE, §5.4, pp. 35–37: the depth of fundamental sequences of level 2 and width i is bounded because tight envelopes of depth n + 1 do not increase the complexity
- HYP, §6.3, pp. 52–55: the hyperbolic analogue
- FO6/true-level-two: termination of the level-2 analysis

**Unit tests.**

- `tightEnvelope.self` (degenerate): If G = F_{R(L₁)}, the adjustment adds nothing and TEnv(G; L₁) = c(L₁).
- `tightEnvelope.kuroshRank_le_example` (compatibility): For every G ≤ F_{R(L₁)}, the Kurosh rank of TEnv(G; L₁) is at most that of c(L₁) (steps (a)–(f) add only elements that do not increase it).
- `tightEnvelope.finite_index_qh` (computation): If G meets a QH subgroup Q of F_{R(L₁)} in a subgroup of finite index with fewer free variables (step (b)), Q is added: for L₁ a single punctured-torus level and G containing a finite-index subgroup of Q, TEnv(G; L₁) contains Q.
- `tightEnvelope.not_induced` (non-example): The tight envelope is in general strictly larger than the induced NTQ group Ind(G): steps (b) and (e) add QH subgroups and conjugators that Ind(G) lacks, so taking Ind(G) alone loses the Kurosh-rank comparison used for termination.

**Construction or proof.**

1. Start from Ind(G) (FO3/induced-ntq), which does not increase the Kurosh rank.
2. Apply (b)–(f) in order; each step needs intersections of conjugates of QH subgroups of two NTQ groups and the rank of solution sets of quadratic systems, both computable (FG10/frf-basic-algorithms, FG6).
3. Repeat the adjustment until no step applies; each application either keeps the Kurosh rank and adds a subgroup of bounded type or decreases the Kurosh rank, so the repetition stops.

**Acceptance.**

- If G = F_{R(L₁)} the tight envelope is c(L₁) itself.
- The Kurosh rank of TEnv(G; L₁) does not exceed that of c(L₁).

**Prerequisites.** `FO3/induced-ntq`, `FO3/complexity`, `FO2/canonical-embedding-tree`, `FO2/fundamental-sequences-modulo`, `FreeGroupsAndLimitGroups:FG2/howson-intersection`, `FreeGroupsAndLimitGroups:FG10/frf-basic-algorithms-correct`, `FreeGroupsAndLimitGroups:FG6/quadratic-radicals`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §5.3, steps (a)–(f), pp. 33–34, and Proposition 7, p. 35. the adjustment steps, their iteration, the name tight enveloping NTQ group, and the algorithm (intersections of conjugates of QH subgroups and solution sets of quadratic systems in NTQ groups); footnote 3 corrects KM06 §11.2: sequences modulo the non-cyclic free factors of the second level ⟨X₂,…,X_n⟩, not of F_{R(U)}
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §6.3 and Proposition 19, pp. 52–55. the same over Γ
- [Olga Kharlampovich, Alexei Myasnikov, On Tarski's decidability problem: response to Sela's report](https://arxiv.org/abs/1402.0482), items (29)–(34), pp. 4–5. the tight enveloping sequence is built top to bottom with iterations until the dimension stabilizes, and satisfies the first two properties of Sela's core resolutions

#### Tight envelopes do not increase complexity (reorganization of the enveloping system)

**Theorem.** Node `FO3/tight-envelope-reorganization`.

Let G ≤ F_{R(W)} and L₁ = 1 be as in FO3/tight-enveloping, the family of simple closed curves of each QH subgroup of S₁ mapped to 1 at the next level being compatible with the splittings induced from c(L₁). Then the Kurosh rank of TEnv(G; L₁) is at most the Kurosh rank of the fundamental sequence for S₁ = 1 modulo the free factors of ⟨X₂,…,X_n⟩. If they are equal, L₁ can be reorganized (moving stable QH subgroups down) into a well-aligned system L₂ = 1 with the same solutions from the fundamental sequences, through which every homomorphism of G factoring through c(L₁) also factors, and with size(TEnv(G; L₂)) ≤ size(S₁); if moreover all parameters (Kurosh rank, size, abelian rank, rank) agree, TEnv(G; L₂) has one level and the same abelian decomposition as S₁. The same holds for H ≤ F_{R(W)} with TEnv(H; S₁) in place of S₁.

**Hypotheses.**

- Compatibility of the curve families as stated.

**Construction or proof.**

1. Compare the QH subgroups of TEnv(G; L₁) with those of S₁ through the surfaces and the compatible families of simple closed curves.
2. In the equality case, move stable QH subgroups (those mapped onto QH subgroups of the same size) down to a single level as in KM06 §7.3, obtaining L₂.
3. The size and abelian-rank comparisons follow from the finite-index inclusions of QH subgroups (FO3/induced-ntq).

**Acceptance.**

- If G = F_{R(W)} and L₁ = W, equality holds and TEnv has one level.

**Alternative route and remarks.** The available texts give this as a sketch (QE-FREE §5.4); the full argument is KM06 §§11–12, not read here, and is contested (SELA-REPORT items (29)–(51)); see the packet's gaps.

**Prerequisites.** `FO3/tight-enveloping`, `FO3/complexity`, `FO3/induced-ntq`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §5.4, pp. 35–37. the non-increase of complexity, the reorganization L₁ ↦ L₂ by moving stable QH subgroups down (KM06 §7.3), and the one-level conclusion in the equality case; stated as a sketch of KM06's argument
- [Olga Kharlampovich, Alexei Myasnikov, On Tarski's decidability problem: response to Sela's report](https://arxiv.org/abs/1402.0482), items (43), (49), pp. 5–6. when comparing TEnv(W_{n−1}) and TEnv(W_n) the sequences are changed, with a reduction in Kurosh rank or in size when the Kurosh rank is equal

#### Certificates and configuration groups

**Definition.** Node `FO3/configuration-group`. Planet: *Configuration groups*.
Proposed namespace `FreeGroup.FirstOrder`, module `TauCeti/GroupTheory/FreeGroup/FirstOrder/Configuration`.

Fix parameters P, an irreducible system U₁(P, Z, Z⁽¹⁾) = 1 with F_{R(U₁)} without sufficient splitting modulo ⟨P, Z⟩, systems V_{2,s}(P, Z, Z⁽¹⁾, Z₁⁽²⁾) = 1 (s = 1,…,t) with coordinate groups without sufficient splitting modulo ⟨P, Z, Z⁽¹⁾⟩, systems U_{2,m}(P, Z, Z⁽¹⁾, Z₁⁽²⁾, Z⁽²⁾) = 1, finitely many next-level systems V_{3,s}, and widths i₁,…,i_t. A certificate of level 2 and width i = i₁ + ⋯ + i_t for a value P̄ is a tuple (P̄, Z̄, Z̄⁽¹⁾, Z̄₁^{(2,j,s)}, Z̄^{(2,j,s)})_{j ≤ i_s, s ≤ t} such that: (1) (P̄, Z̄, Z̄⁽¹⁾) is an algebraic solution of U₁ (FO4/algebraic-solution), each (…, Z̄₁^{(2,j,s)}) an algebraic solution of V_{2,s} and each (…, Z̄^{(2,j,s)}) an algebraic solution of U_{2,m_s}; (2) the Z̄₁^{(2,j,s)}, j ≤ i_s, are pairwise not ∼_MAX-equivalent (FO4/max-equivalence); (3) for each of the finitely many values of Z₁⁽²⁾, the fundamental sequences of V_{2,s} are contained in the union of those of U_{2,m_s} for the values Z^{(2,j,s)}; (4) there is no further algebraic solution Z₁^{(2, i_s+1, s)} of V_{2,s} not ∼_MAX-equivalent to these; (5) (P̄, Z̄, Z̄⁽¹⁾) satisfies no proper equation that forces V_i(P̄, Z̄, X) = 1 for every X; (6) no (…, Z̄₁^{(2,1,s)}, Z̄^{(2,1,s)}) extends to a solution of a V_{3,s}. Adding root variables Q for the primitive roots of the images of the edge groups and abelian vertex groups of the relative JSJ decompositions of the F_{R(V_{2,s})}, the configuration groups are the fully residually free groups H discriminated by families of certificates factoring through one initial fundamental sequence of level 2 and width i modulo ⟨P⟩.

**API.**

- `FreeGroup.FirstOrder.Certificate` (data): A tuple satisfying (1)–(6) for given systems and widths.
- `FreeGroup.FirstOrder.ConfigGroup` (data): A configuration group: the group discriminated by a family of certificates through an initial fundamental sequence of level 2 and width i modulo ⟨P⟩.
- `FreeGroup.FirstOrder.Certificate.width_le` (relation): i_s ≤ N(F_{R(V_{2,s})}, ⟨P, Z, Z⁽¹⁾⟩) for each s.
- `FreeGroup.FirstOrder.ConfigGroup.isLimitGroup` (structure): Configuration groups are finitely generated fully residually free.
- `FreeGroup.FirstOrder.Certificate.toConfigGroup` (projection): A certificate defines a homomorphism of one of the configuration groups to F.
- `FreeGroup.FirstOrder.ConfigGroup.empty` (example): For t = 0 the configuration groups are the groups discriminated by algebraic solutions of U₁ = 1.

**Uses.**

- QE-FREE, §5.2, Proposition 5, p. 31: for each initial fundamental sequence, a generic family of certificates or deeper fundamental sequences
- QE-FREE, §5.2, Proposition 6 and Corollary 1, pp. 31–33: terminal groups of fundamental sequences for configuration groups modulo P are computable
- FO6/true-level-two: True(Θ)₂ is a Boolean combination of ∃∀-sets built from configuration groups

**Unit tests.**

- `ConfigGroup.width_zero` (degenerate): With t = 0 a certificate is an algebraic solution (P̄, Z̄, Z̄⁽¹⁾) of U₁ = 1 satisfying (5), and the configuration groups are the fully residually free groups discriminated by such solutions.
- `Certificate.width_bound` (compatibility): For each s the width i_s is at most N(F_{R(V_{2,s})}, ⟨P, Z, Z⁽¹⁾⟩) of FO4/algebraic-solution-bound; hence only finitely many widths occur.
- `Certificate.not_equivalent` (non-example): Two solutions Z̄₁^{(2,1,s)}, Z̄₁^{(2,2,s)} related by a fractional Dehn twist of the JSJ decomposition of F_{R(V_{2,s})} cannot both appear in a certificate (condition (2)); counting them separately would make the width unbounded.
- `ConfigGroup.rigid_example` (computation): For U₁ = (Z⁽¹⁾² = P) with one parameter P over F(a, b) and t = 0, the certificates are the pairs (P̄, √P̄) with P̄ a non-trivial square, and the configuration group is ⟨F, Z⁽¹⁾⟩ free of rank 3 with P = (Z⁽¹⁾)².

**Construction or proof.**

1. Encode certificates as solutions of a finite system of equations and inequations in the variables P, Z, Z⁽¹⁾, Z₁^{(2,j,s)}, Z^{(2,j,s)}, Q, with conditions (1)–(6) expressed through the complete reducing systems (FO4/reducing-quotients-effective), the twist parameters of FO4/max-class-count-definable and the systems V_{3,s}.
2. A configuration group is a maximal fully residually free quotient discriminated by a family of certificates through one initial fundamental sequence (FG8: every family of homomorphisms factors through finitely many maximal fully residually free quotients).

**Acceptance.**

- With t = 0 the conditions reduce to (1) and (5) for U₁, and the configuration groups are the groups discriminated by algebraic solutions of U₁.
- Widths are bounded by the bound N of FO4/algebraic-solution-bound for each V_{2,s}.

**Prerequisites.** `FO4/algebraic-solution`, `FO4/max-equivalence`, `FO4/algebraic-solution-bound`, `FO2/sufficient-splitting`, `FO2/fundamental-sequences-modulo`, `FreeGroupsAndLimitGroups:FG8/limit-group-equivalences`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §5.2, Definition 6 with conditions (1)–(6) and the root variables Q, pp. 29–30. certificates of level 2 and width i and configuration groups, modified from KM06 Definitions 27–28 (negating condition (6) because QE-FREE treats ¬Φ)
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §6.2, Definition 11, p. 48. the same over Γ
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), Definitions 27–28 (as cited in QE-FREE §5.2, footnote 2). initial fundamental sequences of levels (2,1) and (2,2) and width i

#### Finiteness and computability of configurations

**Theorem.** Node `FO3/configuration-finiteness`.

With the data of FO3/configuration-group: (1) there are only finitely many initial fundamental sequences of level 2 (finitely many widths, and finitely many sequences for each width), because the widths are bounded by FO4/algebraic-solution-bound; (2) for each configuration group H = F_{R(W)} with generators P, Z, Z⁽¹⁾, Z₁^{(2,j,s)}, Z^{(2,j,s)}, Q, the terminal group of each fundamental sequence for H modulo P can be found effectively, although no defining system W is given in advance; (3) hence the initial fundamental sequences for Z of level 2 and width i can be constructed effectively; (4) for each such sequence and each P̄ through it admitting a certificate, either there is a generic family of certificates in the sequence (depth 1), or every certificate extends by a further Z₁^{(2, i_s+1, s)} through one of the finitely many groups H_surplus with that extra variable reducing or ∼_MAX-equivalent to an earlier one (depth 2 and deeper); the specializations failing (1)–(6) factor through finitely many limit groups Red₁,…,Red_k, F_{R(V_{3,m_s})}, R_{Q1},…,R_{Qm}, H_surplus, whose NTQ groups are correcting extensions of the NTQ group of the sequence.

**Hypotheses.**

- Data as in FO3/configuration-group; complete reducing systems computed by FO4/reducing-quotients-effective.

**Construction or proof.**

1. (1) Bound the widths by N of FO4/algebraic-solution-bound; for each width, the initial fundamental sequences modulo ⟨P⟩ are finitely many by FO2/fundamental-sequences-modulo.
2. (2) Build, for each system U_{2,m_s}, a generalized equation modulo ⟨P, Z, Z⁽¹⁾, Z₁^{(2,j,s)}⟩ for minimal algebraic solutions (bases moved to intervals labelled by parameters), glue in generalized equations for V_{2,m} and U_{1,m} along intervals with the same labels, and add the inequalities of (1)–(6) as non-identity conditions on bases (FG7/reduction-to-generalized-equations); construct their fundamental sequences modulo ⟨P⟩ with automorphism groups restricted to those preserving the generalized equations; the subgroups generated by the images of the generators in the terminal groups are the terminal groups for H.
3. (3) is (1) with (2).
4. (4) Classify how a generic family of the sequence can fail (1)–(6) and apply FO2/parametrization-theorem to see that the corresponding NTQ groups are correcting extensions.

**Acceptance.**

- With t = 0 there is a single width and the depth-1 case occurs when algebraic solutions of U₁ form a generic family.

**Prerequisites.** `FO3/configuration-group`, `FO4/algebraic-solution-bound`, `FO4/reducing-quotients-effective`, `FO2/fundamental-sequences-modulo`, `FO2/parametrization-theorem`, `FreeGroupsAndLimitGroups:FG7/reduction-to-generalized-equations`, `FreeGroupsAndLimitGroups:FG7/elementary-transformations`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §5.2, p. 30 ('It follows from Theorem 7 …'), Proposition 5, p. 31, Proposition 6 with proof, pp. 31–33, Corollary 1, p. 33. finitely many initial fundamental sequences of level 2; the failure analysis (1)–(4) and the depth dichotomy; the algorithm via generalized equations whose intervals are labelled by the parameter variables with inequalities encoding (1)–(6); the effective construction of the initial sequences
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §6.2, Proposition 18 and Corollary 3, pp. 49–51. the same over Γ

### Dependencies

Within this roadmap: FO2, FO4. Other roadmaps: `FreeGroupsAndLimitGroups:FG2`, `FreeGroupsAndLimitGroups:FG4`, `FreeGroupsAndLimitGroups:FG6`, `FreeGroupsAndLimitGroups:FG7`, `FreeGroupsAndLimitGroups:FG8`, `FreeGroupsAndLimitGroups:FG10`.

### Acceptance tests

The layer is accepted when every node above is stated with its hypotheses, every definition passes its unit tests, and the acceptance items of its theorems hold. Coverage: planned; remaining: FO3/tight-envelope-reorganization rests on the sketch of QE-FREE §5.4; check it against KM06 §§11–12 and SELA-REPORT items (26)–(56) (gaps 'KM06 not read' and 'level-2 termination')..

## Layer FO5: Existential–universal decision trees

The decision trees for ∃∀- and ∀∃-sentences: their construction from the Makanin–Razborov diagram (FG10) and the implicit function theorems, their finiteness, and the decidability of the ∀∃-theory of a nonabelian free group. Planned targets: the first step (free lift and exceptional system), block-NTQ groups and the minimality restriction, the ∀∃-tree with its cases, its finiteness and the correctness of both answers, the ∀∃ decider and the decidability theorem, Sacerdote's rank independence of the ∀∃-theory, and the computable bound on algebraic solutions.

Planets: Block-NTQ groups; The ∀∃-decision tree; Finiteness of the ∀∃-tree; Decidability of the ∀∃-theory; Sacerdote's theorem.

#### First step of the ∀∃-procedure: the free lift and the exceptional system U₀

**Construction.** Node `FO5/ae-tree-first-step`.
Proposed namespace `FreeGroup.FirstOrder`, module `TauCeti/GroupTheory/FreeGroup/FirstOrder/AETree`.

Let Φ = ∀X∃Y ⋁_i (U_i(X, Y) = 1 ∧ V_i(X, Y) ≠ 1) be a ∀∃-sentence of L_A in standard form (FO1/standard-form) over F = F(A), |A| ≥ 2. Run the equation–inequation solver of FreeGroupsAndLimitGroups FG7 over the free group F(A ⊔ X) on each disjunct, with Y as variables and X as constants. If no disjunct has a solution, return 'false'. Otherwise take the first solution Y = f(X) found, for a disjunct i, and set U₀(X) := V_i(X, f(X)): Φ holds at every X̄ with U₀(X̄) ≠ 1, and it remains to check the X̄ in V_F(U₀). If U₀ = 1 has no solution in F, return 'true' (the sentence is proved on the first level); otherwise pass G := F_{R(U₀)} with the set of all homomorphisms G → F to the root of the ∀∃-tree.

**API.**

- `FreeGroup.FirstOrder.aeFirstStep` (data): The first-step procedure: none (Φ false), or the free lift f with the exceptional system U₀.
- `FreeGroup.FirstOrder.aeFirstStep_none` (characterisation): aeFirstStep Φ = none ↔ no disjunct has a solution in F(A ⊔ X); then Φ is false.
- `FreeGroup.FirstOrder.aeFirstStep_some` (projection): If aeFirstStep Φ = some (f, U₀), Φ holds at every X̄ outside V_F(U₀).
- `FreeGroup.FirstOrder.aeFirstStep_computable` (other): The first step is computable (FG7/solver-computable).
- `FreeGroup.FirstOrder.aeFirstStep_existential` (example): If X is empty (Φ existential), the first step decides Φ outright, agreeing with FG7/existential-universal-deciders.

**Uses.**

- QE-FREE, §3.4, p. 11: G = F_{R(U₀)} is the root group of T_EA(Φ)
- FO5/ae-tree: the tree is built over G
- FO6/parametric-tree: the parametric tree starts with formula solutions of U = 1 for all values of P

**Unit tests.**

- `aeFirstStep.identity` (computation): For Φ = ∀x∃y (y = x) over F(a, b), the standard form is ∀x∃y (y x⁻¹ = 1 ∧ a ≠ 1) (FO1/standard-form adds the inequation a ≠ 1); the solver returns f(x) = x, U₀ = (a = 1) is inconsistent, and the step returns 'true'.
- `aeFirstStep.root` (non-example): For Φ = ∀x∃y (y² = x), y² = x has no solution in F(a, b, x), so the step returns 'false' (indeed x = a has no square root).
- `aeFirstStep.commuting` (computation): For Φ = ∀x∃y (y ≠ 1 ∧ [x, y] = 1), the solver may return f(x) = x; then U₀ = (x = 1), which is consistent, and the tree continues on G = F_{R(x = 1)} = F, where the second level finds y = a.
- `aeFirstStep.existential` (degenerate): For X empty the step decides the existential sentence ∃Y φ₀ directly; the answer agrees with FG7/existential-universal-deciders.

**Construction or proof.**

1. Solve U_i(X, Y) = 1 ∧ V_i(X, Y) ≠ 1 over F(A ⊔ X) with the solver of FG7 (decides and returns a solution).
2. No solution for any i: by FO1/free-lifting-theorem Φ is false.
3. A solution f for disjunct i: U_i(X, f(X)) = 1 identically, so Φ fails at most where V_i(X, f(X)) = 1; decide consistency of U₀ = 1 over F with the FG7 solver.

**Acceptance.**

- For Φ = ∀x∃y (y = x), with standard form ∀x∃y (y x⁻¹ = 1 ∧ a ≠ 1), the first step returns 'true' with f(x) = x and U₀ = (a = 1), which is inconsistent over F.
- For Φ = ∀x∃y (y² = x) the first step returns 'false'.

**Prerequisites.** `FO1/free-lifting-theorem`, `FO1/free-lift`, `FO1/standard-form`, `FreeGroupsAndLimitGroups:FG7/solver-procedure`, `FreeGroupsAndLimitGroups:FG7/solver-sound`, `FreeGroupsAndLimitGroups:FG7/solver-complete`, `FreeGroupsAndLimitGroups:FG7/existential-universal-deciders`, `FreeGroupsAndLimitGroups:FG5/algebraic-set-radical`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.4, p. 11. if the sentence is true there is a solution of U = 1 ∧ V ≠ 1 in F(X) ∗ F (IFT Theorem 4) found by Makanin's algorithm, or the sentence is false; then only X with V(X, f(X)) = 1 remain, and U₀ := V(X, f(X)); inconsistency of U₀ proves the sentence on the first level
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §4.4, p. 31. the same first step over Γ
- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §4.4, Theorem 4, pp. 26–27. the free lifting theorem that justifies the 'false' answer

#### Block-NTQ groups and the minimality restriction

**Definition.** Node `FO5/block-ntq`. Planet: *Block-NTQ groups*.
Proposed namespace `FreeGroup.FirstOrder`, module `TauCeti/GroupTheory/FreeGroup/FirstOrder/AETree`.

Along a branch of the ∀∃-tree, let c be a fundamental sequence for G₁ modulo the images R₁,…,R_s of the free factors of ⟨X₂,…,X_n⟩, M(X, Z₁) the group generated by the top p levels of the NTQ group of c (above the level p where the projective image of G becomes proper, FO3/projective-images), c₃ the composite of the induced sequence c₂ for G above level p (FO3/induced-ntq) with a fundamental sequence b₂ for the quotient G_p, N̄₁ its canonical NTQ group and N̄₁corr a correcting extension relative to U(X, Y) = 1 ∧ V(X, Y) ≠ 1 (FO2/correcting-extension). The block-NTQ group N₁ is the fully residually free quotient of the amalgam of M(X, Z₁) and N̄₁corr along the top p levels of N̄₁corr, obtained by adding the relations that make it commutation transitive; it has two blocks, and later steps add blocks. The minimality restriction: the groups F_{R(U_{n+1})} carried by the next vertices are discriminated by homomorphisms minimal for N̄_n with respect to the images of G and minimal for the top block with respect to the images of the previous F_{R(U_n)}.

**API.**

- `FreeGroup.FirstOrder.BlockNTQ` (data): A block-NTQ group: a finite list of NTQ blocks glued along levels, made commutation transitive.
- `FreeGroup.FirstOrder.BlockNTQ.topBlock` (projection): The top block M(X, Z).
- `FreeGroup.FirstOrder.BlockNTQ.isFullyResiduallyFree` (structure): A block-NTQ group is fully residually free.
- `FreeGroup.FirstOrder.BlockNTQ.contains_G` (relation): The image of G embeds in the block-NTQ group of its vertex unless an easy case applies.
- `FreeGroup.FirstOrder.BlockNTQ.single` (example): A single NTQ group is a block-NTQ group with one block.

**Uses.**

- QE-FREE, §3.4, p. 14: the parametrization theorem applied to N̄₁ gives the formula solutions and the next equation U₂
- QE-FREE, §3.7, Theorem 4, pp. 18–21: the top blocks of the N_n eventually stabilize

**Unit tests.**

- `BlockNTQ.single` (degenerate): An NTQ group F_{R(W)} with its levels is a block-NTQ group with one block, and its top block is F_{R(W)}.
- `BlockNTQ.frf` (compatibility): Every block-NTQ group is fully residually free, hence torsion-free and CSA (FG8/frf-properties).
- `BlockNTQ.not_amalgam` (non-example): The plain amalgam of M(X, Z₁) and N̄₁corr need not be commutation transitive (two centralizers can become conjugate), so it need not be fully residually free; the added relations are part of the definition.
- `BlockNTQ.two_blocks` (computation): For c with one level S₁ over the free factor ⟨X₂⟩ and G collapsing at level 1, N₁ has two blocks: the top block generated by S₁'s level and the block of the fundamental sequence for the quotient.

**Construction or proof.**

1. Form the amalgam M(X, Z₁) ∗_{top p levels} N̄₁corr from finite presentations.
2. Add commutation relations for pairs of elements whose centralizers must coincide (found with FG10/frf-basic-algorithms) until the group is commutation transitive; the result is fully residually free (FG8/frf-properties).
3. Record the blocks and their levels; state the minimality restriction through FO2/fundamental-sequences-modulo.

**Acceptance.**

- If c has a single level identical to S₁ the block-NTQ group has a single block.
- Every block-NTQ group is a finitely generated fully residually free group.

**Prerequisites.** `FO3/induced-ntq`, `FO3/projective-images`, `FO2/correcting-extension`, `FO2/fundamental-sequences-modulo`, `FreeGroupsAndLimitGroups:FG8/frf-properties`, `FreeGroupsAndLimitGroups:FG8/ntq-coordinate-group`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.4, pp. 13–14. the block-NTQ group N₁ as a fully residually free quotient of the amalgam of M(X, Z₁) and N̄₁corr, made commutation transitive, and the minimality restriction
- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.6, p. 16. block-NTQ groups N_i constructed at step i and their images N_i^j
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §4.4–4.6, pp. 31–37. the same over Γ

#### The ∀∃-tree T_EA(Φ)

**Construction.** Node `FO5/ae-tree`. Planet: *The ∀∃-decision tree*.
Proposed namespace `FreeGroup.FirstOrder`, module `TauCeti/GroupTheory/FreeGroup/FirstOrder/AETree`.

For a ∀∃-sentence Φ whose first step (FO5/ae-tree-first-step) passes G = F_{R(U₀)}, the tree T_EA(Φ) is built as follows. Root: all homomorphisms G → F. Level 1: one vertex for each well-aligned fundamental sequence V_fund(S(b)) of the canonical embedding tree of G (FO2/canonical-embedding-tree) with its correcting extension S_corr(b) (FO2/correcting-extension); if the image of G in N₀ = F_{R(S(b))} is a proper quotient, replace the vertex by the fundamental sequences of that quotient. Otherwise apply the parametrization theorem (FO2/parametrization-theorem) to get formula solutions Y = f(X₁,…,X_n) over S_corr(b) — if none exists, Φ is false; the construction searches for a formula solution and does not decide its existence — and restrict to values minimal with respect to the images of G (FO2/fundamental-sequences-modulo) satisfying the new equation V(X, f(X)) = 1, giving U₁ and G₁ = F_{R(U₁)}; if U₁ is inconsistent the branch is closed (proved on level 2). General step n: given the block-NTQ group N_{n−1} (FO5/block-ntq) and fundamental sequences c^{(n)} for G_n modulo the rigid subgroups R_{r(n)} of the top block: first easy case — G (or the current quotient) does not embed in the image of N_{n−1}: continue with the well-aligned sequences of the image G^{(n)}; second easy case — some top block M_{g(r)}(X, Z_{g(r)}) has a proper projective image: restart from vertex w_{g(r)+1} with that quotient and only sequences of non-maximal complexity; Case 1 (top levels agree: pass to the next level), Case 2 (top levels of c^{(n−1)},…,c^{(n−i)} agree but not c^{(n)}: a level where the image of the top block is proper; build the next blocks from the induced sequence and a sequence for the quotient), Case 3 (consecutive top levels differ: likewise, with sequences not of maximal complexity), Case 4 (all levels agree: replace c by the sequence d induced by the image G_{n,corr} of the corrective extension, which decreases the number of free factors, the regular size or the abelian size at some level). Each vertex carries a fundamental sequence, a block-NTQ group, a correcting extension and, after the parametrization theorem, the next equation. The construction halts when Φ is true (FO5/ae-tree-correct); when Φ is false it may not halt, and the decider (FO5/ae-decider) runs it alongside a search for a counterexample.

**API.**

- `FreeGroup.FirstOrder.AETree` (data): The ∀∃-tree of a sentence, as a finitely branching rooted tree of vertex data.
- `FreeGroup.FirstOrder.AETree.vertexData` (projection): The fundamental sequence, block-NTQ group, correcting extension and current equation at a vertex.
- `FreeGroup.FirstOrder.AETree.IsClosed` (data): A branch is closed when its equation is inconsistent over F.
- `FreeGroup.FirstOrder.AETree.step` (data): One step of the construction (easy cases, Cases 1–4).
- `FreeGroup.FirstOrder.AETree.homs_cover` (characterisation): At every depth the homomorphisms G → F not yet verified factor through the fundamental sequences at the open vertices.
- `FreeGroup.FirstOrder.AETree.root_only` (example): If the first step returns 'true', the tree is its root.

**Uses.**

- FO5/ae-tree-finite: finiteness of the tree
- FO5/ae-decider: the decider reads off the answer
- FO6/parametric-tree: the parametric tree T_X is built in the same way with P, Z, Z⁽¹⁾ as parameters

**Unit tests.**

- `AETree.root_only` (degenerate): For Φ = ∀x∃y (y = x) the first step proves Φ and AETree Φ is its root, with no open branch.
- `AETree.commuting` (computation): For Φ = ∀x∃y (y ≠ 1 ∧ [x, y] = 1) over F(a, b): the first step leaves U₀ = (x = 1), G = F; the canonical embedding tree of G has one branch, the parametrization theorem gives y = a, the new equation a = 1 is inconsistent, and the tree closes on level 2: Φ is true.
- `AETree.false` (non-example): For Φ = ∀x∃y ([x, y] ≠ 1), false in F(a, b) (take x = 1): the first step finds y = a ([x, a] ≠ 1 in F[x]) and leaves U₀ = ([x, a] = 1); on G = ⟨a, b, x | [x, a]⟩ the formula solution y = b leaves the equation x = 1; at that vertex ∃y [1, y] ≠ 1 has no formula solution, so the search for one never halts and the tree construction gives no answer; the counterexample search of FO5/ae-decider finds x̄ = 1, where the universal sentence ∀y [1, y] = 1 holds, and aeDecide answers 'false'. A procedure that stopped after the first step would wrongly answer 'true'.
- `AETree.homs_cover_example` (characterisation): At each depth, every X̄ at which Φ has not yet been verified is a value of some fundamental sequence at an open vertex.

**Construction or proof.**

1. Implement the tree as a finitely branching tree whose vertices hold finite presentations of block-NTQ groups, fundamental sequences and equations; every operation used is one of the effective constructions of FO2–FO3 and FG10.
2. At each vertex decide which case applies (properness of projective images is decidable, FO3/projective-images) and apply it.
3. Formula solutions are found by search, not decided: enumerate tuples Y of words in the generators of the correcting extension F_{R(Ū)} and test W(X^θ, Y) = 1 and W₁(X^θ, Y) ≠ 1 with the word problem of FG10/frf-basic-algorithms-correct. When Φ is true a formula solution exists at every vertex (FO2/parametrization-theorem; IFT Theorem 12 finds it effectively), so each search halts. When Φ is false a search may run forever, and falsity is detected by the counterexample search of FO5/ae-decider. (Deciding the existence of formula solutions outright would need equations with inequations over the limit group F_{R(Ū)}, FG10/equations-over-limit-groups, which rests on a recorded gap of FreeGroupsAndLimitGroups and is not used here.)
4. A branch is closed when its current equation is inconsistent over F (decided by FG7/solver-procedure); the construction returns 'true' when every branch is closed.

**Acceptance.**

- For Φ proved on the first level the tree has only its root.
- For Φ = ∀x∃y (y ≠ 1 ∧ [x, y] = 1) the tree closes on level 2.

**Prerequisites.** `FO5/ae-tree-first-step`, `FO5/block-ntq`, `FO2/canonical-embedding-tree`, `FO2/parametrization-theorem`, `FO2/fundamental-sequences-modulo`, `FO3/induced-ntq`, `FO3/projective-images`, `FO3/terminal-image-proper`, `FO3/complexity`, `FreeGroupsAndLimitGroups:FG7/solver-procedure`, `FreeGroupsAndLimitGroups:FG10/frf-basic-algorithms-correct`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §§3.4–3.6, pp. 11–18. the first step, the second step with Cases 1–4, and the general step with the two easy cases and Cases 1–4, in the authors' Player A / Player B formulation
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §§4.4–4.6, pp. 31–37. the same tree over Γ
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), §§7.8–7.12 and the construction of the ∀∃-tree (as cited in QE-FREE §3 and KM-RESPONSE items (13)–(22)). the original construction

#### Finiteness of the ∀∃-tree

**Theorem.** Node `FO5/ae-tree-finite`. Planet: *Finiteness of the ∀∃-tree*.

For every ∀∃-sentence Φ of L_A over F = F(A), |A| ≥ 2, the tree T_EA(Φ) (FO5/ae-tree) is finite and its construction terminates. The proof is by induction on the length of the longest proper descending chain of fully residually free quotients of G and on the complexity of the top level S₁ (FO3/complexity): in Case 3 the complexity of the top block decreases (by Lemma 2: the homomorphisms through c are generic for each regular quadratic equation of Q₁ and ab(c) = ab(V_fund(Q)), so c has one level identical to Q₁; or S can be rebuilt with smaller size; or sizes agree and ab(c) < ab(V_fund(Q))); the second easy case can recur only finitely often for each r (descending chain of proper quotients of M_{g(r)}); Case 4 cannot recur with N_n = N_{n₁} forever; the first easy case and Case 2 pass to proper quotients, finite by induction.

**Hypotheses.**

- F = F(A), |A| ≥ 2; Φ a ∀∃-sentence of L_A.

**Construction or proof.**

1. Proper descending chains of fully residually free quotients of a finitely generated fully residually free group are finite (equational Noetherianity, FG5/FG8): this bounds the first easy case and Case 2.
2. Lemma 2: for a sequence c modulo the free factors of ⟨X₂,…,X_m⟩ with the same Kurosh rank as Q₁, either c is generic for each regular quadratic equation of Q₁ with ab(c) = ab(V_fund(Q)) (one level identical to Q₁), or S can be rebuilt with size(S) < size(Q₁), or size(S) = size(Q₁) and ab(c) < ab(V_fund(Q)) (uses FO2/generic-family-lifts and stability of QH subgroups).
3. Hence Case 3 decreases the well-founded complexity of the top block, so it applies finitely often; then the procedure moves to the second block, finite by induction.

**Acceptance.**

- For a sentence proved on the first level the tree has one vertex.

**Alternative route and remarks.** Sela's route proves the corresponding termination for his 'tree of stratified sets' (Diophantine geometry IV–V) through Kurosh rank and the strict decrease of complexities of core resolutions.

**Prerequisites.** `FO5/ae-tree`, `FO3/complexity`, `FO3/induced-ntq-terminates`, `FO2/generic-family-lifts`, `FreeGroupsAndLimitGroups:FG5/linear-equationally-noetherian`, `FreeGroupsAndLimitGroups:FG8/limit-group-equivalences`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.7, Theorem 4 with Lemma 2 and the proof, pp. 18–21. finiteness of T_EA(Φ) and of its construction by decrease of the complexity and induction on descending chains of fully residually free quotients
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §4.7, Theorem 5 and Lemma 5, pp. 38–40. the same over Γ
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), (the original finiteness proof, as cited by QE-FREE). contested in SELA-REPORT items (13)–(25); KM-RESPONSE answers these items

#### Correctness of the ∀∃-tree: both answers

**Theorem.** Node `FO5/ae-tree-correct`.

Let Φ = ∀X∃Y φ₀ be a ∀∃-sentence of L_A over F = F(A), |A| ≥ 2. (1) If the construction of T_EA(Φ) ends with every branch closed (every terminal equation inconsistent over F), Φ is true in F. (2) If at some vertex no formula solution exists over the correcting extension (in particular if the first step finds no free lift), Φ is false in F. (3) If Φ is true, the construction, with formula solutions found by search, halts with every branch closed. (4) Φ is false iff there is X̄ ∈ F^X at which the universal sentence ∀Y ¬φ₀(X̄, Y), with constants from F, holds in F.

**Hypotheses.**

- F = F(A), |A| ≥ 2.

**Construction or proof.**

1. (1) Every X̄ ∈ F^X is either verified at some vertex (the formula solution witnesses Φ at X̄) or factors through an open vertex (AETree.homs_cover); closed branches have no remaining X̄, so all X̄ are verified.
2. Minimality: if a specialization of the variables of the fundamental sequence is replaced by a minimal one in its class, Φ at X̄ is unchanged, since the classes are orbits of canonical automorphisms fixing the images of G (QE-FREE p. 12).
3. (2) If Φ were true, the parametrization theorem (FO2/parametrization-theorem) would give a formula solution at every vertex, applied to the NTQ system of the vertex restricted to the remaining X; at the first step this is FO1/free-lifting-theorem.
4. (3) If Φ is true, by (2) a formula solution exists at every vertex, so every search halts; the construction is finite (FO5/ae-tree-finite), so it ends, and since no vertex lacks a formula solution every branch ends closed.
5. (4) is the meaning of the falsity of ∀X∃Y φ₀; the universal sentences ∀Y ¬φ₀(X̄, Y) with constants from F are decided by FG7/existential-universal-deciders.

**Acceptance.**

- ∀x∃y (y ≠ 1 ∧ [x, y] = 1) gives (1) and (3); ∀x∃y ([x, y] ≠ 1) gives (2) at the vertex x = 1 and (4) with X̄ = 1.

**Prerequisites.** `FO5/ae-tree`, `FO5/ae-tree-finite`, `FO2/parametrization-theorem`, `FO1/free-lifting-theorem`, `FO2/fundamental-sequences-modulo`, `FreeGroupsAndLimitGroups:FG7/existential-universal-deciders`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.4, p. 11 ('If there is no such solution then the sentence is false'), p. 12 ('This is enough because …'), p. 15 ('If the sentence is true there exists a formula solution over the correcting extension'). the two answers: closure of all branches proves the sentence; absence of formula solutions refutes it; restriction to minimal values loses no candidate counterexample
- [Olga Kharlampovich, Alexei Myasnikov, On Tarski's decidability problem: response to Sela's report](https://arxiv.org/abs/1402.0482), items (13)–(15), pp. 3–4. the authors explain why passing to minimal specializations and fundamental sequences of the extra variables loses no value of X that could make Φ false

#### The decider for ∀∃-sentences

**Construction.** Node `FO5/ae-decider`.
Proposed namespace `FreeGroup.FirstOrder`, module `TauCeti/GroupTheory/FreeGroup/FirstOrder/AETree`.

aeDecide takes (the FG3 code of) a ∀∃-sentence Φ = ∀X∃Y φ₀ of L_A and runs two searches in parallel, returning the first answer: (a) the standard form (FO1/standard-form) and the first step (FO5/ae-tree-first-step), returning false if no free lift exists, and then the construction of T_EA(Φ) (FO5/ae-tree), returning true when every branch is closed; (b) an enumeration of tuples X̄ ∈ F^X, returning false at the first X̄ for which FG7's universal decider confirms ∀Y ¬φ₀(X̄, Y). Equivalently, the true ∀∃-sentences and the false ones are both recursively enumerable, and Post's theorem (Mathlib's ComputablePred.computable_iff_re_compl_re') makes truth a computable predicate. On an ∃∀-sentence Ψ it returns the negation of aeDecide on the ∀∃-sentence equivalent to ¬Ψ (FO1/quantifier-classes).

**API.**

- `FreeGroup.FirstOrder.aeDecide` (data): The decider on codes of ∀∃-sentences of L_A, returning Bool.
- `FreeGroup.FirstOrder.eaDecide` (data): The decider on ∃∀-sentences through negation.
- `FreeGroup.FirstOrder.aeDecide_spec` (characterisation): aeDecide Φ = true ↔ FreeGroup A ⊨ Φ, for every ∀∃-sentence Φ.
- `FreeGroup.FirstOrder.eaDecide_spec` (characterisation): eaDecide Ψ = true ↔ FreeGroup A ⊨ Ψ, for every ∃∀-sentence Ψ.
- `FreeGroup.FirstOrder.computable_aeDecide` (other): aeDecide is computable (total on ∀∃-sentences).
- `FreeGroup.FirstOrder.aeTrue_rePred` (other): The set of codes of true ∀∃-sentences is REPred (search (a)) and so is the set of false ones (search (b)); with ComputablePred.computable_iff_re_compl_re' this is computable_aeDecide.
- `FreeGroup.FirstOrder.aeDecide_existential` (compatibility): On existential and universal sentences aeDecide agrees with FG7/existential-universal-deciders.

**Uses.**

- FO5/effective-bound: the bound N(K, H) is computed by deciding ∃∀-sentences
- FO7/decision-procedure: the final decision procedure decides the Boolean combination of ∀∃-sentences returned by the elimination

**Unit tests.**

- `aeDecide.identity` (computation): aeDecide on ∀x∃y (y = x) returns true.
- `aeDecide.root` (computation): aeDecide on ∀x∃y (y² = x) returns false.
- `aeDecide.existential` (compatibility): On the existential sentence ∃y (y² = a) (false in F(a, b)) aeDecide agrees with FG7's existential decider: both return false.
- `aeDecide.vaught` (non-example): On Vaught's sentence ∀x∀y∀z (x²y²z² = 1 → [x, y] = 1 ∧ [x, z] = 1 ∧ [y, z] = 1), a universal sentence true in F (Lyndon), aeDecide returns true; on the same sentence evaluated in the non-orientable genus-3 surface group (FO7/non-examples) it would be false, so the decider is specific to free groups.

**Construction or proof.**

1. Compose the computable steps (FG3 encodings, FO1 standard form, FG7 solver and universal decider, FO2–FO3 constructions, FG10 algorithms).
2. Search (a) halts on true sentences (FO5/ae-tree-correct (3)) and its answer true is correct (FO5/ae-tree-correct (1)); its answer false at the first step is correct by FO1/free-lifting-theorem. Search (b) halts on false sentences (FO5/ae-tree-correct (4)) and its answer is correct. So both answers are correct and one search always halts.
3. In Mathlib's terms: truth is REPred through (a), falsity is REPred through (b), and ComputablePred.computable_iff_re_compl_re' gives the total computable decider.

**Acceptance.**

- aeDecide (∀x∃y (y = x)) = true.
- aeDecide (∀x∃y (y² = x)) = false.

**Prerequisites.** `FO5/ae-tree`, `FO5/ae-tree-first-step`, `FO1/standard-form`, `FO1/quantifier-classes`, `FreeGroupsAndLimitGroups:FG3/effective-encoding`, `mathlib:Computable`, `FO5/ae-tree-correct`, `FreeGroupsAndLimitGroups:FG7/existential-universal-deciders`, `mathlib:REPred`, `mathlib:ComputablePred.computable_iff_re_compl_re'`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.7, the sentence after Theorem 4, and Theorem 5, p. 21. the effectiveness of the construction of the finite tree implies that the ∀∃-theory of F is decidable
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §4.7, end of the section, p. 40. the same for Γ (Theorem 2)

#### Decidability of the ∀∃-theory of a nonabelian free group

**Theorem.** Node `FO5/ae-decidable`. Planet: *Decidability of the ∀∃-theory*.

Let A be finite with |A| ≥ 2. The set of ∀∃-sentences of L_A (with constants from F(A)) true in F(A) is decidable: the predicate Φ ↦ (F(A) ⊨ Φ) on the Primcodable type of codes of ∀∃-sentences (FG3/effective-encoding) is a ComputablePred, decided by aeDecide with correctness of both answers (FO5/ae-tree-correct). Consequently the set of ∃∀-sentences true in F(A) is decidable.

**Hypotheses.**

- A finite, |A| ≥ 2.

**Construction or proof.**

1. Correctness, totality and computability: FO5/ae-decider (two semi-decision procedures, justified by FO5/ae-tree-correct and FO5/ae-tree-finite, combined by Post's theorem).
2. ∃∀-sentences: Ψ is true iff the ∀∃-sentence equivalent to ¬Ψ is false.

**Acceptance.**

- Decides ∀x∃y (y = x) (true) and ∀x∃y (y² = x) (false).

**Prerequisites.** `FO5/ae-decider`, `FO5/ae-tree-correct`, `FO5/ae-tree-finite`, `mathlib:ComputablePred`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §3.7, Theorem 5, p. 21. the ∀∃-theory of a free group is decidable (cited as KM06)
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §1, Theorem 2, p. 1, proved in §4. the ∀∃-theory of a torsion-free hyperbolic group is decidable; Γ = F is the free case
- [Olga Kharlampovich, Alexei Myasnikov, Tarski's problem about the elementary theory of free groups has a positive solution](https://www.ams.org/journals/era/1998-04-14/S1079-6762-98-00047-X/S1079-6762-98-00047-X.pdf), Theorem 2 and the discussion of ∀∃-sentences, pp. 101–103. the announcement, with Sacerdote's earlier result on ∀∃-sentences

#### Sacerdote's theorem: nonabelian free groups have the same ∀∃-theory

**Theorem.** Node `FO5/ae-rank-independence`. Planet: *Sacerdote's theorem*.

A coefficient-free ∀∃-sentence of the language of groups holds in one nonabelian free group of finite rank iff it holds in every one; hence all nonabelian free groups of finite rank satisfy the same Boolean combinations of coefficient-free ∀∃-sentences. In this roadmap's route it follows from the construction of the ∀∃-tree: for a coefficient-free sentence every object built along T_EA(Φ) (canonical Makanin–Razborov diagrams, fundamental sequences, correcting extensions, formula solutions) is coefficient-free and the same for F_k and F_ℓ, k, ℓ ≥ 2, up to replacing each terminal factor L by L ∗ F_{ℓ−k}.

**Hypotheses.**

- Coefficient-free sentences only (with constants the statement compares F(A) with F(A ⊔ B), FO7/elementary-embedding).

**Construction or proof.**

1. For a coefficient-free Φ, work with the coefficient-free general standard form (FO1/standard-form (1)) and keep every construction coefficient-free: the merged form (2) introduces the constants a, b and is not used, and a coefficient-free replacement for the merging of equations and inequations is part of the recorded gap 'rank independence in KM's route'. The first step then solves coefficient-free systems over F_k ∗ F(X) with X as constants; solvability does not depend on k ≥ 2, because F_k ∗ F(X) and F_ℓ ∗ F(X) embed in each other over F(X) and existential formulas with constants from F(X) go up along embeddings.
2. Each later construction (canonical embedding tree, correcting extensions, parametrization) for a coefficient-free system over F_ℓ is obtained from that over F_k by replacing terminal factors L by L ∗ F_{ℓ−k} (SELA-VI p. 5).
3. So the trees for F_k and F_ℓ close or fail at the same vertices, and by FO5/ae-tree-correct Φ has the same truth value.

**Acceptance.**

- The universal sentence ∀x∀y ([x, y] = 1) fails in every nonabelian free group.
- Coefficient-free ∀∃-sentences true in F₂: ∀x∃y (y ≠ 1 ∧ [x, y] = 1) — also true in F₅.

**Alternative route and remarks.** Sacerdote's original proof (small cancellation) is not read here; the planned proof is the rank-independence of the tree.

**Prerequisites.** `FO5/ae-tree`, `FO5/ae-tree-correct`, `FreeGroupsAndLimitGroups:FG10/effective-makanin-razborov`, `FreeGroupsAndLimitGroups:FG7/merzljakov-theorem`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Tarski's problem about the elementary theory of free groups has a positive solution](https://www.ams.org/journals/era/1998-04-14/S1079-6762-98-00047-X/S1079-6762-98-00047-X.pdf), p. 103 of the announcement. Sacerdote proved that all nonabelian free groups of finite rank have the same ∀∃-theory (G. Sacerdote, Elementary properties of free groups, Trans. Amer. Math. Soc. 178 (1973), 127–138), using Merzljakov's ideas and small cancellation
- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), proof of Theorem 3, pp. 4–5, and the remark on p. 7. the equivalence of the AE theories was known (Sacerdote; Hrushovski), and also follows by running the coefficient-free tree of stratified sets, which does not depend on the rank
- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), proof of Theorem 4, pp. 5–6. for systems over F_k viewed over F_ℓ the canonical diagrams are obtained by replacing each limit group L by L ∗ F_{ℓ−k}

#### The bound on algebraic solutions is computable

**Theorem.** Node `FO5/effective-bound`.

In FO4/algebraic-solution-bound the constant N(K, H) can be computed from finite presentations of K and generators of H. If K has no splitting modulo H (rigid case), N = m − 1 for the least m such that the existential sentence ∃P ∃Y₁…Y_m (⋀ S(P, Y_i) = 1 ∧ ⋀_{i≠j} Y_i ≠ Y_j ∧ ⋀_{t,i} r_t(P, Y_i) ≠ 1) (the r_t the equations of a complete reducing system) is false in F; if K has a splitting modulo H that is not sufficient (solid case), the same search with the ∃∀-sentence expressing 'some homomorphism H → F has m algebraic pairwise non-∼_MAX-equivalent extensions' (FO4/max-class-count-definable).

**Hypotheses.**

- K, H as in FO4/algebraic-solution-bound, given by finite presentations and generators.

**Construction or proof.**

1. By FO4/algebraic-solution-bound some m makes the sentence false; enumerate m = 1, 2, … and decide each sentence (FG7 existential decider in the rigid case, FO5/ae-decidable for the ∃∀-sentence in the solid case); the first false m gives N = m − 1.
2. The sentences are computed from the presentations and the complete reducing system (FO4/reducing-quotients-effective, FO4/max-class-count-definable).

**Acceptance.**

- N(H, H) = 1: for m = 2 the sentence asks for two distinct extensions of an identity, which is false.

**Prerequisites.** `FO4/algebraic-solution-bound`, `FO4/max-class-count-definable`, `FO4/reducing-quotients-effective`, `FO5/ae-decidable`, `FreeGroupsAndLimitGroups:FG7/existential-universal-deciders`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §4.2, Theorem 7 ('Moreover … the constant N … can be found effectively') and its proof, p. 25. the rigid case through the existential theory and the solid case through an ∃∀-sentence, the least false m giving N = m − 1
- [Olga Kharlampovich, Alexei Myasnikov, On Tarski's decidability problem: response to Sela's report](https://arxiv.org/abs/1402.0482), item (5), p. 2. the authors note that the effectiveness was only sketched in KM06 and is explained in QE-FREE; the algorithm for the bound is not used in proving the decidability of the ∀∃-theory, so there is no circularity
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §5, Theorem 7, p. 44. the same over Γ

### Dependencies

Within this roadmap: FO1, FO2, FO3, FO4. Other roadmaps: `FreeGroupsAndLimitGroups:FG3`, `FreeGroupsAndLimitGroups:FG5`, `FreeGroupsAndLimitGroups:FG7`, `FreeGroupsAndLimitGroups:FG8`, `FreeGroupsAndLimitGroups:FG10`, `FreeGroupsAndLimitGroups:FG11`.

### Acceptance tests

The layer is accepted when every node above is stated with its hypotheses, every definition passes its unit tests, and the acceptance items of its theorems hold. Coverage: planned; remaining: FO5/ae-rank-independence follows SELA-VI pp. 3–7; the rank-independence of KM's own constructions is not stated in the readable KM texts, and the merging of equations and inequations in the standard form introduces constants that a coefficient-free run must avoid (gap 'rank independence in KM's route')..

## Layer FO6: The outer quantifier-elimination procedure and its termination

The procedure that lowers quantifier complexity of an arbitrary sentence using FO1–FO5; the well-founded measure proving its termination; correctness of positive and negative answers. Planned targets: the parametric ∀∃-tree of an ∃∀∃-formula, the sets True(Θ)_m and their ∃∀-descriptions at level 1, level 2 and all levels, the elimination of ∃∀∃-formulas, the block-count measure, the outer procedure with its termination and correctness: effective ∀∃-quantifier elimination over F(A).

Planets: Parametric ∀∃-tree; Configurations at level two; Elimination of ∃∀∃-formulas; Outer quantifier-elimination procedure; ∀∃-quantifier elimination over free groups.

#### The parametric ∀∃-tree T_X(Θ) of an ∃∀∃-formula

**Construction.** Node `FO6/parametric-tree`. Planet: *Parametric ∀∃-tree*.
Proposed namespace `FreeGroup.FirstOrder`, module `TauCeti/GroupTheory/FreeGroup/FirstOrder/QuantifierElimination`.

Let Θ(P) = ∃Z∀X∃Y ⋁_i (U_i(A, P, Z, X, Y) = 1 ∧ V_i(A, P, Z, X, Y) ≠ 1) be an L_A-formula with parameters P (QE-FREE writes the case of one disjunct, the negation of the ∀∃∀ form of KM06). For every P̄, Z̄ at which ∀X∃Y(…) holds there is a free lift Y = f(A, P̄, Z̄, X) in F(X) ∗ F (FO1/free-lifting-theorem); all such formula solutions for all values of the parameters lie in finitely many fundamental sequences whose terminal groups are F_{R(U_{1,i})} ∗ F(X), U_{1,i} = U_{1,i}(A, P, Z, Z⁽¹⁾), with F_{R(U_{1,i})} without sufficient splitting modulo ⟨A, P, Z⟩ (FO2/fundamental-sequences-modulo). For each, the values (P, Z) admitting X with V(P, Z, X, f) = 1 for all such f form an equation over F_{R(U_{1,i})} ∗ F(X), equivalent to finitely many (one, with constants) equations, with coordinate group G and fully residually free quotients G_i. T_X(Θ) is built like T_EA (FO5/ae-tree) with X, Y as variables and P, Z, Z⁽¹⁾ as parameters: fundamental sequences of the G_i modulo ⟨P, Z, Z⁽¹⁾⟩ with terminal groups F_{R(V_{2,i})} (no sufficient splitting modulo ⟨P, Z, Z⁽¹⁾⟩), formula solutions of U = 1 in their correcting extensions (FO2/parametrization-theorem), described by fundamental sequences with terminal groups F_{R(U_{2,i})}, and so on. Each branch carries F_{R(U_{1,i})}, F_{R(V_{2,i})}, …, F_{R(V_{r,i})}, F_{R(U_{r,i})}; F_{R(U_{m,i})} has no sufficient splitting modulo ⟨P, Z, Z⁽¹⁾, Z₁⁽ᵐ⁾⟩ and F_{R(V_{m,i})} none modulo ⟨P, Z, Z⁽¹⁾⟩. The tree is finite and can be constructed effectively, together with a fundamental sequence at each vertex describing Y (at the groups F_{R(U_{j,i})}) or X (at the groups F_{R(V_{j,i})}).

**API.**

- `FreeGroup.FirstOrder.ParamTree` (data): The parametric tree T_X(Θ) with the groups F_{R(U_{m,i})}, F_{R(V_{m,i})} along its branches.
- `FreeGroup.FirstOrder.ParamTree.finite` (structure): T_X(Θ) is finite.
- `FreeGroup.FirstOrder.ParamTree.computable` (other): The tree, its groups and its fundamental sequences are computable from Θ (QE-FREE Proposition 4).
- `FreeGroup.FirstOrder.ParamTree.noSufficientSplitting` (projection): F_{R(U_{m,i})} has no sufficient splitting modulo ⟨P, Z, Z⁽¹⁾, Z₁⁽ᵐ⁾⟩ and F_{R(V_{m,i})} none modulo ⟨P, Z, Z⁽¹⁾⟩.
- `FreeGroup.FirstOrder.ParamTree.unparametrized` (compatibility): For P and Z empty, ParamTree Θ coincides with AETree of ∀X∃Y(…).
- `FreeGroup.FirstOrder.ParamTree.depth` (data): The maximal depth r of the tree, which bounds the levels m of FO6/true-sets.

**Uses.**

- FO6/true-sets: true-subtrees of T_X(Θ) prove ∀X∃Y(…) at given P̄, Z̄
- FO3/configuration-group: the data U₁ = U_{1,k}, V_{2,s}, U_{2,m}, V_{3,s} of configurations are read off T_X(Θ)

**Unit tests.**

- `ParamTree.unparametrized` (compatibility): For Θ with P and Z empty (a ∀∃-sentence), ParamTree Θ = AETree (∀X∃Y(U = 1 ∧ V ≠ 1)).
- `ParamTree.trivial` (degenerate): For Θ(P) = ∃Z∀X∃Y (y = x ∧ a ≠ 1), the first level proves the inner sentence for all P̄, Z̄; the tree has one level with U_{1} the empty system, and True(Θ) = F^P.
- `ParamTree.nonzero` (computation): For Θ(p) = ∀x∃y (y = p ∧ p ≠ 1) with one parameter p (Z empty), the formula solution y = p works exactly when p ≠ 1; the remaining set is the parameter equation p = 1, and True(Θ) = True(Θ)₁ = {p ≠ 1}.
- `ParamTree.not_single_level` (non-example): In general the tree has depth > 1: for Θ(p) = ∀x∃y ([x, y] ≠ 1 ∨ p = 1) the first formula solution y = a fails on [x, a] = 1, and a second level (y = b) is needed before the remaining set x = 1 is reached, where Θ holds iff p = 1.

**Construction or proof.**

1. Top: the formula solutions of U = 1 ∧ V ≠ 1 for all parameter values lie in finitely many fundamental sequences modulo ⟨A, P, Z⟩ (FO1/free-lifting-theorem with FO2/fundamental-sequences-modulo).
2. The remaining X: the condition V(P, Z, X, f) = 1 for every f of the sequence is a system over F_{R(U_{1,i})} ∗ F(X), equivalent to a finite subsystem by equational Noetherianity (FG5).
3. The formula solutions of U = 1 over the correcting extensions of the NTQ groups at level m ≥ 2 are all of them, not one: QE-FREE p. 27 describes the set of all formula solutions Y by finitely many fundamental sequences. That set is the solution set of an equation over a finitely generated fully residually free group, and its description is a complete Hom-diagram over that group (FG10/equations-over-limit-groups), which rests on a recorded gap of FreeGroupsAndLimitGroups (gap 'all formula solutions over NTQ groups').
4. Continue as in FO5/ae-tree with the parameter subgroups; finiteness by the argument of FO5/ae-tree-finite; the algorithm uses FO4/reducing-quotients-effective and fundamental sequences modulo subgroups (QE-FREE Proposition 4).

**Acceptance.**

- With P and Z empty, T_X(Θ) is T_EA of the ∀∃-sentence ∀X∃Y(…).
- If ∀X∃Y(U = 1 ∧ V ≠ 1) is never true, the tree has no branch.

**Alternative route and remarks.** Unlike the ∀∃-tree, which needs one formula solution per vertex and finds it by search, the parametric tree needs the complete description of all formula solutions over NTQ groups; this is the one place where the roadmap uses FG10/equations-over-limit-groups.

**Prerequisites.** `FO5/ae-tree`, `FO5/ae-tree-finite`, `FO2/fundamental-sequences-modulo`, `FO2/parametrization-theorem`, `FO1/free-lifting-theorem`, `FO4/reducing-quotients-effective`, `FreeGroupsAndLimitGroups:FG5/linear-equationally-noetherian`, `FreeGroupsAndLimitGroups:FG10/equations-over-limit-groups`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §5, formula (7) and pp. 26–27; §5.1, Proposition 4, p. 28. the parametric ∃∀-tree T_X(Θ) with the groups U_{m,i}, V_{m,i}, their non-sufficient-splitting properties, its finiteness 'exactly the same way' as for the ∃∀-tree, and the algorithm constructing tree, groups and fundamental sequences
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §6.1, Proposition 17, p. 47. the same over Γ
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), §12.2 (as cited in QE-FREE §5). the original tree T_{X_k} with parameters

#### The sets True(Θ)_m: parameters verified at level m

**Definition.** Node `FO6/true-sets`.
Proposed namespace `FreeGroup.FirstOrder`, module `TauCeti/GroupTheory/FreeGroup/FirstOrder/QuantifierElimination`.

For Θ(P) and its parametric tree T_X(Θ) (FO6/parametric-tree), a proof that ∀X∃Y(U(P̄, Z̄, X, Y) = 1 ∧ V ≠ 1) holds is a true-subtree of T_X(Θ): a finite sequence of formula solutions Y in correcting extensions of the block-NTQ groups at its vertices, verifying the sentence at every X̄; there are finitely many possible true-subtrees, and the sentence for (P̄, Z̄) is proved at level m when the maximal depth of a true-subtree for it is m. True(Θ)_m is the set of P̄ for which some Z̄ has its sentence proved at level m: there are solutions of some U_{m,j} = 1 but no remaining X at level m, i.e. no solution of V_{m+1,j} = 1. True(Θ) = {P̄ | F ⊨ Θ(P̄)} = ⋃_{m ≤ depth} True(Θ)_m.

**API.**

- `FreeGroup.FirstOrder.TrueSubtree` (data): A true-subtree of T_X(Θ) for given (P̄, Z̄).
- `FreeGroup.FirstOrder.trueAtLevel` (data): True(Θ)_m ⊆ F^P.
- `FreeGroup.FirstOrder.trueSet_eq_iUnion` (characterisation): {P̄ | F ⊨ Θ(P̄)} = ⋃_{m ≤ depth} True(Θ)_m.
- `FreeGroup.FirstOrder.TrueSubtree.finite` (structure): There are finitely many true-subtrees.
- `FreeGroup.FirstOrder.trueAtLevel_eq_empty` (example): True(Θ)_m = ∅ for m greater than the depth of T_X(Θ).

**Uses.**

- FO6/true-level-one: True(Θ)_1 is an ∃∀-set
- FO6/true-level-two: True(Θ)_2 is a Boolean combination of ∃∀-sets
- FO6/eae-elimination: the elimination of Θ is the union over m

**Unit tests.**

- `trueSet_eq_iUnion_example` (characterisation): For Θ(p) = ∀x∃y (y = p ∧ p ≠ 1), True(Θ)₁ = {p ≠ 1} and True(Θ)_m = ∅ for m ≥ 2.
- `trueAtLevel.trivial` (degenerate): For Θ that holds at every P̄ by a first-level formula solution, True(Θ)_1 = F^P.
- `trueAtLevel.disjoint_not_required` (non-example): The sets True(Θ)_m need not be disjoint (a tuple may have true-subtrees of several depths; the level is the maximal depth of one chosen subtree), so True(Θ) is their union, not a disjoint union; the elimination only uses the union.
- `trueAtLevel.sentence` (compatibility): For P empty, True(Θ) is {()} or ∅ according to whether the ∃∀∃-sentence Θ holds, and agrees with FO5/ae-decidable when Z is also empty.

**Construction or proof.**

1. Define true-subtrees as subtrees of the finite tree T_X(Θ) with formula-solution data; there are finitely many.
2. Define True(Θ)_m as the projection to P of the tuples (P̄, Z̄, Z̄⁽¹⁾, …) admitting a true-subtree of depth exactly m.
3. True(Θ) is their finite union because the tree has bounded depth.

**Acceptance.**

- True(Θ)_1 for Θ proved on the first level is the set of P̄ with an algebraic Z⁽¹⁾ on some U_{1,i} and no V_{2,j}-solution.
- If T_X(Θ) has depth 1, True(Θ) = True(Θ)_1.

**Prerequisites.** `FO6/parametric-tree`, `FO1/equivalence-over`, `FreeGroupsAndLimitGroups:FG5/algebraic-set-radical`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §5.2, the paragraph before Definition 5 and Definition 5, pp. 28–29. true-subtrees, proof at level m, the finiteness of the number of true-subtrees, and True(Θ)_i
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §6.2, p. 48. the same over Γ

#### True(Θ)₁ is an ∃∀-set, effectively

**Theorem.** Node `FO6/true-level-one`.

True(Θ)₁ is defined by an ∃∀-formula in P, written effectively from T_X(Θ): there exist an index i and Z, Z⁽¹⁾ with U_{1,i}(P, Z, Z⁽¹⁾) = 1 and Z⁽¹⁾ algebraic (FO4/algebraic-solution), such that for every index j there is no Z₁⁽²⁾ with V_{2,j}(P, Z, Z⁽¹⁾, Z₁⁽²⁾) = 1.

**Hypotheses.**

- Θ an ∃∀∃-formula with T_X(Θ) and complete reducing systems computed.

**Construction or proof.**

1. Write algebraicity of Z⁽¹⁾ by the universal part of the formulas of FO4/max-class-count-definable (no fractional Dehn twist makes it reducing).
2. The absence of solutions of the finitely many V_{2,j} is universal; the existence of Z, Z⁽¹⁾ is existential: the conjunction is ∃∀.

**Acceptance.**

- For Θ(p) = ∀x∃y (y = p ∧ p ≠ 1) (FO6/parametric-tree), True(Θ)₁ is defined by the ∃∀-formula ¬(p = 1).

**Prerequisites.** `FO6/true-sets`, `FO4/max-class-count-definable`, `FO4/algebraic-solution`, `FO1/quantifier-classes`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §5.2, Lemma 3, p. 29. True(Θ)₁ is an ∃∀-set and the formula is written algorithmically
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §6.2, p. 48. the same over Γ

#### True(Θ)₂ is a Boolean combination of ∃∀-sets, effectively

**Theorem.** Node `FO6/true-level-two`. Planet: *Configurations at level two*.

True(Θ)₂ is defined by a Boolean combination of ∃∀-formulas in P that can be computed from Θ. Proof plan: for each of the finitely many initial fundamental sequences of level 2 and width i (FO3/configuration-finiteness), P̄ is in True(Θ)₂ through that sequence at depth 1 iff (a) there are algebraic solutions of a system U_{i,coeff} = 1 attached to the terminal group of a fundamental sequence of a configuration group modulo P, (b) these do not factor through the finitely many fundamental sequences of Red₁,…,Red_k, F_{R(V_{3,m_s})}, R_{Q1},…,R_{Qm}, H_surplus, and (c) they do not factor through the terminal groups of the deeper sequences of level 2; each condition is a Boolean combination of conjunctive ∃∀-formulas. Deeper sequences (depth 2, 3, …) are constructed with tight enveloping fundamental sequences (FO3/tight-enveloping); their complexity does not increase from depth n to n + 1 and cannot stay equal for more than a computable number of steps (FO3/tight-envelope-reorganization and the computable bound of KM06 Lemma 28), so the construction stops.

**Hypotheses.**

- Θ an ∃∀∃-formula; all data computed by FO6/parametric-tree.

**Construction or proof.**

1. For each initial fundamental sequence f of level 2 and width i (finitely many, computable: FO3/configuration-finiteness), write (a)–(c) at depth 1 using algebraicity and MAX-class counts (FO4/max-class-count-definable) and the computable bound (FO5/effective-bound).
2. If the depth-1 criterion fails because certificates extend through H_surplus, build the depth-2 sequences from tight enveloping sequences (FO3/tight-enveloping) and repeat.
3. Termination: the complexity of the depth-(n + 1) sequence is at most that of depth n and equality persists for a bounded, computable number of steps (FO3/tight-envelope-reorganization); the bound is effective by QE-FREE Proposition 7(2).
4. True(Θ)₂ is the union over sequences and depths of the resulting Boolean combinations.

**Acceptance.**

- If T_X(Θ) has depth 1, True(Θ)₂ = ∅.

**Alternative route and remarks.** The termination of the depth construction is given in the readable sources as a sketch (QE-FREE §5.4); see gap 'level-2 termination'. Sela's route replaces it by the termination of the sieve procedure (Diophantine geometry V₂).

**Prerequisites.** `FO6/true-level-one`, `FO3/configuration-group`, `FO3/configuration-finiteness`, `FO3/tight-enveloping`, `FO3/tight-envelope-reorganization`, `FO4/max-class-count-definable`, `FO5/effective-bound`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §5.2, Theorem 8 and conditions (a)–(c), pp. 29–33; §5.4, pp. 35–37. the statement of Theorem 8, the depth-1 criterion as a Boolean combination of ∃∀-formulas, deeper fundamental sequences, and the termination sketch through tight enveloping NTQ groups (bound of KM06 Lemma 28 computable by Proposition 7(2))
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §6.2–6.3, pp. 48–55. the same over Γ
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), §§11–12 (as cited in QE-FREE §5.4). the full termination argument; SELA-REPORT items (26)–(56) contest it and KM-RESPONSE answers them

#### True(Θ)_m is a Boolean combination of ∃∀-sets for every level m

**Theorem.** Node `FO6/true-all-levels`.

For every m up to the depth of T_X(Θ), True(Θ)_m is defined by a Boolean combination of ∃∀-formulas in P computable from Θ. The case m = 1 is FO6/true-level-one and m = 2 is FO6/true-level-two; for m ≥ 3 the configuration groups use certificates of level m (algebraic solutions of U_{1}, V_{2}, U_{2}, …, V_{m}, U_{m} with widths at each level) and the same depth construction with tight envelopes.

**Hypotheses.**

- Θ an ∃∀∃-formula.

**Construction or proof.**

1. Extend Definition 6 to level m: certificates list algebraic solutions level by level with widths bounded by FO4/algebraic-solution-bound at each level.
2. Repeat the analysis of FO6/true-level-two level by level; the induction is on m, the configuration groups of level m being built over those of level m − 1.

**Acceptance.**

- For a tree of depth 2 there is nothing beyond FO6/true-level-two.

**Alternative route and remarks.** The sources state the general level as 'similar' to level 2; the general-level construction is a recorded gap.

**Prerequisites.** `FO6/true-level-two`, `FO6/true-level-one`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §5.4, last paragraph, p. 37. fundamental sequences of all levels m are considered similarly, which makes every step of the elimination algorithmic
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §6, p. 55. the same remark over Γ

#### Elimination of an ∃∀∃-block to a Boolean combination of ∃∀-formulas

**Theorem.** Node `FO6/eae-elimination`. Planet: *Elimination of ∃∀∃-formulas*.

There is a computable map elimEAE on (codes of) L_A-formulas Θ(P) = ∃Z∀X∃Y ⋁_i(U_i = 1 ∧ V_i ≠ 1) with parameters P such that elimEAE Θ is a Boolean combination of ∃∀-formulas (equivalently of ∀∃-formulas, FO1/quantifier-classes) in P and Θ ∼_{F(A)} elimEAE Θ (FO1/equivalence-over). Namely elimEAE Θ is the disjunction over m ≤ depth T_X(Θ) of the Boolean combinations of FO6/true-all-levels.

**Hypotheses.**

- F = F(A), |A| ≥ 2; Θ in the stated form.

**Construction or proof.**

1. Compute T_X(Θ) and its depth r (FO6/parametric-tree).
2. For each m ≤ r compute the Boolean combination β_m defining True(Θ)_m (FO6/true-all-levels).
3. Return β₁ ∨ ⋯ ∨ β_r; correctness is FO6/true-sets (trueSet_eq_iUnion).

**Acceptance.**

- For Θ without parameters this decides the ∃∀∃-sentence Θ (with FO5/ae-decidable on the result).

**Prerequisites.** `FO6/true-all-levels`, `FO6/true-sets`, `FO6/parametric-tree`, `FO1/equivalence-over`, `FO1/quantifier-classes`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §5, p. 26 ('it is enough to give an algorithm to find such a Boolean combination that defines the set defined by Θ(P)'), Proposition 4 and Theorem 8, pp. 28–29. the reduction of the whole elimination to formulas Θ(P) and the level-by-level description of True(Θ)
- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), Theorem 1 and its proof, p. 2. the analysis of EAE sets ([Se6], Theorem 1.41) shows every EAE set is in the Boolean algebra of AE sets
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §6, p. 46. the same reduction over Γ

#### The termination measure: number of alternating quantifier blocks

**Definition.** Node `FO6/qe-measure`.
Proposed namespace `FreeGroup.FirstOrder`, module `TauCeti/GroupTheory/FreeGroup/FirstOrder/QuantifierElimination`.

For an L_A-formula φ, blocks(φ) is the number k of ∀∃-pairs in its standard form ∀X₁∃Y₁…∀X_k∃Y_k ψ (FO1/standard-form), ψ quantifier-free; formulas with blocks(φ) ≤ 1 are ∀∃-formulas. blocks takes values in ℕ, ordered by <.

**API.**

- `FreeGroup.FirstOrder.blocks` (data): The number of ∀∃-pairs in the standard form.
- `FreeGroup.FirstOrder.blocks_le_one_iff` (characterisation): blocks φ ≤ 1 iff the standard form of φ is a ∀∃-formula.
- `FreeGroup.FirstOrder.blocks_all_ex` (simp): blocks (∀X∃Y ψ) = blocks ψ + 1 for ψ in standard form.
- `FreeGroup.FirstOrder.blocks_isQF` (simp): blocks φ = 0 for φ quantifier-free.
- `FreeGroup.FirstOrder.blocks_wellFounded` (structure): The relation blocks φ < blocks ψ is well-founded (pulled back from ℕ).

**Uses.**

- FO6/qe-procedure-terminates: each round of the outer procedure lowers blocks by one

**Unit tests.**

- `blocks.qf` (degenerate): blocks (x = y) = 0 and blocks ⊥ = 0.
- `blocks.two` (computation): blocks (∀x∃y∀z∃w (x y z w = 1)) = 2.
- `blocks.existential` (computation): blocks (∃y (y² = a)) = 1 (an empty universal block is inserted).
- `blocks.not_quantifier_count` (non-example): blocks is not the number of quantifiers: ∀x₁∀x₂∃y₁∃y₂ θ has four quantifiers and blocks = 1, which is why the measure decreases by one per elimination round.

**Construction or proof.**

1. Define blocks as the k of stdForm φ; a quantifier-free formula has blocks 0.
2. Prove blocks (∀X∃Y ψ) = blocks ψ + 1 when ψ is in standard form, and that every Boolean combination of ∀∃-formulas has blocks at most 2 (renaming bound variables apart, it prenexes to an ∃∀∃-formula, whose standard form is ∀∅∃Z∀X∃Y θ).

**Acceptance.**

- blocks (x = y) = 0.
- blocks (∀x∃y∀z∃w θ) = 2.

**Prerequisites.** `FO1/standard-form`, `FO1/quantifier-classes`

**Sources.**

- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), proof of Theorem 1, p. 2. the elimination for formulas with more than three quantifier blocks follows by a standard induction on the number of quantifiers
- [Olga Kharlampovich, Alexei Myasnikov, Implicit function theorem over free groups](https://arxiv.org/abs/math/0312509), §2.3, p. 5. the alternating form with k blocks used to count them

#### The outer quantifier-elimination procedure

**Construction.** Node `FO6/qe-procedure`. Planet: *Outer quantifier-elimination procedure*.
Proposed namespace `FreeGroup.FirstOrder`, module `TauCeti/GroupTheory/FreeGroup/FirstOrder/QuantifierElimination`.

qeAE is defined by recursion on blocks (FO6/qe-measure). Given φ(P), compute stdForm φ = ∀X₁∃Y₁ ψ(P, X₁, Y₁) with blocks ψ = blocks φ − 1. If blocks φ ≤ 1 return φ (a ∀∃-formula). Otherwise let β(P, X₁, Y₁) := qeAE ψ, a Boolean combination of ∀∃-formulas. Then ∃Y₁ β: put β in disjunctive normal form over ∀∃- and ∃∀-formulas (negated ∀∃-formulas, FO1/quantifier-classes); ∃Y₁ distributes over ∨, and each ∃Y₁(α₁ ∧ ⋯ ∧ ε₁ ∧ ⋯) with α_j ∀∃ and ε_j ∃∀ is, after renaming bound variables apart (FG3/syntax-operations-computable), an ∃∀∃-formula in (P, X₁); apply elimEAE (FO6/eae-elimination) to get a Boolean combination γ(P, X₁) of ∃∀-formulas. Finally ∀X₁ γ = ¬∃X₁ ¬γ: rewrite ¬γ in disjunctive normal form, eliminate ∃X₁ the same way, and negate. The result is a Boolean combination of ∀∃-formulas in P.

**API.**

- `FreeGroup.FirstOrder.qeAE` (data): The outer procedure on codes of L_A-formulas.
- `FreeGroup.FirstOrder.qeAE_of_isForallExists` (simp): qeAE φ = φ when φ is a ∀∃-formula in standard form.
- `FreeGroup.FirstOrder.qeAE_step` (relation): qeAE (∀X₁∃Y₁ ψ) is computed from qeAE ψ by two calls of elimEAE and Boolean operations.
- `FreeGroup.FirstOrder.qeAE_freeVars` (projection): qeAE φ has the same parameters P as φ.
- `FreeGroup.FirstOrder.qeAECoeffFree` (data): The coefficient-free run of the procedure on coefficient-free formulas: the general standard form of FO1/standard-form (1), no constants introduced, and every diagram, correcting extension, induced and tight enveloping system and configuration built for coefficient-free systems; FO7/uniform-qe states that it returns a coefficient-free Boolean combination of ∀∃-formulas equivalent to φ over every F_k, k ≥ 2. qeAE itself, run over F(A) with the merged standard form, may introduce the constants a, b, so qeAE φ need not be coefficient-free when φ is.

**Uses.**

- FO6/qe-procedure-correct: correctness and computability
- FO7/decision-procedure: the decision procedure decides the sentences returned by qeAE

**Unit tests.**

- `qeAE.forallExists` (degenerate): For φ = ∀x∃y (y = x ∧ a ≠ 1), qeAE φ = φ.
- `qeAE.qf` (degenerate): For φ quantifier-free, qeAE φ = φ.
- `qeAE.three_blocks_example` (computation): For φ(p) = ∀x∃y∀z∃w ([x, p] = 1 → (y = x ∧ (w = z ∧ a ≠ 1))), qeAE φ is computed with one recursive call on ψ = ∀z∃w(…) (already ∀∃) and two calls of elimEAE, and defines F^P (φ is true for all p).
- `qeAE.not_prenex_merge` (non-example): Merging ∃Y₁(α ∧ ε) into one ∃∀∃-formula without renaming the bound variables of α and ε apart changes its meaning; the renaming is part of the procedure.

**Construction or proof.**

1. Recursion on blocks φ; the recursive call is on ψ with blocks ψ = blocks φ − 1.
2. Disjunctive normal form over the atoms 'α ∀∃' and 'ε ∃∀' is a primitive recursive syntactic operation; conjunctions of prenex formulas are prenexed by renaming bound variables apart (FG3).
3. Two calls of elimEAE per round (for ∃Y₁ and, after negation, for ∃X₁).

**Acceptance.**

- qeAE φ = φ for every ∀∃-formula.
- For φ = ∀x∃y∀z∃w θ, one round reduces to elimination of ∃∀∃-formulas.

**Prerequisites.** `FO6/eae-elimination`, `FO6/qe-measure`, `FO1/standard-form`, `FO1/quantifier-classes`, `FreeGroupsAndLimitGroups:FG3/syntax-operations-computable`, `FreeGroupsAndLimitGroups:FG3/effective-encoding`

**Sources.**

- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), proof of Theorem 1, p. 2. for formulas with more than three quantifier blocks the elimination follows from the EAE case by a standard induction on the number of quantifiers
- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §5, p. 26, and the closing paragraph of §5.4, p. 37. it is enough to treat Θ(P) = ∃Z∀X∃Y(…); with all levels done, every step of the elimination is algorithmic
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §1, Theorem 1, and §6. the same reduction over Γ

#### Termination of the outer procedure

**Theorem.** Node `FO6/qe-procedure-terminates`.

qeAE halts on every L_A-formula: each recursive call is on a formula with blocks one less (FO6/qe-measure), and each round makes finitely many calls of elimEAE, which is total (FO6/eae-elimination). The number of calls of elimEAE is at most 2 · blocks(φ) times the number of disjuncts produced, a computable bound.

**Hypotheses.**

- F = F(A), |A| ≥ 2.

**Construction or proof.**

1. Well-founded recursion on blocks (FO6/qe-measure).
2. Each round: finitely many disjuncts of a disjunctive normal form, each handled by one total call of elimEAE.

**Acceptance.**

- For a ∀∃-formula the procedure returns at once.

**Prerequisites.** `FO6/qe-procedure`, `FO6/qe-measure`, `FO6/eae-elimination`

**Sources.**

- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), proof of Theorem 1, p. 2. the induction on the number of quantifiers
- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §5.4, p. 37. every step of the elimination is algorithmic

#### Effective ∀∃-quantifier elimination over a nonabelian free group

**Theorem.** Node `FO6/qe-procedure-correct`. Planet: *∀∃-quantifier elimination over free groups*.

For A finite with |A| ≥ 2: for every L_A-formula φ(P), qeAE φ is a Boolean combination of ∀∃-formulas with the same parameters (IsBoolCombAE) and qeAE φ ∼_{F(A)} φ; and qeAE is computable on the codes of FG3/effective-encoding. Hence F(A) has effective ∀∃-quantifier elimination (FO1/qe-target): every definable subset of F(A)^P is a finite Boolean combination of ∀∃-definable sets, computed from the formula.

**Hypotheses.**

- A finite, |A| ≥ 2.

**Construction or proof.**

1. Induction on blocks φ: for ∀∃-formulas immediate; for the step, ∃Y₁ distributes over disjunctions, elimEAE preserves ∼_{F(A)} (FO6/eae-elimination), negation and Boolean operations preserve ∼_{F(A)} (FO1/equivalence-over).
2. Computability: composition of computable maps (FG3 syntax operations, elimEAE) under well-founded recursion with a computable bound (FO6/qe-procedure-terminates).

**Acceptance.**

- qeAE on a ∀∃-formula returns it.
- Every definable subset of F(a, b) in one variable is a Boolean combination of ∀∃-definable sets.

**Alternative route and remarks.** Sela's route (Diophantine geometry V₁–V₂ and VI, Theorem 1) proves the non-effective elimination by the sieve procedure on graded resolutions; it is recorded as the alternative.

**Prerequisites.** `FO6/qe-procedure`, `FO6/qe-procedure-terminates`, `FO6/eae-elimination`, `FO1/qe-target`, `FO1/equivalence-over`, `mathlib:Computable`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §1, Theorem 1, p. 1. the algorithm turning every formula into a Boolean combination of ∃∀-formulas defining the same set over F
- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), Theorem 1, p. 2. the non-effective statement: every definable set over F_k is in the Boolean algebra of AE sets
- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §1, Theorem 1. the hyperbolic generalization, with Γ = F the free case

### Dependencies

Within this roadmap: FO1, FO2, FO3, FO4, FO5. Other roadmaps: `FreeGroupsAndLimitGroups:FG3`, `FreeGroupsAndLimitGroups:FG5`, `FreeGroupsAndLimitGroups:FG10`.

### Acceptance tests

The layer is accepted when every node above is stated with its hypotheses, every definition passes its unit tests, and the acceptance items of its theorems hold. Coverage: planned; remaining: FO6/true-level-two and FO6/true-all-levels: the depth construction and the general level m are given as a sketch and 'similarly' (QE-FREE §5.4); a full argument is a recorded gap ('level-2 termination', 'general levels'). FO6/parametric-tree uses FreeGroupsAndLimitGroups FG10/equations-over-limit-groups (all formula solutions over NTQ groups), which rests on a recorded gap of that roadmap (gap 'all formula solutions over NTQ groups')..

## Layer FO7: Tarski's theorems

The elementary theory of a nonabelian free group of finite rank is decidable; nonabelian free groups of finite rank are elementarily equivalent (Sela; Kharlampovich–Myasnikov); the consequences the sources state, as separate targets with their own hypotheses. Planned targets: the decision procedure and the decidability of Th(F(A)) with constants; uniform coefficient-free elimination; elementary equivalence F_k ≡ F_ℓ (k, ℓ ≥ 2); the elementary embeddings F_k ≤ F_ℓ; extended hyperbolic towers and the classification of finitely generated models; closed surface groups of Euler characteristic ≤ −2; necessary conditions and negative controls (the non-orientable genus-3 surface group, doubles of F₂, groups containing ℤ²).

Planets: Tarski's decidability theorem; Tarski's problem: elementary equivalence; Elementary embeddings F_k ≤ F_ℓ; Hyperbolic towers; Classification of models of the free group theory; Surface groups elementarily equivalent to F₂.

#### The decision procedure for the elementary theory of F(A)

**Construction.** Node `FO7/decision-procedure`.
Proposed namespace `FreeGroup.FirstOrder`, module `TauCeti/GroupTheory/FreeGroup/FirstOrder/Tarski`.

decideTh takes (the FG3 code of) an L_A-sentence σ, computes qeAE σ (FO6/qe-procedure), a Boolean combination of ∀∃-sentences (no parameters), decides each ∀∃-constituent with aeDecide (FO5/ae-decider), and evaluates the Boolean combination. The same procedure applies to coefficient-free sentences (A-free).

**API.**

- `FreeGroup.FirstOrder.decideTh` (data): The decision procedure on codes of L_A-sentences.
- `FreeGroup.FirstOrder.decideTh_spec` (characterisation): decideTh σ = true ↔ FreeGroup A ⊨ σ.
- `FreeGroup.FirstOrder.computable_decideTh` (other): decideTh is computable and total.
- `FreeGroup.FirstOrder.decideTh_aeDecide` (compatibility): On ∀∃-sentences decideTh agrees with aeDecide.
- `FreeGroup.FirstOrder.decideTh_not` (simp): decideTh (∼σ) = !decideTh σ.

**Uses.**

- FO7/elementary-theory-decidable: the witness of decidability

**Unit tests.**

- `decideTh.identity` (computation): decideTh (∀x∃y (y = x)) = true over F(a, b).
- `decideTh.center` (computation): decideTh (∃x∀y (x·y = y·x ∧ x ≠ 1)) = false over F(a, b).
- `decideTh.not` (characterisation): decideTh (∼σ) = !decideTh σ for every sentence σ (completeness of Th(F(A))).
- `decideTh.ae_compat` (compatibility): On the ∀∃-sentence ∀x∃y (y² = x), decideTh and aeDecide both return false.
- `decideTh.alternation3` (non-example): On the ∀∃∀-sentence ∀x∃y∀z ([y, z] = 1 → [x, z] = 1), decideTh calls the elimination before deciding; aeDecide is not defined on it (its input class is ∀∃-sentences), so a decision procedure built from aeDecide alone would not cover the elementary theory.

**Construction or proof.**

1. Compute ψ := qeAE σ; ψ is a Boolean combination of ∀∃-sentences (sentences, because σ has no parameters).
2. Decide each constituent with aeDecide and evaluate the Boolean connectives.

**Acceptance.**

- decideTh (∀x∃y (y = x)) = true.
- decideTh (∃x∀y ([x, y] = 1 ∧ x ≠ 1)) = false (the centre of F is trivial).

**Prerequisites.** `FO6/qe-procedure`, `FO6/qe-procedure-correct`, `FO5/ae-decider`, `FreeGroupsAndLimitGroups:FG3/effective-encoding`, `mathlib:Computable`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §1, Theorems 1–3, p. 1. Theorem 1 (effective elimination to Boolean combinations of ∀∃-formulas) and Theorem 2 (decidability of the ∀∃-theory) imply Theorem 3 (decidability of the elementary theory)
- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §1, p. 1. the elementary theory of a free group is decidable, and the elimination is effective
- [Olga Kharlampovich, Alexei Myasnikov, Tarski's problem about the elementary theory of free groups has a positive solution](https://www.ams.org/journals/era/1998-04-14/S1079-6762-98-00047-X/S1079-6762-98-00047-X.pdf), Theorem 2, p. 101. the announcement of decidability, with constants from F

#### Tarski's decidability theorem for free groups

**Theorem.** Node `FO7/elementary-theory-decidable`. Planet: *Tarski's decidability theorem*.

Let A be finite with |A| ≥ 2. The elementary theory of F(A) with constants from A is decidable: the predicate σ ↦ (FreeGroup A ⊨ σ) on codes of L_A-sentences (FG3/effective-encoding) is a ComputablePred, decided by decideTh (FO7/decision-procedure) with correctness of both answers. In particular the coefficient-free elementary theory of a nonabelian free group of finite rank is decidable.

**Hypotheses.**

- A finite with |A| ≥ 2.

**Construction or proof.**

1. decideTh σ = true iff qeAE σ evaluates to true under aeDecide iff F(A) ⊨ qeAE σ (FO5/ae-decidable) iff F(A) ⊨ σ (FO6/qe-procedure-correct).
2. decideTh is computable (FO7/decision-procedure).

**Acceptance.**

- The theory decides Vaught's sentence (true) and ∃x (x² = a) (false).

**Prerequisites.** `FO7/decision-procedure`, `FO6/qe-procedure-correct`, `FO5/ae-decidable`, `mathlib:ComputablePred`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, Decidability of the elementary theory of a torsion-free hyperbolic group](https://arxiv.org/abs/1303.0760), §1, Theorem 3, p. 1. the elementary theory of a torsion-free hyperbolic group is decidable; the free group is the case Γ = F
- [Olga Kharlampovich, Alexei Myasnikov, Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group](https://arxiv.org/abs/1207.1900), §1, p. 1. the decidability of the elementary theory of a free group, with the effective elimination
- [Olga Kharlampovich, Alexei Myasnikov, Tarski's problem about the elementary theory of free groups has a positive solution](https://www.ams.org/journals/era/1998-04-14/S1079-6762-98-00047-X/S1079-6762-98-00047-X.pdf), Theorem 2, p. 101. the elementary theory of a free group, even with constants, is decidable
- [Olga Kharlampovich, Alexei Myasnikov, Elementary theory of free non-abelian groups](https://doi.org/10.1016/j.jalgebra.2006.03.033), (main theorem, as cited in QE-FREE §1 and HYP §1). the original proof; SELA-REPORT disputes that it contains a proof of decidability, KM-RESPONSE replies, and QE-FREE and HYP give the corrected argument followed here

#### Coefficient-free elimination is uniform in the rank

**Theorem.** Node `FO7/uniform-qe`.

For every coefficient-free formula φ(P) of the language of groups there is a coefficient-free Boolean combination ψ of coefficient-free ∀∃-formulas, computed from φ by the coefficient-free run of the elimination (FO6/qe-procedure with the general standard form of FO1/standard-form (1), no constants introduced, and every diagram, correcting extension, induced and tight enveloping system and configuration built for coefficient-free systems), such that φ ∼_{F_k} ψ for every k ≥ 2: the same Boolean combination defines the set of φ in every nonabelian free group of finite rank. (qeAE run over F(A) with the merged standard form may introduce the constants a, b, so it does not by itself give this statement.)

**Hypotheses.**

- φ coefficient-free; k ≥ 2.

**Construction or proof.**

1. Every object built along the parametric trees for a coefficient-free formula is coefficient-free: Makanin–Razborov diagrams of coefficient-free systems over F_k are obtained from those over F₂ by replacing terminal factors L by L ∗ F_{k−2} (SELA-VI pp. 3–5), and the same holds for correcting extensions, induced and tight enveloping NTQ systems and configurations. The merging of equations and inequations in FO1/standard-form (2) uses the constants a, b; the coefficient-free run keeps finite systems or merges them by a coefficient-free device (part of the gap 'rank independence in KM's route').
2. Hence the coefficient-free run does not depend on k ≥ 2, and its correctness (FO6/qe-procedure-correct, applied to the coefficient-free run) holds over each F_k.

**Acceptance.**

- For φ quantifier-free the coefficient-free run returns φ (as a Boolean combination of its atomic formulas).

**Alternative route and remarks.** KM's route obtains uniformity from the same rank-independence of the effective constructions; the readable texts state it for Sela's procedure (SELA-VI) and, for sentences, through the elementary embedding F_k ≤ F_ℓ (ERA98).

**Prerequisites.** `FO6/qe-procedure-correct`, `FO5/ae-rank-independence`, `FreeGroupsAndLimitGroups:FG10/effective-makanin-razborov`

**Sources.**

- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), Theorem 2 and its proof, pp. 3–4. for a coefficient-free predicate there is a coefficient-free predicate in the Boolean algebra of AE predicates equivalent to it over every F_k, k ≥ 2, because the canonical Makanin–Razborov diagrams, formal solutions, induced and core resolutions of coefficient-free systems do not depend on the rank
- [Zlil Sela, Diophantine geometry over groups and the elementary theory of free and hyperbolic groups](https://arxiv.org/abs/math/0304209), Theorem 2, p. 88. the same statement in the survey

#### Tarski's problem: nonabelian free groups of finite rank are elementarily equivalent

**Theorem.** Node `FO7/elementary-equivalence`. Planet: *Tarski's problem: elementary equivalence*.

For all k, ℓ ≥ 2, FreeGroup (Fin k) ≅[groupLang] FreeGroup (Fin ℓ) in Mathlib's sense (ElementarilyEquivalent): every coefficient-free sentence of the language of groups has the same truth value in F_k and F_ℓ.

**Hypotheses.**

- k, ℓ ≥ 2.

**Construction or proof.**

1. By FO7/uniform-qe, σ ∼_{F_k} ψ and σ ∼_{F_ℓ} ψ for one Boolean combination ψ of coefficient-free ∀∃-sentences.
2. By FO5/ae-rank-independence each ∀∃-constituent of ψ has the same truth value in F_k and F_ℓ; so does ψ, hence σ (Mathlib's elementarilyEquivalent_iff).

**Acceptance.**

- F₂ and F₃ both satisfy Vaught's sentence and the sentence that commutation is transitive on non-trivial elements; 'the group is generated by two elements' is not first-order, so F₂ ≡ F₃ is consistent with F₂ ≇ F₃.

**Prerequisites.** `FO7/uniform-qe`, `FO5/ae-rank-independence`, `FO1/qe-target`, `mathlib:FirstOrder.Language.ElementarilyEquivalent`, `mathlib:FirstOrder.Language.elementarilyEquivalent_iff`, `FreeGroupsAndLimitGroups:FG3/group-language`

**Sources.**

- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), Theorem 3 and its proof, p. 4. every coefficient-free sentence reduces, independently of the rank, to a Boolean combination of AE sentences, and AE sentences have the same truth value in all nonabelian free groups
- [Olga Kharlampovich, Alexei Myasnikov, Tarski's problem about the elementary theory of free groups has a positive solution](https://www.ams.org/journals/era/1998-04-14/S1079-6762-98-00047-X/S1079-6762-98-00047-X.pdf), Theorem 1, p. 101. the elementary theories of all nonabelian free groups coincide
- [Zlil Sela, Diophantine geometry over groups and the elementary theory of free and hyperbolic groups](https://arxiv.org/abs/math/0304209), Theorem 3, p. 88. the same statement

#### The standard embedding F_k → F_ℓ is elementary

**Theorem.** Node `FO7/elementary-embedding`. Planet: *Elementary embeddings F_k ≤ F_ℓ*.

For 2 ≤ k ≤ ℓ the standard embedding FreeGroup (Fin k) → FreeGroup (Fin ℓ) induced by Fin.castLE (FreeGroup.map) is an elementary embedding in Mathlib's sense (ElementaryEmbedding for the language of groups). More generally, for a nonabelian free group F₁ and any free group F₂, F₁ → F₁ ∗ F₂ is elementary; equivalently, for L_A-formulas with constants from A, the free group F(A) is an elementary subgroup of F(A ⊔ B).

**Hypotheses.**

- 2 ≤ k ≤ ℓ (F₁ nonabelian in the general form).

**Construction or proof.**

1. A formula φ(P) with constants a ∈ F_k: by the coefficient analogue of FO7/uniform-qe (the canonical diagrams over F_ℓ obtained from those over F_k by L ↦ L ∗ F_{ℓ−k}, SELA-VI p. 5), qeAE φ computed over F_k also defines φ over F_ℓ.
2. ∀∃-sentences with constants from F_k have the same truth value over F_k and F_ℓ (the ∀∃-tree over F_ℓ is the tree over F_k with terminal factors replaced, SELA-VI p. 7, Sacerdote).
3. Hence for every formula and tuple p̄ in F_k, F_k ⊨ φ(p̄) iff F_ℓ ⊨ φ(p̄): the map is elementary; elementary equivalence follows by Mathlib's ElementaryEmbedding.elementarilyEquivalent.

**Acceptance.**

- The identity F₂ → F₂ is elementary (k = ℓ).
- F₂ → F₃ is elementary; the inclusion ℤ = F₁ → F₂ is not (ℤ is abelian).

**Prerequisites.** `FO7/uniform-qe`, `FO6/qe-procedure-correct`, `FO5/ae-rank-independence`, `mathlib:FirstOrder.Language.ElementaryEmbedding`, `mathlib:FreeGroup.map`, `mathlib:FirstOrder.Language.ElementaryEmbedding.elementarilyEquivalent`

**Sources.**

- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), Theorem 4 and its proof, pp. 5–7. the standard embedding F_k → F_ℓ is elementary, because the canonical (graded, multi-graded) Makanin–Razborov diagrams and the core resolutions over F_ℓ are obtained from those over F_k by replacing limit groups L by L ∗ F_{ℓ−k}, and the remark that the f.g. assumption is not used
- [Olga Kharlampovich, Alexei Myasnikov, Tarski's problem about the elementary theory of free groups has a positive solution](https://www.ams.org/journals/era/1998-04-14/S1079-6762-98-00047-X/S1079-6762-98-00047-X.pdf), p. 101 ('the strongest possible, positive form'). F(a₁,…,a_n) is an elementary subgroup of F(a₁,…,a_{n+p}) for n ≥ 2, p ≥ 0
- [Zlil Sela, Diophantine geometry over groups and the elementary theory of free and hyperbolic groups](https://arxiv.org/abs/math/0304209), Theorem 4, p. 89. the same statement, with F₁ → F₁ ∗ F₂

#### Extended hyperbolic floors and towers

**Definition.** Node `FO7/hyperbolic-tower`. Planet: *Hyperbolic towers*.
Proposed namespace `Group`, module `TauCeti/GroupTheory/HyperbolicTower`.

A graph of groups with surfaces is a graph of groups (FG4/graph-of-groups) in which some vertices are of surface type: their vertex group is the fundamental group of a compact connected surface Σ with boundary, with the incident edge groups being exactly the maximal boundary subgroups (one edge per boundary component), with a Bass–Serre presentation (T¹, T⁰). A triple (G, G′, r) with G′ ≤ G and r : G → G′ a retraction is an extended hyperbolic floor if G has a non-trivial decomposition Γ as a graph of groups with surfaces such that: the surfaces of Γ other than once-punctured tori have Euler characteristic ≤ −2; G′ is the free product of the stabilizers of the non-surface-type vertices of T⁰; every edge joins a surface-type vertex to a non-surface-type vertex; and either r sends every surface-type vertex group to a non-abelian image (a hyperbolic floor), or G′ is cyclic and there is a retraction r′ : G ∗ ℤ → G′ ∗ ℤ sending surface-type vertex groups to non-abelian images. A non-cyclic group G is an extended hyperbolic tower over a subgroup H if there are G = G₀ ≥ G₁ ≥ ⋯ ≥ G_m ≥ H (m ≥ 0) with each (G_k, G_{k+1}, r_k) an extended hyperbolic floor in which H lies in a non-surface-type vertex group, and G_m = H ∗ F ∗ S₁ ∗ ⋯ ∗ S_p with F free (possibly trivial) and each S_i the fundamental group of a closed surface of Euler characteristic ≤ −2.

**API.**

- `Group.ExtendedHyperbolicFloor` (data): The floor condition on (G, G′, r).
- `Group.IsExtendedHyperbolicTower` (data): G is an extended hyperbolic tower over H.
- `Group.IsExtendedHyperbolicTower.base` (constructor): If G = H ∗ F ∗ S₁ ∗ ⋯ ∗ S_p is non-cyclic with closed surfaces S_i of χ ≤ −2, G is a tower over H (m = 0).
- `Group.IsExtendedHyperbolicTower.floor` (constructor): A floor (G, G′, r) on top of a tower G′ over H gives a tower G over H.
- `Group.IsExtendedHyperbolicTower.retract` (projection): A tower over H retracts onto a subgroup containing H at each floor.
- `Group.IsExtendedHyperbolicTower.not_cyclic` (projection): Towers are non-cyclic by definition.

**Uses.**

- FO7/tower-classification: finitely generated models of the theory of free groups are the towers over {1}
- LPS, Theorems 3.8–3.9, p. 9: elementary subgroups of torsion-free hyperbolic groups are the subgroups over which the group is a hyperbolic tower

**Unit tests.**

- `tower.surface_genus2` (computation): The closed orientable surface group of genus 2 (χ = −2) is an extended hyperbolic tower over {1} with m = 0, p = 1, F trivial.
- `tower.free` (degenerate): Every non-cyclic free group F_n (n ≥ 2) is an extended hyperbolic tower over {1} with m = 0, p = 0.
- `not_tower_N3` (non-example): The closed non-orientable surface group of genus 3 (χ = −1) is not an extended hyperbolic tower over {1}: it is not a base (χ > −2), is freely indecomposable and admits no floor structure; Sela's original definition admitted it (KM-RESPONSE item (57a)).
- `not_tower_Z` (non-example): ℤ is not a tower (towers are non-cyclic), and ℤ² is not one either (it contains no surface or free factor structure of the required type).
- `tower.N4` (computation): The closed non-orientable surface group of genus 4 (χ = −2) is an extended hyperbolic tower over {1} with m = 0.

**Construction or proof.**

1. Define graphs of groups with surfaces on top of FG4's graphs of groups and FG6's surface groups with boundary (peripheral structure from FG6/qh-vertex).
2. Define ExtendedHyperbolicFloor G G′ r and IsExtendedHyperbolicTower G H as in the statement; the Euler characteristic is FG6's χ.
3. Record the special cases: m = 0 gives G = H ∗ F ∗ S₁ ∗ ⋯ ∗ S_p.

**Acceptance.**

- A closed orientable surface group of genus 2 is an extended hyperbolic tower over {1} with m = 0.
- The closed non-orientable surface group of genus 3 is not (χ = −1).

**Prerequisites.** `FreeGroupsAndLimitGroups:FG4/graph-of-groups`, `FreeGroupsAndLimitGroups:FG4/fundamental-group`, `FreeGroupsAndLimitGroups:FG4/bass-serre-tree`, `FreeGroupsAndLimitGroups:FG6/surface-group`, `FreeGroupsAndLimitGroups:FG6/qh-vertex`, `FreeGroupsAndLimitGroups:FG6/surface-splittings`

**Sources.**

- [Larsen Louder, Chloé Perin, Rizos Sklinos, Hyperbolic towers and independent generic sets in the theory of free groups](https://arxiv.org/abs/1208.2858), §3, Definitions 3.4–3.5, p. 7, with the graphs of groups with surfaces defined just before (pp. 6–7). extended hyperbolic floors and towers, the Euler characteristic conditions, bipartism, the two alternatives for the retraction, and the base G_m = H ∗ F ∗ S₁ ∗ ⋯ ∗ S_p with closed surfaces of Euler characteristic at most −2
- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), pp. 8–9. Sela's hyperbolic ω-residually free towers: a first level free product of closed hyperbolic surface groups (except the non-orientable surface of genus 2) and a free group, and further levels adding punctured surfaces of Euler characteristic ≤ −2 or punctured tori with retractions
- [Larsen Louder, Chloé Perin, Rizos Sklinos, Hyperbolic towers and independent generic sets in the theory of free groups](https://arxiv.org/abs/1208.2858), §3, p. 8 (after Definition 3.5). Sela's original definition was slightly too restrictive and some results were misstated, which is why extended floors and towers were introduced
- [Chloé Perin, Elementary embeddings in torsion-free hyperbolic groups](https://arxiv.org/abs/0903.0945v3), §5.1, Definitions 5.2–5.4, p. 16, and the remarks on p. 17. the same graphs of groups with surfaces, extended hyperbolic floors and towers, with the statement that hyperbolic towers are Sela's non-elementary hyperbolic ω-residually free towers and that the extended notion is needed for Sela's Proposition 6

#### Finitely generated groups elementarily equivalent to a free group

**Theorem.** Node `FO7/tower-classification`. Planet: *Classification of models of the free group theory*.

A finitely generated group G is elementarily equivalent (in the language of groups, without constants) to a nonabelian free group of finite rank iff G is an extended hyperbolic tower over the trivial subgroup (FO7/hyperbolic-tower). By FO7/elementary-equivalence the condition does not depend on the rank of the free group.

**Hypotheses.**

- G finitely generated.

**Construction or proof.**

1. If: a tower is built from a base H ∗ F ∗ S₁ ∗ ⋯ ∗ S_p by floors with retractions; each floor is a regular quadratic level over the lower floor in the sense of FG6/FG8, so the tower is an NTQ group with generic families (FO2/ntq-generic-family), and the elimination (FO6) and the parametrization theorem (FO2) show that every ∀∃-sentence and then every sentence true in F holds in G (SELA-VI Theorem 7 and its proof, p. 14 onward, for Sela's towers). For extended floors whose lower floor is cyclic, LPS Remark 3.7 and PERIN p. 17 report on Sela's authority that the proof extends; no written proof is available (gap 'the if direction for extended floors').
2. Only if: G is a non-elementary hyperbolic limit group (FO7/necessary-conditions); its cyclic JSJ decomposition (FG10/jsj-existence) must contain QH vertex groups (the argument of SELA-VI Claim 5); a non-injective preretraction obtained from the Makanin–Razborov diagram of G (FG10) by first-order sentences true in F (SELA-VI Proposition 6 and its proof, pp. 9–14) gives, by Perin's corrected Proposition 5.11 (PERIN, statement p. 19, proof §7, pp. 31–47), a retraction onto a proper subgroup forming an extended hyperbolic floor; induction on the subgroup (descending chains of limit-group quotients) gives the tower.

**Acceptance.**

- Closed orientable surface groups of genus ≥ 2 are models; the double F₂ ∗_{⟨w⟩} F₂ is not.

**Alternative route and remarks.** Alternative: KM06 Theorem 41 (regular NTQ groups), not read here; KM-RESPONSE item (57) maintains it. The tower definition is the corrected one of LPS and PERIN; the original statements (SELA-VI Theorem 7, SELA-ICM Theorem 6) are recorded under sourceIssues (E8).

**Prerequisites.** `FO7/hyperbolic-tower`, `FO7/elementary-equivalence`, `FO7/necessary-conditions`, `FO6/qe-procedure-correct`, `FreeGroupsAndLimitGroups:FG10/effective-makanin-razborov`, `FreeGroupsAndLimitGroups:FG10/jsj-existence`, `FreeGroupsAndLimitGroups:FG8/ntq-coordinate-group`

**Sources.**

- [Larsen Louder, Chloé Perin, Rizos Sklinos, Hyperbolic towers and independent generic sets in the theory of free groups](https://arxiv.org/abs/1208.2858), §3, Theorem 3.6 and Remark 3.7, p. 8. the corrected statement: a finitely generated group is a model of the theory of nonabelian free groups iff it is an extended hyperbolic tower over the trivial subgroup; the 'only if' direction needs Perin's corrected retraction argument, the 'if' direction in the exceptional cases extends Sela's proof
- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), pp. 8–14 (definition of towers, pp. 8–9; Proposition 6, p. 9, and its proof to p. 14; Theorem 7, p. 14). the original classification as non-elementary hyperbolic ω-residually free towers (Theorem 7), its necessity half (Proposition 6) via retractions built from the Makanin–Razborov diagram, and the start of the proof of sufficiency
- [Chloé Perin, Elementary embeddings in torsion-free hyperbolic groups](https://arxiv.org/abs/0903.0945v3), §5.1, Definitions 5.3–5.4 and the following remarks, pp. 16–17; §5.3, Proposition 5.11, p. 19. the corrected statement: a non-injective preretraction of a torsion-free hyperbolic group with respect to a cyclic JSJ-like decomposition (not a single surface vertex) yields a retraction onto a proper subgroup forming an extended hyperbolic floor; p. 17 records that Sela's Proposition 6 holds only with extended towers and that the converse is asserted by Sela
- [Olga Kharlampovich, Alexei Myasnikov, On Tarski's decidability problem: response to Sela's report](https://arxiv.org/abs/1402.0482), item (57), pp. 7–8. KM06 Theorem 41 states the classification through regular NTQ groups; the response gives counterexamples to Sela's original Theorem 7 (the non-orientable genus-3 surface group and the group G₂)

#### Closed surface groups of Euler characteristic ≤ −2 are elementarily equivalent to F₂

**Theorem.** Node `FO7/surface-groups`. Planet: *Surface groups elementarily equivalent to F₂*.

Let S be the fundamental group of a closed surface of Euler characteristic ≤ −2: an orientable surface of genus g ≥ 2 (⟨a₁, b₁, …, a_g, b_g | [a₁, b₁]⋯[a_g, b_g]⟩) or a non-orientable surface of genus g ≥ 4 (⟨c₁, …, c_g | c₁²⋯c_g²⟩). Then S ≅[groupLang] F₂; more generally every non-cyclic free product F ∗ S₁ ∗ ⋯ ∗ S_p of a free group and such surface groups is elementarily equivalent to F₂. The bound is sharp: for χ = −1 (the non-orientable surface of genus 3) the statement fails (FO7/non-examples).

**Hypotheses.**

- Closed surface with χ ≤ −2.

**Construction or proof.**

1. S (or the free product) is an extended hyperbolic tower over {1} with m = 0 (FO7/hyperbolic-tower, base case).
2. Apply FO7/tower-classification ('if' direction) and FO7/elementary-equivalence to pass from 'a nonabelian free group' to F₂.

**Acceptance.**

- The genus-2 orientable surface group satisfies every sentence true in F₂, e.g. the universal sentence 'commuting is transitive on non-trivial elements'.

**Prerequisites.** `FO7/tower-classification`, `FO7/hyperbolic-tower`, `FO7/elementary-equivalence`, `FreeGroupsAndLimitGroups:FG6/surface-group`, `mathlib:PresentedGroup`

**Sources.**

- [Larsen Louder, Chloé Perin, Rizos Sklinos, Hyperbolic towers and independent generic sets in the theory of free groups](https://arxiv.org/abs/1208.2858), Definition 3.5 and Theorem 3.6, pp. 7–8. a non-cyclic free product of a free group and closed surface groups of Euler characteristic at most −2 is an extended hyperbolic tower over {1} (m = 0), hence a model of the theory of free groups
- [Larsen Louder, Chloé Perin, Rizos Sklinos, Hyperbolic towers and independent generic sets in the theory of free groups](https://arxiv.org/abs/1208.2858), §3.4, before Lemma 3.12, p. 9. S₄, the fundamental group of the connected sum of four projective planes (the non-orientable closed surface of Euler characteristic −2), has the trivial structure of hyperbolic tower over {1}
- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), pp. 8–9. the first level of a hyperbolic tower: closed hyperbolic surface groups and a free group
- [Larsen Louder, Chloé Perin, Rizos Sklinos, Hyperbolic towers and independent generic sets in the theory of free groups](https://arxiv.org/abs/1208.2858), Proposition 4.6, p. 12. the connected sum of four projective planes S₄ is considered as a finitely generated model of the theory

#### Necessary conditions: a f.g. model is a non-elementary hyperbolic limit group without ℤ²

**Theorem.** Node `FO7/necessary-conditions`.

If a finitely generated group G is elementarily equivalent to a nonabelian free group F, then: (1) G has the same universal theory as F, hence is a limit group (finitely generated fully residually free, FG8/limit-group-equivalences) and is non-abelian; (2) G contains no subgroup isomorphic to ℤ²: the sentence 'for every x ≠ 1 the centralizer C(x) has at most two cosets of its subgroup of squares', ∀x∀y₁∀y₂∀y₃ (x ≠ 1 ∧ ⋀_i [x, y_i] = 1 → ⋁_{i<j} ∃z ([x, z] = 1 ∧ y_i y_j⁻¹ = z²)), holds in F, where C(x) is infinite cyclic; in a limit group the centralizer of x ≠ 1 is free abelian of finite rank, so a subgroup ℤ² ∋ x gives C(x) ≅ ℤ^r with r ≥ 2 and 2^r ≥ 4 cosets of squares (SELA-VI p. 7 counts classes of commuting elements mod 2); (3) consequently G is a non-elementary torsion-free hyperbolic group.

**Hypotheses.**

- G finitely generated.

**Construction or proof.**

1. (1) Elementary equivalence gives the same universal theory; by FG8/limit-group-equivalences (with Remeslennikov's theorem in FG5/FG8) G is fully residually free.
2. (2) The displayed sentence holds in F because centralizers of non-trivial elements are infinite cyclic (FreeGroupsAndLimitGroups FG1/centralizer-cyclic). By (1) G is a limit group, whose centralizers of non-trivial elements are abelian and free abelian of finite rank (FG8/frf-properties (1), (3)); a subgroup ℤ² ≤ G and x ≠ 1 in it give C(x) ≅ ℤ^r, r ≥ 2, with at least four cosets of squares, so G fails the sentence (SELA-VI p. 7).
3. (3) A limit group without ℤ² is hyperbolic (limit groups are toral relatively hyperbolic; with no non-cyclic abelian subgroups they are hyperbolic), and it is non-elementary because it is non-abelian (FG8/frf-properties).

**Acceptance.**

- ℤ² and F₂ × ℤ are not models.
- Every f.g. model is torsion-free and CSA.

**Alternative route and remarks.** Step (3) uses that limit groups are hyperbolic relative to their maximal non-cyclic abelian subgroups (Dahmani; Alibegović), which this roadmap takes from the cited proof in SELA-VI p. 7; recorded as part of the 'hyperbolicity of limit groups without ℤ²' gap.

**Prerequisites.** `FO7/elementary-equivalence`, `FreeGroupsAndLimitGroups:FG8/limit-group-equivalences`, `FreeGroupsAndLimitGroups:FG8/frf-properties`, `FreeGroupsAndLimitGroups:FG5/separation-discrimination`, `FreeGroupsAndLimitGroups:FG8`, `FreeGroupsAndLimitGroups:FG1/centralizer-cyclic`

**Sources.**

- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), p. 7. non-abelian limit groups are the f.g. groups universally equivalent to a non-abelian free group; a group containing ℤ² is not elementarily equivalent to a free group (counting classes of commuting elements modulo 2: two for ℤ, at least four for ℤ²), so a model is a non-elementary hyperbolic limit group
- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), Proposition 6, p. 9 (first paragraph of the proof). the same reduction at the start of the proof of the classification
- [Olga Kharlampovich, Alexei Myasnikov, Tarski's problem about the elementary theory of free groups has a positive solution](https://www.ams.org/journals/era/1998-04-14/S1079-6762-98-00047-X/S1079-6762-98-00047-X.pdf), p. 104 of the announcement. Remeslennikov: a finitely generated group is discriminated by F iff it has the same universal theory as F

#### Groups that are not elementarily equivalent to a free group

**Theorem.** Node `FO7/non-examples`.

None of the following is elementarily equivalent to F₂: (a) the closed non-orientable surface group of genus 3, N₃ = ⟨x, y, z | x²y²z²⟩: Vaught's universal sentence ∀x∀y∀z (x²y²z² = 1 → [x, y] = 1 ∧ [x, z] = 1 ∧ [y, z] = 1) holds in every free group (Lyndon) and fails in N₃ (its generators do not pairwise commute, as N₃ is non-abelian); (b) the double F ∗_{⟨w⟩} F = ⟨b₁, b₂⟩ ∗_{w(b₁,b₂) = w(b₃,b₄)} ⟨b₃, b₄⟩ of F₂ along an element w without roots, when this amalgam is its abelian JSJ decomposition; (c) any group containing ℤ², for instance ℤ² and F₂ × ℤ; (d) abelian groups, for instance ℤ (the sentence ∀x∀y [x, y] = 1).

**Hypotheses.**

- In (b), w has no proper roots in F₂ and the amalgam is the abelian JSJ decomposition of the double.

**Construction or proof.**

1. (a) In F, x²y²z² = 1 forces pairwise commutation (Lyndon; the radical of x₁²x₂²x₃² = 1 in FG6/quadratic-radicals); in N₃ the generators satisfy x²y²z² = 1 but do not all commute (N₃ is non-abelian, χ = −1).
2. (b) Follow SELA-VI Claim 5: write the system Σ of the presentation, view it over F and over G; over F every solution can be moved by the modular group into one of the finitely many proper quotients G₁,…,G_ℓ, which is a coefficient-free AE sentence; over G the tautological solution cannot be so moved since the modular group of G is cyclic (generated by the Dehn twist along w).
3. (c), (d) FO7/necessary-conditions; for ℤ the sentence ∀x∀y [x, y] = 1.

**Acceptance.**

- Vaught's sentence separates N₃ from F₂; ∀x∀y [x, y] = 1 separates ℤ from F₂.

**Prerequisites.** `FO7/necessary-conditions`, `FreeGroupsAndLimitGroups:FG6/quadratic-radicals`, `FreeGroupsAndLimitGroups:FG10/makanin-razborov-diagram`, `FreeGroupsAndLimitGroups:FG4/dehn-twist`, `mathlib:PresentedGroup`, `mathlib:Monoid.PushoutI`

**Sources.**

- [Olga Kharlampovich, Alexei Myasnikov, On Tarski's decidability problem: response to Sela's report](https://arxiv.org/abs/1402.0482), item (57)(a), p. 7. the non-orientable genus-3 surface group fails Vaught's sentence, which holds in free groups, so it is not elementarily equivalent (and not even fully residually free)
- [Olga Kharlampovich, Alexei Myasnikov, Tarski's problem about the elementary theory of free groups has a positive solution](https://www.ams.org/journals/era/1998-04-14/S1079-6762-98-00047-X/S1079-6762-98-00047-X.pdf), p. 102 of the announcement. Vaught's question and Lyndon's theorem that all solutions of x²y²z² = 1 in a free group pairwise commute
- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), Claim 5 and its proof, pp. 7–8. the double F ∗_{⟨w⟩} F is not elementarily equivalent to F: a coefficient-free AE sentence true over F fails over it because the modular group of the double acts on the tautological solution through conjugations
- [Zlil Sela, Diophantine geometry over groups VI: the elementary theory of a free group](https://math.huji.ac.il/~zlil/diophantine6.pdf), p. 7. groups containing ℤ² are not models

### Dependencies

Within this roadmap: FO1, FO5, FO6. Other roadmaps: `FreeGroupsAndLimitGroups:FG1`, `FreeGroupsAndLimitGroups:FG3`, `FreeGroupsAndLimitGroups:FG4`, `FreeGroupsAndLimitGroups:FG5`, `FreeGroupsAndLimitGroups:FG6`, `FreeGroupsAndLimitGroups:FG8`, `FreeGroupsAndLimitGroups:FG10`.

### Acceptance tests

The layer is accepted when every node above is stated with its hypotheses, every definition passes its unit tests, and the acceptance items of its theorems hold. Coverage: planned; remaining: FO7/tower-classification: the 'if' direction for extended floors whose lower floor is cyclic rests on an unwritten extension of SELA-VI's proof reported in LPS Remark 3.7 and PERIN p. 17 (gap 'the if direction for extended floors'); the 'only if' direction cites PERIN Proposition 5.11, whose proof (§7) the review did not re-check. FO7/necessary-conditions: hyperbolicity of limit groups without ℤ² is requested from FreeGroupsAndLimitGroups FG8. FO7/uniform-qe and FO7/elementary-embedding: the coefficient-free run of the elimination (gap 'rank independence in KM's route')..

## Gaps

- **KM06 not read directly** (needed by `FO4/algebraic-solution-bound`, `FO3/tight-envelope-reorganization`, `FO6/true-level-two`, `FO2/sufficient-splitting`, `FO5/ae-tree-finite`). Kharlampovich–Myasnikov, Elementary theory of free non-abelian groups, J. Algebra 302 (2006), 451–552, could not be fetched (the publisher refuses automated access, and no author copy was found on the Stevens publication pages). The plan follows the later texts of the same authors that restate and correct its constructions (QE-FREE arXiv:1207.1900v4, HYP arXiv:1303.0760v8, IFT arXiv:math/0312509v2) and cites KM06's numbering through them. Next action: read KM06 (Sections 5.3–5.4, 7, 11–12, Theorems 11 and 41, Lemmas 23, 27, 28) and check every node that cites it.
- **level-2 termination: the depth construction with tight envelopes** (needed by `FO6/true-level-two`, `FO3/tight-envelope-reorganization`). QE-FREE §5.4 (pp. 35–37) is explicitly a sketch of KM06's argument that the construction of deeper fundamental sequences of level 2 and width i stops (non-increase of complexity of tight enveloping sequences, equality for a bounded number of steps). SELA-REPORT contests KM06's version of this argument (items (26)–(56)); KM-RESPONSE answers the items. No complete, uncontested written proof of this step was available. The node states the theorem with this proof plan; a full proof is the missing input.
- **general levels m ≥ 3 of the parametric elimination** (needed by `FO6/true-all-levels`). QE-FREE treats level 2 and says that fundamental sequences of all levels are considered similarly (p. 37). The level-m certificates and configuration groups are planned by analogy (FO6/true-all-levels); their precise definition and the termination of their depth construction are not written in the sources read.
- **sufficient-splitting definition** (needed by `FO2/sufficient-splitting`, `FO2/fundamental-sequences-modulo`). The readable sources use 'K has no sufficient splitting modulo H' with the rigid/solid dichotomy (QE-FREE §4.1–4.2, HYP Remark 2) but refer to KM06 §5.4 for the definition. The node describes the notion through its role (terminal groups of fundamental sequences modulo H) and matches it with Sela's rigid and solid limit groups; the exact definition must be taken from KM06 §5.4.
- **rank independence in KM's route** (needed by `FO5/ae-rank-independence`, `FO7/uniform-qe`, `FO7/elementary-embedding`). That every construction of the elimination for a coefficient-free formula is the same over F_k and F_ℓ (terminal factors L replaced by L ∗ F_{ℓ−k}) is argued in SELA-VI pp. 3–7 for Sela's procedure. The readable KM texts state decidability and the elementary embedding (ERA98) but not this uniformity explicitly. The plan uses Sela's argument for this step; Sacerdote's 1973 proof of the ∀∃ case was not read.
- **the 'if' direction of the classification for extended floors** (needed by `FO7/tower-classification`). The 'only if' direction of the classification (LPS Theorem 3.6) is covered by Perin's corrected Proposition 5.11 (PERIN, arXiv:0903.0945v3, statement p. 19, proof §7, pp. 31–47), read at statement level by the review; its proof was not re-checked. The 'if' direction for towers whose last floor is an extended, non-hyperbolic floor (the lower floor cyclic) is stated in LPS (Remark 3.7, p. 8) and PERIN (p. 17) on Sela's authority, as a straightforward extension of the proof of SELA-VI Theorem 7; no written proof was found. Next action: write this extension out for the exceptional low-complexity floors, or find it in print.
- **all formula solutions over NTQ groups** (needed by `FO6/parametric-tree`). The parametric tree needs, at every level m ≥ 2, a description of all formula solutions of U = 1 over the correcting extensions of NTQ groups by finitely many fundamental sequences (QE-FREE §5, p. 27). That is a complete Hom-diagram of an equation over a finitely generated fully residually free group, the target FreeGroupsAndLimitGroups FG10/equations-over-limit-groups, which rests on that roadmap's recorded gap 'Equations over a represented limit group' (the elimination process over NTQ groups, KM06 Theorem 32). The ∀∃ decider (FO5) does not use it: it searches for one formula solution per vertex and detects falsity by a counterexample search. The elimination (FO6), and with it the decidability of Th(F(A)) and the uniformity statements of FO7, rest on it until that gap is closed in FreeGroupsAndLimitGroups.

## Requests to other roadmaps

- To `FreeGroupsAndLimitGroups:FG8`: A finitely generated fully residually free group containing no subgroup isomorphic to ℤ² is word-hyperbolic (limit groups are hyperbolic relative to their maximal non-cyclic abelian subgroups; Dahmani 2003, Alibegović 2005), so a non-abelian such group is non-elementary hyperbolic. Needed by `FO7/necessary-conditions`.

## Mistakes in the sources

Each finding is stated in our own words at its locator, with the correction used in this roadmap. Findings on KM06 are scoped to the authors' own later descriptions (the 2006 paper was not read directly).

- **FreeGroupsFirstOrderTheory/E1** (gap, KM06, Section 7 (fundamental sequences of the canonical embedding tree), as described in HYP Remark 1, p. 12 (arXiv:1303.0760v8); KM06 itself not read). Printed: the strict fundamental sequences used in KM06 are required to satisfy only the first two strictness properties (non-abelian images of non-abelian vertex groups; injectivity on rigid vertex groups and edge groups). Correction: they must also be injective on the envelope of each rigid vertex group (the subgroup generated by it and the isolators of its adjacent abelian edge groups), property 3 of QE-FREE Definition 1. Reason: the authors state in HYP Remark 1 that KM06 used properties 1–2 but should have had property 3; the envelope injectivity is what makes the image of G embed in the canonical NTQ group (FO2/canonical-ntq). Affects: the proof. Known: corrected by the authors in HYP v8 (Remark 1, Definition 5) and QE-FREE v4 (Definition 1). Review (REV-DESIGN-FGFO): confirmed; HYP Remark 1, p. 12, says the fundamental sequences of [21] (KM06) had properties 1–2 and should also have had property 3; QE-FREE Definition 1, p. 3, states property 3 with isolators. (HYP Definition 5 states property 3 without isolators, a weaker condition; this roadmap uses QE-FREE's.).
- **FreeGroupsFirstOrderTheory/E2** (error, KM06, Section 11.2, as described in QE-FREE footnote 3, p. 35 (arXiv:1207.1900v4); KM06 itself not read). Printed: the fundamental sequences entering the tight enveloping construction are to be built modulo the non-cyclic free factors of F_{R(U)}. Correction: they are to be built modulo the non-cyclic free factors of the second level ⟨X₂,…,X_n⟩ of F_{R(W)}. Reason: the authors call it an error, easy to fix, in QE-FREE footnote 3; with the printed choice the comparison of Kurosh ranks with the top level S₁ is not the one the termination argument needs. Affects: the proof. Known: corrected in QE-FREE v4, §5.3 and footnote 3. Review (REV-DESIGN-FGFO): confirmed; QE-FREE footnote 3, p. 35, calls the choice in KM06 §11.2 an easy-to-fix error and gives the correction recorded here.
- **FreeGroupsFirstOrderTheory/E3** (error, KM06, Definition 20 (reducing quotients), p. 483 of the journal version, as described in KM-RESPONSE item (3) and SELA-REPORT §3 item (3), p. 7; KM06 itself not read). Printed: a reducing quotient is defined by three alternative conditions. Correction: the third condition is removed: a reducing quotient has a non-trivial free decomposition modulo the image of H or a new elementary abelian splitting modulo it (QE-FREE Definition 4). Reason: SELA-REPORT item (3): K = ⟨a₁,a₂⟩ ∗ ⟨b₁,b₂⟩ ∗ ⟨c₁,c₂⟩ amalgamated along commutators, H the genus-2 subgroup and τ : c_i ↦ b_i make H a reducing quotient under the printed definition and contradict Lemma 19; under the two-item definition H is not reducing (FO4/reducing-quotient test). Affects: the proof. Known: corrected (N. Touikan's observation) in QE-FREE Definition 4; acknowledged in KM-RESPONSE item (3). Review (REV-DESIGN-FGFO): confirmed; KM-RESPONSE item (3), p. 2, says item (3) of Definition 20 was removed after N. Touikan's remark (the authors call it a misprint); SELA-REPORT §3 item (3), p. 7, gives the example recorded here; QE-FREE Definition 4, p. 22, has the two-item definition.
- **FreeGroupsFirstOrderTheory/E4** (misprint, KM06, Lemma 18, p. 482 of the journal version, last line, as described in KM-RESPONSE item (2); KM06 itself not read). Printed: the conclusion of Lemma 18 is stated for all solutions. Correction: it holds for non-transcendental solutions, the only case in which the lemma is used (in the proof of Lemma 19). Reason: SELA-REPORT item (2) gives a counterexample to the printed statement (a QH vertex group of the quotient into which no QH subgroup of K maps with finite index); the authors state that the word 'non-transcendental' is missing and that the proof (p. 483, lines 8–10) treats the transcendental case separately. Affects: nothing. Known: acknowledged in KM-RESPONSE item (2). Review (REV-DESIGN-FGFO): confirmed; KM-RESPONSE item (2), p. 2, supplies the missing word 'non-transcendental' and says the lemma is only used for such solutions; SELA-REPORT §3 item (2), p. 6, gives the counterexample to the printed statement.
- **FreeGroupsFirstOrderTheory/E5** (gap, KM06, construction of the induced NTQ system, p. 506 of the journal version, as described in KM-RESPONSE items (6)–(8); KM06 itself not read). Printed: the step that adds conjugating elements so that all rigid subgroups mapped to the same free factor of the next level are conjugate into one subgroup is not written. Correction: add the conjugating elements (QE-FREE §3.3, pp. 9–10, does so). Reason: without it the induced system need not be an NTQ system; the authors state that the requirement to end with an NTQ system (p. 507) implies the step. Affects: the proof. Known: written out in QE-FREE §3.3; acknowledged in KM-RESPONSE items (6)–(8). Review (REV-DESIGN-FGFO): confirmed; KM-RESPONSE items (6)–(8), pp. 2–3, concede that the sentence is missing on p. 506; QE-FREE §3.3, pp. 9–10, adds the conjugating elements.
- **FreeGroupsFirstOrderTheory/E6** (gap, KM06, p. 529, line 8 of the journal version, as described in KM-RESPONSE item (35); KM06 itself not read). Printed: only solutions minimal with respect to the canonical automorphisms are considered, with no mention of reducing quotients of the terminal group. Correction: the solutions considered must also not factor through a reducing quotient of the terminal group when that group has a (non-sufficient) splitting. Reason: the authors supply the missing sentence in KM-RESPONSE item (35); without it the minimality condition does not exclude reducing solutions. Affects: the proof. Known: acknowledged and corrected in KM-RESPONSE item (35). Review (REV-DESIGN-FGFO): confirmed; KM-RESPONSE item (35), pp. 5–6, gives the omitted sentence for p. 529, line 8.
- **FreeGroupsFirstOrderTheory/E7** (gap, KM06, Theorem 11 (the bound on the number of MAX-classes of algebraic solutions), effectiveness of the bound, as described in KM-RESPONSE item (5) and QE-FREE §4.2; KM06 itself not read). Printed: the bound N(K, H) is asserted to be effectively computable with a sketched proof. Correction: N(K, H) is found by deciding, for m = 1, 2, …, an existential sentence (rigid case) or an ∃∀-sentence (solid case) until it is false (QE-FREE Theorem 7 and its proof, p. 25; FO5/effective-bound). Reason: the authors agree the proof of effectiveness was sketchy (KM-RESPONSE item (5)) and give it in QE-FREE; the algorithm uses the decidability of the ∀∃-theory, which does not use the bound. Affects: the proof. Known: QE-FREE v4, §4.2. Review (REV-DESIGN-FGFO): confirmed; KM-RESPONSE item (5), p. 2, agrees the proof of effectiveness was sketchy; QE-FREE Theorem 7, p. 25, gives the search; SELA-REPORT §3 items (4)–(5), p. 7, dispute the argument for the bound itself, which this roadmap keeps under the gap 'KM06 not read directly'.
- **FreeGroupsFirstOrderTheory/E8** (error, SELA-VI, Theorem 7 (classification of finitely generated groups elementarily equivalent to a non-abelian free group), p. 14 of the author's copy, with the definition of hyperbolic ω-residually free towers on pp. 8–9; also SELA-ICM Theorem 6, p. 90). Printed: a finitely generated group is elementarily equivalent to a non-abelian free group iff it is a non-elementary hyperbolic ω-residually free tower, where the first level may contain any closed hyperbolic surface group other than the non-orientable one of genus 2. Correction: the base surfaces must have Euler characteristic ≤ −2 and the floors must be allowed to be extended hyperbolic floors: a finitely generated group is a model iff it is an extended hyperbolic tower over the trivial subgroup (LPS Theorem 3.6). Reason: the closed non-orientable surface group of genus 3 (χ = −1) is a tower under the printed definition, but Vaught's sentence ∀x∀y∀z (x²y²z² = 1 → [x, y] = [x, z] = [y, z] = 1) holds in free groups (Lyndon) and fails in it (KM-RESPONSE item (57)(a)); LPS p. 8 records that the definition was slightly too restrictive in other respects and that some results were misstated. Affects: a stated result. Known: corrected in Louder–Perin–Sklinos (LPS, Notre Dame J. Formal Logic 2013, Theorem 3.6) after Perin's correction. Review (REV-DESIGN-FGFO): confirmed; SELA-VI p. 8 admits every closed hyperbolic surface except the non-orientable one of genus 2 at the first level, so the genus-3 non-orientable surface group is a tower; Vaught's sentence separates it from F (KM-RESPONSE item (57)(a), p. 7); Theorem 7 is on p. 14, not pp. 8–9 (locator corrected); LPS Theorem 3.6 and PERIN p. 17 give the corrected statement.
- **FreeGroupsFirstOrderTheory/E9** (error, KM06, Lemma 8, p. 470 of the journal version, as described in KM-RESPONSE item (1); KM06 itself not read). Printed: a statement about the intersection of two subgroups in the conclusion of the lemma (for F-groups and F-automorphisms). Correction: the intersection statement is inaccurate; only the commutation of the subgroups is used later, and the corrected form is Theorem 5.3 of Bumagin–Kharlampovich–Myasnikov (J. Pure Appl. Algebra 208 (2007)). Reason: the authors acknowledge the inaccuracy in KM-RESPONSE item (1) and state that the intersection claim is never used. Affects: nothing. Known: Bumagin–Kharlampovich–Myasnikov, The isomorphism problem for finitely generated fully residually free groups, J. Pure Appl. Algebra 208 (2007), Theorem 5.3. Review (REV-DESIGN-FGFO): confirmed; KM-RESPONSE item (1), p. 2, concedes the inaccuracy and states only the commutation is used; SELA-REPORT §3 item (1), p. 6, attributes the counterexample to Levitt.
- **FreeGroupsFirstOrderTheory/E10** (misprint, KM06, p. 518, lines 20–22 of the journal version, as described in SELA-REPORT §3 item (12), pp. 9–10, and KM-RESPONSE item (12), p. 3; KM06 itself not read). Printed: in the construction of the ∀∃-tree, if F_{R(U₀)} splits as a free product one continues with each freely indecomposable factor separately. Correction: the free factors are treated together, never one at a time. Reason: SELA-REPORT calls the factor-by-factor reduction a crucial mistake; the authors reply that it is a regrettable misprint, that everything after line 22 treats the factors together and that the wrong statement is never used; QE-FREE §3.4 (p. 12) works modulo the images of all the free factors at once. Affects: the proof. Known: acknowledged as a misprint in KM-RESPONSE item (12). Review (REV-DESIGN-FGFO): confirmed; added by the review from SELA-REPORT §3 item (12) and KM-RESPONSE item (12), both read at their locators; scoped to these descriptions.
- **FreeGroupsFirstOrderTheory/E11** (misprint, QE-FREE, §4.1, Theorem 6, p. 23; §5.2, after Corollary 1, p. 33; §5.4, last paragraph, p. 37 (arXiv:1207.1900v4)). Printed: the Boolean combinations produced are said to consist of formulas 'of type (4)'. Correction: of type (1): the conjunctive ∃∀-formulas ∃X∀Y(U = 1 ∧ V ≠ 1) of p. 1. Reason: formula (4) of the paper, on p. 4, is the quadratic relation added at a QH vertex in the construction of canonical NTQ systems; Theorem 6 itself names the class as conjunctive ∃∀-formulas, which are formula (1). Affects: nothing. Known: new. Review (REV-DESIGN-FGFO): confirmed; added by the review after reading pp. 1, 4, 23, 33 and 37.
- **FreeGroupsFirstOrderTheory/E12** (misprint, QE-FREE, §3.2, p. 8 (arXiv:1207.1900v4); the same in HYP §4.2, p. 28 (arXiv:1303.0760v8)). Printed: the level maps are written π_i : F_{R(Q_i,…,Q_n)} ∗ F(t₁,…,t_{k_{i−1}}) → F_{R(Q_{i+1},…,Q_n)} ∗ F(t₁,…,t_{k_i}), indexing the free variables cumulatively, while the dimension is defined as k₁ + ⋯ + k_n. Correction: k_i is the number of free variables added at level i (as the tree construction uses it: 'top dimension component k₁', 'the sum of the first two dimensions k₁ + k₂', QE-FREE p. 13, HYP p. 33); the free factor at level i + 1 has k₁ + ⋯ + k_i variables, and the dimension k₁ + ⋯ + k_n is the total number of free variables. Reason: with the cumulative reading the sum would count the variables of the upper levels repeatedly; with the per-level reading the index notation is wrong; the uses on p. 13 fix the per-level reading. Affects: nothing. Known: new. Review (REV-DESIGN-FGFO): confirmed; added by the review after reading QE-FREE pp. 8 and 12–13 and HYP pp. 28 and 33.
- **FreeGroupsFirstOrderTheory/E13** (misprint, IFT, §4.4, Definition 13, p. 26, and the proof of Theorem 4, p. 27 (arXiv:math/0312509v2)). Printed: Definition 13 says that G freely lifts φ when φ₀(x₁, q₁, …) '= 1' holds in F[X]; the proof of Theorem 4 obtains the words q_i 'from the argument in Theorem 4'. Correction: F freely lifts φ when the quantifier-free formula φ₀(x₁, q₁, …, x_k, q_k) holds in F[X] (no '= 1'); the words q_i come from the argument of Merzljakov's theorem (p. 25). Reason: the definition concerns the free group F, whose words q_i it uses, and Theorem 4 is stated for F; the proof of Theorem 4 cannot rest on Theorem 4, and the construction cited is the one of Merzljakov's theorem on p. 25, with the same words g_i. Affects: nothing. Known: new. Review (REV-DESIGN-FGFO): confirmed; added by the review after reading pp. 25–27.
- **FreeGroupsFirstOrderTheory/E14** (misprint, LPS, §3.3, before Theorem 3.6, p. 8 (arXiv:1208.2858v1)). Printed: the classification of finitely generated models is attributed to Theorem 6 of [Sel06], Sela's Diophantine geometry VI. Correction: it is Theorem 7 of Diophantine geometry VI (p. 14 of the author's copy); Theorem 6 is its numbering in Sela's ICM survey. Reason: SELA-VI has no Theorem 6 (Proposition 6 on p. 9 is the necessity half, Theorem 7 on p. 14 the classification); SELA-ICM labels the statement Theorem 6 ([Se7], 7). Affects: nothing. Known: new. Review (REV-DESIGN-FGFO): confirmed; added by the review after reading LPS p. 8, SELA-VI pp. 9 and 14 and SELA-ICM p. 90.

## Structure

- The maintainer's milestones FO1–FO7 are kept with their keys and titles, but the dependencies of the sources force a build order FO1 → FO2 → FO4 → FO3 → FO5 → FO6 → FO7: the configuration machinery of FO3 (certificates and configuration groups, QE-FREE Definition 6) is defined through the algebraic solutions and MAX-equivalence of FO4, and the effective computation of the bound N(K, H) (an FO4 effectivity statement) needs the ∀∃ decider of FO5, so it is planned in FO5 (FO5/effective-bound). The fundamental-sequence infrastructure (strict and well-aligned fundamental sequences, canonical NTQ systems, the canonical embedding tree, fundamental sequences modulo subgroups, sufficient splittings) is planned in FO2 with the parametrization theorem it serves (as HYP §3 groups it). Proposal: Keep seven layers; record the stage edges FO2 → FO4 → FO3 and FO4, FO3 → FO5. If the atlas prefers layer keys in build order, rename FO3 ↔ FO4 (keeping titles with their content).

## References

- **LEAN**: The Mathlib Community, *Mathlib (first-order logic, model theory, computability, free groups)*, Mathlib commit 082e2d37e8b0463410cdb532e111cd43d5a66174 (the Tau Ceti f790474 pin). <https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174>. Read: Mathlib/ModelTheory/Syntax.lean, Semantics.lean, Complexity.lean (IsQF, IsPrenex, IsUniversal, IsExistential, toPrenex), ElementaryMaps.lean (ElementaryEmbedding, isElementary_of_exists), Satisfiability.lean (Theory.IsComplete), Definability.lean (Set.Definable), Encoding.lean (listEncode, no Primcodable instance for formulas at the pin); Mathlib/Computability/RE.lean (ComputablePred), Partrec.lean, Primrec/Basic.lean; Mathlib/GroupTheory/FreeGroup/Basic.lean (FreeGroup, map, lift), PresentedGroup.lean, PushoutI.lean.
- **QE-FREE**: Olga Kharlampovich, Alexei Myasnikov, *Quantifier elimination algorithm to boolean combination of ∃∀-formulas in the theory of a free group*, arXiv:1207.1900v4 (12 September 2019), 40 pp.; PDF page numbers cited. <https://arxiv.org/abs/1207.1900>. Read: all of §§1–5 (pp. 1–37), read 2026-10-14. SHA-256 e77d7fab0ee03f5ab6db6980f0746ba2e6a5f14e1a7052e523c603a38c63a9bb.
- **HYP**: Olga Kharlampovich, Alexei Myasnikov, *Decidability of the elementary theory of a torsion-free hyperbolic group*, arXiv:1303.0760v8 (21 April 2016), 57 pp.; PDF page numbers cited; a free group is the case Γ = F. <https://arxiv.org/abs/1303.0760>. Read: §1 (Theorems 1–3), §3.2–3.8 (pp. 10–26), §4 (pp. 26–40), §5 (pp. 40–46, statements), §6 (pp. 46–55, statements), read 2026-10-14. SHA-256 5ecf620944a8f15811168d6beb6dae4eae9d962a153cc4c7610b6890afc82858.
- **IFT**: Olga Kharlampovich, Alexei Myasnikov, *Implicit function theorem over free groups*, J. Algebra 290 (2005), 1–203; arXiv:math/0312509v2 (printed page numbers of the arXiv version cited). <https://arxiv.org/abs/math/0312509>. Read: §2.3 (pp. 4–5), §3.1 (pp. 11–13), §4.4 (pp. 24–27: Corollary 9, Definition 13, Theorem 4), §7.6 (pp. 137–142: Theorem 11, Lemma 76, Definition 44, correcting extensions, Theorems 12–14), read 2026-10-14; §3.1 Lemma 3 to Corollary 7 (pp. 11–13), §4.4 (pp. 24–27) and §7.6 including Lemmas 74–75 (pp. 137–142), re-read 2026-10-14 by REV-DESIGN-FGFO. SHA-256 ed2cfda3c57223abe585b03b6a6a4dd47b5b61b305d9d46e34be64111e2f24fb.
- **KM06**: Olga Kharlampovich, Alexei Myasnikov, *Elementary theory of free non-abelian groups*, J. Algebra 302 (2006), 451–552. <https://doi.org/10.1016/j.jalgebra.2006.03.033>. Read: not read directly: the publisher refuses automated access; its theorem, definition and section numbers are cited as the later papers QE-FREE and HYP and the exchange SELA-REPORT / KM-RESPONSE cite them (Theorem 11, Definitions 20, 22, 27, 28, Lemmas 11, 23, 27, 28, Sections 5.3, 5.4, 7.3, 7.6–7.12, 11.2, 12.2).
- **ERA98**: Olga Kharlampovich, Alexei Myasnikov, *Tarski's problem about the elementary theory of free groups has a positive solution*, Electron. Res. Announc. Amer. Math. Soc. 4 (1998), 101–108; the AMS PDF (page numbers cited) and the EMIS archival TeX version, which has the same text. <https://www.ams.org/journals/era/1998-04-14/S1079-6762-98-00047-X/S1079-6762-98-00047-X.pdf>. Read: Theorems 1–2, the normal form (1), the statement on F(a1..an) ≤ F(a1..an+p), the history (Vaught, Lyndon, Merzljakov, Sacerdote, Makanin), read 2026-10-14; the AMS PDF, pp. 101–108, read 2026-10-14 by REV-DESIGN-FGFO to confirm the page numbers (formula (1) and Theorems 1–2 on p. 101, Vaught and Lyndon on p. 102, Merzljakov and Sacerdote on p. 103, Remeslennikov on p. 104, Theorem 3 on p. 106). SHA-256 0238ff1e3a66b9b0fa88ba8752916aea6648afafa38c9821f3a03281f8213caa.
- **SELA-VI**: Zlil Sela, *Diophantine geometry over groups VI: the elementary theory of a free group*, Geom. Funct. Anal. 16 (2006), 707–730; the author's copy (24 pp., page numbers 1–24 of that copy cited), read as page images because its fonts do not extract. <https://math.huji.ac.il/~zlil/diophantine6.pdf>. Read: pp. 1–10: Theorems 1–4, Claim 5, the definition of hyperbolic ω-residually free towers (pp. 8–9), Proposition 6, read 2026-10-14; pp. 11–14 (the proof of Proposition 6 and the statement of Theorem 7, p. 14), read 2026-10-14 by REV-DESIGN-FGFO. SHA-256 8bd155c2f6aafdef34345188ada99689abd96e27ac2aa5d5a1137108cfdf1a7d.
- **SELA-ICM**: Zlil Sela, *Diophantine geometry over groups and the elementary theory of free and hyperbolic groups*, Proceedings of the ICM, Beijing 2002, Vol. II, 87–92; arXiv:math/0304209v1. <https://arxiv.org/abs/math/0304209>. Read: all (Theorems 1–13, Claim 5), read 2026-10-14. SHA-256 6eae3e6cefb605bd24d46fed87f62ccfea1481c94011a03e62bebf4dc50b079b.
- **SELA-REPORT**: Zlil Sela, *A report on Tarski's decidability problem: "Elementary theory of free nonabelian groups" by O. Kharlampovich and A. Myasnikov*, arXiv:1401.5711v1 (22 January 2014). <https://arxiv.org/abs/1401.5711>. Read: introduction and items (1)–(5), (57), read 2026-10-14; the remaining items consulted only through KM-RESPONSE; §3 items (1)–(5), pp. 6–7, and item (12), pp. 9–10 (the report numbers its §2 and §3 items separately), read 2026-10-14 by REV-DESIGN-FGFO. SHA-256 c1c7acf39d0d1eafa410fe8660c5f0d5de25fda390d74553e745eab1b56a00a1.
- **KM-RESPONSE**: Olga Kharlampovich, Alexei Myasnikov, *On Tarski's decidability problem: response to Sela's report*, arXiv:1402.0482v3 (31 May 2014). <https://arxiv.org/abs/1402.0482>. Read: all (§§1–4), read 2026-10-14. SHA-256 a243d32002ef8d33b65039cd1f0d4063499abcaf5551d91725b6c2ff0ff7d7a2.
- **LPS**: Larsen Louder, Chloé Perin, Rizos Sklinos, *Hyperbolic towers and independent generic sets in the theory of free groups*, Notre Dame J. Formal Logic 54 (2013), 521–539; arXiv:1208.2858v1 (PDF page numbers cited). <https://arxiv.org/abs/1208.2858>. Read: §3 (Definitions 3.4–3.5, Theorem 3.6, Remark 3.7, Theorems 3.8–3.9, pp. 6–9) and Proposition 4.6 (p. 12), read 2026-10-14. SHA-256 f06fd28c7eac36658ade8e813fb052fecd2ce2d656b44553639ff8415ec75701.
- **PERIN**: Chloé Perin, *Elementary embeddings in torsion-free hyperbolic groups*, Ann. Sci. Éc. Norm. Supér. (4) 44 (2011), 631–681; arXiv:0903.0945v3 (15 June 2012), the version with Proposition 5.11 corrected; PDF page numbers cited. <https://arxiv.org/abs/0903.0945v3>. Read: §1 (pp. 1–4), §5.1 (Definitions 5.2–5.4 and the remarks, pp. 16–17) and §5.3 (Propositions 5.11–5.12, p. 19), read 2026-10-14 by REV-DESIGN-FGFO; the proof of Proposition 5.11 in §7 (pp. 31–47) was not checked. SHA-256 e9c9ae3da89922c56b9502125529674944cc1ee8098383873e8460b87ca1ab6a.
