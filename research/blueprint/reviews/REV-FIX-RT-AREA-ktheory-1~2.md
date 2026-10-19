# Independent review: REV-FIX-RT-AREA-ktheory-1~2

## Current continuation: Codex codex-KwyvX3, 19 October 2026

Refs #5542. The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6262919229)
was confirmed by the bot on 19 October 2026 at 08:23:47 UTC. This session
wrote none of the original fixes and took no second job.

**Blocked checkpoint.** The live issue names seven packet/Lean pairs; the
actual queue requires nineteen. Calling the unmodified
`issues.deliverables_complete` on the actual queue job returns false for the
twelve additional packets listed in the handoff. The seven existing area
verdicts, including the negative K.1/K.6 verdicts, already satisfy that
predicate individually. Historical seventeen/ten inventories in their review
notes are obsolete; this continuation does not renew those mathematical
verdicts.

[WORKERS.md, Doing the work](../WORKERS.md) says “Edit only the files the issue
names.” Expanded authorization was requested for all twelve additional
packet/Lean pairs, but no authorizing response has arrived. Only this report
and the handoff change. The new contribution below is a proof reconstruction
for the specific supplier obstruction identified in finding /37, with the
local-coefficient and homotopy-uniqueness steps made explicit. It is not a
review stamp on an additional packet.

### Finding /37: a general-target proof route with its missing interface exposed

The finite-field consumer still attributes an equivalence to the weaker,
abelian-target `H.3/plus-construction-universal-property`. The preceding
diagnosis remains valid. The supplier already suggests a pushout argument
without using it. The following reconstruction explains how that argument
can establish the general-target factorization without first assuming that
BGL(R)⁺ is an abelian space.

Let f : X → Y be a plus construction relative to a perfect normal subgroup
P of π₁X, with X and Y connected CW complexes. Let g : X → Z be a map to
any connected CW complex such that g kills P on π₁. Then there is a map
h : Y → Z with h f homotopic to g, and any two such h are freely homotopic.
This is the contract of Weibel, *The K-book*, IV, Theorem 1.5(2), printed
p. IV.5. His paragraph preceding the theorem delegates its proof to
obstruction theory; the argument here instead uses the packet's proposed
pushout and the public local-coefficient results below.

1. Make the maps cellular and use the double mapping cylinder
   W = Y ∪ (X × I) ∪ Z, attaching the ends by f and g. Equivalently,
   glue the mapping cylinder M_f to Z along its domain-end X. This is a
   homotopy pushout, with a CW inclusion i : Z → W and a map j : Y → W;
   the cylinder supplies the homotopy j f ≃ i g. Ordinary gluing without
   this cofibration replacement would not justify the argument.
2. Write A = π₁X and B = π₁Z, choosing the connecting paths in the
   cylinder. Van Kampen identifies π₁W with the group pushout of
   B ← A → A/P. This is B modulo the normal closure of g_*(P), hence B
   because g_*(P) is trivial. In particular i induces an isomorphism on
   π₁. No assumption that B is abelian is used.
3. For each local coefficient system L on W, relative excision for this
   cylinder gluing identifies H_n(W,Z;L) with
   H_n(M_f,X;L restricted along M_f → W). Acyclicity of f gives the
   homology isomorphism with every coefficient system pulled back from
   M_f ≃ Y, by `H.3/acyclic-map-homology-criterion`; the relative groups
   therefore vanish in every degree. The long exact sequence gives that
   i is a homology isomorphism for every L. This step requires excision
   with local coefficients, not just excision with a constant coefficient
   object in an abelian category.
4. In particular take the regular π₁W-module ℤ[π₁W]. Its homology is the
   integral homology of the corresponding cover. Because i induces an
   isomorphism on π₁, the pulled-back cover over Z is its connected
   universal cover. Thus the lift between the universal covers is an
   integral homology isomorphism between simply connected CW complexes.
   Homological Whitehead makes that lift a homotopy equivalence. Covering
   theory then gives isomorphisms on all higher homotopy groups for i;
   together with its π₁ isomorphism, ordinary Whitehead makes i a homotopy
   equivalence. This uses only the simply connected homological Whitehead
   theorem supplied by upstream AlgebraicTopology Stage 8.
5. Choose a homotopy inverse r : W → Z and put h = r j. The cylinder
   homotopy and r i ≃ id_Z give h f ≃ g.
6. For uniqueness, suppose h₀ f ≃ g ≃ h₁ f. Each chosen homotopy defines
   a map k_a : W → Z that restricts to id_Z on Z and to h_a on Y, by the
   double mapping cylinder's defining property. Since k_a i = id_Z and
   i is a homotopy equivalence, both k_a are homotopic to r. Restricting
   these homotopies along j gives h₀ ≃ h₁. This proves free homotopy
   uniqueness; it asserts no canonical based homotopy or literal equality.

The precise remaining supplier interface is the local-coefficient excision
isomorphism in step 3, natural under cylinder gluing and restriction of L.
Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
§3.H, printed p.333, gives relative local-coefficient homology, its long
exact sequence and excision via subdivision. Example 3H.2, printed p.329,
identifies regular-module homology with universal-cover homology. Theorem
1.20, printed p.43, supplies van Kampen; Corollary 4.33 with its proof,
printed pp.367–368, supplies the simply connected homological Whitehead
step. I directly read these passages. The cylinder-gluing application and
the uniqueness argument above are this session's reconstruction, rather
than a claim that the source supplies a new ready-made packet node.

Three discriminating controls for the future supplier repair are:

- P = 1, f = id and g = id on B(S₃): the factor must be homotopic to the
  identity although the target's fundamental group is nonabelian.
