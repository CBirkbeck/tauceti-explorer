# Independent package review: CompletedCohomologyPartII

**Verdict: accepted with the fixes in this submission.** Refs #9923. Codex,
session `codex-LM9fNF`, 16 October 2026. I did not write the package or its
input plans; the package handoff identifies its author as `codex-q26fcp`.
This report is the handoff for the review. No scratch material is needed to
continue with the upstream draft PR.

The acceptance concerns a roadmap package. Its explicit proof obligations,
including the additional supplier contracts, remain mathematics to formalize.
Elaboration of signatures containing `sorry` is not a proof of their truth.

## Scope, form and fidelity

I read WORKERS, PACKAGE_REVIEW, both protocols and UPSTREAM_GUIDE, the whole
package and author handoff, and the current upstream AlgebraicTopology and
ProfiniteArithmetic READMEs and Suggested files. The package has the required
summary, boundaries, conventions, exact interfaces, nine ordered layers,
definition APIs and discriminating Checks, worked examples and references.
The single-line metadata remains `topic = "math.NT"`.

The effective plan is the union of the whole-roadmap packet and its CC.0 and
CC.8 supplements: 68 + 5 + 12 = 85 distinct nodes. All 85 anchors and numbered
subsections survive, with layer counts 7, 5, 10, 17, 7, 9, 7, 8, 15. All 107
input API entries occur in the README after the intended namespace conversion.
No target was removed to shorten the document. I compared the hypotheses and
proof routes while reading each section; the corrections below are deliberate
repairs to the input mathematics and dependency order, not silent omissions.
Packets and supplier files were not edited.

The README and Lean contain no job identifiers, packet inventory, review
narrative, private paths, truncated targets or source passages. Their prose is
organized by the mathematics being built, rather than by the order of any
source. The source corrections give mathematical witnesses and locators.

## Corrections made

1. **1.4: geometric degree and effective deck group.** Restriction followed by
   trace uses the actual covering degree d. The other composite is the sum
   over the effective deck group Q. Identifying these with `[K:U]` and `K/U`
   requires a faithful regular cover. The strengthened condition already in
   3.8 was insufficient while 1.4 still asserted the unconditional raw-index
   identity. A trivially acting C2 on a point has trace 1; over F3 dividing it
   by 2 gives 2. At p = 2 this denominator is unavailable. The README and an
   elaborated Lean example now pin these values.
2. **4.5: tensor handedness.** The finite quotient group algebra is the right
   Lambda-module and the completed chain complex is the left module. The
   reduction formula now has `(O/varpi^m)[K_0/U] tensor_Lambda P`, inside the
   O-linear Hom. Its former reversed tensor is not defined over a general
   noncommutative Lambda.
3. **4.4, 6.3 and 6.4: coefficients occur once.** The standing tower already
   has a chosen local system. Twisting that chain model again by W_0 would
   double the coefficients. The coefficient-change comparison now starts
   explicitly with the constant rank-one model P(O), and its homology
   H-tilde_j(O); an existing W_0 model uses coinvariants directly. The
   cohomological untwisting likewise names its constant-coefficient factor.
   At a point and W_0 = O^2 the answer has rank 2, while a repeated twist has
   rank 4. A rank-one character occurs once, rather than squared. The rank
   computation is also an elaborated Lean example.
4. **7.1: integral actions.** The completed support triangle has H_int action
   for the fixed lattice. Full H action follows after rationalization and
   commensurable-lattice transport; an integral full-H statement needs the
   coherent stable lattice explicitly. The character of Q_p^times sending p
   to p demonstrates the obstruction: its inverse does not preserve O.
5. **3.1: inverse action order.** Replaced an unspecified permutation example
   by two integral shear matrices. For the first-coordinate functional and
   x = (1,0), the two orders of their inverse products give 1 and 2. This
   distinguishes the left contragredient from a right transpose action even
   at p = 2 and over ramified O. The Lean matrix example elaborates.
