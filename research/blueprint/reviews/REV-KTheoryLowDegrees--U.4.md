# Independent review REV-KTheoryLowDegrees--U.4

Verdict: **accepted after corrections**. Issue #7548. Reviewer: Claude, session `claude-TpgW9D`, 2026-10-09. The input was written by the independent session `codex-z7TRCa` (BP-KTheoryLowDegrees--U.4, #7560, PR #7794). Acceptance concerns the plan: U.4 remains **planned**, with 5 explicit gaps and 9 supplier requests. No implementation is claimed.

## Counts and scope

The input had 91 nodes. The corrected packet has **91 nodes** (76 lemmas, 9 theorems, 4 definitions, 1 construction, 1 application). Two input nodes were deleted, and two were added with `addedBy: REV-KTheoryLowDegrees--U.4`. The `review.checked` table has **33 verified, 56 corrected and 2 added** entries, and none unverifiable. There are 28 API items and 23 unit tests on 5 definitions and constructions, and 55 baseline declarations (19 inherited, all confirmed; 36 added). The gaps fell from 11 to 5 and the requests from 11 to 9. No planet is marked: the six inherited U.4 planets are the per-layer limit, so the planet choice for this part is recorded in the sub-layer proposal.

## Method and sources

Four read-only first-pass reviewers covered fixed node ranges: the last-swap chain (BMS §§7–10), the finite defects and arithmetic order (BMS §§2–5, Appendix, §11), the completions and the Serre route (BMS §14–15, Serre 1970 §§1–3), and the S-unit and Calegari–Geraghty nodes with the packet-level fields. Each read its pages on rendered page images and checked explicit matrices and arithmetic profiles numerically. The lead verified every high and medium finding at its evidence before applying it. A second, adversarial pass by two further reviewers then attacked the corrections; their findings are listed below.

The packet was rebuilt from the submitted file by ordered edit modules, and the reader regenerated from the corrected packet. The generator reproduces the submitted reader byte for byte from the submitted packet, so the reader cannot lag the packet.

Sources read (public copies, SHA-256 as recorded in the packet):
- Bass–Milnor–Serre, Publ. IHÉS 33 (1967), Numdam scan: §§2–5 pp.65–104, Appendix (A.13)–(A.23) pp.85–92, §§7–11 pp.105–121, §§14–15 pp.128–132.
- Serre, the 1974 erratum to BMS, in full.
- Serre, Ann. Math. 92 (1970), author-hosted scan: Introduction, §§1–2, pp.489–500, and §3.1, pp.504–505.
- Calegari–Geraghty, Invent. Math. 211 (2018): §8.5, §9.1–9.3, Conjecture B and Remarks 9.3–9.5, PDF pp.110–120.
- Milne, Algebraic Number Theory v3.08, §5, Theorem 5.11, printed p.90 (newly cited).

## Corrections

The verdict per node is in the packet's `review.checked`. The substantive changes, grouped:

