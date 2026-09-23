# André 2018 — corrected extraction after independent review

Verdict: **revise**. The review is complete; the extraction is **partial**.
Reviewer: Codex — codex-a71f92, job REV-PAPER-ANDRE-18 (#1465), 2026-09-23.
Input: PAPER-ANDRE-18 through PR #2009, merge 9a46ca49f53c206788bcbd51881caad2b8b1753e,
after PRs #1638 and #1807 by other workers. This reviewer did not author those submissions.

The packet now has 209 items: 12 library imports, 62 planned interfaces and
135 provisionally missing interfaces. Every missing item occurs in exactly one
route, but routing multiplicity is not ownership approval. Of three routes,
only the PerfectoidSpaces source route is accepted. The proposed Part II and
the AdicSpacesPartII:R0 source route are rejected pending revision.

## Source and scope

The [published paper](https://www.numdam.org/item/10.1007/s10240-017-0096-x.pdf),
*Le lemme d’Abhyankar perfectoïde*, Publications Mathématiques de l’IHÉS 127
(2018), 1–70, was downloaded and read in full, including proofs, footnotes and
bibliography. SHA-256:
`087521436778eed56e5bac98f6f2b441bc2898eef35ebba9da1c1575bf00f96a`.
Journal pages equal PDF pages. Page images were checked at 2, 7, 13, 21, 22,
24, 26, 27, 29, 30, 36, 41, 42, 43, 45 and 48. Other passages were read from
the PDF text. “Numbered paragraph” and “Lemma/Proposition/Theorem” must be
distinguished because their counters are separate.

The full input extraction and report were read. Its incompatible current
claims (“complete”, “85-item checkpoint”, and “no PDF bytes obtained”) are
replaced by this review's actual scope; inherited provenance is preserved
in verificationHistory, not presented as fresh work.

Auxiliary primary sources read:

- [Conrad, Completion of algebraic closure](https://virtualmath1.stanford.edu/~conrad/248APage/handouts/algclosurecomp.pdf), all three pages, especially Theorem 1.1. Hash `07052ff7a8c1a25ce876ca984f28d62e513998259906bd994d3dc1622cda3f5b`. The BGR proof of noncompleteness of the algebraic closure, cited there, was not read.
- [Güntzer 1974](https://www.numdam.org/item/10.24033/msmf.164.pdf), Lemma 3.5 and proof, printed 116–117, PDF 17–18, text and images. Hash `c81847caaf38dea6778e067d2d0389d3922e6528c9350fdd47da59e6220a939a`. This is a selected passage, not a whole-source reading.
- [Gabber–Ramero, author-hosted releaseLNM](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/lorenzo_ramero/releaseLNM.pdf), printed 37–38, Definition 2.4.23 through Proposition 2.4.28 and its proof. Hash `d6c1e641ce29cfe881f5a23dbef74fa59eb9403081a4638210ebd7b1c4140050`. This gives the evaluation-ideal criterion used in E19.

The arXiv PDF was not freshly downloaded or compared. Earlier version
comparisons belong to the previous workers. The arXiv submission history,
journal article and volume pages, publisher page, author's public page and
targeted title/erratum/phrase searches were checked on 2026-09-23. No formal
correction was found in that bounded search; historical novelty is not
established. Exact URLs and search scope are recorded in sourceIssues.
E14 is already corrected by André's footnote 16; it is not a new André error.

## What the paper supplies

Section 1 develops almost algebra for a general idempotent almost ideal with
flat tensor square, including adjoints, projectivity, descent, trace and
finite étale/Galois arguments. The ramified base must not be replaced
silently by the simpler valuation-ring almost base.

Section 2 develops uniform Banach algebras, spectral norms, integral models,
topological almostification, root saturation, rational localization and
limits/colimits. These are reusable foundations, not automatically owned by
a ramification application. Ordinary complete integral closure is neither
topological completion nor ordinary integral closure.

Section 3 supplies perfectoid and almost perfectoid algebra, tilting,
almost purity, monomorphism phenomena and categorical constructions.
The added items recover the missing monomorphism criterion and example
on p.45, Proposition 3.5.4(6), Lemma 3.5.5 and Proposition 3.5.6.
The corrected left adjoint and André's right perfectoid coreflection
must not be conflated with each other or with prismatic universal
perfectoidization.

Sections 4–5 give root-saturated Riemann extension, its inverse-limit
estimates, the localization/limit adjunction and perfectoid Abhyankar
envelopes. Theorem 4.4.2 asserts a fully faithful functor with right
adjoint and invertible unit, not arbitrary essential surjectivity.
Theorem 5.2.1 has its precise complete/modulo-p-power and generic-fibre
conditions; Proposition 5.2.3 uses two distinct almost bases.
Proposition 5.3.1 distinguishes the almost perfectoid envelope from its
maximal perfectoid subalgebra. Trace almost-surjectivity requires faithfulness.
The structure map into the envelope is not always injective.

Questions 3.5.1, 4.4.3 and 5.2.2 are questions in the version read. The
perfectoid conclusion of §5.4 remains conditional there. This report makes
no claim about the current research status of those questions.

## Library evidence and required comparisons

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`;
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
The relevant generated coverage index and AUDIT-35/38/39 records were inspected.
The index lacks these roadmap entries and lags AUDIT-39's embedded accepted
review; absence from that index is not absence from the libraries. AUDIT-35
and AUDIT-38 are leads, not reviewed absence certificates.

All declarations cited by the 12 library items were opened at the pins.
The eight inherited smoothing imports are valid. Their ten declarations in
`Mathlib/Analysis/Normed/Unbundled/SmoothingSeminorm.lean` are
`smoothingSeminormSeq`, `smoothingFun`,
`tendsto_smoothingFun_of_map_one_le_one`, `smoothingFun_le_self`,
`isNonarchimedean_smoothingFun`, `smoothingSeminorm`,
`isPowMul_smoothingFun`, `smoothingFun_of_powMul`,
`smoothingFun_apply_of_map_mul_eq_mul` and
`smoothingFun_of_map_mul_eq_mul`. Preserve normalization and
nonarchimedean hypotheses. These do not by themselves prove separation,
scalar homogeneity or completeness. The minpoly-based field spectralNorm
is not a replacement for this general construction.

Four newly separated library subinterfaces prevent needless reconstruction:

| Paper interface | Pinned provider | Residual comparison |
| --- | --- | --- |
| Power-bounded subring | TauCeti.Huber.IsPowerBounded; powerBoundedSubring, in RingTheory/Huber/PowerBounded.lean | Compare topological boundedness with norm-bounded powers and prove the residual Banach properties. |
| Topologically nilpotent ideal | TauCeti.Huber.topologicallyNilpotentIdeal, same file | Its ambient ring is A°, not A; compare the norm description. |
| Ordinary integral closure | integralClosure; mem_integralClosure_iff, Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean | Supply the algebra structure of the paper's inclusion; do not confuse with complete integral closure. |
| Finite invariant integrality | Algebra.IsInvariant.isIntegral, Mathlib/RingTheory/Invariant/Basic.lean | Algebraic result only; norm invariance and power-bounded-element comparison are separate. |

Further inspected reusable foundations are deliberately not labelled as
implementations of an entire bundled paper item:

- `CategoryTheory.ObjectProperty.SerreClassLocalization.abelian` in
  Mathlib/CategoryTheory/Abelian/SerreClass/Localization.lean: an abelian
  source, Serre class, preadditive target, additive functor and the specified
  localization instance yield an abelian target. Construct the almost-zero
  Serre class and comparison functor; this is not an already-built almost
  module category.
- `IsAlmostIntegral`, `completeIntegralClosure` and the comparison
  theorems in Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean
  use a regular scalar denominator in the base ring. The integral-to-almost-
  integral comparison has localization/fraction-ring hypotheses; the
  noetherian converse has additional regularity/domain hypotheses.
  The paper's finite-submodule definition for arbitrary extensions cannot
  simply be replaced by this carrier. Even an algebraic extension of fields
  demonstrates why “regular denominator in the base field” is narrower.
- `TauCeti.Huber.isIntegrallyClosedIn_powerBoundedSubring` and
  `isPowerBounded_of_isIntegral` already supply the topological integral
  closedness ingredient. Compare the ambient types before adding a new lemma.
- `PreTilt` in Mathlib/RingTheory/Perfection.lean, `PreTilt.untilt`
  in Perfectoid/Untilt.lean and `WittVector.fontaineTheta` in
  Perfectoid/FontaineTheta.lean are genuine providers. The untilt/theta
  maps require the relevant prime, nonunit-p and p-adic completeness
  hypotheses; `surjective_fontaineTheta` additionally requires surjective
  Frobenius modulo p. They are not a full perfectoid category or tilting
  equivalence. Do not reconstruct them while planning the residual comparison.

The search and statement checks above uncover positive reuse and invalidate
blanket absence claims. They do not complete a declaration-by-declaration
audit of every residual interface; no “missing” status is certified as
library absence. That is an explicit acceptance blocker, not work delegated
silently to a design job.

## Route decisions

1. **Accept source ownership: PerfectoidSpaces P0/P3/P8.** The current
   PerfectoidSpaces contract was read in full. General almost algebra and
   the corrected evaluation-ideal criterion belong to P0; finite étale and
   Galois almost-purity auxiliaries to P3; finite-group perfectoid invariants
   to P8. Import the library substructures rather than rebuilding them.
   This approves these owner assignments, not every inherited bundled
   interface or the rejected extension proposal.

2. **Reject PerfectoidRamification Part II as currently packaged.** Genuine
   ramified extension targets are plausible, but the item list also sweeps
   in generic Banach categories, uniform limits/colimits, Gelfand machinery
   and potentially already-owned perfectoid results. “Export later” does not
   satisfy §15. The current PerfectoidQuotients contract was read in full:
   Q2–Q4 concern prismatic universal perfectoidization, André flatness and
   closed quotients, not this right coreflection; that distinction does not
   establish a catalogue-wide no-collision result.

3. **Reject AdicSpacesPartII:R0.** Its read contract concerns morphisms and
   admissible affinoid fibre/tensor products with explicit plus rings.
   A dependency on complete topological algebra does not make it the owner
   of all norm comparison lemmas. The negative uniqueness example is a
   test construction, not the false source theorem to implement.

Four inherited planned claims were demoted: K-Ban's category,
its finite bicompleteness, arbitrary perfectoid inverse limits and the whole
cocompleteness package. Upstream Adic Layer 0 is not a checked category
construction; R0 is not all K-Ban; P5's cofiltered space limits correspond
to filtered algebra colimits, not arbitrary inverse algebra limits.
P2 and P5 are plausible ingredients for a colimit theorem, but the bridge
must be stated rather than inferred from a stage title.

## Source findings and mathematical corrections

The separate errata extraction by Codex codex-hjdg0j and its review by
Claude Code cc-fb70e5 were reconciled without editing their files.
E1–E18 keep stable IDs; E3 is rejected. All 17 accepted errata entries were
checked independently at their evidence. E19 and E20 are new candidates
confirmed by this review. Detailed quotations, reasons, provenance, search
history and reviewer verdicts are in result.json.

| ID | Decision and correction |
| --- | --- |
| E1 | Confirm: abstract complete spectral-norm uniqueness is false. Retain fixed-topology uniqueness; require group continuity or explicit isometry. The original extraction's orbit-polynomial repair was circular. Uses include pp.13,22,24,41, not just 13,22,41. |
| E2 | Confirm: uniqueness reference 2.2.2 becomes numbered paragraph 2.2.4, in its qualified form. |
| E3 | Reject: separate numbering counters are a convention. Qualify locators; do not renumber the paper. |
| E4 | Confirm: the p.41 value is 2^(3/2), not 2^(-3/2). |
| E5 | Confirm: invert ϖ rather than p in (2.17), including characteristic p. |
| E6 | Confirm: the lower bound is positive |a|, not 1; prove with power-multiplicativity and submultiplicativity. |
| E7 | Confirm: use the same Boolean complement index. The all-pairs printed relations force the zero ring. |
| E8 | Confirm: use K⟨T⟩ with T mapping to the element, not K with 1 mapping arbitrarily. Account for each projection's own bound. |
| E9 | Confirm: the untilts are rational localizations of A, not A♭. |
| E10 | Confirm: use (B°)^G in the integral-element equality. |
| E11 | Confirm: cite condition (2) for p-radicial closedness after localization. |
| E12 | Confirm: Shimomoto's volume 220(2), 621–632 is 2016. Correct the extraction's mistaken E3 pointer. |
| E13 | Confirm: an A-algebra structure is not necessarily an inclusion without faithfulness; A=K×K→K tests this. |
| E14 | Confirm, already corrected in print: Güntzer Lemma 3.5 needs reducedness, as André footnote 16 says. |
| E15 | Confirm: the relevant right adjoint is A↦A°, not the entire underlying set. |
| E16 | Confirm unconditional failure: localizations of K×K can project to one factor, despite invertible g. No refutation of the restricted isometric case is claimed. |
| E17 | Confirm editorially: delete the unfinished p.42 clause; this does not close the proof sketch. |
| E18 | Confirm: the pointwise completion is H(x)°, not global A°. |
| E19 | Confirm: arbitrary faithful almost projective need not be faithfully flat; use the evaluation-ideal criterion. |
| E20 | Confirm: the sharp uniformity estimate needs a dense value group; a fixed scalar factor repairs the general estimate. |

For E19, use the ordinary almost base (R,R), where R is the infinite product
of copies of F₂ and P is its finite-support ideal, the direct sum of Re_n.
Each summand is projective, hence P is projective. Every nonzero scalar
acts nontrivially on some Re_n, so P is faithful. But P is proper,
P²=P and P⊗(R/P)=P/P²=0 with R/P nonzero. It is not faithfully flat.
This is an infinite algebraic argument, not established by a finite test.
The correct criterion is that the image of P⊗P*→R equals R, precisely the
read Gabber–Ramero proposition.

For E20, let K=Q_p and L=Q_p(π), π²=p, with coefficient norm
‖a+bπ‖=max(|a|,|b|). It is complete and submultiplicative, while its
spectral norm is max(|a|,p^(-1/2)|b|). Thus L°=Z_p+Z_pπ and
sup over L° of the coefficient norm is 1, but ‖π‖=1>|π|_sp.
For any scalar 0<|c|<1, rescaling by powers of c gives the valid estimate
‖a‖≤C|c|^(-1)|a|_sp. If the spectral value is zero, arbitrary scalar
rescaling is power-bounded and boundedness forces a=0. The uniformity
equivalence survives; the displayed sharp constant does not.

Other clear in-place corrections include the nonzero hypothesis for a
domain, ordinary versus uniform rational localization, power-bounded
inverse versus norm unit ball, completed Tate finite levels in a Banach
colimit, distinct categories for “extremal epi” and “mono” on p.49, and
the nonadditive nature of x↦x^p on mixed-characteristic integral rings.
A finite étale algebra's arbitrary quotient is not necessarily a direct
factor; the finite-projective continuity argument avoids this shortcut.

## Remaining work before extraction acceptance

1. Split the multi-assertion §1, §2 and §3 entries into individually checked
   interfaces. Add the remaining §4.2.5–7 and §5.2.1 constructions listed in
   result.json.gaps, with their hypotheses and consumers.
2. Complete the residual provider/comparison audit and catalogue-wide owner
   search. Do not rebuild the positive providers above. Repair rejected
   routes only after their suppliers have actual contracts.
3. Close the ordinary-to-integral implication in Lemma 2.3.5, carefully
   distinguishing ordinary φᵃ from topological φ^â. Its printed proof appears
   to repeat the latter hypothesis; this report records an unresolved proof
   obligation, not an additional confirmed source erratum.
4. Expand §3.4.4's henselian approximation and descent sketch with an acyclic
   proof order. E18's pointwise correction and E17's editorial repair do not
   settle those obligations.
5. Keep application-specific continuity in every E1-dependent argument;
   no blanket “no main theorem affected” certification has been established.

No Lean file is required by this review, and no Lean compilation was run.
Machine checks validate the data and finite regression examples, not the
mathematics of the paper. See the review report for executed checks.
