# Independent review: PAPER-BEUZARTPLESSIS-CHAUDOUARD-25

**Verdict: revise.** Finished by Codex, session `codex-c83e7a`, 24 September 2026, for issue #1349. The extraction was written by Claude Code `cc-39fac3`, PR #2050; its source-file history and PR authorship were checked before claiming. This reviewer did not write that extraction. The corrected extraction is partial; all eight routes are rejected until the concrete gaps below are resolved.

The original 69-item extraction correctly identifies the main direction of the paper, but its completeness claim is unsupported. Many entries bundle several independent definitions and theorems, and most deep suppliers were explicitly unread. The review also found transcription errors, unsupported planned statuses, and Appendix A statements false outside the component used in the proof. Clear corrections have been applied in place. There are now **69 items (6 planned, 63 missing), 8 routes, 19 reviewed source findings**, and six remaining gap groups.

## Reading and verification scope

Read all published pp.1–98 afresh, including proofs and bibliography. Read the arXiv v1 Appendix A pp.84–85 and selected unramified-calculation pages. The published acknowledgements credit a correction of an earlier Proposition 8.7.2.1; the extraction uses the published formula. Read these primary suppliers at the specified locators: BPLZZ Annals 194 (2021), pp.548,556–559,568–574; BPCZ2022 Proposition 2.8.4.1, printed pp.227–228; Kemarsky2015 pp.579–582; Atiyah–Bott1968 pp.457–460 from page images; Chaudouard’s author version §§7.2.1–7.3.2, pp.77–80. These are selected supplier checks, not a claim to have read every cited paper or to have closed their recursive dependencies.

