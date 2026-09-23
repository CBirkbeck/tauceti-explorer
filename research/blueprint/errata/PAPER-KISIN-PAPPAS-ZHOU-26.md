# Reviewed mistakes in Kisin–Pappas–Zhou (2026)

Original errata job: ERRATA-PAPER-KISIN-PAPPAS-ZHOU-26, Claude Code — cc-442dc5.
Independent review: REV-ERRATA-PAPER-KISIN-PAPPAS-ZHOU-26, Codex — codex-a71f92, 23 September 2026, issue #1859.

Verdict: **complete; ten confirmed findings** (the inherited eight, amended where necessary, and new E9–E10). Three are errors and seven are misprints. E2 and E9 affect proof steps; none establishes a false main theorem. All ten retain `known: new` in the limited sense that no correcting erratum or later version was found in the searches below.

This replaces the original report's overstatement that Proposition 4.2.10(2) and subsequent equalities involving l_α remain unestablished. A direct calculation from the right inclusion of (4.2.7) repairs that proposition in its full stated generality. E7's original explanation also repeated a false openness assertion; that separate issue and its repair are now E9.

## Sources and version control

The source is *Integral models of Shimura varieties with parahoric level structure, II*, Forum of Mathematics, Pi 14 (2026), e14, 1–89, DOI [10.1017/fmp.2026.10031](https://doi.org/10.1017/fmp.2026.10031).

- [Cambridge repository copy](https://www.repository.cam.ac.uk/bitstreams/0e19314e-a580-4923-9d91-22f699fc3c42/download): SHA-256 `b3e4bf8beb8a21bca37e7c00298d8e96c2cce4121e1b06d0e164645891481f31`. This exactly matches the copy named by the errata author.
- [Publisher PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6C2640CC5856BDF975AF97EE30CA7906/S2050508626100316a.pdf/integral_models_of_shimura_varieties_with_parahoric_level_structure_ii.pdf): SHA-256 `20c4c83efd654e86a9aa41de184b5ea7f7a42672d2adfee81244db141b373bce`, 89 pages. Downloaded 23 September 2026. Publisher distribution footers can make a later download's hash differ.
- [arXiv v3](https://arxiv.org/pdf/2409.03689v3), 9 April 2026, 94 pages: SHA-256 `d0834555eb84db295778cdf43f403591740bb4599ae46d4cfc01a12ae3fcd615`.
- [Kisin's linked author copy](https://people.math.harvard.edu/~kisin/dvifiles/ParahoricII.pdf), 88 pages: SHA-256 `117d3640b7548480594380a4156105b507be62d2d9facf3cba5ba5a72b526b0d`. This is not the publication or v3: even the §5.3 numbering differs. Spot checks of the normal-surface, weight-action, B/D, corollary-sign and polarization passages found the same relevant defects. No later-version date is inferred from the current link.
- [Deligne 1979, original article](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf): SHA-256 `591ee837c4c87e5263b76427b393742e111d615c6e098c940f132519a0861922`. For E9, read §§1.1.10, 1.1.15 and 1.1.18 on printed pp.253,255–256 as images.

The named repository and publisher copies agree in normalized page text on pp.31,33–41,56–60,78–79 (only whitespace and publisher download/footer lines removed). Direct reading covered the definitions and proofs needed for each finding, not the entire paper. Publisher images inspected: pp.31,33–35,37–41,60,79; v3 p.82 was also inspected as an image. In v3 the principal locators are E1 p.33; E2 pp.35–39; E3 pp.35–37,39,43; E4 pp.39–40; E5 p.40; E6 p.41 and its use p.43; E7/E9 p.82; E8 pp.61–62; E10 p.35.

The extraction's earlier E1–E7 concern corrections to KP18/P23, not mistakes in KPZ. They are not reimported here. The extraction and its handoff remain untouched; in particular, their old claim that the general bound in Proposition 4.2.10(2) is open is superseded for this review by the argument below, not silently edited.

## E1 — the surface is not normal

Confirmed, error / affects nothing.

In Remark 4.1.5(2), p.31, the ring should first be written k[x,y,z]/(x²+xyz). It factors as x(x+yz). Its two components x=0 and x=−yz are both smooth graphs, but their meeting at the origin produces nonzero zero divisors in the local ring there. Thus it is not normal.

The example's actual purpose survives. There is no linear term in the relation, so dim T₀X=3; its initial ideal is (x²), so the reduced tangent cone is the plane x=0. If an arc through the origin has coordinates f,g,h∈t k[[t]], then f(f+gh)=0 in the domain k[[t]], so f=0 or f=−gh∈t²k[[t]]. All arc tangents lie in x=0, and the y- and z-axis arcs span that plane. Delete “normal”; no assertion about P95's local-model identification is needed to prove this defect.

## E2 — false weight-action equivalences, but a stronger repair

Confirmed, error / affects the proof. The original “a stated result” reach and description of the downstream damage have been narrowed.

### Explicit failure

The paper defines V(ν) as a Weyl module and works over characteristic p, not characteristic zero. For GL₂, α=e₁−e₂ and highest weight (p,0), use the integral divided-power basis v_i=F^(i)v₀, 0≤i≤p. Its weights and root actions are

```text
wt(v_i) = (p−i,i)
E v_i = (p−i+1)v_(i−1)
F v_i = (i+1)v_(i+1).
```

Reduction modulo p gives E v₁=0 although the adjacent weights (p−1,1) and (p,0) both occur. Moreover F v₀=v₁≠0, so the asserted opposite-root pairwise symmetry fails too. The integral divided-power basis matters: substituting the induced module Symᵖ would change the coefficients.

The range assertion at the end of the proof of Proposition 4.2.10(2) is also false under the nonzero-action definition. Taking ν=(p,0) and input v_p gives E v_p≠0. The pair assigned in that proof has highest weight (0,−p) and source weight (−1,1−p). In Δ(0,−p)=Δ(p,0)⊗det^(−p) the latter is the i=1 weight, on which E has coefficient p=0. Thus an allowed input need not even land in W(α).

These are genuine defects. But they do not show the proposition's numerical bound is false.

### Direct proof of Proposition 4.2.10(2)

Keep W(α) defined by nonzero root action. Put A=k[ε]/(ε²), L=V(ϖ)⊗A[[t]], r=⟨λ,α⟩−l and g=(1+εtʳX_α)t^λ. The **right** inclusion of (4.2.7) says

```text
L ⊂ t^(−⟨μ,ϖ⟩)gL,
equivalently t^⟨μ,ϖ⟩ g⁻¹ L ⊂ L.
```

For a weight vector v_β,

```text
g⁻¹v_β
 = t^(−⟨λ,β⟩)v_β
   − ε t^(r−⟨λ,β+α⟩)X_αv_β
 = t^(−⟨λ,β⟩)v_β
   − ε t^(−⟨λ,β⟩−l)X_αv_β.
```

If X_αv_β≠0, integrality forces
l≤⟨μ,ϖ⟩−⟨λ,β⟩. Taking the minimum over W(α) proves l≤l_α for arbitrary dominant ϖ. The lower bound l≥1 comes from the tangent-space exponents in §4.1.7. No Weyl/induced-module identification is used.

Remark 4.2.8(3) calls V(−w₀ν) the dual of V(ν); in positive characteristic the contragredient is generally an induced module instead. Do not use that identification to discard the right inclusion which the definition explicitly imposes.

### Downstream scope

Under Proposition 4.2.13's hypothesis, let j_α be its minimum over the minuscule set S. The repaired bound and the root curves give k_α≤l_α≤j_α. Its independent proof of k_α≥j_α remains valid:

- for minuscule modules all relevant root strings have length at most one, with nonzero coefficients ±1, so j_α=j_(−α)+⟨λ,α⟩;
- the reduction to negative roots uses this identity for j, and Proposition 4.2.2(1) for k, not the invalid general-weight pair symmetry;
- for a negative root, the displayed minuscule pairing calculation on p.37 verifies the S-inequalities for (λ−j_αα∨)^dom, which imply the desired dominance by (*).

Consequently k_α=j_α=l_α, and Φ^cur=Φ^tan=Φ^FM in these cases. Proposition 4.2.13's full equality, Remark 4.2.16 and the sign-corrected Corollary 4.2.19 are therefore retained. The old report's statement that only k=j is secured was too weak.

The unrestricted numerical identity in Proposition 4.2.10(1) has an invalid printed proof (it uses the false pairwise symmetry). This review neither supplies a general replacement proof outside the minuscule-set hypothesis nor claims a counterexample to that numerical identity. Likewise it does not independently certify every assertion about the general FM scheme. The precise confirmed defect and the repairs needed by the downstream application are as above.

## E3 — characters, cocharacters and a garbled membership

Confirmed, misprint / affects nothing.

In §§4.2.5–4.2.6, §4.2.9 and Proposition 4.2.10's proof, ν and ϖ are dominant **characters**, in X*(T)⁺: they label representations and pair with cocharacters. In Proposition 4.3.9, λ is instead in X_*(T)⁺. The reversed sub/superscripts and “cocharacter” for ϖ are slips.

The published end of the proof of Proposition 4.2.13, p.37, also garbles its membership formula. Restore (ϖ,w⁻¹ϖ)∈W(α), as printed in v3 p.39. Here ϖ is minuscule and the preceding pairing is −1, so this membership is valid in characteristic p and is distinct from E2's invalid general assertion.

## E4 — B/D lattices, weights and adjacent coordinate slips

Confirmed, misprint / affects nothing.

For B_n the root lattice is Zⁿ and the coroot lattice is the even-total-sum sublattice. Thus P∨=Zⁿ, but P=Zⁿ+Z·(1/2,…,1/2). The spin weight in the very next display makes the printed identification P=Zⁿ impossible.

Replace Σ_(j=1)^i e_i by Σ_(j=1)^i e_j in the B and D fundamental weights. Pairing the corrected weights with simple coroots gives the defining Kronecker delta.

Two nearby slips were added within this coordinate finding: the B calculation on p.38 gives the partial-sum equality only for i<n; the spin pairing at i=n has an extra factor 1/2. Its sign is unchanged. In the D half-spin sum on p.38 the summand is ν_j, not ν_i under an index j. Neither changes the proof of the S-test.

## E5 — D's final root and half-spin sign

Confirmed, misprint / affects nothing.

The last simple root is e_(n−1)+e_n, not 2e_(n−1). Since D is simply laced, the half-spin coweights have the displayed final coordinates −1/2,+1/2. Thus sϖ∨_(n−1)+tϖ∨_n has final coordinate (t−s)/2, the negative of the printed q/2 when q=s−t.

The old explanation incorrectly said none of the half-spin pairings involves this coordinate. They do, but those pairings are assumed nonnegative in the S-test. The only new inequalities to deduce are for i≤n−2; they follow from r/2−ν₁≥0 and dominance using the first n−1 coordinates alone. That is why the case argument survives.

## E6 — Corollary 4.2.19 has the wrong root sign

Confirmed, misprint / affects nothing.

Lemma 4.2.18 minimizes over W(−α), so its corollary must read

```text
k_(−α) = min_(ϖ∈S) (⟨μ,ϖ⟩−⟨λ,ϖ_α⟩) = l_(−α).
```

The proof of Proposition 4.3.9 uses exactly this sign. For GL₂ and λ=μ=(1,0), the dominance definition gives k_α=1 and k_(−α)=0; the displayed minuscule minimum is 0. E2's repaired squeeze justifies the equality with l_(−α), rather than leaving it doubtful.

## E7 — real base change and damaged prose in Lemma 7.2.8

Confirmed, misprint / affects nothing.

Replace Bil_Hc(V)⊗_Q F by Bil_Hc(V)⊗_Q R, since F⊗_Q R is the product over real embeddings. The publisher's p.79 really contains duplicated and garbled prose; this is not a text-extraction artifact. v3 p.82 preserves h=∏h_σ and the weight homomorphism w_σ. Restore h_σ:S→H′_(R,σ), with Int(h_σ(i)) inducing the Cartan involution modulo the weight torus. v3's F,σ subscript here should also be R,σ.

The choice of Ψ is interpreted via the embedding of the rational form space in its real scalar extension, with σ ranging over embeddings F→R, not elements of F. However, the original report's density argument used the wrong ambient open set. E9 supplies the additional repair. v3 restores the damaged sentence, but still has the base-change and openness problems: it is not a correcting later version for this finding as a whole.

## E8 — a quotient cannot map through the chosen formal curve

Confirmed, misprint / affects nothing.

In the proof of Proposition 5.3.11, p.60, c is defined over Ŵ(R_G/𝔞_G), where 𝔞_G=𝔪_G²+(π_E). The composite R_G→k[[u]]→k[ε] kills 𝔞_G, but the intermediate map to k[[u]] need not.

For example, on a smooth GL₂ Grassmannian chart R_G=W(k)[[x]], take x↦u. Then x² maps to u²≠0, whereas its image in k[ε] is zero. Thus delete Ŵ(k[[u]]) from the claimed base-change arrow out of Ŵ(R_G/𝔞_G), obtaining the direct map to Ŵ(k[ε]). The preceding tensor-product display already uses this direct map.

Constant curves may factor through the quotient; the original absolute claim that none can do so was too strong. The proof only needs the composite to dual numbers, so its mathematical argument is unchanged.

## E9 — the polarization cone is not open in all bilinear forms

Added on independent review; confirmed, error / affects the proof.

The space Bil_Hc(V) in Lemma 7.2.8 is explicitly all invariant bilinear forms. Its polarization subset is not generally open in that space.

Take F=Q, G=GSp₂≅GL₂ with the usual Shimura datum, and the fundamental embedding on V=Q²⊗Q², with the second factor a trivial multiplicity space. Then Hc=SL₂ and the invariant bilinear forms are J⊗A with A∈M₂(Q), where J is the standard alternating form. The form J⊗A is alternating iff A is symmetric. With the compatible polarization sign convention the cone is the positive-definite symmetric matrices. This is open in Sym₂(R), but has empty interior in M₂(R): perturb the identity by an arbitrarily small nonsymmetric matrix.

The repair is to use the F-linear subspace Alt_Hc(V) of invariant alternating forms. It commutes with real base change, so its real extension is the product of the local alternating-form spaces. Since h_σ(U(1)) lies in Hc_(R,σ), for an invariant alternating form b the form b(x,h_σ(i)y) is symmetric; positivity is then an open condition in this subspace. The Cartan-involution argument supplies nonemptiness. Rational points in a finite-dimensional Q-vector space are dense in its real extension, so the product of these nonempty open cones meets Alt_Hc(V). The resulting Ψ is alternating and positive at every real place, and Tr_(F/Q)Ψ is the desired polarization. The action of H′, generated by Hc and homotheties, is by similitudes as required.

Deligne's §1.1.10 explicitly requires symmetry as well as positivity; §§1.1.15 and 1.1.18(a) give the existence input. They do not make all invariant bilinear forms alternating. We are not recording a separate erratum against Deligne in this job.

## E10 — root-direction sets form disjoint unions

Added on independent review; confirmed, misprint / affects nothing.

In §4.2.4, p.33, the Schubert varieties are correctly expressed as a product, but the following products of the sets Φ^cur and Φ^tan should be disjoint unions. Each set consists of pairs (root,exponent); a root of a product group belongs to one factor. Tangent spaces of the product are direct sums, not tensor products of root directions.

For G=GL₂×GL₂, λ=μ=((1,0),(1,0)), each factor's minuscule Schubert variety is P¹ and contributes one direction (α,0). The product has two root directions, whereas the printed Cartesian product of two singleton sets has one element. The disjoint union has the correct two elements. This restores the intended factorwise reduction and leaves the theorem unchanged.

## Correction search and limits

On 23 September 2026, the journal article page yielded no linked correcting article; its own §7.3 concerns earlier papers. Crossref's relation field was empty and its update-policy field was merely a publisher-policy URL. The arXiv history still ended at v3 (9 April 2026). Kisin's current publication list and Zhou's Cambridge publication listing showed no separate correction; the linked Kisin copy was checked as described above. An exact-title/author correction search found no relevant later correction.

These are bounded searches, not proof that no correction exists anywhere. An intact earlier preprint sentence is distinguished from an erratum correcting the publication. The repairs of E2 and E9 are this review's mathematical arguments, not attributed to the authors.

Only the errata pair, this job's review and its handoff are changed. No paper extraction, atlas data, queue, generated register or Lean file is changed. Nothing is sent to the authors.
