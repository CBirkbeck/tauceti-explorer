# REV-PKG-GrossZagierAndArithmeticHeights — independent package review

Claude (session `claude-NKgeCb`), issue #9217, 14 October 2026. I did none of
`PKG-GrossZagierAndArithmeticHeights` (Codex, session `codex-dLsusU`). The method
is `research/blueprint/PACKAGE_REVIEW.md`; the input is the package at explorer
`2e6825dd7`.

**Verdict: `needs_changes`.** The package is mathematically careful, and its
statements held up under every check I made. I corrected its form, conventions
and internal gaps in place (listed below). One defect cannot be fixed inside
these files: a large share of the "exact supplier contracts" ask suppliers for
content that those suppliers do not plan (R1 below). Under the upstream rule
"every milestone rests on existing material, earlier material, or a cited
dependency", these are gaps. Closing them is an ownership decision for the
maintainer: either extend the suppliers or move the notions into this roadmap.

## What was checked

| PACKAGE_REVIEW check | Result |
| --- | --- |
| 1. Quality bar / upstream form | Read the current TauCetiRoadmap `EllipticCurves`, `ModularForms` and `StableReduction` READMEs, and `UPSTREAM_GUIDE.md`. The README had substantial form debris, now corrected (see "Corrections"). The shape (Scope, Prerequisites and boundaries, Conventions, Exact supplier contracts, How to read the build, Layers 0–9 with Examples and Dependencies, Source and interface limits, Downstream consumers, References) is correct. |
| 2. Sources | 15 randomly drawn locators (seed 9217, one per target section), plus CST (2.1), CST Theorem 1.1 and erratum items 8, 30, 31 and 35. All match at the cited theorem and page (table below). The Yuan–Zhang–Zhang 2013 book is not public and is not in the cleared library; its locators stay unverified and are flagged in References. |
| 3. Gaps | **Fails (R1–R2).** 23 of 99 supplier contracts have no matching content in the named supplier and 43 only partial content; Layer 2 rests on `ArakelovGeometryAndAbelianHeights:R35.1`, which states no targets. The three self-contracts ("From GrossZagierAndArithmeticHeights") are now closed by new targets 1.5, 4.7 and 5.6. |
| 4. Unit tests | All 68 targets with an API have at least three prose Checks. The `bdpLFunction` Checks were generic power-series facts; I replaced them with three discriminating ones. |
| 5. Lean | `lean-check` exits 0 before and after my edits; afterwards there are 21 `sorry` warnings and nothing else. All 12 declarations were checked against the README; corrections below. No sorry'd data and no `True`/`Prop := sorry`. 168 lines. |
| 6. Own words | A 10-word prose-window scan against all 17 downloaded source texts finds no overlap (one 12-word fragment in 2.6 was rephrased). |
| 7. `intake.py check-files` | 0 problems on README, Suggested.lean and metadata.toml. |
| Duplication vs current TauCetiRoadmap and Tau Ceti `a91d3aaf` | See "Duplication". Two targets were removed as duplicates of AutomorphicSpectralTheory. |

## Corrections made in place

README: 805,084 → 675,240 bytes, 5,832 → 5,768 lines, 276 → 277 targets
(Layers 0–9: 12, 5, 16, 12, 7, 6, 76, 106, 20, 17).

1. **Library-version residue removed; the height convention made correct for
   current Tau Ceti.** At f790474, `canonicalHeight` is lim h(2ⁿP)/(2·4ⁿ) = h_(O);
   at a91d3aaf, which TauCetiRoadmap builds against (lake manifest), it is
   lim h(2ⁿP)/4ⁿ = h_x, and `neronTatePairing` is B_x. I read both source files.
   The README stated everything in the obsolete f790474 convention, through the
   Conventions paragraph and target 0.1, whose 13 Checks used undefined names
   `xCanonicalHeight`, `bsdHeightPairing` and `bsdRegulator` behind a doubled
   "In the f790474 convention," prefix. I rewrote Prerequisites, Conventions and
   0.1 timelessly: Tau Ceti's `canonicalHeight` = h_x, `neronTatePairing` = B_x,
   `regulator` = BSD regulator, and h_(O) (Silverman) differs by 2, or 2^r for a
   Gram determinant. I updated every dependent statement (1.1 Check, 1.3, 2.13,
   8.7 API/Check/consequence, 8.19, Layer 0 examples). The factors 2 that the
   old text carried are now 1 where Tau Ceti's names are used. Each was
   recomputed: h𝒫(P,φ_(O)Q) = B_x(P,Q) = `neronTatePairing`; the BSD pairing
   ⟨P,P⟩ = `canonicalHeight P`.
