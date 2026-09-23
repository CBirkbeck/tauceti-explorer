# Independent review: REV-PAPER-MAO-WAN-ZHANG-26

Reviewer: **Codex**, session **codex-c83e7a**. Verdict: **revise**. Review status: **complete**.

This review was claimed on [issue #1202](https://github.com/CBirkbeck/tauceti-explorer/issues/1202), after bot confirmation. Result-file history was checked before claiming: its author is the distinct worker session **cc-39fac3**, [PR #2054](https://github.com/CBirkbeck/tauceti-explorer/pull/2054). The reviewer did not author that extraction. All four named deliverables were reviewed/updated; no Lean or unrelated roadmap file is part of this submission.

The original claimed complete with 79 items and one broad new-roadmap route. It copied an incorrect Table 3 row, a reversed tuple, a free integration variable and overly broad library/arithmetic hypotheses. It also lacked explicit dependency and definition-contract coverage and left cited proof inputs unread. The in-place correction records the narrower statements and the remaining gaps; it does not turn those gaps into accepted theorems. The review’s mathematical findings and route verdicts below are final for this review, not a checkpoint of an unfinished review.

The extraction is **partial** and the finished independent review recommends **revise**. The paper gives conjectural global BZSV period/trace comparisons and proves p-adic local comparisons for six models. The basic-function fundamental lemma for Models 5–6 excludes residue characteristic 2. The local comparisons do not prove the global period conjectures.

Source: [author’s April 2025 draft](https://sites.rutgers.edu/chen-wan/wp-content/uploads/sites/518/2025/04/BZSV.pdf), *Relative Langlands duality for some strongly tempered spherical varieties*, 35 pages, read in full. This is not the same version as [arXiv v3](https://arxiv.org/abs/2310.17837v3). The [published record and public notes](https://link.springer.com/article/10.1007/s00222-025-01388-z) were checked, but its subscription main text was unavailable. Published notes add local-character/normalization material absent from the draft. Findings below are version bounded; no claim of novelty or complete journal collation is made.

## What changed

- Separated the quadruple, all five hyperspherical conditions, neutral grading and Hamiltonian induction. The BZSV structure theorem has an algebraically closed characteristic-zero scope; it is not automatically a theorem for arbitrary global fields.
- Replaced the unconditional global metaplectic splitting assertion by the actual local absolute-anomaly criterion. Geometric Chern-class vanishing, splitting on an image, pullback splitting and compatible adelic/rational lifts are distinct obligations.
- Made conjectures definitions of propositions, with their normalization/parameter data explicit. Repaired the factorization map’s target, tuple slot order, free variable in (5.12), phase signs, differential dι and finite-place product notation.
- Corrected Model 1’s full adjoint character. It is Ad⊗Sym⁰ ⊕ (1⊕Ad)⊗Sym² ⊕ (1⊕Ad)⊗Sym⁴, of dimension 35. The printed row gives 27. The other five rows are held for computation; their even-parity consequence is not refuted by this finding.
- Reused the pinned sl₂ complement/classification and Killing form, the Albert carrier/trace/frame, the integral E₇ carrier and faithful comodule, and type-B/type-D coordinate-lattice stability. Existing complex/Lie prototypes do not themselves identify all the named arithmetic groups or provide the exact alternating forms, central kernels and basic-vector normalizations.
- Added explicit dependencies and APIs, consumer uses and at least three planning tests for every definition/construction. Residual multi-model/generator granularity is an explicit gap, not a claim of complete decomposition.
- Separated reusable Fourier, Weil/theta, automorphic-kernel, nilpotent-orbit, Jordan and rank-one Kuznetsov work from the BZSV application. Existing and pending candidate ownership is recorded without treating a proposal as a library implementation.

The corrected JSON has **105 items: 8 library, 8 planned and 89 missing**, **241 dependency edges**, and **70 definition/construction contracts**. Each missing item has one route. There are **18 confirmed source findings**, including the 14 original findings with narrowed scope, and **12 explicit gaps**. Six routing boundaries are accepted; four proposals remain held. This review is complete; the extraction is not.

## Source reading and limits

The independent reviewer read all definitions, numbered results, proofs and references of the 35-page author draft. Additional primary reading: [BZSV v1](https://arxiv.org/abs/2409.04677v1), (3.17)–(3.19), §§3.5–3.6 and the complete proof of Theorem 3.6.1, opening §3.9, and §5.1 through Proposition 5.1.6 and its examples; [Kudla’s notes](https://www.math.utoronto.ca/skudla/castle.pdf), p. 3 assumptions and pp. 6–10 including Lemmas 2.1–2.2 and Proposition 2.3 with proof. The rest of BZSV and its Appendix E.3 were not read. MR97, MR04, MR2010 and GRS1999 remain cited supplier obligations. The selected arXiv-v3 comparison confirms the same Table 3 first row and the older splitting assertion, not every draft finding.

The correction search covered the publisher record and public notes, arXiv version history, Chen Wan’s current paper list and linked draft, Crossref’s update/relation fields, and exact-title/arXiv-number searches for corrections. No itemized correction was located. Lei Zhang’s research-page fetch failed; a complete all-author-site search is not claimed. Published note 13 retains the polarization basis and note 15 retains a negative phase, but their surrounding journal formulas were inaccessible, so neither alone establishes an internal journal error.

## Library and ownership evidence

Both complete pinned Lean trees were searched: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` (9,055 files) and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` (5,489). Search families cover every one of the original 72 missing items. Full hypotheses and module blob hashes were checked for all 18 cited declaration references. The audit rows read are AF.2, AL.0, AS.4/AS.6 and MP.0–MP.5 (AUDIT-13/14/15). Exact owner descriptions and the full upstream SpinRepresentations and LieHighestWeight documents were read. Upstream-stage audit absence is not negative evidence.

Fresh candidate comparison covered Ciubotaru–Harris’s pending nilpotent-orbit Part II, Gan–Savin’s pending exceptional theta/Jordan proposal, and the accepted Jiang–Zhang, Beuzart-Plessis–Chaudouard–Zydor and Leslie routes. The latter own GGP, twisted descent, Jacquet–Rallis and unitary Friedberg–Jacquet comparisons; those relative spaces do not supply these six BZSV comparisons. General orbit/Fourier-coefficient/Jordan carriers must nevertheless be shared.

## Route verdicts

1. **accept — AutomorphicLFunctionsAndLocalFactors** (source). AL.0 explicitly owns local Schwartz–Bruhat/Fourier theory, self-dual Haar conventions and character orthogonality. The p-adic box integral (4.2) is a reusable consequence of that theory, not a second Fourier foundation inside a BZSV application. This accepts ownership, not a claim that these targets are already formalized.

2. **accept — MetaplecticAutomorphicForms** (source). MP.0/MP.2 own Heisenberg and Schrödinger generators; MP.4/MP.5 own adelic Weil representations and theta kernels. This source route supplies the six-model specialization with the algebraic representations and anomaly splittings as explicit inputs. It does not duplicate AL.0 function spaces or assert the unresolved splittings. This accepts ownership, not a claim that these targets are already formalized.

3. **accept — AutomorphicSpectralTheory** (source). AS.4 owns discrete L² embeddings and multiplicities, and AS.6 owns the automorphic kernel. Relative periods are consumers of that same kernel. Ordinary invariant trace formulas do not already supply the rank-one relative formula below. This accepts ownership, not a claim that these targets are already formalized.

4. **reject — MetaplecticAutomorphicFormsPartIIAnomalySplittings** (part-ii). The direction extends MP beyond its specified classical dual-pair splittings, but the cited proof and absolute-cohomology supplier have not been decomposed (G2/G3). Hold design activation until these contracts and their owner are fixed.

5. **reject — LieHighestWeightPartIINilpotentOrbits** (part-ii). The existing partial Ciubotaru–Harris candidate already proposes nilpotent-orbit and SL₂ weight infrastructure. Reuse its ID, but its review is absent and BV/general group adapters are still unresolved inputs (G2/G9).

6. **reject — LieHighestWeightPartIICubicNormStructures** (part-ii). The original single BZSV route duplicated both an existing Albert carrier and Jordan constructions in the Gan–Savin candidate. A single generic norm owner has not yet been settled; this is a held coordination proposal, not an accepted second Jordan roadmap (G4/G9).

7. **accept — SpinRepresentationsPartIIArithmeticModels** (part-ii). The full upstream spin and highest-weight plans were read: their complex/Lie prototypes do not provide the required p-adic group/integral adapter. This direction is a Part II, with the E₇ supplier explicitly held by G7; require that import before declaring item 85 complete.

8. **accept — AutomorphicSpectralTheoryPartIIKuznetsov** (part-ii). AS.6 plans ordinary kernels and invariant trace expansions, but no two-Whittaker/Kuznetsov or singular-germ theory. GL2AutomorphicRepresentationsAndTransfer only supplies representation/Whittaker expansion specializations; ET and the Jacquet–Rallis and unitary Friedberg–Jacquet candidates have different relative spaces. This reusable rank-one extension prevents burying Kuznetsov foundations in the BZSV application.

9. **accept — TwistedAutomorphicDescents** (new). The freshly read Jiang–Zhang route and its accepted review explicitly place nilpotent Fourier coefficients and GRS descent infrastructure in this candidate. Coalesce that existing owner; source proof hypotheses remain a separate explicit gap, not an ownership excuse for duplication.

10. **reject — RelativeLanglandsDuality** (new). The distinctive BZSV direction is not covered by the existing unitary/GGP relative-comparison candidates, but this extraction is not ready for its design job: the source, proof, Model 6, branching and supplier gates remain. The former all-in-one route is rejected and replaced by this narrower held application route.

## Independent source-finding verdicts

### E1 — misprint, confirmed

§2, p. 12, Model 2 ('In the second case'). The Model 2 roots e_i−e_(i+1), e_(n−1)+e_n are D_n roots; B_n ends with e_n. Confirm the type label, not a change of model.

Correction: … the simple roots of Type D_n

### E2 — misprint, confirmed

§3, (3.1), p. 15. An Euler product of local integrals is indexed by places v. A sum over a∈k× already occurs separately in (3.1).

Correction: J(f′) = ∏_{v∈|k|} J^+_v(f′_v) + ∏_{v∈|k|} J^−_v(f′_v) + Σ_{a∈k^×} ∏_{v∈|k|} J_v(a, f′_v), a ∈ k^× ⊂ k_v^×

### E3 — misprint, confirmed

§4.1, Proposition 4.2, p. 17. The two singular Bruhat orbits require I+ and I−. The regular term is a sum over rational a of products of local I_v(a,…); the second printed plus and omitted local product cannot describe that decomposition.

Correction: I(f, φ) = ∏_{v∈|k|} I^+_v(f_v ∗ φ_v) + ∏_{v∈|k|} I^−_v(f_v ∗ φ_v) + Σ_{a∈k^×} ∏_{v∈|k|} I_v(a, f_v ∗ φ_v)

### E4 — misprint, confirmed

§4.2, proof of Theorem 4.4(1), p. 18; §5.3, proof of Theorem 5.9(1), p. 26. If φ is fixed by K, then Ω(1_K)φ=vol(K)φ. Multiplying the characteristic function by vol(K) yields vol(K)²φ. The normalized operator uses 1_K/vol(K), independently on K′; a remains the free orbital parameter.

Correction: φ = vol(𝒦)^{−1} · 1_{(a_0+ϖ^m𝒪_F)×𝒦} (and, in Theorem 5.9, φ′ = vol(𝒦′)^{−1} · 1_{𝒦′})

### E5 — gap, confirmed

§5.3, proof of Theorem 5.9(1), p. 26. Controlling only (tr(A)−N(A))/a leaves the terms ⟨Y,A⟩/a and ⟨A,A⟩/(2a²) uncontrolled. Choose the A,Y boxes sufficiently small that |⟨Y,A⟩|≤|a₀| and |⟨A,A⟩|≤|2||a₀|²; continuity and shrinking around zero provide the missing control.

Correction: choose 𝒦 and 𝒦′ such that also |⟨Y, A⟩| ≤ |a_0| and |⟨A, A⟩| ≤ |2| · |a_0|² for all A ∈ 𝒦, Y ∈ 𝒦′ (small enough neighbourhoods of 0 do this), so that the whole phase of I(a, φ, φ′) is trivial for a ∈ a_0 + ϖ^m𝒪_F

### E6 — misprint, confirmed

§5.2, p. 20 (twice). The lowest weight of the 32-dimensional B₅ spin representation is (−e₁−e₂−e₃−e₄−e₅)/2. The missing sign before e₅ is typographical.

Correction: (−e_1 − e_2 − e_3 − e_4 − e_5)/2

### E7 — misprint, confirmed

§5.2, before Proposition 5.3, p. 21. For v_i=X_i+((-1)^i/2)f_(7−i), the printed B(X_i,X_j)=0 gives B(v_i,v_(7−i))=−(-1)^i≠0. Thus the footnote’s claimed isotropic complement fails. Restoring B(X_i,X_j)=(-1)^iδ_(i+j,7) cancels it. Checked the rendered p. 21 and exact rational 8×8 form.

Correction: ⟨X_{e_1−e_i}, X_{e_1−e_j}⟩ = 0, ⟨X_{e_i}, X_{e_1−e_j}⟩ = δ_ij and ⟨X_{e_i}, X_{e_j}⟩ = (−1)^i δ_{i+j,7} (2 ≤ i, j ≤ 5)

### E8 — misprint, confirmed

§5.2, (5.13), p. 21, and the unfolding of the main term, p. 22. The factorization is N=N₁N₀. After integrating N₁ the remaining factor is N₀, the Siegel radical; no N₂ was introduced.

Correction: n ∈ N_0(𝔸) …; ∫_{Y′(𝔸)} ∫_{N_0(𝔸)} …

### E9 — error, confirmed

§5.2, (5.13) p. 21, the unfolding pp. 22–23, Proposition 5.7 p. 25 and footnote 11 p. 29. Take n=u_(e_i)(t), i=2,…,5, a≠0, A=atX_(e_i). Here tr(A)=N(A)=⟨A,A⟩=0. Formula (5.8) gives ψ(+tY_i); the printed negative mixed term gives ψ(−tY_i). The later p. 29 integral has the positive term. This establishes an internal sign inconsistency; it does not by itself certify every corrected model theorem.

Correction: Use a positive mixed pairing +⟨Y,A⟩/a consistently with (5.8) and the p. 29 germ calculation. Recheck all generator relations and the omitted Model 6 normalization before claiming all later statements are proved.

### E10 — misprint, confirmed

§5.2, first display of p. 23. The preceding (5.13) and the definition of I_v immediately following the displayed sum both have the quadratic term ⟨A,A⟩/(2a²). The extra Y in the second pairing of the displayed global sum is inconsistent with both.

Correction: ψ((tr(A) − N_𝒥(A) ± ⟨Y, A⟩)/a − ⟨A, A⟩/(2a²)) (sign as in E9)

### E11 — misprint, confirmed

§5.3, proof of Theorem 5.9(2), p. 27. In the p. 27 linear phase the coefficient is ΣY_iA_i, not ΣAY_iA_i, and the integration domain must be 𝒥(𝒪_F), not the scalar ring. These are the coordinates already fixed in §5.2.

Correction: ⟨Y, A⟩ = Σ_{2≤i≤5} Y_iA_i; 𝒥(𝒪_F)_a := {A ∈ 𝒥(𝒪_F) | A_i ∈ a𝒪_F, 2 ≤ i ≤ 5}

### E12 — misprint, confirmed

§6.2, p. 31. The ambient group is Sp₄ₙ, whose dual is SO₄ₙ₊₁; the principal orbit of the dual Levi lies in 𝔤̂. The nilpotent matrix is a Lie algebra element and must be mapped by dι, not by the group homomorphism ι.

Correction: Use Sp₄ₙ for G, 𝔤̂ for the ambient dual Lie algebra, and Ξ=dι((0,0;1,0)).

### E13 — misprint, confirmed

§6.2, Conjecture 6.1 p. 32 and Proposition 6.4 p. 33. The periods in Conjecture 6.1 and Proposition 6.4 are defined on G=Sp₄ₙ. Replacing G by its orthogonal dual in the automorphic representation changes their domain.

Correction: … of G(𝔸) = Sp_{4n}(𝔸) … ν : π → L²(G(k)\G(𝔸))_π

### E14 — misprint, confirmed

Index and notation slips: §4.1 Conjecture 4.3(1) p. 17; §5.1 p. 19; §5.2 p. 22; §6.1 p. 30; §6.2 Proposition 6.4 p. 33. Checked the individual locators against their surrounding definitions: local k_v replaces the undefined F; λ is the scalar character; group action arguments are (u,a); the commuting group in §6 is Ĥ×SL₂; and the proof refers to a finite-place product 𝔸_S. The last correction does not establish the unread GRS proof.

Correction: Ĝ(𝒪_v)A_Ĝ(k_v); U″_n = ker λ; (u, a).0 throughout, matching the notation (n, a).A of Remark 5.2; the adjoint action of Ĥ × SL_2; ∫_{X_0(𝔸_S)}, 𝔸_S = ∏_{v∈S} k_v

### E15 — error, confirmed

Author April 2025 Table 3, p. 13; same first row in arXiv v3 p. 11. The specified nilpotent E₃₁+E₄₂+E₅₃+E₆₄ has two length-three Jordan blocks. Hence V₆=Std₂⊗Sym², and End(V₆)−1=Ad_H⊗Sym⁰ ⊕ (1⊕Ad_H)⊗(Sym²⊕Sym⁴). The full two-variable weight character has dimension 35; the printed row has dimension 27 if std₂ denotes the 3-dimensional PGL₂ representation. The extraction makes that dimension convention explicit. A two-dimensional PGL₂ standard representation would not repair it. This refutes the row as a full decomposition, not the evenness consequence.

Correction: For Model 1, ρ₀=Ad_H and ρ₂=ρ₄=1⊕Ad_H; retain trivial multiplicities for the full Lie algebra. Other rows require their own reconstruction (G8).

### E16 — misprint, confirmed

Author April 2025 §1.3 p. 7, definition of Δ₁. The third slot throughout §1.1 is a symplectic representation, and the fourth is an SL₂ homomorphism. The printed order reverses their types; item 20 originally copied it.

Correction: Write Δ₁=(H′,H₁,ρ_H₁,ι₁).

### E17 — misprint, confirmed

Author April 2025 (5.12), p. 21. The u on the left is bound by integration over N₁; the printed right side retains a free u. Equations (5.2) and (5.8) say N₁ fixes 0 in 𝒥 and acts on Y′ by translation, giving item 96.

Correction: The right side is φ(a,0)∫_(Y′(𝔸))φ′(Y)dY.

### E18 — gap, confirmed

Author April 2025 §1.1 p. 3, citation to BZSV Proposition 5.1.1. BZSV arXiv 2409.04677v1 Proposition 5.1.1 assumes an algebraic F-subgroup, a square of a character Chern class in absolute H⁴_et(BH,ℤ/2), and nonarchimedean residue characteristic ≠2. Its footnote 36 changes to an S¹-pushout elsewhere, and Remark 5.1.3 explicitly distinguishes geometric from absolute anomaly. These conditions and gluing do not follow just from the geometric definition quoted by MWZ. No counterexample to the six particular splittings is asserted.

Correction: Supply absolute arithmetic anomaly data, an actual splitting on the relevant image or pullback with its precise domain, and compatible local/adelic/rational choices. The cited proposition alone gives only the local statement in item 6.

## Remaining work and resumption

- **G1 — Published-version collation**: Read the subscription main text and compare every numbered result, sign and local-character normalization. Published notes 4–6 and 8 contain additions absent from the author draft. All source-error confirmations are version bounded.
- **G2 — BZSV geometric and cohomological supplier closure**: Decompose Hamiltonian reduction, symplectic normal bundles, Slodowy slices, BB contraction, Luna finiteness, Losev/Rosenlicht and equivariant Chern classes with exact owners. Selected BZSV definitions and proofs were read, not the entire book or their cited suppliers. Characteristic-zero structure theory must not silently extend to arbitrary global fields.
- **G3 — Arithmetic anomaly and adelic splitting**: Read BZSV Appendix E.3 and verify the six image/pullback splittings, absolute versus geometric anomaly, dyadic/real S¹ versus double-cover conventions, rational compatibility and the central quotients.
- **G4 — Mao–Rallis 1997 coordinate identities**: Acquire and read §2, Proposition 3, Theorems 1–2 and Lemmas 4–5. Record the cubic norm/cross-product normalization, integral lattices, coordinate derivative signs and Model 2 extension. The main paper cites these proof steps without supplying them in full.
- **G5 — Model 6 Fourier–Jacobi and dyadic normalization**: Derive the n=3 analogue including every coordinate, lattice, singular slice measure and Gaussian pair. The detailed Model 5 computation uses two pairs and |4|; the Model 6 analogue is omitted. Do not extrapolate its dyadic factor or infer a confirmed source error from dimensional suspicion.
- **G6 — GRS and Mao–Rallis 2004/2010 comparison hypotheses**: Read MR04 (2.31)/(2.34), MR2010 Theorem 2.1 and GRS1999 Theorem 2/root exchange. Fix the representation class, vanishing input, finite S, operator convergence and normalization. Only their use in the main paper was independently read.
- **G7 — Exact algebraic and integral model representations**: Reuse the pinned E₇ carrier/comodule and type-B/type-D lattice results (103–105), then verify the exact group identifications, central kernels, invariant alternating forms, half-spin/tensor adapters, root conventions and arithmetic lattice normalizations. Upstream ReductiveGroups Layer 9 owns the carrier-identification/root-group infrastructure; LieHighestWeight Layer 8 supplies exceptional form data. Do not rebuild these suppliers.
- **G8 — Full Table 3 repair**: The Model 1 two-variable character is corrected. Compute all remaining full characters before extracting Euler factors, and state any convention discarding invariant/trivial summands. Dimension checks alone do not supply the other five corrected rows.
- **G9 — Jordan and nilpotent-orbit ownership coordination**: Coordinate the pending LieHighestWeightPartIINilpotentOrbits and ExceptionalThetaCorrespondencesForG2 candidates. The latter already proposes the 9/15-dimensional Jordan inputs; do not add a second copy. Decide the single generic cubic-norm owner and import its 7/27-dimensional extensions before accepting that design route.
- **G10 — Conjectural spectral normalization and analytic domains**: Extract precise local relative characters, Plancherel, period convergence/regularization, global constants and spectral isolation from BZSV/SV/Lapid–Mao/Wan–Zhang. Quoted equals signs are not complete identities. Global Langlands groups and general Arthur packets remain conjectural inputs.
- **G11 — Granularity of model generator calculations**: Split each remaining multi-generator/multi-model proposition into individual declarations and prove root relations and word independence. The extracted coordinate tests detect mistakes but do not replace these proofs.
- **G12 — Small-box and stationary-phase closure**: Turn the repaired volume and phase bounds into complete local analytic proofs, including supports accumulating at zero, compactness/partition steps, self-dual measures and singular-germ uniqueness. Do not infer global/archimedean transfer from these p-adic calculations.

Resume by obtaining the journal main text and MR97/GRS supplier statements, resolving the generic norm owner, reconstructing the other Table 3 rows and deriving Model 6 explicitly. Do not activate the rejected design routes or label the extraction complete until those obligations and the listed analytic/source gates are discharged.

## Exact pinned imports

| Reference | Module and line |
|---|---|
| `mathlib:LieAlgebra.HasTrivialRadical.instIsKilling` | `Mathlib/Algebra/Lie/CartanCriterion.lean:257` |
| `mathlib:LieAlgebra.IsKilling.killingForm_nondegenerate` | `Mathlib/Algebra/Lie/Killing.lean:65` |
| `mathlib:killingForm` | `Mathlib/Algebra/Lie/TraceForm.lean:373` |
| `mathlib:killingForm_apply_apply` | `Mathlib/Algebra/Lie/TraceForm.lean:376` |
| `tauceti:TauCeti.AlbertAlgebra` | `TauCeti/Algebra/AlbertAlgebra.lean:104` |
| `tauceti:TauCeti.AlbertAlgebra.diagIdempotent_mul_diagIdempotent` | `TauCeti/Algebra/AlbertAlgebra.lean:376` |
| `tauceti:TauCeti.AlbertAlgebra.finrank_eq_twentySeven` | `TauCeti/Algebra/AlbertAlgebra.lean:208` |
| `tauceti:TauCeti.AlbertAlgebra.linearEquivProd` | `TauCeti/Algebra/AlbertAlgebra.lean:190` |
| `tauceti:TauCeti.AlbertAlgebra.sum_diagIdempotent` | `TauCeti/Algebra/AlbertAlgebra.lean:389` |
| `tauceti:TauCeti.AlbertAlgebra.trace` | `TauCeti/Algebra/AlbertAlgebra.lean:308` |
| `tauceti:TauCeti.E7Minuscule.groupScheme` | `TauCeti/Algebra/Lie/E7/Minuscule/Carrier.lean:188` |
| `tauceti:TauCeti.E7Minuscule.isFaithful_standardComodule` | `TauCeti/Algebra/Lie/E7/Minuscule/StandardComodule.lean:87` |
| `tauceti:TauCeti.E7Minuscule.points` | `TauCeti/Algebra/Lie/E7/Minuscule/Carrier.lean:293` |
| `tauceti:TauCeti.E7Minuscule.standardComodule` | `TauCeti/Algebra/Lie/E7/Minuscule/StandardComodule.lean:62` |
| `tauceti:TauCeti.Sl2Std.existsUnique_nonempty_lieModuleEquiv` | `TauCeti/Algebra/Lie/Sl2/Classification.lean:216` |
| `tauceti:TauCeti.SpinPolarizationData.typeBSpinRep_kostantForm_apply_mem_integralLattice` | `TauCeti/RepresentationTheory/Spin/Polarization/TypeB/KostantLattice.lean:290` |
| `tauceti:TauCeti.SpinPolarizationData.typeDSpinRep_serreKostantForm_apply_mem_integralLattice` | `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/KostantLattice.lean:344` |
| `tauceti:TauCeti.exists_isCompl_sl_fin_two` | `TauCeti/Algebra/Lie/Sl2/CompleteReducibility.lean:149` |

## Validation

The paper checker and four-file swarm intake check pass. Additional checks verify unique item IDs, acyclic dependencies, valid planned/source stages, exactly one route per missing item, conjecture kinds, definition APIs/tests/uses, source verdicts and pinned file hashes.

Exact diagnostics reconstruct the Model 1 two-variable character (35 versus 27), the nilpotent ranks (4,2,0), and the corrected 8-dimensional symplectic polarization. They distinguish ψ(1/5) from ψ(−1/5), test reciprocal Haar normalization at five rational volumes, and check 72 finite-character cases of the two-variable integral by reduction modulo cyclotomic polynomials, including residue characteristic 2. These are focused algebraic checks, not proofs of the global conjectures, source trace identities or omitted Model 6 formulas. No Lean file was requested or compiled; nothing is claimed newly formalized.
