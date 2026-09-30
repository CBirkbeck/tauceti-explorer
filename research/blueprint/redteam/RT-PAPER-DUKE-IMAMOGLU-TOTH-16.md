# Red team: PAPER-DUKE-IMAMOGLU-TOTH-16 (Duke–Imamoḡlu–Tóth, *Geometric invariants for real quadratic fields*)

Job `RT-PAPER-DUKE-IMAMOGLU-TOTH-16` (issue #4118), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-DUKE-IMAMOGLU-TOTH-16.result.json`, in the format of PROTOCOL section 17.

**Result:** 16 findings, 6 medium and 10 low. None is high. The mathematics holds up:

- Theorems 1–4 stand with the recorded corrections.
- The 34 recorded mistakes are genuine.
- I found no new mistake in the paper.

The problems are elsewhere:

- two changes the review made;
- owners that another roadmap or extraction already holds;
- errata bookkeeping;
- library declarations the items do not cite.

## Independence

- **Who did the work.**
  - The extraction is by Codex sessions codex-c83e7a and codex-a71f92 and Claude Code sessions cc-fb70e5 and cc-442dc5 (issue #1170).
  - The review is by Claude Code cc-2aeb03 (issue #1171).
  - The errata record is by cc-fb70e5, and its review is by codex-7e92bd.
  - `cc-f805bf` appears in none of these files.
- **Disclosure.** This session red-teamed Khayutin 19 (PR #4789) and wrote FIX-RT-AREA-automorphic-1. That fix edited AS, AF, AL and MP stages.
  - Findings 5 and 8 quote AS and AL stage texts. I quote them at the review's commit (75afde94), which predates my fix.
  - No finding asks for a change to this session's own files.
  - Nothing here touches Khayutin 19.

## What was read

- **The version of record.** Ann. of Math. 184 (2016), 949–990, fetched 30 September 2026 from the Annals site. Its SHA-256 is a67de715…5f61, the same as the extraction's.
  - I read all 42 pages against the 188 items.
  - I checked page images for pp. 952, 963, 965 and 967.
  - The Annals page links no erratum, Crossref records no update, and there is no arXiv version.
- **The author preprint** (29 July 2016, Duke's page). Its hash, f1f042ad…cfcf, matches the errata review's. I spot-collated it against the published text.
- **The rest of the repository.**
  - The review's diff: 29 rewritten statements and 31 removed items.
  - Every cited library declaration, at Mathlib 082e2d3 and Tau Ceti f790474.
  - Every routed stage, both at the review's commit and now.
  - The later packets of GN, AN, ES, AL, MP, GZ, QM and CA.
  - The overlapping items of Bruinier–Ehlen–Yang 21, Binyamini 22, Gross–Zagier 86 and Khayutin 19, among others.

## What holds up

- **Recomputed by hand or by script:**
  - the D = 12 and D = 28 minus cycles, (4), (3,2) and (3,6), (3,3,2,2,2), and the areas πℓ_A;
  - the Hirzebruch–Zagier identity ℓ_J − ℓ_I = 3h(−p), for every prime p ≡ 3 mod 4 below 600 with h⁺(4p) = 2;
  - the cycle product (6.3), ∏w = ε_D, for five discriminants;
  - E5's family, where ℓ_A = a for D = a² + 4;
  - the four numerical instances of Theorem 4 on p. 967 from Table 2. They agree with the printed values, and they confirm λ = ¼ + r² (E3).
- **Source issues.** E9, E10, E24 and E26 re-derive. For E28 I re-derived the part about Lemma 4: √D dz/Q(z,1) = −y⁻¹|dz| in the γ_Q (clockwise) direction.
- **Routes.** Every missing item is routed exactly once. The routes form no cycle. Both Part IIs are still awaiting design.

## Findings

| # | Severity | Kind | Where | What |
|---|---|---|---|---|
| 1 | medium | error | item 141 (review) | The review wrote "d′, d > 0 fundamental with D = d′d > 1, then coprime and D fundamental". This is false: 5·5 = 25 and 8·12 = 96. |
| 2 | medium | missing | items 150, 153, route 5, E6 | The Rankin–Selberg norm identity is removed, although the corrected (6.6), and so Theorem 2, rests on it. Route 5 still promises it to AL.3. |
| 3 | medium | duplicate | items 101–102, route 10 | The genus character χ_d(Q) on forms is also owned at GN.2, through Bruinier–Ehlen–Yang 21/11, which was accepted first. |
| 4 | medium | error | items 17 and the signature item, 22–23, route 9 | Area π/3, the signature of PSL(2,Z) and the cofinite (2.8) are upstream FuchsianOrbifolds Layers 2, 4 and 6, and Mathlib has `SL2Z_generators`. §15 forbids re-planning them. |
| 5 | medium | duplicate | items 111, the Bessel-ODE item, 56 (route 2), 87 (route 8) | Bessel I/J, the Bessel ODE, K(m,n;c) and the Laplacian are named by QM.2/QM.3, which now have nodes for them. ES.0 and AS.0 do not plan them. |
| 6 | medium | other | errata file vs extraction | The ids E12–E14 name different mistakes, and E5, E6 and E11 conflict. The register has 48 entries for 34 mistakes. |
| 7 | low | other | both files | `sourceVersions` is missing, and `check_errata.py` fails on the errata file. |
| 8 | low | error | items 53, 57, 60, 65 | These should be planned: Duke's theorem at GN.4, E(z,s) at AS.1/AS.2, the Maass functional equation at AL.2. Binyamini 22 and Gross–Zagier 86 already mark them so. |
| 9 | low | library-claim | items 4, 6 | The narrow-class kernel (`toClassGroup_ker`, `mkPrincipal_eq_one_or_eq_mkPrincipal_gen`, `mkPrincipal_sq`) and Dirichlet's unit theorem are not cited. |
| 10 | low | library-claim | item 52, the F item | The stabiliser orders at i and ρ and the orbit-representative lemmas are not cited. |
| 11 | low | library-claim | item 63 | Tau Ceti's `heckeSlashSum` on arbitrary functions in weight 0 is not cited. |
| 12 | low | library-claim | item 14 (review) | The cross-ratio formula (2.7) is claimed as library, but Mathlib has only the arsinh form. |
| 13 | low | missing | no item | The Kronecker character χ_d has no item. It is now planned at CA.1/kronecker-character. |
| 14 | low | other | notes, routes 2–3, E6, E13 | They reference by number 31 items the review removed, including the only records of the Mathlib and Tau Ceti suppliers. |
| 15 | low | missing | no item | The p. 967 numerical instances of Theorem 4 have no item. |
| 16 | low | duplicate | Siegel and Burgess items, routes 6 and 8 | The owners are inconsistent: AN.3 here, AN.4 in Binyamini, AN.2 by source. Burgess's L-bound is routed to ES.0. |

### The medium findings

**Finding 1: item 141's hypothesis.**

- **Before the review**, item 141 said "for coprime positive fundamental d, d′".
- **The review** rewrote it as an implication: two positive fundamental discriminants with product > 1 are coprime and have a fundamental product. That is false, as 5·5 and 8·12 show.
- **The fix** restores the hypothesis, as item 139 already states it.

**Finding 2: the Rankin–Selberg norm.**

- **Why it is needed.** E6 corrects (6.6) to the unit vector u = φ/‖φ‖. Passing between the two forms, and using (6.6) in the proof of Theorem 2, needs ⟨φ,φ⟩ = 2L(1,sym²φ)/cosh(πr) and a polynomial bound for L(1,sym²φ).
- **What the review did.** The extraction had this as item 151. The review removed it as "the extraction's own repair".
- **What is left.**
  - Items 150 and 153 and E6 still cite item 151.
  - Route 5's reason still sends "the Rankin–Selberg norm comparison" to AL.3, but its items are only 64 and 65.
- **The fix** restores the item and routes it to AL.3.

**Finding 3: the genus character on forms.**

- **What it is.** χ_d([a,b,c]) = (d/m) when gcd(a,b,c,d) = 1, and 0 otherwise. This is the Gross–Kohnen–Zagier character.
- **Two owners.**
  - Bruinier–Ehlen–Yang 21 routed it to GN.2 half an hour before this paper's review was accepted.
  - This extraction sends it to the new MultiquadraticPartII, whose design has not started.
- **The fix.** One owner, GN.2. MultiquadraticPartII keeps only the comparison with the ideal-class character.

**Finding 4: route 9 re-plans upstream work.**

- **The upstream FuchsianOrbifolds roadmap already plans:**
  - Gauss–Bonnet for finite polygons (Layer 2);
  - the orbifold signature and area formula (Layer 4.5);
  - the signature of the level-one modular group from its standard polygon (Layer 6.1).
- **Mathlib** proves that S and T generate SL(2,Z).
- **The fix.** Items 17 and the PSL(2,Z) signature item become planned or library. Items 22–23 are restated as the extension to t geodesic boundary components.

**Finding 5: special functions and Kloosterman sums.**

- **QM plans them.** At the review's commit, QM.2 planned "Kloosterman sums, Bessel functions" and QM.3 planned "the weight Laplacian". The QM packet has since declared I_ν, J_ν (with Bessel's equation), the classical K(m,n,c) and Δ_k.
- **The routes' owners do not.** This extraction routes the same objects to AS (whose AS.0 text is functional analysis) and to ES.0 (whose text has no Kloosterman sums).
- **The fix.** One owner. The obvious choice is the QM nodes that now exist.

**Finding 6: the errata ids.**

- **Collisions.** The ERRATA job's file and the extraction share the ids E1–E14.
  - For E12, E13 and E14 they are different mistakes.
  - The errata file's E12–E14 are the extraction's E15, E16 and E21.
- **Conflicts.**
  - E5 affects "a stated result" in one file and "nothing" in the other.
  - E6 is a gap in one and an error in the other.
  - E11 is confirmed in one and rejected in the other.
- **The fix.** Renumber or map the errata file's entries, reconcile the three conflicts, and regenerate the register.

### The low findings

Each has an exact fix in the JSON.

- **Finding 7: `sourceVersions`.** The URLs and hashes to add are given.
- **Finding 8: statuses that should be planned.** The owners stay the same; only the statuses and counts change.
- **Findings 9–12: library citations.**
  - Tau Ceti's narrow-class kernel theorems and Mathlib's unit theorem, for items 4 and 6.
  - The PSL(2,Z) stabiliser orders and orbit lemmas, for item 52 and the fundamental-domain item.
  - Tau Ceti's Hecke slash sums, for item 63.
  - Item 14 overstates what Mathlib has.
- **Finding 13: χ_d.** Add a definition item planned at ClassicalArithmeticCompletion:CA.1/kronecker-character. Item 150's adapter needs primitivity.
- **Finding 14: dangling references.** Replace every reference to a removed item by the declaration names or the surviving ids.
- **Finding 15: the numerical instances of Theorem 4.** Record them as acceptance tests. I recomputed all four from Table 2.
- **Finding 16: Siegel and Burgess.** Siegel's theorem gets one AN.2 node. Burgess's bound is split into the character-sum bound and its L-function consequence.

## Leads not filed as findings

- **The GN, ES and AN packets** (27–29 September) do not yet use this paper as a source, so routes 1, 6 and 8 have not been applied. That gap belongs to those packets, not to the extraction.
- **The weight-½ Laplacian.** QM.3's Δ_k at k = ½ is the holomorphic normalisation of the operator. MP.7's Δ_{1/2} (item 74) is its unitary conjugate, so this is not a duplicate. Finding 5 asks item 74 to state the conjugation.
- **The theta multiplier.** The QM.1 theta-multiplier node explicitly leaves the multiplier to MP.7, which agrees with route 3.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-DUKE-IMAMOGLU-TOTH-16.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` on both files reports 0 problems.