- g = f with Z = Y: the factor is homotopic to id_Y. Applied to two plus
  constructions relative to the same P in both directions, uniqueness
  makes their comparison maps inverse equivalences under X.
- Hatcher's Example 4.35, printed pp.368–369, must be rejected as an
  acyclic input: S¹ → (S¹ ∨ Sⁿ) ∪_(2t−1) e^(n+1), n > 1, is a π₁
  and integral homology isomorphism. Its universal-cover relative
  differential is multiplication by 2t−1 over ℤ[t,t⁻¹]; its cokernel is
  nonzero (evaluation t = 1/2 maps it onto ℤ[1/2]). Taking constant
  coefficients replaces this differential by 1 and loses the obstruction.

This route does not finish finding /37: the consumer must still import
`H.3/plus-hspace-recognition` and `H.4/plus-hspace-block-sum`, discharge
their hypotheses for F_q, and retain the separate gaps in
`L.1/quillen-homology-iso`. General factorization alone is not the
finite-field equivalence. The twelve packets remain outside the authorized
edit scope, so no supplier gap was deleted and no extra verdict was issued.

### Current-library boundary and validation

I read the current upstream AlgebraicTopology and GrothendieckEulerForms
READMEs, and inspected the relevant AlgebraicTopology suggested signatures.
At current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`,
`LocalCoefficientSystem`, its `pullback`, `TopPair.twistedChainComplex`,
`TopPair.shortExact_twistedChainComplexShortComplex` and the three
`TopPair.twistedHomology_exact_*` lemmas already exist. Their definitions
and statements were read in `AlgebraicTopology/LocalCoefficient.lean` and
`AlgebraicTopology/Singular/Twisted/Relative.lean`. These objects must be
consumed, never planned again. The latter file does not exist at the older
f790474 pin; the current-library observation is not a pinned-baseline claim.
The actual `TopPair.isIso_singularHomologyMap_of_open_cover` in
`AlgebraicTopology/Singular/Excision.lean` uses a single coefficient object;
its statement does not supply step 3's variable local system. No declaration
of twisted excision was found in the current tree. Do not infer that
stronger theorem from the ordinary theorem's coefficient-category generality.

All nineteen queue packets pass `scripts/check_blueprint.py` with the shared
pinned declaration index: zero errors and zero warnings. The twelve extra
checks are read-only structural checks. There are no standalone link-map or
restructuring outputs. No Lean file changed or was compiled; inherited
elaborations remain attributed below. `git diff --check` is part of the
submission checks. The actual completion predicate remains false for the
twelve missing area verdicts, independently of the mathematical observations
above. Source hashes and the concrete resumption steps are in the handoff.

## Previous continuation: Codex codex-FcWva7, 19 October 2026

Refs #5542. The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6261679883)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6261682054).
This session wrote none of the original fixes and claimed no second job.

**Blocked checkpoint.** The live issue still lists seven packet/Lean pairs;
the checked-out queue requires nineteen. The actual, unmodified
`issues.deliverables_complete(job)` returns false for exactly the twelve
additional packets listed in the [handoff](../handoff/REV-FIX-RT-AREA-ktheory-1~2.md).
The seven issue-listed packets already carry completed area-review verdicts,
including the negative K.1/K.6 outcomes. These inherited verdicts were not
renewed in this session.

[WORKERS.md, Doing the work](../WORKERS.md) says “Edit only the files the issue
names.” Expanded authorization was requested from the operator; no response
authorizing the twelve additional pairs has arrived. Only this report and its
handoff change. Resolving the scope mismatch is required before those reviews
can be completed. The queue and other reviewers' verdicts were not changed.

### Finding /37: the exact missing supplier contract

Fresh reading refines the previously recorded finite-field Whitehead concern.
The current `KTheoryFiniteLocalFields:L.1/quillen-fibration` proof step 2
attributes an equivalence conclusion to
`StableHomotopyKTheory:H.3/plus-construction-universal-property`. Its actual
supplier statement gives existence and homotopy uniqueness of a factorization
into a connected abelian CW target. It does not give the claimed equivalence.
The consumer's statement that this supplier's proof is unread is also stale:
the supplier now has an abelian-target proof using obstruction theory.

The exact recognition contract is `H.3/plus-hspace-recognition`. Its
equivalence clause requires both an integral homology isomorphism and an
abelian plus source. The consumer has the first through
`L.1/quillen-homology-iso`, but its prerequisites do not import the second.
`H.4/plus-hspace-block-sum` is the proposed supplier of an H-space structure
on BGL(R)⁺, hence of the required trivial fundamental-group actions via
`H.3/hspace-is-abelian`. The perfect elementary subgroup is supplied by
`KTheoryLowDegrees:U.1/stable-elementary-perfect` and the accompanying
Whitehead-lemma contract. `L.1/fpsi` supplies the target H-space; its
connectedness is also required when applying recognition.

The concrete repair after scope authorization is to import the recognition
and block-sum contracts explicitly, discharge these hypotheses for R = F_q,
and replace the consumer's overstatement of the universal property. Keep the
supplier gap visible: the first block-sum proof step itself calls out the
unproved universal property for nonabelian targets, since BGL(R)⁺ is not yet
known to be abelian at that step. A mere import substitution does not close
this chain. This is a read-only diagnosis, not a new verdict on either extra
packet or a claim to have proved the missing supplier.

I read the following public sources directly on 19 October 2026:

- Haine, [*On the K-theory of finite fields*](https://math.berkeley.edu/~phaine/files/KFF.pdf),
  §6, Theorem 6.5 and Goal 6.6, printed p.10. Goal 6.6 separates plus
  factorization from the subsequent simplicity checks and homological
  Whitehead argument. Construction 6.11, printed p.11, constructs the map;
  it does not remove those checks.
- Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  §4.3, Corollary 4.73 and Proposition 4.74 with proofs, printed pp.417–418.
  The latter applies to connected abelian CW complexes. Its proof uses
  obstruction theory to obtain a retraction and then trivial relative
  fundamental-group actions for relative Hurewicz. This supports the
  separate supplier interface, rather than the consumer's stronger reading
  of the plus universal property.

The current upstream AlgebraicTopology Stage 8 was checked: its homological
Whitehead theorem has simply-connected hypotheses. It cannot substitute for
this contract for general q, when π₁(BGL(F_q)⁺) = F_qˣ. Source hashes and the
exact resumption steps are in the handoff. All statements here are in my own
words; no source passage is stored in the repository.

### Validation and limits of this continuation

All nineteen queue packets pass `scripts/check_blueprint.py` with the shared
pinned declaration index: zero errors and zero warnings. Checks of the twelve
extra packets are structural, read-only checks. They do not certify their
mathematics or replace their independent reviews. There are no standalone
link-map or restructuring deliverables. No Lean companion changed or was
compiled; earlier successful elaborations below remain attributed to their
authors. No build, update, cache download or language server ran.

## Previous continuation: Codex codex-DDV2ll, 19 October 2026

Refs #5542. The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6260970357)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6260972383).
This session wrote none of the original fixes and claimed no second job.

**Blocked checkpoint.** A fresh read of the live issue still authorizes seven
packet/Lean pairs. The unmodified local queue requires nineteen. Its actual
`issues.deliverables_complete` predicate returns false because the twelve
additional packets do not name this area-review job in their review objects.
The seven existing area-review verdicts are completed outcomes, including the
negative K.1/K.6 verdicts; none was renewed or changed by this session.

[WORKERS.md, Doing the work](../WORKERS.md) says “Edit only the files the issue
names.” Expanded authorization for the twelve additional pairs was requested
from the operator, but no authorizing response has arrived. Only this report
and the handoff are edited. The issue, queue, packets, Lean companions and
other reviewers' verdicts are preserved. The [handoff](../handoff/REV-FIX-RT-AREA-ktheory-1~2.md)
lists the current twelve outstanding pairs and the exact resumption action.

### Fresh read-only clarification of findings /5, /23 and /33

The earlier mathematical warning about missing homotopy associativity needs
qualification. The current node
`StableHomotopyKTheory:H.3/rational-hurewicz-hspace` uses a free-cohomology
Cartan–Serre argument, explicitly avoiding Milnor–Moore. I independently read:

- Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  §3.C, printed pp.283–286, particularly Theorem 3C.4 and its proof. The
  associative multiplication in that theorem is the cohomology cup product.
  The coproduct data on p.283 do not require a homotopy-associative H-space
  multiplication.
- Hatcher, [*Spectral Sequences*, Chapter 1](https://pi.math.cornell.edu/~hatcher/SSAT/SSch1.pdf),
  Theorem 1.24 and proof, printed pp.38–39. For an abelian space with the
  specified finite-type free rational cohomology, the maps representing its
  generators give its rationalization as a product of Eilenberg–Mac Lane
  spaces. The paragraph following the proof applies this to H-spaces.

Both public author PDFs were read on 19 October 2026; their SHA-256 values are
recorded in the handoff. Thus the absence of a separate homotopy-associativity
hypothesis alone is not evidence against the current node's chosen route.
This does not certify the full primitive-image argument or its supplier
closure. The verifier's /5 and /33 assignment of a single owner in H.6 is
still not carried by the actual H.3 parent and Borel R.3 imports. Ownership
coordination and the mathematical validity of an alternative proof must be
assessed separately when expanded review is authorized.

For /23, both current scheme coniveau spectral-sequence nodes directly import
`H.6/exact-couple`, `H.6/filtered-spectrum-spectral-sequence` and
`H.6/spectral-sequence-convergence-exhaustive`. I read those three supplier
statements: the two finite-dimensional scheme filtrations need their finite,
bounded convergence case. The old missing-import complaint is repaired at
this explicit-contract level. This is not an independent review of the whole
SchemeKTheoryOperations packet.

The current upstream AlgebraicTopology and GrothendieckEulerForms READMEs were
read without modification. AlgebraicTopology Stage 8 still provides the
simply-connected homological Whitehead theorem; the simple-space extension
must not be claimed as already supplied by that upstream stage.

### Fresh validation

All nineteen queue packets pass `scripts/check_blueprint.py` using the shared
pinned declaration index: zero errors and zero warnings. The twelve extra
checks are read-only structural checks, not new review verdicts or
certifications of their baseline statements. The actual completion predicate
and live seven-pair issue scope were checked again after validation. There
are no link-map or standalone restructuring deliverables. No Lean file was
changed or compiled; the earlier elaborations below remain attributed to
their authors. No source passage or private source file was copied into the
repository.

## Previous continuation: Codex codex-DLf03v, 19 October 2026

Refs #5542. The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6260106653)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6260108343).
This session wrote none of the fixes under review and claimed no second job.

**Blocked checkpoint: the live issue authorizes seven packet/Lean pairs,
whereas the checked-out queue requires nineteen.** The fresh call to
`issues.deliverables_complete` returns false. Twelve packets retain other
independent reviewers rather than this area-review stamp. In particular,
`K2SymbolsBrauer--T.1-classical` and `K3BlochGroups--V.1` are current queue
outputs: the preceding handoff's statement that they were no longer outputs
is incorrect for this checkout. The handoff now lists all twelve missing
area reviews. Its historical seventeen/ten inventory must not guide resumption.

[WORKERS.md, Doing the work](../WORKERS.md) says “Edit only the files the issue
names.” Expanded scope was requested from the operator, including those two
additional pairs; no authorizing response has arrived. Neither the issue nor
the queue was edited to bypass the discrepancy. No additional packet review
was stamped, and all seven inherited verdicts remain unchanged. The negative
K.1/K.6 verdicts are completed review outcomes and do not cause this failure.

One read-only resumption lead corrects the older omission list: both
`SchemeKTheoryOperations:S.4/k-coniveau-spectral-sequence` and
`SchemeKTheoryOperations:S.4/g-coniveau-spectral-sequence` now directly import
`StableHomotopyKTheory:H.6/exact-couple`,
`H.6/filtered-spectrum-spectral-sequence` and
`H.6/spectral-sequence-convergence-exhaustive`. The missing-import aspect of
finding /23 is therefore repaired in the current packet. This observation
checks the explicit prerequisites; it is not a new source certification or
whole-packet verdict. The current H.3 rational-Hurewicz node and its Borel R.3
consumers still use the H.3 owner, so the earlier H.6 routing concern remains
a resumption lead.

Fresh validation: all seven issue-listed packets pass `check_blueprint.py`
with the shared declaration index, zero errors and zero warnings. Only this
report and its handoff change. No Lean file changes or fresh elaborations
were needed; the seven earlier successful elaborations remain attributed to
their authors below. There are no link-map or standalone restructuring
proposal deliverables to validate. The checker does not certify the missing
twelve reviews or mathematical proof closure.

## Earlier review record (attributed to the named sessions)

The record below preserves earlier source readings and corrections. Statements
about the queue inventory describe those sessions' diagnostics; the current
nineteen/twelve inventory above supersedes them. No earlier source reading,
finite-certificate reproduction or Lean elaboration is claimed as new work by
codex-DLf03v.

Refs #5542. Codex, session `codex-WBAmLh`, 19 October 2026.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6258124657)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6258126178).
This session wrote none of the original fixes being reviewed.

**Checkpoint: the seven authorized pairs are reviewed and their fixable Lean
shape defects are corrected.** The live issue names seven packet/Lean pairs,
whereas the current `queue.json` requires seventeen. WORKERS.md permits edits only to
issue-named files. Expanded authorization was requested but has not arrived.
The remaining ten pairs were inspected read-only; their other independent
reviews were preserved. Their missing area-review verdicts make the actual
queue job incomplete. A negative review is itself a completed review outcome;
the negative K.1/K.6 verdicts do not cause this completion-predicate failure.
See the [handoff](../handoff/REV-FIX-RT-AREA-ktheory-1~2.md) for the exact list.

This report replaces the repeated checkpoint narrative with current findings.
Earlier source certifications, repairs and failed checks remain attributable
to their authors in the packets' review histories and the
[preceding report](https://github.com/CBirkbeck/tauceti-explorer/blob/1634ea539f881e9dd1a96cacedcd866a4ccad598/research/blueprint/reviews/REV-FIX-RT-AREA-ktheory-1~2.md).
In particular, the prior reviewers' restricted-book readings are not presented
as this session's readings. No source passage is newly quoted here.

## Packet verdicts and corrections

Each immediately preceding top-level review is preserved verbatim in
`reviewHistory`. Every new review names this area-review job. Partial packet
statuses, unrelated gaps, supplier requests and unchecked implementation flags
are retained. Acceptance below concerns the confirmed area-fix obligations,
not completion of every target or supplier.

| Packet | Verdict | Reason |
| --- | --- | --- |
| ArithmeticKTheory--N.1 | Accepted | Mathematical contracts retained; admitted K₀/K₁/twist data removed from the Lean companion. |
| GeneralAlgebraicKTheory--K.1 | Needs changes | Actual product/cofinality stage ordering still needs the proposed restructuring. |
| K2SymbolsBrauer--T.3 | Accepted, scoped | Arbitrary-residue DVR support is explicitly routed with hypotheses and multiplicities; supply remains an open gap. |
| ArithmeticKTheory--N.7 | Accepted, scoped | Direct golden-field argument and exact finite certificates replace the obsolete cyclotomic route. |
| GeneralAlgebraicKTheory--K.6 | Needs changes | Lean shape corrected; actual stage ordering remains unresolved. |
| K2SymbolsBrauer--T.1 | Accepted | UCE/Hopf/transgression contracts retained; admitted construction data removed from Lean. |
| K3BlochGroups | Accepted | Ownership fixes retained; oversized construction file replaced by statements over pinned kernel/tensor carriers. |

The four changed Lean companions now follow the current WORKERS shape rule:

- **N.1:** retain the S-unit preimage submonoid, localization milestones,
  height-one prime test notation, period-four rank formula and examples.
  Remove admitted ring K₀/K₁ maps and equivalences, the invented Tate-twist
  development and the other construction/API chains.
- **K.6:** retain a finite-domination record over Mathlib chain complexes,
  existence of transport and a homotopy idempotent, and two examples.
  Replace admitted transport/homotopy data with existence propositions;
  remove the cone-ring instance and Nil-category development.
- **T.1:** retain centrality/universality and superperfectness predicates,
  actual integral Mathlib group homology, recognition and kernel/H₂
  milestones, and simple controls. Remove admitted Steinberg presentations,
  lifts, bar objects and chosen comparison equivalences.
- **K3:** retain the actual kernel element `(mx,h)` and its divided tensor
  class with a specified unit denominator, the projection and independence
  milestones, and concrete controls. Remove admitted field-Bloch, higher-K,
  comparison and auxiliary construction development. The generic algebra
  does not identify arbitrary groups with absent field objects.

These are selections of statements, not replacement roadmaps. Before removal,
I checked that the full targets, API outlines and discriminating checks already
occur in the existing reader documents, including V.6's integral-root-multiple
and root-coefficient-class. No reader file is an authorized deliverable here,
and none was edited. No target node was deleted or weakened. The changes do
not implement the removed constructions or prove admitted theorems.

## Current mathematical evidence and boundaries

**N.7 and finding /11.** The current golden-field route uses Tate descent,
bounded congruence representatives, ordinary-unit stretch and descent across
an earlier prime of equal norm. It does not require the former Zhang–Xu/
Skalba cyclotomic representative step. The large-prime inequality is
`16(2√5/π)² = 320/π² < 33`; the unit-symbol upper bound four and the two-real-sign
lower bound four are independent of Birch–Tate. The retained Gaussian route
uses its own norm bound and norm-two symbol calculation. The earlier scoped
acceptance and detailed proof reading are retained with their attribution.

This session independently recomputed every finite certificate in
`certificateData.certificates` of N.8/golden-finite-prime-certificates:
**11 certificates, 173 relation witnesses and 23 selected determinants**.
The indices are `3,4,8,10,10,18,18,28,28,30,30`. The verifier checked prime norms,
the exact earlier-prime generator list, residue images and multiplicative
generation, factor exponents, the equation `a−b=πw`, exponent differences,
selected determinants and their gcd `q−1`. A changed coordinate of one
`differenceOverPrime` witness was rejected. This does not claim a separate
Smith-form computation of the complete relation lattice.

Reproduction without scratch: represent elements by `(a,b)` with `ε²=ε+1`.
Multiply as `(ac+bd,ad+bc+bd)`; invert using
`((a+b),−b)/(a²+ab−b²)`. Reduce modulo `(π)` by multiplying by `π⁻¹`, taking
both coordinates modulo one and multiplying back by `π`. Enumerate the subgroup
of nonzero residue classes generated by the stored old-unit generators; its
size must be `q−1`. Verify every stored factorization and witness equation.
For each stored minor take the specified relation columns, compute its exact
integer determinant and require the gcd to be `q−1`. Mutating a witness must
fail. This checks the concrete finite data, not external supplier closure.

The existing Gaussian title and `w₂=24` check retain the previous review's
correction: `K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24`, rather than a finite group of order 24.
The factorization of `w₂` is `8·3`. The field invariant and the arithmetic
specialization agree with [K-book VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf),
Example 2.1.2, chapter p.7, and Corollary 5.3, chapter p.24.
Three unrelated N.7 gaps and ten supplier requests remain open.

**T.3 and findings /12,/28.** I rechecked the explicit LocalFieldsRamification
Part II support plan. Its four contracts cover normalized complete-DVR
extensions, the finite free normalization lattice and `ef`, determinant norms
with valuation/residue comparisons, and componentwise Artin-length base change.
Inseparable residue extensions remain allowed; the generic product-of-fields
claim retains separability. For the ramified control `s²=t` over `ℚ((t))`,
`N(s)=−t` and `(e,f)=(2,1)`; a constant quadratic extension has `(e,f)=(1,2)`.
The characteristic-two control retains nonreduced residue-tensor lengths.

Freshly read [Stacks Lemma 10.121.8, 02MJ](https://stacks.math.columbia.edu/tag/02MJ)
requires a one-dimensional Noetherian local domain and a finite extension of
domains for its norm/order formula; it requires no finite residue field.
[Remark 15.116.1, 09EM](https://stacks.math.columbia.edu/tag/09EM) distinguishes
the reduced generic tensor from its integral closure, and explains the
separable case. It is not a citation for the entire stronger componentwise
identity. [Lemma 10.119.7, 00PD](https://stacks.math.columbia.edu/tag/00PD)
supplies the Noetherian local normal dimension-one DVR criterion.
The support plan's extra length calculation remains its own proof obligation.

Current Tau Ceti already exports `TauCeti.Algebra.norm_quotient_mk` in
`RingTheory/Norm/Quotient.lean`, lines 29–48, for a finite free commutative
algebra. I read that statement separately from the pin: the supplier must
reuse it, not re-plan it or assume it belongs to the older pinned build.
The Part II still needs registration and supply. That gap and five other T.3
gaps are retained, including the distinct finite-rank commutative-ring
monomial-kernel obligation. Field Matsumoto does not supply that statement.

**T.1 and findings /29,/30.** Fresh reading of
[K-book III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf),
Definition 5.3.1, Lemmas 5.3.2–5.3.3, Example 5.3.4 and Recognition Theorem 5.4,
chapter p.37, supports the retained UCE conditions, perfectness, rigidity,
Hopf identification and superperfect recognition milestone. The reader still
carries the integral bar-kernel, actual naturality maps and positive-boundary
comparison. Its odd-order Heisenberg control distinguishes the two signs;
the comparison itself remains a target, not an established Lean proof.
The CFT6 character-evaluation identity also remains supplier work.

**K.1/K.6 and findings /4,/19,/20.** The current graph of **470 concrete nodes**
in the seven packets is acyclic. Projecting to actual stage parents still
produces backwards product dependencies:

- `K.7/products-from-biexact-functors` supplies `K.6/nonconnective-spectrum`,
  against the atlas path `K.6 → K.7`.
- `K.7/biexact-stabilized-pairing` supplies
  `K.3/localization-product-boundary`, against `K.3 → K.5 → K.6 → K.7`.

Both edges and opposing paths were recomputed in this session. Proposed
`K.7:products` and `K.3:cofinality` stages are still absent from the actual
atlas. The maintainer must apply the early-product/late-cofinality splits.
Workers do not edit the atlas to apply restructuring. Successful elaboration
and the concrete-node DAG do not resolve this stage-order defect or establish
closure through external suppliers.

## Every confirmed finding

The verifier confirmed /1–/37 and /39. It rejected /38; /40–/49 are outside
this round's confirmed high/medium scope. A contract acceptance below judges
the correction and its explicit boundary; it does not certify its supplier.

| Finding | Verdict | Reason and remaining boundary |
| --- | --- | --- |
| 1 | Accept contract | Rank-zero and positive-rank strata are separate; the latter uses the integral orientation-twisted Steinberg module, including nonfree projectives. |
| 2 | Accept contract; supplier open | Field, smooth and Dedekind comparisons retain separate hypotheses. M.7's étale comparison alone is not the full Zariski truncation/naturality interface. |
| 3 | Accept contract | Real/complex comparison distinguishes KO and KU and preserves the dyadic degree-zero exception. |
| 4 | Needs changes | The construction/additivity split is present, but actual product parents still create the stage-order conflict above. |
| 5 | Accept routing; destination open | Simple-space Whitehead belongs to H.3; rational Hurewicz belongs to H.6. The destination placement still needs correction. |
| 6 | Accept contract | Inner forms, archimedean splitting, measures and a rational nonzero volume remain explicit hypotheses. |
| 7 | Accept repair | The higher S-integer rank formula starts at degree two; K₁ keeps its finite-place unit contribution. |
| 8 | Accept ownership | M.3 owns the general-field symbol and arithmetic Tate comparisons; T.7 and N.6 import them. |
| 9 | Accept ownership | N.6 owns independent certificate bounds, T.5 the tame sequence and N.8 instances; the separate ring monomial-kernel source gap remains. |
| 10 | Accept repair | Twisted-invariant finiteness and independent positive-degree K-finiteness precede Birch–Tate. |
| 11 | Accept replacement | The direct golden-field argument supersedes the defective cyclotomic route; all finite data were rechecked. |
| 12 | Accept routing | The arbitrary-residue DVR Part II has explicit contracts; registration and implementation remain open. |
| 13 | Accept contract | BGK allows imperfect fields; differential/Cartier support is separated from prime-power logarithmic Witt support. |
| 14 | Accept repair | The Kummer product has two root-of-unity factors before a chosen coordinate contraction. |
| 15 | Accept repair/contract | Relative S-construction retains augmentation, path and iteration; realization and fibre comparisons remain H.2 obligations. |
| 16 | Accept contract | H.5 supplies graded/truncated chain-to-HR comparison and representability, beyond a bare spectrum. |
| 17 | Accept repair | Noncommutative right-module gluing, resolution and Nil/Laurent inputs remain distinct from the scheme results owned elsewhere. |
| 18 | Accept contract | Relative triples and interior exactness do not assert unrestricted excision or unconditional henselian π₁-surjectivity. U.1 compilation remains supplier work. |
| 19 | Accept mathematics; ordering open | Ring scalar extension and continuity precede nonunital unitization/corner fibres; the corner is not treated as unital. The actual stage split is pending. |
| 20 | Needs changes | Early free/projective comparison avoids general cofinality, but the latter still lacks its actual late parent stage. |
| 21 | Accept correction | Resolution retains ambient admissible-subobject closure and the stronger successive bounded-length condition; pinned exact structures and ExactK₀ are reused. |
| 22 | Accept contract | Coverings and local systems remain in H.1–H.3; twisted Serre comparison imports AT8 rather than constant coefficients alone. |
| 23 | Accept contract | Scheme coniveau owns its filtration and imports exact-couple/convergence support from H.6. This is not a full SchemeKTheoryOperations verdict. |
| 24 | Accept contract | Number-field SK₁ retains the finite-index unit argument and exceptional rank-one cases. |
| 25 | Accept contract | Bass–Milnor–Serre stays within the confirmed number-field scope and uses reciprocity; no function-field extension is inferred. |
| 26 | Accept repair | T.3 imports the precise K.3 index/DVR sign nodes; T.5 separates outside-S residues from in-S relative exactness. |
| 27 | Accept convention | Arithmetic Frobenius acts in the second symbol slot; the cubic ℚ₇ control and `c₂,₂=−h` remain. CFT6 still owes the evaluation proof. |
| 28 | Accept repair/routing | Transfer comparison and residue comparison are distinct; complete-DVR substrate is the explicit Part II, not finite-residue support. Restricted-source certification is inherited. |
| 29 | Accept ownership | V.1 imports T.1 perfectness/UCE and owns the plus-fibre adapter; V.5 imports N.5, and N.8 imports V.5. |
| 30 | Accept repair | Integral bar kernels, `H₁=N/[E,N]`, actual naturality and the positive boundary are explicit; the odd-order control detects inversion. The comparison is still proposed. |
| 31 | Accept correction | The doubled affine plane distinguishes vector-bundle K₀=ℤ from perfect K₀=G₀=ℤ²; existing upstream material is noted rather than replanned. |
| 32 | Accept ownership | AC12 owns point/place comparison, AC2 normalization and EC2 disjoint-support evaluation/reciprocity conventions. |
| 33 | Accept routing; destination open | Connectedness and finite-type qualifications remain on the H.6 rational homotopy contract; R.3's H.3 placement still needs rerouting. |
| 34 | Accept contract | Borel eigenspaces require both algebraic Adams operations from S.6 and topological comparison from RT.4. |
| 35 | Accept contract | R.2 uses early ALS.5 Betti/de Rham/Lie-quotient comparison, not downstream AS.5. |
| 36 | Accept retained contract | Burgos' all-weight normalization and determinant factor remain; weight two is only a control. Earlier full source certification is not renewed here. |
| 37 | Accept contract; supplier open | Green choices, induction/restriction and topological comparison are separated; the simple-space argument is still owed. |
| 39 | Accept contract | General logarithmic Witt support precedes DVR/TR specialization, preserving odd-prime/ℤ₍p₎ hypotheses and CR4/5 before Hyodo–Kato. |

## Validation and its limits

All seventeen current queue packets pass `scripts/check_blueprint.py` with zero
errors/warnings; the ten additional passes are read-only schema checks,
not independent review acceptances. There are no separate link-map or
restructuring-proposal deliverables in this issue, so their standalone
checkers are inapplicable; embedded proposal fields are checked as packet data.

All seven authorized Lean companions elaborate serially with `lean-check` at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and the shared Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` build. Available memory was above
20 GB before each run. The Mathlib source commit was checked directly; the
Tau Ceti snapshot pin is the shared build's recorded pin, not a newly queried
Git revision of that source snapshot.

