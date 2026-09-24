# REV-PAPER-DISEGNI-22

Status: complete independent review. Verdict: **revise**. Corrected extraction: **partial**. Only corrected route 9 is accepted.

Reviewer: Codex — codex-a71f92, 24 September 2026. Input author: Claude Code cc-7b31c4, PAPER-DISEGNI-22 (#1260), PR #2177. I did not write an input checkpoint. Review claim #1261 was confirmed by bot comment 5804851257 after claim comment 5804849857. Snapshot: `816816edb94957b0536190dabbc9b7fe334b741e`.

## Evidence and version boundary

All 153 input items, nine routes (including both briefs), seventeen prerequisite entries, six input source findings and the human report were checked. I read all 6803 lines of the [v4 source](https://arxiv.org/src/2001.00045v4), including the introduction, §§2–7, Appendices A–B and bibliography, checking formulas against its 89-page [PDF](https://arxiv.org/pdf/2001.00045v4). This is not a claim that the extraction is now exhaustive at declaration level.

SHA-256 witnesses:

- v4 PDF: `c50d0cd394a5e803c0b7adef5700b425f4f304679415b2c666cd351eefcd9602`.
- v4 archive: `24d867874a39fd374d8820069c76e972d9260b7bc6b0b5617e2bafdcc86d330c`.
- `univ-corr-arxiv.tex`: `ca60c39e761b3e5b5dd0d4c6423c0eba4703b9065850ce5909a95b58d7399f2e`.
- [Author manuscript](https://disegni-daniel.perso.math.cnrs.fr/univ.pdf): `23870bcc1b71026159d2261012a5a49bf24188a6b05387a47cd727dcc22d5d06`, targeted collation at the findings, not another complete reading.
- [Published Correction PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01391-4.pdf): `73b6db959c194044f2daa0ec3b6174d363664ccbfe82a50dd12ae0ee0a455ff2`, both text pages read completely.

The [publisher](https://link.springer.com/article/10.1007/s00222-025-01391-4) dates the correction online to 17 November 2025, Invent. math. 243 (2026), 243–244. It is no longer merely “to appear.” Its restrictions and two errata agree with v4 Appendix B. The [arXiv history](https://arxiv.org/abs/2001.00045) still lists v4, 23 February 2024, as latest. The original 2022 journal PDF request returned a subscription HTML page: **that full text was not read**. Findings below apply to the explicitly identified public witness; the correction itself establishes the changes to the published theorem.

Targeted supplier checks:

- [Milne, Arithmetic Duality Theorems, second edition](https://www.jmilne.org/math/Books/ADTnot.pdf), I.2.8 and I.4.10(c): finite local Euler characteristic and high-degree global cohomology, for E10/E14.
- [Disegni, p-adic L-functions via local–global interpolation](https://disegni-daniel.perso.math.cnrs.fr/pLF-GL2.pdf), Appendix B: analytic-LLC corrections to Lemma 5.2.2 and Propositions 5.2.3–4 require Laurent polynomials, not ordinary polynomials.
- [Disegni, nonsplit primes](https://disegni-daniel.perso.math.cnrs.fr/nonsplit.pdf), Appendix B opening/Theorems A–B and Appendix C.1–2: the 2017 factor-two correction and the nonsplit restriction. The latter is also [published](https://doi.org/10.1017/S147474802400001X).
- Bibliography checked with primary publisher metadata: analytic LLC DOI is [10.1112/jlms.12285](https://londmathsoc.onlinelibrary.wiley.com/doi/abs/10.1112/jlms.12285), Katz DOI is [10.1007/BF01390187](https://link.springer.com/article/10.1007/BF01390187), and the local–global interpolation paper is Canad. J. Math. 75(3) (2023), 965–1017. These three input references were wrong.

No complete reading of those supplier papers is claimed. Nekovář's Selmer complexes has a public Numdam link, but its external theorem hypotheses still require a dedicated extraction. “New” in a finding means not corrected in the checked history, author page/manuscript and published correction; it does not assert an exhaustive search of all mathematical correspondence.

## Main mathematical checks

The corrected restrictions are essential: Theorems A, B and B^ord require (★), namely each nonsplit p-adic place is inert and its local character is unramified. D/E use Hida* families and no ramification above p. The original density argument must be replaced accordingly. Theorem C's universal class and the stated unaffected applications must not be restricted indiscriminately.

The normalization in the specialization comparison is also directional: the conormal-valued height h_{𝓥/𝓥♯} specializes to one half of h_𝓥. It is not a statement that every “family height” specializes to half of an independently chosen height. Item 115 now distinguishes these maps and retains the other comparison obligations.

Corrections in the early construction include: the positive torus contracts the unipotent subgroup by inclusion, not equality; X, X×Y and Z are curves but Y and Y′ are zero-dimensional; the finite residual abelian quotient is obtained only after the F_p^× quotient; the set Y is a torsor, not its completed linearization; an isomorphism of endomorphism sheaves is an O_X-algebra isomorphism; and a rank-n representation has endomorphism rank n².

The Selmer chapter needs the full cone and local-minus triangle, including H̃⁰; the correct Tor total degree; separate boundedness hypotheses; and a typed, duality-compatible transport for the conormal height. An arbitrary isomorphism of the two Selmer modules does not supply a symmetry theorem. The review confirms E16's typing defect only and leaves the exact geometric symmetry repair open.

The high-rank discussion is conditional. Item 124 no longer turns the paper's “many cases” parity evidence into an unconditional theorem; exact Nekovář hypotheses remain unextracted. Item 125 restores r_A≥r and r_A≡r mod 2 and separates Q_A, its completed Tate-uniformization image, the determinant of local points and the symmetric-algebra-valued logarithm. External hypotheses and the different vanishing/leading degrees still require splitting. The even Pfaffian construction is distinct from the defective odd prescription.

Appendix A requires separate absolute/relative ramification indices, unit factors in p=uϖ^e, and a repaired explicit nonsplit matrix computation. E20 does **not** disprove the Hecke-coset theorem. Likewise the lattice-denominator counterexample does not disprove the main Gross–Zagier formula. Proof failure, false auxiliary statement and false main theorem are not interchangeable conclusions.

## Pinned library and atlas checks

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The only original library item was 38. I read all three cited declarations, including their hypotheses:

| Declaration | Actual scope |
|---|---|
| `Matrix.isUnit_iff_isUnit_det`, LinearAlgebra/Matrix/NonsingularInverse.lean | Finite square matrices over a commutative ring |
| `LinearMap.isUnit_iff_isUnit_det`, LinearAlgebra/Determinant.lean | Endomorphisms of a finite free module |
| `PrimeSpectrum.isOpen_basicOpen`, RingTheory/Spectrum/Prime/Topology.lean | Basic opens in the prime spectrum |

They are reusable inputs, not the complete fibre/base-change comparison between two free modules. Moreover, the original item copied the false R/𝔭 version. Item 38 is now missing, with those reuse boundaries explicit. I also read `IsAzumaya` in Algebra/Azumaya/Defs.lean and `IsAzumaya.matrix` in Algebra/Azumaya/Matrix.lean. Their existence prevents a new private Azumaya carrier; it does not establish sheaf-local innerness or pseudorepresentation reconstruction.

Whole pinned-tree searches covered Pfaffians, Azumaya, co-Whittaker and ind-admissible families, Hida/eigenvarieties, Heegner/Selmer/Gross–Zagier, pseudocharacters, Weil–Deligne and toric periods, with broader cochains/hermitian/cotangent searches. Generic carriers and unrelated finite-group hits were not counted as the arithmetic theorem. The Tau Ceti Pfaffian hit is a comment, not the required construction. A negative name search alone is not a proof of absence.

Every originally cited layer description was inspected. Relevant reviewed entries of `data/library-coverage.json` were checked, not the entire global audit. Owners examined include PadicFamilies L0–L5; AutomorphicGaloisRepresentations R19.1–6; GL2AutomorphicRepresentationsAndTransfer R16/R17; GrossZagierAndArithmeticHeights GZ.0–9; SelmerIwasawaCohomology L0–4; ArithmeticGaloisDuality D7/D8/R02; AutomorphicPadicLFunctions L0–5 including L3h/L4e; HeegnerPointEulerSystems HE.0–8/8c; GeneralizedHeegnerCycles GH.0–8; HilbertModularVarietiesAndShimuraCurves H/R18; ModularIwasawaMainConjectures; PadicMeasuresIwasawaAlgebras; SmoothRepresentationsOfLocalGroups SR.5; ShimuraData D4, ShimuraVarieties V1/V8; AutomorphicLFunctionsAndLocalFactors AL.1 and IntegralHeckeAndGaloisDeterminants IHG.1.

Five planned items were too broad: 29 (unrestricted family representation), 79 (base-scheme Greenberg datum), 85 (idempotent Abel–Jacobi domain), 133 (Katz CM μ-input) and 135 (family Jacquet–Langlands). They are now missing, not silently rebuilt under the original layer labels. Item 9 instead names the actual Shimura tower/component owners. The other seventeen planned statuses mean planned interfaces, never completed formalizations.

## Route verdicts

### Route 1: reject

The Part II direction beyond GZ.9 is plausible, but the brief lists names instead of the exact corrected final statements and imports an unreviewed Selmer proposal as if available. Shared Azumaya, continuous-cochain and Pfaffian foundations need their owners; multipart results, source E17/E20 and exact external hypotheses remain open. Reject as a design instruction, not the research direction.

### Route 2: reject

Family Selmer heights belong beyond the current lattice-level owner, but this brief treats the unreviewed PAPER-DISEGNI-LIU-24 proposal as established and privately repackages D7/Selmer L2/L3 foundations. Corrected base change, full LES and duality-compatible transport need atomic statements and APIs. No second foundational implementation is approved.

### Route 3: reject

PadicFamilies L0/L5 cover ordinary families, not automatically this whole bundle of no-residual-irreducibility Galois reconstruction and family Jacquet–Langlands. Items 29 and 135 are now missing. Split in-scope sources from genuinely new family layers and give exact hypotheses before acceptance.

### Route 4: reject

R19.6 plans residual-absolutely-irreducible reconstruction over a completed Hecke algebra, not the general Azumaya-sheaf and line-bundle uniqueness theorem. Mathlib has Azumaya carriers and matrix examples; item 38 still needs the fibre/determinant bridge. Generic algebra needs its shared owner, not an undifferentiated source addition here.

### Route 5: reject

R16.2/R16.3 are pointwise local representation theory/LLC, while SR.5's Helm family theory is not Disegni's analytic correspondence. The recognition/open-locus theorem requires a separate family extension, reuse of SR.5 and the supplier's Laurent-polynomial erratum. Reject the present scope.

### Route 6: reject

L0/L1/L5 give character spaces, cohomological input and conditional comparison principles, not automatically the unconditional GL₂×GU(1) family construction and Katz normal-derivative nonvanishing. Separate those new layers, exact interpolation hypotheses and owners; a worked instance is not evidence of existing scope.

### Route 7: reject

HE.8's Q-based Howard/BCGS branch does not contain Fouquet's full totally real nearly ordinary quaternionic theorem. Item 129 suppresses substantive residual and ramification hypotheses. Extract the actual supplier theorem and route its extension before acceptance.

### Route 8: reject

L6 is the main-conjecture interface, not a proof owner. The self-dual CM-character branch and its Katz μ-nonvanishing need exact hypotheses and suppliers. Item 133 is no longer falsely claimed covered by the GL₂ square-root theorem at APL L3h. Reject pending a branch-owner decision.

### Route 9: accept

Accept corrected items 56,60,62 as local normalization and toric/Kirillov computations within GZ.4/GZ.5. Item 60 now uses the inverse character in the contragredient zeta factor and the correct dual twist, with the source's fixed-measure scalar convention. This adds local proof tasks, not a height-family design or a claim of formalization.

All 136 missing items remain assigned exactly once. Rejected route IDs and their provisional item lists are retained to make revision traceable; rejection means their existing text must **not** launch a design or enlarge an owner. In particular, the candidate SelmerComplexesAndPadicHeights from PAPER-DISEGNI-LIU-24 is unreviewed and is not an available theorem import.

## All source findings

### E1 — confirmed (known author correction)

Locator: Theorems A, B, B^ord, D, E and Lemma 7.1.4 in the body of arXiv:2001.00045v4; v4 Appendix B and published Correction, DOI 10.1007/s00222-025-01391-4. The original journal text was not independently accessible..

Theorems A, B and B^ord hold only under the extra condition (★): for each p-adic place v of F that is nonsplit in E, v is inert in E and χ_v is unramified. Assuming that no p-adic place of F is ramified in E, Theorems D and E hold for Hida* families — the irreducible components of the space 𝓔^{ord,*}_{K^p} built from the completed homology M^*_{K^p} whose limit is taken only over K_p ⊇ N_{G,0} × ∏_{v ∈ S_{p,ns}} O^×_{E,v}, equivalently the closure of the classical points satisfying (★) — rather than for Hida families. Theorems C, F and G are unaffected. In §7.1, Lemma 7.1.4 must be replaced by the statement that in a Hida* family the classical points of trivial weight satisfying (p-crys) are dense; condition (ram) is no longer relevant.

Check: The body of the paper deduces Theorem D from the case of trivial weight, which is quoted as [Disegni, The p-adic Gross–Zagier formula on Shimura curves, II: nonsplit primes, Theorem B], and then deduces Theorems A, B and B^ord from Theorem D through Proposition 7.1.5 and Lemma 7.1.2. Appendix B of arXiv v4 records that, after a correction, that companion paper proves its Theorem B only for representations of trivial weight that in addition satisfy (★); the density argument of Lemma 7.1.4 therefore no longer produces a dense set of points at which the formula is known inside an arbitrary Hida family, and the interpolation argument of Proposition 7.1.5 only runs inside the closure of the points satisfying (★). The author states that the original proofs otherwise apply verbatim and that the last paragraph of the proof of Lemma 7.1.4 proves the replacement density statement. The hypotheses of Theorems F and G are consistent with this: Theorem F assumes every v | p splits in E, so S_{p,ns} is empty and (★) is vacuous, and the proof of Theorem G uses only Theorem C and Bertolini–Darmon, while the Greenberg–Stevens application of Remark 7.3.4 has F = Q, p inert in E and χ = 1 unramified, so (★) holds there.

### E2 — confirmed

Locator: §7.3.6 (Applications to non-vanishing / 2: exceptional families), first sentence of the proof of Theorem G, arXiv:2001.00045v4.

"p is inert in A" should read "p is inert in E"

Check: A is an elliptic curve, not the quadratic extension in which a prime can be inert. The extension being chosen is E. A/Q already has split multiplicative reduction by Theorem G's hypotheses; inertness does not establish that reduction type.

### E3 — confirmed

Locator: Proof of Lemma 6.4.4 (§6.4.6, the vanishing of loc^−_w(𝓟)), last sentence, arXiv:2001.00045v4.

"Proposition 5.2.2" should read "Lemma 5.2.2"

Check: The statement invoked — that continuous cohomology commutes with countable projective limits of admissible modules of finite type over a profinite group satisfying (F) — is 5.2.2, and 5.2.2 is a lemma, not a proposition. In the SMF class used by the paper, theorems, propositions, lemmas and definitions share a single counter within each subsection, so the number 5.2.2 is unambiguous and no other statement can be meant; the only statement of §5.2 that could be confused with it, Proposition 5.2.3, is about supports and specialisation, not about limits. A mechanical audit of the LaTeX source comparing the capitalised word introducing each \ref with the environment carrying the target label found this as the unique mismatch among the 68 typed cross-references of the paper.

### E4 — confirmed (known author correction)

Locator: Footnote 12, attached to the sentence introducing Theorem C in §1.3.3, arXiv:2001.00045v4.

the citation should point to Proposition II.2.4(2) of Nekovář, "On the p-adic height of Heegner cycles", Math. Ann. 302 (1995), 609–686, not to §I.2

Check: The footnote asserts that Howard's Abel–Jacobi classes of Heegner cycles in a Chow group agree with the classes P_Π(f) defined by the étale Abel–Jacobi map of §6.1.2; the statement comparing the two realisations is Nekovář's Proposition II.2.4(2), which is also the result generalised in Remark 6.2.2 of the present paper, while §I.2 of that paper contains no such comparison.

### E5 — confirmed (known author correction)

Locator: Third-last line of the proof of Lemma 4.1.1 (§4.1.2), the displayed description of the local components of the contragredient, arXiv:2001.00045v4.

the symbol ≅ should be ↪, that is π_v^∨ embeds into the un-normalised induction as its unique irreducible subrepresentation

Check: The representation is the distinguished irreducible subrepresentation of the induction, which can be proper (notably in reducible induction cases). The proof needs its embedding, not equality with the whole induced representation.

### E6 — rejected

Locator: Appendix B (Correction), the itemised list of the effects of the correction on the main results, arXiv:2001.00045v4.

Rejected: a correction need not enumerate every unaffected theorem. Theorem H has a separate Waldspurger specialization argument; no false statement or missing proof follows from the omission of its name. Retain this entry only to record the rejected input finding.

### E7 — confirmed

Locator: Lemma 3.3.7, arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

For finite free modules of equal rank over a commutative ring R, use the residue field κ(𝔭), or the localization R_𝔭, not R/𝔭. The isomorphism locus is the basic open D(det T).

Check: Take R=Z and T multiplication by 2 on R. Reduction mod every odd closed prime is invertible, but T⊗R/(0) is multiplication by 2 on Z and is not invertible. A nonempty open of Spec Z contains its generic point, so the printed isomorphism locus is not open. The corrected fibre statement follows from the determinant criterion, but requires a localization/residue-field bridge beyond the cited Mathlib declarations.

### E8 — confirmed

Locator: Proof of Lemma 3.2.2, arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

Replace rank 4 by rank n² in the general n-dimensional pseudocharacter argument.

Check: The lemma quantifies over n-dimensional absolutely irreducible representations. End of a rank-n vector bundle has rank n². The trivial rank-one representation gives an immediate counterexample to the fixed rank 4 used in the proof; rank 4 is only the later n=2 specialization.

### E9 — confirmed

Locator: §2.2.2, algebraic weight representation W_G, arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

Use the tensor product over embeddings for W_G, with the stated determinant twists; its dimension is the product of the local dimensions. The multihomogeneous polynomial realization then has the correct type.

Check: The displayed formula (2.2.2) correctly defines a tensor product, but the following prose identifies its underlying space with tuples of homogeneous polynomials, i.e. a direct product. For [F:Q]=2 and weights w_σ=2, both factors are L: the tensor has dimension one whereas the tuple space L×L has dimension two. Use multihomogeneous polynomials, not tuples.

### E10 — confirmed

Locator: Proof of Proposition 3.2.4, equation (3.2.8), arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

In the rank-one quotient W^− with H⁰=H²=0, dim H¹(F_v,W^−)=[F_v:Q_p]. Keep the total W-dimension 1+2[F_v:Q_p].

Check: The local Euler characteristic gives dim H⁰−dim H¹+dim H²=−[F_v:Q_p] for a rank-one p-adic representation, hence the claimed extra 1 is impossible under the proof's vanishing assumptions. Milne, Arithmetic Duality Theorems (2nd ed.), I.2.8 supplies the finite-coefficient Euler formula; passing through a stable lattice gives this p-adic dimension identity.

### E11 — confirmed

Locator: §4.1, equation (4.1.11), compared with Lemma 4.1.3(2) and proof of Proposition 4.1.8, arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

The group-algebra-valued pairing is p^{r[F:Q]}∑_{t∈T/T_r}⟨x,ty⟩_ord[t^−1], with the action on the second argument and the group-ring basis element both present.

Check: The printed scalar sum loses the T-action and has no group-algebra coordinate. In the regular representation of C₂ with the delta pairing and x=y=e_1, the correct coefficient sum is [1], whereas the printed scalar sum is 2 (before the shared normalization). The equivariance in Lemma 4.1.3 and the later proof use the corrected formula.

### E12 — confirmed

Locator: §4.2.1, equation (4.2.4) and the preceding duality identification, arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

With central character ω and χ₂=ω^−1χ₁^−1, use π^∨=π⊗ω^−1 (equivalently π=π^∨⊗ω). The normalized split toric factor is, up to the paper's fixed measure factor, [I(f,χ₁)/L(1/2,π⊗χ₁)]·[I(f^∨,χ₁^−1)/L(1/2,π^∨⊗χ₁^−1)].

Check: Twisting a GL₂ representation by ω^−1 changes its central character to ω^−1, as needed for π^∨; reversing the twist does not. In the iterated Kirillov integral, put x=ay: the first factor has χ₁(x) and the second χ₁(y)^−1. Thus the dual zeta integral has the inverse character. The two L-denominators also match L(π⊗χ₁)L(π⊗χ₂) by the corrected contragredient identity.

### E13 — confirmed

Locator: Corollary 5.1.4 and the spectral sequence used in Proposition 5.2.3, arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

For E₂^{p,q}=Tor_{−p}^R(H^q(C),N), p≤0, the abutment is H^{p+q}(C⊗^L_R N), not H^{q−p}.

Check: Take C=[Z_p --p→ Z_p] in degrees 0,1 and N=F_p. H¹(C)=F_p. Tor₁(H¹(C),F_p) contributes to H⁰ of the derived tensor, not H². The actual tensor has F_p in degrees 0 and 1, so the printed total degree is false.

### E14 — confirmed

Locator: §5.2.1, example of cohomological dimension, arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

For the CM number field E in this application and S containing the primes above p and the archimedean places, the p-cohomological dimension of G_{E,S} is at most 2. Do not confuse this with the possible degree-3 amplitude of the Selmer or compact-support complex.

Check: Milne, Arithmetic Duality Theorems (2nd ed.), I.4.10(c) identifies global H^r for r≥3 with real-place terms, which vanish for CM E. For a general number field at p=2 real places can instead obstruct finite cohomological dimension. Neither possibility gives the printed blanket value 3.

### E15 — confirmed

Locator: §5.3.2, beginning of exact sequence (5.3.2), arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

Prepend H̃⁰_f(E,M): 0→H̃⁰_f(E,M)→H⁰(G_{E,S},M)→⊕_{w∈S}H⁰(G_{E_w},M_w^−)→H̃¹_f(E,M)→⋯. One may omit the first group only with a vanishing hypothesis.

Check: Take M=Q_p with trivial action, S the places above p and infinity, and M_w^+=M. Then M_w^−=0 and global H⁰=Q_p cannot inject into the zero local-minus group. The mapping-cone long exact sequence supplies the omitted H̃⁰. Applications with vanishing global invariants are not refuted.

### E16 — confirmed

Locator: Proposition 5.3.4(2), formula (5.3.7), arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

For z,z′ in H̃¹_f(E,M), use h(z,c^−1z′). In addition, a symmetry theorem requires an explicit compatibility of c with the hermitian duality; this separate hypothesis/proof remains a gap.

Check: The map c has domain the involuted Selmer group, whereas z′ belongs to the non-involuted group. Its inverse is the map with the required input and output. This confirms a typing error, not an unconditional symmetry result for an arbitrary chosen isomorphism.

### E17 — confirmed

Locator: §7.3.1, odd-rank Pfaffian prescription and Remark 7.3.1, arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

The stated odd-rank construction and its asserted regulator identity require repair. A determinant-line/maximal-Pfaffian construction is a candidate, not a proved replacement. Do not build the odd-rank assertions as printed.

Check: Already in rank one, the only multi-index has empty support and M_I=0, a case the definition does not cover. More decisively, over Q in rank five take alternating A=e₁∧e₂+e₃∧e₄ and B=e₁∧e₂+e₃∧e₅, and h=uA+vB. Rad(A)=<e₅>, Rad(B)=<e₄>, so the printed rule kills the uv coefficient. The actual maximal-Pfaffian vector (up to a common sign) is (u+v)(u e₅−v e₄), whose uv term e₅−e₄ is nonzero. With auxiliary pairing e₅*⊗e₅*, the determinant comparison has term u²(u+v)², whereas the prescribed unmixed vector gives only a multiple of u⁴. Thus Remark 7.3.1 cannot hold for this definition.

### E18 — confirmed

Locator: Conjecture Pf, target following equation (7.3.3), arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

Replace exponent (1+ε)/2 by (1−ε)/2: the sign +1 case is scalar-valued and the sign −1 case is Selmer-vector-valued.

Check: The preceding definition assigns the even-rank Pfaffian (ε=+1) to the symmetric algebra and the odd-rank Pfaffian (ε=−1) to the Selmer vector space tensored with that algebra. The printed target exchanges these two cases. This typing correction does not resolve the odd-rank defect E17.

### E19 — confirmed

Locator: Appendix A.1.4, notation e_v and choice of uniformizer, arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

The exponent comparing p with an F_v-uniformizer must be e(F_v/Q_p). In general write p=u_vϖ_v^{e(F_v/Q_p)} for a unit u_v, or equality of principal ideals; an exact root uniformizer need not exist. Keep e(E_v/F_v) separately where it genuinely occurs in vol°.

Check: Take F_v=Q_p and a ramified quadratic E_v/F_v. The relative index is 2, but v_{F_v}(p)=1, so ϖ_v²=p is impossible. Even with the absolute ramification index, the unit cannot generally be discarded. The two indices must not be globally interchanged.

### E20 — confirmed

Locator: Proof of Lemma A.2.3, nonsplit explicit matrix identity, arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

Recompute representatives, their j-dependence and the ramified p-versus-ϖ indexing before using the displayed matrix factorization. This check disproves the printed proof identity, not the Hecke-coset conclusion itself.

Check: Let F=Q₃, θ²=−1 in its unramified quadratic extension, Tr θ=0, N θ=1, r=1, ϖ=p=3 and j=0. Substitution into the two sides of the printed identity gives [[9,3],[-27,1]] and [[9,0],[0,1]]. They are unequal. In particular, the supplied t_{j,r} is independent of j while the purported correcting factor depends on j.

### E21 — confirmed

Locator: §4.1.4, denominator-bound footnote, and Appendix A.4.2 with the pairing (A.4.1), arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

For the full standard monomial lattice in W_{G,v}, a valid uniform bound for the pairing denominators is max_{0≤a≤k_τ−2} v_p binom(k_τ−2,a), summed over tensor factors. The single distinguished-weight coefficient does not bound the whole lattice; arbitrary rescalings of a stable lattice require corresponding adjustment.

Check: For k=6, l=4, p=3 the proposed binomial is binom(4,4)=1, so its valuation is zero. But the coefficient pairing the a=2 monomial with its complementary monomial is ±binom(4,2)^−1=±1/6, not 3-integral. This is a counterexample within the allowed weights.

### E22 — confirmed

Locator: Proposition 5.1.3 and Corollary 5.1.4, bounded derived-category targets, arXiv:2001.00045v4 (23 February 2024); collated at the same passage in the public author manuscript.

State the general continuous-cohomology/base-change construction in D^+; to conclude D^b, impose and use a finite cohomological-dimension or equivalent boundedness hypothesis. That assumption is introduced only later in §5.2.

Check: Take the regular coefficient ring R°=F_p, the profinite group G=C_p, and M=N=F_p with trivial action. All coefficient flatness and finite-projective-dimension conditions hold, but H^i(C_p,F_p) is nonzero in every nonnegative degree. The cochain object is therefore not in D^b. This disproves boundedness under the general §5.1 assumptions, not the later finite-cd application.

### E23 — confirmed

Locator: §1.1.2, first derivative after equation (1.1.1), arXiv:2001.00045v4; same display in the public author manuscript.

The differential belongs to T₀*𝓔_{Z/L}=I/I²≅Γ_F⊗̂L, not the tangent space; the tangent is its L-linear dual.

Check: For the augmentation ideal I in the character algebra, γ↦[γ]−1 identifies Γ_F⊗̂L with I/I². A function vanishing at the augmentation has its linear term in this cotangent space. Tangent vectors instead act on I/I² as derivations. Later conormal-valued height and derivative formulas use this cotangent convention.

The result records a verdict and search history for every finding. There are 22 confirmed entries: three known author corrections, nineteen additional findings; E6 is rejected. No author has been contacted.

## Remaining closure and exact change log

The original numbering census (107 numbered statements in 153 items) is useful but is not declaration-level completeness. Among required splits are Proposition 3.1.2, Proposition 3.2.4, Theorem 3.3.10, Proposition 4.1.7, Proposition 5.3.4, Lemma 6.4.4, the five specialization comparisons in Proposition 7.1.5, and the even/odd/conjectural regulator branches. Independent unnumbered ingredients include cone/derived base-change hypotheses, the analytic-LLC recognition theorem, lattice denominator bounds, idempotent-localized Abel–Jacobi domains and the precise external parity, Fouquet and CM-main-conjecture hypotheses.

The six machine-readable gaps identify the remaining closure, ownership, hypothesis and proof tasks. Initial API/test outlines were added to items 4,6,22,38,60,79,80,83,104,122,139,150. These are obligations, not Lean implementations. The other definition APIs and all declaration-level dependency closure remain unfinished, which is one reason the extraction stays partial.

Changed item IDs (all other item bodies retained): 4, 6, 8, 9, 18, 22, 26, 27, 29, 30, 38, 52, 60, 73, 74, 75, 79, 80, 83, 85, 104, 115, 122, 123, 124, 125, 127, 133, 135, 138, 139, 143, 144, 146, 150.

- 4/6/8/9/18/22: corrected group action, polynomial model, dimensions, owner, finite quotient and torsor type.
- 26/27/29/30/38: algebra-map/rank hypotheses, family coverage, local Euler check and residue-field openness.
- 52/60: group-algebra coefficients and split toric dual normalization.
- 73–75/79/80/83/85: boundedness, spectral degree, cohomological dimension, sheaf datum, LES, height transport and Abel–Jacobi localization.
- 104/115: cotangent derivative and corrected specialization/density/height conventions.
- 122–125/127: defective odd regulator, target exponent, conditional parity/plectic evidence and the inert-prime slip.
- 133/135/138/139/143/144/146/150: CM/family ownership, ordinary-invariant notation, ramification, nonsplit proof gap, weight bounds, regularized Tate-integral convention and lattice denominators.

Top-level status, summary, readSections, review and gaps were updated. Prerequisite entries 3,8,12 have corrected bibliographic data; supplier corrections and the public Nekovář link were added. Routes 1–4/8 were adjusted to retain exactly-once membership for the downgrades; route 9's normalization is corrected. E1–E6 have independent verdicts and repaired explanations; E7–E23 are added. The human extraction report is replaced to remove its stale completeness/acceptance claims.

## Validation

Validation results are recorded in the handoff after execution: paper checker, exact route/source-verdict inventory, elementary counterexample regressions, the 55-test paper/source-issues/errata/queue/intake suite and the five-file intake check. The witness script checks the Q₃ matrix product, rank-five Pfaffian mixed coefficient, binomial denominator, n² rank, target sign and Tor degree. These finite checks support counterexamples; they do not prove the geometric theorems.

Only the four issue deliverables and this job's handoff are submitted. No Lean file was requested or compiled. PDFs, scratch scripts and local paths are not part of the submission.
