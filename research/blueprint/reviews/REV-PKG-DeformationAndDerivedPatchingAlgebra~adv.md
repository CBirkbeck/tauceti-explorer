# Independent package review: DeformationAndDerivedPatchingAlgebra, Part I

Issue: [#10067](https://github.com/CBirkbeck/tauceti-explorer/issues/10067). Reviewer: Codex, session `codex-0y686h`, 2026-10-16. The package author was Codex session `codex-JCneCV` (#10011, PR #10021); this is an independent review. The claim was confirmed in [the bot reply](https://github.com/CBirkbeck/tauceti-explorer/issues/10067#issuecomment-6224955086). Only this job was taken.

**Verdict: needs_changes.** This is a completed fixing review. The corrections below are applied to the package. Four remaining source or formulation defects are identified precisely below; the package is not ready for an upstream draft. Elaboration does not establish the truth of a sorry-ended theorem.

## Remaining defects

1. **General DVR diagonal comparison (§4.5).** The published proofs now checked establish the arithmetic case: integer rings of finite extensions of `Q_p`, and the diagonal calculation over finite characteristic-p fields. The coefficient-lifting map is now justified in §1.10, but that alone does not prove a diagonal completion isomorphism. Extending §4.5 to arbitrary complete DVRs needs an exact statement with residue-field hypotheses and a primary proof. A naive inseparable extension is false: for `L=K(a^(1/p))`, `L⊗_K L=L[ε]/ε^p`, whose diagonal completion is not L. The verified targets have been scoped to their actual hypotheses, and the broader request remains explicitly marked as a gap. Do not remove the separability control when extending it.
2. **Stable-cohomology proof input (§3.2).** Avramov–Iyengar, Theorems 2.1 and 2.4, pp. 2–4, and their reduction were checked. Their input is Martsinkovsky, Theorem 6, *A remarkable property of the (co)syzygy modules of the residue field of a nonregular local ring*, J. Pure Appl. Algebra 110 (1996), pp. 9–13. Its primary proof was not obtained. Supply and read that proof, or supply an independent construction of the stable-cohomology comparison used for the Lescot criterion and its finite-projective-dimension module variant. The README no longer presents a cotangent-complex supplier as a proof of it.
3. **Mixed-characteristic multiplicity one (§3.13, originally §3.14).** Stone Theorem 16, p. 20, states a general formally-unmixed theorem but its displayed proof assumes a coefficient field. The field-containing implication and the characteristic-free forward implication from regularity are retained. A primary proof of the converse in formally-unmixed mixed characteristic is still required for `multiplicityOne_regular`; the equal-characteristic argument cannot fill it. No uncleared book copy was used to conceal this gap.
4. **Calegari–Geraghty correction (§8.6).** Theorem 6.3 and its construction, author journal-layout PDF pp. 90–93, were read. The correction is bibliographically identified as Invent. Math. 227 (2022), 855–856, DOI `10.1007/s00222-021-01095-5`. Its contents were not accessible in the sources read. In particular the author's claim about corrected items (1),(10) has not been verified. Compare the coefficient ranges, original-level actions and all framing-quotient actions in §8.6 against that correction; adjust the exact patch datum if necessary. Supplying nonflat quotient actions as input avoids an invalid base-change inference but does not establish agreement with the corrected theorem.

These are not requests to re-plan implemented mathematics. Each gap is visible at its point of use. The downstream generalizations depending on a gap inherit it.

## Review scope and corrections

Read the whole nine-layer package, its Suggested.lean and metadata, the accepted assembly and its handoff, the eleven packet inventories, the author handoff, PROTOCOL §§3–15 and 20, PACKAGE_REVIEW and UPSTREAM_GUIDE. The inputs comprise 1,096 node rows, 871 API entries and 735 tests, including refinements of the same objects. Compared their mathematical families with the package rather than making one new Lean declaration per row. Read LocalGaloisGroups and ProfiniteArithmetic as upstream models and inspected the exemplar's form. The final README has 87 numbered subsections: the duplicated Matlis subsection was deleted, and original §§3.8–3.16 are now §§3.7–3.15. No packet was edited.

The principal applied corrections are:

- Replaced fictional broad supplier promises with the actual current DerivedModuleAlgebra, SchemeAndStackFoundations, Part II and ArithmeticGaloisDuality contracts. Added the missing regular-local maximal-depth freeness target **before** Auslander–Buchsbaum, with a parameter-induction proof independent of AB. The field and finite-residue cases are included.
- Restricted descent of existence of a generating regular sequence to faithfully flat local maps of Noetherian local rings. Added the nonprincipal invertible ideal `(2,1+√(-5))` in `Z[√(-5)]` as a counterexample to unrestricted descent along a finite localization cover.
- Defined `CompleteSocleObstruction` for every finite-dimensional socle kernel and every linear pushout, including zero. The one-dimensional interface in the actual scheme-foundations supplier does not imply this stronger datum. The hull bound now requires this datum and its presentation instance explicitly.
- Closed the prescribed Cohen-map gap using Stacks Lemmas 10.160.6–10.160.7 and the proof of Theorem 10.160.8: lift compatible `C/p^n→R/m^n` and take the limit. Added the noninjective `C→C/p²` check. Existence of a Cohen-to-Cohen embedding alone is not the proof.
- Replaced duplicate abstract local-cohomology and dualizing constructions by the new top-degree tensor/nonvanishing comparisons, chosen Q-free Cohen dualizing representatives, and the **noncomplete bounded-complex** local-duality comparison. The latter retains completion on the dual side; abstract normalization and the complete-local theorem remain imports.
- Added the actual local CI parafactorial theorem, with its dimension-four threshold, from SGA 2 XI, Theorem 3.13(ii), new p. 105, old p. 132; corrected Lemma 3.15 to new p. 106, old p. 133. Picard carriers do not supply this theorem. A three-dimensional node is a negative control.
- Replaced the unverified diagonal-map inference by explicit local-field diagonal and mixed-characteristic comparison leaves, with actual maps, using Böckle–Juschka and Böckle–Iyengar–Paškūnas. Restricted their scope and added the inseparable diagonal counterexample.
- Verified and spelled out the three patched cotangent image comparisons: a uniform valuation bound for completion-kernel images, a uniform generator bound for products of ideal powers, and the finite-module diagonal surjection. Corrected the Newton–Thorne citation to published Lemmas 4.16–4.17, Proposition 4.18 and Lemma 4.19, pp. 1955–1957.
- Closed the finite capped connectedness gap using Stacks Lemma 52.14.1 (0ECR), whose nonempty-connected convention includes deletion of the whole spectrum. For an irreducible space its c is the dimension; otherwise c is at most the smallest component dimension minus one. Combined this with `cd≤ara` to obtain the bound in the stated normalization.
- Removed generic derived tensor/Hom, perfectness, pseudo-coherence, Tor-amplitude, finite-projective-interval criterion, strict linear Milnor/completion towers and perfect-system effectivity from local ownership. Kept finite-order approximation, actual minimal representatives, tower **actions** and finite derived-Hom completion, stating how each differs from its supplier.
- Supplied the arbitrary cofiltered finite-module inverse-limit exactness proof via exact Matlis duality, exact filtered colimits, and finite-module biduality. This requires completeness, but not a finite residue field or an unconstructed topological carrier.
- Added `derivedRightEdge`, defined by the canonical smart-truncation triangle, natural for every derived morphism and derived idempotent. Strict spectral-sequence actions alone do not give this naturality.
- Added the exact `finiteActionCanonicalDuality` contract through `B=R/ann_R M`, finite over S by the faithful finite-action theorem. Finite-local normalization and adjunction identify the two duals; no finiteness of the whole ring R over S is assumed. Computed `d-r=b-a` and the canonical-dual degree.
- Replaced scalar restatements of the cone sign by a two-by-two differential matrix equation and its failing unsigned control, both proved in the statement file. Removed duplicate Lean depth/Matlis/interval declarations and rewrote the concentration signatures using an actual native finite-projective representative in the stated interval.

The bibliography now distinguishes versions and publication pagination, including the correct Paškūnas–Quast DOI `10.1017/fmp.2026.10030`. Renumbering was checked separately from source theorem numbers; Gee 3.13, Exercise 3.11, PQ 3.9, BIP 3.14 and Stacks Formal Deformation Theory Lemma 3.8 retain their source numbers.

## Current upstream ownership audit

The supplied read-only TauCetiRoadmap checkout was `0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Also read the pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` declarations used. No lake operation ran in the read-only checkouts.

Searched by carriers, quotient formulas, depth hypotheses, duality maps, completed towers, differentials and generator data, not only proposed declaration names. Inspected all nine post-snapshot roadmaps (AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic, RealAlgebraicGeometry) and Completed/ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. Their vector-bundle, local-field, group, topological and determinant interfaces are imports; no matching additional local patching target was found there.

The local snapshot does not contain several recently ported supplier documents. Read individual current upstream files through the GitHub API, without cloning or copying a repository: SchemeAndStackFoundations on main (`cc8501ac47d864b56634cb1ba6094197bf60e6b7` at inspection); DerivedModuleAlgebra [PR #944](https://github.com/TauCetiProject/TauCetiRoadmap/pull/944), head `d62d8b669082eb6b0998fc4aaef1346f550ee306`; Part II [PR #872](https://github.com/TauCetiProject/TauCetiRoadmap/pull/872), head `b70ca3fcc03df55906eed9dea53394b585e62303`; ArithmeticGaloisDuality [PR #858](https://github.com/TauCetiProject/TauCetiRoadmap/pull/858), head `72ea6c6c80bb9430f05f37b02b64a957bf93bf9f`. Open PR contracts are planned imports, not library implementation claims. Part II's foundational K0/K3 inputs are independent of Part I; its references do not introduce a reverse Part-I prerequisite. DerivedModuleAlgebra is now a foundational supplier in the current upstream arrangement; the stale SR0d/E2/DD1 module-owner references were replaced.

| Removed local ownership | Actual owner | Additional target retained |
|---|---|---|
| Module depth definition, residue Ext/depth and abstract CM/Serre predicates | SchemeAndStackFoundations §0.17 | Minimal finite resolutions, AB, regular-local maximal-depth freeness and finite-action comparisons |
| Entire original §3.7: residue injective hull, completion action, finite/Artinian Matlis equivalence, biduality | DerivedModuleAlgebra §§1.M.1–1.M.2 | Explicit DVR fraction-quotient dual comparison, signed finite representatives and inverse-limit application |
| Generic supported derived cohomology, Čech comparison and CM concentration criterion | SchemeAndStackFoundations §2.7; Part II §§K0.1, K0.4–K0.5 | Top-degree nonvanishing/tensor comparison and grade/local-depth adapter |
| Abstract normalized affine dualizing complex, normalization and finite-map adjunction | SchemeAndStackFoundations §§2.18–2.21 | Chosen Q-resolution comparison and noncomplete bounded-complex local duality |
| Complete-local bounded-finite-complex local duality and noncomplete finite-module local duality | ArithmeticGaloisDuality D7.1; Part II K0.7 | Noncomplete bounded-complex extension, with completion retained |
| Ordinary Rees module construction and monomial action | Part II K3.1 | Quotient by degree-zero I giving the ordinary associated graded module and its coordinates |
| Generic native derived tensor/Hom, K-flat models and symmetry | DerivedModuleAlgebra §§0.2, 1.1.1 | Homological/cohomological Tor indexing adapter and signed chosen-representative comparisons |
| Perfect/pseudo-coherent predicates, all-module amplitude, closure API and residue finite-projective interval criterion | DerivedModuleAlgebra §§1.E.0–1.E.1 | Finite-order approximation `IsMPseudoCoherent` and actual minimal-chain cancellation |
| Linear lim/lim¹, Milnor sequence, strict ordinary quotient completion | DerivedModuleAlgebra §1.T | Compatible tower chain actions, descended homotopies and action comparison |
| PerfectSystem, compatible based models and perfect-system effectivity | DerivedModuleAlgebra §§1.E.0–1.E.1 | Completeness of finite derived-Hom modules, finite selection and patching of specified action diagrams |
| Generic syntomic/localization charts and smooth comparison | Current Tau Ceti `RingTheory.Syntomic.StandardSyntomic`, `.Smooth`, `.Localization` | Continuous formal regular-presentation versus algebraic lci comparison |

Existing regular-local domain/quotient/DVR theorems, Rees and homogeneous quotient grading, finite-length quotient results, adic evaluation, finite derived Hom, ghosts and idempotent splitting already deferred by the author remain deferred. The explicit syntomic object read was `Algebra.IsStandardSyntomicOfRelativeDimension`, with its finite presentation, base-change and presentation constructor; it is not a substitute for a continuous formal-series comparison. No removed subsection leaves a layer stub or a duplicate target list.

## Flagged-source audit

These ten rows correspond to the author's ten outstanding-interface groups. A construction target needs a source and prerequisite route; it need not already be implemented. Each resolution below is an actual stronger contract, a new named proof leaf, or a scoped statement.

| Author group | Primary statement / pages checked | Outcome |
|---|---|---|
| Multiplicity one | Stone Theorem 16 p. 20; Hochster April 17–18 pp. 165–169 | Mixed-characteristic converse remains defect 3; parameter Euler/equality proof is verified |
| Capped connectedness | Thorne Definition 1.7/Proposition 1.8 p. 8; Stacks 0ECR, full proof | Closed using the finite convention and `min(c,d-1)≥c-1` |
| Lescot / stable cohomology | Avramov–Iyengar Theorems 2.1, 2.4 pp. 2–4 | Exact missing primary input is defect 2 |
| Cohen / diagonal | Stacks §10.160 full lifting proof; Anscombe–Jahnke Theorem 4.1 pp. 8–9, Corollary 6.5 p. 14; BJ Corollary 3.3.4/Lemma 3.3.5 pp. 17–19; BIP Lemmas 3.35–3.37 | Coefficient lifts closed; arithmetic diagonal verified; general DVR extension is defect 1 |
| Full-socle obstruction | KW II Lemma 4.6 proof pp. 43–45; Gee Lemma 3.13 p. 13; Stacks 07YG/07YI | Added the higher-dimensional datum rather than falsely importing a one-dimensional interface |
| Geometric CI suppliers | Current syntomic source; SGA 2 XI 3.13(ii), pp. 105, 107–108; Lemma 3.15 p. 106 | Imported actual carriers/charts; parafactoriality is a new theorem here, with its proof source |
| Cotangent images | Newton–Thorne published Lemmas 4.16–4.17, Proposition 4.18, Lemma 4.19, pp. 1955–1957, including proofs | Added all three image leaves with uniform valuation and generator hypotheses |
| Native heavy comparisons | DMA §§1.E, 1.M, 1.T; Stacks 064Q, 0656, 0922, 012W/0132; CG Lemmas 7.5–7.7 | Removed already-owned targets; exact Matlis proof supplies arbitrary cofiltered finite-module exactness; finite Hom and coefficient filtration retain their proof routes |
| Genuine action / duality | IKM Theorem 10.6 proof pp. 44–47, Lemma 10.7 pp. 47–48, Theorem 11.3 pp. 50–51; actual SF finite-local duality | Genuine action remains an explicit input. Added finite-action canonical-duality leaf through B; no upward action/finite-ring assumption |
| Derived right edge | Stacks 061Y, 012W/0132; native t-structure and derived tensor contract | Added canonical smart-truncation proof and all-derived-morphism equivariance |

## Random source sample

A reproducible sample used `random.Random(10067).sample` on the original ordered 88 subsection headings after excluding the 13 subsections participating in the ten flagged groups: `1.10, 1.16, 2.3, 2.5, 3.2, 3.14, 4.5, 5.8, 6.6, 6.9, 7.8, 9.3, 9.7`. The resulting 15 subsection IDs, in draw order, are below. The unit of sampling was a subsection locator family; where it has several locators the ones supporting its construction were checked. Section numbers in this table are original numbers, so original §3.15 is final §3.14.

| Draw / subsection | Locator checked | Result |
|---|---|---|
| 1 / 5.5 | CG Proposition 2.3 and proof, PDF pp. 11–14 | Numerical dimension and depth conclusion require the actual square presentation and `M≠0` |
| 2 / 5.7 | Kisin Proposition 3.3.1/Lemma 3.3.4, pp. 1157–1159 | Generic projective faithful conclusion, not integral faithfulness |
| 3 / 5.3 | CG Proposition 2.3 construction, PDF pp. 11–14 | Cofinal two-index cutoffs and diagonal extraction checked |
| 4 / 7.2 | Stacks 064Q/064N/064V/064X, 0651, 0658/0656 | Finite-order approximation retained; generic perfect/amplitude interval target deleted as already owned |
| 5 / 6.8 | LLHLM Lemma 3.6.13, pp. 70–71, Corollary 3.5.5 p. 39 | Four minimal components, variable change and monomial cycle checked |
| 6 / 9.6 | ACC Proposition 6.3.8, pp. 1052–1053; Proposition 6.4.17, pp. 1060–1061 | Primary cleared copy read: a local nonzero seed and top components, not arbitrary full support |
| 7 / 8.6 | CG Theorem 6.3, PDF pp. 90–93; correction metadata | Original construction checked; corrected input remains defect 4 |
| 8 / 3.5 | Paškūnas–Quast Proposition 3.9, p. 22; Stacks 02JN | CI statement and CM parameter/flatness route distinguished |
| 9 / 8.2 | ACC §6.4.1, pp. 1053–1054 | Cleared primary copy read; chain models, ring maps and reductions are specified input |
| 10 / 7.6 | BCGP21 Lemmas 7.8.5–7.8.6/Remark 7.8.7, author pp. 213–214 | Adjoint cokernel, field and E/O dual comparisons checked; no arbitrary-DVR Pontryagin assertion |
| 11 / 2.1 | KW II Lemma 4.4, pp. 41–42; Schlessinger Notation 2.6/Theorem 2.11, pp. 211, 213–214 | Minimality is relative to coefficients; coefficient-linear relation permitted |
| 12 / 4.4 | BIP Lemmas 3.14, 3.17–3.20, pp. 16–19; PQ Lemma 14.2/Remark 14.3, pp. 72–73 | Arithmetic coefficient and closed-fibre meeting assumptions retained |
| 13 / 5.1 | CG Definitions 2.1–2.2, PDF p. 11 | Balance means a square presentation, with no injectivity requirement |
| 14 / 3.15 | Stacks Lemma 47.20.4 (0EHS) and Lemma 51.17.6 (0EC0) | CM-open and F-finite Frobenius criteria checked; syntomic predicate deferred |
| 15 / 6.4 | CG Theorem 6.4, PDF pp. 93–94; Kisin Lemma 3.3.4 | Nilradical conclusion distinguished from the faithfully flat integral quotient identification |

Additional proof readings included KW relation tests, Hochster's top local cohomology and Koszul Euler arguments, CG initial-form counterexample, IKM action/duality, BJ's local-field diagonal, and the new Stacks proof leaves. The source-access failures are recorded as failures, not successful verification. Public URLs and the exact bytes downloaded are identified below. Cleared ACC, EGA and Pilloni sources were read only in the maintainer's library; no file or source passage from them was copied into scratch or the repository. This report and the roadmap contain original mathematical formulations, not excerpts or a paper's section-by-section summary.

## Adversarial mathematics pass

The row unit is an original mathematical subsection, including its definitions, API equalities, hypotheses and conventions. This covers all 88 original subsections, including the deleted one. Several rows share test objects because their comparisons must agree. The table records mathematical calculations; the Lean file separately pins the light native signatures and key negative controls. `Retained` means the checked scope survives, not that a proof has been formalized. Original section numbers are used to keep the audit stable across deletion and renumbering.

| Original subsection / statement family | Instances and calculation | Result / applied change |
|---|---|---|
| 1.1 ordinary adic graded algebra | I=0 has only degree zero; I=A gives zero pieces; DVR π-class squares into degree two | Retained quotient by the degree-zero I-action, not the Rees algebra itself |
| 1.2 generators and coefficient transport | Identity; reduction modulo π; ramified extension; cusp t⁵ lies in the extended square but not the original square | Kept actual image-ideal hypotheses; injectivity of rings is insufficient |
| 1.3 graded module coordinates | M=0; A/(x²) has pieces k,k,0; I=A gives zero | Imported Rees module from Part II; retained the degree-zero quotient and its coordinates |
| 1.4 homogeneous recurrence | Multiplication by X on k[X]; zero multiplication; quotient k[X]/X² | Kernel enters with opposite sign to cokernel; degree-zero term retained |
| 1.5 initial ideals and generators | x²+x³ has initial x²; zero kernel; unit-ideal completion is zero | Completeness and separatedness remain necessary for successive correction |
| 1.6 labelled coefficient comparisons | Identity residue label; nontrivial field automorphism; k[x]_(x) is incomplete | Arrows retain residue equation; locality alone does not preserve labels |
| 1.7 small extensions | Z/4→F₂ is small; Z/8→F₂ is not; identity has zero kernel; two-dimensional socle is not principal | Nonzero principal socle condition agrees with the native Lean predicate |
| 1.8 truncations and towers | n=1 is the residue field; n=0 quotient is zero; increasing embedding dimensions | Positive-index truncations and uniform finite cotangent condition retained |
| 1.9 cotangent presentations | O→O has no relative variables; dual numbers have one; variable sent to a unit is not local | Relative denominator includes the coefficient maximal ideal |
| 1.10 coefficient choices | C→C/p² is noninjective; Z_p is strict; ramified p=uπ^e is not; k[[x]]→K[[x]] preserves maximal ideal | Closed the torsion-target lift by truncated smoothness; no perfect-imperfect Witt identification |
| 1.11 formal smooth lifts | Identity and a series variable lift; k[t]/t³→k[t]/t² obstructs the dual-number point; p=2 does not kill t² | Lifts are chosen and need not be unique |
| 1.12 complete-local tensor | One factor is Λ; two one-variable factors give two variables; finite dual-number factor; uncompleted tensor | Retained joint presentation and coefficient maps |
| 1.13 flat completion | I=0 identity; I=A zero completion; flat infinitely generated polynomial algebra | No Noetherianity of the auxiliary flat algebra inferred; faithful conclusion requires its extra fibre condition |
| 1.14 quotients and finite factors | Quotient by π²; unit ideal gives zero; finite product splits; Z_(5)[i] can split after completion | No claim that a domain remains a domain after scalar completion |
| 1.15 pro-comparison and cofinal powers | O/π gives stabilized Hom; empty generating list gives zero ideal; x^(n-1)y^(n-1) survives below exponent 2n-1 | Kept cofinal indices, not same-index equality or surjective Hom transitions |
| 1.16 completion maps and source squares | k[x]_(x)→k[x,y]_(x,y) has completed fibre k[[y]]; quotient map; inseparable field map; x→0 needs an enlarged regular source | Retained actual square and continuous lifts; no separability hypothesis inserted |
| 2.1 minimal presentations | R=Λ; R=k over a DVR has coefficient relation π; redundant variable creates a linear relation | Relative minimality retained, not J⊆m² absolutely |
| 2.2 relation space | J=0; J=(X²) has dimension one; (X,Y)² has dimension three, also over F₂ | Retained J/mJ rather than J/J² |
| 2.3 complete obstruction | No relation gives zero; X² at a square-zero lift; coefficient relation π; redundant variable changes lift values | Added all-finite-socle obstruction datum and every linear pushout |
| 2.4 universal relation test | Empty relation space; one quadratic relation; two independent socle relations | Finite quotient must preserve all relation classes; no arbitrary section is canonical |
| 2.5 hull equation bound | Identity hull; zero relative tangent; one quadratic relation; residue algebra over O | CompleteSocleObstruction is an explicit stronger hypothesis |
| 2.6 matrix equations | Trivial group; rank zero gives trivial matrix group; rank one C₂ in characteristic two gives x²=0 | Fixed-basis quotient retained; p=2 is not discarded |
| 2.7 continuous framed functor | Trivial profinite group; finite cyclic group; rank zero; groups without assumed finite generation | Continuity and finite-generation conditions remain input |
| 2.8 nonunique automorphisms | Principal units act trivially at first order; nonzero parameter has a nontrivial orbit; zero parameter fixed | Hull retained without an unjustified prorepresentability claim |
| 3.1 finite resolutions/depth | Field modules are free; DVR residue has pd=1; singular hypersurface has infinite residue pd; M=0 | Removed owned depth definition; added maximal-depth freeness before AB |
| 3.2 regular homological criteria | Field gives nonzero Ext⁰ map; DVR gives Ext¹; singular hypersurface excludes finite residue pd | Statements retained; stable-cohomology primary input explicitly unresolved |
| 3.3 finite actions/flat fibres | R=S finite identity; R=S[[t]] acting on S by t=0 is not faithful; zero module; unequal fibre dimensions | Finiteness uses a faithful finite module, with nonzero local hypotheses for depth |
| 3.4 regular ideals and CI | Empty list; unit ideal excluded; (x²,y²) regular; repeated x fails; nonprincipal Dedekind ideal trivializes fpqc | Fixed unrestricted descent to Noetherian local maps; retained explicit global counterexample |
| 3.5 dimension/equation criterion | Field quotient; regular formal series; codimension-one hypersurface; extra relation at fixed dimension | CI source and CM parameter route distinguished; flatness requires exact dimension assumptions |
| 3.6 symbolic squares | Zero prime in a domain; maximal prime gives ordinary square; element outside p cannot lie in symbolic square | Localization-contraction formulation retained; ordinary square is not substituted at other primes |
| 3.7 Matlis objects | Field finite-dimensional bidual; infinite vector space not reflexive; incomplete DVR dual gives completion | Deleted subsection and Lean Matlis goal: DMA owns the same objects and comparisons |
| 3.8 supported cohomology | Field top degree zero; DVR E/O in degree one; node top class survives; tensor with k kills its top group | Replaced owned generic construction by top nonvanishing/tensor/grade adapters (final 3.7) |
| 3.9 normalized duality | Identity field presentation; DVR normalized shift [1]; regular hypersurface decreases shift; incomplete DVR needs completion | Kept chosen Q-chain and noncomplete bounded-complex variants only (final 3.8) |
| 3.10 canonical modules/type/trace | Field type one; non-Gorenstein Artin example; trace of A is A; torsion over domain has zero ordinary trace | Canonical module requires stated CM condition; trace split-summand criterion retained |
| 3.11 abelian group-ring CI | Trivial group gives O; cyclic p-group has (1+X)^p-1; p=2 reduction is X²; rank-zero factors | Finite group algebra equation and Gorenstein comparisons retained |
| 3.12 cumulative Hilbert polynomial | Field gives constant length one; DVR gives n+1; zero gives zero; two-variable regular ring has binomial(n+2,2) | Cumulative exponent n+1 and factorial convention agree with Lean |
| 3.13 multiplicity comparisons | Zero; finite-length summand in dimension one; finite residue extension rescales length; completion preserves lengths | Intrinsic and ambient dimensions kept separate; residue-degree factor retained |
| 3.14 parameters/initial forms | π^r has length r; cusp u regular but initial u nilpotent; x=0 fails equality; finite residue field lacks generic linear choice | Parameter Euler source verified; mixed-characteristic multiplicity-one proof still missing |
| 3.15 Frobenius/local loci | Perfect field; regular F-finite DVR; singular dual-number Frobenius not flat; finite-type syntomic chart | Deleted generic syntomic predicate; retained formal versus algebraic comparison (final 3.14) |
| 3.16 plane jets | Order four gives initial lengths 1,3,6; n=0 eventual expression is -2; zero equation excluded; one/two variable counts | Positive-order and postulation correction retained (final 3.15) |
| 4.1 residual finiteness | Identity; finite closed fibre; positive-dimensional series fibre; zero quotient | Complete source and Noetherian local target retained; no finiteness from the infinite fibre |
| 4.2 integral points | Finite O-algebra with nonnilpotent π; π-nilpotent quotient has empty generic fibre; ramified finite extension | Algebraic point precedes valued comparison; separable/characteristic-zero normalization kept |
| 4.3 formally smooth points | No variables; one variable set to zero; quadratic singular lift; residue field F₂ | Actual point and lifting map retained; generic smoothness is not integral smoothness |
| 4.4 generic fibres | Regular series over a p-adic integer ring; empty generic fibre; component missing closed fibre; inseparable characteristic-p extension | Meeting-closed-fibre and characteristic-zero conditions retained |
| 4.5 diagonal coordinates | Finite residue extension has no new variable; F=k((t)) adds a difference parameter; ramified O; purely inseparable L⊗L has nilpotents | Verified arithmetic proof leaves and separability control; general DVR formulation/proof gap marked |
| 4.6 pointed tensor domains | Unit factor; geometrically integral factors; finite residue field extension; non-geometrically reduced inseparable factor | Point and geometric hypotheses retained; not every tensor of domains is a domain |
| 4.7 point detection | Identity quotient; nonzero finite module image; π-torsion invisible generically; empty point set | Generic point tests identify torsion-free quotients only under stated density hypotheses |
| 5.1 balance | Zero and free module have square presentations; A/(f) has one relation; two relation columns may be dependent | No injectivity assumed in square presentation |
| 5.2 decorated finite data | Zero variables; rank zero; two incompatible maps on isomorphic rings; finite versus infinite residue field | Finite selection retains bases and action diagrams, not only isomorphism types |
| 5.3 cutoffs/extraction | q=0; q=1 over F₂; positive cutoff; fixed versus cofinal index | Cofinal transition compatibility required, not an arbitrary subsequence of types |
| 5.4 limit presentation | Scalar identity action; inconsistent basis changes; rank zero; augmentation ideal zero | Ring maps and specialization are part of the limit |
| 5.5 balanced patching | l=0; width-one presentation; nonzero module; M=0 excluded from depth | Numerical dimension deficit and tied construction retained |
| 5.6 ring-module patching | No auxiliary variables; rank one; rank zero cannot be faithful; characteristic-two power cutoffs | Ordinary ideal powers and ideals generated by elementwise powers remain distinct |
| 5.7 generic projectivity | Field after inverting π; positive rank; zero excluded; O[ε]/(πε,ε²) acting via quotient O | Generic faithfulness does not imply integral faithfulness |
| 5.8 cotangent patching | Uniform exponent versus growing π^N; E[[x]]→E[[x]]/(x²) is surjective with zero relative cotangent; rank zero | Added valuation, ideal-power-product and finite diagonal leaves; no isomorphism inferred |
| 5.9 Sylow/norm | Trivial group norm=id; regular F_p[C_p] has invariant sum; trivial F_p module norm=0; coefficient functional on norm is one | No division by group order; projectivity hypothesis retained |
| 6.1 near faithfulness | k over dual numbers is nearly faithful; E/O faithful without generic support; one node component not all; zero excluded | Finiteness needed for full-support equivalence; MCM is not automatically full support |
| 6.2 quotient/base change | Identity; quotient by unit ideal; faithfully flat extension; infinite formal variable augmentation | Finite-module support equivalence and proper quotient conditions retained |
| 6.3 coefficient-flat quotient | O unchanged; O/π^n becomes zero; O[ε]/(πε,ε²) becomes O; O-flat nilpotents survive | Torsion quotient is not reduction; zero outside coefficient category |
| 6.4 patched quotient identification | Finite free faithful case; cusp ideal M=(t²,t³) with I=(t²); rank zero | Faithful flatness, not faithfulness alone, identifies quotient annihilator |
| 6.5 reduced identification | Reduced source; nonreduced dual numbers; faithful action image; π-injective module | Reduced and coefficient-flat conclusions kept separate |
| 6.6 connectedness | Field c=0; domain c=dim; node c=0; ara(x²,y³)=2; xy quotient gives equality 0≥0 | Closed source/normalization gap via 0ECR; no infinite domain value used |
| 6.7 cycles/components | Generically reduced component gives rank; nonreduced generic point gives length>1; zero/smaller-dimensional module | Specialization uses generic length and uniformizer regularity |
| 6.8 monomial products | Four minimal primes in the stated square-free quotient; κ=0 breaks coordinate change; unequal component support | Retained κ≠0 and no square-free-implies-CM assertion |
| 6.9 regular-locus maps | Finite free resolution trivializes determinant; dimension-four CI puncture Pic=0; three-dimensional node excluded; O⊕k→O loses multiplicity | Added parafactorial target and its dimension control; no canonical trivializing basis |
| 7.1 Tor comparison | Free stalk has Tor₀ only; (Z/2) self-tensor has negative degree -1; zero; swap left/right resolutions | Only indexing and native comparison retained; bifunctors owned by DMA |
| 7.2 finite approximations | Free stalk; residue module with infinite pd; zero; finite-order approximation not a perfect model | Removed owned perfectness/amplitude/interval criteria; finite-order variant remains |
| 7.3 minimal representatives | Identity disk cancels; π-disk has nonzero residual terms; field minimal means differential zero; unused endpoint | Actual contraction and middle exactness retained, not endpoint injectivity/surjectivity |
| 7.4 approximation/Hom | Compact finite free source; noncompact infinite sum; zero; truncated approximation with nonzero error | Filtered Hom conclusion uses finite approximation and degree bound |
| 7.5 complete flat complexes | Infinite direct sum at m=0; restricted (π^j); constant ones excluded; infinite first matrix row valid; nonflat k excluded | Complete Noetherian local hypothesis explicit; no finite residue requirement |
| 7.6 signs and E/O dual | Q two-term differential 2 dualizes to +2, bidual -2; signed evaluation (1,-1); cone cross differential ±1; p=2 hides sign | Real matrix witness and unsigned failure added; ramified DVR E/O dual not called Pontryagin dual |
| 7.7 strict tower actions | Scalar quotients; zero; alternating x=0/1 on identity tower incompatible; non-K-flat Z/2 reduction | Deleted owned linear tower machinery; retained actual action and homotopy compatibility |
| 7.8 finite derived Hom | Stalk pair gives A≅lim A/m^n; π-resolution to O has zero Hom⁰; homotopic maps have same class; infinite residue allowed | Removed owned effectivity; added finite Hom comparison and exact Matlis inverse-limit proof |
| 7.9 actions/blocks | Field product splits; Artin local has one block; generic localization need not split integrally; scalar/zero action | Isolation required; minimal prime localized at its base contraction is an isolated maximal point |
| 7.10 coefficient spectral sequence | Free stalk; Z/2 self-tensor in degrees -1,0; π-disk in degrees 0,1; zero; derived idempotent | Finite-diagonal filtration retained; all-derived-morphism right edge now named and proved via truncation |
| 8.1 finite based models | Zero matrices; two bases with same underlying modules; principal ultrafilter; infinite coefficient ring | Finite germ evaluation works also for principal filters; cofinality separate |
| 8.2 complex patch input | q=0; no framing; actual incompatible chain reductions; error quotient action without lift | All ring/complex/action/augmentation diagrams are input |
| 8.3 simultaneous decorations | Same ring with different ideals; same complex with different actions; common filter; zero-rank term | Finite selection retains simultaneous data and strict cocycles |
| 8.4 complete patch/actions | Zero complex; scalar action only; quotient deformation action; genuine lifted action | No unproved strictification or automatic genuine lift |
| 8.5 augmentation/paired residual | π-disk produces lower Tor; identical systems; mismatched residue maps; different filters | Derived augmentation and common paired choices retained |
| 8.6 cohomology-action patch | l=0; j=0; H=0; original-level action alone lacks quotient action; π-disk nonflat base change | Exact corrected input comparison remains defect 4 |
| 9.1 support/annihilator | Zero support empty/annihilator top; stalk A/I gives V(I),I; direct sum gives union/intersection | Native definitions agree with Lean; action kernel not silently identified |
| 9.2 codimension/concentration | Width zero; regular one-equation Koszul; padded contractible disk; zero excluded; l>dim excluded | Actual finite-projective interval and nonzero hypotheses in Lean; width is b-a |
| 9.3 CM functor/dual | a=b=0 ordinary dual; width-one disk shifts by -1; S=O,R=M=k gives Ext¹=k; R=S[[t]],M=S uses finite B=S | Added exact finite-action canonical-duality contract and naturality; genuine action remains input |
| 9.4 spectral support/blocks | Scalar field block; ghost kernel on two degrees; isolated minimal prime; nonisolated prime | Derived action right edge uses canonical truncation; no ordinary nonflat cohomology interchange |
| 9.5 divisor length | O with divisor π^e gives e; normalization residue degree contributes; lower-dimensional terms; zero module | Lengths, not unsigned ranks, retained; support and finite-length assumptions explicit |
| 9.6 paired transport | Identical paired systems; one local characteristic-zero seed; components omitted by an MCM module; unmatched reductions | Top-component conclusion retained; full support requires equidimensionality |
| 9.7 point survival | Field point; π-disk residual Tor; zero localized block; local condition absent at support | Survival tied to specified action/localization and paired comparison, not arbitrary complexes |

## Lean and signature verification

The final `Suggested.lean` is 503 lines: 10 real-bodied definitions, 3 native abbreviations, 19 theorems and 43 examples. It imports Mathlib and uses its existing carriers; no sorry-defined data, `True` placeholder, lemma chain, construction development or fabricated complex/category is present. Heavy definitions are identified in the closing comment and specified in the README. The deleted Matlis and perfect-interval targets are absent there as well. Metadata remains unchanged because its package identity and topic were already correct.

`lean-check` on the final file exited **0**, with only `declaration uses sorry` warnings. Memory was checked before compilation and exceeded the required 20 GB available. The two matrix sign controls are genuine proofs; most other mathematical statements intentionally remain roadmap signatures.

All ten kept definitions were compared with the prose and its discriminating checks. The small-extension condition excludes zero/principal-failure cases; cumulative length uses `n+1`; multiplicity extraction uses `d!`; trace uses all functionals; symbolic square is localization followed by contraction; square presentation does not require injection; near faithfulness uses the nilradical; minimality constrains actual differentials; derived support is a union; cohomology annihilator is an intersection. The three abbreviations denote existing derived categories, complexes and cohomology.

The following signature checks exceed the required sample of ten. They inspect the actual variable/typeclass block as well as the theorem body type.

| Lean signature | README agreement checked |
|---|---|
| `smallExtension_kernel_square_zero` | Surjective local map, nonzero principal socle kernel; conclusion is the kernel square, not a chosen generator |
| `hilbertSamuel_finite` | Local Noetherian ring, finite module and finite initial quotient; zero module allowed |
| `hilbertSamuel_eventual_polynomial` | Unique eventual polynomial, not equality at every n |
| `hilbertSamuel_degree_and_positive_integral_coefficient` | Nonzero finite module, explicit finite support dimension and eventual polynomial hypothesis |
| `regular_local_finite_module_dimension_bound` | Regular locality and finite module; projective dimension compared in the native extended dimension type |
| `trace_eq_top_iff_free_summand` | Local finite module; actual split copy of A, not all of M projective |
| `symbolicSquare_membership` | Prime ideal and multiplier outside it; square is in the original ring |
| `finite_of_finite_residual_fibre` | Complete local source, Noetherian local target, local coefficient map and finite closed fibre |
| `finite_of_faithful_module` | Finite module over Noetherian S, faithful R-action and commuting scalar tower |
| `dimension_ge_one_iff_not_nilpotent` | Finite local DVR algebra and actual irreducible uniformizer |
| `exists_integral_point_of_not_nilpotent` | Characteristic-zero fraction field, finite algebra, finite extension and finite integral closure in the conclusion |
| `square_presentation_iff_generator_relation_inequality` | Actual exact presentation with e≤d; no injectivity inserted |
| `nearlyFaithful_iff_full_support` | Finiteness is explicit; E/O counterexample prevents deleting it |
| `reduced_quotient_identification` | Reduced source, surjectivity, scalar compatibility and full support of the actual module |
| `three_term_residue_exactness` | Three finite free terms, zero composite and exactness only in the middle |
| `minimal_iff_zero_differentials_over_field` | Field specialization; no freeness or bounds hidden in IsMinimal |
| `finite_germ_equivalence` | Finite ring and arbitrary ultrafilter; cofinality not part of this equivalence |
| `codimension_amplitude_inequality` | Nonzero derived object, regular local coefficient ring, actual finite-projective representative on [a,a+l], l≤n |
| `balanced_dimension_concentration` | Same representative plus the upper support bound; conclusion occurs at a+l, not a |

## Validation and submission state

Validation commands are `lean-check research/blueprint/packages/DeformationAndDerivedPatchingAlgebra/Suggested.lean`, `python3 research/blueprint/intake.py check-files` on the five changed deliverables, and `git diff --check`. The Lean result is exit 0, only sorry warnings; intake reports **5 files, 0 problems** (exit 0), and the whitespace check exits 0. The review verdict is complete, not a checkpoint. No claim is made that these roadmap constructions have been implemented. No second issue is authorized for this session.

## Public source identities

Access date for every successful entry is **2026-10-16**. Hashes identify downloaded public PDF/HTML bytes, not copied passages. Failed first URLs were retried through the successful publisher/author locations shown here; the Brodmann–Rung download did not yield a usable primary text, and was replaced by 0ECR. Neither the inaccessible correction nor Martsinkovsky is listed as read. The cleared nonpublic sources are identified by title and printed pages above, without filesystem paths or redistributed files.

| Source ID | Public URL | SHA-256 |
|---|---|---|
| kw | [source](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| cg | [source](https://www.math.uchicago.edu/~fcale/papers/CG.pdf) | `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5` |
| kisin | [source](https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf) | `076f8bb6ec683633f7742d27504b97f5feaef2ddbae2bc5dc4325eb8386f4ee7` |
| bip | [source](https://arxiv.org/pdf/2110.01638v2) | `b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4` |
| bcgp25 | [source](https://arxiv.org/pdf/2502.20645v1) | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
| ikm | [source](https://arxiv.org/pdf/2206.08212v3) | `8f061724a1800af6319492108835f4db0fd640b93750c213fd1bb313bb8c9d7b` |
| stone | [source](https://home.adelphi.edu/~bstone/commalg-notes/commalg-3/algebra-notes-iii.pdf) | `d98af7b0c0b69ca7e83255e3e17bcfac42f0b419b95c907e7a9ddf3ea87fe242` |
| ces | [source](https://arxiv.org/pdf/1711.06456) | `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709` |
| avramov | [source](https://arxiv.org/pdf/1208.4458v1) | `4933472ff1b7cd0d15f62558c22bc82ee0f15a784383d1d7c5e1e5e713c832dd` |
| cohen | [source](https://www.numdam.org/item/10.5802/cml.84.pdf) | `f9405fb8e3ee2408d71db8aa46e362c4d4eff403dd1084a3a7bef6b9708d93f7` |
| sga2 | [source](https://arxiv.org/pdf/math/0511279v1) | `41ad02c57321a8d2200ff32a929bc93adbc3de0d59dcd5a284d28d859fb87a90` |
| andre | [source](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf) | `34da107d0b96149d9a6779ec1694a0cbb096136d021114b59427024ef3d47053` |
| bhatt | [source](https://arxiv.org/pdf/1608.08882v2) | `08578ca15b17f51ee12c398ef305af3446057063c015e2bc8beb6012bcc26430` |
| llhlm | [source](https://math.rice.edu/~bl70/LLHLMlattices.pdf) | `848f3b73d80dbfe24af8bf863207b2bd426b74851f3e13e95d8e89f152cbbec0` |
| schlessinger | [source](https://math.uchicago.edu/~amathew/schlessingerdef.pdf) | `50ea5b237d015270d9e1805cb9b56d433e416182e62415b3de301ec06159e1c2` |
| ci | [source](https://www.math.ttu.edu/~lchriste/download/codim.pdf) | `52b54e04ef87eb1aaf3a953f45cee206b0fc1ccaab907b946401debd7fe397cf` |
| pq | [source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2D7C5400C4BA7789C0E1CFF008D12E60/S2050508626100304a.pdf/on_local_galois_deformation_rings_generalised_reductive_groups.pdf) | `b18abe909131d28524f7a326834e5656d10063039a92f54e627d7cb899350d93` |
| thorne | [source](https://www.dpmms.cam.ac.uk/~jat58/reducible_lifting.pdf) | `76393fcb9a31931789fa4f7c6de9a64275fb02e81e5a3b98c53b8aa1a1834928` |
| nt23 | [source](https://api.repository.cam.ac.uk/server/api/core/bitstreams/4e6ce1c0-5d19-4a4a-a6c8-77d9654029ab/content) | `0c5c4f7e232937956c226a2363564a181e32192b5f7673bc98b23b2705273cc2` |
| gee | [source](https://arxiv.org/pdf/2202.05818v2) | `878f83e189ad44603ac04f6c16ef17f4c4fe046db91a2f0933a192e048715ea5` |
| nt23-published | [source](https://ems.press/content/serial-article-files/32858) | `bb106d634bf2f78d650d159710941be575fda4ae16447ac9125e62d2d99c6139` |
| bcgp21 | [source](https://arxiv.org/pdf/1812.09269v3) | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` |
| kt | [source](https://arxiv.org/pdf/1409.7007) | `f8a86b8d7dfd290b9b4199931238f21392cb9c82d609f0879060a890e58ec0b4` |
| bj | [source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E29626E5A2A247CD54CB5C98F6AB21A5/S2050509423000828a.pdf/equidimensionality_of_universal_pseudodeformation_rings_in_characteristic_p_for_absolute_galois_groups_of_padic_fields.pdf) | `8c30eb663008604e614e3b78ded538ef9677d15c782c92c7a53755e0824a40b7` |
| hochster12 | [source](https://sites.lsa.umich.edu/hochster/wp-content/uploads/sites/1337/2024/10/615W12.pdf) | `cd4f899d5c62368ee01645d7342d1dbe7f68b0a31a23d7c1cd891a3128adda7a` |
| hochster11 | [source](https://sites.lsa.umich.edu/hochster/wp-content/uploads/sites/1337/2024/10/615W2011.LocCoh.pdf) | `e8dda8d32793d5257b3e2c51f68e0fc61ea02bbca23117f2adacbc3bb7ce8ed0` |
| 0ECR | [source](https://stacks.math.columbia.edu/tag/0ECR) | `2393a4949ec63652e0df4f75244ebf90b25cfd6983cafdd0eff582b4fc7ee274` |
| 0323 | [source](https://stacks.math.columbia.edu/tag/0323) | `9d6b732c706275cda63bd18865b0c7b7723a65d02bd1b8765ed2d6efa0730e86` |
| 00NT | [source](https://stacks.math.columbia.edu/tag/00NT) | `d82dbc17550466debe08b9d189a2e0e4f6f3abb62215c8f117e7f5e5d43f7d66` |
| 0A84 | [source](https://stacks.math.columbia.edu/tag/0A84) | `1a8767bc9ab98190364187f9d59212ab4fb15743a180fc6590838cf5141bb8e7` |
| 0AVZ | [source](https://stacks.math.columbia.edu/tag/0AVZ) | `cdd632b1de661b74b263c3e6711de09d55fb4841a3173ed5c42043a9ef009b13` |
| 0DX6 | [source](https://stacks.math.columbia.edu/tag/0DX6) | `40fbafea339d0d9c16e4ede4a00c5f5560b9552e052573f0f5dd2f379d2f511d` |
| 064Q | [source](https://stacks.math.columbia.edu/tag/064Q) | `85289b6e7a0f296db8ea2f79a6bc25d262f9d096f1c52ba461fea8be36cc81ff` |
| 0EHS | [source](https://stacks.math.columbia.edu/tag/0EHS) | `5674bcf90edaa9370a62b380b67d2443dfa4a273498715a3d02dcf2e345f357c` |
| 0EC0 | [source](https://stacks.math.columbia.edu/tag/0EC0) | `7939526bf7f262bb2dd1830547b2c869d6ef6dd0b94c7fbc48ef6ccfed18b4d8` |
| 05DZ | [source](https://stacks.math.columbia.edu/tag/05DZ) | `ebe01f8e18225daa0b0a113fb24f430a496c3528054f844f33e9cd421a29ff18` |
| 0311 | [source](https://stacks.math.columbia.edu/tag/0311) | `bbfeb5589665e35301bf03ddb87900212ee9f675ec598491e146c89d0712a484` |
| 09Q7 | [source](https://stacks.math.columbia.edu/tag/09Q7) | `7b111970221c9c1c63baff012f2ae1443345b5c4a3f57161ec72098699817b69` |
| 07YG | [source](https://stacks.math.columbia.edu/tag/07YG) | `28822212334673e9e60e9dbf09286403b983f8e169ef81ce52df94ba14aad25f` |
| 07YI | [source](https://stacks.math.columbia.edu/tag/07YI) | `56560b925d696fab5470c4ee6324b8bf5ca45c8223fce01f6df5e886f427eaea` |