| Suggested basename | Lines | Errors | Sorry warnings | Admitted-data diagnostic |
| --- | ---: | ---: | ---: | ---: |
| ArithmeticKTheory--N.1 | 124 | 0 | 10 | 0 |
| GeneralAlgebraicKTheory--K.1 | 45 | 0 | 0 | 0 |
| K2SymbolsBrauer--T.3 | 605 | 0 | 30 | 0 |
| ArithmeticKTheory--N.7 | 551 | 0 | 27 | 0 |
| GeneralAlgebraicKTheory--K.6 | 65 | 0 | 3 | 0 |
| K2SymbolsBrauer--T.1 | 95 | 0 | 8 | 0 |
| K3BlochGroups | 101 | 0 | 10 | 0 |

Only sorry warnings occur. The data-body check was run on scratch copies
with nested block and line comments removed, preserving line numbers,
and the changed definitions were inspected manually. The heuristic alone is
not a complete shape proof. K.1's former future signatures were comments; the continuation below removes
them. Its zero-warning result certifies only its actual pinned-library examples.
The four rewritten files contain no chains developing unsupported theory.

Fresh pinned statements read include `Set.integer`, `HeightOneSpectrum`,
`InfinitePlace.nrRealPlaces`/`nrComplexPlaces`, `Homotopy`, `HomotopyEquiv`,
`groupHomology`, `Subgroup.center`, `Group.IsPerfect` and `TensorProduct.map`.
Current upstream roadmaps and current Tau Ceti were inspected read-only; the
current norm-reduction theorem was distinguished from the older pin.
No library build, update, cache download or language server was used.
No private source was copied or newly quoted.

