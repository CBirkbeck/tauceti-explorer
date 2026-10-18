# REV-DESIGN-ColemanPowerSeriesPartII

Independent review of the new roadmap **ColemanPowerSeriesPartII** ("Coleman power series, local units, and cyclotomic-unit quotients, Part II: signed anticyclotomic local units"), designed in DESIGN-ColemanPowerSeriesPartII (issue #3396, PR #10383, Codex session codex-9LHvwX). Reviewer: Claude, session claude-YdRIIh, which did no part of the design. Issue #3508. Date 2026-10-18.

**Verdict: accepted**, with corrections made in place. The `review` object of `research/blueprint/packets/ColemanPowerSeriesPartII.json` records a verdict for each of the 55 nodes (32 verified, 23 corrected, none added).

## What was reviewed and read

Files under review: the roadmap definition, the packet, the reader document and the suggested Lean file.

Sources, each opened at every locator the packet uses:

- Burungale–Kobayashi–Ota, Annals 194 (2021) 943–966, the published text (Caltech repository copy, SHA-256 matches the packet). Read in full. The pages with formulas, pp.948–949 and pp.951–954, 958–959, were read as page images, because text extraction drops the overbars and fraction bars.
- Rubin, Invent. Math. 88 (1987) 405–422, GDZ scan. All pages read as images.
- Hazewinkel, Duke 44 (1977): §1, Theorem 1.3 and its universal-norm consequence.
- Wintenberger, Compositio 42 (1980): §4, the Théorème and its Remarques.
- Abbes–Ullmo, Compositio 103 (1996): Théorème A, p.269 (newly cited).
- Fesenko, J. London Math. Soc. 57 (1998): §1, Theorem 1.1, and §2.5 (newly cited, as a lead for G1 only).

Libraries: the five baseline declarations were read in the pinned trees (Tau Ceti f790474, Mathlib 082e2d3), and current TauCetiRoadmap main and the current Tau Ceti library were checked for overlap.

## Counts

| | Before | After |
|---|---:|---:|
| Nodes | 55 | 55 (10 definitions, 5 constructions, 33 theorems, 5 comparisons, 2 applications) |
| API items | 60 | 61 |
| Unit tests | 45, with no `kind` | 45, each with a kind |
| Planets | 39 | 39 |
| Baseline declarations | 5 | 5, all confirmed |
| Gaps | 2 | 4 |
| Requests | 26 | 25 |
| Source issues | 10, no verdicts | 15, all with verdicts |

## Corrections

**Source records (all 55 nodes).** Every `match` field copied the node's own statement instead of saying what the source states at the locator. Each one has been rewritten in my own words, from the source text at the locator. A 7-word overlap scan against the extracted source texts finds only formulas and standard phrases.

**Locators.** Each of these pointed to the wrong place, or to something that does not exist:

- AU.3/signed-points cited a BKO "Definition 6.3", which does not exist. The finite groups F^±(Ψ_n) are defined in §6.0.2, p.962.
- AU.3/signed-units cited an equation "(2.1)", which does not exist. The definition is an unnumbered display on p.949.
- AU.0/inverse-tate-twist cited p.949. M* and U*_∞ are defined on p.948.
- Rubin page and number errors:
  - Proposition 1.1 is on p.407.
  - Lemma 5.1 is on p.411.
  - Proposition 5.4 is on p.412.
  - Lemma 5.5 is on p.413.
  - Proposition 5.6 is on p.413 and Corollary 5.7 on p.414; the packet had pp.414–415.
  - "Proposition 5.8" is Corollary 5.8, cited twice.
  - Lemma 10.1 is on p.421, cited twice as pp.420–421.
- Source issue E4 pointed to Rubin's Lemma 2.1(ii). The problem is in the opening of Rubin §2, where a p-adic Tate generator is used for Coleman's series.

**Mathematics.**

- *AU.3/signed-units, API item `signed_units_base_change`.* BKO's Proposition 3.3(3) and Theorem 3.4 need V*,ε⊗R to equal the set of elements whose R-extended derivatives vanish in C_p. The design justified this by flatness. Flatness only gives the statement with values in Φ_n⊗_O R; the map from there to C_p need not be injective. The item now gives the actual argument:
  - an element of Gal(Φ_n/Φ) carries δ_χ to a multiple of δ_(τ∘χ);
  - conjugate characters have the same conductor;
  - the embeddings of Φ_n⊗_Φ Frac(R) over R are the given one composed with these Galois elements.

  The proof steps of AU.4/xi-signed and AU.4/optimal-unit now cite this argument.
- *AU.7/hecke-lattice-relation.* BKO's printed forward lattices ((1+ap^s)/p^(s+1))Z_p t+T all equal T_(s+1), because 1+ap^s is a Z_p-unit. A proof step now lists the correct lattices, (1+ap^sθ)T_(s+1) with O=Z_p⊕Z_pθ, and the backward lattice p^(−1)T_(s−1). The error is recorded as E14.
- *AU.6/dedekind-completion-models.* The statement wrote K(p^s) for the ring class field. BKO §3 uses K(g) for ray class fields, so this is now written H_(p^s).
- *AU.9/rubin-small-primes.* Rubin's computation (p.418) covers p≤1000, not 1001 as BKO Remark 2.3 says. The statement is corrected and the misquote recorded as E12.
- *AU.0/units-limit.* Added the constructor `units_mk`. Since O is Z_p-free of rank two, Ũ_∞=(lim U_n)⊗O, which the tensor-level Coates–Wiles definition uses.
- *AU.1/character-derivative.* A `uses` entry named the nonexistent node AU.4/xi-character-value; it now names AU.4/xi-values.

**Unit tests.** All 45 tests lacked the `kind` field required by PROTOCOL §12. Each now has one, and the reader shows them.

## Baseline citations

All five were read in the pinned trees and all are confirmed:

- `TauCeti.unitFiltration` (NumberTheory/LocalField/UnitFiltration/Basic.lean, lines 88–90).
- `WeierstrassCurve.formalPointHomAdicCompletion` (FormalGroup/Point/AdicCompletion.lean, lines 264–268). It requires a height-one prime of a Dedekind domain and an elliptic base change, which AU.6 supplies.
- `WeierstrassCurve.formalPointHomAdicCompletion_injective` (same file, lines 283–286).
- `WeierstrassCurve.range_formalPointHomAdicCompletion` (FormalGroup/Point/Range.lean, line 158).
- `PowerSeries.derivative` (Mathlib RingTheory/PowerSeries/Derivative.lean).

None was removed.

## Cross-roadmap suppliers

All 33 cross-roadmap node ids and 24 stage ids cited after the corrections resolve. I read each supplier node's statement against its use. Three suppliers were changed:

- **R21 is withdrawn.** The reduced-form census for the auxiliary-field certificate had been requested from Tau Ceti GlobalNumberFields Layer 3, which does not state it. The accepted node ComplexMultiplicationAndExplicitReciprocity:CM.1/quadratic-forms-dictionary supplies it, and is now a direct input of AU.4/auxiliary-quadratic. AU.4's stage requirement in the roadmap definition was updated to match.
- **R20 is rewired.** Elliptic local Tate duality had been cited from Tau Ceti EllipticCurves Layer 7, which lists local Tate duality only among the prerequisites of a stretch goal. The accepted node ArithmeticGaloisDuality:R02.4/abelian-variety-local-duality is now cited. R20 now asks R02.4 only for the compatibilities with restriction, corestriction, Kummer images and the O-action.
- **R6** now names Abbes–Ullmo Théorème A, which proves that the Manin constant of a strong Weil curve is prime to every p∤N. This is the free source for the requested p-unit statement.

**PadicMeasuresIwasawaAlgebras** was merged into TauCetiRoadmap main on 2026-10-14. R11–R13 now say what its upstream layers state:

- Layer 1: coefficient extension of the completed group algebra.
- Layer 4: Weierstrass theory and base change.
- Layer 5, §5.2: topological Nakayama.

They also say what remains. The packet cites three nodes of the atlas packet for this roadmap; that packet's latest review status is `needs_changes`. The three cited statements are standard and correct as used: the isotypic idempotent, O[[T]] regular local of dimension two, and the maximal ideal (ϖ,T).

The anchors at stages that do not cover the need are now explicit gaps:

- **G3** is the supersingular finite-field counts. They are cited through Tau Ceti EllipticCurves Layer 3, which stops at the Hasse bound; their owner is Elliptic curves, Part II, design #3398.
- **G4** is the early nonordinary CM inputs. They are anchored at AutomorphicPadicLFunctions L3, which excludes nonordinary CM; their owner is the continuation in design #3350.

The design had already described both as ownership anchors with restructure entries. The gaps make the closure status honest.

**G1 is confirmed as a real gap.** It is the vanishing of the norm inverse limit of formal points over the ramified layers. Hazewinkel's Theorem 1.3 and Rubin's Proposition 4.5(i) prove that universal norms vanish at the base Φ only, and both BKO §4 and the proof of Rubin's Lemma 5.1 rely on them for the whole limit (E15). G1 now records a lead. Θ_∞ and Ψ_∞ are deeply ramified (Fesenko §2.5 and Theorem 1.1). Coates–Greenberg's theory, not read here, should give the vanishing of H¹ of formal points over such fields, which is the Kummer-defect vanishing AU.2 needs.

**G2 is confirmed open.** It is Wiles's original proof and Kato's normalization. As a consistency check, BKO's twisted formula agrees with Wiles's law in the form (u,y)_m=[π^(−m−1)Tr(λ(y)δ_m(u))]v_m.

## Checks of the mathematics

- **Auxiliary-field table (p≤47).** Re-enumerated by machine. Every listed reduced form is correct, every class number matches, every D is ≡1 mod 8, and p is inert in each row. The analytic bound at p=53 is 52.76<53, and the ratio decreases from there on.
- **Recomputed identities.**
  - δ₁=(1+p⁻¹)δ, from the π-torsion sum; it agrees with Rubin Lemma 2.1(iv) after π=−p.
  - The parity bookkeeping: exact order p is plus, exact order p² is minus, units kill the opposite parity, points kill the same parity.
  - The weak count in BKO Lemma 5.2(ii), in all four classes mod 12. Among primes p≥31 only p=47 gives zero. The sharper count μ⌊(p−1)/12⌋ is valid, because non-exceptional supersingular j-invariants carry only traces ±2p over F_(p²).
  - The trace values Tr_(Ψ_2/Ψ_1)y_2=0 and Tr_(Ψ_3/Φ)y_3=py.
  - The Herbrand quotient p^(n−1), using |O/p|=p².
  - The Frobenius-twist argument that each x_s reduces to the origin: a connected subgroup of order p^s of a supersingular curve is ker F^s.
- **Statements in the suggested file.** I checked that each statement in it is true:
  - `augmentation_unit_generation` correctly assumes Λ-linearity rather than continuity, in line with E13.
  - The kernel examples match the parity conventions.

## Source issues

**E1–E10 are confirmed** at their locators, with three adjustments:

- E1 is backed by BKO's own Ê≅F claim on p.955.
- E4's locator was moved, as described above.
- E7 is reclassified from misprint to gap. It is an omitted step, as in the accepted extraction erratum.

**Added and confirmed by this review:**

- **E11 (gap, BKO Proposition 3.3(3)).** The proof's reduction omits the trivial character, which the case ε=− needs. That case follows from W(φ̄ν)=−1.
- **E12 (misprint, BKO Remark 2.3).** BKO quote Rubin's range as 1001; Rubin's p.418 says 1000.
- **E13 (error, Rubin Lemma 4.2).** Continuity alone does not send 𝔪X into pO. A counterexample is the T-coefficient on O[[T]]. Augmentation-linearity, which δ has, repairs the lemma.
- **E14 (misprint, BKO proof of Theorem 5.5(ii)).** The forward-lattice list, as above.
- **E15 (gap, BKO §4 and Rubin Lemma 5.1).** The inverse-limit vanishing over the ramified layers, recorded alongside G1.

E13 and E14 are also listed by the unreviewed AnticyclotomicLocalUnits design. E11, E12 and E15 were found by this review.

The packet now has `sourceVersions` for all six texts read.

## Library audit, scope and layer order

- **Duplication.** None was found in pinned or current Tau Ceti, or in current TauCetiRoadmap. The new roadmaps on main were listed and searched for Coleman, Lubin–Tate and anticyclotomic material. MassFormula is Serre's mass formula and is unrelated. The parent ColemanPowerSeries L0/L1 parts are strictly cyclotomic, so requests R4 and R5 to the parent are appropriate.
- **Layer order.** Correct and acyclic. AU.0–AU.3 come before AU.4, which is independent of AU.5. AU.5 and AU.6 lead to AU.7 and then AU.8. AU.4 and AU.8 lead to AU.9.
- **Scope.** Honest. The roadmap states the integral decomposition for every p≥5, including p=47 by the exceptional route. It does not rely on Rubin's numerical range.

## Suggested Lean file

Unchanged. `lean-check research/blueprint/suggested/ColemanPowerSeriesPartII.lean` at Tau Ceti f790474 / Mathlib 082e2d3 exits 0. The only warnings are the 17 expected `sorry` warnings, and there are no errors. The file follows the compact shape: light definitions over pinned carriers, conditional milestones and examples. Heavy carriers stay as README targets.

`python3 scripts/check_blueprint.py` with the pinned declaration index reports 0 errors and 0 warnings. `intake.py check-files` on the four files reports 0 problems.

## Questions for the orchestrator

1. **Duplicate roadmap.** DESIGN-AnticyclotomicLocalUnits (issue #1688, PR #10354, layers ALU.0–ALU.8) and DESIGN-ColemanPowerSeriesPartII were both queued from the same BKO route, and both plan the same Part II under the same title. Its review, #1717, is currently claimed by another worker. A `merge` entry has been added to this packet's `restructure`. Only one roadmap id should go live; this review does not prefer either on mathematical grounds. If this one is kept, nothing in the other design is missing here: the Abbes–Ullmo locator and its two Rubin/BKO source issues are now included.
2. **Missing owners.** G3 and G4 point at designs #3398 and #3350, which have not been written yet. When they publish stages, AU.5 and AU.4/early-cm-interface should be rewired to those nodes.
3. **PadicMeasuresIwasawaAlgebras.** Its atlas packet still shows review status `needs_changes`, although the roadmap is on TauCetiRoadmap main. Packets that cite its nodes may want to cite the upstream README sections instead.
