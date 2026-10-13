# PKG-CohomologyComparisons~2 — #9160

Claude (Opus 5.5), session `claude-gJRLxQ`, 2026-10-13. Claim confirmed by the swarm bot on #9160. None of the manager's priority issues was available; every `top` issue carried the maintainer's 2026-10-13 blocking comment, so this was taken as the next available `focus` package (tier 14 in `upstream/CaraianiNewton.md`). Revision round 2 of the package, after the `needs_changes` verdict of REV-PKG-CohomologyComparisons (R1–R3). `review.json` is left in place for the next reviewer.

## What changed

### Suggested.lean, rewritten to the 2026-10-12 shape

The previous file (3,184 lines, 419 `sorry` warnings) was built on `sorry`-bodied data: carriers such as `Acris`, `Bcris`, `Bst`, the derived base-change functors, period-ring maps, formal schemes and cohomology objects were all `def … := sorry`. The binding 2026-10-12 shape (PACKAGE_REVIEW.md) forbids that, so the file was rewritten from scratch instead of patched. It now has 478 lines and holds only:

- **Layer 0**, over Mathlib's `PreTilt`, `WittVector.fontaineTheta`, `WittVector.frobeniusEquiv`, `PreTilt.untilt` and `BDeRhamPlus`:
  - real-bodied `Ainf`, `ainfFrobenius`, `fontaineThetaTilde`, `epsRoot`, `IsPrimitiveRootSystem`, `muOf`, `xiOf`, `xiTildeOf`, `ainfToBdRPlus`, `residueOfTilt` and `wittReduction`;
  - theorems `muOf_eq_xiOf_mul`, `fontaineTheta_xiOf`, `wittReduction_xiOf`, `wittReduction_muOf`, `wittReduction_comp_ainfFrobenius`, `ker_fontaineTheta` and `ker_fontaineThetaTilde`;
  - the data-only structure `SpecializationDictionary`, its `IsNormalized` predicate, all seven packet API names plus `thetaTilde_xiTilde` (real proofs from `IsNormalized`), a real-bodied `SpecializationDictionary.standard` that takes A_cris as a parameter, and `standard_isNormalized`.
  - O_C is described in Mathlib's vocabulary (`ValuationRing`, `Ring.KrullDimLE 1`, `CharZero`, `IsAlgClosed (FractionRing O)`), replacing the old custom class `IsIntegersOfC`.
- **Layer 2**: `InfinitesimalEnvelope` = `AdicCompletion (RingHom.ker e) P`, with `of`, `level`, `level_of`, `ext` (real proof), `complete`, and `exists_map` and `existsUnique_lift`. The last two state the universal properties instead of keeping the old `sorry`-bodied `map` and `lift`.
- **Layer 4**: `monodromyTransport c N := IsNilpotent.exp (-(c • N))` with `_zero_left`, `_zero_right` (real proofs) and `_add`.
- **Layer 5**: `truncatedTorsionLength` (via `Module.length` and `Submodule.torsion`) with `truncatedTorsionLength_zero`.
- **Layer 6**: `projectiveBundleRelation`, the quotient-line relation as a polynomial.
- **Examples:** 15 `example`s, of which 8 have real proofs: the ε=1 negative controls (μ=0, ε=1 not primitive, and standard μ=0 at ε=1), θ_standard = Mathlib's θ, w(ξ)≠0 when p≠0, the period-composite check, and the rank-one and trivial rank-two relations.
- **Closing comment:** lists every README-only definition and API name.

### README.md

The README now names every Lean declaration, and every README definition is either a declaration or appears in the closing comment.