The prior session's U.1 nine-error elaboration result and supplier observations
are retained as attributed earlier evidence, not rerun or repaired outside
scope. The actual queue completion predicate remains false because ten
outputs lack this job's review. A scratch-only diagnostic limited to the live
issue's seven pairs returns true. No queue scope was changed to obtain that
result. Resume only after the issue is reconciled with the queue or expanded
scope is explicitly authorized.


## Continuation by Codex codex-6SZXyE, 19 October 2026

The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6258844279)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6258845908).
This continuation preserves the predecessor's seven mathematical verdicts and
source-reading attribution. It does not stamp any additional packet.

The current queue contains **seventeen** packet/Lean pairs. Exactly seven
already carry this job's review; the other **ten**, listed in the handoff,
retain their distinct independent reviews. The previous checkpoint's nineteen/
twelve inventory was stale. The live issue was re-read after the claim and still
lists seven pairs. Scope clarification has been requested from the operator;
permission to edit the extra pairs has not been received.

K.1's companion is reduced from 817 to **45 lines**. It retains exactly the
three active examples over the pinned exact-category substrate, one import
block and the standard definitive-reader note. Commented pseudocode using
unavailable Q-construction, higher-K, Waldhausen and relative carriers was
removed. The existing reader already states these targets with their API and
checks; the packet's mathematical nodes, hypotheses, sources, dependencies,
tests and verdict are unchanged. No claim that these future carriers elaborate
is made.