2. **Nonexistent owner.** `TauCetiRoadmap.ArithmeticHeights` is not a
   roadmap; it is the open upstream PR #287. It is now cited with the pinned
   link that current TauCetiRoadmap main itself uses. "Theta series and
   indefinite theta and Siegel–Weil" is replaced by MetaplecticAutomorphicForms
   Layers 4–6, which own the Weil representation and Siegel–Weil.
3. **Current Tau Ceti library.** The Hasse bound is now
   `WeierstrassCurve.hasse_bound` and `frobeniusTrace_sq_le_four_mul_card`;
   cited in Prerequisites and 9.2. `CuspForm.frickeCompletedL` is λ/2 in 0.3's
   notation; added as a convention witness in 0.3.
4. **Duplicates removed.** 7.15 "Classical resolvent kernel" restated
   AutomorphicSpectralTheory AS.2.24 (`AS.2/automorphic-green`), and 7.34
   "Resolvent residue" repeated AS.2.23 (`AS.2/gz-68`) nearly word for word.
   Both are deleted and cited in Prerequisites; their 8 consumers now cite the
   AS nodes. Layer 7 is renumbered (108 → 106); all 927 internal links resolve
   and every numbered link text matches its target.
5. **Self-contracts closed by new targets.** The section "From
   GrossZagierAndArithmeticHeights" asked Layers 1, 4 and 5 for content they did
   not state. I removed it and added:
   - **1.5 Rational Galois descent of Mordell–Weil spaces**:
     A(K)⊗ℚ ≅ (A(H)⊗ℚ)^G by norm averaging, and ⊗_M L.
   - **4.7 Explicit local toric constants at test vectors**: CST
     Proposition 3.11 (p. 26), Proposition 3.12 (p. 27), Lemma 3.5 (p. 23),
     Lemma 3.13 (p. 30) and Lemma 3.14 (p. 31). I read these from rendered
     page images, because the text layer garbles the fractions.
   - **5.6 Petersson pairing as a product of local Whittaker pairings**: CST
     Proposition 2.1, p. 14.

   8.2, 8.14 and 8.16 now cite them. The Hermitian arbitrary-χ converse that
   the Layer 1 contract asked for is asserted by no target; 8.13 and "Source and
   interface limits" now say so.
6. **Supplier section form.** "`X` must supply the following contract." is now
   "`X`: …" (99 entries). "From tauceti" with anchor ids
   `tauceti:TauCetiRoadmap/X#layer-…` is now "TauCetiRoadmap.X Layer n". The
   Atkin–Lehner Main Lemma is in ModularForms **Layer 4**, not Layer 3. The
   residue "Propose … Part II:" (×3) and "Candidate owner to check" is gone.
   Prefixes `mathlib:`/`tauceti:` in *Needs* lists became Mathlib `X` /
   Tau Ceti `X` (158). Six suppliers that are cited in *Needs* lines but had no
   contract entry were added: EffectiveDiophantineMethods ED.4,
   EllipticCurveModularity R29.5, GeneralizedHeegnerCycles GH.1/GH.4,
   ModularSymbolsPadicLFunctions L1, QSeriesPartitionsAndMockModularForms QM.3.
   Two contracts that named the wrong stage were re-pointed. Generalized elliptic
   curves are `ModularCurvesPartII:R13.1`, not R12.3 (9 citations). Ideal-class
   theta series are `MetaplecticAutomorphicForms:MP.5`, not MP.7 (contract and
   5 consumers; 6.27 keeps MP.7 for the half-integral/GL₂ correspondence).
   The citation of `RankZeroOneBSD:BSD.2` was removed: in 8.20 the auxiliary
   field is a hypothesis, and RankZeroOneBSD consumes this roadmap, so the
   citation was an upward cycle. The Scope sentence that called RankZeroOneBSD
   a supplier now gives the right direction.
