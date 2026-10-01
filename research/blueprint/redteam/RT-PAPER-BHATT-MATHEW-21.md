# Red team: Bhatt–Mathew, The arc-topology

Codex · `codex-rtOQ9t` · 1 October 2026 · Refs #4188

Eight findings require verification: six high and two medium. The audit covers every page of the 64-page [arXiv v4](https://arxiv.org/pdf/1807.04725v4), every extraction item, all routes and prerequisites, the accepted review and its three source diagnostics. The [published article](https://doi.org/10.1215/00127094-2020-0088) could not be retrieved: its PDF endpoint returned HTML. Every source finding below is therefore limited to v4. No failure of the main arc-descent theorem is claimed.

The machine-readable report preserves input hashes, pinned-library commits, checked declarations, source hashes and limitations. Its source PDF hash agrees with the extraction and accepted review.

| Finding | Severity | Correction |
|---|---|---|
| 1 | High | Require the kernel to lie in the prime in Lemma 4.3; handle the complementary case in Lemma 4.4. |
| 2 | High | Restore the rank-at-most-one restriction in item /77. |
| 3 | High | Remove two false comparisons with the v-topology on schemes. |
| 4 | Medium | Apply the already accepted E3 correction to /27. |
| 5 | High | Restore noetherian scope for K-theory and use vertical localization fibres. |
| 6 | High | Restore finite coefficients; import the constructible category from its existing owner. |
| 7 | Medium | Register seven further source proof corrections. |
| 8 | High | Add three key imported theorem items and their routes. |

## 1. High — item /80 (Lemma 4.3), /81 (its use in Lemma 4.4), sourceIssues

The extracted Lemma 4.3 is false for the arbitrary homomorphism V→W it permits: pW proper does not imply that pW contracts to p. The preprint has the same missing kernel hypothesis, and none of E1–E3 records it.

arXiv v4 pp.25–26, Lemma 4.3(1): “and pulls back to p in V”. Take any nonfield absolutely integrally closed valuation ring V, maximal ideal m≠0, W=V/m, and p=0. The residue field W is algebraically closed, hence is an absolutely integrally closed valuation ring. Then pW=0≠W, but its inverse image is m. There is no prime of W over 0, and W⊗_V Frac(V)=0, contradicting part (2) as well. The first proof step replaces V by its image without requiring ker(V→W)⊆p. PDF page images and the v4 TeX confirm the statement. This is a finding against v4; the publisher did not serve the published text.

**Repair.** Add ker(V→W)⊆p to /80 (injectivity is a sufficient stronger version), and add a version-scoped sourceIssues error affecting a stated result. Quotienting V by the kernel then makes the printed reduction legitimate. Repair /81’s proof application without narrowing its theorem: if p is strictly below the kernel, pW=0 and both localizations W⊗V_p and W⊗κ(p) vanish, so the excision square is immediate; otherwise apply the repaired lemma when pW≠W and keep the existing pW=W case. Retain the residue-field quotient as a regression counterexample. No failure of Theorem 4.1 is inferred.

## 2. High — item /77; corresponding reader and route-1 valuation discussion

The negative assertion deletes the rank bound from Remark 3.31 and contradicts its own positive assertion. It claims that k[x,y] has no arc-cover whose components are valuation rings, after asserting every ring has a v-cover with exactly that property.

arXiv v4 p.23, Remark 3.31 restricts the negative assertion to components of rank ≤1. Proposition 2.1, item /28, says every v-cover is an arc-cover. Therefore the v-cover in the first half of /77 is itself a counterexample to its second half. The source correctly distinguishes arbitrary-rank components from components of rank at most one.

**Repair.** Restore rank ≤1 in the negative assertion and name the item accordingly. Preserve existence of v-covers with arbitrary-rank valuation components. This is an extraction error, not a new source erratum. Check that the design brief and reader do not export the unqualified negative claim.

## 3. High — notes of /46 and /96; route-1 comparison with the v-topology

Two explanatory notes give false contrasts with the v-topology on all qcqs schemes: /46 says inverse-limit stability is false for v-covers, and /96 implies that this v-topology is subcanonical.

For /46, v4 Corollary 2.20 proves the arc statement, while Remark 2.18 contrasts spectral submersions with ordinary submersions, not with v-covers. Anschütz–Gleason–Lourenço–Richarz, On the p-adic theory of local models, author PDF p.73, Example A.3, explicitly uses inverse-limit stability of v-covers between affine schemes. For /96, take X=Spec(k[ε]/ε²) and Y=Spec(k). Y→X is a v-cover: every map from a valuation domain kills ε. It is a monomorphism, so all its Čech terms are Y. The representable A¹ has h_A¹(X)=k[ε]/ε²→h_A¹(Y)=k, which is not injective. Thus it is not a v-sheaf. The target itself records universal-homeomorphism invariance of v-sheaves in /139 (v4 Proposition 6.24, p.54). Subcanonicity on perfectoid spaces or perfect schemes is a different assertion.

**Repair.** Delete the false v-cover note in /46 and keep the actual spectral-versus-ordinary-submersion comparison with its hypotheses. State in /96 that neither the arc-topology nor the v-topology on all qcqs schemes is subcanonical; retain the valid fpqc contrast. Add the dual-number example and explicitly distinguish the perfectoid/perfect-scheme sites when discussing their subcanonicity. Do not transfer results between these sites merely because their topologies share the name v.

## 4. Medium — item /27 versus /141 and accepted sourceIssue E3

The accepted correction E3 has not been propagated into /27. That item still promises vanishing above dimension d for every torsion sheaf when the affinoid algebra is smooth, although the extraction’s own erratum and its final theorem item restrict what this version proves.

arXiv v4 Theorem 1.19 on p.7 is stronger than Theorem 7.3 and Remark 7.4 on pp.56–57. E3, confirmed by REV-PAPER-BHATT-MATHEW-21, already explains this discrepancy. Theorem 7.3 gives d+1 for arbitrary torsion sheaves and d for residue-characteristic-prime-to torsion. Remark 7.4(2) discusses the smooth case with constant coefficients. Item /141 and route 1’s final theorem are already restricted correctly, but /27 retains smoothness alone as sufficient for an arbitrary sheaf.

**Repair.** Make /27 refer to the corrected /141 bounds and link E3. If retaining the smooth constant-coefficient refinement, give it a separate explicitly qualified remark-level item with its stated proof frontier. Do not file E3 again as a new discovery and do not weaken the already-correct route brief. Protocol §18 requires items to use the corrected statements.

## 5. High — item /120, route 4 (GeneralAlgebraicKTheory:K.6), sourceIssues

The K-theory formal-glueing item drops the noetherian hypothesis governing source Example 6.1 and repeats its incorrect identification of the horizontal fibres. This asks K.6 for a stronger theorem than the cited passage provides.

arXiv v4 p.47 introduces square (15) for a noetherian A, then Example 6.1 applies K-theory to that square. The source labels the support K-theory fibres “horizontal”, but they are fibres of the vertical localization maps K(A)→K(A[1/t]) and K(Â_t)→K(Â_t[1/t]). For a field A=k and t=0, the completion maps are identities, whose fibres vanish; the category of perfect t-power-torsion modules is Perf(k), whose K₀ is Z. Thus the horizontal-fibre explanation is false even in a noetherian example. Item /120 instead starts with an arbitrary ring and repeats the fibre-direction error.

**Repair.** Restore noetherian A to /120 and to its K.6 source contract, unless a separate theorem is supplied with explicit sufficient hypotheses for a broader ring class. Correct horizontal to vertical in the item’s explanation and add a sourceIssues misprint against v4 Example 6.1, affecting the proof. Keep support K-theory distinct from the relative theory of A→A/t. Do not infer this K-theory theorem just from the arbitrary-ring arc-sheaf formal-glueing theorem: K-theory has not been asserted to be an arc-sheaf.

## 6. High — items /109–/113 and route 1; EDC.0 import

The constructible-complex definition and its subsequent descent statements omit the finite-coefficient-ring hypothesis. In addition /109 is marked missing and routed for construction in ArcTopologyAndDescent even though the same route explicitly imports the constructible coefficient category from EDC.0.

arXiv v4 p.41 fixes a finite ring Λ before Notation 5.8; Propositions 5.10–5.12 and Theorem 5.13 continue with that convention. The extraction replaces it by an unqualified coefficient ring in /109, and /110–/113 carry no replacement guard. The finite-ring condition matters to the stated identification with finitely generated Λ-modules: over a square-zero algebra Λ=k⊕M with M infinite-dimensional, multiplication by a nonzero m∈M has kernel M, which is not finitely generated, although its source and target are Λ. Finitely generated modules need not form the abelian category the item assumes for arbitrary Λ. The atlas EDC.0 and EDS E1 plan/import the constructible coefficient and enhanced derived interfaces, and the target route itself names EDC.0 as their supplier.

**Repair.** Attach finite Λ explicitly to /109–/113 (or an explicit shared convention referenced by all five items), preserving Remark 5.9’s separate finite-Tor-dimension variant. Mark the common constructible coefficient category /109 as planned against EDC.0 with its EDS enhancement import, remove it from the missing-item construction route, and keep the new arc/v descent theorems /110–/113 in ArcTopologyAndDescent. Do not rebuild the coefficient category under a new name. Update counts and reader consistently.

## 7. Medium — sourceIssues; /28, /58, /76, /83, /88, /107–/108, /145

Further source proof slips are not registered in E1–E3. The most substantial is that the finite-chain description in the proof of Theorem 5.6 restricts morphisms to injections, whereas the category being descended has all morphisms of étale schemes.

All locators refer to arXiv v4. (a) p.40, proof of Theorem 5.6(2), identifies F₀ with Fun(chainᵒᵖ,FinSet_inj). Over an algebraically closed field, the fold Spec(k)⊔Spec(k)→Spec(k) is a morphism of finite étale schemes, but its map of finite sets is not injective. (b) p.9, Proposition 2.1 proof: if V=k is a field and W=k[[t]], the minimal prime over m_V=0 is q=0 and maximal prime over 0 is q₀=(t); thus q₀⊄q and the displayed (W/q₀)_q construction is not the stated prime localization. (c) p.58, Lemma 7.8 proof, a positive lower bound is asserted for the minimum of the absolute values of unit-ideal generators. With f₁=X,g=1 at X=0 that minimum is zero; the maximum is bounded below. (d) p.27, Definition 4.6 starts with arbitrary valuation V but calls (V/p)_q absolutely integrally closed: take V=Z_p and the full interval to contradict this. /83 already uses the corrected ordinary valuation-ring wording without registering the source error. (e) p.19, Proposition 3.10 proof uses “coproducts” where its statement and sheaf axiom require products. (f) p.24, Proposition 3.32 proof writes F(S)→F(S) instead of F(S)→G(S). (g) p.30, Corollary 4.11 proof retains rank ≤1 after the Lemma 4.9 step that must establish contractibility on arbitrary-rank aic valuation rings before using v-hypercover resolutions. These corrections concern proofs or wording; no counterexample to the main descent results is claimed.

**Repair.** Add separate sourceIssues records for (a)–(g), with version scope, precise locators and the correction-search record. For (a) use the full subcategory of Fun(chainᵒᵖ,FinSet) on diagrams with injective transition maps, allowing all natural transformations; a rank-n spectrum has n+1 vertices. For (b) first handle the field case by W′=Frac(W), then use the prime-interval argument for rank one. For (c) replace minimum by maximum. For (d) retain ordinary valuation rings in the general definition and prove aic only under the corresponding hypothesis on V. For (e)–(g) correct products, the G target, and the arbitrary-rank conclusion respectively. Link each diagnostic to its existing item; preserve already-correct item statements.

## 8. High — items, prerequisites and routes; inputs to /118 and /138

Three key imported results used to prove extracted theorems are absent as items with statuses/routes: algebraic-space reconstruction from perfect complexes, the scheme Künneth formula used here, and the cohomology computation for a tensor product of aic valuation rings. A bibliography entry for Huber is not the required theorem item.

arXiv v4 p.45, Theorem 5.17 proof uses [Bha16, Theorem 1.5] to identify Hom(X^perf,Y) with exact symmetric monoidal functors Perf(Y)→Perf(X^perf) for qcqs algebraic-space Y. The full 146-item list has no such input, and Bha16 is absent from prerequisites. On p.54, Proposition 6.22 proof uses [Del77, Corollary 1.11] plus a limit argument for two corners of the formal-glueing square, and [Hub96, Corollary 4.2.7] for RΓ(Spec(R⊗_V R′),F_ℓ)≃F_ℓ when V,R,R′ are the aic valuation rings of that proof and ℓ is invertible in the relevant residue characteristic. Neither theorem occurs among /1–/146; /138 is the resulting completed generic-fibre formula, not either input. Pinned Mathlib ModuleCat.ringEquivEndForget₂ reconstructs a ring from its additive forgetful functor; pinned TauCeti.Tannaka.fgPointTensorIsoEquiv reconstructs Hopf-algebra points from finite comodules. Neither is Bhatt’s derived algebraic-space theorem.

**Repair.** Add one extraction item for each cited result, with its actual scope and primary locator; Protocol §16 does not require decomposing the supplier proof. For the scheme Künneth and valuation-ring cohomology inputs, route/import through SchemeAndStackFoundations:SF.2, retaining the ℓ-invertibility and valuation hypotheses and the separately required limit comparison. For derived algebraic-space Tannaka reconstruction, record the missing result and a Part II request in the SchemeAndStackFoundations direction, importing the shared perfect-complex enhancement; the present SF.1 description alone does not already promise this theorem. Make ArcTopologyAndDescent consume that result, rather than duplicating the existing Hopf/comodule Tannaka theory. Add Bhatt, Algebraization and Tannaka duality (2016), and Deligne’s cited finiteness paper to prerequisites where not already catalogued, and refine the Huber prerequisite to name the needed corollary. Update the reader and route accounting.

## Coverage and limits

The extraction has 139 missing, 3 planned and 4 library items. All 139 currently missing items are routed exactly once. The audit read the twelve cited library declarations at the required Mathlib commit and additional first-order ultraproduct and Tannaka declarations at the pinned commits. Existing ordinary carriers do not supply the new infinity-categorical descent theorems. Current atlas and draft-roadmap checks preserve the distinction between the scheme v-topology and the perfectoid v-topology.

The inverse-limit cross-check is in [Anschütz–Gleason–Lourenço–Richarz, Example A.3, p.73](https://www.math.univ-paris13.fr/~lourenco/affine_grass.pdf). Only that passage and the title page of this supplier were read. Main-paper references in finding 8 are evidence of omitted imports, not claims that this audit completed their proofs.

Correction searches included [arXiv history](https://arxiv.org/abs/1807.04725), [Mathew’s publications](https://math.uchicago.edu/~amathew/), [Bhatt’s IAS page](https://www.math.ias.edu/~bhatt/), publisher access attempts and focused title/lemma searches. No applicable correction was found; the published-version frontier remains open. The three existing accepted sourceIssues are preserved, and E3 is not presented as a new discovery.

Validation: the red-team schema checker, submission file-scope check and whitespace check pass. This issue authorizes two research reports and no Lean deliverable; no Lean build or language server was run. An independent verifier should check each finding before a fix job changes the extraction.
