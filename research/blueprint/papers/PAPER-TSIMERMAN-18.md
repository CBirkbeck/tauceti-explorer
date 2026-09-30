# PAPER-TSIMERMAN-18 — Tsimerman, André–Oort for A_g

**Status: complete. The whole paper has been read and every missing item is routed once. The deduction of the CM height estimate is explicit at the imported-theorem level; recursive proof closure of the cited sources is prerequisite work (§10).**

Fix #4985, Codex session `codex-5ebb6f`, 30 September 2026: **106 items: 6 library, 25 planned, 75 missing; 12 routes**. All 101 incoming IDs are preserved. Functional-transcendence foundations share the existing pending LogicAndDefinabilityPartII; general mixed geometry has a new ShimuraVarietiesPartII supplier. Only the restricted mixed arithmetic application remains at LD.6. Source findings E9–E12 now record the Artin-contour, unpolarized-rigidity, positive-constant and numerical-degree defects. This revision awaits independent `REV-FIX-RT-PAPER-TSIMERMAN-18`; the older eleven-route review is historical.

The initial extraction and continuations were issue #1141, including Codex `codex-c83e7a` (21 September) and Claude Code `cc-fb70e5` (22 September). The 23 September independent paper review recorded 101 items, 5 library/30 planned/66 missing and 11 routes, with 69 proposed API tests. Those counts and checks describe that earlier revision.

The new work supplies the quadratic-Hecke height argument, including the uniform convexity/Cauchy estimates, residue quotient, gamma and metric constants; imports Mathlib's existing discriminant tower identity; decomposes the uniform ideal count; and activates two proposed quantitative Part II briefs. None of this claims a new formal proof or complete recursive extraction of the source literature.

## 1. Sources, editions, and access