7. **Standing hypotheses factored.** Six verbatim blocks were repeated 128,
   80, 51, 39, 11 and 7 times (≈130 KB): classical Rankin data,
   classical Heegner local data, CM quaternionic data, Colmez computation
   data, genus decomposition data and Chapter III local data. They are now
   defined once in Conventions as (C), (H), (Q), (Q′), (G), (L), text unchanged.
   Each use was replaced by exact string match only, and every leftover clause
   was kept.
8. **Rewrite artifacts repaired.**
   - 32 occurrences of the meaningless "(the stated normalization)" and 7 of
     "with the stated convention".
   - 3 of "with this norm congruence" and the "CORRECTED" tags.
   - Nine places where a cross-reference had been replaced by the unrelated
     words "the CM parametrization". Each is restored to the target that
     defines the object (6.12, 6.14, 6.26, 6.29, 6.38, 6.41–6.42, 6.64, 2.16,
     7.37).
   - Section titles pasted into equation references ("(5.2) Change of
     uniformizer; …", "as in The sign function …", "(0.5) Explicit model …",
     "(9.7) Inert primes: …").
   - 92 bare target slugs used as prose references, now section numbers.
   - "Prove that write", "remains a gate", "new issue … reported",
     "supplier request", "as quoted in the decomposition", 51 copies of a
     vacuous Consequences sentence, the namespace prefix `TauCeti.GrossZagier.`
     (60), and 26 links to Zhang's `publications.html`, which now returns 404.
     The YZZ book entries are merged into one Princeton University Press
     reference, with a note on which edition its locators refer to.
9. **Boilerplate.** "Construct the comparison as follows." (279, wrong for
   definitions and theorems) is now "*Outline.*", and "The resulting statement
   must retain the following consequences." (150) is now "*Consequences.*".
10. **Unit tests.** 9.9 `bdpLFunction` gained three discriminating Checks:
    root 1+T gives linear coefficient 2; scaling gives c²; the constant
    coefficient u(0)·root(0)² detects a dropped unit.

Suggested.lean:
- The module docstring no longer carries commit hashes and now states the
  design choices: the inverse-character eigenspace, character-weighted
  finite sums, the inverse group-order average, and unit × root².
- `bdpEulerFactor_ne_zero` is now a statement about `bdpEulerFactor` over ℚ,
  with the real Hasse hypothesis. It was a separate ℝ inequality, so the
  milestone was not tied to the definition.
- Two examples added: `2 * unitIndex K = torsionOrder K`, and
  `bdpLFunction (1 + X) 1 = 1 + 2X + X²`.
- `classicalResolvent` dropped from the closing list.
- `lean-check` exits 0; 21 `sorry` warnings, nothing else.

## Remaining defects (reason for `needs_changes`)

**R1. Supplier contracts that the named supplier does not plan.** A Sonnet
cross-check (my instruction; stage existence and keyword location only) read
each of the 99 contracts against the supplier's roadmap stage, packets and
package README. Result: 33 covered, 43 partial, 23 absent; every cited stage id
exists. I verified eight ABSENT rows myself:
- AS says it builds no arithmetic Green functions (README line 21) and leaves
  holomorphic projection to consumers.
- CM.5 has no canonical or quasi-canonical lifting.
- SR.2 has no toric Hom functor.
- A6 has no cyclic-isogeny diagrams.
- HE.2 has no intersection multiplicities.
- AL has no Legendre/Laguerre polynomials and no base-change ε comparison.
- AN.4 has no norm-congruence genus criterion.
- R11.1 has no saturated-cotangent statement.

The 23 absent contracts:

