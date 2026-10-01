# RT-PAPER-PASKUNAS-QUAST-26

Issue: #4206. Agent: Codex. Session: `codex-rtOQ9t`. Date: 2026-10-01.

Twelve findings: six high and six medium. Correct the total-space completion, disconnected isogeny targets, torus labelling formula, Weil/Galois correspondence, local factoriality hypothesis, and characteristic-2 auxiliary subgroup. Record two codimension-two proof corrections, one citation misbinding, an overly broad condensed construction and a prerequisite integral-normal-basis error; reuse pinned dynamic parabolic functors. The existing Part II coalescence and generic source owners are sound. These findings do not establish a counterexample to the principal complete-intersection, normality or component theorems.

## Scope and evidence

- Independence: extraction by Claude cc-39fac3 and accepted review by Claude cc-7b31c4; neither was written/reviewed by Codex session codex-rtOQ9t. Claim for issue #4206 confirmed by the bot. Target files read at atlas commit 0a5be795ca84710d8e8408a7fa60192601d17fe1.
- Read the entire 96-page published Forum of Mathematics, Pi 14 (2026), e15 PDF, including Appendix A, glossary and references. Compared suspect passages with the 105-page arXiv:2404.14622v2 PDF and its TeX source; visually checked published pp. 35, 54, 76 and 85 to distinguish superscripts and bars.
- Read all 84 item records, the reader document, accepted review, all six routes and all 14 prerequisite records; checked the 80 missing / 3 planned / 1 library classifications and route coverage. Read the existing BIP23 Part II brief: coalescing under its existing id is correct.
- Read the relevant generalised-tori prerequisite pp. 2–5, 26–34 (formal cocycles, component torsor, rank calculations, Theorem 9.3), Birkbeck published pp. 133–136 (Weil-group correspondence), and Conrad author-copy pp. 12, 20, 52, 112–114, 164, 170–171. This is a targeted prerequisite check, not a full audit of those papers.
- Independently checked existing sourceIssues E1 and E2. E1: the proof implication psi=omega^{+/-1} => psi^{p-1}=1 is only available in characteristic p; the extraction already restricts that result. The nonsplit upper triangular characteristic-zero cyclotomic example has an invariant e12 after twisting. E2: Lemma 5.5 refers to Rps_G before G is introduced; Rps_GLd is the intended ring. Neither is re-reported as a new finding.
- Read Mathlib declarations CondensedSet, Condensed.discrete and CondensedSet.isDiscrete_tfae at 082e2d37e8b0463410cdb532e111cd43d5a66174; item /83 correctly reuses them. Read the Tau Ceti dynamic parabolic and functor declarations at f790474821cf4256814db967cb154e7af3d0c369. Searched the pinned trees for G-pseudocharacters, Cayley-Hamilton deformation spaces, generalized reductive deformation rings and condensed qcqs APIs; no complete implementation of the remaining targets was found.
- Read the reviewed library coverage for R03.1/R03.3, D7, VS2 and LP2/LP3, including their partial completion/regular-sequence/condensed infrastructure. IHG.0/IHG.1, R08.1 and RG2.5 have no direct entries in that coverage file. Read the current assembled descriptions of all seven directly routed stages plus RG2.5 and LP2/LP3. Source routes retain the existing generic owners; no separate deformation or condensed roadmap is needed.
- Assembled the live atlas from source with require_distances=False: 2907 stages, 8322 stage edges, 76 edges involving external/proxy endpoints. Kahn traversal visited all 2907 internal stages: no internal stage cycle. The proposed coalesced Part II is still a paper brief, so this does not certify a not-yet-written node-level dependency graph.
- Checked boundary cases: G=G_m, G=G_m x C_2, SL_2 -> PGL_2, characteristic 2 versus odd characteristic, ramified/unramified quadratic extensions, sign lattices, prime-to-p versus principal-unit characters, a nonlocal Dedekind hypersurface, and the empty profinite test for a condensed set.
- Correction search on 2026-10-01: journal article/related-content page, arXiv version history (v2, 2026-01-09), Julian Quast publication page, institutional author bibliography, and Crossref relations/update fields for both Paškūnas–Quast DOIs. No correction resolving these findings was found. The 2024 Bockle–Iyengar–Paskunas corrigendum concerns a different paper. The guessed Paskunas papers-page URL was inaccessible and supplies no negative evidence.
- No Lean files are deliverables. No Lean compilation, library build, cache download or language server was run. Mathematical counterexamples and declaration reads are evidence; they are not presented as formal proofs.

