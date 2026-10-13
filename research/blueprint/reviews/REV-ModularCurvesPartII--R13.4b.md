# Independent review: Modular Curves Part II, R13.4b–R14.6

**Accepted, with corrections made in place.** This is the review for issue #9397, job `REV-ModularCurvesPartII--R13.4b`. It was done by Claude, session `claude-UWUnUH`, on 13 October 2026. The blueprint under review, `BP-ModularCurvesPartII--R13.4b`, was written by Codex in session `codex-4rkG2e`.

The [packet](../packets/ModularCurvesPartII--R13.4b.json), [reader](../readmes/ModularCurvesPartII--R13.4b.md) and [suggested file](../suggested/ModularCurvesPartII--R13.4b.lean) were corrected in place and agree with each other.

## What the packet is

The packet owns no nodes. Its nine stages are R13.4b, R13.5, R13.6 and R14.1–R14.6. They are realised by 75 nodes that already exist in two accepted packets:

- 32 nodes from the [R13.3 packet](../packets/ModularCurvesPartII--R13.3.json), accepted 13 October;
- 43 nodes from the [R14.3 packet](../packets/ModularCurvesPartII--R14.3.json), accepted 11 October.

PROTOCOL §15 gives each piece of mathematics one owner, so importing these nodes rather than restating them is correct. The approach follows the accepted R13.4 process packet. The packet's own work is the import inventory, the assembly contracts and the synchronized reader.

`review.checked` is empty because there are no own nodes. `review.importedTargetsChecked` gives a verdict for each of the 75 imports: 63 are verified and 12 are corrected. A correction always concerns this packet's assembly contract; the canonical node text is unchanged.

## What was checked

**Identity.** The SHA-256 hashes recorded for both canonical packets match the files on main. Every imported ID exists, has the right stage, and has `unchecked` status. No canonical node whose parent is in scope was left out.

**Stage coverage.** Each stage description in the atlas extract was read against the imported targets, and every stated target is realised. In particular:

- R13.5 keeps its finite R20 case list (`R20CaseAudit`).
- R14.5 has the quotient, its dimension, its differentials, oldforms, the Abel–Jacobi composite and V_ℓ of rank 2[K_f:ℚ].
- R14.6 has the character and monodromy sequences, the special-fibre Eichler–Shimura relation, Taylor–Wiles freeness and the rational cusp.

**Reader against the packets.** I compared the text after normalizing whitespace. Every canonical statement, hypothesis, proof step, acceptance check, API name and statement, test name and statement, locator, match and prerequisite occurs verbatim in the reader.

Two kinds of field are not reproduced word for word:

- Some `uses` entries are joined with semicolons instead of ending in their own full stops.
- Planet names are not rendered.

The stale passages that the R13.3 and R14.3 reviews flagged in their own readers are absent here. The three generated parts of the reader were reproduced byte for byte from the original packet before they were regenerated: the `Needs` lines, the layer dependency lists, and the gap and supplier sections.

**Baseline.** All 19 declarations were checked against the source at Mathlib 082e2d3 and Tau Ceti f790474. Each exists in its cited module and provides what is claimed. The Lean hypotheses are the same or weaker; for example, `RingHom.quotientKerEquivRange` needs only `Ring`.

One declaration, `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`, is cited by no imported node. It was carried over from the R14.3 baseline list, and listing it is harmless.

**Original resolutions.** Each of the 24 dependency resolutions was read against the consumer's proof steps and the suppliers' statements. All are sound. Resolutions 20–22 resolve a citation of R13.5 partly to R13.6 graph nodes; those nodes sit downstream of R13.5, so the substitution is acyclic and exact.

The resolutions do not in fact prevent any node-level cycle: no R14.1 or R14.2 node cites R14.3 or anything later. Their value is precision.

**Cycles.** I scanned the node graph over all research packets, expanding each ModularCurvesPartII stage citation to all of that stage's nodes and applying the resolutions and additions. There is no strongly connected component through this roadmap, either before or after the corrections.

Expanding every roadmap's stage citations the same way produces an atlas-wide component through other packets' stage-level citations; one example runs through the EDC.6 index node and CompletedCohomologyPartII CC.8. That component does not come from this packet.

