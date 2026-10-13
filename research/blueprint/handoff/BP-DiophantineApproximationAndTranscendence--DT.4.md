# Handoff: BP-DiophantineApproximationAndTranscendence--DT.4

Follow-up part for layer DT.4 (effective applications) of *Diophantine approximation and transcendence*, written by
Claude (session claude-MYhrKg), 2026-10-13. Issue #9322.

Deliverables:

- `research/blueprint/packets/DiophantineApproximationAndTranscendence--DT.4.json` (part `DT.4`, status `complete`)
- `research/blueprint/readmes/DiophantineApproximationAndTranscendence--DT.4.md`
- `research/blueprint/suggested/DiophantineApproximationAndTranscendence--DT.4.lean`

## What is closed

The packet has 49 nodes (3 definitions, 30 lemmas, 16 theorems), 24 API items, 15 unit tests, 5 planets and 71
baseline declarations, each read in its source file at the pinned commits (Mathlib 082e2d3, Tau Ceti f790474).
`scripts/check_blueprint.py` reports 0 errors and 0 warnings. Every item of the first pass's `remaining` list for
DT.4 is now a node:

- **BEG §§3–4, Theorem 5.14 (Baker's superelliptic theorem).** Bérczes–Evertse–Győry 2013 (arXiv:1301.7168v1) read
  in full. Planned on two tracks: an effective track (`superelliptic-power-decomposition` →
  `superelliptic-reduction-to-thue-equation` / `hyperelliptic-reduction-to-pell-system` →
  `thue-equation-over-s-integers-effective` / `pell-system-over-s-integers-effective` →
  `superelliptic-effective-finiteness-over-s-integers`), which closes on DT.3, DT.2, the first part of DT.4 and the
  libraries, and the explicit track (`beg-superelliptic-height-bound`, `beg-hyperelliptic-height-bound` = BEG
  Theorems 2.1–2.2), which adds the relative discriminant estimates (BEG Lemmas 3.1–3.4, 4.1, 4.3), the height and
  discriminant-size lemmas (3.6, 3.7), class number and regulator bounds (3.5), the S-regulator, small representatives
  (3.8) and the explicit Thue/Pell bounds (Propositions 3.11, 3.12).
- **Theorem 5.15 (Schinzel–Tijdeman).** BEG Theorem 2.3, proved in BEG §5 (not §6, as the first pass's coverage
  record says): `superelliptic-variable-exponent-decomposition` (Lemma 5.1), `large-place-estimate-for-variable-exponent`,
  `beg-schinzel-tijdeman-bound`, and an effective version `schinzel-tijdeman-effective-over-s-integers`.
- **Tijdeman's Catalan bound.** Tijdeman 1976 (Acta Arith. 29) read from page images (the publisher's host now answers
  non-browser clients with a bot challenge; the Internet Archive copy was used). Nodes `catalan-reduction-to-prime-exponents`,
  `catalan-exponent-two-cases`, `cassels-type-factorisations`, `tijdeman-smaller-exponent-bound`,
  `tijdeman-larger-exponent-bound`, `tijdeman-catalan-effective-finiteness`. Both of Tijdeman's Baker-type inputs
  (his Theorem 2, Baker's Theorem B) are replaced by Matveev's bound (`separated-height-logarithmic-form-bound`, from
  `DT.3/matveev-corollary-linear-form-bound`), and the exponent-2 cases by the Schinzel–Tijdeman and Baker theorems
  instead of Lebesgue's and Ko's theorems.
- **Yu's p-adic bound for algebraic numbers** in an arbitrary number field, including one logarithm
  (`yu-bound-in-a-number-field`, from `DT.3/yu-explicit-p-adic-bound`), and BEG Proposition 3.10 at an arbitrary place
  (`baker-bound-at-a-place`).
- **The review's split interfaces:** class-group/principal generators (`principal-generators-of-class-group-powers`,
  `minkowski-cofactor-for-ideals`), S-logarithm integrality and kernel (`s-logarithmic-map-kernel-and-lattice`,
  `s-unit-rank`), the generator-field extension of Yu (above), and the superelliptic ideal-power and height estimates
  (`superelliptic-ideal-power-decomposition`, `superelliptic-power-decomposition`,
  `superelliptic-power-decomposition-height-bound`).