For this change, the actual pinned statements of `ExactK0`,
`ExactK0.of_conflation`, `finiteProjectiveModulesExactStructure`,
`finiteProjectiveModulesExactStructure_eq_split` and
`finiteProjectiveModulesExactStructure_conflation_iff` were read in their
source files. The current upstream GrothendieckEulerForms and AlgebraicTopology
roadmaps were inspected read-only for their ownership boundaries. The examples
consume their existing substrate; no replacement exact structure or K₀ is
introduced.

Fresh checks in this continuation:

- `check_blueprint.py` on all **seventeen** queue packets: zero errors and
  zero warnings. The extra ten passes are read-only schema checks, not review
  verdicts.
- `lean-check` on the changed K.1 companion: exit zero, no warnings or errors;
  78 GB available memory before the check. The other six companions were not
  changed or recompiled; their earlier results remain attributed above.
- `intake.py check-files` on all ten changed deliverables/handoff files: zero
  problems; `git diff --check` also passes.
- The real `deliverables_complete` predicate is **false**, with precisely the
  ten unstamped queue packets identified in the handoff. A negative review
  still counts as a completed review outcome; K.1/K.6's negative verdicts are
  not the reason for this failure.

This submission is a **blocked checkpoint**, not a completed seventeen-packet
review. The blocking instruction is [WORKERS.md, Doing the work](../WORKERS.md):
“Edit only the files the issue names.” The live issue must be reconciled with
the queue, or expanded scope explicitly authorized, before those ten reviews
can be written. No issue body, queue, atlas, supplier packet or review verdict
was changed to bypass that boundary.