- **R1, the three moved-down constructions.** Each is now a README target with an intended signature in a `text` block, its API stated lemma by lemma, and at least three Checks. They stay out of the Lean because their carriers (sites, period sheaves, enhanced squares, perfectoid towers) do not exist at the pins. The 2026-10-12 shape forbids exactly the "admitted bodies" the review proposed for them.
  - **3.7 `gradedBeilinsonSquare`**: four corners `red_i`, `s_i`, `χ_i`, `ι_i`, the homotopy `h_i` and the integral form `χ_i^int` into p^{−N(i)}LΩ_R. The left arrow comes from AMMN Construction 6.16, p.44. API: `_map`, `_zero`, `_cartesian`, `_integral` and `_local`. The weight-one check is now computed for R=Z_p and matched against PrismaticCohomology `PR.4/syntomic-not-generic-fibre-etale`.
  - **3.8**: separates the inputs corner by corner, as the review asked. The upper left is AMMN Definition 7.10 and Theorem 7.11, consumed as PrismaticCohomology `PR.4/nearby-cycles-comparison`. The upper right uses Lemma 6.19, the LWΩ Künneth formula and Example 6.13, equation (54). The lower row uses Construction 7.12 and the proof of Theorem 7.13.
  - **6.1 `panLogPeriod`**: the data (V₀, cusp log structure, Kummer and pro-Kummer sites, the tower V∞) and the sheaf with θ_log, ι, j, ∇_log and the group actions. The DLLZ presentation is cited at Definition 2.2.10, pp.12–13, and (2.2.13)–(2.2.15), p.14. API: `_restrict`, `_theta`, `_local` (DLLZ Proposition 2.3.15; Pan (6.3.3)), `_connection` (DLLZ Corollary 2.4.2) and `_faltings` (DLLZ Corollary 2.4.5; Pan (6.3.2)).
  - **6.2 `panBasis`**: x=e₂/e₁, the charts U₁ and U₂, and the basis of finite intersections of their rational subsets (Pan II p.19). API: `panBasis_isBasis`, `_perfectoid`, `_finiteLevel` and `_inter` (Scholze 2015, Theorem 3.1.2(i)–(iii), pp.971–972). The Checks were sharpened: 0 lies in U₁ but not U₂; intersection stability; density but not surjectivity of the finite-level colimit.
- **R2, 6.3 `CP3.relative_filtered_prismatic_agreement`.** Restated with all load-bearing hypotheses:
  - Guo–Reinecke's K; f proper smooth with Y=Spf R; T a crystalline Z_p-lisse sheaf with its analytic prismatic F-crystal; (A,I) ∈ Y_Δ perfect and p-completely flat over (A_inf,[p]_q) with q=[ε];
  - the section R→A⊗_{W(k)}O_K;
  - B_dR(A)=(A[1/p])^∧_I[1/I];
  - the right-hand tensor over Z_p(Spf(A)_η);
  - the I-adic filtration against the Hodge ⊗ I-adic filtration.

  `_functorial` and `_canonical` give the Remark 10.14 sheaf and OB_dR forms. The section and the connection stay visible, the proof route through GR Theorem 9.15 (p.92) is given, the PR.7 limitation is kept, and three Checks were added. Theorem 10.13 is not stated in Lean (no carriers at the pins); the README states it with its exact range rather than shrinking it.
- **R3, 2.18 `RelativeInfinitesimalSite`.** Full intended signature from GR Definition 10.1 and Remark 10.2, p.94. Added `envelope` (weak finality, Lemma 10.3(i)), `envelope_selfProduct` ((n+1)-fold self-products as diagonal neighbourhoods in Z^n over Y_K, Lemma 10.3(ii)), `envelope_cech` (the Čech nerve that 2.19 now evaluates explicitly) and `envelope_framing` (Example 10.5(2)), with proofs sketched from Lemma 10.3's proof and two new Checks. Weak finality is kept; uniqueness is not asserted.
- **Other README changes:**
  - **0.1**: the dictionary is split into data and `IsNormalized`, the Lean names are listed, and a geometric-sum Check (μ=ξ·φ⁻¹(μ)) is added. Locators added: BMS1 §3.1, p.20 (θ_r=θ̃_rφ^r) and Lemma 3.12, p.23.
  - **2.2**: the API is matched to Mathlib's `AdicCompletion.evalₐ`, `ext_evalₐ` and `liftRingHom`; `lift_unique` now records why finite generation gives continuity.
  - **4.5**: `monodromyTransport` added with its API and three Checks, plus the Tate-curve (φ,N) witness.
  - **5.2**: `truncatedTorsionLength` added with its API and three Checks.
  - **6.8**: `projectiveBundleRelation` added with three Checks, including the split rank-two factorization.
  - The supplier-contract paragraph now says what Suggested.lean declares, and the README opens with the required `**Summary.**` paragraph.
  - README size: 164 KB.