6. **3.11, 5.4 and 7.6: source matches.** Gee–Newton 2.1.6 is a definition,
   not a lemma; the minimal-model prerequisites now cite section 2.1.5,
   Definition 2.1.6 and Proposition 2.1.9. The Schneider–Teitelbaum abelianness
   observation follows Theorem 3.5 on p.15; Corollary 3.6 concerns simple
   objects. CE Theorem 1.16(5) is coefficient reduction and Nakamura Lemma 2.4
   is O-valued duality; neither proves the Iwasawa-Ext claim of 7.6. That
   target now cites CE section 1.3, p.6, and section 1.2, p.5 for the opposite
   action, retaining its explicit chain-pairing proof obligation G7.
   Marshall's bibliography title is corrected from SL2 to GL2.
7. **Prerequisite order.** Sections 2.6 and 2.9 are now explicitly conditional
   control theorems for a supplied admissible cochain complex with its
   reduction comparisons; 3.7 is the conditional integral UCT for a supplied
   bounded compact projective chain model, noetherian ring and strict duality.
   Layers 4 and 5 construct and verify the arithmetic instances, rather than
   being earlier prerequisites disguised as later citations. Section 3.5
   instead uses finite-level UCT and exact inverse limits of compact modules;
   kernel/image sequences for multiplication by varpi justify commuting
   reduction with that limit. Exact compact inverse limits are named in the
   L1 contract. Classical growth 5.6 does not require completed untwisting
   6.4. The torsion proof 5.7 uses the earlier derived coinvariant comparison
   4.4 and the continuous-dual leading-rank estimates, rather than depending
   on the later full descent interface 6.3 or the separate residual growth
   theorem 5.8. Removed the duplicated 5.1 prerequisite at 5.5. No numbered
   Needs link now points to a later subsection.

## Source audit

I fetched the public sources and read the passages directly. The original
17 PDFs and the additional Venjakob PDF match the fingerprints in the
author's handoff. No restricted book was used. Source identifiers below refer
to the editions and public links in the package References.

The random sample was selected and recorded before opening its passages:
5.8, 7.1, 5.7, 8.9, 3.6, 7.6, 3.12, 4.3, 7.7, 3.9, 3.17, 7.8, 2.3,
7.4 and 5.4. This table records the checked locators, including multiple
locators attached to a sampled target.

| Sampled targets | Direct source checks and result |
| --- | --- |
| 5.8 | CE Theorem 1.18, p.14. Retain the explicit regular uniform-filtration restriction and the anisotropic-filtration counterexample; no arbitrary-basis growth theorem is inferred. |
| 7.1, 7.4, 7.7 | CE section 1.5, pp.7–9, equations (1.2)–(1.4), and E06 Theorem 2.1.12, pp.26–27. Support and boundary comparisons retain their tower control and nilpotent-calculation obligations. |
| 5.7 | CE Theorem 1.4, pp.7–8, section 1.6, pp.9–11; CEbounds Theorem 3.2, pp.4–5 and proof of Theorem 3.4, p.6; Fu p.23 before (38). Torsion is distinct from concentration; use the specified congruence filtration. |
| 8.9 | GN Definitions 2.1.6–2.1.8 and Proposition 2.1.9, pp.9–10, Lemma 2.1.14, p.11. Pro-p residue detection needs the stated equivariant minimal-complex extension. |
| 3.6 | Fu equation (4), p.3 and the definition before (38), p.23; CE section 1.1 and Theorem 1.1(1), pp.2–3. Both limits precede rationalization. |
| 7.6 | CE sections 1.2–1.3, pp.5–6; CE Theorem 1.16(5), p.13; Nakamura Lemma 2.4, pp.21–22. Corrected the mismatch of duality functors as described above. |
| 3.12 | BP Remark 1.4.2, p.5; Lemmas 5.4.1–5.4.2 and Theorem 5.5.2, pp.56–57. Keep completed tensor, the invariant action and the Serre involution; the noncommutative extension remains G4. |
| 4.3 | E06 Theorems 2.1.5 and 2.1.12 with proofs, pp.22–27; GN section 2.1.5, Definition 2.1.6 and Proposition 2.1.9, pp.9–10. Finite cells and minimal-model hypotheses are separate. |
| 3.9 | Nakamura section 2.3.2, Lemma 2.4 and proof, pp.22–24; CE Theorem 1.1(3), pp.3–4. Checked torsion vanishing, Hecke adjoints and the Haar factor; retain the faithful-cover qualification. |
| 3.17 | LLHLM section 5.3, pp.121–123, including (5.8). The residual pairing uses the completed integral lattice and the specified definite setting. |
| 7.8 | BCGP Theorem 4.9.4, p.104. Non-Eisenstein boundary vanishing is an additional arithmetic input. |
| 2.3 | E06 Propositions 1.2.12 and 2.1.11, pp.16 and 24–26. The comparison is pro-systemic; it does not license deleting arbitrary lim-one terms. |
| 5.4 | E06 Theorem 2.1.5(i), pp.22–24 and Theorem 2.1.12, pp.26–27; ST Lemma 3.4, pp.14–15, Theorem 3.5 and following abelianness observation, p.15. Corrected the corollary label. |

