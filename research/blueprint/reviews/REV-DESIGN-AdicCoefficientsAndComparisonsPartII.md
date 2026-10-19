# Independent review: Adic coefficients and comparison with schemes, Part II — prime-to-degree alterations

**Job:** REV-DESIGN-AdicCoefficientsAndComparisonsPartII · **Issue:** #3486
**Reviewer:** Claude (Opus 5.5), session claude-EzBIka · **Date:** 2026-10-19
**Verdict:** **accepted**, after corrections made in place. This session did no part of the design under review (DESIGN-AdicCoefficientsAndComparisonsPartII, issue #3386, session claude-ddRwUd, PR #10601).

Files reviewed and corrected: the roadmap definition, the blueprint packet, the reader document and the suggested Lean file of `AdicCoefficientsAndComparisonsPartII`.

## Counts

- 63 nodes (17 definitions, 5 constructions, 38 theorems, 1 comparison, 2 applications): **45 verified, 18 corrected, 0 added, 0 unverifiable.**
- 140 API items (one added), 101 unit tests, 21 planets (at most four per layer), 32 baseline declarations (all confirmed, none removed or replaced), 6 requests, 1 gap (G1, kept), 13 source issues (E1–E12 confirmed, E13 added).
- Every stage stays `planned`; the packet stays `complete`. `scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings. `research/blueprint/intake.py check-files` on the four files: 0 problems.

## Sources read

All at the locators the nodes cite, with the SHA-256 of each downloaded file compared with the value the packet records (all eight match):

- Temkin, *Tame distillation and desingularization by p-alterations*, Ann. of Math. 186 (2017): read in full, published text.
- Illusie–Laszlo–Orgogozo (eds.), *Travaux de Gabber*, arXiv:1207.3648v1: Exposé X in full; Exposé VI §§1–3; Exposé VIII §1 and §§3.3.7–3.4.9.
- Temkin, *Stable modification of relative curves*, arXiv:0707.3953v3: §1 and §3.2.
- de Jong 1996 (Numdam): §7 (Theorem 7.3 and its proof) and §8 (Theorem 8.2 and its proof).
- Cossart–Piltant, arXiv:1412.0868v2: Theorem 1.1, Corollaries 1.2–1.3, Remark 1.4.
- Cossart–Jannsen–Saito, arXiv:0905.2191v2: Theorems 0.1–0.3 and Corollary 0.4.
- Dittmann–Pop, arXiv:2012.01307v2: Proposition 3.4 and its proof; Jannsen, Ann. of Math. 183 (2016): Theorem 2.11 and its use.
- Stacks project tags 081R, 0815, 052A, 0AVK, 0C45, 0BI4 and 05K0.

No cleared book was needed.

## Corrections

Mathematical errors:

1. **PA.0/pseudo-projective.** The proof step said that a local isomorphism X → X̄ with X separated is an open immersion. That is false: two disjoint copies of an open subscheme of X̄ map to X̄ by a separated local isomorphism. The argument now uses Zariski's main theorem (Stacks 05K0). A separated local isomorphism is quasi-finite, so it is open in a scheme finite over X̄, and finite followed by projective is projective. The definition and the tests were right.
2. **PA.0/finite-type-flattening.** The statement claimed a module version for f that is only of finite type and quasi-separated. Stacks 081R covers only the scheme itself, and 0815, the module version, needs X locally of finite presentation. The statement now gives exactly these two results. Every consumer (Temkin Lemma 3.1.6 and Theorem 3.3.6, ILO X 3.4 Steps 2 and 7) uses only the scheme version.
3. **PA.0/maximally-dominating.** The density step claimed that a subset of a noetherian space is dense exactly when it contains every maximal point. That fails for arbitrary subsets; it holds for subsets stable under generization, which the generic fibre is.
4. **PA.3/wild-primes-set.** The bound p ≤ deg f was justified by saying that [k(Y) : k(X)] is divisible by p. In fact only the local henselian degree at the wild point is divisible by p. Corrected; the bound itself is unchanged.
5. **PA.4/gabber-modification-absolute.** An acceptance item said that in ILO VIII 1.2(a) the blown-up plane "is not log smooth over k". It is the modification f that fails to be log smooth; (X′, Z′) is smooth with a smooth boundary, hence log smooth over k.
6. **PA.2/separable-field-tame-distillation.** The supplier GF.3/maximal-ramification-extension constructs maximal extensions for the six ramification properties, not a maximal separable P-extension. It is replaced by GF.0/maximal-p-extension, and the proof now spells out the Zorn argument inside K^s and why the result is separably P-closed.

Precision and honesty:

7. **PA.0/resolvability-excellent-dimension-two and -dimension-three.** The embedded step went through CJS Theorem 0.3, extended to boundary components (Theorem 5.9), after a preliminary blow-up. It now cites CJS Corollary 0.4, which states exactly what is needed: a projective modification after which the reduced preimage of a closed subscheme of dimension ≤ 2 of a regular excellent scheme is snc. The dimension-three statement now says what is established: the proper version for separated S, and projectivity when Y is affine (Cossart–Piltant Remark 1.4). The rest is gap G1. G1 and E11 now cite Corollary 0.4.
8. **PA.6/char-x-altered-desingularization and PA.6/char-s-desingularization-of-morphisms.** Their hypotheses had added "separated" silently. The statements now keep Temkin's hypotheses and state where Cossart–Piltant needs separatedness and where projectivity rests on G1. The char(X) proof gains the reduction to irreducible components that maximal domination needs; Temkin passes over this step. The char(S) proof now runs the §4.3.2 shrinking of the base threefold before applying inheritance, and has PA.6/char-x-altered-desingularization as a new prerequisite. This creates no cycle.
9. **PA.5/stable-modification-equivariance.** The statement listed Aut(S′/S) separately from Aut_S(C, D) × Aut_S(S′), of which it is already a factor. It now names the product action. Temkin 2010, Corollary 1.6, prints "Aut(S)" at this point, which is unclear. The statement follows the unambiguous part, and this is not recorded as a source mistake.
10. **PA.6/de-jong-galois-alteration and PA.6/de-jong-arithmetic-semistable.** The proof of de Jong's Theorem 7.3 runs 7.5–7.16. The cited "7.18" is an OCR misreading of 7.12. The proof of Theorem 8.2 runs 8.3–8.8, not 8.3–8.4. Both locators are corrected.
11. **Tests and acceptance items made definite or accurate.**
    - The `satLogBlowup_differs` test now names a specific ideal of the A_1 monoid and its non-normal chart k[u, v, s]/(v² − u²s), which I recomputed.
    - The doubled-origin test of PA.3/finite-group-action gains char k ≠ 2, as in ILO X 3.1.1.
    - The acceptance item of PA.0/residue-characteristics no longer attributes char(Spec Z) to Temkin's printed examples.
    - The A_1 acceptance item of monoidal desingularization cites ILO VIII 1.2(b).
    - The local-forms proof uses notation without ranks; see E13.
12. **PA.0/residue-characteristics API.** Added `residueChars_eq_empty_iff` (char(X) = ∅ exactly for Q-schemes). The char-zero acceptance items of PA.0 and PA.6 use this fact; it is also added to the suggested file.
13. **`AffineInvariantQuotient`.** It is in Tau Ceti main but not at the pinned f790474. This is now said in PA.3/finite-group-action, in the ModularCurves request and in the reader's front matter.

## Source issues

- **E1–E12 confirmed.** Each was rechecked at its locator, and each verdict records the reason. Three were rewritten in our own words, because their fields paraphrased the source's own sentences with substitutions:
  - E2's correction;
  - E3's correction;
  - E5's description of what is printed.
- **E1** is a genuine gap in the proof of Temkin's Theorem 4.2.1 under the printed hypothesis char(X) ⊆ P. The packet states the theorem under char(S) ⊆ P, which is how Theorem 4.3.1 uses it.
- **E5 and E12** are genuine. ILO X derives (i) from (ii) in one sentence, and Step 3 of the proof of 3.5 assumes that b⁻¹(Z) is a divisor. Blowing up Z first repairs both, as PA.6/universal-p-resolvability-inheritance and PA.6/morphism-p-desingularization now do.
- **E11** is genuine. Cossart–Piltant give projectivity only over a prescribed affine cover, or globally for affine X. Neither Temkin nor ILO addresses global projectivity.
- **E13 (new, misprint).** In the proof of ILO X 2.4 (§2.6, Step 3, p. 155), the ranks of the unit part and of the sharp part of the chart monoid are assigned in two inconsistent ways within one sentence. The argument is unaffected.

## Baseline

All 32 declarations exist under their names at Mathlib 082e2d3 and Tau Ceti f790474. I read each statement in the build's source tree.

- The nontrivial hypotheses fit their uses:
  - `isOpenMap_of_generalizingMap` needs local finite presentation, which flattening provides.
  - `Scheme.Hom.isConstructible_image` needs a quasi-compact, locally finitely presented map to a qcqs scheme.
  - `Algebra.IsEtaleAt.exists_isStandardEtale` needs finite presentation, which étale algebras have.
  - `compactSpace_withConstructibleTopology` needs a spectral space.
- Tau Ceti's `ValuationSpectrum`, `comap`, `continuous_comap` and `compactSpace_patchTopology` have the stated content.
- No citation was removed or replaced.

## Closure, suppliers and ownership

- **Supplier nodes.** I read every external prerequisite node. All are accepted packets, and each states what its consumer needs:
  - LocalFieldsRamificationPartII GF.0–GF.6;
  - CrystallineCohomology CR.5:log-algebra;
  - ClassicalAdicEtaleCohomology H1:henselian/zariski-riemann-space-as-limit;
  - AdicCoefficientsAndComparisons L2.
- **SchemeAndStackFoundations.** The sections and declaration names cited from the merged Tau Ceti roadmap all exist on TauCetiRoadmap main 69bd802: §§0.9, 0.16–0.22, 1.17 and 4.11–4.20, including `flattening_by_blowup` (proper case only), `chow_lemma`, `resolution_of_curves`, `IsAlteration`, `SNCData`, `IsStrictNormalCrossings`, `finiteGroupQuotient_projective` and `nonJapaneseDVR`.
- **Request.** The CR.5 request for the log structure of a general closed subset is precise.
- **Duplication.** I fetched every README and Suggested file on TauCetiRoadmap main 69bd802 (255 files) and screened them, together with the atlas packets, for:
  - alterations and Gabber's or Temkin's theorems;
  - Riemann–Zariski spaces of pointed schemes;
  - log regular pairs and very tame actions;
  - stable modification;
  - Cossart–Piltant.

  No other owner exists. StableReduction Layer 4 resolves only models of smooth curves over a DVR. AdicSpacesPartII's Riemann–Zariski spaces are a different construction.
- **Cycles.** None. A dry atlas assembly adds 28 stages and 43 stage edges and skips no links. No supplier depends on this roadmap.
- **Ownership note.** PA.0 plans general inputs that the merged SchemeAndStackFoundations stops short of:
  - flattening of non-proper finite-type morphisms;
  - the non-separated Chow lemma;
  - universal resolvability in dimension ≤ 3.

  Other routes also need them: PAPER-BHATT-ETAL-23 route 2, PAPER-BHATT-18 route 6 and MotivesAndAlgebraicCycles. A `rescope` entry in `restructure` records that PA.0 owns them until the SchemeAndStackFoundations Part II design (#3361) either imports them or takes them over.
- **Scope and layer order.** Both are sound. PA.0 vocabulary leads to PA.1 Riemann–Zariski spaces, then PA.2–PA.3 distillation, then PA.4 Gabber's theorems, then PA.5 relative curves, then PA.6 the end theorems. The Part II starts where the parent's L5 consumes de Jong alterations of unrestricted degree.

## Suggested Lean file

- `import Mathlib` is replaced by the 16 individual Mathlib modules the file uses, plus Tau Ceti's `ValuationSpectrum`, as PROTOCOL §13 requires.
- `residueChars_eq_empty_iff` is added.
- The closing comment claimed that every omitted name lacks carriers at the pins. It now says that a few PA.0 and PA.1 tests are statable and are omitted only to keep the file to a representative subset.
- **`lean-check` at the pins: exit 0**, with 24 admitted-proof warnings and the `#check` output, and nothing else.

## Reader document

I resynced the reader from the corrected packet with a generator that reproduces all 63 node sections of the original exactly. Only the corrected sections were spliced in, together with:

- the supplier contract;
- the open gap;
- the source-issue list (E2, E3, E5 and E11 rewritten, E13 added, and a sentence recording the review's verdicts);
- the PA.2 dependency line;
- one front-matter phrase.

The reader contradicts nothing in the packet.

## Questions for the orchestrator

1. Ownership of the general PA.0 inputs (finite-type flattening, non-separated Chow, resolvability in dimension ≤ 3) should be settled when the SchemeAndStackFoundations Part II design (#3361) runs; see the `rescope` entry.
2. The consumers named in the design handoff should be re-pointed once this packet is promoted:
   - HigherLocalFieldsAndHigherClassFieldTheory gap G13, to PA.6/prime-to-ell-variety-alteration;
   - LogicAndDefinabilityInNumberTheoryPartII gap G-ALT, to PA.6/odd-degree-model-alteration.
3. Gap G1, the global projectivity of the Cossart–Piltant resolution for non-affine schemes, is a real open input. A later source job might look for a published projective version.