No accepted target was dropped; all 83 accepted targets remain in the README. No packet, reader document or blueprint suggested file was edited.

## Validation

- `lean-check research/blueprint/packages/CohomologyComparisons/Suggested.lean`: exit 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. 21 warnings, all "declaration uses `sorry`"; no errors, no other warnings, and only `#check` info output. One check ran at a time, with memory above 20 GB and no language server.
- No `sorry`-bodied `def`, `abbrev` or `instance`; 478 lines.
- `python3 scripts/check_blueprint.py research/blueprint/packets/CohomologyComparisons.json` (unchanged input): 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.

## Adversarial mathematics pass (new and changed statements)

| Statement | Instances tried | Result |
| --- | --- | --- |
| θ̃ = θ∘φ⁻¹, ξ̃ = φ(ξ) | BMS1 θ_r := θ̃_rφ^r (p.20); θ̃(φξ)=θ(ξ) | Convention confirmed; ξ̃=φ⁻¹(ξ) recorded as a failing alternative |
| μ = ξ·φ⁻¹(μ) | any ε, including ε=1 (both sides 0) | Holds with no hypothesis; Lean states it without hε |
| θ(ξ)=0 | O a domain, ζ_p≠1, ζ_p^p=1 | Needs a domain only; Lean hypothesis `[IsDomain O]` |
| w(ξ)=p, w(μ)=0 | p=2 (ζ=−1: (ζ−1)²=4∈2O), p odd | Needs only 𝔪 prime with p∈𝔪; no O_C hypothesis |
| ker θ=(ξ) | O = p-complete, rank-one, char-0 valuation domain with algebraically closed fraction field | Exactly O_C; not stated more generally |
| `IsPrimitiveRootSystem` | ε=1 | Fails (proved in Lean); the untilts of ε^{1/p^n} are primitive p^n-th roots |
| Envelope of the identity; ℚ[X]→ℚ | B=0; X mod (X) vs (X)² | Bijective; level 1 is 0, level 2 is nonzero |
| `existsUnique_lift` | ker e not finitely generated | Hypothesis kept; uniqueness argued from ker(level m)=(ker e)^m·D(e) |
| `monodromyTransport` | c=0; N=0; N²=0 cocycle; e₁ ↦ e₁−ce₀ | Sign exp(−cN) pinned; exp(+cN) fails |
| Tate (φ,N) | φ=diag(1,p), N=E₁₂ | Nφ=pφN holds; φN=pNφ fails when p²≠1 |
| `truncatedTorsionLength` | n=0; ℤ; ℤ/p² vs (ℤ/p)² at n=1,2 | 0; 0; (1,2), (2,2); using length of M_tor fails |
| Finiteness of truncated length | general noetherian local ring, k[[x,y]] with π=x | False there; API restricted to DVRs |
| `projectiveBundleRelation` | rank 1; trivial rank 2; L⊕M | h−c₁; h²; (h−c₁L)(h−c₁M); sub-line sign fails |
| 2.18 self-products | X=Y, Z=Y_K; products over Spa K | Constant Čech nerve (m≥e); products over Spa K fail |
| 2.18 framing normal form | d torus coordinates plus one redundant unit | One formal variable; one per element of Σ has the wrong dimension (see source note) |
| 3.7 graded square | i=0; Spec F_p in weights 0 and 1; R=Z_p, i=1 | red_0 an equivalence; Z_p(1)(F_p)=0; Q_p(1)(Z_p)=Q_p[−1], matching PR.4 |
| 3.7 cartesian | cofibres | cofib(red_i)≃(LΩ/LΩ^{≥i})_Qp is the equivalent formulation |
| 6.2 basis | 0 and ∞ in the two charts; annulus; colimit density | U₁ and U₂ alone fail intersection stability; surjectivity fails, density holds |
| 6.3 relative comparison | X=Y=Spf O_K, T=Z_p; genus-g curve; two sections | Identity on B_dR(A); weights 0 and −1 with multiplicity g; only the OB_dR form is section-free. Fixed the tensor base to Z_p(Spf(A)_η) |

