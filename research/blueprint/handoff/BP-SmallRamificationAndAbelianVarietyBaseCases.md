# Handoff: BP-SmallRamificationAndAbelianVarietyBaseCases (second checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #995. The first checkpoint (R25.1, R25.2) merged in #3812. This checkpoint adds R25.3.

## What this checkpoint delivers

- **Packet** `research/blueprint/packets/SmallRamificationAndAbelianVarietyBaseCases.json`, status `partial`:
  - 28 nodes: 4 definitions, 15 lemmas and 9 theorems;
  - 27 API items, 17 unit tests, 10 planets;
  - 40 baseline declarations, 15 requests, 2 source issues;
  - `scripts/check_blueprint.py` reports 0 errors and 0 warnings against the pinned declaration index.
- **Roadmap document** `research/blueprint/readmes/SmallRamificationAndAbelianVarietyBaseCases.md`, regenerated from the packet with the introduction revised for R25.3.
- **Suggested Lean file** `research/blueprint/suggested/SmallRamificationAndAbelianVarietyBaseCases.lean`, extended with the Fontaine section.

The accepted restructuring RS-06 was followed: R25.3 is kept whole, and it imports R01.1 and R01.4 through the links recorded there.

## Closed

**R25.2** (from the first checkpoint). Tate's theorem at p = 2 and Serre's mod-3 theorem (DP23 Theorem 1.1).

**R25.3 (new).** Fontaine's theorem: no abelian variety of positive dimension over ℚ has good reduction at every prime. The plan uses the prime 2 only.

1. R25.1/fontaine-torsion-field-bound: Fontaine's ramification theorem (imported from R07.6) gives rd_L < 4 for the field L of points of a finite flat group scheme over ℤ killed by 2.
2. R25.3/division-fields-of-two-group-schemes-over-integers: such an L has 2-power degree. Minkowski's bound gives n ≤ 11, and odd abelian quotients are unramified by the local character lemma. The only other candidates are S₃ and D₁₀. For those, the quadratic subfield's prime above 2 has residue field 𝔽₂, so L is unramified over it, and then rd_L = rd_k ≤ 2√2 < 3 contradicts Minkowski.
3. R25.3/simple-two-group-schemes-over-integers: the simple objects are ℤ/2ℤ and μ₂ (Oort–Tate, requested from R07.1).
4. R25.3/extensions-of-mu-two-by-z-mod-two-over-integers: Ext¹_ℤ(μ₂, ℤ/2ℤ) = 0. This is Schoof's Proposition 4.1 argument without a bad prime. The quadratic fields unramified outside 2 are all ramified at 2, so the restriction to ℚ₂ is injective.
5. R25.3/multiplicative-constant-filtration: every finite flat 2-group scheme over ℤ is an extension of a constant by a diagonalizable one; π₁(Spec ℤ) = 1 by Minkowski.
6. R25.3/fontaine-theorem: the point count of Schoof's Proposition 3.1 (Fontaine's §3.4.3) gives #𝒜(𝔽_q)² ≥ 2^{2gn} for all n, so g = 0.

No Odlyzko bound and no class field theory is needed in R25.3.

## Remaining

- **R25.1** (coverage `partial`): the global rows Schoof needs for R25.4.
  - Degree bounds for totally complex fields: rd < 10.39 ⇒ n < 24; rd < 12 ⇒ n < 32; rd < 20 ⇒ n < 480; rd < 19.01 ⇒ n < 270; rd < 14.42 ⇒ n < 60.
  - Hilbert class field degree bounds at root discriminants 13.18, 16.82, 13.75 and 10.198.
  - With the kernel of R25.1/odlyzko-kernel the row at rd 12 gives only n ≤ 32. Schoof's n < 32 needs a sharper kernel (Tartar's) or Odlyzko's own 1976 tables (odlyzko/unpublished on his UMN page), re-certified.
- **R25.4** (coverage `not_read`; Schoof05 §§1–6 read, plan not written). The continuation should plan:
  - the categories C and D over ℤ[1/l];
  - Propositions 3.1–3.2, reusing R25.3's filtration and point count over ℤ[1/l, ζ_l];
  - Proposition 4.1 and Corollary 4.2 for general (l, p), with the corrected class-group step (source issue E2);
  - Propositions 5.1–5.2;
  - the five cases (l, p) = (2, 3), (3, 2), (5, 2), (7, 3), (13, 2) with their class-number and unit computations.
  The negative tests are J₀(11) at l = 11 and non-semistable reduction.
- **R25.5 and R25.6** (coverage `not_read`).

## Requests added in this checkpoint

- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6: Fontaine's bound in the δ normalisation.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1:
  - closures of generic subgroups;
  - Oort–Tate over ℤ[1/N];
  - the gluing equivalence and its Hom–Ext sequence;
  - the connected–étale splitting over ℤ_p;
  - étale group schemes as Galois modules.
- AbelianSchemesAndArithmeticModuli A3: torsion, quotients, the Weil pairing and isogeny degrees.
- AbelianSchemesAndArithmeticModuli A2: the dual and a polarization.
- AbelianSchemesAndArithmeticModuli A6: Frobenius and #A(𝔽_q) = deg(1 − F).
- NeronModelsAndSemistableAbelianVarieties R11.1: good reduction everywhere gives an abelian scheme over ℤ.

The first checkpoint's requests (R01.1, R01.2, R01.4, AN.3, and Tau Ceti LocalFieldsRamification, ClassFieldTheory and NumberFieldArithmetic) stand. The local character lemma was generalised to finite extensions of ℚ_p with residue field 𝔽_q, which R25.3 uses for quadratic fields.

## Source issues

- **E1** (misprint, new): Schoof05 §6, case l = 2, p = 3 prints 2 · 3^{3/2} = 10.49…. The value is 10.392…. Harmless.
- **E2** (gap, published correction): Schoof05 Proposition 4.1 cites Herbrand's theorem for the ω²-eigenspace of the class group. Herbrand gives ω^{−1}, and the ω² case needs Leopoldt's Spiegelungssatz, as Schoof's own errata note says. This does not affect R25.3 (p = 2 over ℤ).

## Lean

The suggested file was not compiled. No pinned build is available to this worker, and the shared-machine rules forbid Lake builds. Imported objects are placeholders named after their owners' planned declarations. The finite flat group schemes are Tau Ceti's `FiniteLocallyFreeCommAffineGroupSchemeCat` over ℤ.

## Sources

Read in this checkpoint (URLs and SHA-256 in the packet):

- Schoof, Compositio Math. 141 (2005), 847–868, author copy: §§1–6. His errata note for the article was also read.
- Brumer–Kramer, arXiv:math/0011270v1: §1.

Read in the first checkpoint: DP23, Khare, Moon–Taguchi, Jones, Ghitza–Yamauchi, Odlyzko 1990, Fesenko–Vostokov.

Not accessible:

- Fontaine, *Il n'y a pas de variété abélienne sur Z*, Invent. Math. 81 (1985). The Springer copy is behind a login.
- Tate 1994 (Contemp. Math. 174), behind a login.
- Serre, Œuvres III, p. 710.

The R25.3 plan reconstructs Fontaine's argument from Schoof's Proposition 3.1, which Schoof says follows Fontaine's §3.4.3, and from Brumer–Kramer's summary. Fontaine's own choice of primes and his Odlyzko rows could not be compared. The plan needs only p = 2 and Minkowski's bound; this should be checked against Fontaine's paper when it can be consulted.
