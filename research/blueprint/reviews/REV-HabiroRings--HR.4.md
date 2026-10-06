# REV-HabiroRings--HR.4

Independent review of issue #6452 by Codex, session `codex-QQJCV7`,
6 October 2026. The input was written by Codex session `codex-IS3oVl`
for BP-HabiroRings--HR.4, issue #6500. I did not write that input.

**Verdict: accepted after corrections.** The packet is a completed
target-level planning pass. HR.4 remains `planned`, with four supplier
requests and two recorded gaps. All seven implementation statuses remain
`unchecked`; acceptance does not discharge those requests or certify proofs.

## Scope and counts

I checked the packet and suggested file and read the companion reader, all
twelve imported parent HR.4 targets, the relevant accepted HR.1/HR.2/HR.3
statements, AUDIT-17's reviewed HR.4 entry, the supplier stage contracts,
RT-AREA-etale/27 and the accepted RS-10 decision. WORKERS, both protocols,
UPSTREAM_GUIDE and BROWSER_AGENTS were followed. The upstream AdicSpaces
and Multiquadratic documents were read in full for the planning standard.
The parent packet, reader, suppliers and atlas data were read-only.

| Item | Input | Reviewed result |
|---|---:|---:|
| Nodes | 7 | 7 |
| Definitions / constructions / theorems / lemmas | 1 / 1 / 3 / 2 | 1 / 1 / 3 / 2 |
| API items | 24 | 24 |
| Definition/construction tests | 7 | 7 |
| Baseline declarations | 19 | 20 |
| New planets | 2 | 2 |
| Source issues | 3 awaiting review | 3 confirmed |
| Open requests / gaps | 4 / 2 | 4 / 2 |
| Planned / closed stages | 1 / 0 | 1 / 0 |

Four nodes are recorded as corrected and three as verified. No node was
added. The parent's four HR.4 planets and these two give six in the combined
layer, within the limit. The new names describe the marked deformation and
completed deformation constructions rather than source locators.

## Corrections

1. Added the pinned `AdicCompletion.pow_smul_top_eq_ker_eval` citation and
   direct prerequisite. The completion proof now identifies every quotient
   using evaluation at that power in the original completion. It no longer
   leaves implicit the passage from the level-one kernel theorem to all
   levels or a change of defining ideal.
2. Made the split deformation's routine proof explicit: evaluation at 0 and
   1 identifies B[x]/(x²−x) with B×B, and 2x−1 has square 1 in the quotient.
   Added the existing dimension-zero presentation prerequisites. This works
   over every commutative ring, including the zero ring, and requires no
   presumed product-étaleness instance.
3. Added the direct quotient/tensor prerequisite to the completed map
   equivalence, and the direct nilpotent rigidity, étale base-change and
   smooth-flatness prerequisites to cyclotomic coherence. The latter proof
   now states why the twisted polynomial algebras are étale and flat.
4. Defined suggested `EtaleDeformation.reduceMap` by the actual conjugated
   scalar-extension map. Defined the forward function of
   `CompletedEtaleLift.homEquiv` by the actual marked reduction, retaining
   proof placeholders for its inverse and inverse laws. Their signatures
   and the packet's 24-item API are unchanged.
5. Strengthened the nilpotent example to bijectivity of the canonical
   completion unit, rather than existence of an unspecified isomorphism.
   Strengthened the localization-series example to an isomorphism respecting
   polynomial evaluation at the power-series variable. The corresponding
   packet tests now state these precise compatibility requirements.
6. Independently confirmed E15–E17. Corrected E15's author-copy locator to
   printed p.33; its arXiv v5 locator remains p.34. Added a reasoned review
   object to each issue, the per-node packet review and this report/handoff.

No original baseline citation was removed or replaced. No additional source
mistake was found in the passages checked. The reader's mathematical account
is consistent with these corrections. The read-only reader records the
planning pass's nineteen baseline citations and source findings awaiting
review; this report and packet supply the updated count and independent
verdicts. The planning worker's handoff records the original 33 warnings.

## Every node checked

**Marked étale deformation — corrected.** Stacks 0ALI's reduction functor
motivates the marked fibre; the locator and excerpt match. The structure
stores a real commutative algebra, `Algebra.Etale` and a quotient-base-change
equivalence. It does not replace the carrier by a proposition or impose
module-finiteness. The reduction formula now occurs explicitly in the
suggested definition. Its ten API items give construction, structure,
marking transport and reduction functor laws. The unit, marked nonidentity
swap and non-module-finite localization tests discriminate plausible wrong
definitions. The explicit split Jacobian argument closes its elementary
constructor proof without another target-level node.

