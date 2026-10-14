# Independent package review: SemisimpleAlgebrasPartII, revision 2

Verdict: **needs_changes**. This is a completed fixing review of
[#9238](https://github.com/CBirkbeck/tauceti-explorer/issues/9238), by
`independent-review-REV-PKG-SemisimpleAlgebrasPartII~2`, Codex, session
`codex-t17ba6`, 2026-10-14. I did neither package job. The winning claim is
[recorded on the issue](https://github.com/CBirkbeck/tauceti-explorer/issues/9238#issuecomment-6160973450).

The revision repairs the normalized field transfer and follows the binding
October 12 Lean shape. All 55 input specifications, 30 API entries and 31
input Checks survive in the reader, with the affine matrix-annihilator
calculation correctly consumed as existing work. I corrected additional
supplier drift and added one discriminating Check. The remaining defects
are the unowned Cartier and de Rham Hitchin prerequisites and the missing
relative comparison needed to make the final vanishing argument precise.
The package is not ready for its upstream draft PR.

## Disposition of the previous review

- **R1, normalized transfer: resolved.** README §§1.1–1.2 use the actual
  embedding subgroup, equivariant units transport and the
  crossed-product-normalized comparisons. The defining composite is
  `cK⁻¹ ∘ explicitCor2 ∘ jσ ∘ cL`; `jσ` uses the inverse group map
  and forward coefficient map. The all-class restriction square is a
  theorem target, not a hypothesis containing the desired conclusion.
  Embedding independence is equality of homomorphisms; identity, tower
  and cohomology equations remain explicit.
- **R2, missing geometric Lean declarations: resolved under the current
  rules.** The October 12 shape supersedes the October 10 demand for
  every geometric signature. The 248-line Suggested.lean has five light
  real-bodied definitions, 15 theorem statements and 14 examples. Heavy
  carriers remain full README targets and are named in its closing
  comment. No admitted data or replacement sheaf/Higgs theory was added.
- **R3, Cartier ownership: unresolved.** Listing five hypothetical
  contracts identifies the gap but does not assign a supplying roadmap
  and layer. The revision handoff explicitly leaves that decision open.

## Fixes in this review

1. Removed the claimed `GeneralAlgebraicKTheory:K.7` projective-generator
   supplier throughout the README. The current package's Layer 7 is
   products/transfers; §10.6 consumes a Morita equivalence rather than
   constructing the required tensor/Hom equivalence. Sections 2.2–2.3
   now give the actual local route through Mathlib's matrix equivalence,
   its `e11` inverse summand, evaluation, restriction-compatible unit
   and counit, and finite sums/direct summands for finite presentation.
   This retains the intended sheaf theorem without adding generic
   projective-generator theory to either roadmap.
2. Restricted the HodgeStructuresPartII H.0 supplier to its actual Higgs
   carrier and symmetric-action comparison. Section 3.7 specifies the
   spectral algebra map `Sym(W∨) → q_*O_V`, with finite locally free
   coefficient sheaf `W`. It constructs the universal determinant after
   scalar extension to `Sym(W)` using AlgebraicVectorBundles L0C.
   Homogeneity, frame independence, pullback and block-sum laws are
   explicit substeps of the existing invariant target. They are no
   longer asserted to be exports of H.0. Its H.1 complex fixed-determinant
   Hitchin map cannot supply the general positive-characteristic input.
3. Made semilocal line triviality a proved substep of
   `spectralLineTrivialization`, with a Chinese-remainder/localization
   argument and Stacks Lemma 10.78.7, tag 02M9. SF.0 supplies limit descent;
   ModularCurves 4D supplies strict henselization. The semilocal lemma is
   no longer falsely attributed to SF.0.
4. Added `higgs_finite_field_directions`: over F₂ the diagonal field
   with entries `w1,w2,w1+w2` has nonzero constant coefficient
   `w1²w2+w1w2²`, which evaluates to zero at every F₂-valued direction.
   This tests the need to retain universal symmetric coefficients.
5. Marked the missing Cartier ownership and positive-characteristic
   de Rham Hitchin/spectral supplier explicitly. Section 4.5 retains
   the degree-one coefficient in the absence of trace-freeness, cites
   EG §2.5, equations (2.5)–(2.7), pp. 11–12, and Remark A.1, p. 40,
   and states the required boundary comparison on singular `W`.

Only README.md, review.json and this report change. Suggested.lean and
the one-line `topic = "math.RA"` metadata already meet their requirements.
The accepted packet and other workers' files are unchanged.

## Remaining defects and exact resumption point

### R3: name the supplier for the five Cartier contracts

README §4.1 requires: the actual relative four-term units/closed-forms
sequence; its full diagrams for the application; the differential-operator
Azumaya/contact-form class comparison; the specified W₂-dependent bounded
splitting; and the comparison bimodules with pullback/composition maps.
No existing roadmap and layer exporting these together was identified.
SF.2 supplies the general sheaf/cohomology operations, and generic
crystalline comparisons do not imply these statements.

Assign a named owner and layer, with those exact interfaces, or plan the
missing prerequisites explicitly in an authorized owner. This review
cannot modify supplier packets or silently claim that a hypothetical
Cartier successor already exists. Unproved implementation of an already
owned target is not the objection here; absent ownership and contracts are.

### R4: define and justify the relative comparison on the spectral thickening

For §4.5, `W = V × Spec k[t]/(t−1)^p` can be singular. The smooth
relative Cartier sequence does not by itself give the displayed map
`Φ` on W. Specify the relevant restricted étale-sheaf sequence/maps and
its comparison with the smooth ambient relative sequence. Supply a valid
roadmap proof chain for the class-vanishing target with that comparison.

The observation that `m*θ−r*θ` vanishes at `t=1` does not give support
on the cotangent zero section: `ε ξ dx` on the dual-number parameter
thickening remains nonzero after inverting ξ. This refutes that inference,
not EG Proposition A.2 or the Brauer-boundary vanishing itself.

A possible route recorded in the revision handoff is the difference map
`s(v,t)=(t−1)v`. For the zero-section ideal I, `s*(I^p)=0` follows from
`(t−1)^p=0`, so the OV bounded splitting has the right candidate pullback
domain. That calculation alone does not identify its pulled-back Brauer
class with the difference of the two classes. The missing relative
diagram and contact-form/bimodule identification must establish that
equality. The categorical refinement must additionally retain the actual
chosen splitting, its `t=1` evaluation and composition coherence. Merely
adding class equality as an input would make the proof circular.

### R5: supply the de Rham Hitchin and finite spectral construction

H.0's general connection and Higgs carriers do not construct the
Frobenius-descended characteristic coefficients of p-curvature, the
parameter `a = χ_dR(E,∇)`, and its finite spectral scheme with actual
function action. The reader formerly attributed these to H.0. Section
4.5 now identifies this as a separate missing prerequisite. Give it a
named supplying roadmap/layer and exact contract. Retain all coefficients
for arbitrary connections; EG's omission of degree one uses its stated
trace-free convention. Do not replace the hypothesis by an arbitrary
point of a Hitchin base.

These are precise dependency/proof-chain defects, not requests to develop
the missing theory in Suggested.lean. They were not resolved by naming an
unverified supplier or by removing any final target.

## Fidelity and definition checks

Read the entire packet, including hypotheses, proof steps, prerequisite
lists, API, tests, requests, gaps and source issues, and the whole reader.
The target correspondence is:

| Input layer | Reader location and retained mathematics | Count |
| --- | --- | ---: |
| SA.0 | §§0.1–0.5: index congruence/descent, representative formula, positivity/index one; splitting degrees and attainment; actual restricted column action, coordinate/tower/finiteness/dimension/cancellation and division adapter; both base-change divisibilities; minimum, gcd, cyclic-subgroup invariance | 20 |
| SA.1 | §§1.1–1.4: all-class comparison, normalized corestriction and degree formula; separable annihilation, index annihilation, finite order, period divisibility; prime-to-period splitting, reverse prime-divisibility implication and prime-support equality | 10 |
| SA.2 | Existing Mathlib annihilator supplier in boundaries; §2.1 nilpotent control; §§2.2–2.4 sheaf Morita, coherence/finite presentation and ideal-sheaf annihilator equality | 5 |
| SA.3 | §§3.1–3.7: transition line, line twist, Morita polynomial, nonreduced root control; finite pushforward, spectral line trivialization/invariance, Higgs overlap/invariant and its four APIs | 13 |
| SA.4 | §§4.2–4.7: middle image, additive/natural boundaries, differential-operator comparison, relative vanishing, class equality and chosen Morita refinement | 7 |

| Definition | Input API retained | Input Checks retained |
| --- | ---: | ---: |
| classIndex | 4 | 6 |
| splittingDegrees | 5 | 4 |
| divisionColumnModule | 4 | 4 |
| brauerCorestriction | 5 | 4 |
| sheafMorita | 4 | 4 |
| moritaCharpoly | 4 | 4 |
| moritaHiggsInvariant | 4 | 5 |
| Total | 30 | 31 |

All seven definition groups have at least three discriminating Checks.
The extra finite-field Check brings the reader's definition Checks to 32.
Rank-one, rank-zero, matrix-action, nilpotent, nontrivial line and mixed
inverse-image rank controls distinguish the stated constructions from
plausible incorrect ones. The native dual numbers and epsilon are concrete
models for the nonzero/square-zero/distinct-monic/equal-square controls.

The opening Summary, ownership, conventions, supplier contracts, five
ordered layers, Examples/Dependencies, consumers and references match
upstream form. Read the SemisimpleAlgebras and JacobianChallenge atlas
readers and current parent/AlgebraicVectorBundles readers and relevant
signatures. No source passage, section-by-section source summary, job
identifier or checkpoint narrative was introduced into the package.

## Sources: fresh passage checks

All sources below were retrieved anew from their public primary links in
the package. Printed pages are used. The earlier review's GS access limit
does not apply to this run. No book passage or source file is committed.
The sample uses a reproducible draw with seed 9238 from the non-SA.4
targets; SA.4 and every previously disputed/source-issue passage were
checked additionally.

| Sample target | Fresh locator | Finding |
| --- | --- | --- |
| division-column-action | GS Proposition 4.5.3, p. 101 | Division-module context; restricted columns are the reader's explicit argument |
| frobenius-root-boundary | EG Theorem 2.17 proof, pp. 13–14 | Nonreduced counterexample corrects the root-uniqueness inference |
| index-divides-splitting-degree | GS Proposition 4.5.8, p. 103 | Reader explicitly supplies the stronger all-finite column argument |
| finite-pushforward-morita | EG Theorem 2.17 proof, pp. 13–14 | Fixed positive rank on the whole inverse image is retained |
| separable-splitting-annihilates | GS Proposition 4.5.13 proof, pp. 104–105; Proposition 4.2.10, pp. 88–89 | Transfer applies in the stated separable domain |
| comparison-basechange-units | GS §4.4, pp. 95–99; Proposition 4.5.6/Lemma 4.5.7, pp. 102–103 | Full units comparison and restriction; all-class naturality remains an authored target |
| coherent-morita | EG Theorem 2.17 proof, pp. 13–14 | Arbitrary-base finite-presentation variant is an explicit local deduction |
| brauer-finite-order | GS Definition 4.5.12/Proposition 4.5.13, pp. 104–105 | Positive annihilating index precedes finite order |
| division-module-dimension | GS Propositions 4.5.3 and 4.5.8, pp. 101, 103 | Actual column action fixes the dimension proof |
| index-divides-degree-index | GS Corollary 4.5.11, p. 104 | All-finite extension version is justified by the separate column/tower chain |
| splitting-transition-line | EG Theorem 2.17 overlap argument, pp. 13–14 | Transition line/evaluation replaces bare uniqueness assertions |
| class-index | GS §4.5, definition and Remark 4.5.2, p. 100 | Quotient-level invariant uses the existing division representative |
| class-index-one | GS Remark 4.5.2(3), p. 100 | Split representative/index-one criterion agrees |
| minimum-splitting-degree | Benoist §0.1, p. 63; GS Corollary 4.5.9, p. 103 | Attainment plus divisibility gives the minimum |
| nilpotent-support-boundary | EG Remark 2.18, p. 13 | Reader's Z/4 ideal-action control is an authored witness |

GS §4.5 assumes the field infinite; the reader handles finite fields with
the built triviality theorem. Fresh GS pp. 100–106 and author errata p. 3
confirm E1's corrected injective-subalgebra argument and E4's corrected
square-period bound, which remains outside this roadmap. All seven input
source issues E1–E7 were checked. E2 and E3 are the root/support inferences
above. E7's bare uniqueness fails for scalar automorphisms 1 and 2 over F₃;
the reader retains actual evaluation maps instead.

For every SA.4 locator, read published OV Theorem 2.8/Corollary 2.9,
pp. 33–34; §4.2, equation (4.1.1), Proposition 4.2 and its two short exact
sequences, pp. 85–86; Proposition 4.4 and proof, pp. 87–88. Read EG
Proposition A.2/Remark A.3, pp. 40–41. OV's bounded splitting cannot be
pulled to an arbitrary spectral thickening without the appropriate map.
Read BB v2 §2.2, p. 3, Proposition 3.11/Corollary 3.12, p. 11: the
rank is p^(2d), and the typed contact section is eta after delta. These
confirm E5/E6 in the cited preprint only. No identity with an unacquired
journal version or absence of later corrigenda is certified.

The new semilocal locator was independently opened: Stacks Lemma 10.78.7,
[tag 02M9](https://stacks.math.columbia.edu/tag/02M9). The rank-one case
is exactly the local statement used. The new Hitchin locator is EG §2.5,
equations (2.5)–(2.7), pp. 11–12, plus Remark A.1, p. 40.

Retrieval fingerprints, to distinguish editions without retaining copies:

| Source | SHA-256 prefix |
| --- | --- |
| GS 2006 institutional PDF | `3697582f57a11547` |
| GS author errata, 4 December 2020 | `db7cea507d8aa130` |
| EG arXiv:1707.00752v4 | `bcc435b58bb2b1c0` |
| OV published Numdam PDF | `2266595d31d3ee48` |
| BB arXiv:math/0602255v2 | `a94800bee9fcbb4e` |
| Benoist published Numdam PDF | `8dfc0f221ab510ba` |

## Baselines, ownership and current duplication

Read the reviewed library-coverage audit: no own SemisimpleAlgebras layer
entry was found, but the related ClassFieldTheory Layer 10 and
QuadraticFormInvariants Layers 2/5 entries were read. Audit absence was not
used as evidence that a theorem is missing. Checked all 48 cited baseline
declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including ambient
hypotheses, not just names.

Current comparison used TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Mathematical-object searches
covered the nine newer roadmaps named in WORKERS.md and the four Completed
roadmaps, plus the relevant current algebra, geometric and continuous
cohomology modules. No additional duplicated target was found. The
important dispositions are:

- The algebra index, CSA quotient, division representative, splitting
  kernel, exact-size matrix presentation and base-change laws already
  exist and stay inputs. `classIndex` is the quotient adapter.
- The affine matrix-support target was already removed by the revision
  and cited in boundaries via `Module.annihilator_pi` and
  `LinearEquiv.annihilator_eq`; that disposition is confirmed. This
  review removes no further target.
- Current AlgebraicVectorBundles owns sheaf tensor/Hom, finite locally
  free rank, duals and determinants. The variant retained here compares
  actual inverse sheaf Morita modules and their descended coefficients.
- Current `ClassFieldTheory/Brauer/Restriction.lean` supplies `brRes`,
  `brCor`, `brRes_eq_explicitMap2` and `brCor_brRes` on cohomological
  `Br`. It does not supply the normalized transfer on the CSA quotient.
- QuadraticFormInvariants 7B supplies the whole normalized comparison;
  its explicit naturality target is 2-torsion. Sections 1.1–1.2 specify
  the additional all-class square. ProfiniteCohomology 9–10 supplies
  the actual group/coefficient restriction and transfer inputs.
- The precise parent-owned separable splitter of index degree remains
  a stated contract. Two different built existence theorems do not give
  their conjunction. The reader keeps the corrected GS argument and
  the finite-field branch rather than making that inference.

No `FoundationsAndLibraryIntegration` or `UPSTREAM:` pseudo-supplier is
left in the reader. The cited SchemeAndStackFoundations layer is Tier 2.
This continuation and HodgeStructuresPartII are outside the 94-roadmap
Caraiani–Newton tier list; that list alone cannot certify their ordering.
The local matrix and coefficient arguments remove unnecessary supplier
extensions; the outstanding Cartier/Hitchin ownership must be resolved
explicitly rather than assigned a fictitious lower tier.

## Adversarial mathematics pass

| Statements/conventions | Instances and result | Disposition |
| --- | --- | --- |
| Quotient index and splitting degrees | Positive matrix stabilization has index 1; zero-size matrix excluded; Hamilton class has index/period 2 and complexified index 1; finite fields give 1; degree zero cannot split | Consistent |
| Restricted division columns | Rank one, first coordinate in rank two, empty column; dim D=4 and [L:K]=3 contradict the tower formula; positive n is necessary for cancellation | Actual action and hypotheses retained |
| Extension bounds, minimum/gcd/cyclic invariance | Identity class; inseparable finite extensions; arbitrary infinite extension only in the divisor-lowering theorem; n=0 in the gcd equivalence | Consistent |
| Normalized transfer | Identity extension, trivial class, quadratic res/cor gives the square; nontrivial purely inseparable extension excluded | R1 resolved |
| Period/index and Sylow argument | Finite fields; trivial class period 1; establish finite order before order positivity; prime p may equal characteristic | No prime-to-characteristic restriction inserted |
| Sheaf Morita and support | Rank one; disconnected ranks 1/2; zero generator rejected; Z/4 regular module has nonzero 2-action despite full topological support | Local matrix argument repaired; actual ideal equality retained |
| Transition lines | Q=P tensor L gives inverse transition L dual; F₃ scalar automorphisms disprove bare unique isomorphism | Evaluation direction/coherence retained |
| Characteristic determinants | Scalar b gives T−b; rank zero gives 1; over F₂ dual numbers, T and T+epsilon have equal squares and distinct coefficients | Actual coefficient descent retained |
| Universal coefficient directions | Rank-three diagonal F₂ example has nonzero symmetric cubic vanishing at every rational direction | New Check; universal construction specified |
| Finite pushforward | Splitting ranks 1/2 over a two-point cover give original/inverse ranks 3/2 and polynomials T³/T² | Whole-inverse-image rank condition retained |
| Relative Cartier boundary | First delta0 to H¹(J), then delta1 to H²(units); only represented classes use injective Azumaya comparison; nonreduced parameter is relative base | Correct order; full diagrams still required |
| Relative class and chosen equivalence | epsilon xi dx refutes support inference; (t−1)^p kills pulled-back I^p; singular W is not smooth automatically; p=2 keeps the same nilpotent bound | R3–R5 remain; no claim that Proposition A.2 is false |
| BB dimension and arrows | d=1,p=3 gives rank 9; eta after delta has the required type | Existing preprint corrections confirmed |

## Lean and validation

Independent `lean-check` of the unchanged Suggested.lean exited **0**:
29 warnings, all `declaration uses sorry`, zero errors and zero other
warnings. This checks elaboration of signatures; no theorem proof is
certified. The representative file contains no sorry-bodied data, `True`
placeholder, conclusion-valued input, auxiliary theory development or
unavailable geometric carrier.

The signature spot-check exceeded the required ten:

| Signature | README comparison |
| --- | --- |
| classIndex_mk | Actual CSA representative and existing algebra index |
| classIndex_pos | Every class; strictly positive natural value |
| classIndex_eq_one_iff | Identity is multiplicative 1 |
| indexDividesSplittingDegree | Finite extension; separability absent |
| classIndex_baseChange_dvd | Arbitrary field extension |
| indexDividesDegreeIndex | Finite extension; correct product direction |
| minimumSplittingDegree | IsLeast includes attainment |
| gcdSplittingDegrees | All members of the set; n=0 included |
| sameCyclicIndex | Equality of integer-power subgroups |
| separableSplittingAnnihilates | Finite and separable both present |
| classPowerIndex | Index exponent, not degree of an arbitrary representative |
| brauerFiniteOrder | Actual finite-order predicate |
| periodDividesIndex | Correct divisibility direction |
| primeToPSplitting | Actual finite separable field data and prime-to-p degree |
| samePrimeDivisors | Prime hypothesis; no equality of period and index |

All five light definition bodies were inspected. The coordinate, odd-degree,
empty-column, nilpotent ideal, distinct-monic, sign and rank-zero examples
have the intended hypotheses. The omission comment correctly preserves the
heavy geometric and normalized-transfer targets in the README.

Final checks: packet validator reports 55 nodes, 30 API entries, 31 tests,
zero errors and zero warnings; intake `check-files` reports zero problems
for the changed deliverables; JSON and metadata parse; `git diff --check`
passes; no private paths or source text were committed. No Lake operation
was run in the current upstream checkout. This report is the durable
resumption note for R3–R5; this is a complete review, not a checkpoint of an
unfinished review.