**RT-AREA-langlands-2/9.** Both sides were read:

- `R14.6/special-fibre-eichler-shimura` states (T_p)_*=F+⟨p⟩_*V and w_ζ⁻¹Fw_ζ=⟨p⟩_*⁻¹F. I checked this against Conrad's Theorem 5.16, printed p. 74 (PDF p. 78), and its proof on pp. 75–79, in the Ribet–Stein author PDF (SHA-256 `e1bf2b5c…`).
- The accepted AutomorphicGaloisRepresentations packet node `R19.1/geometric-construction-and-the-eichler-congruence-relation` imports this node and keeps only the Sym^r congruence (Deligne Prop. 4.8, Thm. 4.9).
- The packet's `links` entry and the reader's "Downstream consumers" section record the transfer correctly.

**Current libraries.** I screened the 75 targets against current TauCetiRoadmap main (`0d144d0`) and current Tau Ceti (`a91d3aa`): the README and Suggested files of every roadmap, and the library source. One duplication was found; it is correction 4 below.

The other matches are not duplications:

- ModularForms and the library have analytic Atkin–Lehner, Fricke, degeneracy and Hecke results. They contain no geometric involutions on integral curves.
- AdelicAlgebraicGroups has adelic Hecke correspondences, and its README places algebraic modular curves outside its scope.
- IntegralHeckeAndGaloisDeterminants plans determinant algebra, not the geometric Hecke algebra.
- The post-pin group-ring locality is already recorded as a gap.

**New content in the reader.** I recomputed the reader's own examples and controls. All are correct:

- **Hecke data:** the HNF branches at m=4 (7 in all, 6 cyclic), and A_p²=A_(p²)+p⟨p⟩ against C_p²=C_(p²)+(p+1)⟨p⟩.
- **Level arithmetic:** the exact divisors of 12 are 1, 3, 4 and 12. The degeneracy degrees are 3 for N=11, p=2 and 5 for N=10, p=5.
- **Components and cusps:** full level 5 has 4 components over ℂ, 2 after scalars and 1 after fixing the pairing. X₁(5) has genus 0 and 4 cusps. Γ(5) has 12 cusps.
- **Cohomology:** the parabolic image on G_m is 0. Γ(3) is free of rank 3 (index 24, Euler characteristic −2), and it has no mod-5 congruence characters.
- **Split Cartan curve:** e=(13²−1)/2=84. The graph is K_(1,3) with a genus-3 centre, checked against BDMTV, arXiv:1711.05846 (SHA-256 `77c57b03…`), Theorems 6.6–6.7 and Corollary 6.8.
- **Baran quartic at 2:** I checked the smoothness argument by hand on the first Baran quartic (BDMTV §6.3). Modulo 2, F+X∂_XF=Y(X+1)² on Z=1. Both branches give ∂F≠0, and on Z=0 the derivative ∂_ZF=X³ is nonzero. The change of coordinates has determinant 2, as the reader says.

## Corrections

1. **Exact nodes for own-roadmap stage citations.** Seven imported nodes cited the whole stages R12.3, R12.5, R12.6 or R13.2. The packet carried four requests to those stages, although the accepted [R12.1 packet](../packets/ModularCurvesPartII--R12.1.json) has exact nodes. I added 11 dependency resolutions, which takes the total from 24 to 35, and withdrew the four requests.

   One point needs stating. `R14.2/rational-coefficient-pairing` re-proves the perfection of β(T,f)=a₁(Tf), which `R12.5/perfect-hecke-pairing` already proves on H⁰(X₀(N)_ℚ,Ω¹). That proof is now imported. The node keeps only the identification of the Jacobian Hecke image ⊗ℚ with the cotangent image.

2. **Redundant requests.** The requests to `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing` and `ArithmeticGaloisRepresentations:R01.6/good-reduction-specialization` named nodes that the consumers already cite directly. Those accepted nodes state exactly what is needed, so both requests were withdrawn. This brings the requests from 44 to 38.