**Étale quotient lift — verified.** Stacks 04D1 states existence across an
arbitrary quotient, with no nilpotence assumption. Its locator and excerpt
match. The pinned standard-smooth theorem gives a finite dimension-zero
presentation with a square invertible Jacobian. Lift the equations and
adjoin yΔ−1. The new Jacobian determinant is Δ², hence invertible in the
quotient; reduction recovers the original algebra and its marking. This
constructs an algebra object, whereas formal smoothness alone lifts maps
from a fixed object. The F₄ example over ℤ/2 lifts to the indicated étale
localization of ℤ[x]/(x²+x+1).

**Nilpotent deformation rigidity — verified.** This is the nilpotent
specialization of Stacks 0ALI, whose full statement allows locally
nilpotent ideals. Formal smoothness lifts through IE′; formal unramifiedness
makes that lift unique. Tensor/quotient transport gives the marked hom-set
bijection, and lifting an inverse proves marked isomorphism and functor
laws. The stated counterexample for a nonnilpotent ideal is valid:
ℤ[t] and ℤ[t,1/(1−t)] have the same reduction at t but are not isomorphic
as ℤ[t]-algebras. No uniqueness across arbitrary ideals is claimed.

**Completed étale deformation — corrected.** Wagner's Theorem 2.9 proof,
pp.16–17, motivates the completed lift; the quoted passage matches. The
definition reuses Mathlib's actual `AdicCompletion`. Finite generation is
needed for ordinary completeness and quotient identification, not for the
carrier. The added all-power kernel theorem and surjective evaluation give
W/IⁿW≅E/IⁿE with the canonical maps. Étale base change supplies every finite
level. The fourteen API items include the completion unit, reduction,
universal property and canonical maps/comparisons. The four tests cover
zero and nilpotent ideals, the marked swap, and completion after localization.
In the last case ℤ[1/2][[t]] permits coefficients 1/2ⁿ without a common
denominator bound, unlike ℤ[[t]][1/2]. The revised suggested equivalence
preserves the polynomial base. No flatness or étaleness over completed B
has been inserted.

**Completed deformation map equivalence — corrected.** The nilpotent
full-faithfulness passage in Stacks 0ALI supports the finite-level argument;
the match is correctly described as an extension using existing completion
theorems. Pinned formally smooth complete-target existence and formally
unramified separated-target uniqueness produce the unique map E→C.
Compatible quotient maps extend to W→C through `liftAlgHom` and
`ofAlgEquiv`, with restriction of scalars. Every B-algebra map preserves
ideal powers, so the quotient-level uniqueness determines every W→C map.
Reduced identities, composites and inverses give the asserted laws. The
suggested equivalence now fixes its forward map to this reduction instead
of leaving an unspecified equivalence of sets.

**Complete principal deformation universality — verified.** Theorem 2.9's
unique-lift passage motivates this explicit proof obligation. Its locator
and excerpt match. The nonzerodivisor hypothesis and derived quotient
marking are essential. Étale flatness preserves f-regularity of E. The
regular principal quotient tower has static terms and surjective
transitions, making its derived limit static. For any proposed C, successive
power cofibres are extensions of the static C/f; their degree-zero maps
are surjective. Completeness and the Milnor sequence then make C static,
and the quotient exact sequence makes f regular. Ordinary map rigidity
constructs the marked comparison and derived Nakayama detects its
equivalence. Discrete mapping spaces between static algebras make the
marked fibre contractible. The precise DD.1/E1/E5 refinements, complete-base
action and absence of supplied enhanced Lean carriers remain honest gaps.
No unconditional completion t-exactness is used.

**Cyclotomic ghost lift coherence — corrected.** Theorem 2.9's full proof
and q-Witt Corollary 2.51 supply the two cited passages and matching excerpts.
Étale base change makes T_d étale and flat over A. Monic f and Φ_d give the
principal regular comparisons; torsion-freeness makes p regular, and Φ_d
remains monic after reduction at p, justifying the regular two-generator
overlap. The relative ghost/Frobenius square, HR.1's linearized lift and the
radical equality give the prescribed overlap reductions. Nilpotent rigidity
then supplies unique finite-level lifts. The requested ordinary/derived
overlap comparison and static embedding turn these into specified paths
with their higher coherences. Accepted HR.3 reconstruction and mapping-space
statements yield the global equivalence and naturality. The m=6 index has
four prime edges and requires no additional cycle equation. The added direct
prerequisites make these uses explicit, while the QW and enhanced supplier
obligations remain recorded.

## Baseline verification

Every cited declaration's statement was read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Its hypotheses and scalar
conventions supply the claimed input. All modules below are under Mathlib.