I also checked the author's flagged additional bibliography ranges, rather
than treating the inherited bibliography as freshly verified:

| Previously unchecked locator | Check |
| --- | --- |
| E06 pp.13–19 | Definitions 1.2.1, 1.2.8 and the integral admissible/pro-system results occur in the stated section and support the strict-control contract. |
| CE pp.9–11 and p.15 | Conjectures remain labelled as such; the residual comparison on p.15 does not remove the restrictions in 5.8. |
| GN introduction pp.1–3 and Definition 3.3.5, p.18 | Checked the context and location; it supplies no unconditional general perfectness theorem beyond the stated model hypotheses. |
| CEbounds pp.1–2 | Checked the semisimple arithmetic and congruence setup used in 5.6–5.7. |
| Marshall pp.1648–1649 | Checked the end of section 5.2 and opening section 6. The paper's title is GL2. |
| Fu p.3 | Equation (4) has the coefficient and level inverse limits before the rational tensor. |
| BP pp.4–5 | Checked Definition 1.4.1, Remark 1.4.2 and the action/pairing conventions used in 3.11–3.12. |
| Nakamura pp.95–96 | Definitions B.13–B.15 and Lemma B.16 are in B.2.4. They remain a boundary deferral to R31/SR.5, not a new target here. |
| MilneSV pp.57–66 and pp.94–95 | Checked quotient/tower conventions, Examples 5.24 and 5.28–5.29 and the type A1 example. Central and coefficient descent qualifications remain necessary. |
| MilneEC p.98 | Checked the trace discussion; constructible compact-support comparison still has its separate proof obligation G10. |
| Scholze pp.1017–1020 | Checked the Hodge-type hypotheses and the fixed-exponent definition at the start of section 4.2. This does not import the perfectoid output of TC.2. |
| Pan22 published p.43 and arXiv v3 pp.47–48 | Checked Corollary 4.4.3 and Lemma 4.4.4 in both paginations, together with published pp.44–45. The inherited Tate-degree correction is consistent with the proof. |
| PanII published version | The publisher record gives Annals 203 (2026), pp.121–281, DOI 10.4007/annals.2026.203.1.3. I checked the record, not that PDF. The package cites only arXiv v1; I read its pp.118–120, including Lemma 7.2.6 and the coefficient maps. No published theorem-number correspondence is asserted. |

The package already distinguishes a source statement or outline from a
complete proof. In particular the filtered coefficient extension, classical
multiplicity estimates, canonical-model existence and constructible-support
comparison remain explicit G1, G5, G9 and G10 obligations. Acceptance does not
turn those source outlines into proofs.

## Closure, tiers and current duplication

The current read-only TauCetiRoadmap checkout is
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I searched mathematical objects,
operations, hypotheses and both coefficient conventions across the nine newer
roadmaps and the four named Completed roadmaps, as well as current library
declarations. OperatorTheory has no Suggested file in this checkout. I read
the actual completed-group-algebra and compact-module definitions and action
and finite-generation statements in the current library. No additional target
needed removal in this review.

