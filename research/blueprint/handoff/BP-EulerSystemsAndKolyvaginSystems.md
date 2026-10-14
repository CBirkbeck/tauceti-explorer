# BP-EulerSystemsAndKolyvaginSystems: whole-roadmap plan

Issue [#9412](https://github.com/CBirkbeck/tauceti-explorer/issues/9412).
Agent: Claude (Opus 5.5), session `claude-Tq5V20`, branch `claude-Tq5V20-bp-euler-systems`.
The bot confirmed the claim in
[comment 6159481306](https://github.com/CBirkbeck/tauceti-explorer/issues/9412#issuecomment-6159481306).
This session wrote none of the earlier part packets or their reviews.

This submission is a complete planning pass, not a checkpoint. The packet status is `complete`.
All nine layers ES.0–ES.8 are `planned`; none is `closed`. Every implementation status stays
`unchecked`.

## Delivered

- [Packet](../packets/EulerSystemsAndKolyvaginSystems.json), `part: null`, scope ES.0–ES.8. It
  imports the 124 targets of the two part packets by node id and adds 21 targets of its own.
  - Imported: ES.0–ES.7 part, 89 targets, third revision under review; ES.8 part, 35 targets,
    accepted.
  - The checker forbids duplicate node ids across a roadmap's packets, so the imported targets stay
    in the parts. They are listed in `importedNodes`, and `assembly.imports` pins both files by
    SHA-256 with their review status.
  - `assembly.importedPrerequisiteAdditions` records five imported targets whose proof sketches now
    have their own nodes. `assembly.importedNodeCorrections` reconciles two clauses of an imported
    target with confirmed source corrections (below).
  - `routedItemCoverage` maps every routed extraction item of the four added sources to the targets
    that state it.
- [Reader](../readmes/EulerSystemsAndKolyvaginSystems.md), regenerated for the whole roadmap: 145
  targets with statement, hypotheses, proof sketch, uses, API table, unit tests, acceptance,
  prerequisites and sources, plus a new introduction, supplier contracts, gaps, source mistakes,
  restructuring proposals, routed-item coverage and application handoffs.
  - The assembly reader it replaces quoted its sources verbatim 262 times, against the standing rule;
    the new reader quotes nothing.
- [Suggested Lean file](../suggested/EulerSystemsAndKolyvaginSystems.lean), rewritten to the
  2026-10-12 shape: 493 lines.
  - Real-bodied light definitions: the Euler polynomial `det(1 − f x)`, Kolyvagin's derivative and
    lifted norm in ℤ[G], the finite–singular quotient polynomial, the exponent and order maps, the
    abundance exponent 𝔣, and the error constant C_α.
  - Statable milestones: the lifted telescoping identity, the scaled inverse of bounded-image
    matrices over R/ϖⁿ, and the vanishing of H¹ of Rubin's induced module.
  - `#check` lines pin Tau Ceti's `coind` and `explicitShapiro1`.
  - Real proofs where cheap: the finite–singular quotient spec and its example, `expAt_zero`,
    `ordAt_zero`, the `𝔣` values, the `C_α` examples, the derivative-operator examples and the
    multiplicative-group congruence identity.
  - A closing comment lists every one of the 145 targets with its kind and proposed declaration
    names; targets not stated in Lean are README targets.
  - It replaces the 5,625-line assembly prototype. That file exceeded the 5,000-line limit and
    defined data by `sorry`; `check_sorry_data` flags `charIdeal` and `IwasawaHypT.of_rank_one`.

## The 21 added targets

| Layer | Target | Source |
| --- | --- | --- |
| ES.1 | `twist-error-constants` (definition) | CGLS §3.2 (3.2)–(3.3), Lemmas 3.3.3–3.3.4, Remark 3.3.5; CGS §6.3; KY Lemma 3.0.3 |
| ES.1 | `error-tolerant-chebotarev` (planet) | CGLS Proposition 3.3.6, Corollary 3.3.7; CGS Proposition 6.3.1 |
| ES.1 | `residual-two-class-detection` | Zhang 2014, §8.1, Lemmas 8.1–8.2 |
| ES.1 | `abundant-tuple-existence` | LTXZZ Proposition 2.6.6, with the span hypothesis of PAPER-LIU-ETAL-22/E1, E23 |
| ES.2 | `ring-class-anticyclotomic-euler-system` (definition, planet) | Castella–Hsieh §7.1–7.2, Definition 7.1 |
| ES.3 | `ring-class-derivative-classes` (construction) | Castella–Hsieh §7.2, Definition 7.2, (K1)–(K3) |
| ES.3 | `derivative-classes-unramified` | Rubin IV Corollary 6.2, Lemma 6.3, Corollary 6.5 |
| ES.3 | `local-lifts` | Rubin IV Definition 6.6, Lemma 6.7, Proposition 6.8, proof of Theorem 5.1 |
| ES.3 | `key-relation` | Rubin IV identity (9), Lemmas 7.1, 7.3, proof of Theorem 5.4 |
| ES.3 | `congruence-units-example` | Rubin IV Example 8.2, II Remark 1.5 |
| ES.3 | `rigidity-variant-derivative-classes` | Rubin IX §1, pp. 133–136 |
| ES.4 | `self-dual-module-induction` | CGLS Lemmas 3.3.9–3.3.10, Proposition 3.3.11 (E28, E43) |
| ES.4 | `rank-one-from-nonzero-class` | CGLS Theorem 3.3.8 (E11, E25, E26) |
| ES.4 | `uniform-near-trivial-bound` (planet) | CGS Theorem 6.1.1; BCGS Theorem 1.3.1; KY Theorem 3.0.2 |
| ES.4 | `rational-anticyclotomic-descent` | Castella–Hsieh Theorems 7.3, 7.9, §7.5 |
| ES.5 | `self-dual-eigenspace-localisation` | Zanarella Lemma 2.2.10, Corollary 2.2.11 |
| ES.5 | `self-dual-core-vertex-rigidity` | Zanarella Proposition 2.2.8 to Proposition 2.2.14 |
| ES.5 | `self-dual-divisibility-profile` (definition) | Zanarella Lemma 2.3.1 to Proposition 2.3.4; BCGS §2.2.1, Proposition 2.2.1, Lemma 2.2.4 |
| ES.5 | `self-dual-structure-theorem` (planet) | Zanarella Theorem 2.3.6; BCGS Theorem 2.2.2 |
| ES.8 | `self-dual-lambda-primitivity-equality` | Zanarella Definitions 2.4.2–2.4.3, Proposition 2.4.4, Theorem 2.4.5 |
| ES.8 | `augmentation-prime-divisibility` | CGS Theorem 6.5.1; KY Theorem 3.0.5 |

After this pass the roadmap has 145 targets: 41 definitions, 19 constructions, 65 theorems,
10 lemmas, 3 comparisons and 7 applications. It carries 424 API items, 216 unit tests and 45 planets,
at most six per layer across the packets.

## The added sources

The issue names Dasgupta–Kakde, Liu–Tian–Xiao–Zhang–Zhu, Castella–Grossi–Lee–Skinner and Kolyvagin's
method. Their reviewed extractions route 110 items here: 7 from DK, 38 from LTXZZ, 7 from CGLS and 58
from Kolyvagin. Each one maps to at least one target in `routedItemCoverage`; the builder asserts that
the map is exact.

- **DK §1.2.** Already planned by the ES.0 part as `ES.6/rubin-lattice` and `ES.7/rubin-brumer-stark`.
  Theorem 1.6 stays with IntegralIwasawaTheory I.7.
- **LTXZZ.** The part planned exponents, reducibility depth, saturation, abundance and corrected
  localisation. This pass adds the existence theorem (Proposition 2.6.6) under the corrected span
  hypothesis.
- **CGLS.** This pass makes the error constants, Chebotarev selection with errors, module lemmas and
  rank-one theorem into targets; the part had folded them into `howard-descent-with-errors`.
- **Kolyvagin / Rubin.** Rubin IV §§6–8 and IX §1, which the part left in proof sketches or at lemma
  level, are now targets. Lemma IV.2.5 and Lemmas IV.4.6–IV.4.7 remain lemma-level refinements of
  imported targets.

## Requests from consuming roadmaps handled here

- **HeegnerPointEulerSystems → ES.5.** The self-dual primitivity equality, with Zanarella's d(κ):
  `self-dual-divisibility-profile` and `self-dual-structure-theorem`.
- **HeegnerPointEulerSystems → ES.1.** Zhang's Lemmas 8.1–8.2 in generic residual form:
  `residual-two-class-detection`.
- **HeegnerPointEulerSystems HE.7s → ES.4.** BCGS Proposition 2.2.1, Lemma 2.2.4, Theorems 2.2.2
  and 1.3.1: `self-dual-divisibility-profile`, `self-dual-structure-theorem` and
  `uniform-near-trivial-bound`.
- **GeneralizedHeegnerCycles → ES.5.** Castella–Hsieh §7 descent:
  `ring-class-anticyclotomic-euler-system`, `ring-class-derivative-classes` and
  `rational-anticyclotomic-descent`. The descent theorem sits in ES.4, upstream of GH.5 already.
- **RankZeroOneBSD BSD.7 → ES.4 and ES.8.** Uniform near-trivial bounds and divisibility at the
  augmentation prime: `uniform-near-trivial-bound` and `augmentation-prime-divisibility`.
- **Not planned here:**
  - The BSD.7 request to ES.2 for the Kings–Loeffler–Zerbes Beilinson–Flach classes and their
    reciprocity laws: constructing arithmetic classes is outside this roadmap (restructure
    proposal 6).
  - The HeegnerPointEulerSystems request for Kolyvagin's classical square-index Theorem A: its
    proof is not publicly available (gap 3).

## Red-team findings

- **RT-AREA-iwasawa-1/10.** ES.5 owns the self-dual DVR theory and ES.8 the Λ-adic theory; the
  four ES.5 and two ES.8 targets added here extend that single owner. Proposal 3 restates the edges
  ES.5 → GH.5, ES.8 → GH.5 and HE.6 → HE.8.
- **RT-AREA-iwasawa-1/35.** No ES.8 target, imported or new, has a prerequisite in ES.6 or ES.7; the
  combined graph was traversed to check this. Proposal 1 restates the split into a rank-one ES.8 on
  the edge ES.5 → ES.8 and a higher-rank ES.8h.
- **RT-AREA-iwasawa-1/36.** Proposal 2 restates the edges ES.2 → ECMC L0, ES.2 → KES L2 and
  ES.4, ES.8 → KES L4.

The atlas cannot take these edges from a packet, so they stay restructuring proposals. They
consolidate the identical proposals of the part packets.

## Reconciliations and observations on the ES.0 part, for its reviewer

- `ES.1/selmer-field-saturation` states two clauses as printed in LTXZZ, and both carry confirmed
  corrections:
  - (a) needs S free over O_λ/λ^{m−m′}, not only O_λ/λ^m. This is PAPER-LIU-ETAL-22/E22;
    abundant-tuple-existence uses the shifted form.
  - (b) needs Hom over 𝔽_ℓ[Γ_F], equivalently all Frobenius twists, not over O_λ/λ[Γ_F]. This is
    E21: as printed the clause is false when O_λ/λ ≠ 𝔽_ℓ.

  The whole-roadmap packet records both in `assembly.importedNodeCorrections`, and the reader prints
  them under the target.
- Six prerequisites in the ES.0 part point from an earlier layer to a later one:
  - `ES.0/hypotheses-mr2004` ← `ES.1/kolyvagin-primes`;
  - `ES.0/hypotheses-mr2016` ← `ES.1/kolyvagin-primes`, `ES.1/conductor-ideal`;
  - `ES.0/non-example-inadmissible` ← `ES.4/rubin-hypotheses`;
  - `ES.1/rubin-prime-selection` ← `ES.4/rubin-hypotheses`, `ES.3/derivative-class`.

  The combined graph is acyclic, but packaging must either move these targets or reorder the layers.

## Source mistakes

`EulerSystemsAndKolyvaginSystems/E901` is a misprint in Rubin's 1999 draft, Example IV.8.2: the
denominator should be [K(q) : K(1)], not [K(q) : K]. It is already corrected in the published
Example 4.8.2 on p. 103, which I checked from the page image. The new targets rely on corrections
that the reviewed extractions already record: PAPER-LIU-ETAL-22 E1, E21–E23; PAPER-CASTELLA-ETAL-22
E7, E8, E11, E25–E28, E31, E43. They are cited by number and not duplicated. Castella–Hsieh's own
footnote 5 corrects the Lemma 7.5 step behind Proposition 7.8; the descent theorem does not depend on
that step.

## Validation

- `python3 scripts/check_blueprint.py` with the pinned declaration index (Mathlib 082e2d3,
  Tau Ceti f790474): 0 errors, 0 warnings.
- Combined graph of the parts, the 21 new targets and the prerequisite additions: no missing
  references and no cycles.
- `lean-check research/blueprint/suggested/EulerSystemsAndKolyvaginSystems.lean`: exit 0. The only
  warnings are 8 "declaration uses `sorry`"; the two `#check` lines give info messages.
  `scripts/check_sorry_data.py` passes.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: 0 problems.
- Current upstream was read for duplication: TauCetiRoadmap 0d144d0 and Tau Ceti a91d3aa.
  ProfiniteCohomology Layer 7 (coinduced modules, Shapiro) and Layer 11 (cohomological dimension)
  and EllipticCurves Layer 7 (Selmer structures on discrete modules) are cited, not replanned. The
  current library has no Euler- or Kolyvagin-system code.

## Sources read, 2026-10-14

| Source | Read | Fingerprint |
| --- | --- | --- |
| Rubin 1999 draft | IV §§5–8, IX §1, II Remark 1.5 | `de47655d…` |
| Rubin 2000 published | Example 4.8.2 and §4.6 opening, from page images | `1b022973…` |
| CGLS arXiv v2 | §§3.1–3.4 | `7cd995e0…` |
| CGS arXiv 2303.04373v2 | §6 | `5046d757…` |
| BCGS arXiv 2312.09301v2 | §1.3, §2.2; p. 17 from the page image | `e575367a…` |
| Keller–Yin arXiv 2402.12781v2 | §3 opening | `bb64820b…` |
| Castella–Hsieh author's version | Hypothesis (H), §4.1, §7; p. 30 from the page image | `5c85ea3c…` |
| Zanarella arXiv 1908.09197v1 | §§1.1, 2.1–2.4 | `00d91f8d…` |
| Zhang 2014, cleared copy | notations (xii), §8.1–8.2 | — |
| LTXZZ published, NSF PAR | §2.6 | `dd821abd…` |

Not read:

- Kolyvagin 1990 and Kolyvagin 1991: not public (gaps 1 and 3).
- Nekovář 1992: its relations are taken as Castella–Hsieh state them (gap 2).
- McCallum 1991: cited through Zhang.
- Howard Lemma 1.6.2: through Zanarella's proof.

The proof of CGS Theorem 6.1.1 was read in outline (gap 4). No passage of any source is in the
repository.

## For the reviewer and follow-ups

- Check the 21 new targets at their locators, the routed-item map, and the two reconciliation
  clauses.
- The open refinements per layer are in the packet's coverage `remaining` lists and at the end of
  each layer in the reader.
- The three supplier requests of this packet (Chebotarev Layer 10, ProfiniteCohomology Layer 11,
  ClassFieldTheory Layer 13) come on top of the parts' requests.
- If the third review of the ES.0 part changes an imported target, this packet follows it by id; the
  reader would then need regenerating.
- No scratch file is needed to resume.