## Versions read

- [Paskunas–Quast, Forum Math. Pi 14 (2026), e15, 96 pp.](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2D7C5400C4BA7789C0E1CFF008D12E60/S2050508626100304a.pdf/div-class-title-on-local-galois-deformation-rings-generalised-reductive-groups-div.pdf), read 2026-10-01; SHA-256 `5366ff7dc25c4bc1bcd2659bae4acb0df3de555b2286d0f157469a21a68902f5`.
- [preprint](https://arxiv.org/pdf/2404.14622v2), read 2026-10-01; SHA-256 `eaa8fba90704e412df15917bfb6496f6b8d36c605af2570413ff55876842ed7c`.
- [Paskunas–Quast, generalised tori, Forum Math. Sigma 13 (2025), e45, 36 pp.](https://doi.org/10.1017/fms.2024.137), read 2026-10-01; SHA-256 `2ba930f6243055ba7ba9a88c6c372a58a1e9ab0f82b363fd1fde18872cbfcff4`.
- [published](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.1114.pdf), read 2026-10-01; SHA-256 `0f0494b8ce539f36c42ad1464972c5f729caebe8753ea65c36c406517b52b272`.
- [author copy](https://math.stanford.edu/~conrad/papers/luminysga3.pdf), read 2026-10-01; SHA-256 `1a63a17e4ccb7e23263d65f05d93a6651262861e978e9eb0c1c53a01fd59140a`.

The arXiv v2 source archive SHA-256 is `05a2306efbfa0dabbc885bb86e23b090e8254c19b244ce1fe9140ffa9637e003`. Published page numbers above refer to the 96-page version, not the longer preprint. The source-error findings should become separately reviewed `sourceIssues` when fixed; they do not silently change the accepted extraction. The Call–Lyubeznik PDF request returned HTTP 403; finding 5 rests on the actual local-ring application and the explicit nonlocal counterexample, not on a claimed reading of that inaccessible article.

## Findings

### 1. The completion in Lemma 5.17 is on X, not its special fibre (high)

**Where:** research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json, items /32; reader, completions; Part II brief (3)

Item /32 changes the ambient scheme of the mixed-characteristic completion to the special fibre: its last displayed isomorphism cannot hold as an O-algebra isomorphism.

Published Lemma 5.17(2), p. 35 (https://doi.org/10.1017/fmp.2026.10030), says hat(O_{X,x})[[T]] = R^square_{G,rho_x}, for x in Xbar minus Y. The subscript of the local ring is X, without a bar; this is visible in the PDF and in arXiv v2 defG_REV.tex, label local_ring_def_ring. Item /32 instead uses hat(O_{Xbar,x}). Its left side is killed by varpi. The right side is flat over the mixed-characteristic coefficient DVR Lambda by Corollary 13.27, so varpi is a non-zero-divisor in a nonzero ring. Lemma 15.11(2), p. 80, explicitly gives both the total-space formula and the separate special-fibre formula with R/varpi. Thus this is an extraction error, not a defect of Lemma 5.17.

**Fix:** Replace hat(O_{Xbar,x}) by hat(O_{X,x}) in the formula for R. If also recording the special-fibre formula, use hat(O_{Xbar,x})[[T]] = R/varpi. Keep the extra variable and the local-field coefficient ring. Test that reduction modulo varpi commutes with the corrected formula and that the unreduced formula has characteristic zero.

### 2. Isogenies involving the central torus must target neutral components (high)

**Where:** research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json, items /4 and /70; sourceIssues; Part II brief (1),(6)

The maps from connected central tori to the whole disconnected groups H_i and G/Gprime are not isogenies. The extraction reproduces a source error in the fixed-partial-determinant setup.

Published p. 76 calls Z(G^0) -> G/Gprime and Z_i -> H_i isogenies; the proof of Proposition 15.1 also calls G -> H_1 x (G/Z_1) a central isogeny. Take G=G_m x C_2 and M_1=M. Then Z_1=G_m, H_1=G_m x C_2, and the map misses the nonidentity component. The product map has component map C_2 -> C_2 x C_2, the diagonal, so is not surjective either. A genuine isogeny is faithfully flat and surjective. The exact sequence on p. 77 correctly uses H_1^0. Conrad, Reductive group schemes, Corollary 5.3.3 (author copy p. 164, https://math.stanford.edu/~conrad/papers/luminysga3.pdf) concerns connected reductive groups and their maximal central tori; it does not imply the disconnected claim. The same defect occurs in arXiv v2 at lines 5833–5851.

**Fix:** Use the maximal central torus of G^0 and its isogeny to G^0/Gprime; write Z_i -> H_i^0. In the proof interface for /70 require only the finite map G -> H_1 x (G/Z_1), or factor through the fibre product over the common component group Delta, justifying finiteness there. Do not assert surjectivity onto the full product or centrality for the disconnected group without proof. Add a source issue for p. 76. Also correct the source proof of Proposition 13.25, p. 68: the split centre is diagonalizable, not necessarily a torus (SL_2 has centre mu_2); diagonalizability is sufficient for the finite centre decomposition used there.

### 3. The component-labelling formula has the wrong Galois group and coefficient range (high)

**Where:** research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json, item /77 versus /71; sourceIssues; Part II brief (6)

The displayed H^1 identification in /77 is false: it uses Gamma_F^{ab,p} in place of Gamma_E^{ab,p}, and identifies all torus cohomology with characters of a pro-p group. These are two defects of the same proposed parametrisation.

Published p. 85 and arXiv v2 lines 6415–6418 have Gamma_F in all three occurrences, whereas (93), p. 78, correctly has Gamma_E. The prerequisite https://doi.org/10.1017/fms.2024.137, Theorem 9.3 and Corollary 8.8, uses Gamma_E and Delta-invariants. For odd p, E/F unramified quadratic and M the sign lattice, Delta acts trivially by inner conjugation on Gamma_F^{ab,p}; thus (Gamma_F^{ab,p} tensor M)^Delta=0. The correct group has Z_p-rank [F:Q_p], by Corollary 8.8. Independently, even E=F and M=Z disproves the unrestricted H^1 claim: an unramified character of order 2 for p odd belongs to H^1(Gamma_F,Qpbar^times) but cannot factor through Gamma_F^{ab,p}. The prerequisite pp. 3–5 and Section 7.4 explicitly twist by a chosen residual lift and use cocycles valued in Hom(M,1+m_A).

**Fix:** Replace all three Gamma_F groups in this labelling construction by Gamma_E, retaining invariants rather than coinvariants. Formulate the formal deformation/torsor statement after twisting by the Teichmuller lift, with principal-unit cocycles or the corresponding fixed-residual pseudodeformation functor. Alternatively use the Weil-group correspondence for unrestricted H^1 and then restrict the resulting character to p-power torsion. Do not repair only the subscript and retain the false all-H^1 isomorphism. Add a source issue for p. 85 and tests for the sign lattice and a nontrivial prime-to-p character.

### 4. All continuous torus characters require Weil parameters (high)

**Where:** research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json, item /81; reader and Part II torus input

Item /81 replaces the Weil group in the local Langlands correspondence by the absolute Galois group while leaving all continuous characters on the other side.

Birkbeck, On the p-adic Langlands correspondence for algebraic tori, published p. 134, first theorem and second theorem (a), uses H^1_cts(W_{E/F},T_hat_D), not H^1_cts(Gamma_F,T_hat_D); p. 136 defines admissible homomorphisms from W_{E/F}. Published text: https://jtnb.centre-mersenne.org/item/10.5802/jtnb.1114.pdf. Take T=G_m and chi:F^times -> Qpbar^times given by chi(x)=p^{v_F(x)}. This character is continuous and sends a uniformizer to p. A continuous character of the compact group Gamma_F has compact image; its valuation image is a compact subgroup of the additive real numbers, hence zero. It cannot correspond to chi. The main paper pp. 87–88 only uses the character attached to an existing Galois parameter; this one-way use does not justify the stronger extracted bijection.

**Fix:** State the full correspondence with W_{E/F} (or W_F in an equivalent formulation). Separately state the passage from the Galois parameters used here by restriction to the Weil group; if asserting a Galois-side bijection, specify and prove the bounded/unitary restriction. Test unramified Frobenius values p and 1+p separately. This correction belongs to /81, not a withdrawal of Theorems 16.4–16.5.

### 5. Factoriality needs a local ring hypothesis (high)

**Where:** research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json, item /76; source route to DeformationAndDerivedPatchingAlgebra:R03.3

The parafactoriality input is stated as a claim about arbitrary complete intersections; regularity in codimension three implies local factoriality in that generality, not global unique factorization.

The application in published Corollary 15.22, p. 82, is to complete local deformation rings. Its reference [14] is Call–Lyubeznik on parafactoriality of local rings. For a counterexample to /76 as written take R=Z[sqrt(-5)]=Z[t]/(t^2+5). It is a hypersurface in a regular ring and is the full ring of integers of Q(sqrt(-5)); hence it is a Dedekind domain, regular at every prime, in particular in codimension three. It is not a UFD: 6=2*3=(1+sqrt(-5))*(1-sqrt(-5)). The norm a^2+5b^2 has no values 2 or 3, so these factorizations are into nonassociate irreducibles. This directly separates local factoriality from global factoriality.

**Fix:** State the noetherian local complete-intersection version of the R_3 factoriality theorem, with regularity at every prime of height at most three. For schemes or nonlocal rings state locally factorial, unless an additional global class-group/Picard argument is supplied. Preserve the local deformation-ring application and add the Dedekind-domain counterexample as a negative test.

### 6. The codimension-two auxiliary subgroup can be non-smooth at p=2 (high)

**Where:** research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json, item /54; sourceIssues; use in /69

The scheme-theoretic inverse image H_0=p_2^{-1}(mu_{p-1}) need not be generalised reductive. Restricting Proposition 11.5 to characteristic p, as existing E1 does, does not fix this distinct problem in Lemma 11.3.

Published pp. 53–54 define p_2:G -> PGL_2 and H_0 by inverse image, then assert H_0 is generalised reductive. Set kappa=F2bar, G=SL_2, P the upper triangular Borel, and L the diagonal torus. All the codimension-two assumptions hold. Here p_2 is SL_2 -> PGL_2 and mu_{p-1}=mu_1=1, so H_0=mu_2=Spec(kappa[z]/((z-1)^2)). It is nonreduced and non-smooth, contrary to Definition 2.5. This is a scheme calculation, invisible on kappa-points. The proof of Proposition 14.5, p. 74, imports this group as a reductive subgroup for the dimension induction. The published PDF and arXiv v2 agree.

**Fix:** Use the reduced inverse-image subgroup over the perfect/algebraically closed field, or explicitly declare a reduced-subgroup convention at this construction, then prove its reductivity, centre-dimension bound, and equality of geometric points with the original inverse image. Propagate the reduced subgroup into Proposition 14.5. Record the source issue separately from E1. Test SL_2 in characteristic 2 and distinguish the trivial reduced subgroup from the infinitesimal mu_2 group scheme.

### 7. Lifting a cocharacter through an isogeny requires multiplication (medium)

**Where:** research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json, item /54 supporting proof; sourceIssues

The cocharacter-lifting step in Lemma 11.3 and the normalization used in Proposition 11.5 fail integrally. A finite cokernel of character lattices does not give a lift of every cocharacter.

Published p. 54 lifts a cocharacter through the map on centres without multiplying it. On pp. 55–56 the resulting lambda is required to satisfy alpha o p_2 o lambda=id. For G=SL_2, L={diag(t,t^{-1})}, p_2:SL_2 -> PGL_2, the map alpha o p_2 on L is t -> t^2. Every cocharacter into L has exponent n in Z, so its composite has exponent 2n; it cannot have exponent 1. This counterexample works in characteristic p as well as zero. The limit argument itself only needs a positive exponent.

**Fix:** Replace the exact lift by a lift of a positive multiple of the cocharacter, obtained by clearing the finite lattice cokernel; replace alpha o p_2 o lambda=id by t -> t^n for some n>0. Verify that the limiting parabolic and contraction of U are unchanged by a positive multiple. Record a proof-level source issue, without claiming that the centre-dimension or non-speciality conclusions fail for this reason.

### 8. The displayed adjoint action omits a diagonal term (medium)

**Where:** research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json, item /54 supporting proof; sourceIssues

The third basis-action formula in the proof of Lemma 11.4 is missing 2*omega*b*e11 modulo scalars. It is valid without that term only in characteristic 2 (or when that coefficient vanishes).

Published p. 55 uses A=[[1,b],[0,psi^{-1}]]. Direct multiplication gives A e21 A^{-1}=[[b,-psi*b^2],[psi^{-1},-b]]. Modulo scalar matrices this is psi^{-1}*e21+2*b*e11-psi*b^2*e12. After the cyclotomic twist all terms acquire omega. The printed e21 formula retains the first and last terms but omits the middle one; arXiv v2 has the same display. Taking b=1, psi=omega=1 in characteristic 3 leaves the missing coefficient 2 nonzero. The stable flag and its diagonal characters used by the subsequent argument remain the same.

**Fix:** Record the corrected formula gamma.e21=omega*psi^{-1}*e21+2*omega*b*e11-omega*psi*b^2*e12 as a proof-level source issue. Retain Lemma 11.4 with its stated hypotheses, and check its proof using the unchanged upper-triangular flag. Include both characteristic 2 and odd-characteristic matrix tests.

### 9. Reuse the existing dynamic parabolic functors (medium)

**Where:** research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json, item /10 note and Part II brief (1); reader library boundary

The library discussion overlooks existing dynamic parabolic, Levi and unipotent functors for arbitrary commutative Hopf algebras. Their applicability is not restricted to connected reductive groups.

At Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean defines TauCeti.Cocharacter.parabolic (line 293), limit (332), levi (344), unipotent (376), and proves limit_mem_levi (573), exists_mem_unipotent_mem_levi (629), unipotent_sup_levi (635), and conjugation/uniqueness properties. The variables are commutative rings with HopfAlgebra R H; there is no connectedness or reductivity hypothesis. Dynamic/Functor.lean packages parabolicFunctor, leviFunctor, unipotentFunctor and their inclusions. I read these declarations at the pin. The Parabolic file expressly leaves scheme representability open, so this is partial reuse, not a claim that all of /10 is built.

**Fix:** Keep the still-missing scheme-theoretic theorem and add explicit reuse of these pinned carriers and pointwise laws. Plan the natural identification with the group-scheme functor of points, representability, smoothness, geometric unipotence and the R-Levi/component assertions. Revise the note and brief so they do not rebuild the dynamic functors under a new disconnected-group carrier. Do not modify the upstream roadmap.

### 10. Four reductive-group citations point to a rigid-geometry paper (medium)

**Where:** research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json, sourceIssues and prerequisites supporting /50, /51, /59; reader sources

The extraction does not record that several proof inputs in the published paper are bound to the wrong Conrad reference.

Published p. 51 cites [16, Example 1.1.16]; p. 52 cites [16, 5.3.9] and [16, 1.2.7]; p. 63 cites [16, Theorem 4.1.7(4)]. Bibliography [16], p. 94, is Irreducible components of rigid spaces (1999), whereas [19] is Reductive group schemes (2014). In arXiv v2, the four calls use the key conrad, whose Ref.bib entry is the rigid-spaces paper. The correct author text https://math.stanford.edu/~conrad/papers/luminysga3.pdf has Example 1.1.16 on derived reductive groups (p. 12), Theorem 4.1.7 on the dynamic group construction and its Lie algebra (pp. 112–113), Theorem 1.2.7 on root SL_2 homomorphisms (p. 20), and Example 5.3.9 on simply connected covers and root subgroups (pp. 170–171). This is bibliographic misbinding, not an unavailable group-theoretic theorem.

**Fix:** Add a source issue identifying the four incorrect [16] references and their intended [19] source. Supply an obtainable link to Reductive group schemes in the prerequisite/source notes. Keep the valid theorem statements, and make the downstream proof outline cite the corrected source by title and locator rather than copying the wrong numeric reference.

### 11. Composition with an arbitrary accessible presheaf need not be condensed (medium)

**Where:** research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json, sourceIssues; items /26, /84 and condensed construction boundary

Appendix A.1 asserts a construction for arbitrary accessible X:CRing -> Set that does not produce a condensed set in that generality.

Published p. 90 defines X(A) by direct composition X o A for an accessible presheaf and a condensed ring A. Take the constant functor with value a two-element set. It is accessible, but (X o A)(empty)=2, whereas a condensed set must take the empty profinite set to a singleton. It also sends a disjoint union of two points to 2 rather than 2 x 2. Thus even the finite-disjoint-union sheaf axiom fails. The later application to an affine scheme works because its functor of points is representable and preserves limits. The same broad sentence appears in arXiv v2 Appendix A.1.

**Fix:** Record a source issue and restrict the construction used by this extraction to the representable affine functors actually needed, or state and prove sufficient exactness/descent hypotheses on a more general X. Do not export an arbitrary-accessible-presheaf API to VS2. No change to the closed-immersion statement of Lemma A.8 is forced by this counterexample.

### 12. The generalised-tori prerequisite uses an integral normal basis where only a rational one is automatic (medium)

**Where:** research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json, item /71 prerequisite proof notes; sourceIssues

The cited proof of the rank and completion comparisons in the generalised-tori paper asserts an integral normal basis for arbitrary finite Galois E/F. This fails for wild ramification; the extraction needs to carry the repair as a prerequisite source issue.

Paškūnas–Quast, generalised tori, published p. 30, proofs of Lemmas 8.4 and 8.7 (https://doi.org/10.1017/fms.2024.137), identify O_E and powers of its maximal ideal with O_F[Delta] as Z_p[Delta]-modules. Take F=Q_2 and E=Q_2(sqrt(2)). In O_E=Z_2[sqrt(2)], invariants are Z_2 and the group norm (additively, trace) has image 2 Z_2. In the regular module Z_2[C_2], the norm surjects onto invariants, so these modules cannot be isomorphic. Lemma 8.7 uses the claimed freeness to kill H^1; the rank argument of Lemma 8.4 only needs a rational normal basis. Corollary 8.8 and Theorem 9.3 feed (93)–(96) of the audited paper.

**Fix:** For the rank calculation tensor with Q_p before invoking the normal basis theorem. For the cofinal lattices in Lemma 8.7 choose a normal-basis O_F[Delta]-lattice Lambda inside E, scale it into the domain of exp, and use pi_F^n Lambda instead of asserting that p_E^n itself is induced. These lattices are cofinal and induced, so the needed H^1 vanishing is justified. Record this against the 2025 prerequisite, not as a false main theorem of the 2026 paper. Test the ramified quadratic example.

## Repair boundaries and validation

The completion and local-ring findings are extraction errors. The false global torus correspondence is stronger than the source application. Findings 2, 3, 6–8, 10–11 require source issues for the published 2026 paper; finding 12 concerns the explicitly named 2025 prerequisite. The two already recorded source issues remain intact. The characteristic-p restriction in E1 and the scheme-smoothness correction in finding 6 solve different problems.

The auxiliary-group counterexample concerns the scheme-theoretic inverse image. If the intended convention was its reduced subgroup, that convention must be made explicit in the plan and connected to the geometric-point arguments; it must not be inferred as smoothness of the nonreduced inverse image. The cocharacter and adjoint-matrix corrections preserve the relevant contraction and stable-flag arguments.

The Part II should retain its current coalesced identity and generic suppliers. Dynamic point functors already exist, while representability/smoothness and the disconnected structure theorems remain work. No upstream roadmap edits are proposed. No theorem is claimed formalised.

Validation: `scripts/check_redteam.py`, the paper checker on the unchanged input, deliverable-path validation with `research/blueprint/intake.py check-files`, and `git diff --check`. No Lean compilation is applicable.
