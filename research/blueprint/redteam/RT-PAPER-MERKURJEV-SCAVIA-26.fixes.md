# RT-PAPER-MERKURJEV-SCAVIA-26: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #5004, job
FIX-RT-PAPER-MERKURJEV-SCAVIA-26).
- Findings: `RT-PAPER-MERKURJEV-SCAVIA-26.result.json`.
- Verdicts: `RT-PAPER-MERKURJEV-SCAVIA-26.review.json`. The red team has seven findings, all confirmed.
  This job applies the five medium ones (1–5), the ones the issue lists. Where the verifier corrected a
  fix, I applied its version.
- **Files changed.** `papers/PAPER-MERKURJEV-SCAVIA-26.result.json`, and `papers/PAPER-MERKURJEV-SCAVIA-26.md`,
  whose audit paragraph now names ProfiniteProPGroups and which has a new closing section.
- **Result.** 134 items (12 library, 10 planned, 112 missing) and eight routes. `check_paper.py` reports
  ok.
- **Independence.** I did none of the extraction (Codex, cc-39fac3), its review (cc-fb70e5), the red
  team (cc-f805bf) or the verification (cc-48533a).
- **What I checked.** Every declaration cited below, in the pinned declaration index, at the file and
  line given. That includes `TauCeti.UpperTriangularGroup.diag_surjective`, cited by name.

## /1 (medium, error): the Tau Ceti owner of weak embedding problems was missing: fixed

- **/3** is now planned at `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations`
  first, then IG.4, as PAPER-HARPAZ-WITTENBERG-23/23 does. Its note explains that a weak solution for a
  non-surjective ρ is a Layer 5 IsSolution for ρ onto its image, after pulling back.
- **/8's note** names Layer 5 as the owner of the dictionary, the splitting criterion and 5.2. It limits
  route 1 to two additions:
  - (a) arbitrary finite abelian kernels, through the primary decomposition, which the verifier checked;
  - (b) the verifier's addition: the class of Γ_K ×_H G equals ρ*α, that is the dictionary's naturality
    under pullback along ρ, proved by pulling a normalized factor set back through a set-theoretic
    section.
- **Imports.** Route 1's reason and the briefs of routes 6 and 7 name ProfiniteProPGroups Layer 5 as an
  import. The verifier added route 7 to the fix.
- **The report's audit paragraph** now names ProfiniteProPGroups.

## /2 (medium, library-claim): the connecting homomorphisms are built: fixed

- **/43 is now library,** and leaves route 6. It cites:
  - `TauCeti.ContCohomology.DiscreteShortExact`, with `explicitDelta0`, `explicitDelta1` and their
    `_apply` lemmas;
  - `explicitLongExact_H1C` and `explicitLongExact_H2A`, as the verifier added. Its note records the
    whole exact sequence, LongExact.lean:145–546.
- **Its note also records the adapters the verifier asked for:**
  - discrete copies of Q, via Mathlib's order topology problem and `WithDiscreteTopology`;
  - Additive with the discrete topology for L×, μ_e, μ_n and μ_ne.
- **The one part that is not built,** ∂₂(χ) = χ*(θ) with its sign, moves to /49's note as a missing step.
- **/67:** the map is explicitDelta1 of 0 → Z → Q → Q/Z → 0. Its bijectivity is missing only through /68,
  with explicitLongExact_H1C and explicitLongExact_H2A.
- **/98** cites explicitDelta0/1_naturality, explicitDelta0/1_res and explicitCor_delta0/1. The verifier
  added the degree-0 versions for ι.
- **/50:** φ_H′ = explicitCor2 ∘ explicitCup02 for the pairing A × Z → A.
- **Route 6's brief** imports all of these and does not construct connecting maps.

## /3 (medium, library-claim): the matrix groups are built: fixed, statuses kept missing

- **/75:** Matrix.GeneralLinearGroup.map along ZMod.castHom.
- **/76:** TauCeti.upperTriangularGroup and UpperTriangularGroup.map.
- **/79:** Matrix.card_GL_field, upperTriangularGroup and upperUnitriangularGroup. Following the
  verifier, it says that |U_n(F_p)| = p^(n(n−1)/2) is still to be proved; only GL2Borel.card_eq is at the
  pin. It adds the derivation of |B_n| through ker_diag and diag_surjective, and of the index ≡ 1 mod p.