The existing boundary receipts are correct and are retained only as
deferrals: AlgebraicTopology Stages 4–6 supply finite CW chains, cover transfer
and finite-level duality; `TauCeti.completedGroupAlgebra` and its Basic API
supply the ring, projections and density; `TauCeti.IsCompactModule` and
`IsCompactModule.completedGroupAlgebraModule` supply the generic compact
action. The current declaration
`IsCompactModule.module_finite_completedGroupAlgebraModule_of_dense_closure_univ_smul`
already supplies generic compact-module finite generation. Sections 3.4 and
5.1 retain only the arithmetic two-index comparison and arithmetic finiteness
application. Discrete ProfiniteCohomology remains distinct from compact
completed-coefficient descent. These post-pin declarations are boundary
receipts and are not imported into the pinned Lean file.

I checked the supplier tiers against CaraianiNewton: the roadmap is tier 12;
ALS and ModularCurves are tier 11, P7/P8 tier 10, ArithmeticGaloisDuality tier
8, ComplexComparison tier 5, EnhancedDerivedSheaves and LocallyAnalytic
Distributions tier 4, and the other named foundational suppliers are lower or
current Tau Ceti roadmaps. The former outside-order equivariant-Iwasawa
inputs are owned narrowly in 0.1, 3.11, 5.1, 5.5 and 5.8. Later Shimura,
Hilbert and six-operation roadmaps consume the narrow targets 0.6–0.7 and
8.1–8.3 rather than supplying upward prerequisites. There are no `UPSTREAM:`
or FoundationsAndLibraryIntegration dependencies.

The additional L1 strict/dual/compact-limit contracts, enhanced Rlim and
completed descent in ArithmeticGaloisDuality, noncommutative P7/P8 models,
equivariant IHG.2 image/ghost statements and derived analytic vectors are
expressly additional supplier obligations. Their ordinary commutative or
discrete statements do not already prove these stronger clauses. G12 retains
the effective central kernel and the qualified change-of-rings requirement;
there is no promise of perfectness for an ineffective full-group action.

## Definition tests and adversarial mathematics

I checked every numbered subsection, including definitions embedded in
construction targets. The 23 explicit definition API lists each have at least
four Checks, and 5.5 adds a grade/dimension API with five Checks. Every
definition has at least three discriminating cases: a computed or nonzero
example, a degenerate or zero case, and a comparison or counterexample to a
plausible wrong construction. Examples distinguish inverse from direct action,
completed from algebraic tensor, finite-level reduction from integral
reduction, and a residual factor from a characteristic-zero eigencharacter.
The following table records the mathematical pass over all 85 targets.