| Supplier stage | Content requested by this README, not planned there |
| --- | --- |
| AutomorphicLFunctionsAndLocalFactors AL.3 | GL₂ × quadratic-torus base-change local ε; ε_RS = η_v(−1)ε_BC |
| AutomorphicLFunctionsAndLocalFactors AL.0 | p_{k−1}, q_{k−1} and their gamma/Mellin/Legendre identities |
| AbelianSchemesAndArithmeticModuli A6 | Hom/End of cyclic N-isogeny diagrams over complete local and Artinian bases |
| GL2AutomorphicRepresentationsAndTransfer R17.3 | integral Jacquet–Langlands lattices (README calls it an extension) |
| NeronModelsAndSemistableAbelianVarieties R11.1 | saturated cotangent summand for a p-optimal quotient (BLR) |
| ModularCurvesPartII R14.6 | bad-prime integral differentials of the modular parametrization |
| HeegnerPointEulerSystems HE.2 (×2) | Zhang's ordinary CM intersection multiplicities; quasi-canonical lifting intersection over W |
| HeegnerPointEulerSystems HE.1 | CM isogeny pair for D_K = −3, −4 (HE.1 excludes them) |
| AutomorphicSpectralTheory AS.3 | continuation and derivative bounds of the mixed incoherent kernel |
| AutomorphicSpectralTheory AS.4 (×4) | holomorphic/Petersson projections (incl. logarithmic growth), compact-surface Green operator |
| ComplexMultiplicationAndExplicitReciprocity CM.5 (×3) | Gross canonical/quasi-canonical liftings, filtrations over W/πⁿ, quaternionic lifting counts |
| HilbertModularVarietiesAndShimuraCurves R18.2 | ordinary CM Serre–Tate coordinates and moment descent (planned instead in AbelianSchemesAndArithmeticModuliPartII P4; contract should be re-pointed) |
| AnalyticNumberTheory AN.4 | norm-representation genus criterion with Nn+l ≡ 0 mod D |
| SmoothRepresentationsOfLocalGroups SR.2 | χ-equivariant toric Hom functor |
| PadicHodgeRegulators L1 | log_BK∘κ = log_A for semistable abelian varieties |
| ColemanIntegration L1 | semistable Coleman/Abel–Jacobi integration (README calls it an extension) |
| DiophantineApproximationAndTranscendence DT.3 | abelian p-adic analytic subgroup theorem (BSW) (README calls it an extension) |

The 43 partial rows are in the scratch table, summarized here by supplier.
- AL.1 and AL.3: Weil index and norm shells; GL₂/K identification; adjoint value for general π.
- RP.0: Jacobian 2Θ specialization; tangent local symbols.
- A2: theta bundle against the rigidified Poincaré bundle.
- R14.1, R14.5, R13.4a: content partly in sibling stages; R14.5's perfect Hecke pairing is R12.5. R12.3 is now re-pointed to R13.1.
- R16.2, R17.1, R17.3: GL₂ constituent comparison.
- MP.6 and MP.7: Baruch–Mao (flagged as unread in MP itself).
- TB.2, TB.3, TB.6: graph Green kernel; model measures.
- AF.3 and AF.5: measure normalization; non-holomorphic growth.
- AutomorphicPadicLFunctions L0, L3, L3h: stage text only, no packets.
- PadicMeasuresIwasawaAlgebras L1, L2, L4: infinite residue field.
- R07.2: nilpotent thickenings.
- R18.5: CM fixed sections, which the R18.5 packet says no R18 node plans.
- R19.1: Ramanujan bound.
- The TauCetiRoadmap layers used are partial in the expected way (they state
  the general objects; this roadmap specializes them).

**R2. Inputs with no owner.** Layer 2 rests on
`ArakelovGeometryAndAbelianHeights:R35.1`, a stage with status
`needs_source_decomposition` and no packet. Layer 9 uses three inputs that no
target or supplier states: Harris–Kudla's algebraicity of α(f, f_B), Prasanna's
integrality of α (Theorem 2.4), and Prasanna's explicit Waldspurger formula
(Theorem 3.2). All are now named in "Source and interface limits".

