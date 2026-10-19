# Handoff: DESIGN-AdicCoefficientsAndComparisonsPartII

Job: design the new roadmap *Adic coefficients and comparison with schemes, Part II: prime-to-degree
alterations* (issue #3386), from the briefs of PAPER-TEMKIN-17 (30 items), PAPER-DITTMANN-POP-23
(odd-degree alteration) and PAPER-JANNSEN-16 (Theorem 2.11). Worker: Claude (Opus 5.5), session
claude-ddRwUd, 2026-10-19.

## Deliverables

- `research/blueprint/roadmaps/AdicCoefficientsAndComparisonsPartII.json` — roadmap definition, area
  `algebraicgeometry`, parent `AdicCoefficientsAndComparisons`, seven layers PA.0–PA.6.
- `research/blueprint/packets/AdicCoefficientsAndComparisonsPartII.json` — 63 nodes (17 definitions,
  5 constructions, 38 theorems, 1 comparison, 2 applications), 139 API items, 101 unit tests,
  21 planets, 32 baseline declarations; `check_blueprint.py` reports 0 errors and 0 warnings with the
  pinned declaration index. Status `complete`; every stage `planned`.
- `research/blueprint/readmes/AdicCoefficientsAndComparisonsPartII.md` — the roadmap document
  (about 28,600 words), rendered from the packet with hand-written front matter (summary, scope and
  ownership, conventions, how to read the build), per-layer dependency lists, supplier contracts,
  the open gap, the source issues and references; it agrees with the packet.
- `research/blueprint/suggested/AdicCoefficientsAndComparisonsPartII.lean` — 343 lines; **compiled**
  with `lean-check` at the pins (Mathlib 082e2d3, Tau Ceti f790474): exit 0, `sorry` the only warning.
  It types the PA.0 vocabulary (residue characteristics, maximal points, maximally dominating
  morphisms, `IsAlteration'`, generic degree, `IsPAlteration`, `IsSeparableAlteration`), pointed
  schemes, centred valuation rings and the restriction map of valuations with Temkin's openness
  statement on Tau Ceti's `ValuationSpectrum`, and decomposition groups; a closing comment lists
  every README target whose carriers are not at the pins.

## Layers

- PA.0 Degree-controlled alterations and universal resolvability (char(X), maximal domination,
  alterations of noetherian schemes, P-/ℓ′-/separable alterations, pseudo-projective morphisms and
  the non-separated Chow lemma, snc supports, universal P-resolvability with projective resolutions,
  finite-type flattening (Stacks 081R), resolvability in dimension ≤ 1, excellent dimension ≤ 2
  (Cossart–Jannsen–Saito), qe dimension ≤ 3 (Cossart–Piltant)).
- PA.1 Riemann–Zariski spaces of pointed schemes (Temkin §3.1).
- PA.2 Tame distillation for field extensions (Temkin §3.2, with the separable variant E6).
- PA.3 Tame distillation for alterations (Temkin §3.3; group actions, Galois coverings, wild primes).
- PA.4 Log regular pairs, very tame actions, log blow-ups, monoidal desingularization, Gabber's
  modification theorems (ILO VI, VIII, X §1, X 3.5.2).
- PA.5 Multipointed curves, Temkin's stable modification theorem (2010), log smoothness of
  semistable curves, resolution of relative curves (Temkin 4.2.1 / ILO X 3.4).
- PA.6 Temkin 4.3.1(i)–(iii), 1.2.5, 1.2.9, Remark 4.3.4; Gabber's ILO X 2.1 and 2.4; Jannsen 2.11
  form; Dittmann–Pop odd-degree alteration; de Jong 7.3 and 8.2.

## What is closed and what remains

Every stage is `planned`: each target is a node whose prerequisite chains end in Mathlib, Tau Ceti,
another roadmap's node or stage, or the recorded gap. Nothing is `closed` because of:

- **Gap G1 (open).** Universal resolvability of qe threefolds in the projective, embedded sense: the
  embedded part follows from Cossart–Jannsen–Saito Theorem 0.3 in the regular (hence excellent)
  resolved scheme, but Cossart–Piltant Theorem 1.1 is projective only over a chosen affine cover of a
  separated Y. This affects projectivity in Temkin 1.2.5/1.2.9 over three-dimensional bases only; the
  field and one-dimensional statements (ILO X 2.1, 2.4, Jannsen 2.11, Dittmann–Pop 3.4) do not depend
  on it. Recorded as source issue E11.
- The proofs of Gabber's modification theorem (ILO VIII §§2–5) and of Temkin's stable modification
  theorem (Temkin 2010 §§2–6) are planned at target level: their key theorems are nodes with proof
  sketches; a lemma-level pass would decompose VIII §§2–5 (functorial resolution of fans, inertia
  abelianization, the toric step) and Temkin 2010 §§2–6 (uniformization of one-dimensional valued
  field extensions).

## Requests to other roadmaps

- `CrystallineCohomology:CR.5:log-algebra`: the log structure O_X ∩ j_*O_U^× of a general closed
  subset of a reduced locally noetherian scheme (not only regular + snc), with the cusp non-example
  and Niziol's identification M = O_X ∩ j_*O_U^× for log regular fs log schemes (ILO VI 1.4). CR.5's
  accepted `divisorial-log` covers only the regular-snc case; the PAPER-TEMKIN-17 route already sent
  this item there.
- `SchemeAndStackFoundations:SF.0`, `SF.1`, `SF.4`, `tauceti:…/ModularCurves#0c…`,
  `tauceti:…/StableReduction#layer-3…`: consumption records only, naming the sections of the merged
  Tau Ceti SchemeAndStackFoundations README (TauCetiRoadmap main 69bd802) that are used (§§0.9,
  0.16–0.21, 1.17, 4.11–4.20). The atlas still lists SSF as SF.0–SF.6, so its stages are cited.

## Ownership decisions to pass on

- **Flattening of finite-type morphisms (Stacks 081R)** is planned here (PA.0/finite-type-flattening):
  upstream SchemeAndStackFoundations §4.12 states `flattening_by_blowup` only for proper morphisms
  over a noetherian integral base, and Temkin's Lemma 3.1.6 and ILO X 3.4 Step 2 need it for
  quasi-separated finite-type morphisms. If SchemeAndStackFoundations Part II (design issue #3361)
  takes it, re-point this node there.
- **Non-proper semistable multipointed curves and Temkin's stable modification theorem** are owned
  here (PA.5); StableReduction Layer 3 is the proper case they compare with.
- **Finite-group-action vocabulary on schemes** (inertia vs decomposition groups, tame, admissible,
  inertia specializing actions) is planned here in PA.3; SSF §1.17 supplies only the projective
  quotient.
- The valued-field theory of Temkin §2 is not planned here: it is LocalFieldsRamificationPartII
  (accepted packet), whose GF.0, GF.2, GF.3 and GF.6 nodes are cited.

## Consumers to re-point

- `HigherLocalFieldsAndHigherClassFieldTheory` gap G13 (Jannsen 2.11): the supplier is now
  `AdicCoefficientsAndComparisonsPartII:PA.6/prime-to-ell-variety-alteration`.
- `LogicAndDefinabilityInNumberTheoryPartII` gap G-ALT (Dittmann–Pop Proposition 3.4): the supplier
  is now `AdicCoefficientsAndComparisonsPartII:PA.6/odd-degree-model-alteration`.

## Source issues

E1–E10 are the Temkin issues of the PAPER-TEMKIN-17 extraction, rechecked at their locators and
carried with this packet's ids; the nodes use the corrected statements (E1: Theorem 4.2.1 is stated
under char(S) ⊆ P; E2: corrected proof of Lemma 3.3.7; E5: projective universal resolvability and the
Cartier-boundary reduction, now made explicit in PA.6/universal-p-resolvability-inheritance; E6:
separable distillation variants; E7: minimal-polynomial repair in Lemma 3.2.10; E8: only the forward
implication of §3.1.7). New: E11 (gap, projectivity of the Cossart–Piltant input, = G1) and E12 (gap,
ILO X 3.5 Step 3 needs Z to be a Cartier support before the sub-divisor argument; repaired by
blowing up Z).

## Sources read

Temkin, Ann. of Math. 186 (2017), §§1, 3, 4 in full and §2 statements (Annals PDF, SHA-256
1f4ac06f…); ILO, *Travaux de Gabber*, arXiv:1207.3648v1 (SHA-256 18a6193d…): Exposé X in full,
Exposé VI §§1–3, Exposé VIII §1 and §§3.3–3.4; Temkin, Stable modification of relative curves,
arXiv:0707.3953v3 §1; de Jong 1996 §§7–8 (Numdam); Cossart–Piltant arXiv:1412.0868v2 §1;
Cossart–Jannsen–Saito arXiv:0905.2191v2 §0; Dittmann–Pop arXiv:2012.01307v2 Proposition 3.4;
Jannsen, Ann. of Math. 183 (2016) Theorem 2.11.

Not read: Kato, *Toric singularities* (Amer. J. Math. 1994) and Niziol (J. Algebraic Geom. 2006),
consumed through CR.5 and ILO VI/VIII; Lipman (Ann. of Math. 1978), not needed because dimension ≤ 2
is handled through Cossart–Jannsen–Saito (excellent) and Cossart–Piltant (qe); the published
Astérisque and J. Algebra versions (the arXiv versions were used and their page numbers are cited).
