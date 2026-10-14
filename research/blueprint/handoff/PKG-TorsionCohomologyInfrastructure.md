# PKG-TorsionCohomologyInfrastructure

Issue #9858; Claude (Opus 5.5), session `claude-AVSqxO`; 2026-10-14. First round of the roadmap package. No packet, reader or suggested input was changed.

## Result

`research/blueprint/packages/TorsionCohomologyInfrastructure/` contains the following:

- `README.md` is about 160 KB, in the upstream shape: Summary; Scope and ownership; Conventions; Exact supplier contracts; How to read the build; then the layers in build order (0, 2a, 1, 2, 3a, 3b, 4), each ending with Examples and Dependencies; then Corrections to the published sources, Downstream consumers and References. The layer numbers keep the plan's stage numbers (TC.k becomes Layer k; TC.3 is split into the plan's proposed sub-layers 3a and 3b; the early TC.2 colimit is Layer 2a).
- All 38 plan targets are present, plus 10 owned targets (see below). Definitions and constructions have their API and at least three Checks (§§0.1, 0.2, 0.3, 1.1, 1.2, 2.6, 3a.1, 3a.3, 3a.5, 3a.7, 3b.1, 3b.5). Every target carries its exact hypotheses, a source locator and a *Needs* line.
- `Suggested.lean` is 311 lines and imports Mathlib only. It contains six real-bodied light definitions: `heckeInitialTopology` (an `abbrev`), `weightedProduct`, `weightSubst`, `laurentSubst`, `substStableIdeal`/`laurentCoeffIdeal`, and `scholzeLeviPolynomial`/`normalizedReciprocal`. Its theorems are the separation theorem, finite-weight uniqueness and polynomiality, the Laurent coefficient-ideal bound, the reciprocal identities and the initial-topology criterion. The examples include the `ℤ/9` separation failure, the rank-one and rank-two normalisations, the unitary top sign, the `p`-adic versus discrete topology, and the `H¹({±1}, ℤ₂) = 0` and `H¹({±1}, 𝔽₂) ≠ 0` nonlifting pair. It has no sorry'd data.
- `metadata.toml` is `topic = "math.NT"`.

Checks run:
- `lean-check research/blueprint/packages/TorsionCohomologyInfrastructure/Suggested.lean` exits 0. The only warnings are 29 `declaration uses sorry` (one reducibility lint was removed by making `heckeInitialTopology` an `abbrev`).
- `scripts/check_sorry_data.py` reports no offenders.
- `research/blueprint/intake.py check-files` on the three package files reports 0 problems.
- Scripted checks found that every Lean declaration is named in the README, that every README `*Lean:*` name exists in the file, and that no process vocabulary remains (packet, node, review, request, job, coverage, stage ids).

## Ownership decisions (record for the owners named)

**Upward citation removed.** The plan cites `ModularityAndLanglandsExtensions:ML.4`, which is tier 26 against this roadmap's tier 18, for the Arthur/Mok classification behind the symplectic and general-CM branches. The package does not cite ML.4. It states the input as an explicit hypothesis **(EC)**, the conclusion of Scholze's Theorem 5.1.2 with the unramified compatibility of p.1033. Every general-form statement in Layers 3b–4 carries (EC). The unconditional CM form (Remark 5.4.6, through ET.7a) carries the field and `S` hypotheses instead. When ML.4 is packaged, its classification theorem should be stated so that it discharges (EC) as written in "Scope and ownership".

**Ten supplier items planned here (moved down).** The plan routed these as requests to suppliers. The lower-tier packages do not state them (checked 2026-10-14 against `research/blueprint/packages/*/README.md` and the current upstream IntegralHeckeAndGaloisDeterminants), so the package owns each as a target with no other TC prerequisite. A supplier Part II can absorb them later, and this roadmap would then cite it.