**Required revision.** For each R1/R2 item, choose the owner. Either the
supplier gains the target (a Part II where the supplier's scope ends), or the
notion is planned here with statement, hypotheses, source, API and Checks. Then
re-point the contract to the stage that actually contains the content. Most of
CM.5, HE.2 and AS.4 is Gross–Zagier-specific (Gross's lifting lengths, Zhang's
multiplicities, weight-two holomorphic projection) and could reasonably move
into Layers 6–7. The rest (AL.0 special functions, SR.2 toric Hom, A6
diagrams, R11.1, DT.3, ColemanIntegration and PadicHodgeRegulators
semistable cases) belongs with the suppliers.

## Source checks (all match)

| Target | Source, locator | Finding |
| --- | --- | --- |
| 6.47 | Yuan–Zhang, Annals 187, §7.1, pp. 585–586 | k_φ = L(1,η_v)/vol(E_v¹)·φ₁·W°′ (fraction confirmed from page image); c_φ on p. 586 |
| 6.55 | same, pp. 585–586 | W₀ = −[L(s,η)/L(0,η)]/[L(s+1,η)/L(1,η)]∏W°; c₀ and the I′ decomposition; c₀ = 2L′/L(0,η)+log|d| recomputed |
| 6.18 | same, §8.1, pp. 605–606; erratum items 8, 30, 31 | Z_* formula, w_U, Theorem 8.1 = YZZ Thm 3.17; ϕ for Φ, push-forward cycles, factor 1/2 for F=ℚ |
| 7.25 | same, p. 609; Theorem 8.6, p. 616 | coefficient of [t₂] is Ω_φ/[E^×∩U:μ_U]; i₀ and extended i_v |
| 7.28 | same, Lemma 8.7(1), p. 617 | B_v nonsplit: ½v(q(y₂)) |
| 7.50 | same, Lemma 9.4, p. 632 | i_w(P,P) = ⟨π⁻¹P_R − eP′, P′⟩ |
| 7.35 | Gross–Zagier, Invent. 84, II (5.5), p. 251 | statement as given |
| 7.15 (old numbering) | same, II (2.10)–(2.13), p. 239 | as given; target now removed as duplicate of AS.2.24 |
| 8.8 | Zhang, Sci. China Math. 53, §4.2, p. 587 | P_χ with Haar measure of volume 2L(1,η); Theorem 4.2.1 |
| 8.13 | same, §4.3, Theorem 4.3.1, p. 588 | Tian–Zhang conjugate-invariance |
| 9.6 | Jetchev–Skinner–Wan, arXiv v1, §5.1, p. 31 | Σ_cc, f_B normalization, R |
| 9.10 | same, Proposition 5.1.6, p. 34 | (1−a_ℓ₀+ℓ₀)⁻²((1+p−a_p)/p)²log² |
| 9.12 | same, Proposition 5.1.7 and proof, pp. 34–35 | (good), (irred_K), 𝔭-optimality, p−1>1 |
| 9.13 | Castella–Hsieh, arXiv v2, Proposition 3.8, p. 13 | interpolation formula and hypotheses (Heeg′), (ST), (c_o,pN⁺)=1 |
| 2.14 | Yuan, bigness manuscript, §A.6, p. 119 | descent of Arakelov metrics at real places |
| 5.3 (extra) | Cai–Shu–Tian, arXiv v2, (2.1), p. 13 | constant ζ_F(2)L/(2L(1,π,ad)) for volume 2L(1,η); probability version /4L(1,η)² |
| 8.15, 8.19 (extra) | same, Theorem 1.1, p. 2 | 2^{−μ(N,D)}·8π²(φ,φ)/(u²√|Dc²|)·ĥ_K, and /deg f |
| 4.7, 5.6 (new) | same, pp. 14, 23, 26–27, 30–31 | read from page images |

## Adversarial mathematics pass

| Statement | Instance or computation | Result |
| --- | --- | --- |
| 0.1, Conventions | f790474 vs a91d3aaf definitions read; rank 0 and rank 1 (37.a1) | convention corrected (item 1) |
| 0.3 | Γ_ℂ(1)=1/π; `frickeCompletedL` = λ/2 | correct; witness added |
| 0.4, Lean | w = 2, 4, 6 ↦ u = 1, 2, 3; real quadratic excluded | correct |
| 1.1, 1.3 | diagonal 2h_(O); Abel–Jacobi sign −B_x | correct |
| 2.2, 2.5, 2.7, 2.12 | g=2 masses; loop/bridge (Foster); total mass 0; log|f|² | correct |
| 3.4, 3.6, 3.8 | 11a3 (c = deg = 5); [n]; ω_f∧ω̄_f = −8π²i|f|²dx∧dy | correct |
| 4.7 (new) | n=c=0 ⇒ every factor 1; weight 2, K_v=ℂ ⇒ C = 4π³ | consistent with 4.5 |
| 5.3 | CST (2.1) in both measure normalizations | correct |
| 6.14, 6.31 | D=−3, N=1, n=±3: σ(3)=0, σ(−3)=2 | correct |
| 6.15 | every norm-m|D| ideal divisible by 𝔡 | correct |
| 6.16 | Mellin constant re-expanded | correct |
| 6.17 | C_{p^ν}·inverse = I exactly for p=2,3,5, ν≤4 | correct |
| 6.59 | L′_∞/L_∞(0,η) = −([F:ℚ]/2)(γ+log 4π) via ψ(½) | correct |
| 6.70, 6.72 | δ(0)R(0) = h/u; (1−ε/p)/(1−p⁻²) = (1+ε/p)⁻¹ | correct |
| 7.13 | k_{v,0} = ½log((1−λ)/(−λ)); λ=−1 gives ½log 2 | correct |
| 7.15 (new numbering) | Σ_{d|N}μ(d)d^{−s}/∏(1−p^{−2s}) = ∏(1+p^{−s})⁻¹ | correct |
| 7.37 | D=−7, p=3, N=2, q=23: −69 ≡ 1 mod 7, 3 inert, 2 split | correct |
| 7.69, 7.70 | q_v = p² (inert), p^k (ramified) | correct |
| 7.103, 7.106 | Kronecker limit constant; ψ(1) = −γ | consistent |
| 8.2, 8.8 | ℤ/3 cyclic shift, χ(σ)=ζ: (1,ζ,ζ²) ∈ A(χ) | correct |
| 8.3 | 11a1 over ℚ(√−11): w_∞=−1, w_11=−1 (split mult.) ⇒ +1 | correct |
| 8.16 | CST example: 9 = 2⁻¹·(9/2)·4 | correct |
| 9.2, Lean | 11a1 at p=5, 23; y²=x³+3x over 𝔽₅ has 10 points; p≥7 bound; p=1, a=2 | correct; Lean milestone tied to the definition |
| 9.7 | a_p=±1 ⇒ valuation −2, never zero | correct |
| 9.9 | 1+T; c·root; u(0)=2 | Checks added |

Generality audit: the Lean definitions are stated over general fields or
number fields, and the README says so where it uses them more narrowly
(`unitIndex` and imaginary quadratic K; `chiIsotypic` and characteristic
dividing #G).

## Duplication against current TauCetiRoadmap and Tau Ceti (a91d3aaf)

I searched current TauCetiRoadmap main (including the nine newer roadmaps and
`Completed/`) and the Tau Ceti library by object: Heegner, Gross–Zagier,
Waldspurger, toric periods, Arakelov and Green functions, Manin constant,
modular degree, Rankin, Petersson, L-functions, the Hasse bound and heights.
- No roadmap or library module states a Gross–Zagier, Heegner-point,
  Waldspurger or Arakelov target.
- What Tau Ceti has is used as is: canonical height, Néron–Tate pairing and
  regulator (convention now correct); Petersson cosets and positivity; old/new
  decomposition and strong multiplicity one; `hasse_bound`; and
  `frickeCompletedL`, cited in 0.3.
- Within the atlas, 7.15 and 7.34 duplicated AutomorphicSpectralTheory and are
  removed (item 4). 7.51, the level-N cusp expansion, is not in AS (AS.2.22 is
  level one), so it stays.

## Questions for the maintainer

1. **Tier and cycles.** GrossZagierAndArithmeticHeights is not in
   `upstream/CaraianiNewton.md`. At target level it is in a cycle with
   HeegnerPointEulerSystems: HE.0, HE.1, HE.6 and HE.7 cite GZ.0, GZ.3, GZ.5
   and GZ.8, while GZ cites HE.0–HE.2. It is likewise in a cycle with
   GeneralizedHeegnerCycles (GH.0 cites GZ; GZ cites GH.1 and GH.4).
   Upstream sequencing needs a bundle, or HE's and GH's citations of GZ moved
   down.
2. **Ownership for R1/R2.** Choose an owner for each item (see "Required
   revision").
3. **Packet propagation.** The accepted packets
   `GrossZagierAndArithmeticHeights--GZ.0.json` and `--GZ.8.json` were not
   edited (out of scope). They still carry the f790474 convention and the old
   target set. The package author's handoff lists further formulation
   corrections that should also go back to the packets.
