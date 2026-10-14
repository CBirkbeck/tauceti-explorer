# Independent review: P-adic differential equations, rigid cohomology and p-adic weights — RD.2 follow-up

**Verdict: accepted, with corrections made in place.** All 20 nodes have a justified verdict: 17 corrected, 3 verified, none added. All 18 baseline declarations were read at the pins. No unresolved contradiction remains. The stage RD.2 stays `planned`. Its `remaining` list is precise, and it keeps one gap inherited from ArithmeticGaloisRepresentations R01.3.

Reviewer: Claude, session `claude-kAR8ZW`, job `REV-PadicDifferentialEquationsAndRigidCohomology--RD.2` (#9752), 14 October 2026. The blueprint was written by another session, `claude-VjNCXF` (job `BP-PadicDifferentialEquationsAndRigidCohomology--RD.2`, #9744, PR #9791).

The review changed the following files:
- the packet;
- the reader document, re-rendered from the corrected packet;
- this report;
- the handoff note.

The suggested Lean file needed no change.

## Counts

| Item | Count |
|---|---|
| Nodes | 20: 3 constructions, 1 definition, 7 lemmas, 8 theorems, 1 comparison |
| API items | 38 |
| Unit tests | 22 |
| Planets | 2 |
| Baseline declarations | 18, all confirmed; 3 `provides` texts corrected |
| Node verdicts | 17 corrected, 3 verified |
| Prerequisite edits | 4 added, 2 removed or replaced |
| Source issues | E-RD2-1 to E-RD2-9 confirmed (2 locators corrected); E-RD2-10 to E-RD2-12 added and confirmed |
| Restructure proposals | 1 added, 1 extended |

Checks run after the edits:
- `scripts/check_blueprint.py` with the pinned index: 0 errors, 0 warnings.
- `intake.py check-files` on the three deliverables: 0 problems.
- `scripts/check_errata.py` on an errata-form copy of the packet's `sourceIssues`: ok.
- In-memory `merge_blueprints`, with and without the first-pass packet: no error and no skipped links.

## Method

I read every node's statement, hypotheses, proof route, acceptance, API, tests, prerequisites and sources. I then read each source myself at the cited locator:
- Kedlaya, *p-adic Differential Equations* (the author's PDF; PDF page = printed page + 18):
  - Definitions 3.4.2–3.4.3;
  - Theorems 6.5.3 and 9.6.1;
  - Proposition 8.2.3 and Definition 9.4.4;
  - Lemma 15.1.3 and Definition 15.2.1;
  - Chapter 17 (Remark 17.1.2, Example 17.1.4, Lemma 17.3.4);
  - Lemma 18.2.3;
  - all of Chapter 19;
  - Section 20.1, Lemma 20.4.1 – Corollary 20.4.3;
  - Definition 24.2.7, Theorem 24.4.4, Corollary 24.4.5.
- Kedlaya's overview: Chapters 4 and 5, Example 2.1.10 and Proposition 2.3.6. I checked the page images of pp. 33–34.
- arXiv:math/0110124v4: the introduction, Lemma 2.3 and Proposition 6.11 with its proof.
- André: §3.4 and §7.1.
- Xu–Zhu: §2.9.1–2.9.2, including the display (2.9.2.2).
- Berger: Lemme 3.13 and §5.5.
- Conrad's handout.
- *Notes on isocrystals*: §3.
- *Slope filtrations revisited*: arXiv v4, the Documenta text and the Documenta erratum. Every label of the packet's concordance table was located in both texts by script.
- The book's errata lists for the first and the second edition.

Three Haiku agents retrieved the passage at every locator. I verified the flagged ones myself. Two Sonnet agents did mechanical cross-checks:
- the baseline signatures;
- the supplier statements, tiers, duplication and stage cycles.

A third Sonnet agent proofread the edits.

## Corrections to the mathematics

1. **`galois-representation-to-differential-module`, proof of (c).** The step for representations with finite local monodromy claimed that the finite-image argument applies after quotienting by an open subgroup of inertia. That quotient surjects onto Gal(k^sep/k), which is infinite. The corrected route has three steps:
   - choose a finite Galois L with τ trivial on the inertia of G_L;
   - descend the unramified representation along K̂^unr/K by the lattice argument of Kedlaya's Lemma 19.1.3;
   - apply finite Hilbert–Noether descent from E†_L.

   Kedlaya states Definition 19.2.8 without proof.
2. **Dwork's module (four nodes).** The packet paired the connection ∇v = π_0 (df/dt) v ⊗ dt with the Frobenius structure F(v) = E(f)v. These do not match. In rank one, Kedlaya's compatibility (17.1.1.1) forces the Frobenius multiplier to be exp(π_0(σ(f) − f)) for that connection. The packet now uses ∇v = −π_0 (df/dt) v ⊗ dt with F(v) = E(f)v. The module E_π of RD.1/dwork-exponential-module is its dual. The four nodes are:
   - `c-constant-unit-root-module`, acceptance;
   - `galois-representation-to-differential-module`, acceptance and the test `unitRootModule.artinSchreier`;
   - `unit-root-matrix-normal-form`, acceptance: N = π_0 t^{−1};
   - `quasi-unipotent-modules-admit-frobenius-structures`, acceptance.

   I computed the test directly. The invariant generator of D†(V) is (1 + π_0 u)^{−1}, and its connection form is +π_0 t^{−2} near the boundary. So the test as written had the wrong sign. The same slip is in Kedlaya's Example 17.1.4, recorded as the new source issue E-RD2-12. With the corrected connection, his Example 19.2.6 holds as printed. The norm bound that makes Dwork's module the sharp case of the key lemma is unaffected.
3. **`lang-trivialisation-of-unit-root-modules`.** The lifting equation is ȳ − ū^j F̄(ȳ) = w̄, not −w̄.
4. **`unit-root-matrix-normal-form`.** The Frobenius compatibility is N − qAσ(N)A^{−1} = −t(dA/dt)A^{−1}. The book's proof of Lemma 19.3.3 drops the sign, recorded as E-RD2-10. Only the powers of t matter there.
5. **`highest-break-under-finite-etale-pullback` (d).** The summand generated by (1 + π_0 u)^i has connection form −iπ_0 n b t^{−n−1}(1 + pπ_0 b t^{−n})^{−1} dt, with b lifting −a. The overview omits the factor i, recorded as E-RD2-11. The radius ρ^{n+1} is unchanged.
6. **`small-constant-unit-root-module-is-trivial`.** The interpolation uses the log-convexity of the Gauss norms ρ ↦ |N|_ρ (Kedlaya, Proposition 8.2.3(c)). The cited RD.1/generic-radius-basic-properties (d) is the concavity of the log generic radius, a different statement. The citation and the prerequisite were removed.
7. **`fontaine-katz-unit-root-equivalence`.** The uniqueness of the compatible connection now rests on an explicit estimate. An F-fixed element Σ v_i ⊗ a_i dt satisfies a_i = σ(a_i)·dσ(t)/dt, and |dσ(t)/dt|_1 ≤ |π| (RD.0/derivation-on-robba-ring). The cited RD.2/differentials-have-positive-slopes is stated only over Γ_con and Γ_an,con, so it was replaced.
8. **Two missing prerequisites.** Highest breaks, break decompositions and the differential Swan conductor are defined for modules solvable at 1, so both `matsuda-highest-break-theorem` and `irregularity-equals-swan-conductor` now cite RD.2/quasi-unipotent-implies-overconvergent. The step "enlarge k to k̄" of `matsuda-highest-break-theorem` now cites:
   - ArithmeticGaloisRepresentations:R01.3/conductor-unramified-base-change, for the Galois side;
   - RD.1/generic-radius-basic-properties (f), for the differential side.
9. **Hypotheses made consistent with the suppliers:**
   - `matsuda-decomposition` now states K discretely valued and k perfect, as its own hypotheses said. The overview's proof of Proposition 4.4.3 needs Remark 3.5.7, which needs a separable residue extension.
   - `quasi-constant-modules-are-semilinear-representations` now assumes a separable residue extension. Only then do the suppliers give ker(d on R^L) = K′.
   - The Tsuzuki trivialisation (a) now says K is complete and discretely valued, instead of "any K".
   - The comparison over R^L records Berger's standing assumption in §5.5 that k is algebraically closed.
10. **`andre-local-monodromy-group`.** The proof now does two further things:
    - It constructs the commutative Hopf algebra H, because Tau Ceti's reconstruction takes H as input.
    - It spells out the passage from the semilinear monodromy representations over each K′ to K̄-linear representations of I × G_a.

## Corrections to sources and locators

- **Source matches tightened:**
  - Definition 19.2.1 (the tensor product over E†);
  - Proposition 17.3.5 (purity, whose proof Definition 19.3.2 says to imitate);
  - Definition 9.4.4 (it sets R = ρ for the zero module; the trivial module has R = ρ by computation);
  - Theorem 6.5.3 (an equality, used as a bound);
  - Theorem 20.1.4 (for a module with a Frobenius structure for some lift);
  - Proposition 6.11 of arXiv:math/0110124.

  On Proposition 6.11: its statement does say that a (nearly) separable extension can be chosen, but its proof never constructs one with v_p(A − I) > 1/(p − 1).
- **E-RD2-4:** the Documenta proof of Lemma 2.9.1 begins on p. 475.
- **E-RD2-5:** the arXiv v4 proof of Lemma 2.9.3 begins on p. 29.
- **Concordance:** all other pages in the table agree with both texts.

## Source issues

| Id | Source and locator | Verdict |
|---|---|---|
| E-RD2-1 | Book, Theorem 19.4.1 and Corollary 19.4.2 | Confirmed. The book uses Serre's numbering, and Dwork's module has R = ρ², so R = ρ^{b+1}, i.e. IR = ρ^b. Breaks in (0, 1) occur. Neither errata list addresses it. |
| E-RD2-2 | Xu–Zhu (2.9.2.2) | Confirmed. Direct computation gives Sol(M) = (Coker N)^∨. |
| E-RD2-3 | SFR Definition 2.5.1 | Confirmed, from the erratum. |
| E-RD2-4 | SFR Lemma 2.9.1, proof | Confirmed; locator corrected. |
| E-RD2-5 | SFR Lemma 2.9.3, proof | Confirmed; locator corrected. |
| E-RD2-6 | arXiv:math/0110124v4, introduction | Confirmed, from the erratum. |
| E-RD2-7 | arXiv:math/0110124v4, Lemma 2.3 | Confirmed, from the erratum. |
| E-RD2-8 | Overview Lemma 5.4.6 | Confirmed on the page image. |
| E-RD2-9 | Overview, proof of Lemma 5.4.7 | Confirmed by expansion. |
| E-RD2-10 (new) | Book, proof of Lemma 19.3.3 | Sign of the Frobenius compatibility. Affects nothing. |
| E-RD2-11 (new) | Overview, proof of Lemma 5.4.7 | Missing factor i. Affects nothing. |
| E-RD2-12 (new) | Book, Example 17.1.4 | Sign of the connection of Dwork's module; the first pass's E13 is the same slip in the Weil II paper. Affects nothing. |

## Baseline

- All 18 declarations exist under the cited names and modules at Mathlib 082e2d3 and Tau Ceti f790474, and their statements fit their uses.
- **Corrected `provides` texts:**
  - `Algebra.Etale` is the class only, not the lifting of separable residue extensions;
  - `PerfectField`: the instance for algebraically closed fields is `IsAlgClosed.perfectField`, in `IsAlgClosed/Basic.lean`;
  - `Field.absoluteGaloisGroup` is defined through `AlgebraicClosure`.
- **Tau Ceti Galois descent:** the descent lemmas need a finite automorphism group (and, for the injectivity lemma, a finite Galois extension). That fits every finite descent step.
- **Tau Ceti Tannaka:** the declarations concern finitely generated comodules of a given commutative Hopf algebra, which is how the André node uses them.
- **`IsAlgClosed.of_denseRange`** needs `CharZero`, as the completion-lemma node says.

## Suppliers, tiers and duplication

- **Tiers.** Every cross-roadmap supplier is in a lower tier, and its statement was read:
  - ArithmeticGaloisRepresentations R01.3 is tier 7. Its accepted packet is the supplier. All of its targets are also in TauCetiRoadmap pull request #856, which plans the perfect-residue-field ramification theory as a target.
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 is tier 10.
- **Lang node and R07.4.** R07.4 (i) is only the p-power case. The q-power case is argued in the Lang node itself, as it says.
- **New restructure proposal.** The RD.6 follow-up, merged just before this packet, restates two RD.2 theorems:
  - `RD.6/highest-break-equals-ramification-break` is `matsuda-highest-break-theorem`;
  - `RD.6/irregularity-equals-swan` has the local content of `irregularity-equals-swan-conductor` (a)–(b).

  The local theory belongs to RD.2, so RD.6 should cite these nodes.
- **Tsuzuki node.** `tsuzuki-equivalence-finite-local-monodromy` (a) restates the accepted first-pass node `tsuzuki-unit-root-finite-monodromy`, whose import it proves. Restructure proposal (1) handles this at assembly.
- **Completion lemma.** It has no lower-tier owner:
  - PerfectoidSpaces P4 records it as a gap;
  - the TauCetiRoadmap pull request for PerfectoidSpaces does not state it;
  - DiamondEtaleCohomology C8 proves it inline.

  That proposal now records these facts.
- **Stage cycles.** The packet creates none.
  - `RD.1/robba-residue-duality` (RD.1 follow-up) cites three RD.2 nodes. That is the RD.1 ⇄ RD.2 inversion which the packet's restructure proposal (4) resolves.
  - The stage-level path RD.2 → R01.3 → R01.1 → G7 → P7 → RD.2 runs only through upward citations already recorded as moves down. There is no node-level cycle.
- **Tau Ceti.** Neither TauCetiRoadmap main nor the Tau Ceti library has any of the RD.2 targets.

## Suggested Lean file

`lean-check` at Tau Ceti f790474 and Mathlib 082e2d3 elaborates the file. Its only warnings are for proofs left open. I checked each statement by hand:
- the characteristic-free completion lemma;
- the Kronecker closure of the matrix condition;
- the two exponent identities;
- conjugacy of a nilpotent N with qN;
- m ∣ p^h − 1;
- the inverse Herbrand function;
- formal horizontal maps.

All are true as stated. The file states only what the pins can carry, as the 2026-10-12 shape asks, so it needed no change.

## Planets

The two planets are "Irregularity equals Swan conductor" and "André's local monodromy group". Both are named theorems from the sources. Together with the first pass's six, layer RD.2 would show eight planets. The checker counts planets per packet only. The packet's sub-layer proposal (RD.2a/b/c) resolves this, and says the assembly keeps six planets if the sub-layers are not adopted.

## Questions for the orchestrator

1. Until the sub-layers are adopted or the assembly trims the list, promotion shows eight planets on RD.2.
2. The RD.6 review (#9756) should consider the new ownership proposal: RD.6 cites `matsuda-highest-break-theorem` and `irregularity-equals-swan-conductor` instead of restating them.
3. The RD.1 follow-up's `robba-residue-duality` sits in RD.1 but cites three RD.2 nodes. Its review (#9751, merged on 14 October) accepted it in place. The layer inversion therefore stays for the assembly, which proposal (4) of this packet addresses by moving the node to RD.2 and citing `matsuda-decomposition`.