## Continuation by Codex codex-jVGtcb, 19 October 2026

The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6259434416)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6259435860).
This continuation independently checked the specific evidence below. It preserves
the earlier seven verdicts and their attribution; it does not represent a new
whole-packet review of the ten additional queue outputs.

### Source and ownership checks

The following checks used the public author-hosted K-book chapters, read on
19 October 2026. They concern the disputed contracts, not a replacement account
of the chapters.

| Contract checked | Source locator | Assessment |
| --- | --- | --- |
| Resolution hypotheses in K.3 | [K-book V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), Theorem 3.1 and its proof, chapter pp.20–21 | Extension closure and closure under kernels of admissible surjections between objects of the resolving subcategory must remain explicit. The packet retains these hypotheses and its separate bounded-resolution induction. |
| Early products needed by the nonconnective construction | [K-book IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), Definition 10.1 and the construction following it, chapter pp.79–80 | The Bass construction uses multiplication by the Laurent coordinate before iteration. The K.7 input of K.6 cannot be discarded merely to remove the ordering conflict. |
| Localization product and degree-two convention | K-book V, Exercise 5.3, chapter p.38, and §6.6, chapter pp.41–42 | The right product action is compatible with the boundary; moving a graded factor to the left requires its sign. The packet distinguishes the ring boundary from its uniformizer-last normalization instead of identifying the two tame-symbol conventions. |
| Universal central extensions and stable Steinberg ownership | [K-book III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), Definition 5.3.1, Lemmas 5.3.2–5.3.3, Example 5.3.4, Recognition Theorem 5.4 and Theorem 5.5, chapter pp.37–38 | T.1 owns perfectness, rigidity and superperfect recognition; V.1 imports these. The stable Steinberg statement is not evidence for an unrestricted finite-rank version; Proposition 5.5.1 on p.38 has its rank qualification. |
| The Gaussian K₃ control | [K-book VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), Example 2.1.2, chapter p.7, and Corollary 5.3, chapter p.24 | The free rank and torsion invariant give `K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24`. V.5 owns the computation and N.8 consumes it. |