3. **Wrong owner for the ordinary-locus inputs.** The R13.2 request asked R13.2 for the ordinary dense locus and the connected–étale order-p subgroups used in Conrad's proof of Theorem 5.16. R13.2 owns compactified level stacks, not these. The citation now resolves to the smooth fine X₁(N) nodes of R13.2 and to ModularCurves 7E: PD-2 gives the connected–étale sequence over a henselian base, and PD-5 the ordinary dichotomy. The existing 7E request now names this consumer.

4. **Duplication of a TauCetiRoadmap roadmap.** In `R14.4/modular-amalgam`, proof steps 1–2 construct the SL₂ lattice tree and identify the adjacent stabilizers. ReductiveGroupsPartII, now on TauCetiRoadmap main, owns these as `RG2.2/sl2-tree` and `RG2.2/ihara-amalgam` (README RG2.2.4). The strong-approximation input is `AdelicAlgebraicGroups:AA.4/strong-approximation-sufficiency` and `…/strong-approximation-finite-places`.

   A new `dependencyAdditions` field imports these suppliers, from tiers 1 and 2. The same imports are already used by AutomorphyLiftingBeyondTaylorWiles `BT.3/global-ihara-amalgam`.

   The gap "Tree fundamental edge and enhanced congruence-character proof" is narrowed to what remains:
   - Serre's segment-amalgam theorem (Trees I §4.1 Thm 6). ReductiveGroupsPartII uses it inside a proof but does not export it.
   - The arithmetic fundamental-edge step and the finite congruence-quotient sublemmas.
   - The continuous-cohomology, Lazard and level-8/16 inputs to congruence-invariance, which are unchanged.

   The R14.4 coverage entry and the reader's amalgam section say the same.

5. **Duplicated source issues.** The ten `sourceIssues` were copies of R13.3 E1–E7 and R14.3 E1–E3, with the last three renumbered E8–E10. They appeared twice in the errata register under conflicting numbers. They now sit in `inheritedSourceIssues` as references, and `sourceIssues` is empty: neither the pass nor this review found a new source mistake. The reader's source-correction headings now name the canonical packet of each record.

6. **`upstreamNotes` renamed `assemblyNotes`.** The notes concern atlas roadmaps, not Tau Ceti, and were strings rather than `{roadmaps, note}` records. Two notes were added, for corrections 1 and 5.

7. **Sources.** `ribetstein` records that the R14.3 packet cites the same file as `RIBET-STEIN-SERRE-LECTURES`.

8. **Suggested file.** Three R13.5 `example`s stated arithmetic identities between numerals and said nothing about any declaration. They were replaced by two real-bodied definitions:
   - `splitCartanRamificationIndex`, with a sorry'd general formula 12k(6k+1) and the test 84 at ℓ=13;
   - `splitCartanFibreGenus`, the fibre genus over K_(k,3), with the theorem 6k²−3k and tests 3 at k=1 and 45 at k=3. Dropping the graph's cycles would give 41 at k=3, so the test detects that mistake.

**Counts after correction.** 0 own nodes, 75 imports, 19 baseline declarations, 9 gaps, 38 requests, 35 resolutions and 1 dependency addition. All nine stages are `planned`.

**Validation.**
- `check_blueprint.py` reports 0 errors and 0 warnings, with the declaration index set.
- `lean-check` at the pins exits 0. The file has 276 lines, and its only warnings are 25 `declaration uses sorry`. It has no sorry'd data definitions.

## Questions for the orchestrator

1. **Clashing source-issue numbers.** The R13.3 and R14.3 packets both number their source issues from E1, so E1–E3 name different findings in each. Renumbering one set (for example R14.3's as E201–E203) needs a fix job on those packets, which are outside this issue's deliverables.
2. **Serre's segment-amalgam theorem.** ReductiveGroupsPartII could export this theorem as a target. Otherwise the R14.4 amalgam keeps it as a proof obligation.
3. **Stale prose in the canonical packets.** The canonical R14.4 amalgam's proof sketch and R14.2's pairing proof still describe re-proving supplied results. The assembly must apply `dependencyResolutions` and `dependencyAdditions` and use this reader.
4. **EDC.6 has no accepted owner node.** The request to `EtaleDualityAndPerverseSheaves:EDC.6` stays at stage level. EDC.6 nodes now exist, for example `complex-analytic-comparison` and `trace-orientation-comparison`, but none of their packets is accepted yet.
