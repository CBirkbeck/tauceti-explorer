# REV-FIX-RT-BP-ClassicalSerreModularity--R27.3

Independent review of FIX-RT-BP-ClassicalSerreModularity--R27.3 (Claude, session `claude-eZ1A2V`, issue #5715,
PR #6680), for issue #5716.

Reviewer: Claude, session `claude-s4pYIP`, 7 October 2026. I did not write:
- the red team RT-BP-ClassicalSerreModularity--R27.3 (Codex `codex-rtOQ9t`) or its verification;
- the fix under review;
- the subsequent area fix FIX-RT-AREA-langlands-2~3 (Claude `claude-c9TlsS`, PR #6724), which also edited this packet;
- any earlier version of the R27.3 packet or any of its reviews.

**Verdict: accepted, after one correction in place in the packet and one in a comment of the suggested file.**

All three confirmed findings are correctly fixed. The packet passes its checker, and the suggested file elaborates.
The review object of REV-FIX-RT-AREA-langlands-2~2 (needs_changes, 2 October), which this review follows, is now
the last entry of the packet's `reviewHistory`.

## What I reviewed

The file under review is `research/blueprint/packets/ClassicalSerreModularity--R27.3.json`. The job may also edit the
suggested file `research/blueprint/suggested/ClassicalSerreModularity--R27.3.lean`. I read:
- the red team's result and report, the verifier's `RT-BP-ClassicalSerreModularity--R27.3.review.json`, and the
  fixer's `RT-BP-ClassicalSerreModularity--R27.3.fixes.md`;
- the fix commit's diff (b5b1be26) of the packet, the reader document and the suggested file;
- the three changed nodes in full in the current packet: R33.2/dihedral-local-type-at-n,
  R33.3/dp-dyadic-transition-and-the-order-three-type and R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice;
- the statement of every supplier node the fix imports (see "Suppliers" below);
- every edit that FIX-RT-AREA-langlands-2~3 (ea48bbee) made to this packet afterwards (see "The round-3 area edits").

The round-3 commit left the three fixed nodes unchanged, except that it replaced R27.4's coarse
`PotentialModularityAndCompatibleSystems:R24.4` prerequisite by the two KW I Theorem 4.1 nodes of
GL2ModularityLifting R22.5 and R22.6. The current packet is identical to the round-3 commit.

## Sources

Both sources were downloaded again, and both reproduce the hashes recorded in the packet's `sourceVersions`.

| Source | Passages read | SHA-256 |
|---|---|---|
| [Dieulefait–Pacetti, arXiv:2108.07577v2](https://arxiv.org/pdf/2108.07577v2) | §1.3 and Theorem 1.9 (p. 6); Paso 2, Lemma 2.1 (pp. 11–12); Lemma 2.3 with its proof, Remark 6 and Paso 4 (pp. 12–13) | `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` |
| [Khare–Wintenberger I, author's preprint](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | §5: almost strictly compatible systems, minimal lifts, Theorem 5.1 with its Remarks (pp. 8–10); §8.4 (pp. 17–18) | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |

For KW II §3.3.3 I relied on the reviewed extraction PAPER-KHARE-WINTENBERGER-09-II (items /118–/120).

Every excerpt of the three fixed nodes was compared with the text layer, after NFKC normalisation and removal of
whitespace. The three excerpts the fix added match literally: DP p. 6 (compatible inertial type), DP p. 13 ("both
representations … have the same reduction") and KW I p. 10 (Theorem 5.1(4)'s residual hypothesis). The others match
on their pages up to the overlines, primes and subscripts that the text layer splits off. Their locators are right.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalSerreModularity--R27.3.json --index
  <baseline>/declarations.tsv`: 0 errors, 0 warnings, before and after my correction (37 nodes, 19 requests, 4 gaps).
- The packet's only baseline declaration, `mathlib:MonoidAlgebra.Submodule.exists_isCompl`, was read in
  `Mathlib/RepresentationTheory/Maschke.lean` at Mathlib `082e2d3`. Line 162 states it, under the section variables
  `Field k`, `Finite G` and `NeZero (Nat.card G : k)` of line 139.
- `lean-check research/blueprint/suggested/ClassicalSerreModularity--R27.3.lean` (`lake env lean` in the shared build
  at Mathlib `082e2d3`), before and after my edit: no errors. The only warnings are the 23 unproved declarations of
  the round-3 statements. The fix's checked examples (lattice identities over ℤ[ζ], reductions over `ZMod 3`, the
  rank-one monodromy, the conductor chain, the `CuspForm` carrier) all elaborate.
- All prerequisites of the packet resolve to a node of some packet, a node of an integrated decomposition, or an atlas
  stage. Each stage prerequisite in another roadmap has a matching request.
- The node graph inside the packet is acyclic. Every edge between stages of the roadmap goes to the same or an earlier
  layer, and no node of R33.1–R33.4 uses anything of R26, R27.2–R27.6, or R27.1 beyond Definition 2.1, Lemma 6.3 and
  Lemma 8.2.
- Stage cycles: I compared the strongly connected components of the stage graph (data/atlas.json requirements and
  stage edges, the accepted restructurings and link maps, and the stage edges induced by every packet). I computed
  them twice: with the live copy `data/blueprints/ClassicalSerreModularity--R27.3.json`, and with the current packet.
  The current packet's 17 new induced edges put no further stage into a nontrivial component. R26.1–R27.6 lie in the
  atlas's large component in both cases, and they stay there when the edge R26.6 → R27.1 is removed. The shortest
  cycle is R27.6 → EllipticCurveModularity R29.1 → SerreWeightAndLevelOptimisation R20.6 → R27.6:
  - the first edge is an atlas requirement;
  - the second is induced by the unreviewed SerreWeightAndLevelOptimisation packet, whose
    R20.6/weight-two-newform-at-reduced-level cites R29.1;
  - the third is in the atlas and is also cited by R27.6/full-classical-serre-theorem, in the live copy as well.

  R33.1–R33.4 are in no nontrivial component.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: no problems.

## /1 (medium, missing): the order-three type needs an adapted stable lattice. Right, with one correction.

**The lattices.** I recomputed the certificate by hand over 𝒪 = ℤ₃[ζ], with π = ζ − 1 and P = (1 0; 1 π):
- D₀P = (ζ 0; ζ² ζ²π) = PD₁, since ζ + πζ = ζ²;
- F₀P = (1 π; 1 0) = PF₁;
- both pairs satisfy D³ = F² = 1 and FDF⁻¹ = D², and L₁ is G_{ℚ₂}-stable, because the image of G_{ℚ₂} is generated
  by D₀ and F₀;
- modulo π, D₀ ≡ 1 and F₀ is the swap, so L₀ reduces to 1 ⊕ η;
- D₁ ≡ (1 0; 1 1) and F₁ ≡ diag(1, −1), which in the basis (f₂, f₁) is σ ↦ (1 1; 0 1), Frob₂ ↦ diag(−1, 1).

The suggested file checks the same identities by `decide`, with the product in ℤ[ζ] written out correctly as
(a + bζ)(c + dζ) = (ac − bd) + (ad + bc − bd)ζ.

**The residual case analysis** in R33.3's first proof step is right:
- ρ̄₃(I₂) is unipotent, so it is a 3-group, wild inertia acts trivially, and I₂ acts through a cyclic quotient of
  order 1 or 3.
- In the ramified case the invariant line is Frobenius-stable. Frob σ Frob⁻¹ = σ² gives α/β = 2 = −1.
- Conjugation by an upper unipotent matrix diagonalises Frobenius, since α − β = β ≠ 0, and a diagonal conjugation
  makes b = 1.
- An unramified extension of 1 by η splits, since H¹ of Frobenius with coefficients 𝔽₃(η) is 𝔽₃/(η(Frob) − 1) = 0.
  So "c = 0" and "ρ̄₃ unramified at 2" are the same case, as the statement says.

**The transfer argument** for κ(s²) = 1 in R33.2 is right:
- the transfer sends a Frobenius lift s to s², which corresponds to Nu with u ∈ ℤ_N^×;
- κ kills the image of 𝔽_N^× because (N² − 1)/q is divisible by N − 1;
- hence s acts by the swap for every Frobenius lift.

**DP's compatibility.** DP define compatibility on p. 6: "there exists an O_E-lattice Λ_ℓ in E² which is stable by
τ_ℓ … such that τ̄_ℓ = ρ̄|_{I_ℓ}". The overlines are lost in the text layer and visible on the page. L₀ supplies such a
lattice in the split case and L₁ in the non-split case; on inertia the unramified twist γ is invisible. So
`orderThreeType_isCompatible` holds, and DP's sentence on p. 13 is right for this choice of lattice. Asserting no
erratum is correct.

**KW I Theorem 5.1(4) at (p, q) = (3, 2)** (p. 10):
- ρ̄₃ is of S-type: odd, and absolutely irreducible because its image is non-solvable;
- k(ρ̄₃) = 2 lies in [2, p + 1];
- ρ̄₃|_{ℚ(µ₃)} has non-solvable image, being of index at most 2, so it is absolutely irreducible;
- 3 | 2 + 1;
- the level-two characters of order a power of 3 are ω_{2,2}^i ω_{2,2}^{2j} with 0 ≤ j < i ≤ 1, so i = 1, j = 0, as
  the packet says and as Diamond's list on p. 10 gives (m = 1).

The conclusion has weight 2, parameter (1 ⊕ 1, 0) at p by item 2 with k = 2 (crystalline), minimality away from 2 and
3, and ρ′₃|_{I₂} ≅ χ′ ⊕ χ′². These are the hypotheses and conclusion the node states.

**Corrected in place.** hypotheses[4] of R33.3/dp-dyadic-transition-and-the-order-three-type ended: "whose explicit
lifts (ρ(F), ρ(σ)) with ρ(F)ρ(σ)ρ(F)⁻¹ = ρ(σ)^q are, at (p, q) = (3, 2), the matrices of L₀ and L₁".

The supplier LocalGaloisDeformationRings:R08.6/export-away-from-p (b) only asserts that a lift ρ₀ of the level-two
inertia-rigid condition exists. The tame relation appears in its proof step. KW II §3.3.3 (extraction item /119)
builds that lift with ρ(F) = (−1 0; 0 1) and ρ(σ) with eigenlines 𝒪(e₁ ± λe₂), not with L₀ or L₁.

The sentence now reads: "whose lifts (ρ(F), ρ(σ)) satisfy ρ(F)ρ(σ)ρ(F)⁻¹ = ρ(σ)^q with ρ|_{I₂} ≅ χ′ ⊕ χ′^q. At
(p, q) = (3, 2) the matrices of L₀ and L₁, after an unramified twist, are such lifts of ρ̄₃|_{D₂}. They are not the
supplier's own matrices: KW II §3.3.3 writes the lifts of that condition with ρ(F) diagonal".

The unramified twist also adjusts the determinant to the condition's φ. This is what the reader document already
says ("The matrices of L₀ and L₁ are explicit lifts of that condition"), so the correction brings packet and reader
into agreement and changes no statement.

## /2 (medium, error): raising levels needs a conductor bound. Right.

hypotheses[1], proofSteps[3] and the acceptance checks of R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice
now carry the chain v₂(N(ρ̄′_s)) ≤ a₂(second system) = v₂(N(ρ̄_{p′})) ≤ A ≤ r. I checked each link against KW I.

**The three values of A** (Theorem 5.1(2), p. 9):
- *p odd.* ρ_p is minimally ramified at 2, and a minimal lift keeps the residual conductor, so A = v₂(N(ρ̄)) ≤ r.
- *p = 2, k(ρ̄) = 2.* The parameter at 2 is (ω₂^0 ⊕ 1, 0), so A = 0. The parameter is the 2-adic member's. It is
  the system's r₂ because ρ̄ is irreducible, by almost strict compatibility (p. 8), as the hypothesis says.
- *p = 2, k(ρ̄) = 4.* The parameter is (id, N) with N ≠ 0, so A = 0 + 2 − 1 = 1. N(ρ̄) is prime to p, so its 2-part is
  1. The theorem excludes r = 0 here.

For p = 2 the weights are only 2 and 4, so the three cases are exhaustive.

**The steps of the chain** (§8.4, pp. 17–18):
- p′ > 5, so reduction at p′ does not raise the dyadic exponent.
- The Theorem 5.1(4) lift of ρ̄_{p′} is minimally ramified at primes other than p′ and q, and q ≡ 1 mod 8 is odd. So
  the second system's dyadic exponent is v₂(N(ρ̄_{p′})).
- s > 2, so the last reduction does not raise it either.

The boundary acceptance case (p = 2, k(ρ̄) = 4, r = 1: original exponent 0, A = 1, bound ≤ 1) is right. So is the
conductor-drop example: 11a1 has Δ = −11⁵, and its mod-5 representation is unramified at 11 because 5 | v₁₁(Δ).
Theorem 3.4's statement is unchanged, as the finding asked.

## /3 (low, library-claim): analytic modular forms are present at the pins. Right.

I read the declarations at the pins:
- Mathlib `082e2d3`, `Mathlib/NumberTheory/ModularForms/Basic.lean`: `structure ModularForm extends
  SlashInvariantForm Γ k` (holomorphic, bounded at cusps, line 74) and `structure CuspForm` (zero at cusps, line 82);
- Tau Ceti `f790474`, `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`: `HeckeRing.GL2.Newform (N : ℕ)
  [NeZero N] (k : ℤ)` (line 102), extending `EigenformAwayFromLevel` with `isNew` and `isNorm`.

The standard note now names these as reused carriers and limits the missing part to the arithmetic interface, as the
finding asked.

**Corrected in place (suggested file).** The `serre_strong` sketch had been pointed at `HeckeRing.GL2.Newform` but
still wrote `f.character`. That Newform's nebentypus is the field `χ : (ZMod N)ˣ →* ℂˣ` of `EigenformAwayFromLevel`.
The sketch now writes `f.χ`. A comment says that `coeffRing`, `residualRep` and the reduction of `χ` modulo `λ` are
planned names of the missing arithmetic interface, not Tau Ceti declarations. The sketch is a comment, so this
changes no elaborated code. A line in the file's header records this review.

## Suppliers

I read the statement of each supplier node the fix cites.

- **PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-4-level-two-type-at-q** gives a lift of required
  type (4) under KW I Theorem 5.1's hypotheses. The type is: weight 2, parameter as in type (2) at p, minimal away from
  p and q, ρ|_{I_q} ≅ χ′ ⊕ χ′^q. This is exactly what R33.3 uses.
- **R24.3/theorem-5-1-part-2-weight-two** gives the parameters (ω^{k−2} ⊕ 1, 0), or (id, N ≠ 0) when k(ρ̄) = p + 1
  (4 at p = 2), with minimality at ℓ ≠ p. This is what R27.4 uses for A.
- **R24.6/residual-members (iii)** says that for q ≠ ℓ the Artin conductor of ρ̄_ι at q divides that of the system's
  parameter r_q. For the case A = 1 this has to be read as the conductor of the Weil–Deligne parameter with its
  monodromy term. The R01.3 nodes below state that conductor exactly.
- **R24.3/modern-prescribed-type-lifts** (DP Theorem 1.9(4) through Snowden) records in its own hypotheses that DP's
  "compatible inertial type" is weaker on its face than Snowden's local solution. R33.3 is not affected: it cites the
  KW I Theorem 5.1(4) route as well, and L₀ and L₁, twisted, are local lifts of ρ̄₃|_{D₂} of the prescribed type.
- **LocalGaloisDeformationRings:R08.6/export-away-from-p (b)**: see the correction under /1.

**Stage citations that now have exact nodes.** Three items should cite exact nodes in the next revision of this
packet. ArithmeticGaloisRepresentations' packet (`research/blueprint/packets/ArithmeticGaloisRepresentations.json`)
was added on 7 October 2026, after this fix, and its review is needs_changes. It now has exact nodes for the stage
citations the fix made:
- R27.4's `ArithmeticGaloisRepresentations:R01.3` (and its request) should become
  `R01.3/conductor-of-a-weil-deligne-representation` (a(r, N) = a(r) + dim V^{I} − dim (ker N)^{I}) and
  `R01.3/reduction-does-not-increase-the-conductor`. `R01.3/tame-conductor-computations` (c) gives the Steinberg
  exponent 1.
- R33.3's `ArithmeticGaloisRepresentations:R01.2` should become `R01.2/tame-inertia-and-fundamental-characters`, the
  tame relation u ↦ u^{#k} and I_t ≅ lim 𝔽_{p^n}^×. The R01.2 request then keeps R33.2 only.
- The older request for the exponent 2 of R27.3/theorem-3-3-initial-case is `R01.3/tame-conductor-computations` (d).

I did not make these swaps in this review, for two reasons:
- that packet's own review records lemma-level splits still to be made, so its node ids are not yet settled;
- the reader document, which this job may not edit, says that the R01.3 conductor "is requested".

The stage citations were compliant when the fix was made, and they remain correct as stage citations.

## The round-3 area edits in this file, and why the verdict is accepted now

FIX-RT-AREA-langlands-2~3 edited this packet after the fix. Its own review, REV-FIX-RT-AREA-langlands-2~3 (#5871),
is open, and an accepted verdict here puts the whole current file live. So I read every one of those edits before
accepting. I found no error.

- **The four new R27.6 declarations** give KW I Corollary 10.2(ii) a complete proof plan, read against KW I pp. 20–21:
  - Artin reductions of Serre type. ℓ ∤ |G| gives exact invariants, faithfulness, oddness, conductor N, weight ℓ and
    Edixhoven weight 1. P_c has density |C|/|G|. The S₃ examples of conductor 23 are right: reducible at 3, density
    1/2.
  - Weight one modulo ℓ through the strong form, ordinarity and Gross's companion forms with k′ = ℓ + 1 − ℓ = 1.
  - Weight-one base change away from the ℓ-torsion of H¹(X₁(N), ω(−C)).
  - Khare's descent, by Deligne–Serre lifting and a pigeonhole over finitely many eigensystems.
- **Lemma 8.2's proof.** The compatibility of the four Chebotarev conditions agrees with KW I pp. 17–18: every
  quadratic subfield of the cyclotomic field is split by q, using p ≡ 1 mod 4.
- **The other edits.** The component placements (R27.1a, R27.1b) are proposals for the maintainer. The owner swaps in
  R33.1 (R01.4 Dickson, R15.4 and R01.4 bad-dihedral, R32.2's Theorem 1.4 contract) and the KW I Theorem 4.1 swaps to
  R22.5 and R22.6 cite nodes whose statements cover the use.

What REV-FIX-RT-AREA-langlands-2~2 left open for this packet has been addressed as far as a packet can:
- /8: the Artin descent contracts are now present.
- /1: the modern strand uses only the three good-dihedral declarations of R27.1. The removal of the stage edge
  R26.6 → R27.1 is a stage edit for the maintainer.

The dispositions of RT-AREA-langlands-2's forty findings across its three packets remain REV-FIX-RT-AREA-langlands-2~3's
to record. That review will replace this review object with its own verdict.

## Corrections made

| File | Where | Change |
|---|---|---|
| packet | R33.3/dp-dyadic-transition-and-the-order-three-type, hypotheses[4] | R08.6 (b)'s lifts are no longer identified with L₀ and L₁; L₀ and L₁, twisted, are lifts satisfying its condition (KW II §3.3.3 uses other matrices) |
| packet | `review`, `reviewHistory` | this review's verdict; the REV-FIX-RT-AREA-langlands-2~2 object appended to `reviewHistory` verbatim |
| suggested file | `serre_strong` sketch (comment) | `f.character` → `f.χ`; planned names marked |
| suggested file | header | a line for this review and its compilation |

No node statement, prerequisite, request, gap or source issue was changed. Every implementation status remains
`unchecked`.

## For the maintainer

- The stage edge R26.6 → R27.1 (RT-AREA-langlands-2/1) is still in the atlas. The proposed split of R27.1 into R27.1a
  and R27.1b is in this packet's `restructure` entry.
- Removing that edge would not take R26.1–R27.6 out of the atlas's large strongly connected component. The cycle
  R27.6 → EllipticCurveModularity R29.1 → SerreWeightAndLevelOptimisation R20.6 → R27.6 keeps them there. Its middle
  edge comes from the SerreWeightAndLevelOptimisation packet's R20.6/weight-two-newform-at-reduced-level
  (Bennett–Siksek, Theorem 3), which cites R29.1. This packet neither creates that cycle nor can remove it.
- In the next revision of this packet, swap the ArithmeticGaloisRepresentations R01.2 and R01.3 stage citations for the
  exact nodes listed under "Suppliers", once that packet's node ids are settled. Update the reader's two "requested"
  sentences in the same revision.
- PotentialModularityAndCompatibleSystems R24.6/residual-members (iii) would read more safely as "the conductor of the
  Weil–Deligne parameter r_q, with its monodromy term". That is a wording point for its owner.
