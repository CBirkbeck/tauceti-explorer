# REV-FIX-RT-AREA-etale~2

Independent review of FIX-RT-AREA-etale~2 (Codex, session `codex-rtOQ9t`, issue #5155, PR #5255) for issue #5156.

Reviewer: Claude Code, session `cc-c2c06b`, 30 September 2026. I did not write:
- the red team, its verification, or either round of fixes;
- either Habiro packet or its first review.

**Verdict: both packets accepted, after two corrections in place in the HQ packet.**

## What I reviewed

**The files.**
- `research/blueprint/packets/HabiroCohomologyFoundations--HQ.1.json` (the HQ packet);
- `research/blueprint/packets/HabiroRings.json` (the HR packet).

**What I read:**
- the findings and verdicts (`RT-AREA-etale.result.json` and `.review.json`) for every finding that bears on these
  packets: /6, /27–/32, /34, /35 and /40;
- the round-2 report `RT-AREA-etale.fixes-2.md`;
- the round-2 commit's diff of both packets, node by node.

**The sources.** I downloaded the fix's sources and checked their SHA-256 hashes against the packets:
- Scholze, arXiv:1606.01796 (`ce060b41…`), §7, pp. 15–16;
- Wagner, arXiv:2510.04782v2 (`591d0bdf…`), Example 3.12, pp. 25–26;
- Meyer–Wagner, arXiv:2410.23115v4 (`4479788e…`);
- Wagner, arXiv:2510.06057v1 (`fe9d7d71…`).

**What changed.**
- **HQ packet:**
  - four nodes added, so 118 → 122;
  - four nodes changed;
  - baseline, coverage, gaps, requests, restructure notes, sources and sourceVersions updated.
- **HR packet:** no node changed. Only coverage notes, restructure notes and two sourceVersions records.

**The earlier HQ review.** It was needs_changes for one reason only: its reader was stale. The regenerated reader
`readmes/HabiroCohomologyFoundations--HQ.1.md` now names every one of the 122 nodes, so that blocker is gone.

## Checks

- `python3 scripts/check_blueprint.py` with the pinned declaration index, before and after my corrections:
  - HQ packet: 122 nodes, 0 errors, 0 warnings;
  - HR packet: 50 nodes, 0 errors, 0 warnings.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.

## Findings on these packets

### /29 (medium, missing): q-connections and the framed Habiro complex. Right, with the excerpts corrected.

The verifier asked for a q-connection target, a precise semilinear/descent construction with the unproved part kept as
a gap, and Example 3.12's framed Habiro complex at HQ.4. Four nodes were added.

1. **`HQ.1/modules-with-framed-q-connection`.**
   - It matches Scholze's Definition 7.3: finite projective over R⟦q−1⟧, d commuting maps, and
     ∇_i(fm) = γ_i(f)∇_i(m) + ∇_{q,i}(f)m with ∇_{q,i}(f) = (γ_i(f) − f)/(qT_i − T_i).
   - It does so relatively over A, specialising to A = Z.
   - Remark 7.4's warnings (naive tensor formulas, no full faithfulness) and Conjecture 7.5's status are both kept.
2. **`HQ.1/modified-q-connections-on-a-torus`.** With ∇̃_i = x_i⁻¹(Γ_i − id), the relation Γ_i(fm) = σ_i(f)Γ_i(m)
   gives the stated twisted Leibniz rule. I checked three further points:
   - commutation passes to the ∇̃_i, because σ_i fixes x_j for j ≠ i;
   - Γ(m ⊗ n) = Γ(m) ⊗ Γ(n) is balanced;
   - the ordinary-to-modified comparison is correctly conditional on h-completeness.
3. **`HQ.1/torus-descent-for-modified-q-connections`.** The heart correspondence is right. Γ^a(fm) = σ^a(f)Γ^a(m), and
   the skew group multiplication is (f[a])(g[b]) = fσ^a(g)[a+b]. The derived quotient-stack comparison is correctly left
   as a gap.
4. **`HQ.4/the-uncompleted-framed-habiro-koszul-complex`.** This is Wagner's Example 3.12: the toric Λ-structure, the
   relative Habiro ring H_{S/A[x]}, and γ_i extended factor by factor through the equaliser of Lemma 2.12. It imports
   HR.5 rather than rebuilding the ring. I checked the monomial test D̃(x^n) = (q^n − 1)x^{n−1}, which has no q − 1
   denominator. HQ.3 consumes the node, and no HQ.3 → HQ.4 edge was added.

**Corrected.** All four source excerpts were very short: 30, 30, 30 and 39 characters. The same 30-character phrase
served three nodes, and for the torus-descent node it was paired with the locator "§7, scope boundary". I replaced
them with literal excerpts of at most 300 characters, each checked against the PDF:

| Node | New excerpt |
|---|---|
| framed q-connection | Definition 7.3's defining sentence |
| modified connection | Remark 7.4's sentence on the naive tensor formulas |
| torus descent | Conjecture 7.5, with a match saying that the source does not assert the descent theorem |
| framed Koszul complex | the toric Λ-structure and γ_i sentences of Example 3.12 |

### /34 (medium, error): HQ.2's owners. Half applied; completed here.

The verifier confirmed two points:
- the blanket DD.6 edge;
- the attribution of generic complete filtered modules to EnhancedDerivedSheaves rather than DD.1.

**What the fix did.** It kept the DD.1, DD.2 and DD.3 imports and handed the edge removal to the maintainer, which is
right. But it left the conventions node `HQ.2/filtered-graded-and-completion-conventions` saying "imported from
DerivedDeRhamCohomology:DD.1 and EnhancedDerivedSheaves:E1/E4". E4's text says it re-exports DD.1's completion and owns
only the extension to sheaves.

**Corrected.** The node now attributes:
- complete filtered and graded objects, derived completion and the fracture square to DD.1;
- the stable ∞-categorical setting to E1.

It says that E4 is a re-export, not an owner, and E4 is dropped from its prerequisites.

### The other findings on these packets. Right.

- **/27 (duplicate q-Witt plans).** Both packets record the accepted RS-10 ownership as a conditional table. Nothing is
  transferred to the QWittVectors and AnalyticHabiroStack stages, which do not yet exist in the assembled atlas. HQ.4 →
  HQ.3 is kept, and no reverse edge is added, as the verifier required. The HR notes are corrected: the restriction
  obstruction now has one owner. I checked that HQ.4's restriction node imports `HR.4/there-is-no-restriction-map` in
  its first proof step.
- **/28 (framed prefix).** `HQ.1/the-coordinate-dependent-q-de-rham-complex` now states:
  - I-complete étale framings for I = (q−1) and I = (p, q−1);
  - the regularity needed to divide by (q−1)T_i;
  - completed base change;
  - independence from positive-degree QW.5.

  PR.6 keeps its q-PD site and prismatic comparison. The ownership note separates the q-PD ideal (q−1) from the prism
  ideal ([p]_q).
- **/31 (Theorem 3.11(b)).** HQ.3's coordinate node puts Theorem 3.11(b) and Corollary 3.31 on the uncompleted
  Habiro–Hodge reduction modulo q^m − 1, and Corollary 3.54 on the Bockstein differential. It says that none of these
  replaces the object by its q−1 completion. This agrees with Example 3.12 on p. 26.
- **/32 (Λ-ring owner).** HQ.1 nodes import `HR.1/lambda-rings-with-commuting-adams-operations`, and no second owner
  is created.
- **/35 (scheme perfectness).** The statement keeps the base Z[1/N] with every prime ≤ d inverted, and the target is
  the Habiro completion of H[1/N]. The proof steps are now four explicit obligations:
  - RΓ commuting with base change;
  - finite-level perfectness;
  - uniform Tor-amplitude and finite presentation;
  - a real completeness-perfectness criterion.

  They record that Appendix B.2–B.4 is not such a criterion, and they classify §1.16 as an unproved introduction claim,
  not a false statement.
- **/6 (HQ.5 inputs).** The HQ.5 nodes carry the Meyer–Wagner divided-power lifts (v4 Lemma 3.16, with the numbering
  discrepancy recorded as source issue E302). They also carry ku Theorems 4.14, 4.16 and 4.17, including p = 2, and
  the E_1 hypothesis on the p-quasi-syntomic cover R_∞.
- **/30 (analytic supplier).** HQ.6 names draft AnalyticHabiroStack HS.3 as its supplier, and HQ.6 stays a comparison
  problem.
- **/40 (HQ.5 versus HQ.5-trace).** The packet keeps the two stages' nodes distinct, and the regenerated reader
  renders them separately.
- **/33.** The maintainer handoff (HQ.5-trace feeds HQ.7, and algebraic acceptance does not wait for HQ.6) is
  recorded.

### Findings outside these packets

The fix report sends /1–/5, /7–/9, /11–/23, /25–/26, /37–/39 and the other owners' parts to the named blueprint
jobs, the paper-record owners or the maintainer. These packets are the only files assigned, so no edit here was
required. /10, /24 and /36 were rejected by the verifier, and nothing changed for them.

## For the maintainer

- **Deferred transfers.** The RS-10 transfers wait for QWittVectors and AnalyticHabiroStack to be installed. They
  should then move nodes, requests and consumers in one step, as both packets' restructure notes say.
- **Atlas edges.** Remove the blanket DD.6 → HQ.2 edge while keeping the DD.1/DD.2/DD.3 inputs. Add HS.3 → HQ.6 when
  HS.3 exists.
- **Lean.** The suggested Lean files are not files under review, and I did not compile them.