- **/86:**
  - U is upperUnitriangularGroup (Fin 3) (ZMod p), and T is diagonalTorus (ZMod p) 3;
  - σ_ij is transvectionUnit, and the commutator test is commutatorElement_transvectionUnit, both
    verifier additions;
  - the API is now coordinates on the existing carrier;
  - it keeps only the Heisenberg-specific N, S, exponent, order-p² and T-normalization facts.
- **/87:** imports the centre and commutator subgroup from PAPER-HARPAZ-WITTENBERG-23 route 7 (/14–/16).
- **/100:** diagonalTorus and diagonalTorusEquiv.
- **Route 7's brief** names these carriers. It also imports the general U_(n+1)(F_p) API from Continuous
  cohomology of profinite groups, Part II (DESIGN-ProfiniteCohomologyPartII), with the job named as the
  verifier corrected it.

## /4 (medium, duplicate): the universal coefficient theorem had several owners: fixed

- **Moved.** /52, /53 and /123 moved from route 6 to a new source route 8 with stages
  ['ArithmeticGaloisDuality:D7']. It is appended, so routes 6 and 7 keep their numbers.
- **Route 8's reason** gives the verifier's general form. D7 plans the universal coefficient theorem for
  complexes of free abelian groups once and derives three sequences:
  - (a) homology tensor–Tor, for any group;
  - (b) cohomology Hom–Ext, for any group and trivial A;
  - (c) cohomology tensor–Tor from integral cohomology, for finite G, with arbitrary trivial X and free
    P of any rank.
  D7 also fixes the Tor₁^Z interface on Mathlib's Tor.
- **Notes.** Each moved item names CALEGARI-DIMITROV-TANG-25/finite-group-homology-inputs as the companion
  statement.
- **Route 6 and the gap.** Route 6's brief imports these from D7 and keeps only /54. The gap
  'tor-api-design' now says to import from D7, replacing "coordinating with ClassFieldTheory".

**For the maintainer.**
- PAPER-WOOD-19/131 should also import from the single owner.
- The verifier recorded a cost. D7 has depth 5 and requires R02.4 (Poitou–Tate), so this purely
  algebraic lemma pulls Poitou–Tate into the dependencies of several Part IIs. The maintainer may instead
  choose the pending ProfiniteCohomology Part II design as the single owner, re-pointing CDT25 route 7
  and Wood /131.
- Either way the owner should import the algebraic core from Tau Ceti AlgebraicTopology stages 5–6, which
  plan the Künneth and universal coefficient sequences over PIDs.

## /5 (medium, missing): the sharpness of Theorem 1.3's hypothesis: fixed

**New item /134,** missing, route 6: "The roots-of-unity hypothesis of Theorem 1.3 is sharp".
- **The witness** is the red team's H = A = Z/2 over Q, which the verifier re-checked. H̄² = H² ≅ Z/2 is
  generated by the Z/4 class, whose pullback along the character of Q(√−1) is (−1,−1) ≠ 0.
- **The general statement** is Gherman–Merkurjev Theorem 4.2(1)'s cyclic family, as the verifier
  suggested.
- **Its note** says that sharp does not mean necessary. The verifier's example is Z/3 over
  Q(ζ₉ + ζ₉⁻¹).

**Other changes.**
- **/128's note** keeps "no claim of necessity", which is true of Example 2.2 as the verifier explained,
  and adds a pointer to /134.
- **/70's note** points to the witness.
- **Route 6's brief** adds /134 as an acceptance test beside /64.
- **The Gherman–Merkurjev prerequisite's why** now cites Theorem 4.2 (called 4.1 in its introduction),
  Theorem 5.2 and Corollary 3.4, as the verifier corrected it.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-MERKURJEV-SCAVIA-26.result.json`: ok.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- The JSON keeps the file's own formatting (indent 2).
- No Lean was compiled.