| Owned target | Plan request it replaces | What the supplier states instead |
|---|---|---|
| §0.1 ampleness from the special fibre (Stacks 01PS, 09MW) | AdicSpacesPartII R2 (projectivity/ampleness over `O_K`) | F0.64 is noetherian only |
| §0.5 closed-quotient sequence modulo `p^m` | PerfectoidQuotients Q4 extension | §3.3 gives the quotient, strong closedness and almost surjectivity only |
| §0.7 traces of integrally closed ideals (Scholze L.4.3.2) | AdicSpacesPartII R3 | R3.58–R3.59 give finite locally free traces only |
| §1.3 sections over a non-vanishing locus (Stacks 01PW) | AdicSpacesPartII R2 (coherent localisation on `D(s)`) | not stated |
| §1.5 Serre vanishing for flat finitely presented sheaves over any ring (Stacks 01ZM, 01ZR, 05LY, 081F, 09MT, 0B91 + F0.64) | AdicSpacesPartII R2 (formal Serre vanishing over `O_C`) | F0.64 is noetherian only |
| §2.2 almost faithfulness of free `O_C/p`-modules | PerfectoidSpaces P0 | Layer 0 has almost modules, not this test |
| §2.3 cohomological dimension of the perfectoid compactification | AdicSpacesPartII R2 (Huber 2.5.8 and limits) | not stated |
| §3a.4 homogeneous decomposition of multiplicative group-algebra laws (Scholze L.5.3.13) | IntegralHeckeAndGaloisDeterminants IHG.0 extension | upstream IHG Layer 0 does not state it |
| §3b.6 residual-kernel factorisation (Chenevier L.3.8) | IntegralHeckeAndGaloisDeterminants IHG.1 extension | upstream IHG does not state it |
| §4.1 integral finite-coefficient boundary filtration (CLH Prop. 3.3, Rem. 3.4) | ArithmeticLocallySymmetricSpaces ALS.4 extension | ALS.2.8/2.9/4.7/4.8 give the pieces, not the filtration theorem |

**Requests found already met by the suppliers** (cited, not owned):
- IHG.5 arbitrary-family nilpotence: upstream IHG Layer 5, *Nilpotence in a product of coefficient rings*.
- AG2.7 constituent input: AG2.3, *Arbitrary regular conjugate-self-dual existence*, and the AG2.7 exports.
- ET.7a: ET package Layer 13, *Pure cohomological unitary transfer*.
- ClassFieldTheory Layer 11 and `geometricArtinMap`.
- ModularCurvesPartII R14.3: package Layer 14.
- PadicHodgeTheory P8 constructible primitive comparison, which is natural for maps of pairs and coefficient change. Trace compatibility is proved inside §2.1.
- CompletedCohomologyPartII CC.4: its cell-complex nodes.

**Genuine-to-image comparison.** The plan requested a cusp-section comparison along `X*_K → X̄_K` from PerfectoidShimuraVarieties S2. With the corrected locator on p.1030 (formal models on the genuine compactification through preimages of charts), §1.6 identifies the generic fibre from §0.3 and rigid GAGA. The genuine/image passage is needed only in Layer 2a, where PSV §2.9 supplies the finite map.

**Supplier layer names used in the README.** PSV S_k = package Layer k (§§1.3–1.6, 1.16, 2.3, 2.4, 2.9, 3.3, 3.6, 3.8, 3.9). PerfectoidSpaces P_k = Layer k (§§2.8, 7.15). PerfectoidQuotients Q4 = Layer 3 §3.3. ALS by section ids ALS.k.n. ET.7a and MC2 R14.3 by stage id. CompletedCohomologyPartII CC.k and PadicHodgeTheory P8 by stage id (no package yet). AdicSpacesPartII by target ids F0.17, F0.64, R2.2–R2.22, R3.58–R3.59. I read each of these section headings in the supplier package before citing it.

## Plan defects noticed (packet unchanged)