The integral bar-kernel and positive transgression proof plans in T.1 were
also inspected directly. In the quotient of the bar-kernel chains, the class
`[a]−[b]` maps to `ab⁻¹` in `N/[E,N]`; the mixed bar relations impose the
conjugation relations. Its odd-order Heisenberg control distinguishes the
chosen positive boundary from its inverse. This inspection does not establish
the proposed natural comparison or the CFT6 evaluation theorem in Lean.

Current upstream GrothendieckEulerForms and AlgebraicTopology were inspected
read-only against their ownership boundaries. In particular, the exact-category
and degree-zero Grothendieck substrate is consumed rather than replanned.
The statements of pinned `ExactK0`, `ExactK0.of_conflation`,
`finiteProjectiveModulesExactStructure`, its split-structure theorem and its
conflation characterization were read in the shared source snapshot. These
support K.1's three existing examples; they do not supply higher K-theory.
No restricted-source reading is newly certified.

### Independent finite-data and dependency reproduction

A fresh exact-arithmetic verifier reproduced all eleven golden-field
certificates, all 173 relation witnesses and all 23 specified determinants.
It checked the residue images and generated multiplicative groups, the
successive earlier-prime lists, all three stored factorizations per witness,
the witness equations, exponent differences and determinant gcds. The indices
were again `3,4,8,10,10,18,18,28,28,30,30`. Changing the first coordinate of a
stored `differenceOverPrime` witness was rejected. The reproduction procedure
above contains everything needed to repeat this without the disposable script.

