# PAPER-GILLE-PARIMALA-26: semiglobal twisted flags

Codex — codex-c83e7a, issue #1197, 21 September 2026. **Partial checkpoint:** 128 items: 6 library, 4 planned, 118 missing. Nine routes cover 113 missing and one planned item exactly once. Five assertions remain unrouted under four named gaps. Every one of the 39 definitions/constructions has an API outline and three discriminating tests. No formalization or Lean compilation is claimed.

## Source and mathematical outcome

Gille–Parimala prove a local-global principle for twisted flags over F=K(X), where K is the fraction field of an arbitrary complete DVR T and X/K is a smooth projective geometrically integral curve. Let p be the residue-field characteristic exponent (1 in characteristic zero). The divisorial theorem assumes p is prime to the order of the automorphism group of the absolute root system of the adjoint group. Under this hypothesis, points over all divisorial completions imply an F-point. Only the divisorial valuations nontrivial on K are needed. The finite-patch and all-rank-one-valuations versions have no such characteristic restriction. Extension of the group to a reductive model also gives an unconditional discrete-valuations version. These are different quantified statements; none assumes that the residue field is finite or perfect, or that the group is rational.

The extraction base is the entire [HAL v5 author manuscript](https://hal.science/hal-03938963v5), dated 26 December 2025: 26 body pages plus a cover. SHA-256: `96c8678eacf39e87688b4a8f78bd27882781df367321b5887cb19fa947068303`. I read §§1–5, both appendices and references, and inspected page images for the difficult formulas. The older [arXiv v3](https://arxiv.org/abs/2301.07572v3) has 19 pages and is not interchangeable with this revision. The [publisher](https://link.springer.com/article/10.1007/s00222-026-01403-x) confirms Inventiones 244 (2026), 617–641, DOI 10.1007/s00222-026-01403-x. Its PDF endpoint returned a PDF rendering of the paywall landing page; I did not read the subscription article.

The downloaded [author errata](https://math.univ-lyon1.fr/~gille/prenotes/errata.pdf) is dated **26 May 2026**, SHA-256 `6297d7a0dd6d2ea51c04c15f201b07efd2f25b56c8a5b19d17a7c966b79eba61`. Its numbering refers to published Example 5.1(b) and Proposition 6.2; these are author Example 4.1(b) and Proposition 5.2. Unprefixed item locators use author numbering. The main author Theorem 5.4 corresponds to published Theorem 6.4; other locators must not be shifted automatically.

## Proof chain and corrections

The proof first builds type-preserving form torsors and flag schemes, then ring-valued R-equivalence and elementary subgroups. Finite algebras can be nonreduced with inseparable residue fields. Nilpotent devissage compares their R-classes with those of their residue fields; for simply connected semisimple strictly isotropic groups these are elementary quotients. The geometric definition of strictly proper tests every absolute simple factor, so B×G in G×G is a useful negative test.

Complete saturated T-modules V,W inside the branch valuation ring supply a local analytic factorization. Conjugated unipotent or quasi-trivial-torus charts turn it into elementary and R-factorizations. The flag argument uses semilocal parabolic conjugacy and field intersection; its gluing equation is h1^(-1)x1=h2 x2 when x1=h1 h2 x2. The manuscript puts an incorrect inverse on h2. Restriction of scalars along an inseparable field extension remains essential: Res H may be nonreductive, and projective flag restriction needs its own representability proof beyond the existing affine restriction owner.

The P1 diamond gives finite-model patching, then all-special-fibre-points and rank-one consequences. Completed open rings must remain distinct from completed fraction fields. In equal characteristic,

`Frac(k[x][[t]])` is a proper subfield of `k(x)((t))`.

The errata's displayed series is not an outside element: sum(t^n/x^n)=t/(x−t). A correct witness is sum(t^n/x^(n!)). For a quotient a/b in k[x][[t]], remove the common t-order and write b0 nonzero, with m=ord_x(b0). The coefficient recurrence for c=a/b gives ord_x(c_n)≥−m(n+1) by induction: every numerator coefficient has nonnegative x-order and division by b0 costs at most m. Factorial negative orders violate this bound for every fixed m. This proof also explains why a linear-growth geometric series fails as a witness.

Further recorded corrections are the integral ball |v|≤1 in Lemma 3.2; the W-variable in Proposition 3.3; the square-zero ideal m^j/m^(j+1); the assignment of Laurent coefficient parts to V and W; and using the normalizer quotient N_Aut_I(G0)(T0)/T0 rather than the generally non-finite Aut_I(G0)/T0. The analytic proof uses strict small-remainder estimates, not just a single fixed Lipschitz remainder constant. The R-factorization density step needs no claim that a product of two subgroups is itself a subgroup.

Finally, finite structure reduction, SNC spreading and tame loop torsors convert divisorial points into F_P-points. The errata requires **A=the completed local ring at P** before henselian arguments. Compare the Grothendieck valuations of the original and completed local rings by their common complete valued field, uniformizer and residue field k(P)(u). If an SNC divisor has only one local component, it may be enlarged by a second parameter for the full-parameter loop theorem: the final target is the fraction field, so this enlargement is permitted.

I directly read [Gille's published loop paper](https://doi.org/10.5802/crmath.545), pp. 159–165: its Lemma 3 and Theorems 4,6 supply finite-group loop reduction, smooth proper fixed loci and parabolic descent. These numbers differ from GP26's cited preprint. I also read GPS2021 §§3.1–3.4 for the product-compatible last unipotent subgroup and Lie spanning, Gille–Stavrova Proposition 7.7 for henselian invariance, and CGR author Theorem 1.2(b), §§4–5 for finite integral normalizer reduction. The prerequisite ledger distinguishes these targeted reads from proof interiors still requiring acquisition. The GPS errata about its separate Theorem 7.2 is not silently imported into the Lie-spanning argument.

## Existing work and routes

Atlas inputs were read at `751aa9ef42796d74ecb496388e9e5ba021c4b1d5`. Relevant full owner documents and reviewed audits were checked. No reviewed ReductiveGroups/RG2 audit is present in this snapshot. The SF and inverse-Galois audits record the exact partial foundations rather than just marking everything absent. A portfolio search found no existing semiglobal patching, loop-torsor or R-equivalence owner; unrelated derived patching and elliptic semiglobal minimal models do not cover these objects.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, I read the statements of `AnalyticAt.hasStrictFDerivAt`, `HasStrictFDerivAt.map_nhds_eq_of_surj`, `HasStrictFDerivAt.approximates_deriv_on_nhds`, `IsArtinianRing.of_finite`, `IsArtinianRing.isNilpotent_nilradical` and `IsArtinianRing.quotNilradicalPowEquivPi`. The strict submersion theorem works on complete normed spaces without a complemented kernel; F0 need not be finite-dimensional over K. At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, I read the simply connected semisimple Hopf-coordinate property and `TauCeti.Model`/`Model.IsProper`. The model carrier does not itself impose normality or projectivity. Dynamic parabolic point-subgroups do not supply general fixed-type flag representability or a Tits-index API.

The routes are:

- **SF.0:** vector schemes and the dual convention through relative Spec.
- **SF.1:** source-scoped torsor descent/extension, field-intersection descent and orbit quotients. The unverified unrestricted purity statement is excluded.
- **SF.2:** affine additive-torsor vanishing and its cohomology interface.
- **SF.4:** Artin lifting interfaces, normal models, excellent surface resolution, SNC charts and the blow-up valuation. Reuse existing Model and Artinian algebra results.
- **RG2.0a:** existing affine restriction of scalars plus smooth/etale and nonreduced-algebra comparisons; no inseparable reductivity claim.
- **RG2.0:** generalize the point-topology/chart foundation to arbitrary complete valued fields; retain compactness under its original finite-residue hypotheses.
- **IG.0:** generic-point fundamental-group surjection for normal schemes.
- **IG.1:** local tame SNC Kummer-cover machinery. This is not a new complex branch-cycle construction.
- **Reductive algebraic groups, Part II: semiglobal flags and R-equivalence:** 92 items extending the existing reductive-group direction. The brief gives all final theorems, characteristic and valuation scopes, prerequisite imports, corrections and boundary tests. Its id is `ReductiveGroupsPartIISemiglobalFlags`, parent `tauceti:TauCetiRoadmap/ReductiveGroups`, current area `grouptheory`.

FunctionFieldArithmetic is a global finite-constant-field owner; it is not the supplier for these semiglobal fields. The new continuation imports the existing group theory, geometry and restriction owners; they must not import its final arithmetic theorem, avoiding a dependency cycle. Pending homogeneous-space Brauer–Manin proposals concern number fields and do not duplicate this patching theorem.

## Open gaps and validation

**G1 — PAPER-GILLE-PARIMALA-26/37:** literal Proposition 3.3 is false with V in both derivative summands. Take V=R0, W=0 and f(v,w)=w. The displayed hypothesis holds but the restricted image is zero. The corrected W-statement is separately routed with a Banach-submersion proof. Obtain the final article to compare its wording.

**G2 — PAPER-GILLE-PARIMALA-26/55, PAPER-GILLE-PARIMALA-26/56:** optional Proposition 3.11(2) and Claim 3.12 still need exact Kaletha–Prasad/Harder/Tits hypotheses over the arbitrary residue field. Preserve the closure bar and the power in T(F1)^n⊂RT(F1). A subdirect product need not be normal; the report's item gives the open-factor-intersection repair under the required normal-subgroup theorem. This optional result is not used by the main flag theorem.

**G3 — PAPER-GILLE-PARIMALA-26/76:** the printed index directions conflict with Delta_0 as minimal-parabolic type. The corrected formula takes the smallest Gamma_F-stable subset **containing the union** of local subsets. It follows directly from the local-global theorem applied to Par_I. The smallest stable subset contained in all locals is always empty, so the printed formulation cannot be used. Compare the final article before attributing this to the published version.

**G4 — PAPER-GILLE-PARIMALA-26/90:** verify Appendix 7's general affine-quotient purity assertion by reading CTS Theorem 6.13, including any flatness/finiteness conditions. The narrowly stated flat finitely presented application is routed as a source theorem target, with the proof-inspection obligation explicit.

Additional prerequisite proof interiors listed in the JSON must be extracted before completion. The schema checker passes. Custom validation checks unique routes, stage/parent/area existence, exact five-item unrouted set, six library items, 39 API/test entries, file scope and source hashes. Exact finite checks verify the erroneous series identity, stable-subset convention, noncommutative gluing, the diagonal subdirect counterexample, and the GPS sl2 spanning test in characteristics 2,3,5,7. Finite pole-growth checks accompany the general induction above; they do not purport to prove the infinite-series theorem. No Lean file is a deliverable for this issue.
