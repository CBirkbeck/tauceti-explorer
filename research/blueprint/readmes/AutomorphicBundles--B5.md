# Automorphic bundles — B5: Hecke action and Fourier expansions

**Checkpoint, 26 September 2026. Scope: `AutomorphicBundles:B5`. Status: partial.**

This document develops the Fourier–Jacobi strand for nonnegative powers of the determinant Hodge line on the good-prime PEL models in Lan's revised book. It does not complete the Hecke strand, arbitrary Levi-valued coefficients, ramified Hilbert models, or the full geometric Lean prototype. Its companion packet contains nine nodes; none is an implementation claim.

## Conventions and the objects being used

Let `R` be the localization of the reflex integers specified by Lan's good-prime PEL setting, or the characteristic-zero field version of that setting. Write `X` for the smooth proper toroidal model associated with compatible admissible smooth fan data, and `omega` for the determinant of the invariant differentials of its universal semi-abelian family. For `k >= 0` and an `R`-module `M`, use B4's actual section module

`AF(k,M) = Gamma(X, omega^k tensor_R M)`.

These are Lan's *naive parallel weights*. They are not all arithmetic Hilbert weights and are not a substitute for arbitrary representations of the Levi. The determinant line also is not the Hodge vector bundle itself. B3 owns the canonical/subcanonical extensions, and B4 owns the comparison of these sections with analytic automorphic forms.

A cusp label supplies its character lattice, its positivity cone, the relevant finite cover of a lower-dimensional moduli **stack**, an abelian torsor `C`, and character-indexed invertible sheaves `Psi(ell)` on `C`. Keep the actual cusp stabilizer and its actions. A lower-dimensional moduli object is not automatically a scheme, and the finite cover is not automatically the quotient itself. These are among the corrections in Lan's published errata, items 75–77.

The boundary Hodge line is

`L = det_Z(character lattice) tensor omega_A`.

Its identification with the pullback of `omega` uses the Raynaud extension and the determinant of its invariant-differential sequence. It is an identification of sheaves with descent data, not an arbitrary trivialization. In the elliptic test, the invariant differential is `du/u` on the multiplicative fiber. The differential `dq/q` lives on the base and is not substituted for it.

## 1. Coefficients and the local expansion

### Coefficient modules

Node: `B5/fj-coefficient-module`.

For a character degree `ell`, set

`C(ell;k,M) = Gamma(C, Psi(ell) tensor L^k tensor_R M)`.

Families of coefficients lie in a **product**, indexed by the appropriate dual cone. Their image may satisfy further completion or equivariance conditions. In particular, this product is not asserted to be the entire completed graded algebra, and not every family need arise from a global automorphic form.

The coefficient construction must expose functorial maps in `M`, transport under cusp and stabilizer isomorphisms, and extensionality of families. The proposed API names are `FJCoefficient.map`, `FJCoefficient.transport`, and `FJCoefficient.family_ext`.

The definition uses sections on the abelian torsor. Rewriting it as sections of a pushforward sheaf on the lower-dimensional moduli stack is a useful later comparison, but requires its exact projection/base-change statement. Tensoring a pushforward with an arbitrary coefficient module is not declared to commute with pushforward merely because a display suggests it.

Tests: zero coefficient modules give zero; the supplied Tate trivializations identify a degree coefficient with `M`; and the local formal function `(1-q)^(-1)` has infinitely many nonzero coefficients over a nonzero base. That last test rejects a finite-support replacement. It is a test of the local chart, not a claim that this function extends globally.

### Local expansion

Node: `B5/local-fj-expansion`.

For a stratum represented by `(Phi,delta,sigma)`, define the local expansion by the following geometric sequence:

1. Restrict a global section to the formal completion along the stratum.
2. Pull it to the actual Mumford-family chart supplied by the toroidal construction.
3. Apply the boundary Hodge-line identification.
4. Extract the components in the completed character-graded algebra.
5. Retain stabilizer equivariance inherited from the original section.

Lan's equation (7.1.2.3) and Definition 7.1.2.4 give this construction. The completion topology and the boundary ideal remain part of the input. An arbitrary map from a section module to a coefficient product is not an implementation of this construction.

Proposed API: `FourierJacobi.local_coeff`, `FourierJacobi.local_add`, `FourierJacobi.local_smul`. Tests: expansion of zero; the local monomial `q^n(du/u)^k`; and naturality under an `R`-linear coefficient map. The monomial test again concerns a local section, without asserting global extendibility.

The Hodge identification uses genuine etale descent on suitable formal charts, including finite-type hypotheses. The published correction to Lemma 7.1.2.1 specifically matters here.

## 2. Cone comparison and the cusp-label morphism