The primary source is Jacob Tsimerman, *The André–Oort conjecture for A_g*, Annals 187 (2018), 379–390, [DOI 10.4007/annals.2018.187.2.2](https://doi.org/10.4007/annals.2018.187.2.2). All six sections, references, and all twelve images of the [published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) have been read. The earlier arXiv version 1506.01466v5 was compared. Use published numbering: **Lemma 4.1 is absent from the earlier arXiv version**. The published Colmez expression has the factor `(1/2) log f_rho`.

Theorems 1.2/4.2 and 1.3/5.3 are repeated statements, not independent targets. The individual Colmez conjecture and unrestricted André–Oort conjecture in the introduction are context, not proved inputs. The mixed consequence is restricted to the pure parts stated on p. 380.

Additional reads in this continuation:

| Source | What was actually read |
| --- | --- |
| [Pila–Tsimerman, Ax-Lindemann for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p05-p.pdf), Annals 179 (2014) | The complete published §7, pp. 673–678, including the page images and the final induction. Review corrects the earlier nonexistent Lemma 3.3 citation: §2 definitions are on p. 663; the semialgebraic Theorem 6.1 and its reduction are on p. 670. |
| [Tsimerman, Brauer–Siegel for arithmetic tori](https://arxiv.org/pdf/1103.5619), JAMS 25 (2012) | The arXiv §§7.1–7.2, PDF pp. 17–22, including images. The reduction Theorem 7.1 and local index arguments were read; the rest of the paper and a published-edition reconciliation were not completed. |
| [Pila–Tsimerman, André–Oort for abelian surfaces](https://arxiv.org/pdf/1106.4023), Compositio 149 (2013) | Complete arXiv §3, PDF pp. 3–9, including images. Despite the title, Theorem 3.1 and its height proof are all-dimensional. |
| [Silverberg–Zarhin, Rigidity theorems for abelian varieties](https://webapps.math.uci.edu/~asilverb/bibliography/rigidity.pdf) | All four pages; introduction and bibliography also inspected as images. This author-hosted paper explicitly states the Silverberg 1992 result needed here. It does not constitute direct access to the original Proposition 2.3. |
| [Gao, Towards the André–Oort conjecture for mixed Shimura varieties](https://arxiv.org/pdf/1310.1302) | Complete §13, PDF pp. 46–50, including images, Theorem 13.3, Remark 13.5, and Theorem 13.6 with proof. Earlier mixed Ax–Lindemann and quotient theorems were identified but not read in full. |
| [Yuan–Zhang, The averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) | Published pp. 534–535, including images: metric convention and Theorem 1.1. No claim to have read the 106-page proof. |
| [Yuan–Zhang, 2023 erratum](https://annals.math.princeton.edu/2023/198-2/p08) | Publisher abstract only. It replaces auxiliary Theorem 2.7 by a weaker sufficient result. Import the corrected work through existing paper job #1145. |

The published twelve-page paper was reread in full as extracted text in this continuation; the height formulas were also checked visually. Its binary is now available. Yuan–Zhang pp. 534–535 and Thorner–Zaman pp. 1141–1142 were checked in page images. The inherited image reads and source-specific limitations in the table remain attributed to the earlier workers.

Additional analytic source: [Thorner–Zaman, *An explicit bound for the least prime ideal in the Chebotarev density theorem*](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf), Algebra & Number Theory 11 (2017), 1135–1197. Only pp. 1140–1142 and the relevant bibliography entries were read. Page 1140 specifies constants uniform in the field; equations (2-3)–(2-7) give primitive Hecke continuation and completion; Lemma 2.3 states the required Rademacher convexity estimate. The rest of that paper was not extracted. Its citation of Rademacher is not direct access to the original proof.

Verified binary SHA-256 values:

| Source | SHA-256 |
| --- | --- |
| Tsimerman published 2018 | `43259ca3cfedfb574bf1fe2f80e1023cb736ea299a76588536fd816340722abc` |
| Tsimerman arXiv 1506.01466v5 | `ccc5f8beb50e11fc46bdaf1f05ae5718d26280643698585dcca3ddb99dc3ee9c` |
| Yuan–Zhang published 2018 | `29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507` |
| Tsimerman arXiv 1103.5619v3 | `4cd8527c28b94f98df53738c9805a8ff5c84a94d3754c873b804d33dbdea7aed` |
| Thorner–Zaman published 2017 | `504512d24db46f933d52f277d2ad3a14da5ed66e0efcda0407c8aceadd008d4c` |

The unversioned Tsimerman 2012 download identifies itself as **v3, 12 June 2011**. An AMS published-PDF attempt returned 403, so the prior edition-reconciliation gap remains. A downloaded author excerpt of Iwaniec–Kowalski omits chapter 5 and is not evidence for convexity. A Thorner–Zaman 2019 PDF was downloaded for searching but contributes no mathematical claim here.

The continuation's repository input snapshot is `27a7807aa69923eadb1470ddbf1b36fe47408d92`. The full current audit was read through the raw-file endpoint. The older verified Pages-artifact provenance remains in the JSON as historical provenance, not as the current input snapshot or a paper checksum.

## 2. Baseline and ownership findings

The pins remain mathlib **`082e2d37e8b0463410cdb532e111cd43d5a66174`** and Tau Ceti **`f790474821cf4256814db967cb154e7af3d0c369`**.

The aggregate contains accepted AUDIT-06, AUDIT-08, AUDIT-09, AUDIT-10 and AUDIT-14 records for the relevant analytic, abelian, height, CM and Faltings interfaces. **AUDIT-34 is in `pendingReview`; LD has no accepted aggregate record.** Its draft may guide a search but cannot certify a reviewed absence. The independent review completed the item-level search and supplier check; its ledger records the scope of those checks. No absence claim relies on pending AUDIT-34.

### Existing library items and the coordinate-height import

The original direct check of `Mathlib/NumberTheory/NumberField/CMField.lean`, blob `6c7067617742aae433a648031822e84a41746b4f`, verifies `NumberField.IsCMField` and:

```text
NumberField.IsCMField.units_rank_eq_units_rank
NumberField.IsCMField.indexRealUnits_eq_one_or_two
NumberField.IsCMField.regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv
```

The regulator quotient is `2^(Units.rank E) / indexRealUnits E`, with index 1 or 2. No Galois-over-Q assumption is required. Do not turn the paper's informal comparison of regulators into a false equality or re-plan this existing theorem.

A fresh read of `TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.lean`, blob `1a5b1230f5fdd515978f1d58fcac64bac2c0ad53`, verifies the namespace and statement of:

```text
NumberField.card_ideal_absNorm_le
```

For real `X >= 1`, nonzero integral ideals of norm at most X form a finite set of cardinality at most `X^2 * 2^[F:Q]`. This is a useful existing theorem, **not the uniform near-linear bound printed in Proposition 2.2**. A fixed-field asymptotic is also not automatically uniform across fields of fixed degree. Using the quadratic bound could give a weaker intermediate exponent, but that is a separately justified variant, not the printed proof.

A fresh read of `Mathlib/NumberTheory/NumberField/DedekindZeta.lean`, blob `fbb43cd6ade0c80a65da6c671ca3297a4cdee7da`, verifies:

```text
NumberField.dedekindZeta
NumberField.dedekindZeta_residue
NumberField.dedekindZeta_residue_pos
NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT
```

The final theorem proves the right-real limit of `(s-1) zeta_K(s)` with the explicit positive class-number residue `2^r1 (2*pi)^r2 R_K h_K / (w_K sqrt(|D_K|))`. This is not complex continuation or a functional equation. Neither the analytic class-number formula nor the elementary CM regulator comparison should be duplicated in a new roadmap.

The fifth library item resolves the old provisional discriminant gap. At the mathlib pin, `Mathlib/NumberTheory/NumberField/Discriminant/Different.lean:89–99` proves

```text
NumberField.natAbs_discr_eq_absNorm_differentIdeal_mul_natAbs_discr_pow
D_E = absNorm(differentIdeal(O_F,O_E)) * D_F^[E:F].
```

The statement carries the fraction-field, Dedekind-domain, finite-module and scalar-tower hypotheses. Rings of integers specialize these, and the CM extension has degree two. Thus `D_E >= D_F^2`. The source's norm of the relative discriminant is the same integer as this absolute norm of the relative different; this import does not invent a new library relative-discriminant carrier. The four earlier library signatures were also reread at their pins.

The fix reads `Mathlib/NumberTheory/Height/NumberField.lean:137,146` at the pin: `NumberField.absMulHeight₁` defines the absolute height through Q(x), and `NumberField.absLogHeight₁` is its logarithm. This sixth library item supplies coordinate heights. The tuple counting height is their maximum. RP.0 supplies the remaining extension and complex-to-real comparisons, plus the separate bounded-degree Northcott theorem. The nonalgebraic junk branch is 1 in the code, despite the docstring saying 0; every coordinate used here is algebraic.

### Existing owners and source routes

**LogicAndDefinabilityInNumberTheory:LD.6** owns the source-scoped Pila–Zannier/André–Oort assembly. The arithmetic section-7 refinement belongs in this existing application branch. LogicAndDefinabilityPartII owns the shared special/weakly-special definitions and promotion, definable Siegel uniformization, Ax–Lindemann and countable weakly-special families, coalescing with MPT19/2 and /8. Rational counting stays planned at LD.6; Pila 2009 Theorem 1.6 is a separate missing bounded-coordinatewise-degree refinement in its early counting prefix. Generic reductive-group and canonical-model facts must remain imports in its eventual blueprint; attaching a source-specific lemma here does not transfer ownership of the general theory to logic.

**ArakelovGeometryAndAbelianHeights:R35.1–R35.3** owns the metrized Hodge determinant and stable height, including basis/field independence. R35.5–R35.6 receives the Bost lower-bound source. R35.4 is a height-variation formula, not a polynomial bound for the degree of an isogeny.

**ComplexMultiplicationAndExplicitReciprocity:CM.0/CM.2** owns CM-type/reflex algebra and the explicit reciprocity dictionary. CM.2 imports the main general CM theorem from **ShimuraVarieties:V5**. CM.1 is elliptic and cannot substitute for arbitrary-dimensional CM classification. Preserve the V5-to-CM.2 direction.

**HeightsRationalPointsAndObstructions:RP.0** imports Mathlib’s absolute coordinate heights and supplies field-extension/complex-to-real comparisons and bounded-degree Northcott. The accepted audit distinguishes the needed statement from existing fixed-number-field element Northcott and polynomial Mahler-measure finiteness. These two items have been removed from the ambiguous ordinary-height part of the LD source route and explicitly attached here.

**AnalyticNumberTheory:AN.4** explicitly includes completed Hecke/Dedekind/Artin interfaces and distinguishes meromorphic continuation from Artin holomorphy. The earlier report's suggestion that this roadmap was only classical zeta/Dirichlet theory was too narrow. Its general Hecke functional-equation supplier is **AutomorphicLFunctionsAndLocalFactors:AL.1**; its character carrier comes from **GlobalNumberFields**, not a new analytic spelling. The Artin functional-equation item is now planned/source-routed to AN.4. The uniform quadratic-Hecke estimates are now decomposed below; the stronger original Artin-route interfaces remain separately unverified.

**AbelianSchemesAndArithmeticModuli:A3/A6** supplies dual torsion, the Weil pairing and arithmetic Hom groups. The explicit Silverberg descent contract is attached to these common interfaces. **PELModuli:M6** supplies the separate comparison between coarse rational moduli points, actual families and descent obstructions.

### Upstream reads and remaining coordination

Both **EffectiveBounds** and **GlobalNumberFields** were read in full. Their blobs are `75f30b8637d98c1d4a134fd707e87c690dcbd963` and `8055760d129f0f8dc38c1e0d5f6b1055d03c0376`. GlobalNumberFields owns general field orders/Picard and ideal/idele/Hecke-character foundations; it does not supply all analytic L-function theory, and its single-field order carrier is not automatically the product-order carrier for `Z(End(A))`.

The original 211-roadmap stage portfolio, relevant owner documents, current proposed-roadmap/packet JSON, reserved IDs, and accepted AN/R28 source decompositions were screened. The AN decomposition already contains Tate's completion, Hecke comparison and the Artin-holomorphy distinction. Its source proof is still partial; it does not supply the uniform derivative estimate just by mentioning analytic continuation. The accepted R28 decomposition contains the Faltings height-variation and qualitative Hom/isogeny theorems, not the required polynomial minimum-degree bound. The two Part II routes below are therefore proposed extensions, subject to independent review, rather than manual reservations or edits to upstream roadmaps.

## 3. Arithmetic chain: what is established and what remains

### CM classes, ideal isogenies and uniform counting

`S(E,Phi)` is the unpolarized O_E-equivariant class set, not the principally polarized moduli set. Its cardinality is h_E. For a primitive type with maximal order, quotienting by the ideal torsion gives the ideal action and degree N(I). Keep the ideal's norm and the cardinality of the kernel tied by the CM classification and quotient comparison, rather than declaring a numerical degree on an arbitrary map.

The class-number lower bound uses the relative quotient h_E/h_E0, the discriminant tower, fixed-degree Brauer–Siegel and the already-built regulator comparison. The near-linear ideal count is uniform in E at fixed degree. An elementary proof can bound the norm-n coefficient by the fixed-order divisor function: the local factor is dominated by that of `zeta(s)^(2g)`, followed by the uniform divisor bound. The new coefficient/divisor nodes spell out this argument; it is not claimed as an existing pinned theorem.

The printed Proposition 2.2 states existence of a distant pair, but its proof fixes A arbitrarily. Retain the stronger consumer quantifier **for every A, there is a distant B**; the eventual field-of-moduli bound applies to every A.

### Quantitative isogenies and descent

The required Masser–Wüstholz contract is a dimension-uniform polynomial bound for the minimum *geometric* isogeny degree in `max(1,h_F(A),[k:Q])`, after A and B are defined over a common number field. It is not required to preserve chosen polarizations. The previous checkpoint read [Factorization estimates](https://www.numdam.org/item/PMIHES_1995__81__5_0.pdf), Theorem II and the field-degree discussion at printed pp. 6 and 23, independently rechecked in review (the former pp. 7 and 24 locators were wrong). R28.4's qualitative Tate/isogeny criterion does not provide this estimate.

The author-hosted Silverberg–Zarhin introduction states the exact sufficient homomorphism theorem: for A,B over F and `n >= 3` prime to the characteristic, every geometric homomorphism A to B is defined over every extension where all n-torsion of **both** varieties is defined. Its reference [5] is Silverberg's 1992 paper. This closes the previous uncertainty about the sufficient n=3 hypothesis, while not pretending the original proposition was directly obtained.

In characteristic zero, full A[3] and mu_3 give full A-dual[3] by the perfect Weil pairing. Apply the homomorphism theorem to End(A) and Hom(A,A-dual). The latter descends polarization **morphisms**, not automatically chosen ample line bundles. The published Lemma 4.1 gives an extension bound `2*3^(4g^2)` over the field of moduli, and the common field in the proof is bounded by `4*3^(8g^2)`. A coarse residue field cannot be passed directly to Masser–Wüstholz before constructing the model.

### The quadratic-Hecke deduction of the CM height bound

This supplies a checked deduction from named imported contracts. It does **not** claim that the original proofs of Brauer–Siegel, Rademacher convexity, Bost or averaged Colmez have been recursively extracted. Those remain explicit prerequisites. E9 records the unavailable arbitrary-Artin contour. The separate missing Artin derivative item now asks for factorwise logarithmic derivatives with pole cancellation/regularization, not fixed-radius Cauchy on an arbitrary Artin function. The height consumer continues to use the quadratic route.

Let $E/F$ be CM, $[F:\mathbf Q]=g$, $D=D_E$, and $\eta=\eta_{E/F}$ its nontrivial quadratic character. Its primitive conductor gives

$$Q=D_F N\mathfrak f_\eta=D_E/D_F,\qquad 1\le Q\le D.$$

GlobalNumberFields supplies the character dictionary; ClassFieldTheory layers 11 and 13 supply reciprocity and conductor–discriminant. The character is real and odd at every real place. The following deduction is from named imported theorems, not a certification of their full proofs.

1. Yuan–Zhang use squared metric $(2\pi)^{-g}$ times Tsimerman's volume metric, with the same finite lattice. Thus $h_{YZ}=h_T+(g/2)\log(2\pi)$: shrinking a norm increases arithmetic degree.
2. The completion is $\Lambda(s)=Q^{s/2}\Gamma_{\mathbf R}(s+1)^g L_f(s,\eta)$, where $\Gamma_{\mathbf R}(s)=\pi^{-s/2}\Gamma(s/2)$. It is entire and satisfies $\Lambda(s)=w\Lambda(1-s)$. There is no trivial-character pole factor.
3. Euler factors, including ramified primes, give $\zeta_E=\zeta_F L_f(\eta)$. Taking residues gives $L_f(1,\eta)=\kappa_E/\kappa_F>0$. The pinned theorem supplies the positive right-real residue; the complex-continuation comparison remains an analytic adapter. Fixed-degree Brauer–Siegel and the class-number formula give $D_K^{-\epsilon}\ll\kappa_K\ll D_K^\epsilon$, with bounded-degree constants, possibly ineffective. Since $D_F\le D^{1/2}$, exponent allocation gives two-sided subpolynomial bounds in $D$ for $L_f(1,\eta)$.
4. Thorner–Zaman Lemma 2.3 has conductor exponent $(1+r-\sigma)/2$ and constants uniform in the field. On $|s-1|=r$, with $r=\min(\epsilon,1/4)$, that exponent is at most $r$ and the imaginary part is bounded. Cauchy's formula for the entire function $L_f$ gives $|L_f'(1,\eta)|\ll_{g,r}Q^r\ll D^\epsilon$. Zeros inside the circle cause no problem: Cauchy is applied to $L_f$, not its logarithm. Divide by the lower bound for $L_f(1,\eta)$, allocating half the desired exponent to each estimate.
5. Set $\ell_j=L_f'(j,\eta)/L_f(j,\eta)$. Nonvanishing at zero follows from the functional equation and nonvanishing at one. Logarithmic differentiation, with $\psi(1/2)=-\gamma-2\log2$ and $\psi(1)=-\gamma$, gives

   $$\ell_0+\ell_1=-\log Q+g(\gamma+\log(2\pi)).$$

   Yuan–Zhang Theorem 1.1 gives $\operatorname{avg}h_{YZ}=-\ell_0/2-\log Q/4$. Consequently

   $$\operatorname{avg}h_T=\tfrac14\log Q+\tfrac12\ell_1-\tfrac g2\gamma-g\log(2\pi).$$

   This is subpolynomial in $D$. Import the averaged theorem with its corrected proof through #1143/#1145.
6. Bost supplies a real constant $c_g$ bounding every height below. Averaging over all $2^g$ types, including imprimitive types, yields $h_T(E,\Phi)\le 2^g\operatorname{avg}h_T-(2^g-1)c_g\ll_{g,\epsilon}D^\epsilon$. Primitivity enters the later ideal-isogeny argument. Choose exponents sufficiently small that the distant-isogeny lower bound and the isogeny upper bound force any $\delta<1/(4\kappa_g)$ in the final orbit estimate.

For the near-linear ideal count, the local norm-counting Euler series is coefficientwise dominated by $(1-T)^{-n}$, $n=[K:\mathbf Q]$. Hence the coefficient at an integer $m$ is at most $d_n(m)$. For large primes use $\binom{a+n-1}{n-1}\le n^a\le p^{\epsilon a}$; for the finitely many smaller primes, the quotient of that polynomial in $a$ by $p^{\epsilon a}$ has bounded supremum. The resulting bound $d_n(m)\ll_{n,\epsilon}m^\epsilon$ is uniform in $K$, and summing yields $O_{n,\epsilon}(X^{1+\epsilon})$. The pinned quadratic ideal bound and fixed-field linear asymptotic remain different statements.

The retained general-Artin branch still requires its own induction, regularized pole cancellation, nonzero values at one and factorwise logarithmic-derivative bounds. E9 records why the printed contour cannot supply these. None is inferred merely because the quadratic deduction works.

### Primitive reciprocity and arbitrary centre orders

Keep Cl(K), Cl(K-star), and Cl(L) distinct, where K-star is the reflex field and L a normal closure. The normal-closure reflex map is the reflex class map composed with the ideal norm. Its norm-image index is bounded in the fixed dimension. The polarization stabilizer H imposes the relation between a principal type norm `(a)` and `a*bar(a)`; the scalar ideal norm is taken from **K-star**, where the ideal lives. The quotient ker(r)/H is controlled by totally positive real units modulo CM norms. The exact field-degree relation must still be checked against the CM theorem: absolute moduli degree and degree after adjoining the reflex field are not interchangeable equalities.

Tsimerman 2012 Theorem 7.1 is now read. Its primitive hypothesis is required for **every simple dimension h <= g**, not just g. For a general point, decompose A up to isogeny into `product A_i^(n_i)` with pairwise nonisogenous simple factors. The fields K_i may nevertheless be isomorphic. Then

```text
End^0(A) = product M_(n_i)(K_i),
R = Z(End(A)) inside O = product O_(K_i),
|disc R| = [O:R]^2 * product |disc K_i|.
```

The exponent n_i is the multiplicity, not the dimension of A_i. The order index is not the Mumford–Tate compact-subgroup index. The source's Lemma 7.2 supplies a **comparison**:

```text
[O:R] <= [T(Zhat):K_x]^(c_g) * (product |disc K_i|)^(d_g),
K_x = T(A_f) intersect GSp_(2g)(Zhat).
```

The proof uses reciprocity/class-group projections, bounded norm cokernels, generation by Mumford–Tate/reflex-trace elements, local order indices, p-adic exponentials, and a Vandermonde/Nakayama argument. The factor depending on the number of bad primes cannot be discarded without an epsilon estimate. At p=2, choose sufficient exponential depth. These interfaces are separate nodes; the local proof leaves and the arXiv/published notation reconciliation remain open rather than being hidden behind “reduce to the simple case.”

## 4. CM lift heights: the actual all-dimensional proof

Pila–Tsimerman 2013 §3 proves polynomial height in the discriminant of the **centre order R**, including products and nonmaximal orders. Its steps are not just compactness of a fundamental set:

1. Scale a CM lattice into O_K with index polynomial in disc(R), using the multiplier order and a small ideal representative.
2. Construct a basis with bounded conjugates. With the standard embedding in C^g, the real covolume is `2^(-g)*sqrt(|disc K|)*[O_K:I]`; the polynomial argument must not import a literal unsquared-discriminant covolume.
3. Bound the totally imaginary polarization element, its denominators, and a symplectic basis. Control the Riemann form and principal determinant explicitly.
4. Prove quantitative Siegel/Minkowski reduction (Lemmas 3.4–3.5), then convert conjugate/denominator bounds to the chosen absolute Weil height.
5. Handle isotypic products, projective O_K-modules, and a bounded polarization-compatible isogeny. The matrix in Lemma 3.7 is integral and invertible over K, not asserted unimodular over O_K.

Some arXiv intermediate expressions use `disc(O_A)` despite the lattice-index dependence, and one displayed matrix size uses the simple-factor dimension where the multiplicity is required. The final Theorem 3.1 depends on disc(R); before transcribing intermediate lemmas, reconcile the published version and preserve the order index. This report does not claim to have checked an erratum or established a defect in the final theorem.

E12 now explicitly records the numerical degree defect. The earlier comparison was: the inspected 2013 text gives `4g` for entries in the simple-case construction, whereas the 2014 Lemma 7.4 uses `2g`. The consumer only needs a bound depending on g. Keep that sufficient statement, distinguish coordinatewise from joint-field degree, and explicitly pass from complex entries to real/imaginary coordinates before bounded-degree counting. The complex CM-field period coordinates lie in the reflex field, of degree at most `2^g`; integer symplectic reduction preserves that field. A generic sextic type can have reflex degree 8, exceeding 6. Keep `d_g`, with a separate real/imaginary adapter (the coarse `2^(g+1)` bound suffices), rather than an exact `2g` theorem.

## 5. The corrected finite-family argument

The previous item `finite-weakly-special-families` wrongly attributed its conclusion to **Lemma 7.2**. The correct chain is in the whole of Pila–Tsimerman 2014 §7:

- **Lemma 7.2, p. 674:** reductivity of the connected normalizer N(F) for the specified connected semisimple rational F. The relevant exclusion is compact **Q-factors**, not every compact real factor.
- **Lemma 7.3, p. 675:** finiteness of the special envelopes attached to a fixed F. Define N(F)_sh as the identity component of the kernel of the projection from N(F) to the product of compact Q-factors of its adjoint. Keep the condition on the image of the Deligne torus. Finiteness here does not assert that every weakly special translate is discrete.
- **Lemma 7.4, p. 675:** bounded centre-order discriminant gives finitely many special points, using lift height, degree and Northcott.
- **Lemma 7.5, p. 677:** the positive-dimensional weakly special locus of algebraic V is a countable union of closed algebraic subvarieties, using rational Shimura subdata and algebraic whole-fibre parameter loci.
- **Lemma 7.6, pp. 677–678:** that locus is definable. This uses finite real semisimple embedding types and definable dimension/maximality, not closure under arbitrary countable unions.
- **Lemma 7.7, p. 678:** a countable union of closed complex algebraic subvarieties of a complex quasiprojective variety, if definable in R_an,exp, is a finite subunion. Finite real-analytic cell decomposition, a Baire/dimension argument and analytic continuation are needed. The analogous claim for arbitrary definable subsets is false.

The pointwise chain is unchanged but now has its missing transport made explicit:

```text
Galois-orbit lower bound + CM lift height/degree
  + definability + bounded-degree Pila counting
  -> a conjugate on a positive-dimensional semialgebraic piece
  -> a maximal complex algebraic piece
  -> weakly special by Ax-Lindemann
  -> special because it contains a special point
  -> conjugate back using V/k and Galois stability of special subvarieties.
```

The original rational-point Pila–Wilkie statement alone is insufficient; the bounded-degree algebraic-point version and height comparison need their own source/adapter. Likewise a real semialgebraic arc is not itself a complex algebraic subvariety. These inputs remain separate.

Pointwise coverage still does not prove finite maximality. For each fixed F there are **two** induction branches. If N(F)_sh is proper in the generic Mumford–Tate group, use finitely many proper special envelopes and lower-dimensional intersections. If it is the whole group, F is normal; an almost-direct product with the centralizer gives a finite Shimura product map. In the complementary factor form the closed algebraic locus where the **entire** F-fibre is contained in the inverse image of V. This locus has smaller dimension. A positive-dimensional special parameter locus would create a larger special subvariety, so maximal fibres are controlled by isolated special parameters and induction. Combine this with the finite reduction of weakly special families.

The new normalizer, countability, definability, finite-subunion, parameter-locus, isolated-parameter and Galois-transport items preserve these distinctions. They are source obligations, not generic facts silently assigned a second owner.

## 6. The restricted mixed-Shimura consequence

Gao §13 first separates the mixed orbit from its pure projection. Fix the mixed datum `P=W semidirect G`, integral coordinates and the prescribed level. A special point has Mumford–Tate group `wTw^(-1)` with `w in W(Q)`; its denominator N(s) depends on those fixed choices. It agrees with a fibre torsion order only in the stated semiabelian situation up to fixed constants.

Theorem 13.3 proves, for `0 < epsilon < 1`,

```text
|Gal(Qbar/E) s|
  >= C_epsilon * N(s)^(1-epsilon) * |Gal(Qbar/E) pi(s)|,
```

where E is the reflex field and the datum/level is fixed. The compact-torus index and elementary prime-factor estimates are part of the proof. This relative inequality does not require GRH.

Theorem 13.6 then assumes the appropriate **pure Galois-orbit bound**, not merely pure André–Oort. Its proof additionally uses mixed Ax–Lindemann (Theorem 1.2), the quotient/dimension reduction of Theorem 12.2, definability, height bounds and algebraic-point counting. Tsimerman's all-CM orbit bound supplies the previously conditional pure input for the pure parts stated in the 2018 introduction. Accordingly `mixed-application-interface` now depends on the orbit theorem and the conditional mixed theorem, not just `andre-oort-ag`.

This checks the restricted implication and §13 proof, not the whole Gao paper. The mixed foundational constructions are explicit missing items for ShimuraVarietiesPartII. Mixed Ax–Lindemann is an explicit missing item for LogicAndDefinabilityPartII. Their recursive proofs remain prerequisite work for those blueprints (§12). The statement has not been broadened to all mixed Shimura varieties.

## 7. Proposed quantitative extensions and remaining mixed routing

The machine-readable routes contain the complete design briefs, imports, exact targets, mandatory examples and suggested future Lean paths.

**ComplexMultiplicationAndExplicitReciprocityPartII — CM heights and Galois-orbit bounds.** This extends CM.0/CM.2 with quantitative CM-height, distant-isogeny, moduli-degree, general-centre-order orbit and lift-height layers. It imports general CM reciprocity from V5, geometric carriers from A3/A6, moduli descent from M6, stable heights/Bost from R35, uniform estimates from AN and quantitative isogenies from the separate Part II. It consumes the averaged-Colmez theorem through its existing paper jobs. General ideal classification and the polarized reciprocity dictionary stay source-routed to CM.0/CM.2; they are not reimplemented in the extension. Targets retain primitive/maximal-order hypotheses where required, all smaller simple dimensions in the general reduction, and coordinatewise height/degree conventions.

**FaltingsFinitenessAndIsogenyTheoremsPartII — Quantitative isogeny estimates.** Prove the dimension-uniform polynomial bound for minimum geometric degree in `max(1,h_F(A),[k:Q])`. The common field must define both varieties. Polarization removal, field-degree dependence and the geometric-versus-rational distinction must be proved from the full Masser–Wüstholz source. The existing accepted R28 decomposition supplies qualitative ingredients but does not supply this estimate.

**Uniform analytic work refines AN.4/AN.5.** AN.0 was dropped by accepted RS-07. The `a_K(m)<=d_n(m)` coefficient majorant belongs beside the divisor estimates in AN.5 and imports the existing ArithmeticDirichletSeries Layer 3 Euler-factor carrier. It does not need a second Hecke carrier or another analytic roadmap. General continuation and the completed equation are source-routed to AL.1; the quadratic character imports GlobalNumberFields layers 9–10 **and ClassFieldTheory layer 11**; its conductor-discriminant identity imports **ClassFieldTheory layer 13**. These upstream constructions are not replanned in AN. The height metric adapter has the single owner R35.2. Its stable-height ingredients remain imported. Quantitative CM and the AGHMP/Yuan–Zhang consumer branches import that comparison, including its additive constants; they do not prove it a second time. The current AN source decomposition is reused, including its explicit distinction between Artin continuation and the holomorphy conjecture.

**LogicAndDefinabilityPartII — functional transcendence.** Use the exact existing MPT19 route-1 identity and pending design. Share /2’s special/weakly-special definitions and /8’s Siegel definability; derive PT2014 Theorem 6.1 from the shared Ax–Schanuel target. Own PT2014 Lemma 7.5’s countable algebraic decomposition. Add Gao’s distinct mixed Ax–Lindemann Theorem 1.2 with the mixed geometry imported from its early supplier. Import only the early o-minimal/counting part of LD.6; LD.6 applications consume the exports.

**ShimuraVarietiesPartII — mixed Shimura varieties.** Extend the pure roadmap with Pink data/quotients, lattices, levels, pure projection and special/weakly-special subvarieties; build on C1’s boundary instances. General definitions, denominator, Gao relative orbit Theorem 13.3, quotient reduction Theorem 12.2 and conditional André–Oort Theorem 13.6 live here. Share the concrete universal abelian-family datum of DGH21/17 by importing an early uniformization prefix of AbelianSchemesBettiMapsPartII, leaving its Betti-form and non-degeneracy applications downstream. Import mixed functional transcendence from LogicAndDefinabilityPartII. Only `mixed-application-interface` is merged into route 1 at LD.6. The briefs require actual acyclic stage separation before promotion; these prefixes are design constraints, not invented stage IDs.

## 8. Regression obligations

The inherited JSON records 69 proposed tests for 23 definitions/constructions; the new mixed-data carrier adds three API entries, use records and three proposed tests. The new coordinate-height library item cites the existing API directly. These are proposed blueprint tests, not executed Lean tests. Include: a non-Galois CM field in the regulator comparison; a product with repeated isomorphic CM fields but inequivalent types; a nonmaximal centre order and its squared index; fixed-field versus bounded-degree Northcott; the existing quadratic versus required near-linear ideal count; a coarse moduli point without a chosen model; dual 3-torsion without silently dropping mu_3; a negative stable height; the trivial Artin pole; a weakly special fibre with nonspecial fixed parameter; Galois transport of the conjugate supplied by counting; the whole-fibre condition in the parameter locus; and a mixed special point whose pure projection alone does not control its denominator.

## 9. Historical validation before fix #4985

The following paragraph describes the earlier continuation. Fresh checks of the current revision are in §12 and the fixes report; the old 2412 regression assertions were not rerun.

Run the repository paper validator and deliverable-path checker against all three deliverables. Additional checks preserve all 84 earlier IDs, resolve the dependency graph, reject cycles and duplicate missing-item routes, check each planned stage and new parent/area, and require an API with at least three tests for all 23 definitions/constructions. The Codex pass counted four deliberately unrouted mixed nodes; they are now routed (§10). Mathematical regression calculations check the local Euler coefficient majorant, contour exponent allocation, metric sign and height-average algebra; they are sanity checks, not analytic proofs.

No Lean file is required for this paper intake, and no Lean compilation was run. The handoff lists the remaining original-proof, polarized-reciprocity, source-edition and mixed-owner work. The exact validator and regression results are recorded in the JSON and handoff.

## 10. Historical completion: routing the mixed items (Claude Code, `cc-fb70e5`)

The 22 September four-item LD.6 decision below is superseded by fix #4985; current ownership is in §§6–7 and §12.

**Owner screen.** The atlas was searched for an owner of general mixed Shimura theory: mixed Shimura data, their special points and the unipotent denominator, and mixed Ax–Lindemann. Only ShimuraCompactifications C1 touches mixed data, and it constructs just the mixed Shimura data at the boundary of toroidal compactifications, saying so explicitly. No layer or Part II owns the general theory.

**Route.** The four items (`mixed-application-interface`, `mixed-special-point-order`, `mixed-galois-orbit-factor`, `mixed-conditional-andre-oort`) are a source route to LogicAndDefinabilityInNumberTheory LD.6. That stage records André–Oort-type proven cases with their exact varieties and hypotheses, built from Galois-orbit bounds and functional transcendence. The paper's mixed consequence is such a case. It was checked against:

- Tsimerman p.380, which states the consequence only for mixed Shimura varieties whose pure part lies in A_g;
- Gao §13 (arXiv 1310.1302v6, PDF pp.46–50):
  - Theorem 13.3, the relative orbit inequality |Gal·s| ≥ C_ε N(s)^{1−ε} |Gal·π(s)|;
  - Theorem 13.6, mixed André–Oort for abelian type under the pure orbit bound (13.8);
  - the fact that Tsimerman's Theorem 4.2 is exactly (13.8) when the pure part lies in A_g.

**Superseded prerequisite-only decision.** This continuation left the mixed foundations and Gao’s mixed Ax–Lindemann in the prerequisites list. Fix #4985 adds them as cited items and routes them explicitly, leaving only their recursive proof closure to the supplier blueprints.

**Gaps.** G5 (the unrouted mixed items) is resolved. At that completion checkpoint G1–G4 and G6 stayed open. The independent review below resolves G1 and G6; G2–G4 retain the specified recursive source obligations. They concern recursive proof closure of cited sources, audit refreshes and review of the proposed Part IIs. PROTOCOL §16 handles these through the prerequisites list, so they do not block completeness.

**Check.** `python3 scripts/check_paper.py research/blueprint/papers/PAPER-TSIMERMAN-18.result.json` passes with status `complete` and no unrouted or doubly routed missing item. That completion pass recorded no new source errors; the independent review below adds E6–E8.

## 11. Historical independent review, 23 September 2026

Codex, session `codex-hjdg0j`, job **REV-PAPER-TSIMERMAN-18 (#1142)**: accept the corrected extraction and all eleven routes. The review ledger is [REV-PAPER-TSIMERMAN-18.md](../reviews/REV-PAPER-TSIMERMAN-18.md). There are 101 preserved item IDs, now 5 library, 30 planned and 66 missing; every missing item has exactly one route.

Corrections: the reciprocity subgroup uses the ideal map `t(I)=(a)`, keeping `r` for ideal classes. The common-field construction chooses a quotient polarization defined over the field already defining the ideal quotient. The exceptional-CM finiteness node now explicitly depends on Galois transport. Uniformization imports D5, V0/V1 and M3 and moves from the LD source route to the PEL route; the quadratic character and conductor formula import ClassFieldTheory layers 11/13. Corrected height/counting and Masser–Wüstholz page locators; replaced the nonexistent Pila–Tsimerman Lemma 3.3 locator by the actual semialgebraic Theorem 6.1 and its cited earlier reduction. Pila 2011 Theorem 3.2, p. 1793, directly confirms the coordinatewise degree and absolute-height convention. All 23 APIs now have three proposed names, roles, statements and use records; the 69 acceptance tests remain proposals, not executed Lean tests. The malformed mathematics in §3 was retypeset.

The independent repository snapshot is `85e12faced69f184b09205c0a5abed1cabdd7594`: 218 roadmap documents and 2007 stages were searched, with all relevant supplier descriptions read. The two averaged-Colmez extractions already refer to the same pending CM Part II ID; its brief now explicitly requires one combined design, with the dedicated proof branches imported rather than duplicated.

Existing source findings **E1–E5** remain in their [independently reviewed errata file](../errata/PAPER-TSIMERMAN-18.json). They were rechecked but are not copied into this extraction, because the register collector would duplicate them. The extraction's `sourceIssueReferences` links them. New `sourceIssues` **E6–E8** record the bound-variable slip in the definition of the lift set, the missing weakly-special/CM-point distinction in §6.4, and the missing positive-dimension qualification for parameter loci in §6.5. Published images, arXiv v5, the journal page, author publication page and correction searches were compared. These corrections do not change the main André–Oort theorem. The full 2014 proof supplies the two geometric qualifications.

The review independently read the published main paper in full as text and pages 381–388 as images, selected auxiliary passages recorded in its report, and the actual pinned declarations. This does not upgrade the earlier sources to complete proof reads. G2–G4 remain prerequisite obligations for original Silverberg/CM stabilizer conventions, the general Artin branch, and full primary-source/edition reconciliation. G1 (status refresh) and G6 (Part II/API review) are resolved. No Lean file was required or compiled.


## 12. Fix #4985, 30 September 2026

All eleven confirmed findings are addressed in the [fixes report](../redteam/RT-PAPER-TSIMERMAN-18.fixes.md). All 101 incoming IDs remain; the five added items are coordinate-height definitions (library), bounded-coordinate-degree counting, mixed data, mixed Ax–Lindemann and the cited mixed quotient reduction. Every one of the 75 missing items is routed exactly once. The twelve routes preserve the first ten route positions, retire the duplicate old route 11, and append the shared logic supplier and general mixed supplier.

Four source records are added without fabricating their independent verdicts:

| Record | Corrected obligation | Effect |
| --- | --- | --- |
| E9 | The arbitrary-Artin Cauchy disc is not justified uniformly; the entire quadratic-Hecke chain remains the height argument. | Proof |
| E10 | Polarized level-three descent; the ideal quotient receives a defined pullback polarization. Unpolarized CM units congruent to 1 modulo 3 disprove rigidity. | Proof |
| E11 | The Bost lower constant is real, not required positive; the j=0 example is negative in both relevant normalizations. | No change to the theorem |
| E12 | A bound in g suffices; the CM-type/reflex-field argument supplies exponential bounds, while the printed 2g is unsupported. | No change to the theorem |

E9 is present in the published argument and v5’s Corollary 3.2. E10 is a published Lemma 4.1 problem; that lemma is absent from v5. E11’s word “positive” is in the published lower-bound sentence, but absent from v5’s corresponding proof, despite the verifier’s edition claim. E12’s degree sentence occurs in published §6.2 and v5; the cited PT2014 Lemma 7.4 repeats the unsupported numerical bound. E1–E5 remain in the independently reviewed errata file; E6–E8 and their real historical verdicts remain unchanged here. E9–E12 await independent review.

Fresh primary reads are selected passages: published pp.380–381,383–385,387–388 (381/384/385/387 also images); v5’s Cauchy/counting passages and v1–v4’s corresponding text/searches; PT2014 Lemmas 7.4–7.5; Pila’s 2009 article author copy §1 pp.1–2; and Gao v6 pp.2–3,6–8,16,42–43,46–50. Nine PDF hashes and their read extents are in `sourceVersions`. These are not new full-proof reads. The inherited complete main-paper reads retain their original attribution. Annals, Crossref, arXiv versions and the author’s publications were checked for existing corrections; none applicable was found in this bounded search.

Prerequisite links now identify the actual MSJ book record, MPIM report 96-51 record, and Rademacher’s publisher record, rather than citing PDFs of other papers. Pila 2009 is added explicitly. The separately owned errata file is outside this fix’s deliverables; the maintainer handoff in the fixes report requests its own `sourceVersions` update.

Checks cover the paper schema, source-version and source-issue fields, declared library references and actual pinned definitions, stable IDs and unchanged records, item dependencies, one route per missing item, and proposed stage directions against the assembled atlas. Temporary vertices model only the required early/late splits; no stage IDs, packets, atlas data or upstream roadmaps are edited. Whole LD.6/Betti-Part-II back imports are rejected as cycle-producing negative controls. Historical regression counts are retained as history. No Lean was compiled, and independent `REV-FIX-RT-PAPER-TSIMERMAN-18` is pending.