1. **Hypotheses of the higher-rank last swap.** BMS (7.2)_n is HasStableRange A (n−1) (checked on p.106). Proposition 8.6 (p.107) needs (7.2)_r and (8.1)_{r−1}, so `swap-smaller-corner-reduction` and `last-swap-higher-rank` need HasStableRange A (r−1) and GL_{r−1} transitivity, though their hypothesis fields said HasStableRange A r. The route is kept for r≥2, with the r=2 step done directly from stable range one through the parent `relative-shortening`, since the parent standard-form node starts at rank 3. The Dedekind rank-two chain now lists the three inputs that make the next-rank value defined: `dedekind-stable-range-two`, `dedekind-relative-gl-transitive` and `kubota-extension-conditions`. Missing GE-conjugation steps (`ge-subgroup`, `U.1/signed-transposition`) and sign steps (`mennicke-sign-unit`) were added where the proofs use them. The `extended-hom-embed` locator is Lemma 8.11, pp.110–111.
2. **Rank-two scalar choice (gap closed).** s∈I comes from stable range one of A/a₀₀A (`dedekind-principal-quotient-semilocal`) and the lift s=s′(1−a₀₀). The condition c≠0 is unnecessary: det ω=1 and the 2×2 adjugate give ω₁₁=a₀₀ and ω₁₀=−v directly, and [sd/c]=1 also holds when c=0. The inapplicable prerequisite `dedekind-coprime-square-adjustment` was removed.
3. **Arithmetic residue symbol.** The injectivity proof cited the parent `power-reduction-totally-imaginary` for j_p>0, which that node explicitly excludes. BMS Theorem 3.5, Case 3 (pp.75–77) is added as `power-reduction-trivial-residue` (`addedBy`), with the Dirichlet step rewritten into the form the parent (A.10) node accepts. The power-residue symbol, used by five nodes but defined nowhere, is now imported from `ClassicalArithmeticCompletion:CA.1/power-residue-symbol` and `…/power-residue-symbol-of-an-ideal`. Their prerequisite closure is CA.1-internal plus Mathlib, so no cycle arises. Surjectivity is proved by the Chinese remainder theorem (a first entry with one simple prime factor and a primitive-root second entry), so the gap "exact-level surjectivity" closes. With it go the Chebotarev and GlobalNumberFields layer-6 consumers, and the ClassFieldTheory layer-5/6 consumers of that node. `jIndex` is defined in this part; the earlier text called it inherited, but no parent defines it. (3.3) is on p.74.
4. **Finite defects.** `relative-root-commutator` duplicated the accepted `U.5/relative-elementary-commutator` and was removed; `finite-defect-central-lattice` cites the parent. Its statement is BMS Theorem 4.1(a), p.94, and (5.1) is on p.101. The finite symbol laws now rest on E_n(A)-conjugation invariance (`relative-ge-commutator`) as in BMS Theorem 5.4, not on the §§8–10 extension. Finite index of E_n(A,I) uses the bound #μ(F) on the Mennicke group, so the completion nodes no longer depend on the reciprocity gaps.
5. **Congruence kernel.** The kernel of Γ̂→Γ̄ was used by five nodes but never defined. `lattice-congruence-kernel` is added (BMS §14, p.129), stated on Mathlib's native profinite completion as the intersection over nonzero levels of the closures of the images of Γₙ(I), with four API items and four tests. The congruence index lemma now cites `Subgroup.finiteIndex_ker` instead of a surjectivity it never proved. Residue-ring finiteness (gap closed) follows from Tau Ceti `IsDedekindDomain.integer_comap_ne_bot`, Mathlib `Ideal.finiteQuotientOfFreeOfNeBot`, `Ideal.quotientMap_injective` and a finite-ring unit argument. `rational-sl-no-finite-quotients` needs characteristic zero. The rational completion is stated for n≥2, citing Serre §1.3, p.491 (Bourbaki's completion theorem).
6. **Serre's SL₂ route.**
   - Missing hypothesis: `serre-rational-conjugation-refinement` applied Proposition 2 without the unit-rank hypothesis r₁+r₂+|S|≥2.
   - Serre algebraic normal-subgroup input (gap closed): the Zariski-closure step is replaced by an elementary conjugation by level roots. The kernel argument uses Mathlib `Matrix.commutator_diag2_transvection`, `Matrix.SL2.transvection_induction` and `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'`.
   - Root/row refinements (gap closed): the p.492–493 computation is written out, with y⁻¹E₁₂(z)yE₁₂(−z)=E₁₂((u⁴ⁿ−1)z) and left-coset conjugates for the normal closure. Transition surjectivity realises BMS's a-moves with t∈A as conjugation by lower roots.
   - Proposition 5 needs no finite generation, so the O'Meara gap now affects only `serre-elementary-index-after-completion`.
   - The relative universal property follows BMS Theorem 15.1 (pp.131–132), so Moore's paper is needed only for Theorem 12.3.
   - `SerreElementary`'s tautological test is replaced by the element [[3,−2],[2,−1]] of SerreElementary(2ℤ), which is not in the subgroup generated by the level-2 roots. An API item for the image in SL₂(F) is added.
   - Several locators are fixed.