### Direction of the cone maps

Node: `B5/cone-compatibility`.

If `sigma1` is a face of `sigma2`, then

`sigma2-dual <= sigma1-dual`.

The smaller-cone chart is an open subchart of the larger-cone chart. Restriction preserves every existing character coefficient and inserts zero in newly allowed degrees. Therefore the expansion on `sigma1` of the same global section is the extension by zero of the expansion on `sigma2`. In particular, it vanishes in `sigma1-dual minus sigma2-dual`, not the reverse difference.

This direction follows directly from the nonnegative-pairing definition of a dual cone. A basic test is the inclusion of the zero face in the positive ray: nonnegative polynomial characters restrict to Laurent characters, with zero coefficients in negative degrees.

The source's parsed cone-comparison display needs checking against a rendered copy before literal transcription. Rendering requests failed in this session, so no apparent typesetting issue has been promoted to a confirmed source error. The packet states the direction derived from the geometry.

To compare arbitrary interior cones, import the incidence-chain result from the admissible-fan owner. Do not assume arbitrary cones are comparable. Taking the intersection of their duals gives the dual of the support cone.

### Global cusp-label expansion

Node: `B5/global-fj-expansion`.

The compatible local expansions give `FJ_Phi`, indexed by the dual of the full support cone. Its target is the fixed submodule for the **full** cusp stabilizer, including transport of degrees and coefficient sheaves. Invariance under one cone stabilizer does not itself prove this stronger invariance; transport of the universal Mumford families supplies the additional argument.

The proposed API is `FourierJacobi.coeff`, `FourierJacobi.constantTerm`, and `FourierJacobi.coefficient_naturality`. Tests are zero, comparison with every local expansion, and the noninvertible-order invariant-module test: for a trivial action of a cyclic group of order `p` on `F_p`, the invariant module is all of `F_p`. The group sum annihilates it, and division by `p` is unavailable. Neither operation implements invariant-section descent.

This does not yet prove the full non-neat Hecke-descent theorem requested by B5. It fixes the invariant-section convention needed for that theorem and prevents an invalid averaging shortcut.

## 3. Fan refinement and boundary values

### Refinement invariance

Node: `B5/fj-refinement`.

A refinement pulls back the same semi-abelian family and Hodge line. Restriction to the formal charts commutes with that pullback, so the coefficient families agree. B3's section comparison and a common refinement then identify expansions obtained using different fans.

The comparison is canonical and satisfies identity and composition; it is not literal equality of compactifications. For torsion `M`, require the section-comparison theorem in that generality. A coefficient-free degree-zero pushforward theorem alone does not establish it. Lan's Lemmas 7.1.1.4–7.1.1.5 explain the coefficient-sensitive input used by Proposition 7.1.2.9. Test `M = R/p^2`, as well as the identity and a composite of refinements.

### Constant terms

Node: `B5/constant-term-restriction`.

For the appropriate positive-cone stratum, every nonzero degree in the global dual cone belongs to its character-graded ideal. Reducing a completed section modulo that ideal therefore leaves only degree zero. This is the coefficient-to-boundary restriction theorem, not a pointwise evaluation heuristic.

There is a second step: the constant term descends from the finite cover of the lower-dimensional moduli object only because it is invariant under the full cusp stabilizer and the cover has the stated quotient. Omitting that step would repeat the issue explicitly corrected in the published erratum to Proposition 7.1.2.13.

In dimension one, the test is restriction at `q=0`. In higher dimension the constant coefficient can be a nonconstant section on a lower-dimensional moduli object. Its value at one deeper cusp does not determine whether that boundary section vanishes.

## 4. Expansion principle and recognition of coefficients

### Joint injectivity

Node: `B5/fj-injectivity`.

Use Lan's finite collection of nonempty strata meeting every irreducible component of the toroidal model. The product of the corresponding expansion maps is injective, subject to constructing the formal-faithfulness inputs in the actual coefficient generality.

The proof divides into work that must remain visible:

- Vanishing of every coefficient implies vanishing of the completed section, using the separated chart description.
- Finitely generated coefficient modules over the Dedekind base reduce to a projective summand and primary torsion summands. A projective module may be treated as a direct summand of a finite free module; it is not silently declared free.
- The free and `R/p^n` cases need formal faithfulness along the selected strata. Check component detection after the relevant base changes, and associated-component behavior over nonreduced `R/p^n`.
- Passage to arbitrary coefficient modules uses filtered finite generation and the correct section/colimit and coefficient-injection statements. It does not commute an infinite product with a filtered colimit without justification.

These formal-faithfulness leaves are **open**, not hidden in a generic assertion that completion is injective. The requested supplier is AdicSpacesPartII F0, together with the actual component behavior from the early C5 model.