- **Request of ArithmeticStatistics ST.1** (uniform bound for cubic Thue equations): `uniform-bound-for-thue-equations`
  (any degree n ≥ 3, absolute for n = 3), via `primitive-binary-form-linear-factor-ideal`, Siegel's identity and
  `DT.2/uniform-bound-nondegenerate-solutions`.

The coverage record for DT.4 is `planned`; its `remaining` list names the open gaps below and the assembly edits.

## Source issues recorded (E701–E705)

- **E701 (error, affects a stated result).** BEG (5.19), p. 28: the bound for h(ξ₁/ξ₂) omits the factor
  h_{L₁}h_{L₂} that Lemma 5.1's decomposition of (x − α_i)^{h_{L₁}h_{L₂}} introduces. Restoring it, BEG's final
  computation gives m ≤ (10n²s)^{46ns}|D_K|^{8n}P_S^{n²}e^{15ndĥ} instead of their (2.7). Checked on the page image.
  For K = ℚ, S = ∅ the explicit constant of `DT.4/schinzel-tijdeman-theorem` (first part) should read
  (10N²)^{46N}e^{15Nĥ}. The corrected exponents follow BEG's absorption steps; a full recomputation is listed as
  remaining.
- E702 (misprint): BEG §5 prints L_i = ℚ(α_i) for K(α_i). E703 (misprint): BEG Lemma 3.4 takes m ∈ ℤ_{≥0}.
  E704 (misprint): BEG Lemma 5.1 lists t_i exponents instead of t_i − 1. E705 (gap): Tijdeman carries out only the
  case p > q; the mirror case needs the comparison p^{δ₁}ρ^q ≥ q^{δ₂}σ^p − 1.

## What remains (gaps)

1. **Analytic class number and regulator bounds** (`class-number-and-regulator-bounds`, BEG Lemma 3.5: Friedman's
   R_K ≥ 0.2 and Louboutin's h_KR_K ≤ |D_K|^{1/2}(log*|D_K|)^{d−1}). Not decomposed. Louboutin's residue bound is
   planned at AnalyticNumberTheory:AN.4/louboutin-dedekind-residue-upper, a higher upstream tier, so it cannot be cited
   from DT.4. Only the explicit BEG constants depend on it.
2. **Győry–Yu (2006)** (Acta Arith. 123, 9–41), Corollary 3 and Theorem 3, behind BEG Propositions 3.11–3.12: not
   freely available (publisher sells the PDF), not read. The effective Thue and Pell nodes do not depend on it.
3. **Yu 2007** (Forum Math. 19) at finite places in BEG Proposition 3.10: DT.3 plans Yu 1994 only. Matters for BEG
   Theorem 2.3 with finite places in S; equations over ℤ use only infinite places.
4. **Voutier's lower bound** for d ≥ 2 (computational and Cantor–Straus inputs); d = 1 is trivial and is all that
   equations over ℤ need.
5. **Lewis–Mahler's discriminant bound** (Acta Arith. 6, not read); the Mahler-inequality route gives a bound weaker by
   a factor e, and Hadamard's inequality is not in Mathlib at the pin.
6. **Rosser–Schoenfeld's π(x) bound** for lcm(1, …, m) ≤ 4^m; Mathlib's Chebyshev bounds give 16^m·m^{√m}.

## Requests made

Three requests to the Tau Ceti roadmap NumberFieldArithmetic: Layer 4 (the discriminant of a K-basis of L contained in
𝓞_L lies in relDiscr(𝓞_K, 𝓞_L)), Layer 5.10 (valuation of relDiscr as Σ f·v_P(different)), Layer 6.4 (wild different
bound v_P(𝔡) ≤ e − 1 + v_P(e)). Tau Ceti's pinned `TauCeti.relDiscr` and `TauCeti.relDiscr_tower` are cited directly.
Other roadmaps cited by node: GeometryOfNumbersAndQuadraticArithmetic:GN.1 (`successive-minimum`,
`minkowski-second-upper`, `basis-from-minima`), a lower tier. No citation points to a higher upstream tier.

## Notions moved down (WORKERS.md, Upstream tiers)

- The S-unit theorem (`s-unit-rank`) is planned here; KTheoryLowDegrees:U.4/s-unit-theorem and
  MordellLawrenceVenkatesh:LV.6/s-unit-theorem (higher tiers) can import it.
- The analytic class number and regulator bounds are stated here (gap 1); AnalyticNumberTheory:AN.4's Louboutin node
  can import the statement.
- Gauss's lemma for content ideals over a Dedekind domain (`content-ideal-gauss-lemma`; Mathlib has only the inclusion
  `contentIdeal_mul_le_mul_contentIdeal`) is planned here; no other owner was found.