7. **Calegari–Geraghty interface.** CG §9 works with G=Res_{F/ℚ}PGL_n and §8.5 with p>n unramified in F (PDF pp.110, 115), so the GL determinant term and the case p | #μ(F) do not arise.
   - `cg-congruence-kernel-characters` is the general group lemma.
   - `cg-determinant-character-interface` proves that mod-p characters of the PGL component lattices are congruence characters.
   - `cg-localized-h1-vanishing` uses ArithmeticLocallySymmetricSpaces' finite-cover Hochschild–Serre sequence (ALS.6) and requests only "H⁰ is Eisenstein", extended to Res PGL_n.
   - `cg-compact-support-degree-one-interface` followed the misprinted degree of Remark 9.3 (PAPER-CALEGARI-GERAGHTY-18/E184) and planned a circular "complementary-degree" input. Its correct content, degree d−1 by duality at the dual ideal, belongs to AutomorphyLiftingBeyondTaylorWiles (PAPER-CALEGARI-GERAGHTY-18 route 1), so the node is removed. `coverage.remaining` records how that design job should import `cg-localized-h1-vanishing`.
   - The gap "CG Hecke support and dual degree" closes, and the ALS.4 request is narrowed accordingly.
8. **S-unit refinements.** Serre §1.1 only recalls the unit theorem. The three nodes now cite Milne, ANT v3.08, Theorem 5.11 and its proof, printed p.90 (SHA-256 `24b83c78…7847`, the copy already used by Z.3, re-hashed). They gain their exact Mathlib inputs and move to the parent's `TauCeti/Algebra/KTheory/SInteger` module. They split the proof of the accepted `s-unit-theorem`, which already contained this argument; `coverage.remaining` records the assembly instruction to attach them.
9. **Requests.** Chebotarev layer 4's need is in the pinned libraries (Tau Ceti `AlgHom.IsArithFrobAt.apply_eq_pow_absNorm_of_pow_eq_one`, Mathlib `IsCyclotomicExtension.isAbelianGalois`, `Ideal.exists_ideal_over_prime_of_isIntegral`), so that request is replaced by baseline citations. GlobalNumberFields layer 6 lost its only consumer. The ClassFieldTheory layer-6 request is cut back to that layer's stated scope; the degree-m extension stays a gap and an upstream note. Every `neededBy` list was recomputed from the citing nodes.
10. **Boilerplate.** Every node's `hypotheses`, source `match` and `acceptance` were rewritten. The submitted text gave 83 nodes one generic hypothesis line and 61 one shared acceptance sentence, and every `match` repeated the title. The new acceptance checks are concrete cases, recomputed by the reviewers. The reader now shows each node's source description.

## Remaining gaps and requests

Five gaps remain, each with its consumers. (1) The reciprocity input (A.21): CA.1's tame and product formulas cite K2SymbolsBrauer:T.7, which reaches U.4 through MotivicEtaleKTheory:M.3/tate-global and K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence. The submitted packet recorded a different path, which is not a dependency path. (2) The local degree-m Artin comparison and the higher-unit images (A.13)–(A.18). (3) The two-sided rational completion. (4) Finite generation of SL₂(O_{F,S}). (5) Moore's relative fundamental group. Nine requests remain: ClassFieldTheory layers 5, 6, 11, 12, 13; Chebotarev 10; GlobalNumberFields 7; ProfiniteProPGroups 0; ALS.4. The node graph is acyclic over all packets. In the recorded stage graph, U.4 reaches none of its new suppliers, so the atlas will draw the new links.

## Baseline verification

All 19 submitted declarations exist at the pins and say what the citing nodes need. The valuation sign convention exp(−ord) was checked in Mathlib's `valuationOfNeZero`. No citation was removed. The suggested file no longer cites `QuotientGroup.quotientKerEquivOfSurjective` for the congruence index; the declaration stays in the table for `arithmetic-finite-defect-roots`. Thirty-six declarations were added, each read at Mathlib 082e2d3 or Tau Ceti f790474 and present in the pinned index: residue-ring finiteness (4), CRT and roots of unity in quotients (2), adic valuations and class number (6), rank–nullity (3), profinite completion and finite-index subgroups (11), SL₂ generation and simplicity (6), cyclotomic Frobenius (3) and S-integer contraction (1).

## Source findings