| Statements and conventions checked | Instances and resulting restriction or change |
| --- | --- |
| 0.1–0.7 | Trivial group and dimension zero; p = 2 requires the U^4 powerful convention; point torsor, degree-p circle cover, non-neat stabilizer, complex orientation and finite Tate twist. Keep the actual support and coefficient diagram. |
| 1.1–1.5 | Zero and constant colimits, pullback along a degree-p circle cover, lattice transport outside H_int, ineffective C2 point. Corrected the raw-index trace assertion; no division at p. |
| 2.1–2.10 | O and E in degree zero; the two-term differential varpi; the null-sequence diagonal differential varpi^n; non-ML kernels. Preserve adjacent torsion and lim-one, require complete terms, and distinguish compatible roots from membership in every varpi-power image. Conditional model hypotheses are now explicit. |
| 3.1–3.7 | O, O/varpi, zero, continuous versus algebraic dual, pointwise versus uniform topology, the circle tower and two noncommuting shears. Added the computed inverse-order witness; integral UCT retains torsion and finite-coefficient UCT uses exact compact limits. |
| 3.8–3.10 | Identity cover, faithful prime-to-p torsor, p-cover, ineffective central action and p = 2. Cover indices in Haar normalization must be genuine degrees and units. Keep support and Hecke adjoints. |
| 3.11–3.17 | Pro-p K and a finite quotient with an element of prime-to-p order; its averaging idempotent is nontrivial. Zero module, scalar coefficient, infinite product and opposite actions. Localness does not imply projectivity; completed tensors and BP involution remain explicit. |
| 4.1–4.7 | Faithful finite torsor, circle differential gamma−1, relative boundary pair, ineffective central kernel and complete torsion-free M. Corrected the quotient-right/chain-left tensor; distinguish a perfect complex from projective homology. Rank-two coefficient model must be twisted only once. |
| 5.1–5.9 | U = 1, U = Z_p, zero and residual modules; ramified O, p = 2 and anisotropic filtration of Z_p^2. Integral dimension is d+1, residual d; use varpi, restrict rank to uniform domains, require nonzero M and d>0 for growth, and retain coefficient-extension G1. Growth is along the specified filtration. |
| 6.1–6.7 | Circle Tor, degree zero, W_0 = O^2 and a nontrivial character; Q_p versus F_v analytic vectors. Corrected repeated coefficient twists; continuous completed Tor is distinct from discrete Tor, and an analytic spectral sequence is weaker than the derived comparison G6. |
| 7.1–7.8 | Compact quotient, open curve boundary, zero/identity support maps, dense Z in Z_p, O/varpi at local dimension zero and opposite action. Interior is an image, with a kernel-system obstruction to interchanging limits. Corrected integral H action and the Iwasawa-Ext locator; G7 retains orientation and grading. |
| 8.1–8.6 | Split real centre, compact S1 fibre, Hilbert units, definite degree-zero functions, finite real components and p = 2. Keep compact-support shifts and effective deck groups; no component averaging when its order is not invertible. Scholze fixed exponent precedes integral completion. |
| 8.7–8.15 | Trivial and sign actions, sign at 2 before/after reduction, noncommuting actions, zero/identity idempotents, finite product rings, congruent characteristic-zero characters and a bounded two-term complex. Require open point stabilizers, compatible projectors and a uniform ghost exponent; no arbitrary localizing ideal or unrelated Hecke-image equality is substituted. |

The arithmetic standing coefficient ring is the integers of a finite
extension of Q_p, including ramified extensions. Equal-characteristic DVRs
are not arithmetic instances. The separately registered algebraic clause of
2.5 is general over a commutative ring and regular element with complete
terms, exactly as its Lean statement says. Zero rings/modules and the empty
residual support are permitted by the native inverse-ring signatures; they
do not manufacture an arithmetic eigenlabel. Every normalization denominator
is confined to invertible pro-order or to rational coefficients.

## Lean and validation

`Suggested.lean` has 470 lines. It contains native carriers and real-bodied
light definitions, representative theorem signatures, examples and a closing
list of README-only objects. It does not construct arithmetic towers, sites,
completed tensor theories or sorry-backed data. Every README definition is
represented by a declaration or the closing list.

I checked these signatures against the README, in addition to all retained
light definitions: `homology_hom_away_eq_zero` (2.5),
`interiorSubmodule_closed` (7.5), `transportedAction_projection`,
`transportedAction_unique`, `transportedAction_commute`,
`transportedAction_jointlyContinuous` (8.7), `completedHecke_semilocal` and
`completedHecke_decomposition` (8.11), `residualProjector_existsUnique` and
`residualProjector_factor` (8.12), and `completedLocalization_split`,
`completedLocalization_closed`, `completedLocalization_complete` and
`completedLocalization_algebraic` (8.13). Compactness/Hausdorffness, finite
surjective ring transitions, radical kernels, open stabilizers, idempotence,
completeness and the supported maximal-ideal condition are present in the
appropriate signatures. There is no `True` placeholder, sorry-valued
predicate or hypothesis containing its conclusion.

- `lean-check` on the package Suggested file: exit 0 at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`; only `declaration uses sorry`
  warnings. All three added negative controls have proofs and elaborate.
- `scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- `scripts/check_blueprint.py` on each of the three unchanged input packets:
  exit 0, zero errors and zero warnings.
- Mechanical coverage, internal-anchor, API-name and forward-Needs checks:
  85 unique targets, 107 API entries retained, no broken anchor or forward
  numbered prerequisite.
- `research/blueprint/intake.py check-files` on the package files and this
  report: zero problems; `git diff --check`: clean.

No unresolved package defect remains. The next step is the upstream draft
port with these fixes and the explicitly stated proof and supplier
obligations intact. No packet correction or source file is included here.