| Declaration | Module | Confirmed input |
|---|---|---|
| `Algebra.Etale` | RingTheory/Etale/Basic.lean | Formal étaleness plus algebra finite presentation, without module-finiteness. |
| `Algebra.Etale.baseChange` | RingTheory/Etale/Basic.lean | Arbitrary algebra base change is étale. |
| `Algebra.Etale.of_isLocalizationAway` | RingTheory/Etale/Basic.lean | Localization at one element is étale. |
| `Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero` | RingTheory/Smooth/StandardSmoothOfFree.lean | Global relative-dimension-zero submersive presentation. |
| `Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension` | RingTheory/Smooth/StandardSmooth.lean | Finite submersive presentation supplies the specified relative dimension. |
| `Algebra.FormallySmooth.exists_lift` | RingTheory/Smooth/Basic.lean | Lifts maps through an arbitrary nilpotent target ideal. |
| `Algebra.FormallyUnramified.lift_unique` | RingTheory/Unramified/Basic.lean | Uniqueness through a nilpotent target ideal. |
| `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` | RingTheory/Smooth/AdicCompletion.lean | Lifts maps into a complete target; does not construct an algebra object. |
| `Algebra.FormallyUnramified.ext_of_iInf` | RingTheory/Unramified/Basic.lean | Equality from reduction when the intersection of target ideal powers is zero. |
| `AdicCompletion` | RingTheory/AdicCompletion/Basic.lean | Actual compatible quotient-family carrier. |
| `AdicCompletion.eval_surjective` | RingTheory/AdicCompletion/Basic.lean | Evaluation is surjective at every level. |
| `AdicCompletion.isAdicComplete` | RingTheory/AdicCompletion/Completeness.lean | Completeness for a finitely generated ideal, without noetherianity. |
| `AdicCompletion.ker_evalOneₐ_eq_map` | RingTheory/AdicCompletion/Completeness.lean | The level-one evaluation kernel is the extended ideal. |
| `AdicCompletion.pow_smul_top_eq_ker_eval` (added) | RingTheory/AdicCompletion/Completeness.lean | For every n, Iⁿ acting on completion equals the evaluation kernel, assuming I finitely generated. |
| `AdicCompletion.liftAlgHom` | RingTheory/AdicCompletion/Algebra.lean | Compatible quotient algebra maps assemble into a completion map. |
| `AdicCompletion.ofAlgEquiv` | RingTheory/AdicCompletion/Algebra.lean | A complete ring identifies with its completion over itself; restrict scalars to B. |
| `Algebra.TensorProduct.map` | RingTheory/TensorProduct/Maps.lean | Actual scalar extension of algebra maps. |
| `Algebra.TensorProduct.quotientTensorEquiv` | RingTheory/TensorProduct/Quotient.lean | Quotient/tensor compatibility over the declared scalar ring; tensor-unit transport and quotient scalar descent give the marked B/I version. |
| `MvPowerSeries.toAdicCompletionAlgEquiv` | RingTheory/MvPowerSeries/Equiv.lean | Finite-variable polynomial completion is power series, specialized to one variable after localization. |
| `Algebra.Smooth.flat` | RingTheory/Smooth/Flat.lean | Smooth, hence étale, algebras are flat over arbitrary commutative rings. |

