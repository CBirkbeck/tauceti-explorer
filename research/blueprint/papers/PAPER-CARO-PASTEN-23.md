# Caro–Pasten: surface Chabauty intake checkpoint

**Partial; Codex — codex-c83e7a; issue #1235.** The available preprint has been read completely and extracted into 149 atomic items: 7 library, 13 planned, and 129 missing. The 14 routes cover 109 missing and 12 planned items. All 37 definitions/constructions carry a consumer-derived API and at least three discriminating tests. Twenty missing records are deliberately unrouted because they are false as printed, depend on a failed argument, or still lack an established original supplier/owner. This is a checkpoint, not a claim of complete closure or formalization.

## Read source and version boundary

The primary source is [Caro–Pasten, arXiv:2102.01055v2](https://arxiv.org/abs/2102.01055v2), submitted 10 February 2021 (PDF dated 12 February), 39 pages: §§1–11, proofs and references all read. The [Inventiones publication](https://doi.org/10.1007/s00222-023-01217-1), volume 234(3) (2023), pp.1197–1250, has 54 pages. The official article preview was accessible, but its canonical PDF download returned HTML. The author-page request failed certificate validation. The publication was **not acquired or matched**. All numbered locators and error findings below concern arXiv v2, not an assertion that the final article contains the same errors.

Only the first three pages of [Balakrishnan–Caro v2](https://arxiv.org/abs/2501.03483v2) were read as version evidence. Its introduction quotes published CP Corollary 1.15 with **p+4√p+5**, for W₂, whereas the read CP preprint has **p+4√p+3**, for the nonhyperelliptic symmetric square. That difference prevents substituting the preprint for the final paper. The later paper's refined hyperelliptic theorem is not used as a proof of the missing publication.

The following exact files were retained and hashed. Reading extent is intentionally narrower than download extent for prerequisites.

| Source | SHA-256 | Extent actually read |
|---|---|---|
| arxiv.pdf | `d7398c4bc32d7ce631e8397145e63276e33f037070a252ba16442c01500c67f7` | all 39 pages, §§1–11 and references |
| debarre | `86eedcb80bdad55187d95c1fcb101d4222ac65dccf274e69214551502c2e179a` | §2 through Theorem 2.1; §3 through Lemma 3.6; beginning of §4 |
| garcia-fritz | `235bacd792acfecaf8d24a7d31e37f1b8f6b673d80b58763387903786d633fb5` | Theorem 2.69 proof; §3.1 integral-curve definition; Proposition 3.29 proof and adjacent definitions |
| aubry-perret | `8efdf0ad3f2e5ee02a3bed7686c5dcceda14ff88260c8a8f3ca3db9112bd42e2` | normalization notation; opening of Theorem 1 proof; normalization comparison and Theorems 10–11 |
| https://arxiv.org/pdf/2501.03483 | `9a83eb14f5566b3f13026ab85394babecf327ffb92622606aa382d47d7b03e79` | first three PDF pages only |

Acquisition timestamps and URLs are recorded in `source.files`. Debarre is the published Numdam scan. The Garcia-Fritz thesis is 273 pages; only its branch correspondence and selected functoriality arguments were inspected. Its characteristic-zero branch setting is not evidence for an arbitrary-characteristic theorem. The Aubry–Perret author PDF was read only in the selected normalization/Frobenius passages, not in full.

## Mathematical scope and dependency chain

Fix K/Q_p finite, integer ring R, ramification e, residue field F_q, and |π|=q⁻¹. Take an abelian scheme A/R of dimension n≥3 and a smooth proper geometrically integral relative surface X closed in A. Let G⊂A(K) be finitely generated of rank≤1, Γ its closure, and s=K_X². The local analytic condition is p>max(e+1,exp(e/exp(1))). The two geometric alternatives are:

1. n=3, generic X of general type, special X containing no geometric elliptic curve, and p>128s²/9.
2. Special A geometrically simple, with an ample H on generic A and p>max(3s+2, n!(3deg_H X+cdeg_H X)^n/(n^n H^n)).

The preprint's global endpoint is

\[
\#(\Gamma\cap X(K))\leq\#X(\mathbf F_q)+
(1-e/(p-1))^{-1}(q+4\sqrt q+3)s.
\]

Its useful local architecture survives independently of the failed final point-count lemma. Place Γ∩U_e inside one analytic formal-group direction. Choose two integral annihilating forms whose reductions are independent. Geometric restriction theorems ensure their wedge is nonzero on the special surface, giving an ample canonical divisor D=Σa_jC_j. Choose **one** linear combination w whose restriction is nonzero on every normalized geometric component. Define m(x) as the supremum of orders of simultaneously integral closed immersed jets through x. The overdetermined theorem bounds it by the sum of vanishing orders and branch contributions. Genus/delta and canonical intersection inequalities give m(x)≤3s≤p−3.

A unit coefficient of an equation of X appears by degree m(x)+1 along the exponential direction. Strassmann with λ=e/(p−1) then gives

\[
\#(\Gamma\cap X(K)\cap U_x)\leq1+\frac{m(x)}{1-e/(p-1)}.
\]

This is the source-qualified local endpoint assigned to the surface extension. Outside D the bound is one. Summing gives a finite bound retaining the actual finite jet sum. Reducing that sum to the preprint's stated numerical expression is a separate, presently unclosed step. General original-source gaps and the corrected formal construction must also close before any Lean proof is claimed.

## G0–G6: evidence, corrections and open work

**G0 — Publication reconciliation.** Obtain the 54-page 2023 text legally, compare theorem numbers, hypotheses, constants and proofs, and revise the inventory against it. A title match and a later citation do not establish equality of versions. Preserve this checkpoint's v2 findings as version-specific evidence.

**G1 — Geometric branches are not rational normalization points.** Lemma 3.15 is false. Over F₃ consider the projective closure of y²=x²(x−1). It is geometrically integral, with normalization P¹ parametrized by x=t²+1, y=t(t²+1), and a nonsplit ordinary node (0,0). Its affine rational points are (0,0),(1,0),(2,1),(2,2), plus one point at infinity. The node has two geometric branches, whose normalization parameters are ±i∈F₉. Thus #C(F₃)=5 and A_C(F₃)=6, whereas the claimed bound is q+1=4 because the normalization has genus zero.

The error in the proof is identifiable: a roots-of-unity norm does not recover individual zeros/poles of a rational function. For this curve,

\[
Z_C(T)=\frac{1+T}{(1-T)(1-qT)},\qquad
Z_C^*(T)=\frac{1+T}{(1-T)^2(1-qT)}.
\]

The extra factor (1+T)/(1−T) cancels under T↦−T. Lemma 3.17's norm identity is valid but its use in Lemma 3.15 is not. The PDF image of page 11 confirms this is not text-extraction corruption.

A limited repair is established for a **geometrically integral** curve: A_C(F_q)≤#C̃(F_q)+2Σδ≤q+1+2g√q+2(p_a−g). At a rational singularity only nonrational branches contribute extra; their number is either zero or ≤b≤δ+1≤2δ. This repair and its hypotheses have their own routed item. It does not by itself close the general weighted sum over Frobenius orbits of distinct geometric components: orbit intersections also contribute. Do not infer the full +3 endpoint from this restricted lemma, or claim the later +5 formula without reading its proof. The local residue bound does not use Lemma 3.15.

**G2 — Sharpness coordinates.** In Remark 4.7 the forms ds₁+s₁²ds₂ and ds₁+s₂²ds₂ pull back to dz under (s₁,s₂)=(z,0); they are not integral. The corrected jet (0,z) modulo z³ gives pullbacks 0,z²dz, which vanish when char k≠2,3. The two transverse branches of the wedge give the sharp bound m=2. Literal and corrected claims are separate records; the PDF image of page 13 confirms the coordinates.

**G3 — Morikawa signs and the threefold threshold.** Debarre §3.4 gives tr α=2(C.H), so the negative sign in the CP Lemma 5.4 proof is a typo. The injectivity argument uses positive roots γ_i and their positive sum. The Abel factorization also requires translating ν so its chosen base point maps to zero; invariant differentials are unaffected.

In Lemma 5.5(i), n=3 and H=X give n! cdeg_H(X)^n/(n^n H^n)=2s²/9, not the printed 2s/3. For s=6, p=7 satisfies p>s but fails p>2s²/9=8. This disproves the printed implication, not necessarily the theorem at the weaker threshold. The safe routed version assumes p>max(s,2s²/9). The main geometric threshold p>128s²/9 already implies it. The page-18 image confirms the formula. Keep Nakai's generating-hypersurface theorem as an original-source task, not an invented consequence of the numerical inequality.

**G4 — Formal multiplication is not a higher finite difference.** The definitions call Ψ^[m] multiplication-by-m, but Lemma 7.4 says it has no terms below degree m. Already for the additive group [2](t)=2t. The displayed logarithm sum with coefficient (−1)^m/m therefore has the wrong linear sign and is not coefficientwise convergent with that meaning of Ψ^[m]. The page-24 image confirms both the statement and definitions. The literal statements are withheld.

A concrete replacement proof programme uses a basis of integral invariant derivations D_i on the completed smooth commutative group. They commute. Define the exponential coefficient of multi-degree α by D^α(t_j)(0)/α!; prove its group identity, coordinate compatibility and inverse. If |α|=m then α! divides m!, giving m!c_α∈R. For the logarithm, integrate closed integral invariant forms degree by degree using Euler contraction, obtaining m c_α∈R in degree m. The valuation bound v_p(m!)≤(m−1)/(p−1) yields the required exponential radius and short-jet integrality. This is a specified corrected proof task, not a claim that the missing Bourbaki source has been checked or the argument formalized.

Keep two truncation thresholds distinct: exponential coefficients are integral for m<p; Ω_(R[z]/z^(m+1))/R is free of rank m only when m≤p−2. At m=p−1 its relation is pz^(p−1)dz, leaving p-torsion. That freeness is needed to descend vanishing from K to R before reduction. Ordinary algebraic differentials of K[[z]] must not be identified with continuous/universally finite differentials without a comparison theorem.

**G5 — Saturation, positivity and other proof repairs.** The proof of Lemma 9.7 incorrectly infers independent reductions from primitive K-independent vectors. In R³, e₁ and e₁+πe₂ are primitive and independent over K but have the same reduction. Use instead the kernel of evaluation at a primitive direction: it is a split free direct summand of rank n−1, and a basis reduces independently. This proves the required lemma after identifying the invariant differential lattice. The page-31 image confirms the original inference.

Corollary 10.5 is false for hyperelliptic genus three: j:C^(2)→J contracts the g¹₂ curve E≃P¹ and K=θ has intersection zero with E. Restrict the routed ampleness theorem to nonhyperelliptic C, where the Abel map is a closed immersion and θ is ample. Show V is nef using its moving family; an arbitrary ample-plus-effective sum need not be ample. Page 37 confirms the unrestricted printed claim.

Other corrections retained in the relevant items: intersection of cycles has dimension r₁+r₂−n; the general-dimensional top intersection in Lemma 9.3 is H^n, not H³; Γ∩U_e is intended, not Γ∪U_e; equation (9.5) uses inequalities after the residue counts; translation preserves the leading 1 and the factor (1−e/(p−1))⁻¹; the homogeneous degree-h exponential denominator is h!, not a fixed m!; Lemma 6.2 permits M=1 and λ=0; the m=0 adapted-parameter case is handled separately.

**G6 — Original suppliers still to close.** The preprint's full proofs were read, but citations within them do not count as reading the original proofs. Named remaining tasks include:

- Hironaka, *On the arithmetic genera and the effective genera of algebraic curves*, Kyoto A 30(2) (1957), 177–195: Theorems 1–2 for δ, genus and neighboring-point formulas, with characteristic hypotheses.
- Płoski, *Introduction to the local theory of plane algebraic curves*, Theorem 2.1: branch orders and zero-coordinate conventions. Garcia-Fritz Theorem 2.69 gives a read branch correspondence proof, but its characteristic-zero context does not close the general case.
- Nakai, *On the theory of differentials on algebraic varieties*, Hiroshima A-I 27 (1963), 7–34, Theorem 5(I): restriction to generating hypersurfaces. The different paper *Notes on invariant differentials on abelian varieties*, Kyoto 3 (1963), 127–135, is the smooth-curve remark and must not be confused with this supplier.
- Debarre's cited Kempf–Mumford–Ramanujan positivity theorem, Matsusaka's Jacobian criterion/factorization and the relevant Mumford ample/very-ample and isogeny results. The selected Debarre proof was read; these deeper originals were not.
- Brody; Green, *Holomorphic Maps to Complex Tori*, AJM 100(3) (1978), 615–620; Yau, *Intrinsic measures of compact complex manifolds*, Math. Ann. 212 (1975), 317–329; and the minimal-surface/classification inputs. Hyperbolicity/general-type rows remain unassigned until their canonical owner and exact hypotheses are established.
- Chavdarov, *The generic irreducibility of the numerator of the zeta function in a family of curves with large monodromy*, Duke 87(1) (1997), 151–180, cited Corollary 6.10: check density, monodromy and odd-dimensional End=Z hypotheses in the original. Density-one endpoints remain withheld.
- The Poincaré cycle formulas, symmetric-square Abel tangent criterion and intersection original sources cited in §10.3. Do not prove a closed immersion solely from injectivity on geometric points.

These tasks are explicit proof dependencies in the briefs. They do not authorize replacing a missing theorem with an opaque assumed proposition.

## Ownership and pinned-library evidence

Libraries were inspected at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Actual declarations were read in Mathlib `RingTheory/Kaehler/Basic.lean`, `RingTheory/FormalGroup/Basic.lean`, and Tau Ceti `AlgebraicGeometry/AbelianVariety/Basic.lean`, `TangentSpace.lean`, and `RingTheory/PowerSeries/GaussNorm.lean`. The JSON gives full declaration names. The built Gauss maximum and multiplicativity are not a Strassmann zero theorem. Built FormalGroup is one-dimensional. Built abelian varieties are over a field, not relative abelian schemes; the existing elliptic Mordell–Weil theorem is not a theorem for arbitrary A.

The reviewed `data/library-coverage.json` rows for SF.0/3/4/5, AB.A1–A4/A6, ED.4, Coleman L0/L1, RP.1 and the Weil suppliers were checked alongside the corresponding atlas stages. AdicSpacesPartII F0/R1/R2 has no direct audit row under those IDs; its coverage boundary is established by the reviewed SF.4 and Coleman L0/L1 foundational records plus actual declaration searches and the current owner document, not by inventing an audit verdict. The input snapshot is recorded in `source.atlasCommit`; all relevant inputs are rechecked against main before publication.

The shared owner decisions are:

- SF.0 owns the relative differential-sheaf construction and pullback built on ring Ω; SF.4 owns normalization/singularity and good-model inputs; SF.4/5 own the birational and intersection calculations. Upstream AlgebraicCurves/JacobianChallenge constructions are imported.
- AB.A1 supplies invariant forms, A2 polarization, A3 isogeny étaleness, A4/A6 endomorphism polynomials, Morikawa and degree comparisons.
- AdicSpacesPartII F0/R1/R2 supplies formal charts and continuous differential comparisons. AdicEtaleGeometry A2 explicitly delegates this geometry there; it is not a competing owner.
- ED.4 already names Strassmann/Newton residue-disc bounds. Coleman L0/L1 supply analytic integration in the curve programme but are not silently imported wholesale for the formal-group proof. NC.4/5's nonabelian machinery is not needed for a rank-one abelian surface argument.
- WeilConjectures WC.1/5 owns zeta arithmetic and finite-field counts. RP.1 owns general Mordell–Weil.
- The new **Abelian Schemes and Arithmetic Moduli, Part II: integral formal Lie theory** adds the dimension-general integral exponential, analytic directions and short-jet interface. It imports and compares the existing one-dimensional/elliptic carriers. Searches of all atlas owners found p-adic Lie group rings and Heegner formal logarithms, but neither supplied this theorem; those are not duplicated.
- **Effective Diophantine Methods, Part II: surface Chabauty and quadratic points** adds overdetermined jets, geometric form restriction, the local residue bound and symmetric-square application geometry. Its brief quotes the historical global target while expressly blocking it and excluding those numerical endpoint items from the route.

The two new roadmaps have current galaxy ID `arithmeticgeometry`, a named parent, import boundaries, exact endpoints and design instructions for API/tests/Lean signatures. Neither proposes rebuilding an existing Tau Ceti roadmap.

## Coverage and validation

The JSON records every numbered theorem/lemma used in the preprint's proof chain and splits the major alternatives, generic/integral/reduced jet statements and application endpoints. The seven built records are narrow carrier/theorem imports; partial library coverage never marks a larger theorem built. Source-failure statements are records of the claim being investigated, clearly marked in their notes, not assertions that false mathematics is a theorem target.

Python checks passed for finite-field enumeration and normalization of the F₃ nonsplit node (including its two F₉ branches), zeta cancellation, primitive-vector reduction, corrected prime thresholds, factorial valuations, differential torsion at m=p−1, the corrected sharpness example, symmetric-square intersections for g=3,…,30 and the first prime 521. These computations verify the reported counterexamples and numerical identities, not the paper's general theorems. Structural checks enforce unique IDs/routes, correct status boundaries, five PDF hashes, and API/≥3-test coverage for all definitions and constructions. Repository `check_paper.py` and intake path checks are run on the final deliverables. This issue requests JSON/Markdown, so no Lean file was created or compiled.

The intentionally withheld IDs are:

- `PAPER-CARO-PASTEN-23/hyperbolic`
- `PAPER-CARO-PASTEN-23/hyperbolic-surface`
- `PAPER-CARO-PASTEN-23/abelian-surface-general`
- `PAPER-CARO-PASTEN-23/bad-branch-bound`
- `PAPER-CARO-PASTEN-23/sharp-example-source`
- `PAPER-CARO-PASTEN-23/semiinjective-source`
- `PAPER-CARO-PASTEN-23/formal-low-degree-source`
- `PAPER-CARO-PASTEN-23/formal-log-source`
- `PAPER-CARO-PASTEN-23/main-local-source`
- `PAPER-CARO-PASTEN-23/primitive-proof-source`
- `PAPER-CARO-PASTEN-23/global-sum-source`
- `PAPER-CARO-PASTEN-23/number-field-source`
- `PAPER-CARO-PASTEN-23/qp-source`
- `PAPER-CARO-PASTEN-23/rational-three-source`
- `PAPER-CARO-PASTEN-23/rational-simple-source`
- `PAPER-CARO-PASTEN-23/simple-density`
- `PAPER-CARO-PASTEN-23/density-bound-source`
- `PAPER-CARO-PASTEN-23/ample-symmetric-source`
- `PAPER-CARO-PASTEN-23/symmetric-bound-source`
- `PAPER-CARO-PASTEN-23/genus-three-source`

Resume with G0, then the weighted Frobenius/branch correction G1, corrected formal construction G4, and original suppliers G6. Reconcile changed statements before promoting this checkpoint to complete.
