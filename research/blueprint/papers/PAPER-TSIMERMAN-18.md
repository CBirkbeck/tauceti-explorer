# PAPER-TSIMERMAN-18 — Tsimerman, André–Oort for A_g

**Status: partial. The deduction of the CM height estimate is explicit at the imported-theorem level; recursive source closure remains incomplete.**

Issue #1141. Codex, session `codex-c83e7a`, 21 September 2026, continuing PRs #1263 and #1639. The 84 existing item IDs and both previous contributors are preserved. There are now **101 items: 5 library, 28 planned and 68 missing**, with **10 routes**. **Four mixed-Shimura items remain unrouted** pending their foundation/owner extraction. All **23 definitions/constructions** now have structured API outlines and **69 proposed acceptance tests** in the JSON.

The new work supplies the quadratic-Hecke height argument, including the uniform convexity/Cauchy estimates, residue quotient, gamma and metric constants; imports Mathlib's existing discriminant tower identity; decomposes the uniform ideal count; and activates two proposed quantitative Part II briefs. None of this claims a new formal proof or complete recursive extraction of the source literature.

## 1. Sources, editions, and access

The primary source is Jacob Tsimerman, *The André–Oort conjecture for A_g*, Annals 187 (2018), 379–390, [DOI 10.4007/annals.2018.187.2.2](https://doi.org/10.4007/annals.2018.187.2.2). All six sections, references, and all twelve images of the [published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) have been read. The earlier arXiv version 1506.01466v5 was compared. Use published numbering: **Lemma 4.1 is absent from the earlier arXiv version**. The published Colmez expression has the factor `(1/2) log f_rho`.

Theorems 1.2/4.2 and 1.3/5.3 are repeated statements, not independent targets. The individual Colmez conjecture and unrestricted André–Oort conjecture in the introduction are context, not proved inputs. The mixed consequence is restricted to the pure parts stated on p. 380.

Additional reads in this continuation:

| Source | What was actually read |
| --- | --- |
| [Pila–Tsimerman, Ax-Lindemann for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p05-p.pdf), Annals 179 (2014) | The complete published §7, pp. 673–678, including the page images and the final induction. Earlier checkpoint reads of Lemma 3.3 and Theorem 6.1 are retained. |
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

The aggregate contains accepted AUDIT-06, AUDIT-08, AUDIT-09, AUDIT-10 and AUDIT-14 records for the relevant analytic, abelian, height, CM and Faltings interfaces. **AUDIT-34 is in `pendingReview`; LD has no accepted aggregate record.** Its draft may guide a search but cannot certify a reviewed absence. The remaining missing statuses still require item-level checking, not a blanket inference from keyword searches.

### Five directly checked library items

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

### Existing owners and source routes

**LogicAndDefinabilityInNumberTheory:LD.6** owns the source-scoped Pila–Zannier/André–Oort assembly. The section-7 refinement belongs in this existing application branch. Generic reductive-group and canonical-model facts must remain imports in its eventual blueprint; attaching a source-specific lemma here does not transfer ownership of the general theory to logic.

**ArakelovGeometryAndAbelianHeights:R35.1–R35.3** owns the metrized Hodge determinant and stable height, including basis/field independence. R35.5–R35.6 receives the Bost lower-bound source. R35.4 is a height-variation formula, not a polynomial bound for the degree of an isogeny.

**ComplexMultiplicationAndExplicitReciprocity:CM.0/CM.2** owns CM-type/reflex algebra and the explicit reciprocity dictionary. CM.2 imports the main general CM theorem from **ShimuraVarieties:V5**. CM.1 is elliptic and cannot substitute for arbitrary-dimensional CM classification. Preserve the V5-to-CM.2 direction.

**HeightsRationalPointsAndObstructions:RP.0** supplies normalized absolute heights, field-extension comparisons and bounded-degree Northcott. The accepted audit distinguishes the needed statement from existing fixed-number-field element Northcott and polynomial Mahler-measure finiteness. These two items have been removed from the ambiguous ordinary-height part of the LD source route and explicitly attached here.

**AnalyticNumberTheory:AN.4** explicitly includes completed Hecke/Dedekind/Artin interfaces and distinguishes meromorphic continuation from Artin holomorphy. The earlier report's suggestion that this roadmap was only classical zeta/Dirichlet theory was too narrow. Its general Hecke functional-equation supplier is **AutomorphicLFunctionsAndLocalFactors:AL.1**; its character carrier comes from **GlobalNumberFields**, not a new analytic spelling. The Artin functional-equation item is now planned/source-routed to AN.4. The uniform quadratic-Hecke estimates are now decomposed below; the stronger original Artin-route interfaces remain separately unverified.

**AbelianSchemesAndArithmeticModuli:A3/A6** supplies dual torsion, the Weil pairing and arithmetic Hom groups. The explicit Silverberg descent contract is attached to these common interfaces. **PELModuli:M6** supplies the separate comparison between coarse rational moduli points, actual families and descent obstructions.

### Upstream reads and remaining coordination

Both **EffectiveBounds** and **GlobalNumberFields** were read in full. Their blobs are `75f30b8637d98c1d4a134fd707e87c690dcbd963` and `8055760d129f0f8dc38c1e0d5f6b1055d03c0376`. GlobalNumberFields owns general field orders/Picard and ideal/idele/Hecke-character foundations; it does not supply all analytic L-function theory, and its single-field order carrier is not automatically the product-order carrier for `Z(End(A))`.

The 211-roadmap stage portfolio, relevant owner documents, current proposed-roadmap/packet JSON, reserved IDs, and accepted AN/R28 source decompositions were screened. The AN decomposition already contains Tate's completion, Hecke comparison and the Artin-holomorphy distinction. Its source proof is still partial; it does not supply the uniform derivative estimate just by mentioning analytic continuation. The accepted R28 decomposition contains the Faltings height-variation and qualitative Hom/isogeny theorems, not the required polynomial minimum-degree bound. The two Part II routes below are therefore proposed extensions, subject to independent review, rather than manual reservations or edits to upstream roadmaps.

## 3. Arithmetic chain: what is established and what remains

### CM classes, ideal isogenies and uniform counting

`S(E,Phi)` is the unpolarized O_E-equivariant class set, not the principally polarized moduli set. Its cardinality is h_E. For a primitive type with maximal order, quotienting by the ideal torsion gives the ideal action and degree N(I). Keep the ideal's norm and the cardinality of the kernel tied by the CM classification and quotient comparison, rather than declaring a numerical degree on an arbitrary map.

The class-number lower bound uses the relative quotient h_E/h_E0, the discriminant tower, fixed-degree Brauer–Siegel and the already-built regulator comparison. The near-linear ideal count is uniform in E at fixed degree. An elementary proof can bound the norm-n coefficient by the fixed-order divisor function: the local factor is dominated by that of `zeta(s)^(2g)`, followed by the uniform divisor bound. The new coefficient/divisor nodes spell out this argument; it is not claimed as an existing pinned theorem.

The printed Proposition 2.2 states existence of a distant pair, but its proof fixes A arbitrarily. Retain the stronger consumer quantifier **for every A, there is a distant B**; the eventual field-of-moduli bound applies to every A.

### Quantitative isogenies and descent

The required Masser–Wüstholz contract is a dimension-uniform polynomial bound for the minimum *geometric* isogeny degree in `max(1,h_F(A),[k:Q])`, after A and B are defined over a common number field. It is not required to preserve chosen polarizations. The previous checkpoint read [Factorization estimates](https://www.numdam.org/item/PMIHES_1995__81__5_0.pdf), Theorem II and the field-degree discussion at printed pp. 7 and 24; that evidence is retained. R28.4's qualitative Tate/isogeny criterion does not provide this estimate.

The author-hosted Silverberg–Zarhin introduction states the exact sufficient homomorphism theorem: for A,B over F and `n >= 3` prime to the characteristic, every geometric homomorphism A to B is defined over every extension where all n-torsion of **both** varieties is defined. Its reference [5] is Silverberg's 1992 paper. This closes the previous uncertainty about the sufficient n=3 hypothesis, while not pretending the original proposition was directly obtained.

In characteristic zero, full A[3] and mu_3 give full A-dual[3] by the perfect Weil pairing. Apply the homomorphism theorem to End(A) and Hom(A,A-dual). The latter descends polarization **morphisms**, not automatically chosen ample line bundles. The published Lemma 4.1 gives an extension bound `2*3^(4g^2)` over the field of moduli, and the common field in the proof is bounded by `4*3^(8g^2)`. A coarse residue field cannot be passed directly to Masser–Wüstholz before constructing the model.

### The quadratic-Hecke deduction of the CM height bound

This supplies a checked deduction from named imported contracts. It does **not** claim that the original proofs of Brauer–Siegel, Rademacher convexity, Bost or averaged Colmez have been recursively extracted. Those remain explicit prerequisites. The original Artin-route items are preserved for source fidelity; the height consumer now depends on the quadratic route instead.

Let (E/F) be CM with ([F:mathbf Q]=g), (eta=eta_{E/F}), (D=D_E), and (Q=D_F Nmathfrak f_eta=D_E/D_F). The equality of the character conductor and the relative discriminant is a named class-field-theoretic proof leaf. In particular (1le Qle D). The character is primitive, nontrivial, real and odd at every real place.

1. **The metric comparison.** The finite Hodge lattices agree, but Yuan–Zhang divide the squared archimedean norm by ((2pi)^g). With the degree-weighted embedding sum this gives
   [
   h_{
m YZ}=h_{
m T}+rac g2log(2pi).
   ]
   Decreasing a norm increases the arithmetic degree. This sign follows directly from the two printed definitions; it is not an assumed shared convention.
2. **The primitive completion.** Equations (2-3)–(2-6) of Thorner–Zaman give the entire completion
   [
   Lambda(s)=Q^{s/2}Gamma_{mathbf R}(s+1)^g L_f(s,eta),
   quadGamma_{mathbf R}(s)=pi^{-s/2}Gamma(s/2),
   quadLambda(s)=wLambda(1-s).
   ]
   The constant root number cancels on logarithmic differentiation. The trivial-character pole factors do not apply.
3. **The value at one.** Euler factors give (zeta_E=zeta_F L_f(eta)), including ramified primes. Taking residues yields (L_f(1,eta)=kappa_E/kappa_F>0). The pinned real class-number formula supplies the residue value, but the comparison with complex continuation is a separate analytic adapter. Fixed-degree Brauer–Siegel, bounded roots of unity and that residue formula give (D_K^{-epsilon}llkappa_Kll D_K^epsilon), with constants uniform in bounded degree and possibly ineffective. Since (D_Fle D^{1/2}), allocate each residue exponent at most (2epsilon/3) to obtain (D^{-epsilon}ll L_f(1,eta)ll D^epsilon). The fixed-degree statement does not impose normality over (mathbf Q).
4. **A uniform Cauchy contour.** Thorner–Zaman Lemma 2.3 has an explicit conductor factor (Q^{(1+r-sigma)/2}), a factor (zeta_{mathbf Q}(1+r)^g), and constants uniform in the field. For (r=min(epsilon,1/4)), the circle (|s-1|=r) lies inside its strip, has (|Im s|le r), and its exponent is at most (r). Entirety of (L_f), followed by Cauchy, gives
   [
   |L_f'(1,eta)|le r^{-1}sup_{|s-1|=r}|L_f(s,eta)|ll_{g,r} Q^rll D^epsilon.
   ]
   A zero on or inside this circle is harmless: apply Cauchy to (L_f), not to its logarithm. No uniform zero-free disk or general Artin holomorphy is assumed. Divide by the value bound, giving each factor exponent (epsilon/2), to bound (|L_f'/L_f(1,eta)|ll D^epsilon).
5. **The gamma constants and the average.** Write (ell_j=L_f'(j,eta)/L_f(j,eta)). Nonvanishing at zero follows from the completion and nonvanishing at one. The identities (psi(1/2)=-gamma-2log2), (psi(1)=-gamma) give
   [
   ell_0+ell_1=-log Q+g(gamma+log(2pi)).
   ]
   Yuan–Zhang Theorem 1.1 states (operatorname{avg}h_{
m YZ}=-ell_0/2-log Q/4). Thus the exact comparison of the two displayed source conventions is
   [
   operatorname{avg}h_{
m T}
    =rac14log Q+rac12ell_1-rac g2gamma-glog(2pi).
   ]
   This average is subpolynomial in (D). The deep averaged theorem and its erratum remain imports through #1143/#1145.
6. **Individual heights and exponents.** If every height is at least the real Bost constant (c_g), then
   [
   h_{
m T}(E,Phi)le 2^goperatorname{avg}h_{
m T}-(2^g-1)c_gll_{g,epsilon}D^epsilon.
   ]
   All (2^g) types, including imprimitive types, occur in the average. Primitivity is used later for ideal-isogeny and endomorphism arguments, not for this height deduction. The new exponent-budget node also makes explicit why any (delta<1/(4kappa_g)) is compatible with the distant-isogeny exponent and the Masser–Wüstholz exponent (kappa_g).

The near-linear ideal count also has explicit proof nodes now. The local norm-counting Euler factor is coefficientwise bounded by ((1-T)^{-n}), where (n=[K:mathbf Q]); hence the norm-(m) coefficient is bounded by the fixed-order divisor function (d_n(m)). For large primes use (inom{a+n-1}{n-1}le n^ale p^{epsilon a}); at the finitely many smaller primes a polynomial divided by an exponential has finite supremum. This gives a constant independent of K and m, then summation gives (O_{n,epsilon}(X^{1+epsilon})). It remains an implementation/source obligation, not an assertion that the pinned quadratic-count theorem already proves the sharper bound.

The retained general-Artin branch still requires its own induction/pole-cancellation and conductor estimates. None is inferred merely because the quadratic deduction works.

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

The numerical degree convention is also unresolved: the inspected 2013 text gives `4g` for entries in the simple-case construction, whereas the 2014 Lemma 7.4 uses `2g`. The consumer only needs a bound depending on g. Keep that sufficient statement, distinguish coordinatewise from joint-field degree, and explicitly pass from complex entries to real/imaginary coordinates before bounded-degree counting. Do not manufacture an exact `2g` field-degree theorem.

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

This checks the restricted implication and §13 proof, not the whole Gao paper. The mixed foundational constructions and their owner remain open extraction work. The statement has not been broadened to all mixed Shimura varieties.

## 7. Proposed quantitative extensions and remaining mixed routing

The machine-readable routes contain the complete design briefs, imports, exact targets, mandatory examples and suggested future Lean paths.

**ComplexMultiplicationAndExplicitReciprocityPartII — CM heights and Galois-orbit bounds.** This extends CM.0/CM.2 with quantitative CM-height, distant-isogeny, moduli-degree, general-centre-order orbit and lift-height layers. It imports general CM reciprocity from V5, geometric carriers from A3/A6, moduli descent from M6, stable heights/Bost from R35, uniform estimates from AN and quantitative isogenies from the separate Part II. It consumes the averaged-Colmez theorem through its existing paper jobs. General ideal classification and the polarized reciprocity dictionary stay source-routed to CM.0/CM.2; they are not reimplemented in the extension. Targets retain primitive/maximal-order hypotheses where required, all smaller simple dimensions in the general reduction, and coordinatewise height/degree conventions.

**FaltingsFinitenessAndIsogenyTheoremsPartII — Quantitative isogeny estimates.** Prove the dimension-uniform polynomial bound for minimum geometric degree in `max(1,h_F(A),[k:Q])`. The common field must define both varieties. Polarization removal, field-degree dependence and the geometric-versus-rational distinction must be proved from the full Masser–Wüstholz source. The existing accepted R28 decomposition supplies qualitative ingredients but does not supply this estimate.

**Uniform analytic work refines AN.0/AN.4/AN.5.** It does not need a second Hecke carrier or another analytic roadmap. General continuation and the completed equation are source-routed to AL.1; the quadratic character imports GlobalNumberFields layers 9–10. The height metric adapter belongs to R35.1/R35.3. The current AN source decomposition is reused, including its explicit distinction between Artin continuation and the holomorphy conjecture.

The four mixed-Shimura items remain unrouted. The Gao §13 implication is preserved, but its earlier mixed Ax–Lindemann, quotient and foundation proofs need extraction and a full owner decision. They cannot be assigned to a pure CM extension by analogy. This is one reason the result stays partial even though the new arithmetic routes are concrete.

## 8. Regression obligations

The JSON now records three discriminating tests for every definition/construction (69 total) together with its planning API. These are proposed blueprint tests, not executed Lean tests. Include: a non-Galois CM field in the regulator comparison; a product with repeated isomorphic CM fields but inequivalent types; a nonmaximal centre order and its squared index; fixed-field versus bounded-degree Northcott; the existing quadratic versus required near-linear ideal count; a coarse moduli point without a chosen model; dual 3-torsion without silently dropping mu_3; a negative stable height; the trivial Artin pole; a weakly special fibre with nonspecial fixed parameter; Galois transport of the conjugate supplied by counting; the whole-fibre condition in the parameter locus; and a mixed special point whose pure projection alone does not control its denominator.

## 9. Validation and resumption

Run the repository paper validator and deliverable-path checker against all three deliverables. Additional checks preserve all 84 earlier IDs, resolve the dependency graph, reject cycles and duplicate missing-item routes, check each planned stage and new parent/area, and require an API with at least three tests for all 23 definitions/constructions. Four deliberately unrouted mixed nodes are counted explicitly; complete status must fail until they are resolved. Mathematical regression calculations check the local Euler coefficient majorant, contour exponent allocation, metric sign and height-average algebra; they are sanity checks, not analytic proofs.

No Lean file is required for this paper intake, and no Lean compilation was run. The handoff lists the remaining original-proof, polarized-reciprocity, source-edition and mixed-owner work. The exact validator and regression results are recorded in the JSON and handoff after execution. Keep `partial` until the remaining source and routing obligations are met.