Tau Ceti was inspected at
`f790474821cf4256814db967cb154e7af3d0c369`. Its unramified transport,
Kaehler, factor decomposition and Dedekind completion files do not supply
the generic marked object deformation or big/q-Witt interface. No Tau Ceti
declaration is cited as a baseline supplier here. Mathlib's p-typical Witt
theory is not the ordinary big-Witt or q-Witt input. Open Mathlib
[PR #41086](https://github.com/leanprover-community/mathlib4/pull/41086),
head `a010cae47a32f30dafa2e9d241e4befab9e512a5`, concerns henselian local
residue-field map lifting and is not a substitute for these object targets.

## Sources and source issues

Public source URLs, access dates and hashes are in the packet. I independently
matched the downloaded PDFs and both Stacks HTML hashes. The passages read
were Wagner's [Habiro paper v2](https://arxiv.org/pdf/2510.04782v2),
printed pp.13–17, including the full descent and Theorem 2.9 proofs;
the [q-Witt paper v5](https://arxiv.org/pdf/2410.23078v5), §2.6,
printed pp.33–35; the corresponding passages in the
[author copy dated 14 January 2026](https://ferdinand-wagner.github.io/papers/q-Witt.pdf);
and the complete statements and proofs of Stacks
[04D1](https://stacks.math.columbia.edu/tag/04D1) and
[0ALI](https://stacks.math.columbia.edu/tag/0ALI). Earlier q-Witt theory
is imported from its accepted extraction rather than re-extracted here.

- **E15 confirmed:** Lemma 2.50's cokernel must be q-Witt, and its summand
  module is W_d, the target of F_(m/d). At m=3 and R′=ℤ the ordinary Witt
  ghost lattice has rank two, while the q-Witt quotient has rank three.
  Both expressions persist in the two copies. They occur on v5 p.34 and
  author-copy p.33, correcting the latter locator.
- **E16 confirmed:** Remark 2.49 needs ordinary Witt étaleness in its
  opening sentence. Its displayed F_p square lowers the truncation exponent
  from α to α−1. At α=1 the lower objects are R and R′. Both copies retain
  the errors on p.33.
- **E17 confirmed:** Corollary 2.51's ghost cokernel must sum over proper
  divisors. Including d=m includes V_1, the identity, and kills the entire
  cokernel; m=1 and A=R=ℤ distinguishes the incorrect expression. Both
  copies retain the indexing on p.34.

The arXiv version history, author page and public title/erratum searches
showed no linked correction or version of record. The `known: new` labels
are therefore retained with this limited search scope. Imported E2/E3/E12
are distinct existing corrections: Theorem 2.9's étale hypothesis, its
qᵐ−1 staticity reduction, and Proposition 2.48's Frobenius target. The
follow-up respects their corrected mathematics.

## Coverage, ownership and remaining obligations

All twelve parent HR.4 targets resolve as imports. The absolute/relative
q-Witt definitions, big Witt input, comparison maps and no-restriction
theorem remain with their current accepted owner. The étale/ghost pushouts
and obstruction retain the QW.0 ordinary-Witt obligation. The finite
relative Habiro ring uses accepted HR.3 reconstruction; the new nodes
supply the deformation and coherent ghost comparison for Theorem 2.9.
Transitions are the Frobenius maps through these markings. The global
static inverse limit is covered by the reader's explicit refinement:
underlying-module cyclotomic cofibres commute with limits in the stable
category, become constant on a cofinal divisor tail, and detect staticity
through HR.2. This does not assume that arbitrary completion reflectors
preserve all limits or that divisor transitions are surjective. Assembly
must use this refinement in place of the older parent proof shorthand.

AUDIT-17 finds the HR.4 targets absent from the pinned libraries. Generic
completion and enhanced algebra theory are requested from DD.1/E1/E5;
the wrapper does not duplicate their carriers. PerfectoidSpaces P0's
almost-algebra deformation and almost finite-étale completion statements
have different carriers and finiteness scope; this ordinary, potentially
non-module-finite marked wrapper uses the existing Mathlib map theorems.

RT-AREA-etale/27 is addressed according to the newer accepted
`RS-10.result.json`, reviewed by `independent-review-REV-RS-10~2` on
29 September 2026. HR.1 and HR.4 supply interim Λ/degree-zero q-Witt
interfaces until atomic QW installation. Permanent owners are QW.0/QW.1
for big Witt/Λ and QW.2–QW.4 for absolute/relative q-Witt and étale ghosts.
HR.4 retains E_d, H_m, Theorem 2.9, staticity, transitions and naturality.
HQ.4 retains positive-degree coefficients. Existing HR.4→HQ.4,
HQ.4→HQ.3 and CR.4→HQ.4 directions are preserved. The obsolete arrow
reversal mentioned by the historical finding would create a cycle and is
not the accepted decision. The packet and reader both observe this boundary.

The four requests precisely name consumers and required statements:
QW.0's ordinary big-Witt étale/Frobenius pushout without F-finiteness;
DD.1's regular principal and two-generator quotient comparisons, Nakayama
and reduction invariance; E1's static embedding, discrete maps and Milnor
interfaces; E5:abstract's actual enhanced algebra, complete-base and section
limit compatibility. Relevant supplier statements were read. Refinements
not yet present in their plans remain explicit requests, with HR.3's
inherited generic gaps retained. The two enhanced signatures are explicitly
named mathematical omissions awaiting actual carriers, not proposition
placeholders. These honest limitations permit planned coverage and a
complete pass, but prevent closed coverage.

No question blocks acceptance. The orchestrator should retain these requests,
use the refined proofs at assembly, synchronize the reader's historical
baseline count and source-issue status with this review, and perform the
accepted QW ownership move atomically when its suppliers are installed.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroRings--HR.4.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/suggested/HabiroRings--HR.4.lean`:
  exit 0, 32 `declaration uses sorry` warnings, no errors or other warnings.
  Available memory was 87 GB before the single revised check. The shared
  Mathlib build is at the exact pin. Shared Tau Ceti HEAD differs, so the
  file imports only Mathlib; Tau Ceti was read at its recorded commit.
- Compilation checks the ordinary carriers, all 24 API items and seven
  example signatures. It proves none of the placeholder results and checks
  neither enhanced omission. No build, cache fetch or language server ran.

The packet review contains one verdict for each of the seven nodes and a
reasoned independent verdict for each of the three source issues.