## Possible mistake in a source

Guo–Reinecke, Example 10.5(2), p.95, writes the envelope of an enlarged framing as R′_{B_dR⁺}[[x_u−u; u∈Σ]], with one variable for every u∈Σ, citing the proof of BMS1 Lemma 13.12. Counting dimensions shows this cannot be right as written. Z has relative dimension |Σ| and the lift X_{B_dR⁺} has relative dimension d, so the completion has |Σ|−d formal variables, one for each redundant unit, as in BMS1 Lemma 13.12(ii). For Σ consisting of torus coordinates alone (|Σ|=d) the envelope is R′_{B_dR⁺} itself. The README states the corrected form (2.18, last Check). This is recorded here for a later errata job and was not entered in the packet.

## Current-upstream duplication audit

TauCetiRoadmap `origin/main` at `3d446cf15d3d27ad65ade67b2f2e3c04366d650a` (2026-10-13) and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were read without building. I searched every roadmap README and Suggested.lean for B_dR, A_inf, crystalline, prismatic, Hyodo–Kato, Hodge–Tate, `fontaineTheta`, period rings, nearby cycles and syntomic.

- AdicSpaces Layer 6.1 defines A_inf=W(O_F) only as a Huber ring for the Fargues–Fontaine curve, and lists B_dR, B_cris, untilts and θ as out of scope.
- The other hits (StableReduction's syntomic morphisms, DifferentialGeometry's and AlgebraicTopology's real de Rham comparisons, DGAInfinity's A∞) are unrelated.
- Tau Ceti's current library has `TauCeti.PadicTateTwist` but no period rings, θ or comparison theory.

No target was removed.

## Supplier work remains (unchanged by packaging)

The accepted plan's 16 gaps and 48 requests stand. The ones the next reviewer should keep in view:

- PR.7 must cover analytic prismatic F-crystals and GR Theorem 9.15 over a base Y (6.3).
- CR.3 must supply the affine Frobenius-isogeny/residue-section input of BMS1 Proposition 13.21 (3.1).
- CR.6 must supply the overconvergent Hyodo–Kato realization over F^{nr}, and the Banach–Colmez and stable-range syntomic inputs of Colmez–Nizioł Theorem 6.4 need an early supplier (4.8–4.10).
- R07.4 must supply the all-weight Kisin functor (5.4).
- AI.5 perfectness must not depend on this roadmap's comparisons.
- DD.2 must supply AMMN's Hodge-completed tensor (3.8).
- CC.8 must supply the early modular tower without citing Pan's later comparisons (6.1, 6.2, 6.11–6.15).

## Source versions read

All public PDFs; hashes match the previous handoff's reproduction table:

- Guo–Reinecke 2203.09490v3 (`3c49a5f2…`)
- AMMN 2003.12541v2 (`2a0224b2…`)
- Pan II 2209.06366v1 (`0873b61a…`)
- BMS1 1602.03148v3 (`285f7d20…`)
- DLLZ log-RH author PDF (`dccd18f6…`)
- Scholze, Annals 182 (2015) (`ebac854f…`)

No source text was committed.

## Next step

Independent package review (round 2). Nothing in this job remains open.
