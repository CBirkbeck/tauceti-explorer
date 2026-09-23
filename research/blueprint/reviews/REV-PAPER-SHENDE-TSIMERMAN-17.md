# Independent review of Shende–Tsimerman

Codex, session `codex-7e92bd`, 23 September 2026. Refs [#1335](https://github.com/CBirkbeck/tauceti-explorer/issues/1335). **Verdict: revise.** The review is complete; the extraction is **partial**. Eight routes are accepted and six rejected. The reviewer did not author the extraction or its preceding checkpoints.

The 144 input items were checked against their source locators and their status evidence. One previously conflated endpoint is separated, giving **145 items: 13 library, 23 planned and 109 missing**, with every missing item routed once. All 24 input source findings were checked: E8 is rejected, the other 23 are confirmed within the qualifications below, and new E25 is confirmed. The resulting register has 25 entries, 24 confirmed. Confirmation concerns the **40-page arXiv v1**, not the unmatched 44-page Duke version of record. A gap in an argument does not establish that its theorem is false.

## Reading and version boundary

The primary preprint was read in full, including Appendix A and the bibliography. The dimension expression in E25 was also inspected in the rendered page 12. Fresh public searches checked the arXiv history, DOI/title correction searches, Crossref metadata, the canonical publisher download and both author pages. The arXiv history has only v1. No correction was identified in those searches. The publisher download again returned HTML (1161 bytes), so the journal text was neither acquired nor matched. This is an explicit G0 boundary, not evidence that the preprint mistakes survive in print.

Shende's author notes confirm the inverse-automorphism and parity conventions but are not an erratum or a substitute proof of the theta-intersection estimates. The original Massey, Bressler–Brylinski/Borho–MacPherson, Fulton, Macdonald/ACGH and general descent/trace/weight supplier proofs remain incompletely acquired. The bibliography lists them as obligations; neither a citation nor an atlas layer proves them.

## Mathematical corrections

### The one-bundle theorem holds for every fixed prime power

E8 is rejected. Here is an independent argument for the needed analytic inputs, avoiding a silent transfer from the prime-restricted metaplectic setting of Altuğ–Tsimerman.

Let C/F_q have genus g tending to infinity and an F_q-map to P¹ of degree r=o(g); hyperelliptic curves have r=2. For each fixed m,

    #C(F_(q^m)) ≤ r(q^m+1) = o(g).

Write the normalized Weil roots as z_j on the unit circle, using the imported all-extension Weil theorem. The trace formula gives

    (1/(2g)) Σ_j z_j^m = (q^m+1−#C(F_(q^m)))/(2g q^(m/2)) → 0.

Negative moments are conjugates. Trigonometric approximation therefore gives weak convergence of the empirical measures to Haar measure on the circle for every q>1. The function log|1−q^(−1/2)z| is continuous and has Haar integral zero. The Jacobian/zeta comparison and functional equation then imply

    log P_C(q^(−1)) = o(g),   #J(F_q) = q^(g+o(g)).

Both upper and lower normalization bounds follow; a one-sided Lindelöf bound would not suffice for division by #J.

For the critical-circle upper bound, set F_M(w,z)=max(log|1−wz|,−M), continuously extended at wz=1. For each fixed M its rotations form a compact equicontinuous subset of C(S¹), so weak convergence of the measures is uniform over w. The Haar integral is independent of w and decreases to zero as M→∞. Since log|1−wz|≤F_M(w,z), first taking g→∞ and then M→∞ gives

    max_(|t|=q^(−1/2)) |P_C(t)| ≤ exp(o(g)) = q^o(g).

The coefficient contour contributes q^(n/2), not q^(ng/2), yielding E10's corrected q^(n/2+εg). Summing the reduced-divisor coefficients in the fixed-tail range gives a geometric error O_ε(q^((g−a)/2+εg)). After division by #J, it is q^(−g/2+o(g)) up to fixed a,q factors. The residue term tends to q^(−a); the omitted geometric tail is O(q^(−g)). The exact N1–N5 finite Picard comparison and tail bijection then yield the one-bundle law, without a rational point hypothesis. These tails give the point masses and tightness. The independent geometric estimate still needs q>16 (E11); it does not restrict the analytic theorem.

The all-extension curve bound, Jacobian zeta comparison and coherent descent used here remain explicit upstream mathematical suppliers. The analytic argument closes that deduction, not every supplier proof or its formalization.

### Corrected critical-locus argument and new E25

The false septuple rank expression (E6) can be avoided. Let U=D1∨D2, and R=R1+R2+R∩ in the canonical decomposition. On a nonramified involution orbit, write U's two coefficients as u,v. Its contribution to deg(U_h)/2+deg(U_r) is max(u,v). Remove the hyperelliptic pairs from each D_i, then the opposite residual pairs S and τS. The remaining R occupies at most one side of the orbit and its coefficient is at most max(u,v). At a ramification point, U's contribution is ceil(u/2), which bounds the remaining R coefficient (zero or one). Adding over orbits gives

    deg R ≤ deg(U_h)/2 + deg(U_r).

At a critical point, the union-divisor rank formula makes the right side <g. Thus deg R≤g−1 and

    deg(R1+R2+2R∩) ≤ 2 deg R ≤ 2g−2.

There are finitely many degree/overlap strata. On each, the corrected weighted-Abel finiteness argument applies in characteristic zero or p>2g−2: all positive total weights are at most 2g−2 and hence nonzero in the field. This justifies finitely many residual choices. The char-5 degree-six family disproves unrestricted weighted finiteness; it is **not** a direct counterexample to a genus-two residual degree bound of two.

For fixed residual data and degrees, H∩,H1,H2 vary in symmetric powers of P¹, while S varies in a symmetric power of C. Therefore the dimension is at most

    (deg H∩+deg H1+deg H2)/2 + deg S
      ≤ deg H∩ + (deg H1+deg H2)/2 + deg S = m ≤ e(L).

The source divides deg S by two as well. This is new **E25**, a checked misprint affecting the proof. For D1=p,D2=τp with p varying away from ramification, L=κ and a=b=g−1, all H and R pieces vanish and S=p. The family has dimension one, while the printed expression is one half. The intended upper bound still holds.

Call this a critical-locus estimate until expected dimension has been established. If a fiber component had dimension greater than n=g−a−b, it would lie in the critical locus, contradicting dimension≤e(L)≤n. The theta-intersection dimension then follows from the Abel model. This repair carries the characteristic restriction into the lci, low-cohomology and perverse-middle items as well as the previously restricted high-cohomology items. It does not settle fixed small characteristic as g tends to infinity.

For E6 specifically, the regression D1=p,D2=2p requires **a ramification point p**: U=2p has rank one whereas the printed septuple expression gives two. The old report's unqualified point should not be read as a generic nonramified point.

### Polar accounting is conditional on cycle geometry

Multiplication by two acts on H_(2u)(J) by 4^u. Its pullback on a codimension-c class acts by 4^c. These independently verify the factor errors E15 and E23. They do not by themselves prove an equality between the reduced incidence image and a cycle pushforward. The latter contains generic mapping degrees. The corrected item defines the effective pushforward Z and calculates its class; a reduced-image inequality needs a generically finite comparison, while equality needs degree one. No counterexample to degree one is claimed.

In the formula for c_(k,r,s), each term is

    multinomial(k;a,b,g−1−r−s) 2^(a+b) 4^(s−b)
      × binom(r+s−a−b,r−a).

There are at most g+1 terms. The multinomial is at most 3^k, the binomial at most 2^(r+s−a−b), and the remaining power is at most 2^(r+3s). This already gives a coarse (g+1)24^g estimate in the stated range, so the retained (g+1)48^g envelope is safe without optimizing it. Together with 4^(g−k−1) and binom(g,k+1)≤2^g, it gives the candidate (g+1)384^g polar bound **if** the image comparison, isolated intersection and nonnegative intersection contributions hold. The finite lifting correction in E17 and the precise Fulton hypotheses remain obligations.

Consequently the candidate O_ε((3840+ε)^g) total-Betti accounting is explicitly conditional, not a newly established theorem. E15/E23 are narrowed to failures of the printed calculation; the review does not infer that the printed numerical bound is false. E18 also distinguishes an O_ε((N+ε)^g) estimate from a literal base-N inequality.

The introductory Conjecture 1.4/Theorem 1.5 concerns all translates, with fixed c,d and sufficiently large genus. Section 3.2 restricts to e(L)≤g−a−b. The restricted result alone does not prove the full introductory claim. The added item `complex-betti-unrestricted-source` and G10 preserve that endpoint and require its reduction; this unresolved scope issue is not registered as another confirmed source mistake.

### Cohomological shifts, arithmetic ratios and later work

For E22, with Q[n]→IC and perverse kernel supported in dimension≤e, the long exact sequence compares H^(n+k) with IH^k outside k∈[−e−1,e]. Duality needs k and −k outside that interval, so the proof gives the sufficient high range i>n+e+1. The omitted boundary has not been disproved. Theta membership is now typed inside Pic^(2g−a−b) using the appropriate κ shift; the introductory r parity is retained.

The joint statements now use m([M]), the least effective degree modulo κ. An arbitrary-degree bundle cannot literally belong to a theta locus of a different degree. For a fixed compatible tail pair, choose its unique representative in Pic^(2g−a−b). B(N), the finite-field high comparison and the small-ratio dynamics transfer remain hypotheses where the sources have not supplied their proofs.

EMV §10.3 was freshly read. It treats a fixed split prime in a number-field setting and an ideal norm restriction. The ST use of a function-field split place whose degree grows with g still needs uniform dynamics and constants. This confirms the transfer gap E21, not falsity of the desired mixing theorem.

All 24 pages of Sawin arXiv v2 were freshly read. The general characteristic-p polar-stalk theorem has its own nearby/vanishing-cycle proof and is a relevant separately sourced continuation. The application theorem is stated in odd characteristic, still consumes ST cohomological comparisons, and its Lemma 5.5 repeats the ST polar coefficient. The parity display also needs reconciliation. Appendix A supplies a multiplicity bound, not the small-ratio transfer. Thus G6 is restored as later verification, not discarded because the original 2017 paper could not cite it; the numerical 28⁴ endpoint is not used uncritically.

## Ownership and status audit

The pinned libraries were clean at the stated commits. Every one of the 22 cited declarations was opened with its statement and relevant ambient hypotheses. The 13 `library` items are narrow algebra/divisor/cardinality interfaces; none is promoted to a geometric Abel, theta, IC or counting-limit theorem. In particular, `Projectivization.card` is the cardinality identity from which the finite-dimensional formula follows; `Divisor.dim` is the Riemann–Roch definition, not an unrelated abelian-variety dimension; and the norm citation is the finite-field theorem, not a free-group short-name collision. The divisor/sheaf adapter retains its integral/Noetherian/codimension-one hypotheses.

All 23 planned items were checked against their named stage descriptions and the relevant reviewed coverage rows. AC.12 is now an explicit import alongside AC.10. Upstream Jacobian A–F, GS.0/1, ST.0/5, EDC.5/7, LPV.2, SF.5, WC.1/2/5, DWP.7 and AA.0/1/2 were read. RG2.0a is the existing proposed owner for scheme Weil restriction; it has no reviewed coverage row, so no implementation inference is made. WC.1 consumes the shared `UPSTREAM:CohomologicalPointCounting:TraceFormula` supplier.

Each missing item received its own exact-name-plus-family search in both pinned source trees and the current atlas snapshot, excluding this extraction as evidence for itself. The JSON audit records each query, hit counts, library files, semantic result and unique route. Searches are evidence of what was found in these snapshots, not proofs of universal absence. Generic divisor/Abel class, finite norm, finite fiber and coherent descent infrastructure is imported at its existing owner; the hyperelliptic geometry and microlocal estimates are not present as library theorems.

Collision checks found that Yang–Zhao explicitly extends this pending microlocal Part II; Abe relative traces imports the generic cycle theory and has a different trace owner. Lawrence–Sawin convolution consumes characteristic-cycle criteria and should also import the same generic owner. Fu's Ore microlocalization and Nelson–Venkatesh's Lie-group microlocal analysis are different constructions; Massey-product search hits are unrelated. No parallel characteristic-cycle foundation is proposed. The Hecke mixing item moves from the finite-measure stage ST.0 to the limiting-statistics stage ST.5.

## Validation and remaining work

The two inherited scripts were extracted from the report after inspection and rerun. The finite Picard script passed 141,022 checks, including F3/F9/F27 point counts 0/14/48 and class number four. The weighted-Abel script passed the exact F5 polynomial norm/residual identities, 15,000 F125 identities, 120 eligible divisors among 126 curve points and the overlap-weight regression. An independent script passed 49,956 bounded orbit/rank, dimension and coefficient checks. These are discriminating regressions, not replacements for the general arguments above or proofs of scheme descent.

The independent regression is included below for reproduction. No Lean deliverable was requested, written or compiled. Schema and four-path intake validation are recorded in the JSON audit. G0–G10 identify what a continuation must acquire or prove. Original generic supplier proofs and version matching remain genuine research work; the extraction cannot be called complete merely because those tasks have been moved into a brief.

## Source manifest

| Source | Fresh reading | SHA-256 |
| --- | --- | --- |
| [arxiv](https://arxiv.org/pdf/1307.8237) | All 40 pages, including Appendix and references; p.12 rendered page inspected. | 542a52a2a04b65901a6d753266ef5f44aa73a8bde4dfdf7935ae27d489a5cf29 |
| [migliorini-shende](https://content.algebraicgeometry.nl/2018-1/2018-1-004.pdf) | pp.1–13 through the proof of Theorem 3.4; not §4 applications. | 8ecdf3b986963efb1edb7ed897cd1d0cc02c94ddc47005bc289029665fbc9fd9 |
| [altug-tsimerman](https://arxiv.org/pdf/1008.0430) | pp.1–5 and32–35; §3 Theorems3.1/3.3 and proofs. | d4092a754d07a2d938cea2f151540397b7f8f346faa88599a9e450a99b28a784 |
| [inoue-yamazaki](https://arxiv.org/pdf/math-ph/0501048) | pp.3–7; §2 through Theorem2.9 and start of§2.6. | 3f7e9000a39e9de34d572f88ae40ee864122a595a869970fae1360553735477d |
| [sawin](https://arxiv.org/pdf/1907.04850) | All24 pages of arXiv v2, including§§4–5 and AppendixA. Final journal version not matched. | 8b0a79ba9fb2ae26ff518908033661c669b47a81a16da3af11bb748d4b399b0d |
| [author-notes](https://drive.google.com/uc?export=download&id=1BDUIaZNXDxsirg96KnrFen-YFqRo2Fd_) | All9 pages of author-hosted notes. | eb11b009d09d9cb0bc701880135ecb9687308e1939c64b7f9f9876dc9576c114 |
| [milne-jacobian-2021](https://www.jmilne.org/math/xnotes/JVs.pdf) | §1 pp.2–5 and§11 pp.35–37. | 36c3f09c7462dbbd4ae1f8b81a02bd9ff84f03c5a346351d7d5d78fc3f173486 |
| [emv](https://math.stanford.edu/~akshay/research/gg.pdf) | pp.43–47: §9.4 and§§10.1–10.7. Not the full53-page article. | dac86438cf0bda88f757fbea013766b488409220875d0409922fc0a4c8260f4d |

## Exact library citations

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. File SHA-256 values are in the result audit.

| Item | Declaration | Pinned file:line |
| --- | --- | --- |
| rr-space | tauceti:TauCeti.riemannRochSpace | TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean:83 |
| rr-space | tauceti:TauCeti.Divisor.dim | TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean:95 |
| degree-class | tauceti:TauCeti.Divisor.degreeClass | TauCeti/FieldTheory/FunctionField/Divisor/ProductFormula.lean:263 |
| degree-class | tauceti:TauCeti.Divisor.degreeClass_divisorClass | TauCeti/FieldTheory/FunctionField/Divisor/ProductFormula.lean:270 |
| class-finite | tauceti:TauCeti.Divisor.finite_ker_degreeClass | TauCeti/FieldTheory/FunctionField/RiemannRoch/ClassNumber.lean:143 |
| projective-card | mathlib:Projectivization.card | Mathlib/LinearAlgebra/Projectivization/Cardinality.lean:65 |
| gl-card | mathlib:Matrix.card_GL_field | Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:99 |
| frobenius-power-library | mathlib:add_pow_char_pow | Mathlib/Algebra/CharP/Lemmas.lean:177 |
| frobenius-power-library | mathlib:sub_pow_char_pow | Mathlib/Algebra/CharP/Lemmas.lean:263 |
| principal-witness-library | tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.linearlyEquivalent_iff_exists_principalDivisor | TauCeti/AlgebraicGeometry/WeilDivisor/Principal/Basic.lean:149 |
| principal-witness-library | tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.coeff_principalDivisor | TauCeti/AlgebraicGeometry/WeilDivisor/Principal/Basic.lean:87 |
| abel-class-additivity-library | tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.weightedAbelJacobiDivisorClass_add | TauCeti/AlgebraicGeometry/WeilDivisor/AbelJacobi/Sum/Basic.lean:92 |
| abel-class-additivity-library | tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.weightedAbelJacobiDivisorClass_zsmul | TauCeti/AlgebraicGeometry/WeilDivisor/AbelJacobi/Sum/Basic.lean:102 |
| abel-class-additivity-library | tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.weightedAbelJacobiDivisorClass_eq_iff_linearlyEquivalent_of_weightedDegree_eq | TauCeti/AlgebraicGeometry/WeilDivisor/AbelJacobi/Sum/Basic.lean:164 |
| divisor-sheaf-equivalence-library | tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.nonempty_iso_sheaf_of_linearlyEquivalent | TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean:544 |
| finite-norm-library | mathlib:FiniteField.unitsMap_norm_surjective | Mathlib/FieldTheory/Finite/GaloisField.lean:236 |
| finite-norm-library | mathlib:FiniteField.algebraMap_norm_eq_pow | Mathlib/FieldTheory/Finite/GaloisField.lean:224 |
| finite-norm-library | mathlib:FiniteField.norm_surjective | Mathlib/FieldTheory/Finite/GaloisField.lean:251 |
| degree-fiber-equivalence-library | mathlib:AddMonoidHom.fiberEquivKer | Mathlib/GroupTheory/Coset/Basic.lean:474 |
| degree-fiber-equivalence-library | mathlib:AddMonoidHom.fiberEquivKerOfSurjective | Mathlib/GroupTheory/Coset/Basic.lean:493 |
| finite-degree-fibers-library | tauceti:TauCeti.Divisor.finite_preimage_degreeClass_singleton | TauCeti/FieldTheory/FunctionField/RiemannRoch/ClassNumber.lean:178 |
| effective-degree-one-library | tauceti:TauCeti.Divisor.exists_eq_ofPoint_of_degree_eq_one | TauCeti/FieldTheory/FunctionField/Divisor/Basic.lean:209 |

## Route decisions

| Route | Verdict | Reason |
| --- | --- | --- |
| 1 | reject | GS.0 is the correct owner, but the original P1 splitting supplier and ramified integral-model/adelic measure comparison remain unclosed (G1/G8). Correcting the unit carrier does not complete the exported dictionary. |
| 2 | accept | Bounded PGL2 Hecke modification instance fits the read GS.1 description; import its stack/Grassmannian infrastructure. This acceptance does not certify spectral mixing. |
| 3 | reject | ST.0 owns finite weighted measures and the N1–N5 arithmetic is supported, but the route as a whole still exports the unclosed bundle/adelic measure identification. The Hecke limiting theorem has been moved to ST.5. |
| 4 | reject | ST.5 owns these limits and the one-bundle all-q argument is supported. The combined route still needs the varying-place Linnik transfer, Hecke spectral input and fixed-characteristic high comparison; they must remain hypotheses (G2/G7). |
| 5 | accept | The rational middle-perverse and IC definitions are explicitly planned by EDC.5; no second perverse category is introduced. |
| 6 | accept | EDC.7 explicitly owns pure decomposition and relative hard Lefschetz. Retain geometric base change, projectivity, purity and twists; the semismall bridge is an application of that owner, not automatic arithmetic splitting. |
| 7 | accept | LPV.2 already plans ordinary quadratic singularities and the vanishing module with characteristic and orientation conventions. The source supplies a hyperelliptic application. |
| 8 | reject | SF.5 owns Chow and intersection operations, but the route includes the exact positivity needed to dominate local polar multiplicity. Fulton 12.2/12.4 and its hypotheses were not acquired, so this numerical supplier is not ready (G5/G9). |
| 9 | accept | WC.1/WC.2 are the read zeta/functional-equation consumers, with the class-number evaluation explicitly required as the curve/Jacobian comparison. Reuse the shared point-counting trace supplier. |
| 10 | accept | WC.5 explicitly owns the all-extension curve bound and b1=2g interface used in the elementary point-count argument; genus-one library results do not replace it. |
| 11 | accept | DWP.7 is the exact upper-weight owner. Singular proper theta loci require compact-support upper bounds, not unsupported smooth purity. |
| 12 | accept | AA.0–AA.2 own adelic topology and measures. The corrected route imports the scheme Weil restriction and quadratic torus from RG2.0a, avoiding duplicate construction; the ramified global dictionary is held in route 1. |
| 13 | reject | The upstream Jacobian extension is the correct owner, but G4/G5/G9/G10 block its current endpoints: original IC/cohomology suppliers, polar image degrees and isolated intersections, and the full-versus-restricted complex bound. The revised brief records conditional numerical accounting and the corrected characteristic range. |
| 14 | reject | The shared microlocal Part II is architecturally justified and reused by Yang–Zhao/Abe/Lawrence–Sawin. MS general proofs and Sawin v2 were read, but original Massey and local Euler-obstruction suppliers/version conventions remain unclosed. A numerical application cannot replace those generic interfaces. |

## Independent source-finding decisions

Every row refers to arXiv v1. The final journal version and priority of any new finding remain unknown.

| Finding | Verdict | Check |
| --- | --- | --- |
| E1 | confirmed | At v1 p.7 the tangent direction is scaled by the weight. A weight divisible by p gives zero differential even when the unweighted Abel tangent is injective. The corrected total-weight statement is necessary. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E2 | confirmed | The char-5 norm identity and its 5P+Q family were checked symbolically and on F125. Infinitely many distinct divisors over the algebraic closure lie in one weighted fiber. This refutes unrestricted Corollary 2.4; it is not a direct counterexample to the bounded weights in Corollary 2.20. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E3 | confirmed | The canonical linear series of a hyperelliptic genus-g curve is π*O(g−1), degree 2g−2; π*O(g) has degree 2g. Checked at p.8. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E4 | confirmed | For d=g, Θ_g=J is smooth, so its Nash blowup is J; the Abel map C^(g)→J has positive-dimensional special fibers. The d<g range used in the proof must be retained. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E5 | confirmed | The dual restriction map in Proposition 2.16 is controlled by the union/max divisor. The intersection in the explanatory sentence contradicts the preceding displayed equality. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E6 | confirmed | At a ramification point p take D1=p,D2=2p. The union is 2p, a hyperelliptic fiber, so its Abel rank is 1; the printed septuple expression gives 2 (for g≥2). The point must be ramified for this test. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E7 | confirmed | A degree-g line bundle outside κΘ_(g−2) has e=0, contradicting the printed large lower bound. Riemann–Roch gives floor((d−g)/2)≤e≤floor(d/2), including negative twists. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E8 | rejected | Rejected as a mathematical gap: the fixed-moment and truncated-log argument in the review proves the analytic inputs for every fixed prime power q. The first proof of Theorem 4.2 then proves the all-q Theorem 1.1. The restricted heading is not a counterexample, and the separate geometric threshold issue is E11. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E9 | confirmed | The finite F5 pointless hyperelliptic example was rechecked, so even q>4 does not imply an Fq point. Consecutive extension degrees supply index one, and cyclic scalar descent supplies the rational degree-one class needed instead. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E10 | confirmed | On \|z\|=q^(−1/2), coefficient extraction contributes \|z\|^(−n)=q^(n/2), multiplied by the Lindelöf q^(εg), not q^((n/2+ε)g). Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E11 | confirmed | The geometric O(4^g) Betti estimate produces normalized error 4^g q^(−g/2) up to fixed factors; decay requires q>16. This concerns that argument, not the all-q analytic theorem. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E12 | confirmed | N3–N5 give #Q_C=2#J and one parity component of size #J. The exact joint-tail bijection counts X(Fq) inside that finite set. The printed raw point count is not a probability. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E13 | confirmed | For Q_C[1] on a smooth complex curve, the Euler-stalk coefficient is −1 while the appropriate polar multiplicity is +1. The unsiged n_α RHS is negative. MS Corollaries 2.16–2.18 confirm the signed Euler-obstruction/characteristic-cycle convention. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E14 | confirmed | The Abel projective-fiber decomposition lowers theta degrees by 2l, hence raises the a,b indices in A_(a,b). Inclusion–exclusion has a Lefschetz factor on each middle summand. At Euler specialization L=1 the later formula (3) survives. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E15 | confirmed | On H_(2u)(J), multiplication-by-2 pushforward is 2^(2u)=4^u. The polynomial coefficient of the incidence pushforward changes accordingly. This disproves that calculation, not the optimality or falsity of the printed global bound; generic image degrees remain unverified. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E16 | confirmed | The proof uses an annihilator not contained in B. Literal containment in the statement has the wrong type/direction. Checked statement and proof on pp.26–27. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E17 | confirmed | A proper surjection does not give a section of a normalized curve. A component dominating the curve and a finite base change provide the required lift. In characteristic zero separability preserves the nonzero generic derivative, but local isolatedness still requires the subsequent argument. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E18 | confirmed | An O_ε((960+ε)^g) estimate never establishes a literal base 960 bound. Corrected factors yield only candidate larger-base accounting until G5 is closed. The review does not assert that 960 is false or that 3840 is an established replacement theorem. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E19 | confirmed | For a ramified quadratic local extension, its multiplicative quotient modulo base scalars is compact, whereas the image of units has index two. A uniformizer maps to [[0,π],[1,0]] of odd determinant valuation. Replacing maximal compact by integral units repairs the carrier, but not by itself the global measure comparison. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E20 | confirmed | Restriction of scalars of G_m acts on the two-dimensional base vector space. After quotienting scalar G_m this gives PGL2, not a canonical GL2 homomorphism of the quotient torus. The intended construction is recovered by keeping the prequotient. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E21 | confirmed | Fresh EMV §10.3 reading gives a number-field statement with fixed split prime 5 and a primitive ideal norm restriction. ST instead varies a function-field split place of degree O(log g); the uniform dynamics and constants are not supplied. Sawin Appendix A is a multiplicity result, not this transfer proof. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E22 | confirmed | With Q[n]→IC and perverse kernel F supported in dimension≤e, the long exact sequence gives comparison at k outside [−e−1,e]. For duality both k and −k must be outside, yielding the sufficient high range i>n+e+1. H^(n+k), not H^(k−n), is the correctly shifted ordinary group. No failure at the omitted boundary is claimed. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E23 | confirmed | The full multiplication-by-2 preimage of Θ_(k+1) has codimension g−k−1 and class 4^(g−k−1)[Θ_(k+1)]. The printed 2^g factor and mismatched subscript fail. The resulting (g+1)384^g bound is conditional on geometric intersection and image-degree hypotheses, not established by arithmetic alone. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E24 | confirmed | The residual-rank repair in the review yields deg(R1+R2+2R∩)≤2g−2 at a critical point. Thus the corrected weighted-fiber proof works in characteristic zero or p>2g−2. Small characteristic requires an independent argument; the char-5 degree-six family is not itself a counterexample to this bounded residual statement. Verified in arXiv v1 only; the final Duke text remains unmatched. |
| E25 | confirmed | The formula was read from the rendered PDF page as well as the text. The explicit conjugate-pair family disproves the halved S dimension; the corrected parameter count retains the intended upper bound. |

## Item-by-item ledger

The input has 144 items; the last row separates the unrestricted introductory endpoint. An unchanged statement is not a claim that its supplier proof is closed. The JSON includes every missing-item query and every planned/library citation; the route table identifies the unresolved obligations.

| Item | Source locator | Status / route | Review action |
| --- | --- | --- | --- |
| hyperelliptic | §1; §2.2 | planned | corrected planned |
| rr-space | §2 divisor calculations | library | statement and locator retained; source and status evidence checked |
| degree-class | §4 Picard counting | library | statement and locator retained; source and status evidence checked |
| class-finite | §4 finiteness input | library | statement and locator retained; source and status evidence checked |
| projective-card | §4 Abel-fiber counting | library | statement and locator retained; source and status evidence checked |
| gl-card | §1 inverse automorphism weights | library | statement and locator retained; source and status evidence checked |
| picard | §2.1 | planned | statement and locator retained; source and status evidence checked |
| symmetric-power | §2.1 | planned | statement and locator retained; source and status evidence checked |
| coherent-rr | §2.2; Lemma 4.1 | planned | statement and locator retained; source and status evidence checked |
| bun-pgl | §1; Appendix A.1 | planned / 1 | statement and locator retained; source and status evidence checked |
| splitting | §1 p.2; Lemma 4.1 | missing / 1 | statement and locator retained; source and status evidence checked |
| automorphism | §1 p.2 | missing / 1 | statement and locator retained; source and status evidence checked |
| natural-measure | §1 p.2 | planned / 3 | statement and locator retained; source and status evidence checked |
| tail-mass | §1 p.2 | missing / 3 | statement and locator retained; source and status evidence checked |
| pic-quotient | §1; §4.1 | missing / 3 | statement and locator retained; source and status evidence checked |
| degree-one | Theorem 4.2 proof, repaired supplier | missing / 13 | statement and locator retained; source and status evidence checked |
| joint-measure | Conjecture 1.2; Theorem 4.4 | missing / 3 | statement and locator retained; source and status evidence checked |
| main-single-source | Theorem 1.1, p. 3; Theorem 4.2, first proof, pp. 30–31 | missing / 4 | statement and locator retained; source and status evidence checked |
| main-joint-source | Theorem 4.4, Case 2, pp. 34–35 | missing / 4 | corrected note, statement |
| main-hecke-source | Conjecture 1.2 and Theorem 4.4, second alternative, pp. 5, 33 | missing / 4 | statement and locator retained; source and status evidence checked |
| theta | §2.1; §3 | missing / 13 | statement and locator retained; source and status evidence checked |
| abel-tangent | Lemma 2.1 | missing / 13 | statement and locator retained; source and status evidence checked |
| abel-sum-tangent | Corollary 2.2 | missing / 13 | statement and locator retained; source and status evidence checked |
| weighted-abel | Proposition 2.3, corrected hypothesis | missing / 13 | statement and locator retained; source and status evidence checked |
| weighted-fibers | Corollary 2.4, restricted branch | missing / 13 | statement and locator retained; source and status evidence checked |
| hyperell-reduction | Notation 2.5–2.6 | missing / 13 | statement and locator retained; source and status evidence checked |
| hyperell-sections | Lemma 2.7 | missing / 13 | statement and locator retained; source and status evidence checked |
| canonical-bundle | Lemma 2.7 | missing / 13 | statement and locator retained; source and status evidence checked |
| canonical-involution | Corollary 2.8 | missing / 13 | statement and locator retained; source and status evidence checked |
| canonical-map | Corollary 2.9 | missing / 13 | statement and locator retained; source and status evidence checked |
| gauss | Corollary 2.10 | missing / 13 | statement and locator retained; source and status evidence checked |
| gauss-embedding | Lemma 2.11 | missing / 13 | statement and locator retained; source and status evidence checked |
| canonical-span | Corollary 2.12 | missing / 13 | statement and locator retained; source and status evidence checked |
| special-divisor | Lemma 2.13 | missing / 13 | statement and locator retained; source and status evidence checked |
| linear-system | Lemma 2.13 | missing / 13 | statement and locator retained; source and status evidence checked |
| nash | Notation 2.14 | missing / 14 | statement and locator retained; source and status evidence checked |
| nash-theta | Proposition 2.15, restricted degree | missing / 13 | statement and locator retained; source and status evidence checked |
| sum-map | §2.3; §3.1 | missing / 13 | statement and locator retained; source and status evidence checked |
| sum-rank | Proposition 2.16; corrected Corollary 2.18 (E6) | missing / 13 | corrected note |
| canonical-septuple | Definition 2.17, PDF p.12 | missing / 13 | statement and locator retained; source and status evidence checked |
| effectivity-index | Definition 2.19 | missing / 13 | statement and locator retained; source and status evidence checked |
| effectivity-source | Remark after Definition 2.19, p. 12, corrected (E7) | missing / 13 | statement and locator retained; source and status evidence checked |
| critical-locus | Corollary 2.20 | missing / 13 | corrected note |
| perverse | §3.1 | planned / 5 | statement and locator retained; source and status evidence checked |
| decomposition | Lemma 3.1; §3.2 | planned / 6 | statement and locator retained; source and status evidence checked |
| relative-hl | §3.2 | planned / 6 | statement and locator retained; source and status evidence checked |
| semismall | Lemma 3.1; Lemma 3.7 | missing / 6 | statement and locator retained; source and status evidence checked |
| theta-ic | Lemma 3.1 | missing / 13 | corrected note |
| theta-ample | Lemma 3.2 | missing / 13 | statement and locator retained; source and status evidence checked |
| theta-low | Corollary 3.3 | missing / 13 | statement and locator retained; source and status evidence checked |
| theta-high | Theorem 3.4 | missing / 13 | statement and locator retained; source and status evidence checked |
| intersection-lci | Lemma 3.5 | missing / 13 | corrected note, statement |
| intersection-low | Corollary 3.6 | missing / 13 | corrected note, statement |
| relative-semismall | Lemma 3.7 | missing / 13 | statement and locator retained; source and status evidence checked |
| ic-kernel | Proposition 3.8 and use in Theorem 3.9 | missing / 13 | statement and locator retained; source and status evidence checked |
| intersection-high | Theorems 1.3,3.9 | missing / 13 | corrected note, statement |
| jacobian-betti | §3.2; §4.1 | missing / 13 | statement and locator retained; source and status evidence checked |
| betti-conjecture | Conjectures 1.4,3.10,4.3 | missing / 4 | corrected note, statement |
| complex-betti-source | Theorems 1.5 and 3.11, pp. 6, 17–20, corrected (E13, E15, E18, E23) | missing / 13 | corrected name, note, statement |
| perverse-middle | §3.2 preceding Theorem 3.11 | missing / 13 | corrected note, statement |
| weak-high | Proposition 3.15 | missing / 13 | statement and locator retained; source and status evidence checked |
| chow | §§3.3,3.5 | planned / 8 | statement and locator retained; source and status evidence checked |
| symmetric-chern | Proposition 3.16, Macdonald input | missing / 13 | statement and locator retained; source and status evidence checked |
| poincare-cycle | Proposition 3.16, [ACGH] input | missing / 13 | statement and locator retained; source and status evidence checked |
| general-euler | Proposition 3.16 | missing / 13 | statement and locator retained; source and status evidence checked |
| euler-obstruction | §3.2 | missing / 14 | statement and locator retained; source and status evidence checked |
| polar | §3.2; §3.5 | missing / 14 | statement and locator retained; source and status evidence checked |
| characteristic-cycle | Theorem 3.12 prerequisite; Sawin §1 | missing / 14 | statement and locator retained; source and status evidence checked |
| morse-correct | Massey input to Theorem 3.12; Sawin Theorem 1.4 comparison | missing / 14 | statement and locator retained; source and status evidence checked |
| higher-discriminant | Definition 3.13 | missing / 14 | statement and locator retained; source and status evidence checked |
| discriminant-codim | Theorem 3.14 input; Migliorini–Shende | missing / 14 | statement and locator retained; source and status evidence checked |
| discriminant-expansion | Theorem 3.14; MS published Corollaries 2.16–2.18 | missing / 14 | statement and locator retained; source and status evidence checked |
| abel-motivic | §3.2 after Theorem 3.14 | missing / 13 | statement and locator retained; source and status evidence checked |
| transverse-dimension | Lemma 3.17 | missing / 13 | statement and locator retained; source and status evidence checked |
| discriminant-strata | Notation 3.18; §3.5 | missing / 13 | statement and locator retained; source and status evidence checked |
| discriminant-components | Corollary 3.19 | missing / 13 | statement and locator retained; source and status evidence checked |
| ordinary-double | Proposition 3.20 | planned / 7 | statement and locator retained; source and status evidence checked |
| node-count | Proposition 3.20 | missing / 13 | statement and locator retained; source and status evidence checked |
| polar-incidence | §3.5 | missing / 13 | statement and locator retained; source and status evidence checked |
| polar-incidence-generic | Lemma 3.21 | missing / 13 | statement and locator retained; source and status evidence checked |
| polar-coefficient-source | Lemma 3.22, p. 27, corrected (E15) | missing / 13 | corrected name, note, statement |
| polar-multiplicity-source | Proposition 3.23, pp. 27–29, corrected (E15, E17, E23) | missing / 13 | corrected note, statement |
| positive-intersection | Proposition 3.23; Fulton 12.2(a),12.4 | missing / 8 | statement and locator retained; source and status evidence checked |
| pushforward-sections | Lemma 4.1 | missing / 1 | statement and locator retained; source and status evidence checked |
| reduced-divisors | §4.1 first proof | missing / 13 | statement and locator retained; source and status evidence checked |
| curve-zeta | §4.1 | planned / 9 | statement and locator retained; source and status evidence checked |
| curve-reciprocity | §4.1 | planned / 9 | statement and locator retained; source and status evidence checked |
| class-zeta | §4.1 | missing / 13 | statement and locator retained; source and status evidence checked |
| curve-rh | §4.1; Theorem 4.4 split-place step | planned / 10 | statement and locator retained; source and status evidence checked |
| reduced-zeta | §4.1 equation (7) | missing / 13 | statement and locator retained; source and status evidence checked |
| gonality-points | Altuğ–Tsimerman §3, Theorem 3.3 input | missing / 4 | statement and locator retained; source and status evidence checked |
| weil-measure | [AT] §3; §4.1 | missing / 4 | statement and locator retained; source and status evidence checked |
| gonality-lindelof | AT Theorems 3.1,3.3, selected proof read | missing / 4 | corrected note |
| class-asymptotic | Theorem 4.2 analytic normalization | missing / 4 | corrected note, proofSteps |
| reduced-coefficients | Theorem 4.2 first proof | missing / 4 | statement and locator retained; source and status evidence checked |
| theta-density | Theorem 4.2 first proof | missing / 4 | statement and locator retained; source and status evidence checked |
| single-limit | Theorem 4.2, source-qualified assembly | missing / 4 | corrected note, statement |
| theta-betti-bound | Theorem 4.2 second proof | missing / 13 | statement and locator retained; source and status evidence checked |
| trace-weight | §4.1 second proof; §4.2 | planned / 11 | statement and locator retained; source and status evidence checked |
| trace-formula | §4.1 second proof | planned | corrected note |
| geometric-single-threshold | Theorem 4.2 second proof | missing / 4 | statement and locator retained; source and status evidence checked |
| escape | Conjecture 1.2; Theorem 4.4 | missing / 4 | statement and locator retained; source and status evidence checked |
| joint-normalization | Theorem 4.4 proof, p.33 | missing / 3 | statement and locator retained; source and status evidence checked |
| large-ratio-error | Theorem 4.4 Case 2 | missing / 4 | corrected note, statement |
| parity-limit | Theorem 4.4; Sawin Theorem 1.7 | missing / 3 | statement and locator retained; source and status evidence checked |
| joint-conditional | Theorem 4.4, explicit dependency contract | missing / 4 | statement and locator retained; source and status evidence checked |
| split-place | Theorem 4.4 Case 1 | missing / 4 | statement and locator retained; source and status evidence checked |
| linnik-transfer-source | Theorem 4.4, Case 1, pp. 33–34 | missing / 4 | corrected note, statement |
| adeles | Appendix A.1 | planned / 12 | statement and locator retained; source and status evidence checked |
| adelic-bundle | Appendix A.1 | planned / 1 | statement and locator retained; source and status evidence checked |
| weil-bundle | Appendix A.1 | planned / 1 | statement and locator retained; source and status evidence checked |
| quadratic-torus | Appendix A.2 | missing / 12 | corrected note |
| integral-torus-model | Appendix A.3, corrected local model | missing / 1 | statement and locator retained; source and status evidence checked |
| hecke | Appendix A.4 | planned / 2 | statement and locator retained; source and status evidence checked |
| hecke-measure | Appendix A.4 | missing / 3 | statement and locator retained; source and status evidence checked |
| hecke-mixing-source | Remark after Theorem 4.4, Case 1, p. 34; Appendix A.4 | missing / 4 | statement and locator retained; source and status evidence checked |
| frobenius-power-library | Mathlib/Algebra/CharP/Lemmas.lean:116–178,243–263; pin 082e2d3 | library | statement and locator retained; source and status evidence checked |
| principal-witness-library | TauCeti/AlgebraicGeometry/WeilDivisor/Principal/Basic.lean:67–155; pin f790474 | library | statement and locator retained; source and status evidence checked |
| abel-class-additivity-library | TauCeti/AlgebraicGeometry/WeilDivisor/AbelJacobi/Sum/Basic.lean:47–194; pin f790474 | library | statement and locator retained; source and status evidence checked |
| divisor-sheaf-equivalence-library | TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean:62–77,465–553; pin f790474 | library | statement and locator retained; source and status evidence checked |
| char5-model-import | Algebraic Curves Layer 10 odd-degree hyperelliptic model and Layer 12 dictionary; continuation W2 | planned | statement and locator retained; source and status evidence checked |
| weighted-rank-characteristic | Proposition 2.3, corrected characteristic-sensitive refinement; continuation W1 | missing / 13 | statement and locator retained; source and status evidence checked |
| char5-norm-witness | Continuation W2–W3, explicit counterexample to the unrestricted reading of v1 Corollary 2.4 | missing / 13 | statement and locator retained; source and status evidence checked |
| char5-principal-divisor | Continuation W3: local orders at P,Q,∞ | missing / 13 | statement and locator retained; source and status evidence checked |
| char5-infinite-weighted-fiber | Continuation W4; v1 p.7 Corollary 2.4 under an unrestricted characteristic reading | missing / 13 | statement and locator retained; source and status evidence checked |
| finite-norm-library | Mathlib FieldTheory/Finite/GaloisField.lean:225–256 | library | statement and locator retained; source and status evidence checked |
| degree-fiber-equivalence-library | Mathlib GroupTheory/Coset/Basic.lean:468–496 | library | statement and locator retained; source and status evidence checked |
| finite-degree-fibers-library | TauCeti FieldTheory/FunctionField/RiemannRoch/ClassNumber.lean:174–188 | library | statement and locator retained; source and status evidence checked |
| effective-degree-one-library | TauCeti FieldTheory/FunctionField/Divisor/Basic.lean:206–215 | library | statement and locator retained; source and status evidence checked |
| coherent-flat-base-change-import | JC.C; N2 rational effectivity and descent injectivity | planned | statement and locator retained; source and status evidence checked |
| galois-linebundle-descent-import | Milne Jacobian Varieties §1, Proposition 1.8(b); JC.D | planned | statement and locator retained; source and status evidence checked |
| extension-point-divisor | N1; explicit supplier for v1 Theorem 4.2 | missing / 13 | statement and locator retained; source and status evidence checked |
| consecutive-extension-points | N1, derived from the all-extension curve bound | missing / 13 | statement and locator retained; source and status evidence checked |
| finite-picard-descent | N2; finite-field specialization of the existing Picard and descent suppliers | missing / 13 | statement and locator retained; source and status evidence checked |
| theta-rational-effectivity | N2; arithmetic adapter for v1 §4 | missing / 13 | statement and locator retained; source and status evidence checked |
| picard-degree-representative | N3; degree bookkeeping for §4 tail probabilities | missing / 3 | statement and locator retained; source and status evidence checked |
| picard-parity-carry | N3; quotient acceptance contract | missing / 3 | statement and locator retained; source and status evidence checked |
| all-degree-splitting-index | N4; extension of v1 Lemma 4.1 using the projection formula | missing / 1 | statement and locator retained; source and status evidence checked |
| hyperelliptic-linebundle-inversion | N4; divisor/norm explanation of v1 p.33 inversion | missing / 13 | statement and locator retained; source and status evidence checked |
| bundle-inversion-invariance | N4; exact inverse and twist in Theorem 4.4 | missing / 1 | statement and locator retained; source and status evidence checked |
| one-tail-event-bijection | N4; v1 Theorem 4.2 finite counting input | missing / 3 | statement and locator retained; source and status evidence checked |
| joint-tail-event-bijection | N4; v1 p.33 repaired count | missing / 3 | statement and locator retained; source and status evidence checked |
| pointless-degree-one-examples | N5; explicit regressions for inherited source finding E9 | missing / 13 | statement and locator retained; source and status evidence checked |
| pointless-finite-bundle-law | N5; finite counting regression | missing / 3 | statement and locator retained; source and status evidence checked |
| complex-betti-unrestricted-source | arXiv v1 p.6 Conjecture 1.4 and Theorem 1.5, compared with p.17 Conjecture 3.10/Theorem 3.11 and p.32 Conjecture 4.3 | missing / 13 | added distinct source endpoint and explicit G10 obligation |

## Reproducible independent regression

The inherited two scripts remain in the extraction report history and were rerun without edits. This additional bounded script tests different orbit and coefficient cases; its finite checks are subordinate to the mathematical arguments above.

```python
"""Bounded independent checks; the report contains the general arguments."""
from itertools import product
from math import comb, factorial
checks = 0
for a,b,c,d in product(range(9), repeat=4):
    # Two coefficients for D1 and D2 on an unramified involution orbit.
    h1,h2=min(a,b),min(c,d)
    x,y,u,v=a-h1,b-h1,c-h2,d-h2
    s,t=min(x,v),min(y,u)
    x,y,u,v=x-s,y-t,u-t,v-s
    rc=(min(x,u),min(y,v))
    residual=x+y+u+v-sum(rc)
    rank=max(a,b,c,d)
    assert residual <= rank
    assert (x+u)*(y+v)==0
    checks+=2
for a,b in product(range(20),repeat=2):
    # At a branch point two odd residuals form S+tau(S) and cancel.
    residual=abs(a%2-b%2)
    assert residual <= (max(a,b)+1)//2
    checks+=1
for g in range(2,21):
    for r in range(g+1):
        for s in range(g-r):
            t=g-1-r-s
            for k in range(t,g):
                c=0
                for a in range(r+1):
                    b=k-t-a
                    if 0<=b<=s:
                        c+=factorial(k)//(factorial(a)*factorial(b)*factorial(t))*2**(a+b)*4**(s-b)*comb(r+s-a-b,r-a)
                assert c <= (g+1)*48**g
                assert 4**(g-k-1)*c*comb(g,k+1) <= (g+1)*384**g
                checks+=2
for hc,h1,h2,s in product(range(8),repeat=4):
    # h's are half-degrees of hyperelliptic divisors; s is deg S.
    dimension=hc+h1+h2+s
    m=2*hc+h1+h2+s
    assert dimension<=m
    checks+=1
assert 1 != 1/2  # E25: D1=p, D2=tau(p) is one-dimensional.
print(f'PASS: {checks} independent orbit, dimension and coefficient checks')
```