Separately, a fresh topological sort of the 470 concrete nodes succeeded.
Both K.7-to-earlier-stage dependencies and their opposing actual atlas paths
listed above were recovered directly from `prerequisites`, `parentStageId`
and `atlas/stage-edges.json`. This confirms the two negative ordering verdicts;
the concrete-node DAG does not remove the actual-stage conflict.

### Fresh validation and remaining blocker

All seventeen queue packets passed `scripts/check_blueprint.py`. All seven
issue-listed companions were elaborated serially with `lean-check`, with
72–76 GB available before each invocation. Each exited zero; their only
warnings were the expected uses of `sorry`, with counts respectively
10, 0, 30, 27, 3, 8 and 10 in the table's order. No companion was changed in
this continuation. No extra supplier companion was compiled or certified.

The live issue was re-read after the claim and again before submission. It
still names seven pairs. Expanded authorization was requested from the
operator, but no reply authorizing the ten extra pairs arrived. Directly
calling `issues.py`'s `deliverables_complete` on the real queue job returns
**false**, and the ten missing area-review stamps are exactly those listed in
the handoff. Neither K.1 nor K.6's negative verdict causes this result.

This is a **blocked checkpoint**. The binding scope instruction remains
[WORKERS.md, Doing the work](../WORKERS.md): “Edit only the files the issue
names.” The issue needs to name the seventeen queue pairs, or the operator
needs to authorize the ten additional reviews. No issue, queue, atlas, packet
or prior review attribution was modified to bypass the mismatch.