- [published.pdf](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2E9DFB9FC7A671B5530E47E3A37D1E7E/S2050508625000083a.pdf/the-global-gan-gross-prasad-conjecture-for-unitary-groups-ii-from-eisenstein-series-to-bessel-periods.pdf); SHA-256 `d0e0ef8c411a110497c6fa184d36b8a416d61710b2bd05506f36d1e65ba43659`.
- [preprint.pdf](https://arxiv.org/pdf/2302.12331v1); SHA-256 `12c3ea96dfa3b182105947a34f4b8214d65f86dedff7c2abce234cb064b6611a`.
- [blzz-published.pdf](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/11998-annals.2021.194.2.5.pdf); SHA-256 `d4e28e0d8b36794d6c537d054fcd03846013e55a365addb785251c4e5009851e`.
- [blzz-v3.pdf](https://arxiv.org/pdf/1912.07169v3); SHA-256 `f2834146d4fee02b38c4849ee9a7ef76a3dbc1131e7eef799e6f95b0f0d0ac13`.
- [bpcz-published.pdf](https://www.numdam.org/item/10.1007/s10240-021-00129-1.pdf); SHA-256 `a07a6143d3e71f1eca31b6ba9b774bec325a7de07c7417b7796486a77df13794`.
- [kemarsky.pdf](https://www.numdam.org/item/10.1016/j.crma.2015.04.002.pdf); SHA-256 `017c177190d08f739d6c188c14ac5491bb04ca8cfc7ae112c182a9421aec54ba`.
- [ab68.pdf](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/abott2.pdf); SHA-256 `aa2780b734157b421f5316863ac2b2c4af1dc852ca33cebca09e9d1bc4c7c70b`.
- [chaud-spectral.pdf](https://webusers.imj-prg.fr/~pierre-henri.chaudouard/Spectral-sym-selecta.pdf); SHA-256 `4136f9954feefd1b3a0984c139b72c5854b1fa2d09053c76fe0040cd0e1114d8`.

The refreshed Cambridge download carries a different timestamp watermark from the extractor’s copy; a changed PDF hash alone does not establish a mathematical revision. Primary article, arXiv version history, Crossref record and both author pages were checked for corrections on 24 September. The individual findings record those searches. No separate correction to these findings was located; this is not a claim of exhaustive absence.

## Library and ownership checks

Searched all **9,055 Mathlib Lean files** at `082e2d37e8b0463410cdb532e111cd43d5a66174` and **5,489 Tau Ceti Lean files** at `f790474821cf4256814db967cb154e7af3d0c369`. Queries were mapped to all 69 item IDs, including Arthur/GGP/base-change parameters; truncation, kernels and Eisenstein series; Flicker–Rallis/Asai/Rankin–Selberg/Whittaker periods; unitary dual and multipliers; Kirillov/mirabolic/Bessel formulas; and Borel–Weil/Lefschetz/Weyl/Cauchy characters. No implementation of these specialized targets was found. Near hits were checked: modular Eisenstein series live on the upper half-plane, Bessel potentials are Sobolev Fourier multipliers, and generic finite-dimensional representation characters do not prove the disconnected character formula. This is scoped search evidence, not a theorem that no alternative encoding exists.

Searched all 2,007 current atlas stages, inspected every cited layer and the relevant reviewed coverage entries. AA/AF/AS/AL audits record preliminary building blocks, not these advanced period identities. The current coverage map has no entry at the cited ML.4, ML.5 or ET.6 keys and no matching entry for the cited upstream LieGroups/ClassicalGroups/SchurWeyl layers; absence of an audit entry was not treated as implementation or as proof of absence. Their authoritative descriptions were read. Upstream RootSystems/ClassicalGroups/LieGroups establish the expected ownership boundaries and granular standard.

Six planned statuses are retained: 14 (AS.3/AA.3), 48 (ML.4), 59 (AL.3), 64 (LieGroups Layer 8), 68 (AS.1–AS.2), 69 (AF.2–AF.3/AS.4/AA.2). These are planned directions, not library implementations or accepted proof closure. Item 49’s exact GRS theorem is not explicit in ML.5; it is now a missing source request. Item 60’s connected Cauchy/Schur inputs are planned, but its full Frobenius-component identity is not, so the consumer adapter is now missing.

Read the candidate routes of BPLZZ21, BPCZ22, Jiang–Zhang20 and Zhang21. Keep their shared JacquetRallisRelativeTraceComparison, GanGrossPrasadConjecturesForClassicalGroups, AutomorphicLFunctionsPartIIAsaiAndGLnPeriods and AutomorphicSpectralTheoryPartIISchwartzMultipliers identities. Jiang–Zhang’s TwistedAutomorphicDescents imports classical GRS from ML.5; it is not a replacement owner for that input. A directional screen found no reason to invent parallel candidates. No full stage-level acyclicity certificate is claimed before the missing dependencies are extracted.

## Corrections applied

- 27, 29: removed the extra conjugation of J; checked the page image and the unit-phase basis-change test.
- 28: distinguished the centrally averaged coefficient from the unaveraged coefficient; read the primary supplier.
- 31: restored the smaller spectral parameter space for the intertwining-period identity.
- 35: separated the λ-domain D_r from the Epstein variable s.
- 43 and E8: corrected the direction of bc while retaining the verified inverse-power measure factor.
- 49: changed unsupported planned status to missing and added route 8 to ML.5, coalescing the existing Jiang–Zhang source request.
- 51: corrected the ambient group of ℬ′ and made its Levi projection explicit.
- 56: corrected the character-equivariant target and exposed the unitarity and field-specific source gaps.
- 60: marked the full L-group Cauchy adapter missing; retained the two connected upstream imports and routed the adapter to the existing unramified calculation.
- 65: replaced an ambiguous inverse-derivative formula with the primary source’s explicit pullback-bundle convention.
- 66–67: restricted to the generator component, corrected W_L, and retained the alternating cohomology sign.
- Routes: corrected route 1 galaxy, removed duplicated Borel–Weil–Bott from route 5 title, repaired its tests and component hypotheses, and made the field-specific gaps in routes 6–7 explicit.
- Source issues: independently reviewed E1–E11, narrowed E1’s repair claim and E7’s interpretation, extended E11 with additional typed slips, and added E12–E19 with proofs or counterexamples.

## Every item checked

The following table records the result of reading each locator. “Matches” means faithful at the stated level, not that the source proof or its dependencies are complete. Each row is also stored in the review JSON.

| Item | Status | Check / remaining work |
|---|---|---|
| 1 | missing | Parameter classes, conjugate-dual pairs, central-character normalization and the parameter space match §§1.1.2/1.1.4; split these definitions and component-group data. |
| 2 | missing | Matches weak base change at split places; do not replace it by strong base change or silently include archimedean compatibility (E1). |
| 3 | missing | Matches the cross-factor noncontragredience condition and its use in the Rankin–Selberg period; preserve the distinction from regularity. |
| 4 | missing | L-value and normalized local form are bundled; restore independent definitions, Laurent leading coefficient and measure dependence. E2 checked. |
| 5 | missing | Bessel flag, unipotent group and character need separate items; clarify the introductory character field and r=0 endpoint rather than evaluating y_r at r=0. |
| 6 | missing | Separate weak Harish–Chandra spaces, their LF topology, density, regularized local periods and refined conjecture. §8.4 explicitly warns that fixed-growth spaces lack the same density. |
| 7 | missing | The factorization uses local multiplicity one in different fields. Statements of ARS/GGP/JSZ with field and continuity hypotheses remain to be extracted. |
| 8 | missing | Paper locators match; Khoury/Liu/Zhang formulas and normalizations are still second-hand suppliers, not a closed theorem. |
| 9 | missing | Local GGP supplies nonvanishing of the semilocal distribution; do not infer positivity or all-form equivalence without the precise local statement. |
| 10 | missing | Main equivalence matches p.5: H-regular Π, imaginary parameter, and existence of a unitary cuspidal datum with a nonzero regularized period. Proof still consumes E1 and transfer inputs. |
| 11 | missing | Formula matches p.6; retain regular Hermitian Π and everywhere-tempered σ, nonzero pure tensor and Tamagawa normalization. Do not add an unstated H-regularity hypothesis. |
| 12 | missing | Main Bessel equivalence matches p.7 with G_m×G_{n+1}; r=0 and m=0 reductions are separate boundary cases (E3–E4). |
| 13 | missing | Refined Bessel identity matches p.9 for everywhere-tempered cuspidal σ and normalized local factors; proof depends on the full §8 reduction. |
| 14 | planned | AS.3 plans truncation; AA.3 supplies reduction/Siegel domains. The partition, characteristic-function definition and equivalent description still need splitting. |
| 15 | missing | Four numbered statements plus a weight construction are combined; write each support/bound with its quantifiers and the λ-cone, not only its locator. |
| 16 | missing | Lemma 3.5.6.1, its analytic bounds and the residual-spectrum vanishing argument need separate statements and an explicit unitary-regular spectral input. |
| 17 | missing | Unitary setup and modified kernel match §3.1–3.2; split parabolic correspondence, constant terms, truncated kernel and its absolute-convergence bounds. |
| 18 | missing | The coarse expansion has convergence, polynomial-exponential dependence and a constant term; separate each assertion and its domain. |
| 19 | missing | The truncation operator, three estimates and cancellation identity are distinct items; restore the support condition corrected in E17. |
| 20 | missing | Eight cited estimates/theorems are bundled; isolate the kernel comparison, truncation comparison and limit statements. E6 and E18 checked. |
| 21 | missing | U-, U′- and joint regularity match their separate definitions. Keep the three predicates and their implication API distinct. |
| 22 | missing | The regularized period and Proposition 3.5.3.1 match; separate meromorphic continuation, T-independence under regularity and continuity. |
| 23 | missing | Relative-character definition and Proposition 3.5.5.1 are distinct: basis independence, regularity and continuity require explicit supplier statements. |
| 24 | missing | Two expansion statements are bundled. The correct BPCZ relative-character convergence locator is Proposition 2.8.4.1 (E10), read at its source. |
| 25 | missing | Hermitian/regular data and the Levi assembled from paired constituents match pp.38/64; split their definitions and prove independence of ordering. |
| 26 | missing | Intertwining periods, conjugation representatives and parabolic descent need separate constructions with convergence/continuation hypotheses. |
| 27 | missing | Corrected extra conjugation; the existing φ-bar is necessary. Separate the Rankin–Selberg period and relative-character definition/Schwartz theorem. |
| 28 | missing | Corrected central-average coefficient to 2^{-dim a_L^G}; read Chaudouard §§7.2–7.3. Extract the supplier’s relative-character construction and proof dependencies. |
| 29 | missing | Corrected extra conjugation in (4.1.9.4); coefficient 2^{-dim a_L} is appropriate for the unaveraged kernel. |
| 30 | missing | The stated linear-side contribution matches Theorem 4.1.8.1; closure still depends on 26–29, tensor convergence and regularization. |
| 31 | missing | Split three identities; only the Flicker–Rallis/intertwining identity has λ in i a_M^{L,*}. Whittaker measures and Laurent coefficients need their own definitions. |
| 32 | missing | Whittaker relative-character identity matches; keep its genuine conjugation on β. E7 is a notation correction, not an extra conjugation to remove. |
| 33 | missing | Double-coset/involution classification matches Lemma 5.1.2.1; pin JLR’s representatives and stabilizers independently. |
| 34 | missing | Basic intertwining period for σ⊠σ* matches §5.1.3; holomorphic domains and distinction assumptions are handled later, not automatic here. |
| 35 | missing | Corrected D_r to the λ-domain; separate the Epstein series, meromorphic continuation and residues. The Jacquet–Shalika residue normalization still needs its primary-source check. |
| 36 | missing | Multiple pseudo-Eisenstein, Jacquet-integral and orthogonality results are bundled; E19 corrects the missing local character factor. |
| 37 | missing | Lemma 5.5.2.1 has three separate analytic assertions. Its generic-unitary exponent bound and local uniformity need exact field-specific inputs. |
| 38 | missing | All-field statement is not supplied by ET.6 alone; the real/complex classification needs its own item and AF.1 source request. |
| 39 | missing | Theorem 5.5.1.1 matches the meromorphic identity and its two stated holomorphy cases; retain possible λ=0 pole when σ is distinguished. |
| 40 | missing | General Hermitian multiplicities, regular specialization, β_n and stabilization in S are different definitions/results; preserve the J-empty condition under regularity. |
| 41 | missing | Three parts of Theorem 6.2.6.1 and Corollary 6.2.7.1 must be split. Residue factors, Schwartz continuity and the central factor 1/2 are material. |
| 42 | missing | Alternative proof reaches the same contribution as 30; keep one theorem owner and record this proof route and its additional analytic suppliers. |
| 43 | missing | Corrected bc to the inverse antidiagonal identification. The sum over cuspidal data and its normal convergence need separate items. |
| 44 | missing | Two multiplier lemmas and their level conditions are distinct; restore spectral twists in the comparison, and leave E1’s endoscopic compatibility proof open. |
| 45 | missing | The relative-character identity matches pp.65–69, including test-function transfer and unramified conditions. Stone–Weierstrass separation is an omitted supplier. |
| 46 | missing | Separate local relative characters and the global factorization; the Asai denominator is the Laurent leading coefficient (E9). |
| 47 | missing | The cited local comparison is used for induced tempered representations; its transfer, measure and normalization hypotheses remain to be extracted from the primary supplier. |
| 48 | planned | ML.4 explicitly plans Arthur/Mok/KMSW classification inputs; keep planned status while requiring precise theorem pins and all-place compatibility adapters. |
| 49 | missing | Changed to missing; ML.5 does not explicitly state this descent theorem. Added source route 8, coalesced with Jiang–Zhang’s classical GRS input. |
| 50 | missing | Transfer and positivity are different results. Approximation at nonsplit archimedean places must not become an assertion of unrestricted exact transfer. |
| 51 | missing | Corrected ℬ′: subgroup of U′ intersected with ℬ under the unitary embedding, with a Levi projection to ℬ_L; not U′∩ℬ_L. |
| 52 | missing | Split self-dual measures, convergence factors, ν constants and Fourier inversion; keep the ν^{-1} factor and local/global normalization identities. |
| 53 | missing | Three global period definitions and their separate convergence hypotheses match §8.3; record the Whittaker sign explicitly. |
| 54 | missing | Global unfolding matches Proposition 8.5.1.1 in a right half-plane; mirabolic Fourier expansion and the torus convergence estimate are omitted suppliers. |
| 55 | missing | Split convergence, tempered half-plane, nonvanishing equivalence and growth estimates. General generic τ cannot be justified only by Kemarsky’s unitary theorem. |
| 56 | missing | Corrected twisted compact-modulo-N target. Primary complex theorem read; real, p-adic, nonunitary extension, split products and r=0,1 boundaries remain explicit gaps. |
| 57 | missing | Separate Proposition 8.6.2.1 and Lemma 8.6.2.2, weak-Schwartz continuity and Fourier inversion. Preserve the two independent tensor slots (E16). |
| 58 | missing | Published corrected unramified formula is used; split both lemmas and the determinant/Cauchy calculations. Its Appendix application uses the corrected local Γ_v and Frobenius component. |
| 59 | planned | AL.3 supplies unramified Whittaker calculations; normalization L_W(φ°)=1 and the L-group/Satake dictionary remain explicit consumer conventions. |
| 60 | missing | Changed full L-group identity to missing; connected Cauchy and Schur-character results remain upstream imports, while split/inert and q_E adapters go to route 1. |
| 61 | missing | Separate global identity (8.8.1.1) from nonvanishing equivalence. Analytic continuation and existence of a nonzero Whittaker vector are essential inputs. |
| 62 | missing | Corrected (8.8.3.2) tensor slots via E16. Separate regularized Euler products, inner-product factorizations and the final implication. |
| 63 | missing | Whittaker factorization matches (8.8.3.4); extract the Lapid–Mao/Jacquet–Shalika supplier with induced, unitary and measure hypotheses. |
| 64 | planned | LieGroups Layer 8 explicitly plans Borel–Weil–Bott. Keep it as an import; a convention map for χ, the associated bundle and group action is still required. |
| 65 | missing | Replaced ambiguous action/inverse-derivative expression with Atiyah–Bott’s explicit f*ℒ→ℒ convention, read on original pp.458–459. |
| 66 | missing | Corrected singular case to generator component and retained alternating cohomology sign. Counterexample on the identity component verifies E12/E14. |
| 67 | missing | Corrected W_L to the Γ-fixed Weyl subgroup and restricted to generator component. Torus×C₂ and swapped-SL₂ examples verify E12/E13. |
| 68 | planned | AS.1–AS.2 explicitly own induced families, Eisenstein series and intertwining operators; split convergence, continuation and functional equations. |
| 69 | planned | AF.2–AF.3, AS.4 and AA.2 supply the directions stated. The item bundles many objects; topology, central normalization, K-bases, spectral projectors and kernels need separate APIs. |

## Every route checked

**1. JacquetRallisRelativeTraceComparison — reject.** The shared Jacquet–Rallis candidate is the right direction and its area is corrected to automorphic, but the item bundles do not expose the truncation estimates, convergence, transfer and regularization inputs; E1 is not repaired. The exact split/inert adapter 60 is now explicitly missing. Resolve G1–G3 and G6 before design.

**2. GanGrossPrasadConjecturesForClassicalGroups — reject.** Coalesce the existing GanGrossPrasadConjecturesForClassicalGroups candidate; the local GGP, Bessel uniqueness, weak/strong base-change and unramified Bessel-function statements are still mostly second-hand summaries with unsplit hypotheses. Rank-zero and additive-character conventions need explicit definitions and tests.

**3. AutomorphicLFunctionsPartIIAsaiAndGLnPeriods — reject.** The Asai/GL_n Part II candidate is shared with BPCZ22, but central averaging (28), λ-domain (31,35), and Jacquet-character normalization have needed correction. Split the multiple propositions and close the local zeta-integral estimates, Epstein residues and §6.2 analytic-continuation/residue suppliers.

**4. AutomorphicSpectralTheoryPartIISchwartzMultipliers — reject.** Reuse the existing SchwartzMultipliers Part II candidate. Items 15 and 16 combine new weights, support estimates, kernel expansions and uniform convergence without the individual statements or input signatures. The nonlinear LF/topological and Arthur cone estimates cannot be inferred from a title or bibliography.

**5. LieGroupsPartIITwistedCharacterFormula — reject.** Extending LieGroups is appropriate after importing its Borel–Weil–Bott layer, but the original all-component and W_L statements are false. E12–E14, the primary Lefschetz convention, title and tests are corrected; the fixed-point/cohomology-action adapter and proof decomposition remain G5.

**6. AutomorphicLFunctionsAndLocalFactors — reject.** AL.3 is a plausible archimedean Whittaker owner, but the exact target is character-equivariant. Kemarsky only verifies the complex unitary case, and the general complex, real and p-adic inputs have not all been pinned and matched. SR.5’s integral-family derivative API is not itself a proof of all-field Kirillov surjectivity.

**7. EndoscopicTransferAndUnitaryTraceComparison — reject.** ET.6 owns the p-adic direction but cannot alone supply an item quantifying over all local fields. AF.1 does not explicitly state the required real/complex unitary-dual classification. Split item 38 and give primary classification statements and bounds in each case.

**8. ModularityAndLanglandsExtensions — reject.** New source request records the correct ML.5 direction and coalesces the Jiang–Zhang grs-descent request. Its exact unitary-group/parity/auxiliary-character theorem and proof are not yet read and extracted; marking it planned would hide this gap.

## Concrete checks of the new source findings

For E12 let a,b∈{2,3,4,5}, D(a,b)=(1−a⁻²)(1−b⁻²), and let C₂ swap two SL₂ factors. On the identity component the fixed Weyl group has two terms. For χ=(-1,-1), the sum is 2ab/((a²−1)(b²−1)); at (2,3) this is 1/2, although χ+ρ=0. For the trivial character the sum is (1+a²b²)/((a²−1)(b²−1)); it is 37/24 at (2,3). On the generator component the determinant is 1−(ab)⁻², and the corresponding two sums are 0 and 1. Thus regularity alone does not permit replacing T̂F by all of ^LT. In the paper’s local applications Γ_v is trivial at split places and C₂ at inert places, so the corrected restriction still covers those applications.

For E13 take Ĝ=L̂=T̂=G_m and a trivially acting Γ=C₂. The printed normalizer quotient has two elements; the required fixed Weyl group has one. All determinants are 1, so the printed sum gives 2 instead of 1. This is independent of E12’s component issue.

For E14 take Γ=1, Ĝ=SL₂ and χ=-2. Then χ⁺=0 and
`a^-2/(1-a^-2) + a^2/(1-a^2) = -1`, while the character of V₀ is 1. The missing factor is (-1)^i with i=1. The original Atiyah–Bott formula indeed uses an alternating trace. The root of unity in the proposition can include this sign, so this finding concerns the proof and the extraction’s test, rather than disproving the nonsingular conclusion.

The scratch rational-arithmetic diagnostic executed 80 assertions over the 16 pairs above, including the valid generator-component boundary cases and the connected SL₂ sign. These computations check the counterexamples; they are not Lean proofs.

E15 follows directly from the Whittaker transformation law: f(uh)=ψ(u)f(h) conflicts with ordinary quotient invariance at a nonzero value whenever ψ(u)≠1. Kemarsky’s primary Theorem 1 confirms the twisted target and also exposes the unitarity restriction of that complex-field source. E16 is verified by substituting the displayed formula of Proposition 8.6.2.1 into (8.8.3.2), retaining a(h₁) and a(h₂). E17 is a support condition needed by the very next line; E18 is an inconsistent parameter in adjacent estimates. E19 is independently detected by translation in N₂ in the n=1 local Jacquet integral: omitting ψ(u)⁻¹ yields invariance instead of Whittaker equivariance. Its global counterpart on the same page contains the missing factor.

E1 is deliberately narrower than the extraction’s original wording. BPLZZ Theorem 4.14(4) **does state** the compatibility needed for endoscopic base change. The issue is its proof’s dependence on Proposition 4.13(1): Definition 3.16 requires the archimedean equality, whereas a contradiction to nonexistence of weak base change does not by itself supply that equality. Theorem 3.19 and the Mok/KMSW alternative are repair leads, not completed proofs in this review. No claim that the main BPC25 theorems are false follows from this observation.

## Source-finding disposition

- **E1 — confirmed**, Proof of Lemma 7.1.7.1, assertion 2, p. 67. Confirmed in the narrower inherited-proof sense stated above; no completed repair or false-main-theorem claim.
- **E2 — confirmed**, §1.2.4, p. 5. Confirmed on the published p.5 image; the Laurent monomial (s−1)^{-d} requires multiplication by (s−1)^d, not its inverse.
- **E3 — confirmed**, §1.3.3 and Theorem 1.3.3.1, p. 7. Confirmed p.7 against the ranks m and n+1 of the two unitary factors and §1.3.4.
- **E4 — confirmed**, Remarks 1.3.3.2, first item, p. 7. Confirmed p.7: the r=0 reduction is the earlier corank-one theorem; the printed self-reference supplies no reduction.
- **E5 — confirmed**, §3.1.4, p. 20. Confirmed p.20 against (3.1.4.1) and the embedding U′⊂U″.
- **E6 — confirmed**, Theorem 3.4.2.1 and Corollary 3.4.2.2 with its proof, p. 26. Confirmed p.26 in the unitary section; the test function and all three kernels live on U.
- **E7 — confirmed**, (4.2.8.1), p. 46, and the display in §1.4.3, p. 11. Confirmed as notation only; the transported Petersson form makes the intended expression meaningful.
- **E8 — confirmed**, Remarks 7.1.5.1, second paragraph, p. 65. Confirmed p.65 image, §2.1.8 measure convention and (7.1.7.3). In one pair u=x−y=2z and bc(u)=u/2, so the pullback is du/2.
- **E9 — confirmed**, (7.3.1.1), p. 71. Confirmed p.71 image against §1.2.4 and the starred coefficient in (7.3.2.1).
- **E10 — confirmed**, Lead-in to Lemmas 7.1.7.1–7.1.7.2, p. 66; proofs of Proposition 3.5.6.4 and Theorem 3.5.7.1, pp. 35–36. Confirmed both primary published locators: BPLZZ p.558 and BPCZ pp.227–228.
- **E11 — confirmed**, Lemma 7.1.7.2(1), p. 67; §7.3.1, p. 71; §8.2.1, p. 74; §4.1.5, p. 38; §5.4.2 p.51; end of proof of Lemma 7.1.7.1 p.67; (8.6.2.5) p.84; display before (8.7.2.8) p.89; §8.8.3 p.92. Confirmed each listed index against the surrounding definitions on pp.38, 67, 71, 74. Also independently checked the additional cited displays and their adjacent definitions.
- **E12 — confirmed**, Proposition A.0.2.1(1), p.95, and Corollary A.0.2.2, pp.95–96; arXiv v1 pp.84–85. Independently checked against the published source and the explicit argument in reason; the published/preprint Appendix A comparison also retains this problem.
- **E13 — confirmed**, Corollary A.0.2.2, p.95; arXiv v1 p.85. Independently checked against the published source and the explicit argument in reason; the published/preprint Appendix A comparison also retains this problem.
- **E14 — confirmed**, Proof of Proposition A.0.2.1, p.95; arXiv v1 pp.84–85. Independently checked against the published source and the explicit argument in reason; the published/preprint Appendix A comparison also retains this problem.
- **E15 — confirmed**, Proof of Proposition 8.6.1.1, p.82. Independently checked against the published source and the explicit argument in reason; no separate correction was located in the listed search.
- **E16 — confirmed**, Equation (8.8.3.2), p.93. Independently checked against the published source and the explicit argument in reason; no separate correction was located in the listed search.
- **E17 — confirmed**, After equation (3.3.4.4), p.24. Independently checked against the published source and the explicit argument in reason; no separate correction was located in the listed search.
- **E18 — confirmed**, Final estimate on p.29 in the proof following Lemma 3.4.5.2. Independently checked against the published source and the explicit argument in reason; no separate correction was located in the listed search.
- **E19 — confirmed**, Local Jacquet integral (5.4.4.1), p.51. Independently checked against the published source and the explicit argument in reason; no separate correction was located in the listed search.

## Handoff for the extraction revision

- **G1:** Split bundled definitions/results (especially 1,4–7,14–20,22–24,26–28,31,35–37,40–41,43–44,46,51–55,57–58,61–62,68–69) and supply all hypotheses, definition APIs, dependency edges and boundary tests. A long theorem name listing locators is not a set of extracted statements.
- **G2:** Extract missing analytic and combinatorial suppliers: height/log-height and Schwartz/tempered LF topologies, completed tensor products, Dixmier–Malliavin, the relevant uniform-boundedness/closed-graph statements, Arthur cone functions and estimates, non-K-finite extensions in §§3.4–3.5, spectral convergence and passage to limits, the Stone–Weierstrass spectral-separation step in §7.1.7, and the BPCZ Appendix A residue/Schwartz-continuation inputs of §6.2. Match existing analysis declarations at the pins before planning general substitutes.
- **G3:** Resolve the inherited BPLZZ proof obligation E1 with a complete primary proof or an exact Mok/KMSW theorem and hypothesis match. Pin GRS descent, local GGP, transfer, uniqueness and unramified Bessel-function suppliers by statement and version. A bibliography entry alone closes none of these.
- **G4:** Separate p-adic, real, complex and split-product inputs in 38 and 56. The complex Kemarsky theorem verified here assumes unitarity; Proposition 8.6.1.1 uses arbitrary generic τ. The exact archimedean generic unitary classification needs its own AF.1 source item. Treat r=0,1 separately. In the introduction clarify the AE/E character versus the printed A/F domain and the r=0 indexing convention before making Bessel data usable.
- **G5:** Close Appendix A’s cohomology/fiber-action convention adapter using the explicit Atiyah–Bott pullback convention and Borel–Weil–Bott import. Keep E12–E14 corrections; prove component-specific fixed-point identification and the extension of a highest-weight representation. Decompose the split/inert Cauchy adapter 60 and determinant identities of §8.7; do not re-plan connected Schur/Cauchy/Borel–Weil–Bott theory.
- **G6:** Coalesce routes 1–4 with the already proposed candidates in BPLZZ21, BPCZ22, Zhang21 and Jiang–Zhang20. Align the Jacquet–Rallis galaxy to automorphic across those packets through their owners. Give exact supplier/consumer signatures and check the resulting stage graph for cycles; the current directional ownership check does not certify a full stage-level graph. Retain the separate stronger hypotheses of each main theorem; do not silently assume H-regularity for Theorem 1.2.4.1, which is stated with regular tempered data.

Start by splitting the source definitions and numbered assertions while preserving the 69 stable item IDs as parent references. Then pin the analytic and local-field suppliers; close E1 or replace that dependency by a verified classification theorem. For Appendix A, keep the component/Weyl/sign corrections and prove the convention adapter before proposing a design. Finally refresh the shared candidates and run the stage-level dependency and duplicate-owner checks. Do not treat this completed review as acceptance of any route.

## Validation

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-BEUZARTPLESSIS-CHAUDOUARD-25.result.json` passes. The four-file `intake.py check-files` check passes with 0 problems. Live input refresh at aa8623ba4aadb4ae82e1f429386a30d48eca6fa6 changed only the MordellLawrenceVenkatesh roadmap and packet; their identities and topic relevance were checked and do not change these ownership conclusions. The publisher guards the final live tree against concurrent input or deliverable changes. A separate integrity check verifies all 69 item IDs, one route per missing item, every inherited source finding’s review, no accidental conjugation, and only the authorized deliverable paths. The 80 exact rational assertions pass. No Lean file is required or compiled for this paper review; no result is claimed formalized. All deliverable changes are confined to the four paths authorized by issue #1349.