- The plan's TC.3/weighted-unit-law writes `D̃ : R[G][V^{±1}] → R[T^{±1}]` as in the source. The package states it as an `h`-dimensional determinant of `G × ℤ` with coefficients in `R[T^{±1}]`, matching Remark 5.1.9 of the source.
- The plan's TC.3/weighted-determinant-factors cites "the supplier's direct-factor decomposition", which no supplier states; it is now §3a.4. With IHG's unit condition `D(1) = 1` the source's identically-zero factor `R_∞` is the zero ring; the README says so.
- The plan's TC.3/finite-weight-series-factorization cites `IntegralHeckeAndGaloisDeterminants:IHG.0` for a "finite-weight formal-series carrier API". The package uses Mathlib power series and Laurent polynomials directly (`weightSubst`), so no IHG carrier is needed.

## Adversarial pass (degenerate instances tried)

| Statement | Instances | Outcome |
|---|---|---|
| twisted separation §3a.2 | `n = 0`; `ℤ/9`, `u = 2`; `ℚ`, `u = 2` swapped pair | holds; the `ℤ/9` failure is a Check and an `example` |
| finite-weight uniqueness §3a.3 | order one, weight `0`, repeated weight | holds for distinct weights; the repeated weight is a Check |
| Laurent ideal §3a.7 | `I = 0`; `ℤ/4`, `I = (2)`; `𝔽_2[a,b]/(a²,b²)`, `I = (a+bT)` | the last shows the intersection over substitutions is needed (`a + bT ∉ I_2`) |
| homogeneous decomposition §3a.4 | `ℚ × ℚ` with degrees 1 and 2; constant law; `x ↦ ε(x)²` | holds; `R_∞` disappears under `D(1) = 1` |
| trace integrality §0.7 | `ℤ_p[√p]` (integral closure `pS`, not `√p·S`); the cusp `ℤ_p[[t²,t³]]`; `I = (x²,y²)` | normality and integral closedness are both needed |
| Levi polynomial §3b.1 | `n = 1, q = 3`; `n = 2, q = 2`; unitary `n = 1` | `1 − 6X`; `1 − 6X + 40X²`; top coefficient positive |
| GL₂ boundary twist §4.2 | Eisenstein `t = 1 + ℓ`, `d = 1` | `(1 − ℓ²X)(1 − ℓX) = P^{(1)}(ℓX)P^{(2)}(X)`, a witness for `c_i = n_{i+1} + ⋯ + n_k` |
| residual-kernel §3b.6 | `ℤ_ℓ`; `ℤ_p`; `ℤ/ℓ × ℤ_p` | the factorisation is through `G/H`, not through `G/ker ρ̄` |
| Frobenius convention | `n = 1`, trivial character | `P_v = 1 − q_vX`, which is `ε^{−1}` in the geometric normalisation (stated as a witness in Conventions) |
| nonlifting §4.8 | `[pt/{±1}]`, `p = 2` | `H¹(ℤ₂) = 0`, `H¹(𝔽₂) = 𝔽₂`; both are Lean examples |

## Sources

I read the published Scholze PDF (sha256 `ebac854f…`, matching the packet), Chenevier arXiv:0809.0415v2 (`f3c0e0d8…`, Lemma 3.8 p.43) and the Caraiani–Le Hung author PDF (`1f9ef1c6…`, §3 and pp.11–12). I took the Stacks Project tags from its `tags` file and the `.tex` sources, and checked arXiv metadata for Bhatt–Scholze, Scholze's diamonds and perfectoid papers, and AGIKMS. Huber's book is cited only as Scholze's own reference; §2.3 gives the formal-model proof, which does not need it.

## Remaining

Nothing is unfinished for this package. Follow-ups for other owners: ML.4 should discharge (EC); AdicSpacesPartII, PerfectoidQuotients, PerfectoidSpaces, IntegralHeckeAndGaloisDeterminants (Part II) and ArithmeticLocallySymmetricSpaces may each absorb their owned item from the table above.
