# Independent review: RD.0 follow-up of p-adic differential equations and rigid cohomology

**Verdict: accepted, with corrections.** All 22 nodes have a justified verdict: 7 verified and 15 corrected, with no node added or removed. All 12 baseline declarations were read at the pins and confirmed. All six source issues were confirmed. No unresolved contradiction remains. The stage stays `planned`, and its `remaining` list now names the supplier decisions and the assembly edits that join this packet to the parent.

Reviewer: Claude, session `claude-UtYZXL`, job `REV-PadicDifferentialEquationsAndRigidCohomology--RD.0` (#9750), 14 October 2026. The packet was written by a different worker, `codex-kedTO0` (BP-PadicDifferentialEquationsAndRigidCohomology--RD.0, #9742, PR #9792). This review edits only the packet, its suggested file, its reader, this report and the job's handoff note.

## Inventory

The packet plans the four items the accepted parent left open at RD.0:

- the Arabia lifting interiors behind the dagger Frobenius lift and its homotopies;
- Kedlaya's valuation p-bases and overconvergent tensor descent (Slope filtrations revisited, Lemma 2.2.19 and Proposition 2.2.21);
- the Laurent/Robba topology, coefficient extension and Lazard's ideal theory;
- the weak Amice topology and Frobenius substitution needed for the full Frobenius-lift signature.

It has 22 nodes: 3 definitions, 5 constructions and 14 theorems. They carry 44 API items (one added here), 32 unit tests, 3 planets, 12 baseline declarations, 3 supplier requests and 6 source issues. Every definition and construction has at least three tests that a plausible wrong definition fails.

## Sources read

I fetched every public source into scratch and checked its SHA-256 against the packet; all eleven agree. Van der Put was read from Numdam's free copy.

| Source | What was read |
| --- | --- |
| Kedlaya, *Slope filtrations revisited*, Doc. Math. 10 (journal PDF) and arXiv v4 | §§2.1–2.4, pp.451–462, in full; Proposition 2.2.21 in both versions; §7.5, pp.522–523 |
| Kedlaya, erratum (Doc. Math. 12, 2007) and author list of 12 February 2013 | Both in full |
| Arabia, Comment. Math. Helv. 76, author copy | §§1.1–1.3, pp.614–620; §§2.0–2.2, pp.624–634; §3, pp.634–639 |
| Lazard, Publ. Math. IHÉS 14 | §§1–8, pp.48–71 |
| Colmez, préface to Fargues–Fontaine, April 2017 author copy | §2.5.1, printed p.24 |
| Fontaine–Ouyang, author manuscript | §3.1, Propositions 3.3–3.8, pp.41–44 |
| van der Put, MSMF 23 | (2.4.4), pp.37–38 |
| Kedlaya, *Local monodromy … an overview*, arXiv v2 | Chapter 3, pp.9–15 |
| Kedlaya, *Finiteness of rigid cohomology with coefficients*, arXiv v6 | §2.5, pp.15–18 (for the reader's description of RD.5's relative Robba rings) |

## Corrections

**Locators.** Eight citations pointed at the wrong item or page:

- Kedlaya has no Remark 2.4.9. The Laurent reading of the analytic rings is Remark 2.4.3 (p.460) and Example 2.4.9 (p.461).
- Definition 2.4.2 is on p.460, not p.459.
- The cited "Proposition 2.3.7" is Corollary 2.3.7.
- The "Remark 2.4.10" contrasted with coefficient extension is Proposition 2.4.10.
- The full-faithfulness use in §7.5 is the proof of Proposition 7.5.1 on p.522, not "Theorem 7.5.1, p.521".
- The overview's compact PID result is Proposition 3.2.3 on p.11 (for closed aligned intervals), not "Theorem 3.2.3, p.10".
- Lazard's divisor definitions run (4.2)–(4.8) on pp.57–58, and Proposition 5 is on p.59.
- The Colmez paragraph is entirely on p.24.

**Disc versus annulus.** Lazard proves the divisor, majorant, interpolation, closed-ideal, prescribed-divisor and Bézout results only on the open disc. After his Proposition 4 bis (p.56) he says, with an outline, that zeros on an annulus reduce to the disc. The six nodes state annulus versions, so each `match` now says what the source covers, and the reader gains a paragraph on it. For the spherically complete annulus case, Kedlaya's overview Theorem 3.4.3 with Remark 3.4.4 (pp.14–15) gives exact realisation directly: line bundles on annuli are free. That source is added to `spherical-prescribed-divisors` and `noncompact-analytic-bezout`, and Lazard's reformulation (7.3), p.69, is added to the Bézout node. For a general complete field, the annulus cases of the majorant, interpolation and closed-ideal correspondence are the planner's own two-boundary arguments. I checked them and they are sound, but no source read states them.

**Imported rather than restated.** `laurent-topology-interface` built the Robba union's topology from "all K-seminorms whose restrictions are continuous". LocallyAnalyticDistributions:L0 (tier 3–4, accepted, Tau Ceti PR #854) already plans nonarchimedean locally convex spaces and their projective and inductive limits, with the continuity criterion. RD.5 already imports them. The node now takes `L0/nonarchimedean-locally-convex-spaces` and `L0/locally-convex-limits` as prerequisites and states the charts and the Robba union as instances. It also gains an `IsNALocallyConvex` compatibility item. I checked that this adds no cycle. (Over a countable chart system the finest topology from arbitrary real seminorms agrees with the ultrametric one, so the old statement was not wrong; it duplicated L0.)

**Mathematics.**

- `robba-closed-ideals` inverted the polynomial zero factor through the parent's unit theorem, which assumes K discretely valued, while the node claims every complete K. The step now uses Lazard Proposition 4(1): a polynomial whose roots lie below a radius is invertible beyond it.
- `valuation-p-basis` listed the parent analytic ring as a prerequisite that no proof step uses; it is dropped.

**API, planets and requests.**

- The valuation-basis API names now match the suggested file (`reindex_iff`, `rescale_iff`).
- The planet "Closed ideals and analytic divisors" moves from the divisor definition to the closed-ideal correspondence, which it names; `planetAssembly` follows.
- Each request gains the protocol's `neededBy` list beside its `consumers`.

**Assembly edits** (new second `restructure` entry and `remaining` item). The parent node `frobenius-lift-on-robba-ring` states both the Laurent, Robba and Amice carriers and the Frobenius lift. Thirteen nodes here use it only as the carrier. Its parent gap (the full topological Frobenius-lift signature) needs `weak-substitution-convergence`, and its extension clause is `frobenius-radius-comparison`. A by-script simulation shows that giving the parent node `frobenius-radius-comparison` as a prerequisite closes the cycle robba-ring → lift → radius comparison → robba-ring. The entry therefore splits the carrier from the lift on O_E and keeps the extension clause in `frobenius-radius-comparison`. It also adds parent edges from `robba-ring`, `analytic-ring-bezout`, `frobenius-lift-on-dagger-algebra` and `frobenius-lifts-induce-homotopic-maps` to the nodes here. The resulting graph over all packets is acyclic. It also drops the parent gaps this packet discharges (the Arabia half only; the Kedlaya–Xiao half stays with RD.1). Last, it withdraws the parent's request to AdicSpacesPartII:F1 for the polynomial homotopy complex and its integration contraction. F1's accepted packet does not plan them, and `endpoint-preserving-weak-homotopy` and `rational-dagger-interval-integration` now do.

## Per-node verdicts

| Node | Verdict | Main check |
| --- | --- | --- |
| laurent-topology-interface | corrected | Lazard (2.5)–(2.6); L0 import; locators |
| finite-coefficient-extension-interface | corrected | equivalence of norms; `Module.Basis.equivFunL` at the pin; Proposition 2.4.10 |
| integral-amice-weak-topology | verified | U(m,N) gives Definition 2.2.7's topology (via Lemma 2.3.5); tests |
| weak-substitution-convergence | verified | mod-π^m estimate on u^i; both tails converge |
| frobenius-radius-comparison | corrected | Lemma 2.3.3 in multiplicative form; divergence example recomputed; locators |
| valuation-basis | corrected | Definition 2.2.17; API names; Lean sync |
| valuation-p-basis | corrected | Definition 2.2.17; unused prerequisite dropped |
| finite-p-basis-laurent-example | verified | finite p-basis proof; infinite counterexample (E101) |
| perfect-coefficient-projection | corrected | Lemma 2.2.19 and proof; tests with σ(t)=t^q; §7.5 locator |
| overconvergent-galois-fixed-coefficients | verified | proof of 2.2.21(a); Fontaine–Ouyang 3.6, 3.8; Teichmüller argument |
| completed-overconvergent-tensor-descent | corrected | Proposition 2.2.21 with E102; §7.5 locator |
| controlled-weak-smooth-lifting | verified | Arabia 3.3.2(b) for weakly finitely generated B, C via 2.1.2(b) and 3.2.5(b); distinct from F1/mw-morphism-lifting |
| endpoint-preserving-weak-homotopy | verified | Arabia 2.2.2 (kernel T(1−T)) and 3.3.4(b) |
| rational-dagger-interval-integration | verified | dH+Hd = ev₁−ev₀ by hand with dT on the left; van der Put (2.4.4)(iii); denominator bound |
| compact-laurent-preparation | corrected | Lazard Propositions 2–4 and corollary; overview locator |
| analytic-effective-divisors | corrected | equals Lazard's divisors via irreducible factors; disc scope; planet moved |
| analytic-divisor-majorant | corrected | Lazard Lemme 3 and Proposition 5; disc scope |
| analytic-jet-interpolation | corrected | Théorème 3, (8.11), Proposition 11; disc scope |
| closed-ideal-divisor-correspondence | corrected | Proposition 10 over any complete K; disc scope; planet |
| spherical-prescribed-divisors | corrected | Proposition 6, Lemmes 4–5, Proposition 8, Théorème 2; overview Theorem 3.4.3 added |
| noncompact-analytic-bezout | corrected | Propositions 10–11, (7.3); overview source added |
| robba-closed-ideals | corrected | density argument; unit step for general K; Colmez p.24 |

## Baseline citations

All 12 declarations exist at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` with the stated content and hypotheses. I read each statement:

- `WithSeminorms` is a structure over a normed field.
- `WithSeminorms.continuous_of_isBounded` is for isometric semilinear maps.
- `Module.Basis` and `Module.Basis.equivFunL` (finite basis, complete nontrivially normed field, Hausdorff space) are as described.
- `IsBezout` and `Algebra.Smooth` are as described; `Algebra.FormallySmooth.exists_lift` is for nilpotent ideals.
- `WittVector.map`, `map_coeff` and `ext` are as described.
- `Polynomial.evalRingHom` and `Polynomial.dvd_iff_isRoot` (commutative ring) are as described.

None was removed or replaced.

## Cross-roadmap prerequisites and requests

**Supplier nodes.** The six AdicSpacesPartII F1 node ids exist in the accepted packet, and their statements (weak completion, its universal property and presentation, the integral overconvergent Tate algebra, dagger differentials and de Rham complex) give what the nodes use. F1's `mw-morphism-lifting` is van der Put's mixed-characteristic lifting without a controlled target, so the two Arabia nodes here are not duplicates. PerfectoidSpaces plans no characteristic-p completed fixed-field theorem; the only Ax–Sen node is PadicHodgeTheory's characteristic-0 one, which is a higher tier.

**Requests.** The three requests (SF.0: Arabia's controlled lifting; F1: weak-completion collapse; P3: completed fixed fields in characteristic p) are precise. Their proof inputs match Arabia §§1–2 (including the idempotent-lifting commutator step of 1.2.3) and Fontaine–Ouyang 3.6 and 3.8. One cited input, Elkik's lemma behind Arabia 1.1.5, is honestly marked as unread.

**Red-team finding RT-AREA-padic-2/31.** The packet is consistent with it as the verifier qualified it. The dagger carriers come from F1. The single Laurent/Robba carrier stays in RD.0 because PadicHodgeTheory is a higher tier, and the first restructure entry asks P7 to import it.

## Source issues

All six are confirmed; the reasons are in each entry's `review`.

- **E101.** Kedlaya Example 2.2.18 fails for k of infinite p-rank: Σ s_n t^{pn} has no finite expansion.
- **E102.** In the proof of Proposition 2.2.21(c), y_i + c_i should be y_i + c_i y_1, in both versions.
- **E103.** Colmez Théorème 2.30(ii) omits the zero ideal; Lazard Proposition 10 says nonzero.
- **E104.** Fontaine–Ouyang's proof of Proposition 3.6 drops the factor α.
- **E105.** Colmez writes v_J as a sum where an infimum is meant.
- **E106.** Colmez completes Laurent polynomials also for discs containing the centre.

For E103 and E106 the intended statement is obvious but the printed one is false, so the error classification is kept. I found no further mistake that the packet missed. Arabia's remark after Théorème 3.3.2(b), extending very smoothness from finitely generated to all weakly complete targets, is terse, but it can be completed, and the node uses only the finitely generated case.

## Suggested file

`lean-check` on the corrected file elaborates at the pinned build in about two seconds, with `sorry` warnings only (11 declarations). A scratch copy with a `run_cmd` audit, with examples renamed to theorems, finds no `sorry` in any type or definition body (15 declarations audited). The file has the compact shape: one real-bodied predicate over `Module.Basis`, milestones statable at the pins, examples, and no placeholder data. Changes:

- added `IsValuationBasis.rescale_iff`, stated with `Module.Basis.unitsSMul`;
- added the `valuationBasis_bad_change` counterexample under the sup norm on `Fin 2 → K`;
- labelled each example with its packet test name.

Every packet API name for the one carrier available at the pins now appears in the file.

## Reader document

The node sections of the reader are a field-by-field rendering of the packet. A small renderer reproduced all 22 sections of the HEAD reader exactly, so every correction was made in the packet by one idempotent script and re-rendered. The hand-written sections were updated to match:

- the L0 import;
- the disc/annulus paragraph;
- the source-issue verdicts;
- the suggested-file summary;
- the planet note.

The HEAD reader also lost characters on the atlas site: `_` after a Greek letter and the two `r_*` opened emphasis, 47 times in all. The re-rendered reader escapes these. A Python port of `src/markdown.js`'s inline rules shows no emphasis or mathematics spans left (only the 15 intended bold spans and 48 links), and each line's visible text equals its intended text.

## Checks run

- `python3 scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings.
- `merge_blueprints` in memory with the parent and this packet: no skipped links. The RD.0 stage gains the SF.0 and P3 requirements from the requests.
- Cycle check over all packets with the proposed assembly edits: acyclic.
- `lean-check` plus the audit, as above.

## Questions for the orchestrator

1. **Supplier contracts.** SchemeAndStackFoundations is now on Tau Ceti main, and AdicSpacesPartII and PerfectoidSpaces are open Tau Ceti pull requests (#817, #818). Each of the three contracts must either become a Part II of its supplier or be planned in this roadmap's package. Arabia's §§1–2 controlled lifting is large, roughly 25 pages, and the completed fixed-field theorem in characteristic p is short.
2. **Ownership.** The atlas still records `PadicHodgeTheory:P7:annulus-foundations` as an input of RD.0, an upward edge under the tier order. The first restructure entry asks for the RS-26 reconciliation.
3. **Assembly.** Apply the second restructure entry when the RD.0 parts are joined. The split of the parent Frobenius-lift node is required: without it the radius comparison creates a cycle.
4. **The RD.1 request to RD.0.** RD.1's review merged while this review was under way, and RD.1 asks RD.0 for the Fargues–Fontaine coefficient rings B_I, E† and R_F in both coefficient characteristics. This packet was written before that request and does not answer it as such, but most of it is planned already:
   - in mixed characteristic, the parent's `analytic-ring` (Kedlaya's Γ_I over a perfect residue field), `extended-robba-ring` and `analytic-ring-membership-and-intersections`;
   - in equal characteristic, `laurent-topology-interface` here, with the variable π and coefficients in the perfect field F;
   - for scalar extension, `finite-coefficient-extension-interface` here.

   What remains is a comparison node in Fargues–Fontaine notation, for the RD.0 assembly or a further follow-up.
5. **Source scope.** The general-field annulus cases of Lazard's theory (majorant, interpolation, closed ideals) rest on the planner's argument, not on a read source. A source that states them for annuli would be worth recording if one is found.
