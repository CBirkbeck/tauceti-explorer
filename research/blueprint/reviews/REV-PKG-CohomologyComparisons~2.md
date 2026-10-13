# Independent package review, round 2: CohomologyComparisons

**Verdict: accepted.** All six package requirements hold after the corrections listed below. The three repairs R1–R3 required by the first review are resolved in the README, in the form that the binding 2026-10-12 shape requires. The suggested Lean file elaborates at the pins with `sorry` as its only warning. Ten of its former `sorry`s are now real proofs, which confirms those statements.

Reviewer: `independent-review-REV-PKG-CohomologyComparisons~2`

Date: 2026-10-13

Agent: Claude (Opus 5.5), session `claude-x4tBpq`

Issue: #9203

The package was inspected at atlas commit `0f6f96ae507a07513e2c69aa57e471673ee741bd`, after the round-2 revision PKG-CohomologyComparisons~2 (session `claude-gJRLxQ`, #9499). This session wrote neither package round and did not do the first review (session `codex-PdlqJB`).

## Package requirements

| Requirement | Result and evidence |
| --- | --- |
| 1. Upstream form | **Pass.** The README opens with `# Roadmap:` and a `**Summary.**` paragraph. It has Scope and ownership, Conventions, Exact supplier contracts, How to read the build, seven layers with `### k.n` prose subsections, each layer closing with Examples and Dependencies, then Downstream consumers and References. Every definition has a named API and a `**Checks.**` list; every theorem keeps its hypotheses and a locator. There are no target tables or field lists. Compared with TauCetiRoadmap AdicSpaces and LocalGaloisGroups. Size after this review: 166,269 bytes, 105 subsections. |
| 2. Fidelity to the plan | **Pass.** No subsection of the reviewed round-1 README was dropped. The sentences removed in round 2 were all rewritten, not lost; I checked them section by section against the previous version (0.1, 2.2, 2.18, 2.19, 3.7, 3.8, 6.1–6.3). The 83 accepted targets remain. R1–R3 are resolved (next section). Boundaries agree with the tier order (below). |
| 3. Own words | **Pass.** Every 10-word run of the README was compared with all fourteen source texts. The only matches are reference titles and stock phrases ("let f: X→Y be a proper smooth morphism", "compatible system of p-power roots of unity"). The README contains no source passage and no section-by-section summary. Locators were checked (Sources, below). |
| 4. No process | **Pass after correction.** The only process residue was the packet-style name `CP3.relative_filtered_prismatic_agreement`. It is renamed `relativeFilteredComparison`, with `_functorial` and `_canonical`, in README 6.3 and in the Lean closing comment. `*Needs:*` lines cite supplier layers, which are mathematical dependencies. |
| 5. Suggested.lean | **Pass.** See "Lean" below. Final `lean-check`: exit 0, 11 warnings, all `declaration uses sorry`, no other diagnostics. It has 521 lines and no sorry'd `def`, `abbrev` or `instance`. All definitions have real bodies over carriers at the pins (`PreTilt`, `WittVector`, `fontaineTheta`, `BDeRhamPlus`, `AdicCompletion`, `IsNilpotent.exp`, `Module.length`, `Submodule.torsion`, `Polynomial`). There are 15 `example`s, 13 of them now proved. |
| 6. metadata.toml | **Pass.** Exactly `topic = "math.NT"`. |

## The first review's repairs

The first review asked for Lean-typed interfaces with "admitted bodies" for the three moved-down constructions and the relative comparison. The binding shape of 2026-10-12 (PACKAGE_REVIEW.md) now forbids sorry'd data and any declaration that mentions it. The round-2 package therefore moved them into the README as targets with intended signatures, API and Checks. I judge this the correct resolution, and each one was checked against its source.

- **R1. Moved-down constructions.**
  - **3.7 `gradedBeilinsonSquare`.** The four corners, the homotopy h_i and the integral form χ_i^int into p^{−N(i)}LΩ_R, with N(i) depending only on i, match AMMN Construction 6.16 and Theorem 6.17 with its proof (pp.44–45). The local route through Corollary 3.9 (p.18) and τ_{[2i−1,2i]} matches the proof. The three Checks are correct. At i=0 the bottom arrow is the identity. At Spec F_p in weight one, φ−p=1−p is a unit, so Z_p(1)(F_p)=0. For R=Z_p, i=1, the square gives Q_p(1)(Z_p)=Q_p[−1], consistent with H¹=(Z_p^×)^∧_p for every p, including p=2.
  - **3.8.** The corner-by-corner inputs match AMMN: Definition 7.10 and Theorem 7.11 (p.52), Lemma 6.19 (p.45), Example 6.13 equation (54) (p.43), Construction 7.12, and Theorem 7.13 with its proof (pp.53–54).
  - **6.1 `panLogPeriod`.** The data, θ_log, ι, j, ∇_log and the group actions match Pan II §6.3.5–6.3.6 (pp.99–100). The presentation S_{i,r}, Ŝ_i matches DLLZ Definition 2.2.10 (p.13), and the connection ∇(e_a)=e_aδ(a′) matches DLLZ (2.2.13)–(2.2.15) (p.14). The local form matches DLLZ Proposition 2.3.15 (p.18) and Pan (6.3.3); the Poincaré sequence and Faltings extension match DLLZ Corollaries 2.4.2 and 2.4.5 (pp.20–21) and Pan (6.3.2).
  - **6.2 `panBasis`.** x=e₂/e₁ and U₁, U₂ match Pan II p.19. The three properties match Scholze, *On torsion…*, Theorem 3.1.2(i)–(iii) (Annals pp.971–972), which is stated for GSp_{2g} and used at g=1. `panBasis_inter` holds: a finite intersection of rational subsets of U₁ and of U₂ is rational in each, through the annulus.
- **R2. 6.3 relative filtered comparison.** Every load-bearing hypothesis of Guo–Reinecke Convention 10.12 and Theorem 10.13 (p.99) is present: the perfect prism p-completely flat over (A_inf,[p]_q), the section R→A⊗_{W(k)}O_K, B_dR(A)=(A[1/p])^∧_I[1/I], the tensor over Z_p(Spf(A)_η), and the I-adic filtration against the Hodge ⊗ I-adic filtration. The functorial and canonical forms match Remark 10.14 (pp.99–100). One addition went beyond the source: "compatible with the connections" in the canonical form. It is now marked as an additional target and sourced (see Corrections).
- **R3. 2.18 `RelativeInfinitesimalSite`.** The intended signature matches GR Definition 10.1 and Remark 10.2 (p.94). `envelope` and `envelope_selfProduct` are GR Lemma 10.3(i)–(ii) (p.94), and their proof sketches follow GR's proof; weak finality is kept and no uniqueness is claimed. `envelope_framing` is GR Example 10.5(2) (p.95), and `envelope_cech` is what Construction 10.6(1) evaluates.

## Sources

All fourteen sources were read from the public versions in the README's References. The SHA-256 prefixes of the six sources new in round 2 match the package author's record: BMS1 `285f7d20`, GR `3c49a5f2`, AMMN `2a0224b2`, Pan II `0873b61a`, DLLZ `dccd18f6` and Scholze 2015 `ebac854f`.

- **Locators.** Every locator new in round 2 was opened. A further 60 locators were checked by finding the statement's page in the PDF text. Statement content was read for about 20 of them:
  - BMS1 Example 3.16; Definition 3.22; §4.3–4.4 (the map 𝔖→A_inf, T↦[π♭]^p, Frobenius on W(k), p.44); Lemma 4.18 (p.39); Theorem 2.1 and Remark 2.4; Lemma 13.12; Theorem 13.19 and Remark 13.20; Remark 14.4; Theorems 14.5 and 14.6.
  - Česnavičius–Koshikawa §7.1 (X_k purely d-dimensional), Theorems 7.9 and 7.12, Lemma 7.11, §9.1 (N=−d/dT, φ(T)=pT, Nφ=pφN), Proposition 9.2, Remark 9.3, Theorem 9.5.
  - Colmez–Nizioł Theorems 6.2, 6.4 and 6.8, Remarks 6.7 and 6.10.
  - Betts–Stix Propositions 3.19 and 3.20 and Remark 3.21.
  - Bhatt–Scholze Notation 18.1 and Theorem 18.2.
  - Scholze 2013 Theorems 8.4 and 8.8; the Scholze erratum, items (1)–(3).
  - Guo Theorem 1.2.7 and Corollary 1.2.11.
  - Colmez–Dospinescu–Nizioł Proposition 3.12.
  - GR Theorem 9.15 and Corollaries 10.8–10.9.
- **Result.** All are correct except one: GR Lemma 10.3 and its proof lie entirely on p.94, not pp.94–95 (corrected).
- **Possible mistake in a source, confirmed.** Guo–Reinecke Example 10.5(2) (p.95) writes the envelope of an enlarged framing as R′_{B_dR⁺}[[x_u−u; u∈Σ]], with one variable for every u∈Σ, citing "the same proof as" BMS1 Lemma 13.12. BMS1 Lemma 13.12(i)–(ii) (p.110) has variables only for u≠T₁,…,T_d: the chart coordinates lift by étaleness. The dimension count confirms this. Z_{B_dR⁺} has relative dimension |Σ|, while the displayed ring has d+|Σ|. README 2.18 states the corrected form as a Check. This is an errata item for GR (PROTOCOL §18); the packet is not edited by a package review.

## Adversarial mathematics pass

| Statement | Instances tried | Result |
| --- | --- | --- |
| `IsPrimitiveRootSystem` (untilt ε=1, untilt ε^{1/p}≠1) | ε=1; p=2 (ζ₂=−1); Mathlib's `untilt_iterate_frobeniusEquiv_symm_pow` | Gives primitive p^n-th roots for all n; ε=1 fails (proved in Lean) |
| μ=ξ·φ⁻¹(μ) | any ε, including ε=1 | **Proved in Lean** (geometric sum, φ⁻¹[ε]=[ε^{1/p}]); no hypothesis on ε needed, and the hypothesis that O is p-adically complete is dropped |
| θ(ξ)=0 needs a domain | ζ_p≠1, ζ_p^p=1 | (ζ−1)Σζ^i=0, so a domain is needed and enough |
| w(ξ)=p, w(μ)=0 | p=2 (ζ=−1 ≡ 1 mod 𝔪); p odd | w(μ)=0 **proved in Lean**; w(ξ)=p needs only 𝔪∋p prime |
| ker θ=(ξ) hypotheses | Krull dim ≤1 with p a non-unit and char 0 | Forces dim 1, so the Mathlib vocabulary pins O=O_C exactly |
| Witt reduction and Frobenius | naturality of the Witt Frobenius in ring maps | Holds for any ring map |
| `level_of`, envelope not the first quotient | ℚ[X]→ℚ, X↦0 | **Both proved in Lean**: level 1 of X is 0, level 2 is nonzero |
| `existsUnique_lift` | ker e finitely generated vs not | Uniqueness uses ker(level m)=(ker e)^m·D(e), which needs finite generation; the hypothesis is kept |
| `monodromyTransport` sign | N e₁=e₀; c=0; N=0; N²=0 | e₁↦e₁−ce₀ **proved in Lean**; cocycle `monodromyTransport_add` **proved in Lean**. Re-derived ρ_{πu}=ρ_π∘exp(−log(u)N) from N_Bst=−d/dT and T_{πu}=T_π+log u |
| Tate (φ,N) | φ=diag(1,p), N=E₁₂ | Nφ=pφN and φN≠pNφ when p²≠1 **proved in Lean**; slopes 1→0 under N match CK §9.1 |
| `truncatedTorsionLength` | n=0; ℤ; ℤ/p² vs (ℤ/p)² | n=0 and ℤ **proved in Lean**; values (1,2) at n=1 and (2,2) at n=2 checked by hand; using the length of M_tor fails |
| `projectiveBundleRelation` | rank 1; trivial rank 2; L⊕M | h−c₁ and h² proved; (h−a)(h−b) **proved in Lean**; the sub-line convention fails rank 1 |
| Trace-period direction | (c_dR⊗a^{−r})cl_ét=cl_dR in scalars | Gives c_dR(cl′_ét)=α^r cl_dR, consistent with the P¹ check tr_dR(c_dR x)=α |
| BMS1 Thm 14.5(ii)/14.6(ii) direction | — | Étale length ≤ crystalline length, as stated |
| 3.7 Checks | i=0; F_p in weights 0 and 1; Z_p at i=1 | All correct (see R1) |
| 6.3 Checks | identity morphism; genus-g curve; two sections | Ranks 1,g,g,1 and HT weights 0,−1 (each with multiplicity g) are correct; the section dependence is real |
| GR Ex. 10.5(2) normal form | torus coordinates plus one redundant unit | One formal variable (BMS1 L13.12); GR's count fails |
| Base change sequence (1.10) | [Z_p —p→ Z_p] ⊗^L F_p | H⁰ changes from 0 to F_p = H¹[p]; correct |

No statement needed a new hypothesis. The generality of the README matches the Lean signatures for every kept declaration.

## Lean

- **Starting file:** `lean-check` exit 0, 21 `sorry` warnings, nothing else.
- **Proofs added.** The following were proved first in a scratch file at the same pins:
  - `muOf_eq_xiOf_mul`, with `omit [IsAdicComplete …] in`; the lemma holds for any O;
  - `wittReduction_muOf`, `InfinitesimalEnvelope.level_of`, `truncatedTorsionLength_zero` and `monodromyTransport_add`;
  - the examples for ℚ[X] levels, monodromy e₁↦e₁−ce₀, the Tate (φ,N) relation, ℤ torsion-free and the L⊕M factorization.
- **Final file:** exit 0, 11 `sorry` warnings, no other diagnostics.
- **Still `sorry`:** nine theorems and two examples.
  - Theorems: `fontaineTheta_xiOf`, `wittReduction_xiOf`, `wittReduction_comp_ainfFrobenius`, `ker_fontaineTheta`, `ker_fontaineThetaTilde`, `standard_isNormalized`, `InfinitesimalEnvelope.complete`, `exists_map` and `existsUnique_lift`.
  - Examples: the identity envelope's bijectivity, and the ℤ/p² versus (ℤ/p)² lengths.
- **Signatures against the README:** 12 spot-checked, every hypothesis present and none vacuous. They are `IsNormalized`, `standard_isNormalized`, `fontaineTheta_xiOf`, `wittReduction_xiOf`, `ker_fontaineTheta`, `ker_fontaineThetaTilde`, `complete`, `exists_map`, `existsUnique_lift`, `monodromyTransport_add`, `truncatedTorsionLength` and `projectiveBundleRelation`.
- **Coverage:** every README definition is a declaration or is named in the closing comment.
- **Pinned declarations:** read in the lean-check tree, Mathlib `082e2d3`. They are `PreTilt.untilt` (via `teichmuller`), `WittVector.fontaineTheta_teichmuller`, `BDeRhamPlus` (the ker θ[1/p]-adic completion of W(R♭)[1/p]), `AdicCompletion.evalₐ_of`, `AdicCompletion.isAdicComplete (h : I.FG)`, `IsNilpotent.exp_add_of_commute`, `IsNilpotent.exp_eq_sum` and `WittVector.frobeniusEquiv`.

## Tiers and gaps

CohomologyComparisons is tier 14 in `upstream/CaraianiNewton.md`. Every supplier is lower:
- AInfCohomology, PadicHodgeTheory and PrismaticCohomology (tier 13);
- CompletedCohomologyPartII (tier 12);
- FiniteFlatGroupsAndIntegralPadicHodgeTheory, ClassicalAdicEtaleCohomology and EtaleDualityAndPerverseSheaves (tier 10);
- CrystallineCohomology and DerivedDeRhamCohomology (tier 9);
- EnhancedDerivedSheaves and AlgebraicModuliForArithmeticGeometry (tier 4);
- AdicSpacesPartII, AdicEtaleGeometry and PerfectoidSpaces (tier 3).

The two required moves are done: HodgeTateAndCanonicalSubgroups to 6.1, and PerfectoidShimuraVarieties to 6.2. RefinedTraceMethods, outside the 94, appears only as a consumer; the graded square it would supply is built in 3.7. The README contains no `FoundationsAndLibraryIntegration` or `UPSTREAM:` id.

The Downstream consumers section listed three earlier-tier roadmaps as consumers: ArithmeticGaloisRepresentations (tier 7), WeightsInEtaleCohomology (tier 12) and CompletedCohomologyPartII (tier 12, also a supplier). It now says that these do not depend on this roadmap, and that their geometric applications use its realizations.

The accepted plan's 16 gaps and 48 supplier requests are unchanged. The package author's handoff lists the ones the README spells out as supplier contracts: PR.7, CR.3, CR.6, R07.4, AI.5, DD.2 and CC.8.

## Duplication against current Tau Ceti

TauCetiRoadmap `main` at `0d144d0` and the Tau Ceti library at `a91d3aaf` were read without building. Searches covered B_dR, A_inf, θ, untilt, crystalline, prismatic, Hyodo–Kato, Hodge–Tate, nearby cycles, syntomic, the Faltings extension, monodromy, nilpotent exponentials and module length.

- **AdicSpaces Layer 6.1** has A_inf=W(𝒪_F) only as a Huber ring for the Fargues–Fontaine curve, and puts B_dR, untilts and θ out of scope. A one-clause boundary was added to Scope and ownership.
- **Current Tau Ceti library.**
  - `WittVector.frobeniusEquiv_symm_teichmuller` is the step φ⁻¹[r]=[r^{1/p}] used in `muOf_eq_xiOf_mul`.
  - `TauCeti/RingTheory/Nilpotent/Exp.lean` handles exp(t·x) for integers t; the transport here takes scalars in K.
  - `TauCeti/RingTheory/Length.lean` concerns lengths of quotients M/aM, not truncated torsion length.

  None is a duplicate. The first two are now named in the supplier contract, and `TauCeti.PadicTateTwist` is cited as before.
- **Result:** no target was removed.

## Corrections made in this review

1. README 6.3: renamed `CP3.relative_filtered_prismatic_agreement`, `_functorial` and `_canonical` to `relativeFilteredComparison`, `_functorial` and `_canonical`. The same rename was made in the Lean closing comment.
2. README 6.3: wrote out the connections in the canonical form (Gauss–Manin ⊗ 1 + 1 ⊗ ∇ against 1 ⊗ ∇). The text now says that GR Remark 10.14 states only the filtered isomorphism. Horizontality is an added target, proved from GR's identification with Scholze's relative comparison (GR p.100; Scholze 2013, Theorem 8.8(ii), p.52). The 6.3 locator now cites Scholze 2013 Theorem 8.8 (pp.51–52).
3. README 2.18: corrected the locator for GR Lemma 10.3 and its proof to p.94.
4. README 5.1: "supplier Lemma 4.18" now reads "BMS1 Lemma 4.18, p.39, supplied by AInfCohomology AI.5".
5. README 0.1: added that the B_cris factorization of the dictionary is not a field of the Lean structure, and is stated with PadicHodgeTheory R06.1's B_cris for a primitive ε.
6. README Scope and supplier contracts: added the AdicSpaces 6.1 boundary and the current-library neighbours (see Duplication).
7. README Downstream consumers: rewritten to agree with the tier order (see Tiers).
8. Suggested.lean: ten proofs replace `sorry` (listed under Lean).
9. Suggested.lean: the module note now reads "proved by `sorry` unless a short proof exists".
10. Suggested.lean: the docstring of `projectiveBundleRelation` now attributes the relation to Grothendieck's definition of Chern classes, to which Betts–Stix's proof of Proposition 3.20(8) reduces. Betts–Stix do not state the relation.
11. Suggested.lean: the closing comment now also gives "constructions rather than light definitions" as a reason for omission, which covers `InfinitesimalEnvelope.map` and `lift`, whose carriers do exist. The comment was reflowed to 100 columns.

## Validation

- `lean-check research/blueprint/packages/CohomologyComparisons/Suggested.lean`: exit 0 at Mathlib `082e2d37e8` / Tau Ceti `f790474`. 11 `sorry` warnings, nothing else. Each check ran on its own, with more than 100 GB of memory available; no language server, build or cache command was used.
- `python3 research/blueprint/intake.py check-files` on the four package files: 0 problems.
- `python3 scripts/check_blueprint.py research/blueprint/packets/CohomologyComparisons.json` (input unchanged): 0 errors, 0 warnings.

## Questions for the orchestrator

- **WeightsInEtaleCohomology (tier 12).** Its accepted package still cites "CohomologyComparisons CP.4" for the semistable period comparison (README line 28), which is an upward citation. That package needs to state the comparison as a hypothesis or move it down.
- **Errata.** The Guo–Reinecke Example 10.5(2) slip described above should be recorded as an errata item.