The main negative test is the disjoint union of two proper connected curves. A cusp on the first component cannot detect a section supported on the second. A positive field-valued test is a smooth connected component with a nonempty detecting chart. A separate test over `R/p^2` rejects a proof that only inspects reduced fibers.

### Coefficient recognition

Node: `B5/coefficient-recognition`.

Let `M1 <= M`. If the selected expansions of a section with coefficients in `M` lie in the images of the coefficient modules with coefficients in `M1`, then the section comes from `AF(k,M1)`.

Apply the natural expansion maps to `M1 -> M -> M/M1`. Establish left exactness of both rows: this uses the flatness of the actual geometric coefficient sheaves before taking sections, as well as left exactness of products and invariants where needed. Taking global sections by itself does not make tensoring exact.

The image of the section in `AF(k,M/M1)` has zero expansion. Apply joint injectivity **for `M/M1`**, then exactness at `AF(k,M)` gives the result. The last linear diagram chase is prototyped in the suggested file. That prototype does not prove its geometric premises.

Test `M1=M`, `M1=0`, and `M=R[1/p]`, `M1=R`. The last quotient is torsion, so injectivity only for torsion-free coefficients would not suffice for the integrality application. This recognition theorem must not be replaced by an unconditional global-section base-change isomorphism.

## 5. Cuspidality

Node: `B5/cuspidal-boundary-criterion`.

For a neat smooth toroidal model with reduced relative normal-crossings boundary `D`, use B3's actual subcanonical coefficient `omega^k(-D)`. The image of its sections is the kernel of restriction to `D`, once the boundary sequence is proved exact with the chosen coefficient module.

The chart cover and the constant-term restriction theorem turn vanishing on `D` into vanishing at **all required proper boundary labels**. Over a nonreduced coefficient base, testing only geometric points is not a scheme-theoretic vanishing proof. For nonflat `M`, relative flatness and the boundary exact sequence need explicit verification.

The rank-one test is divisibility by `q`. In higher rank, a constant coefficient can itself be a nonzero automorphic form on the boundary. Koecher extension of forms does not imply cuspidality.

## Ownership, dependency order and what remains

The actual owner texts were read, not just inferred from titles. C0 supplies the shared fan/character algebra; C1 supplies cusp labels and stabilizers; C4 supplies the degeneration and relative torsors; C3 supplies refinement morphisms; B3/B4 supply coefficient sheaves and their section/analytic comparisons; F0 supplies formal geometry; SchemeAndStackFoundations SF.0 supplies the relevant quasi-coherent module operations.

**C5 requires an early/late split.** Its current README combines the good-prime toroidal construction with the integral minimal compactification. This B5 strand consumes only the former, especially Lan 6.4.1.1(5). Lan's later minimal boundary factorization uses Proposition 7.1.2.13. Importing all of completed C5 into B5 and then using B5 to complete C5 would hide a cycle. The packet records an exact early-interface request and an unresolved split; it does not claim that the atlas has already been restructured.

The Hecke strand remains open. The pinned libraries already supply `ModularForm.trace`, `CuspForm.trace`, and the prime twisted-slash comparison named in the packet baseline. In particular, the analytic trace is unnormalized. It must not be rebuilt or replaced by an average. The eventual geometric action must compare to these actual declarations and to the arithmetic normalization of the ModularForms roadmap. The exact modular-curve correspondence suppliers, the abstract Hecke-ring action, and all non-neat descent hypotheses still need their own source-level nodes.

The general Levi-valued, ramified Hilbert, integral coarse-space and analytic expansion comparisons are also open. This PEL determinant-Hodge calculation is not asserted to settle them. The suggested file checks existing names and records one typed algebraic proof interface; advanced geometric signatures and the packet's geometric unit tests remain to be written against verified carriers. This is an explicit incomplete portion of the checkpoint, not a claim of protocol-level closure.

## Sources and checking

Primary source: Kai-Wen Lan, *Arithmetic compactifications of PEL-type Shimura varieties*, revision of 14 March 2021, §§7.1.1–7.1.2, especially (7.1.2.3), 7.1.2.8–7.1.2.9, 7.1.2.13 and 7.1.2.14. The preceding revision uses book numbering. The published errata items 75–77 were consulted. Lan's example-based introduction §4.2.7 is used only for the canonical/subcanonical overview, not as a replacement for the proofs.

Source URLs, access date, exact locators and inspection limits are in the packet. No newly discovered published error is asserted. No local full-repository validator, pinned declaration-index check, global cycle check or Lean compilation was run. Repository CI results, when available, are recorded separately in the handoff and do not close the mathematical gaps above.