- E116–E118 collided with the sibling U.5 packet, which uses E116–E119 for K-book findings; they are renumbered **E120–E122** and confirmed on the page images. E120 is BMS p.119, "Theorem 5.1" for Theorem 5.4; E121 is Serre p.497, Proposition 2 for Proposition 3; E122 is BMS p.103, "Dedeking".
- Eight new misprints are recorded and confirmed, each on a rendered page. None affects a stated result. Each corrected display was also checked numerically.
  - **E123**: BMS Cor. 4.3(c), p.95, takes the minimum over 𝔭 | 𝔮 instead of 𝔭 above p.
  - **E124**: BMS Lemma 5.5, p.102, prints the conjugator as (1 1; −t 0).
  - **E125**: BMS p.107 names [GE_n(A), GE_n(A,q)] for [GE_n(A), GL_n(A,q)].
  - **E126**: BMS Lemma 8.11, p.111, has off-by-one index ranges in a′.
  - **E127**: BMS p.116 has a_{n−1,1} in row n−1 of τ.
  - **E128**: BMS p.117 uses an unbound index i in δ.
  - **E129**: BMS p.118 has c₁ for c₂ in τ.
  - **E130**: Serre p.492 prints a singular right factor in x′.
- The Calegari–Geraghty issues PAPER-CALEGARI-GERAGHTY-18/E184 and E185 were already in the register; the corrected nodes cite them.

## Suggested Lean file

The file elaborates with `lean-check` at Mathlib 082e2d37e8 (Mathlib-only, automatic implicit variables off): **82 placeholder warnings, no errors, no other warnings**. Changes:
- **`jIndex`** was identically 0, because an ℕ-valued infimum over a Prop-guarded index is 0 for primes not above p. `defectOrder` was therefore 1 and six statements were false; the infimum now runs over the subtype of primes above p.
- **Added:** `latticeCongruenceKernel` with its API and tests, `arithmetic_congruence_index`, and the theorems `higherRankLatticeCongruenceKernel` and `serreInfiniteUnitCongruenceKernel`.
- **Moved:** `ordAt`/`jIndex` out of the Inherited namespace, with `jIndex_le`.
- **Tests:** the non-abelian-target test now evaluates `extendedHom`. Added a right-corner value test, the unit-ideal and ℚ(ζ₃) mixed-primes tests, and the SerreElementary non-generation test. Added `relElementary_le_SL` and `serreElementary_map_le_iff`.

Every definition, API item and test of the packet occurs in the file under its packet name. The header lists the omitted signatures (rational completions, relative universal cover, Hecke statement) and why.

## Second pass

Two further reviewers attacked the corrections.
- **Mathematics:** found the `jIndex` encoding defect (high); the Eisenstein notion had to be extended to Res PGL_n (medium); five low precision issues (left cosets, pushout, the (A.10) form, the finite-index passage, the K′ normal core).
- **Consistency:** found leaked first-pass index references, two proof steps still citing a removed prerequisite, the vacuous Lean test, a stale erratum id, the GL/PGL attribution, a missing level-map prerequisite, rank hypotheses kept only in the hypothesis lists of three Serre statements, and several wording slips.

All were applied. Both confirmed the new node, the surjectivity and adjugate arguments, the Serre computations, the kernel definition and signatures, all numerical acceptance cases and all eight new misprints.

## Questions and follow-ups for the orchestrator

1. **Restructure.** The sub-layer split now lists its nodes. Its planets would be BMS Theorem 14.1 ("Congruence subgroup property for SLₙ") and Serre's theorem ("Serre's congruence theorem for SL₂"). Without the split, these should replace two inherited planets of the U.1 packet.
2. **CA.1.** Re-prove CA.1's tame and degree-m product formulas from the ClassFieldTheory Artin inputs, so that U.4 can import them and close the reciprocity gap.
3. **AutomorphyLiftingBeyondTaylorWiles.** Its design job should take the degree d−1 half of Remark 9.3 as recorded in `coverage.remaining`.
4. **Assembly.** Assembly of KTheoryLowDegrees should add `s-unit-rank-from-exact-sequence` to the parent `s-unit-theorem`.
5. **Errata ids.** Unrelated to this part: `KTheoryLowDegrees/E20` and `E22` are used by both the Z.3 and U.6 packets.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--U.4.json`, with the pinned index: **0 errors, 0 warnings**.
- `git diff --check`: clean.
- Errata collection: E110–E130 each appear once.
- Node-level cycle check over all packets: none.
- Packet↔Lean name parity: complete.
- `lean-check` was run with more than 100 GB of memory free. No language server, library build or cache download was started, and nothing was left running.
- The reader is regenerated from the corrected packet.