## Assembly edits (the first part's packet may not be edited by this job)

- `DT.4/baker-superelliptic-theorem` → add prerequisites `beg-superelliptic-height-bound`,
  `beg-hyperelliptic-height-bound`, `superelliptic-effective-finiteness-over-s-integers`.
- `DT.4/schinzel-tijdeman-theorem` → add `beg-schinzel-tijdeman-bound`, `schinzel-tijdeman-effective-over-s-integers`;
  correct the constant to (10N²)^{46N}e^{15Nĥ} (E701); its source locator "section 6" should be §5.
- `DT.4/tijdeman-catalan-bound` → add `tijdeman-catalan-effective-finiteness`.
- `DT.4/exponent-height-bound-for-finitely-generated-groups` → add `s-logarithmic-map-kernel-and-lattice`, `s-unit-rank`.
- `DT.4/s-integral-divisor-representation` → add `principal-generators-of-class-group-powers`.
- `DT.4/gyory-effective-finiteness`, `DT.4/gyory-equation-exponent-bound` → cite `yu-bound-in-a-number-field` in place
  of the bare DT.3 stage for the p-adic input; the first pass's gap "Yu's p-adic lower bound for algebraic numbers" is
  then closed by this part.
- ArithmeticStatistics:ST.1/fibres-of-the-embedding-are-uniformly-bounded can cite `uniform-bound-for-thue-equations`
  instead of the DT.4 stage.
- EffectiveDiophantineMethods:ED.5/integral-points-completeness uses the hyperelliptic bound, now
  `beg-hyperelliptic-height-bound`.

## Structure

The packet proposes splitting DT.4 into sub-layers DT.4a (unit, Thue and S-unit equations), DT.4b (superelliptic and
hyperelliptic equations) and DT.4c (variable exponents and Catalan), because the layer now has 90 nodes and more than
six planets across the two packets. The stage-cycle check (atlas requires and stage edges, plus edges induced by all
packets) shows that this part adds no stage to the strongly connected component containing DT.4; its new cross-layer
edges come from DT.2, GN.1 and NumberFieldArithmetic Layers 4–6.

## Suggested Lean file

763 lines, Mathlib-only imports (lean-check's Tau Ceti is a different commit, so Tau Ceti's `relDiscr` is restated with
its pinned body and marked as such). Compiled with `lean-check` at Mathlib 082e2d3: no errors, 88 warnings, all
"declaration uses `sorry`". Definitions (`sNorm`, `polyLogHeight`, `superellipticHeight`, `normLogAbs`, `sLogNorm`,
`IsFundamentalSUnitSystem`, `sRegulatorOf`, `IsSRegulator`, `binaryFormEval`, `primesAbove`, `relDiscr`,
`voutierBound`, `thueConstant`, `maxNormS`, `prodNormS`) have real bodies; every API item and unit test of the packet
appears in the file under its packet name (checked by script). Three lemma-level nodes are stated in the document only
(`superelliptic-factor-coprimality`, `discriminant-of-kummer-compositum-bound`,
`superelliptic-variable-exponent-decomposition`); ideal-level statements over S-integers are given in Lean for S = ∅
where the T-integer form needs localisation, with the docstring saying so.

## Sources

Read: Bérczes–Evertse–Győry, arXiv:1301.7168v1 (sha256 6f0c3522…); Evertse, lecture notes Chapter 5 (dio19-5.pdf,
sha256 1f60cf27…); Tijdeman 1976 (Internet Archive scan, sha256 236e391c…); Voutier 1996 (sha256 c300191a…);
Bugeaud–Győry, unit equations 1996 §3 (sha256 988ced2a…) and Thue–Mahler 1996 §5 (sha256 749dc5c6…). All accessed
2026-10-13. Not obtained: Schinzel–Tijdeman 1976 (publisher host refuses non-browser clients, no archived copy; BEG §5
replaces it), Győry–Yu 2006 (paid), Yu 2007, Friedman 1989, Louboutin 2000, Lewis–Mahler 1961, Rosser–Schoenfeld 1962.
