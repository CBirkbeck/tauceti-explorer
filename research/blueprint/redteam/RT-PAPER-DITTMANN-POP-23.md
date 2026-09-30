# Red team: the Dittmann–Pop extraction

Claude Code, session `cc-c2c06b`, 30 September 2026. Target: `PAPER-DITTMANN-POP-23`
(Dittmann–Pop, *Characterizing finitely generated fields by a single field axiom*, Ann. of
Math. 198 (2023)). The extraction was written by `cc-442dc5` on top of Codex checkpoints
and reviewed by `REV-PAPER-DITTMANN-POP-23`. Issue #4069. I did neither.

**Result: two findings, one medium and one low.** The extraction is very good. I read the
paper in full (arXiv v2, the authors' final version, with the recorded hash). The theorem
items reproduce its hypotheses faithfully, every library citation holds at the pins, and the
recorded source issues stand. Where my own reading found slips in the paper, the extraction
had already found them (E3, E4). What remains is structural: one owner choice, and one
understated library note.

## Finding 1 (medium): a basic commutative-algebra theorem is owned by a late automorphic layer

Proposition 5.1 needs Krull's theorem that a normal noetherian domain is the intersection of
its height-one localizations (Matsumura 11.5(ii)). Route 7 makes AutomorphicCongruences L4
its owner, together with two associated-prime lemmas. The Part II brief then imports it from
"the early algebraic portion" of that layer.

The atlas has no such portion. It links stages, and L4 requires AutomorphicCongruences L3
and KatoEulerSystems L4. On the production graph, the owners compare as follows:

| Candidate owner | ancestor stages | roadmaps among them |
| --- | --- | --- |
| AutomorphicCongruences L4 (current) | 846 | 120, including KatoEulerSystems |
| DeformationAndDerivedPatchingAlgebra R03.3 | 5 | 2 |
| AlgebraicModuliForArithmeticGeometry A0-extension | 5 | 2 |

So as routed, the definability of prime divisors in finitely generated fields would sit
downstream of most of the automorphic atlas. §15 asks instead for one plan, in the most
foundational owner. The theorem also has at least two other consumers:
PadicMeasuresIwasawaAlgebras L4, which states `A = ⋂ A_𝔭` as a hypothesis, and FiniteFlat
R07.1, which uses it in a reduction step.

The review moved the item off A0-extension "to avoid duplicate ownership", relying on L4's
audit. But an audit records what a layer needs; it does not make that layer the owner.

**Fix:** route all three items to R03.3, which already plans "associated-prime and support
lemmas" and dimension theory. Name R03.3 in the Part II brief, and leave L4 importing it. The
maintainer may pick A0-extension instead; either is shallow, but there should be one owner.

## Finding 2 (low): the fundamental equality is closer to the library than the note says

The item used in Lemma 3.6 is `function-field-fundamental-equality`, needed without
separability. Its note says the pin "supplies only the separable function-field wrapper".
Tau Ceti f790474 also has the separability-free fundamental identity at every place of a
finite chart of Dedekind models:
`TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank`, at
`AffineModel/Extension.lean:293`.

So the only missing input is the existence of finite Dedekind models in the inseparable case,
which the extraction already plans (`finite-normalization-generic`). The status `planned`
stays right, but the note should cite this theorem, so that no one plans the identity a second
time. Route 3's reason also contradicts itself: it says the equality "also belongs here", and
then that it is "not assigned to this source route".

## What I checked and found sound

- **The paper.** I re-derived the bookkeeping of:
  - Lemma 3.6 (the parameter counts in each characteristic);
  - Proposition 3.8 (Σ-units against Lemma 3.5);
  - Proposition 3.2(3): the dimension drop holds for every nontrivial valuation, and the
    residue field is C_{e+1} in characteristic p;
  - the corrected non-real cd₂ bound (E6);
  - Theorem 4.2(2)'s pole divisor.

  My only independent observations were the rank-e meaning of `W_T` in Lemma 5.3 and the
  choice of ζ. These are E3 and E4.
- **Theorem items.** 78 theorem items at the main locators, compared with the text. No
  hypothesis was dropped or strengthened.
- **Library.** All 38 cited declarations exist at the pins. I read the four function-field
  theorems at their lines, and their hypotheses match the items: exact constants, `n ≥ 2g`,
  `S ≠ univ`, `s ⊆ S`. For the Krull theorem, Mathlib has only the Dedekind case and the
  valuation-ring form, so the finding concerns ownership, not status.
- **Routes.**
  - The Pfister Part II is legitimate: QuadraticFormInvariants explicitly excludes
    general n-fold Pfister theory and Arason–Pfister.
  - No layer plans Gabber's prime-to-ℓ alterations, so the alterations Part II is right.
  - The definability Part II coalesces into the pending
    `DESIGN-LogicAndDefinabilityInNumberTheoryPartII`.
  - A0-extension plans "finite normalization under excellence", as route 3 assumes.
- **Source issues.** No recorded source issue affects a stated result, so §18 does not require
  `sourceVersions` here. This result records the versions I read anyway.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-DITTMANN-POP-23.result.json`:
  ok.
- No Lean was compiled. None belongs to this job.
