# Heights, rational points and obstructions, Part II: uniform Bogomolov and uniform Mordell–Lang

**Summary.** Uniformity for small points and for Mordell–Lang on subvarieties of abelian varieties, extending HeightsRationalPointsAndObstructions where its Layer 5 stops (qualitative Mordell–Lang, Bogomolov over number fields, equidistribution). The plan follows Dimitrov–Gao–Habegger’s height inequality for non-degenerate subvarieties, Kühne’s equidistribution in families, Gao–Ge–Kühne’s gap principle, uniform Bogomolov and uniform Mordell–Lang via Rémond’s quantitative Vojta method, the geometric Bogomolov conjecture over function fields (Gao–Habegger in characteristic 0 over curves, Xie–Yuan in general), Yuan’s uniform Bogomolov-type theorem for curves over all global fields with the relative Bogomolov theorem for curve families, and DeMarco–Krieger–Ye’s bielliptic family as a worked case. Betti maps come from AbelianSchemesAndArithmeticModuliPartII, adelic line bundles, bigness and Moriwaki heights from ArakelovGeometryAndAbelianHeightsPartII, moduli from PELModuli, StableReductionPartII and JacobianChallengePartII.

## Purpose and where the parent stops

Heights, rational points and obstructions (HeightsRationalPointsAndObstructions, a TauCetiRoadmap pull request) ends its Layer 5 with the qualitative theorems on subvarieties of abelian varieties: cosets, stabilizers and the Ueno locus, Manin–Mumford, finite-rank Mordell–Lang through the Vojta–Faltings–Rémond method, the essential minimum, Bogomolov over number fields and equidistribution of small points; its Layer 0 also owns heights over polarized function fields, Silverman–Tate in families and Silverman’s specialization limit. This Part II starts there and makes the theorems uniform: the number of exceptional points, or of covering cosets, depends only on the dimension and degree of the subvariety (and exponentially on the rank of the group), not on the abelian variety or its field of definition. It also proves the geometric Bogomolov conjecture over function fields, which the parent excludes, and Yuan’s uniform Bogomolov-type theorem for curves over all global fields.

The route is that of Dimitrov–Gao–Habegger, Kühne and Gao–Ge–Kühne: a height inequality on non-degenerate subvarieties of abelian schemes (UB.2), equidistribution of small points in families (UB.3), a gap principle at the scale of the Faltings height (UB.4), and Rémond’s quantitative Vojta method for the large points (UB.5), combined over a restricted Hilbert scheme that parametrizes all subvarieties of given dimension and degree in all principally polarized abelian varieties (UB.1). Over function fields, Gao–Habegger (characteristic 0, curves as base) and Xie–Yuan (all characteristics) prove the geometric Bogomolov conjecture (UB.7–UB.9); Yuan’s adelic bigness gives the relative Bogomolov theorem for curve families and the uniform Bogomolov-type theorem for curves over all global fields (UB.10–UB.11). DeMarco–Krieger–Ye’s bielliptic genus-two family, proved by arithmetic dynamics, is a worked special case (UB.12).

## Scope and boundaries

- Imported, never planned here: Betti maps, Betti forms, non-degeneracy and Gao’s criteria for fibred powers and differences (AbelianSchemesAndArithmeticModuliPartII B0–B4); adelic line bundles, Deligne pairings, volumes, the Yuan–Zhang height inequality and fundamental inequality, invariant extensions, equidistribution on non-degenerate subvarieties, Moriwaki heights, potential bigness, theta identities and Faltings-height comparisons (ArakelovGeometryAndAbelianHeightsPartII AH.3–AH.13); Faltings heights and moduli-height comparisons (ArakelovGeometryAndAbelianHeights R35.3–R35.5); Siegel moduli with level (PELModuli M5–M6); fine curve moduli with level and Torelli (StableReductionPartII MC.4–MC.7); relative Jacobians, Abel, difference and Faltings–Zhang maps, twice-theta (JacobianChallengePartII JC0–JC7); Hilbert schemes and Chow varieties (AlgebraicModuliForArithmeticGeometry R09.1–R09.2); intersection theory and Bézout (SchemeAndStackFoundations SF.5); Néron models and semistable reduction (NeronModelsAndSemistableAbelianVarieties R11.1–R11.5); Lattès maps and the Legendre family (ArithmeticDynamics DY.6).
- From the parent: the height machine, Néron–Tate heights and pairings, Silverman–Tate, function-field heights of subvarieties (RP.0), the trace and Lang–Néron (RP.1), and cosets, stabilizers, the Ueno locus, finite rank, Manin–Mumford in all characteristics, uniform Manin–Mumford in families, Mordell–Lang, the Vojta method, projective cycle heights with arithmetic Bézout, Siu’s inequality, Zhang’s difference lemma and the essential minimum (RP.5).
- Not in this roadmap: the four other Part II directions proposed for the parent (Hasse principle for random Fano hypersurfaces; random norm and conic fibrations; Massey vanishing and homogeneous spaces; zero-cycles on homogeneous spaces) are separate roadmaps, each a Part II of the parent with its own design.
- Gao–Habegger’s own proof of their height inequality (their §§6–10) is not planned: the DGH inequality of UB.2 together with Gao–Habegger’s degeneracy theorem gives the same statement.

## Conventions

- Varieties are over a field; a subvariety is closed and irreducible unless stated otherwise. The degree deg_L Z of a closed subset is the sum of the degrees of its irreducible components (UB.0).
- X° is the complement of the Ueno locus (the union of positive-dimensional cosets in X), as in the parent.
- For an ample L on an abelian variety, the uniform theorems use the symmetric bundle L ⊗ [−1]^\*L. For a curve, ĥ is half the canonical height of the symmetric twice-theta bundle (Yuan §4.3.1), i.e. the Néron–Tate height of the principal polarization.
- Over the level-4 universal family, deg_{𝔏\_g^{⊗4}|A} X = 8^r deg_L X and ĥ\_{𝔏\_g^{⊗4}|A} = 4ĥ\_{L⊗[−1]^\*L} (GGK (4.10), (4.12)).
- Heights over number fields are absolute (divided by the degree over ℚ); over a function field of one variable K/k they are divided by the degree over K and weight a place v by [k(v) : k] with k fixed (Yuan §4.3.1). h_Fal is the stable Faltings height.
- A subgroup Γ of A(F) has finite rank ρ when Γ ⊗ ℚ has dimension ρ; it need not be finitely generated.
- Page numbers: GGK is cited by the published pagination (printed page = PDF page + 187 in the Centre Mersenne file); Yuan by the author manuscript of 21 August 2024; DGH, GH, XY, Kühne and DMY by the arXiv versions read. DKY is also cited from the published PDF (printed page = PDF page + 948), notably Proposition 9.2 which is absent from arXiv v2.

The general dynamical height inequality belongs to ArakelovGeometryAndAbelianHeightsPartII AH.5. UB.2 owns the geometric level-case construction and compares its general Weil-height export with that input. Generic fibre products are taken geometrically integral when needed, or treated componentwise. Function-field specialness and trace-free reductions use the geometric trace after algebraic closure.

## Sources
- Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*, Ann. of Math. 203 (2026), no. 1; read: author manuscript of 21 August 2024 (126 pp., printed page = PDF page), arXiv 2108.05625. [yuan-2026](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf).
- Vesselin Dimitrov, Ziyang Gao, Philipp Habegger, *Uniformity in Mordell–Lang for curves*, Ann. of Math. 194 (2021), no. 1; read: arXiv 2001.10276v3 (31 March 2021). [dgh-2021](https://arxiv.org/abs/2001.10276v3).
- Ziyang Gao, Philipp Habegger, *Heights in families of abelian varieties and the geometric Bogomolov conjecture*, Ann. of Math. 189 (2019), no. 2; read: arXiv 1801.05762v3 (28 January 2019). [gh-2019](https://arxiv.org/abs/1801.05762v3).
- Junyi Xie, Xinyi Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*, Invent. Math. (2022); read: arXiv 2108.09722v1. [xy-2022](https://arxiv.org/abs/2108.09722v1).
- Ziyang Gao, Tangli Ge, Lars Kühne, *The uniform Mordell–Lang conjecture*, Publ. Math. IHÉS 143 (2026); published PDF (printed page = PDF page + 187). [ggk-2026](https://pmihes.centre-mersenne.org/item/10.5802/pmihes.26.pdf).
- Lars Kühne, *Equidistribution in families of abelian varieties and uniformity*, arXiv 2101.10272v4 (23 December 2024). [kuhne-2021](https://arxiv.org/abs/2101.10272v4).
- Laura DeMarco, Holly Krieger, Hexi Ye, *Uniform Manin–Mumford for a family of genus 2 curves*, Ann. of Math. 191 (2020), no. 3; read: arXiv 1901.09945v2 (published numbering from the extraction’s collation). [dky-2020](https://arxiv.org/abs/1901.09945v2).
- Gaël Rémond, *Inégalité de Vojta en dimension supérieure*, Ann. Scuola Norm. Sup. Pisa Cl. Sci. (4) 29 (2000), 101–151 (Numdam; printed page = PDF page + 99). [remond-2000-vojta](http://www.numdam.org/item/ASNSP_2000_4_29_1_101_0/).
- Kazuhiko Yamaki, *Trace of abelian varieties over function fields and the geometric Bogomolov conjecture*, J. reine angew. Math. (2018); read: arXiv 1405.0896v5. [yamaki-2018](https://arxiv.org/abs/1405.0896v5).
- David W. Masser, *Specializations of endomorphism rings of abelian varieties*, Bull. Soc. Math. France 124 (1996), 457–476 (Numdam). [masser-1996](http://www.numdam.org/item/BSMF_1996__124_3_457_0/).
- Laura DeMarco, Niki Myrto Mavraki, Hexi Ye, *Bounded geometry for PCF-special subvarieties*, Forum Math. Pi 14 (2026) e4; read: arXiv 2405.17343v3. [dmy-2026](https://arxiv.org/abs/2405.17343v3).
- Laura DeMarco, Holly Krieger, Hexi Ye, *Uniform Manin–Mumford for a family of genus 2 curves*, Ann. of Math. 191 (2020), 949–1001; published PDF, printed page = PDF page + 948. [dky-published-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p05-s.pdf).

## Source corrections

The source findings below are independently checked and version-scoped in the packet. They state the assertions and repairs in our own words; the review records the existing atlas findings consulted. A preprint finding does not assert that final published wording is unchanged.

- **E1 — ggk-2026, Published Theorem 1.3, p. 192.** Both existential constants are named c₃ although the conclusion also uses c₄. Name the counting constant c₄. Check: The threshold in (1.4) is c₃ and the independent cardinality bound is c₄.
- **E2 — ggk-2026, Published Proposition 4.1 proof, p. 210.** The exceptional-set degree after the isogeny is bounded by the unscaled principally polarized degree constant. Multiply that constant by (l/g!)^{2(r−1)}; use the dimension of each component. Check: For n=l/g!, c₁(u*L)=n²c₁(L₀), so a k-dimensional component acquires the factor n^{2k}, with k≤r−1.
- **E3 — ggk-2026, Published (7.4)–(7.6), pp. 221–222; Appendix A.5 (A.12), p. 232.** Each covering ball is treated as containing only c₀ points. Use c₀^{ρ+1} points per ball and carry that factor through the packing estimate. Check: The packing hypothesis (7.1) gives c₀^{ρ+1}; a covering count does not remove its rank exponent. The eventual C^{ρ+1} form survives.
- **E4 — ggk-2026, Published Proposition 7.2 proof, (7.10), p. 223.** The proposed c₀ is max{c₁,c₃}. Take max{c₁^{−1},c₃}, enlarged to at least one. Check: The packing threshold c₀^{−1} must be no larger than the gap threshold c₁.
- **E5 — ggk-2026, Published Appendix A.5, Step 3, p. 232.** The lower cardinality estimate uses 4c₈+1 while the subsequent cover has (8c₈+1)^ρ balls. Retain the stronger lower bound with 8c₈+1 obtained from the excluded alternative. Check: Subtracting the large-point bound from the complement of case (i) gives precisely the stronger bound needed for pigeonhole.
- **E6 — ggk-2026, Published §8 proof of Theorem 1.3, p. 226.** Induction is applied to exceptional components without resolving their failure to generate the ambient variety or their nonzero translating cosets. Strengthen the induction to arbitrary irreducible subvarieties. Translate by one of their small points into the group generated by differences and shrink the threshold by a factor four. Check: ĥ(P−P₀)≤2ĥ(P)+2ĥ(P₀); generated-subvariety degrees are bounded. Take extrema over the resulting bounded dimensions and degrees, then induct in the original ambient variety. This proves the stronger node and repairs the stated generating case.
- **E7 — ggk-2026, Published Proposition A.3(ii), p. 228; proof p. 230.** The exceptional-set degree is asserted to be strictly smaller than the displayed product bound. Use a non-strict degree inequality. Check: The component count times the component-degree bound yields ≤; later uses already allow this form.
- **E8 — ggk-2026, Published §7.3, p. 224.** The rank-ρ finitely generated subgroup can be taken stable under every endomorphism of A. Choose a subgroup generated by lifts of a rational basis of Γ⊗ℚ, then use its division hull; no endomorphism stability is needed. Check: For A=E×E and Γ generated by (P,0), the coordinate swap forces an additional independent direction if P is non-torsion.
- **E9 — ggk-2026, Published Lemma 7.4 proof, p. 225.** Representatives on the complementary abelian variety are treated as belonging to the original Γ. Lift Γ through the addition isogeny and project to the complementary factor, obtaining Γ_B of rank at most ρ. Check: A coset meeting Γ need not have its chosen complementary representative in Γ. Finite-kernel inverse image and projection preserve the needed rank bound.
- **E10 — ggk-2026, Published Proposition 5.2, Step 4, p. 215.** The two orbit-integral estimates are written with large-height hypotheses. Their hypotheses require heights smaller than δ; retain the lower-height alternative in the following claim. Check: Equidistribution controls generic points tending to height zero, and the next contradiction explicitly requires both points to have small height.
- **E11 — ggk-2026, Published Proposition 5.2, Steps 2–4, pp. 213–215.** The measure comparison uses an unnormalized pullback through a finite map. On the constant-degree finite étale locus compare μ₁ with (1/d_D)D*μ₂, and average the separating test function over the finite stabilizer. Check: For f₁=f₂∘D the unnormalized pullback integral is d_D times the target integral; the contradiction requires equal normalization. Step 2 proves non-proportionality, so division by d_D does not remove separation.
- **E12 — xy-2022, arXiv v1 Proposition 3.6, first case, p. 16.** Containing the minimal isogeny field of A is claimed sufficient to make X special. It is necessary first to descend A up to isogeny; then also adjoin the minimal field of definition of the image of X in that constant abelian variety. Check: When A becomes constant, a subvariety can still vary. Finite stabilizer and torsion generation do not force its coefficients to descend to the isogeny field.
- **E13 — xy-2022, arXiv v1 Proposition 5.4, pp. 25–26.** The torsion-fibre argument is applied to all torsion orders. Restrict to orders prime to the characteristic; these torsion points are still Zariski dense. Check: The torsion multisection must be smooth in the intersection argument; prime-to-p multiplication is étale and gives that property.
- **E14 — xy-2022, arXiv v1 §5.3, pp. 26–27.** Height-zero components are immediately subjected to the induction hypothesis phrased in terms of dense small points. Insert the converse supplied by the essential-minimum inequalities. Check: For a nef canonical bundle, e₁≥ĥ(X)≥e₁/(dim X+1), so height zero forces e₁=0.
- **E15 — xy-2022, arXiv v1 Lemma 5.3, p. 23.** The positive-dimensional increasing-sum conclusion has no positive-dimension hypothesis on X. Require dim X≥1, and treat torsion points separately. Check: For X={t} torsion every iterated sum is one point and no positive-dimensional stage exists.
- **E16 — xy-2022, arXiv v1 Lemma 3.7, pp. 16–18, used in Proposition 3.1.** One pencil construction is used to conclude that two distinct intermediate fields are available. Choose s₁/s₀ and s₂/s₀ algebraically independent by a dominant general projection to ℙ², then use their pencils. Check: A very ample bundle and dim S≥2 supply the projection; algebraic independence proves the two one-variable fields differ.
- **E17 — xy-2022, arXiv v1 Proposition 3.2 proof, pp. 13–14; Corollary 3.5(i), p. 15.** A model mapping flat and quasi-finitely to a product of the two parameter spaces is used without independence of their fields. Use the independent-fields proof when δ=0 and the defect-decreasing conjugate-fields induction in UB.9/isogeny-two-subfields when δ>0. Check: If trdeg(k₁k₂/k)<trdeg(k₁/k)+trdeg(k₂/k), the asserted quasi-finite map to the product has incompatible dimensions. The repair computes δ′<δ using subvariety-field-descent.
- **E18 — xy-2022, arXiv v1 Proposition 3.6, opening paragraph, p. 16.** Intersecting a minimal field over the algebraic closure with K is asserted to descend it without enforcing conjugation stability. First take the algebraic closure of the compositum of all K-conjugates, then intersect with K. Check: For an element of the stable compositum all conjugate roots of its minimal polynomial lie there; its coefficients lie in the intersection with K. This works without assuming a finite orbit and includes inseparable multiplicities.
- **E19 — xy-2022, arXiv v1 Lemma 3.7, pp. 17–18.** The geometric generic pencil member is used as a normal polarization model without proving its normality. Normalize that member and pull back the ample bundle; compute its height by the projection formula. Check: Geometric integrality gives a regular field extension and an integral geometric member, not normality. Finite normalization preserves ampleness and the intersection height.
- **E20 — xy-2022, arXiv v1 Proposition 5.4 proof, pp. 25–26.** An extension of the generic product is treated as a closed subgroup immersion into the good-reduction product model. Use the product with the Néron model of A′; there the sum map is a smooth projection, and the extended map to A×A is only a homomorphism. Check: The generic coordinates (x,t)↦(x,t−x) identify the sum with the second projection. No asserted model immersion is needed for heights or the intersection inequality.
- **E21 — yuan-2026, Author manuscript 21 August 2024, Theorem 4.19, p. 101; maximal variation §1.6, p. 16.** The function-field relative theorem uses maximal variation over K rather than over its constants. Require maximal variation on a model over the constant field k, which supplies the adelic bigness over k used in the proof. Check: For S=Spec K and a constant curve of genus two, the K-moduli map is quasi-finite but the m=1 difference image is the entire constant Jacobian; constant torsion points contradict the claimed relative conclusion. Generic finiteness over k rules this out.
- **E22 — yuan-2026, Author manuscript, Theorem 4.5(4) proof, p. 70.** The restricted-family argument keeps the dimension of S where its base is the image T. Use dim T and the restricted family over T. Check: Potential bigness after restriction comes from maximal variation on T, not from the dimension of the original base.
- **E23 — yuan-2026, Author manuscript, Theorem 4.2(2) proof, pp. 65–66; Theorem 4.10 proof, p. 83.** The exceptional divisor is claimed to contain points at the exact boundary of the lower height inequality. Introduce a positive ample margin and then halve the threshold. Check: Effectivity gives a non-strict lower bound outside the divisor. A strict margin excludes boundary equality, including points for which the original comparison height is zero.
- **E24 — yuan-2026, Author manuscript, Theorem 4.2(1) proof, p. 65; Lemma 4.3, p. 66.** The finite-grid lemma is used to establish finiteness of the very set it assumes finite. Apply the same uniform bound to every finite subset first. Check: An infinite set has finite subsets of arbitrarily large cardinality; the subset-independent bound forces finiteness.
- **E25 — yuan-2026, Author manuscript, Propositions 4.16 and 4.18, pp. 97, 100.** The displayed relative pairing uses an unintroduced structure map π restricted to Y. Use the actual structure map ψ∘ι:Y→S and the pullback ι*L̄. Check: The setup supplies ψ:A→S and ι:Y→A; ι is not required to be an immersion. The relative Deligne pairing itself lies on S.
- **E26 — yuan-2026, Author manuscript, §4.4.3, pp. 83–84.** The remaining finitely many positive characteristics are left to an analogous argument without the details. Supply the geometric small-points argument over the prime-to-p fine-level component, with restriction and noetherian induction on J. Check: The integral theorem requires flatness over ℤ, so it cannot be invoked on a vertical component over 𝔽_p. This remains an explicit plan gap.
- **E27 — dky-published-2020, Published §9.4, p. 997; arXiv v2 §9.4, p. 46.** A height identity for the distinguished Weierstrass base point Q is used to conclude the result for arbitrary P. Translate by the 2-torsion class P−Q while keeping the same symmetric bundle L_X. Check: The difference of Weierstrass points is 2-torsion. Quadratic canonical heights for that same bundle are exactly invariant under torsion translation, giving a height-preserving bijection.
- **E28 — kuhne-2021, arXiv v4 Lemma 12 proof, p. 25.** Lemma 12 asserts that shrinking the base makes the fibre product irreducible, using only irreducibility of each generic fibre in its proof. Use geometric generic irreducibility, or pass to the relevant irreducible components when proving the rank assertion. Check: Over a complex elliptic S=E in A=E×S, the irreducible multisection X={(x,s):2x=s} is non-degenerate. Yet X×_S X is the disjoint union of the four graphs y=x+t, t∈E[2], on every dense open. UB.1 explicitly uses geometric generic irreducibility; the Betti-form product API is componentwise.
- **E29 — dgh-2021, arXiv v3 §1.2 p. 4 and Theorem B.1 proof pp. 43–46.** The introductory ball count and the reduction-step numbering differ from the formulas actually used in the proof. Use (1+2√(c₀c₃))^ρ balls; count seven reductions, with (Hyp) the principal-polarization and level conditions (v)–(vi). Check: Substituting the displayed radii into 1+2R/r gives the count. The seven reductions are closure, dominance, regularity, polarized isogeny, principal polarization, level, and height comparison.
- **E30 — dgh-2021, arXiv v3 Proposition 4.2 proof p. 17 and Proposition 4.3 (4.13), p. 21.** The ambient extension of the bump function need not be smooth, and the polynomial degree recurrence loses the constant-degree case. Extend smoothly from the closed submanifold inside the complement of the boundary and use a cut-off before extending by zero. Use max{1,D′} in the recurrence. Check: The analytic intersection argument needs a smooth form. If D′=0 the stated recurrence cannot absorb the positive lower-order contribution.
- **E31 — dgh-2021, arXiv v3 Theorem 1.4 proof p. 36; Theorem B.1 second reduction p. 43.** The small-moduli-height argument gives pointwise torsion finiteness rather than a base-point-uniform bound; the rank reduction also leaves its chosen point outside the required regular locus. Use a bound for all translates C−P₀ of each of the finitely many curves, and choose a maximal-rank point above the regular locus of the base image. Check: A maximum over finitely many curves does not bound infinitely many choices of P₀. The supplied rank-invariance lemma permits the regular-locus choice. The direct David–Philippon bound remains a source gap here.
- **E32 — gh-2019, arXiv v3 §10.2 p. 52, Theorem A.3 p. 56, Appendix B p. 58.** The source swaps the easy inequality reference, omits the base-height expression in the Moriwaki formula, and starts the bounded-degree torsion assertion over an algebraic closure. The defining height gives the first inequality of 1.4′; A.3 bounds the base height by c(1+canonical height). B.1 is over K, and B.3 passes to a finite field of definition. Check: Degrees of points over an already algebraically closed field are all one and cannot impose the bounded-degree torsion restriction. The Moriwaki inequality must have a base height on its left side.
- **E33 — yuan-2026, Author manuscript §4.3.2 p. 74; §4.4.3 pp. 83–84; Theorem 4.2(2) proof p. 66.** The triple definition uses μ_N(k) where its field is F; cross-references point away from the required bound; the geometric proof retains K̄ notation. Use μ_N(F) and roots in F̄, refer to Theorem 4.7 for the curve bound, and use the algebraic closure of k(y) in the geometric proof. Check: The Weil pairing for an F-curve lands in μ_N(F), and the geometric theorem introduces k(y) without a number field K.
- **E34 — xy-2022, arXiv v1 Proposition 3.1 proof p. 19; Proposition 4.2 proof p. 21; Lemma 5.3 proof p. 24; Proposition 5.4 proof p. 26.** Several labels and indices in the height computation are incompatible with their declared targets. The selected pencil makes X non-special for that i. Split 2M into symmetric and antisymmetric parts. The second product projection lands in C. Use the pulled-back cycle h*[T], and keep e+1 in both the intersection and its height-zero conclusion. Check: These are the maps and dimensions used by the adjoining equalities: the torsion-fibre cycle has dimension e and its height uses e+1 line-bundle factors.

## Layer overview

- **UB.0. Degrees and heights of subvarieties, product sets and packing.** Bookkeeping for the uniform counts: the degree of a possibly reducible closed subset with respect to a line bundle (summed over components), heights of cycles through Chow forms compared with the parent’s projective cycle height, the product-set lemma of Gao–Ge–Kühne (a set whose M-th power lies in a proper closed subset lies in a proper closed subset of bounded degree), its curve case (DGH Lemma 6.3), and Rémond’s ball-packing bound in Euclidean space.
- **UB.1. Restricted Hilbert schemes and non-degenerate fibred powers.** The restricted Hilbert scheme H_{r,d}(A)° of irreducible subvarieties of fixed dimension and degree, its family version over the level-4 moduli of principally polarized abelian varieties, fibred powers X_S^{[m]} with their moduli maps, the lemmas of Gao–Ge–Kühne §3 (finitely many points cut a family; generic finiteness of the moduli map), non-degeneracy of high fibred powers (Proposition 3.4, from Gao’s criterion), the locus S_gen of finite stabilizer and generation, and its closure (Lemma 3.5).
- **UB.2. The height inequality for non-degenerate subvarieties.** Dimitrov–Gao–Habegger’s height inequality ĥ(P) ≥ c₁h(π(P)) − c₂ on a dense open of a non-degenerate subvariety of an abelian scheme: the level hypothesis (Hyp), the cut-off Betti form, the graph construction X_N with F and M, the lower bound (F^d) ≥ κN^{2d}, the upper bound (M·F^{d−1}) ≤ cN^{2(d−1)}, Siu’s criterion on the total space, Theorem 1.6 under (Hyp) and Theorem B.1 in general by seven dévissages.
- **UB.3. Equidistribution in families and uniform Bogomolov.** The equilibrium measure of a non-degenerate subvariety (top power of the Betti form), Kühne’s equidistribution of small generic points in families in the uniform (δ, Z) form, the family Ullmo–Zhang argument over the restricted Hilbert scheme (GGK Proposition 5.2), uniform Bogomolov with an exceptional set (Proposition 5.1), the uniform Bogomolov theorem for all irreducible subvarieties (Theorem 1.3, repaired), and uniform Manin–Mumford for curves (Kühne Theorem 2; DGH Theorem 1.4 without dependence on the degree).
- **UB.4. The new gap principle.** Uniform degree and height bounds for Abel–Jacobi curves (DGH Lemma 6.1), the base-point bound (Lemma 6.4), the Néron–Tate distance proposition for curves of large modular height (Proposition 7.1), the family height gap over the restricted Hilbert scheme (GGK Proposition 4.2), its principally polarized and general-polarization forms (Propositions 4.4, 4.1), the fixed-degree gap principle (Proposition 6.1), the new gap principle (Theorem 1.2) and its curve case.
- **UB.5. Rémond’s quantitative Vojta method.** The Néron–Tate Euclidean space of a finite-rank subgroup, the embedding constants c_NT and h₁ with their bounds by the Faltings height, Rémond’s generalized Vojta and Mumford inequalities, the isolated-fibre alternative, removal of the height of X, the bound for points of large height, the packing hypothesis, Rémond’s counting theorem under it (GGK Theorem 7.1), the packing hypothesis from the gap principle (Proposition 7.2), and Rémond’s bound for one subvariety in David–Philippon form.
- **UB.6. Uniform Mordell–Lang.** The uniform count off the Ueno locus over ℚ̄ and over every algebraically closed field of characteristic 0 (GGK Theorem 1.1′, via Masser’s specialization and good models), the reduction from the count to cosets (Lemma 7.4), the uniform Mordell–Lang theorem (Theorem 1.1), its curve case (Kühne Theorem 4), and Dimitrov–Gao–Habegger’s bounds: the count for curves of large modular height (Proposition 8.1), Theorem 1.2 and Corollary 1.3, finiteness of small-height curves of bounded degree, and Theorem 1.1.
- **UB.7. Small points over function fields.** Canonical heights over function fields as heights of invariant adelic extensions, the Zhang–Gubler inequalities e₁ ≥ ĥ(X) ≥ e₁/(dim X + 1) (so ĥ(X) = 0 iff small points are dense), dense sets of small points, special subvarieties tr(Y ⊗ K̄) + T, and density of small points on special subvarieties.
- **UB.8. Geometric Bogomolov over function fields of curves in characteristic zero.** Gao–Habegger: the complement X* of the generically special subvarieties (Proposition 1.3), bounded order of torsion of bounded degree (Proposition B.1), special points of V₀(k) × A_tors (Propositions 3.1, B.3), the height inequality over a curve on X* (Theorems 1.4, 1.4′, here from the DGH inequality and Gao–Habegger’s degeneracy theorem), the geometric Bogomolov theorem over ℚ̄(S) (Theorem 1.1), its Moriwaki-height version (Theorem A.3) and the extension to every algebraically closed field of characteristic 0.
- **UB.9. The geometric Bogomolov conjecture in all characteristics.** Xie–Yuan: fields of definition up to isogeny and of subvarieties (Lemma 3.3, Proposition 3.2, Lemma 3.4, Corollary 3.5), the field over which X becomes special (Proposition 3.6), generic pencil members and their height inequality (Lemma 3.7), lowering the transcendence degree (Proposition 3.1), torsion multi-sections and their numerical class (Proposition 4.2), Yamaki’s reduction, the reduction to (a)–(d), iterated sums and Lemma 5.3, the jump locus, torsion fibres of height zero (Proposition 5.4), the good-reduction case (§5.3) and Theorem 1.1, with the recorded repairs.
- **UB.10. Adelic non-degeneracy and small points in curve families.** Yuan §§4.1–4.2 and 4.6: the small-points bound for potentially big families over number fields and function fields (Theorem 4.2), non-isotrivial function-field points, the integral bound across characteristics (Theorem 4.10), non-degeneracy of fibre powers from potential bigness (Proposition 4.16) and of the Abel, difference, shift and Faltings–Zhang powers (Theorem 4.17), the relative small-points property, Proposition 4.18 and the relative Bogomolov theorem for curve families (Theorem 4.19, function-field branches with maximal variation over the constants).
- **UB.11. Uniform Bogomolov for curves over global fields.** Yuan’s Theorem 1.1: the twice-theta normalization, projective heights over function fields with fixed constants, isotrivial pairs and the isotriviality criteria (Lemma 4.8), the noetherian-induction small-points bound on the universal shift, the shifted height identity with Bost’s bound, moduli-height domination over function fields, uniformity across all characteristics (§4.4.3), and the uniform Bogomolov-type theorem.
- **UB.12. A bielliptic family: uniform Manin–Mumford by dynamics.** DeMarco–Krieger–Ye: bielliptic genus-two curves as lifts of the diagonal (Proposition 9.1), uniform Manin–Mumford (Theorem 1.1) and uniform Bogomolov (Theorem 1.9, published 1.10) for their Weierstrass Abel–Jacobi images from the dynamical bounds of ArithmeticDynamics DY.6, and unboundedness of torsion orders (published Proposition 9.2); both theorems are special cases of the uniform theorems of UB.3.

## How to read the build

Over number fields the chain is UB.0 → UB.1 → UB.2 → UB.3 (uniform Bogomolov) and UB.2 → UB.4 (gap principle), which feed UB.5 (Rémond counting) and then UB.6 (uniform Mordell–Lang, and the Dimitrov–Gao–Habegger bounds for curves). Over function fields, UB.7 sets up small points and special subvarieties, UB.8 proves the characteristic-zero curve-base case from the height inequality of UB.2, and UB.9 proves the general case independently of Betti maps. UB.10–UB.11 are Yuan’s adelic route, which reproves the gap principle for curves and extends it to all global fields; UB.12 is a dynamical special case of UB.3.

## Suggested Lean file

Suggested.lean states only what has carriers at the pins: Rémond’s ball packing (`exists_finset_cover_closedBall`, for UB.0/ball-packing), the packing-to-count step (`card_le_of_sparse_balls`, for Step 4 of UB.5/remond-counting), the cone covering of GGK Appendix A.5 (`exists_cone_cover`, for UB.5/large-points-bound), and the linear core of Xie–Yuan Lemma 3.4 (`SubspaceDefinedOver` and `SubspaceDefinedOver.inf`, for UB.9/subvariety-field-descent). Everything else is a target of this document.

## Layer UB.0: Degrees and heights of subvarieties, product sets and packing

Bookkeeping for the uniform counts: the degree of a possibly reducible closed subset with respect to a line bundle (summed over components), heights of cycles through Chow forms compared with the parent’s projective cycle height, the product-set lemma of Gao–Ge–Kühne (a set whose M-th power lies in a proper closed subset lies in a proper closed subset of bounded degree), its curve case (DGH Lemma 6.3), and Rémond’s ball-packing bound in Euclidean space.

### Degree of a subvariety with respect to a line bundle

`UB.0/subvariety-degree` · construction

Let X be a projective scheme over a field k, L a line bundle on X and Z ⊆ X a closed subscheme with irreducible components Z_i of dimension d_i. For an irreducible Z of dimension d put deg_L Z = (c₁(L)^d ∩ [Z]) ∈ ℤ, the degree of the zero-cycle c₁(L)^d ∩ [Z]; for an arbitrary closed Z put deg_L Z = Σ_i deg_L Z_i over all irreducible components (of possibly different dimensions), each counted once with its reduced structure. For L ample, deg_L Z ≥ 1 when Z ≠ ∅. On a product X^M the degree is taken for L^{⊠M} = Σ p_i^*L, and for a closed immersion X ⊆ ℙⁿ it is taken for O(1).

**Hypotheses.** X projective over a field k; L a line bundle on X, ample for the positivity statements.

**Construction or proof.**

1. Define the degree of an irreducible Z through the intersection of c₁(L)^{dim Z} with the fundamental class [Z] in the Chow group of SF.5 and take the degree of the resulting zero-cycle.
2. Extend to closed subsets by summing over irreducible components with reduced structure; this is the convention of GGK §2 (the total degree), not the degree of the top-dimensional part only.
3. Positivity for ample L: some multiple of L is very ample, and the degree of Z for the very ample multiple is the projective degree, which is positive; divide by the power of the multiple.

**Uses.** Gao–Ge–Kühne, Lemma 4.3 and Propositions 4.1–5.2: exceptional sets X′ are bounded by their total degree; Dimitrov–Gao–Habegger, Lemmas 6.1 and 6.3: uniform degree bounds for Abel–Jacobi curves in the universal family; Gao–Ge–Kühne, (4.10): deg_{𝔏_g^{⊗4}|A} X = 8^r deg_L X for the principal-polarization normalization.

**API.**

- `Subvariety.degree` (data): deg_L Z ∈ ℕ for closed Z of a projective X and ample L; sum over irreducible components.
- `Subvariety.degree_union_le` (relation): deg_L (Z ∪ Z′) ≤ deg_L Z + deg_L Z′. Equality holds if no component of either subset is contained in a component of the other.
- `Subvariety.degree_pow` (simp): For irreducible Z of dimension d and n ≥ 1, deg_{L^{⊗n}} Z = n^d deg_L Z.
- `Subvariety.degree_product` (relation): For geometrically integral Z ⊆ X and Z′ ⊆ X′, deg_{L⊠L′}(Z × Z′) = binom(dim Z + dim Z′, dim Z) deg_L Z deg_{L′} Z′. Over an algebraically closed field, irreducibility suffices (GGK (2.6)).
- `Subvariety.degree_image_le` (functoriality): For a projection q : X^M → X and closed Z ⊆ X^M, deg_L q(Z) ≤ deg_{L^{⊠M}} Z (GGK Lemma 2.4 via DGH Lemma 2.4).
- `Subvariety.degree_bezout` (relation): For closed Z, Z′ of ℙⁿ, Σ_{W component of Z ∩ Z′} deg W ≤ deg Z · deg Z′ (refined Bézout; requested from SF.5).
- `Subvariety.degree_pos` (other): For L ample and Z ≠ ∅, deg_L Z ≥ 1.

**Unit tests.**

- `Subvariety.degree_point` (computation): A closed point with residue field k has degree 1 for every line bundle; a closed point of residue degree 2 has degree 2.
- `Subvariety.degree_line` (computation): A line in ℙⁿ has O(1)-degree 1 and a smooth conic has degree 2.
- `Subvariety.degree_abel_jacobi` (computation): For a curve C of genus g ≥ 1 embedded in its Jacobian by an Abel–Jacobi map, deg_Θ C = g for a theta divisor Θ.
- `Subvariety.degree_reducible` (non-example): The union of a line and a point off it in ℙ² has total degree 2, although its top-dimensional part has degree 1: the total degree is not the degree of the top-dimensional cycle.
- `Subvariety.degree_empty` (degenerate): The empty subscheme has degree 0.
- `Subvariety.degree_contained_point` (non-example): For a line Z and a point P on Z in ℙ², deg(Z ∪ {P}) = 1 < deg Z + deg{P} = 2, although they have no identical irreducible component.

**Needs.** `SchemeAndStackFoundations:SF.5/chow-group`, `SchemeAndStackFoundations:SF.5/degree`, `SchemeAndStackFoundations:SF.5`

**Sources.** ggk-2026, §2, (2.5)–(2.6) and Lemma 2.4, pp. 195–197: Fixes degrees of possibly reducible closed subsets as the sum over irreducible components and records the product and image estimates used throughout.; dgh-2021, §6.1, p. 25 (arXiv v3): Uses degrees of subvarieties of projective space and their intersections, with Bézout.

### Heights of cycles via Chow forms

`UB.0/chow-height` · definition

Let n, r, D ≥ 0. For an effective r-dimensional cycle Z of degree D in ℙⁿ over ℚ̄, its Chow form F_Z is a multihomogeneous form, of degree D in each of r + 1 groups of n + 1 variables, determined up to a scalar. The Chow height h_Ch(Z) is the absolute logarithmic Weil height of the coefficient vector of F_Z, i.e. the height of the point [F_Z] of the Chow variety Ch(ℙⁿ, r, D) in its Chow-form embedding. It is comparable with the arithmetic-intersection height h(Z) of the parent (projective cycle height, Fubini–Study metric): the two differ by an amount bounded linearly in D with a constant depending on n and r (Philippon; Bost–Gillet–Soulé).

**Hypotheses.** Z an effective cycle of pure dimension r and degree D in ℙⁿ over ℚ̄.

**Construction or proof.**

1. Construct F_Z from the incidence correspondence of (r+1)-tuples of hyperplanes meeting Z; its coefficients are the Plücker-type coordinates of [Z] in the Chow variety (AlgebraicModuliForArithmeticGeometry R09.1).
2. Define h_Ch(Z) as the Weil height of [F_Z] (Mathlib Projectivization.logHeight after descending to a number field of definition and normalizing by its degree).
3. Compare with the parent’s projective cycle height (HeightsRationalPointsAndObstructions RP.5, projective cycle heights with the coefficient-height comparison of the Chow form): the two differ by an amount linear in D. This comparison is Philippon’s (Math. Ann. 289 (1991)) and Bost–Gillet–Soulé’s (J. Amer. Math. Soc. 7 (1994)); neither was read for this plan, and the cited papers only use some such height (gap recorded).

**Uses.** DeMarco–Mavraki–Ye, Theorem 1.8: the PCF-special subvarieties are bounded in the Chow variety by h_Ch; Gao–Ge–Kühne, Lemma A.4 and Theorem A.1: Rémond’s inequalities use the height of the subvariety X, removed afterwards; Dimitrov–Gao–Habegger, Lemma 6.1(ii): the Abel–Jacobi curves have height bounded linearly in the moduli height.

**API.**

- `ChowHeight` (data): h_Ch(Z) ∈ ℝ for an effective cycle Z of ℙⁿ_{ℚ̄}.
- `ChowHeight.nonneg` (other): h_Ch(Z) ≥ 0.
- `ChowHeight.add` (relation): |h_Ch(Z + Z′) − h_Ch(Z) − h_Ch(Z′)| ≤ c(n)(deg Z + deg Z′).
- `ChowHeight.compare_cycleHeight` (compatibility): |h_Ch(Z) − h(Z)| ≤ c(n, r)·deg Z for the parent’s arithmetic-intersection height h.
- `ChowHeight.galois_invariant` (other): h_Ch(σZ) = h_Ch(Z) for σ ∈ Gal(ℚ̄/ℚ).
- `ChowHeight.northcott` (other): For fixed n, r, D, B and degree of the field of definition, only finitely many Z have h_Ch(Z) ≤ B.

**Unit tests.**

- `ChowHeight.point` (compatibility): For a point P ∈ ℙⁿ(ℚ̄) (r = 0, D = 1) the Chow form is the linear form Σ P_i u_i and h_Ch(P) is the Weil height of P.
- `ChowHeight.linear_subspace` (computation): A coordinate linear subspace has Chow height 0.
- `ChowHeight.scaling` (non-example): Multiplying the defining equations of a hypersurface by a scalar does not change h_Ch: a definition by coefficient vectors before projectivization fails this.
- `ChowHeight.hyperplane` (computation): For a hyperplane {a₀x₀ + ⋯ + a_nx_n = 0} the Chow height is the Weil height of (a₀, …, a_n); in ℙ¹ the hyperplane {x₀ − 2x₁ = 0} is the point [2 : 1] and has h_Ch = log 2.

**Needs.** `HeightsRationalPointsAndObstructions:RP.5`, `AlgebraicModuliForArithmeticGeometry:R09.1/chow-open-and-embedding`, `mathlib:Projectivization.logHeight`

**Sources.** dmy-2026, §1, p. 3 and §2.5, p. 10 (arXiv v3): Fixes a height function on each Chow variety of cycles of fixed dimension and degree, for instance a Philippon height, without further specification, to measure the subvarieties produced by the bounded-geometry theorem.; ggk-2026, Appendix A.1, p. 227: Uses the height h(X) of a subvariety of projective space (Bost–Gillet–Soulé) in Rémond’s inequalities.; dgh-2021, §6.1, p. 25 and proof of Lemma 6.1, p. 26 (arXiv v3): Uses heights of projective subvarieties and Philippon’s arithmetic Bézout theorem.

**Open input.** Chow-form heights compared with arithmetic-intersection heights.

### Products of point sets in a proper subvariety (Gao–Ge–Kühne Lemma 4.3)

`UB.0/product-set-lemma` · theorem

Let X be an irreducible projective variety over a field k with a very ample line bundle L, let M ≥ 1 and let Z ⊊ X^M be a proper closed subset. There is c = c(M, dim X, deg_L X, deg_{L^{⊠M}} Z) > 0 such that every subset Σ ⊆ X(k) with Σ^M ⊆ Z(k) lies in X′(k) for a proper closed X′ ⊊ X with deg_L X′ < c.

**Hypotheses.** X irreducible projective over k, L very ample on X; M ≥ 1; Z ⊊ X^M closed; Σ ⊆ X(k) with Σ^M ⊆ Z(k).

**Construction or proof.**

1. Induct on M; for M = 1 take X′ = Z.
2. Split Z into the union Z′ of components dominating the first factor of X × X^{M−1} and the rest Z″; let q be the first projection.
3. If the points of Σ outside q(Z″) give a fibre that is a proper subset of X^{M−1}, apply the induction hypothesis to that fibre, whose degree is bounded by Bézout and GGK (2.6).
4. Otherwise Σ minus q(Z″) lies in a proper fibre X″ × {x}; take X′ = X″ ∪ q(Z″), bounding deg q(Z″) ≤ deg Z″ ≤ deg Z by the image estimate, and enlarge k to an algebraically closed field where needed.

**Checks.**

- The bound depends only on M, dim X, deg_L X and deg Z, not on Σ (GGK Lemma 4.3; DMY §5).
- For X = ℙ¹, M = 2 and Z the diagonal, any Σ with Σ² ⊆ Δ has at most one point, and X′ may be taken to be that point.
- The lemma is stated for all subsets Σ, finite or not: an infinite Σ is forced into X′.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`, `SchemeAndStackFoundations:SF.5`

**Sources.** ggk-2026, Lemma 4.3 and proof, pp. 207–208: States and proves, by induction on M, that a set whose M-th power lies in a proper closed subset lies in a proper closed subset of bounded degree, with the dependence of the bound displayed.; dmy-2026, pp. 26–27 (arXiv v3): Applies the lemma, for a quasi-projective X with its closure and subvarieties over ℂ, to bound exceptional sets.

### Many points of a curve escape a proper subvariety of its power (DGH Lemma 6.3)

`UB.0/curve-power-escape` · theorem

Let C ⊆ ℙⁿ_k be an irreducible curve over an algebraically closed field and Z ⊆ (ℙⁿ_k)^M a closed subset with C^M ⊄ Z. There is B depending only on M, deg C and deg Z such that every Σ ⊆ C(k) with #Σ ≥ B satisfies Σ^M ⊄ Z(k).

**Hypotheses.** C irreducible curve in ℙⁿ_k, k algebraically closed; Z closed in (ℙⁿ)^M with C^M ⊄ Z.

**Construction or proof.**

1. Apply the product-set lemma to X = C and Z ∩ C^M ⊊ C^M: a Σ with Σ^M ⊆ Z lies in a proper closed subset of C of bounded degree.
2. A proper closed subset of an irreducible curve is finite with at most its degree many points, so B = c + 1 works with c from the product-set lemma.

**Checks.**

- For M = 1 the statement says a curve not contained in Z meets it in at most deg C · deg Z points (Bézout).
- B does not depend on the field of definition of C or on the height of C.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.0/product-set-lemma`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`

**Sources.** dgh-2021, Lemma 6.3 and proof, p. 28 (arXiv v3): States that sufficiently many points of a curve have M-th power not contained in a given closed subset not containing C^M, with the bound depending only on M and the degrees, and proves it by induction on M.

### Ball packing in Euclidean space (Rémond)

`UB.0/ball-packing` · theorem

Let E be a real Euclidean space of dimension ρ and 0 < r ≤ R. Every subset of a closed ball of radius R in E is covered by at most (1 + 2R/r)^ρ closed balls of radius r centred at points of the subset.

**Hypotheses.** E Euclidean of dimension ρ; 0 < r ≤ R; S ⊆ a closed ball B(x₀, R).

**Construction or proof.**

1. Choose a maximal r-separated subset S₀ ⊆ S; the closed r-balls about S₀ cover S by maximality.
2. The open balls of radius r/2 about S₀ are disjoint and lie in B(x₀, R + r/2); compare volumes with addHaar_closedBall: #S₀ (r/2)^ρ ≤ (R + r/2)^ρ.
3. Hence #S₀ ≤ (1 + 2R/r)^ρ.

**Checks.**

- ρ = 0: one ball suffices, matching (1 + 2R/r)⁰ = 1.
- ρ = 1, R = r: an interval of length 2r is covered by three r-balls centred in it, and (1 + 2)¹ = 3.
- Centres must lie in the subset: covering by balls with arbitrary centres is the weaker statement, and the counting arguments need centres that are themselves points of the subgroup.

**Needs.** `mathlib:EuclideanSpace`, `mathlib:Metric.closedBall`, `mathlib:MeasureTheory.Measure.addHaar_closedBall`

**Sources.** ggk-2026, §7.1, proof sketch of Theorem 7.1, p. 221: States, as an elementary ball-packing argument, that a subset of a ball of radius R in Γ ⊗ ℝ is covered by at most (1 + 2R/r)^{rk Γ} balls of radius r centred at its elements.; dgh-2021, Proof of Proposition 8.1, p. 34 (arXiv v3): Uses the same covering bound, citing Rémond’s Lemme 6.1, to count points of small height.

## Layer UB.1: Restricted Hilbert schemes and non-degenerate fibred powers

The restricted Hilbert scheme H_{r,d}(A)° of irreducible subvarieties of fixed dimension and degree, its family version over the level-4 moduli of principally polarized abelian varieties, fibred powers X_S^{[m]} with their moduli maps, the lemmas of Gao–Ge–Kühne §3 (finitely many points cut a family; generic finiteness of the moduli map), non-degeneracy of high fibred powers (Proposition 3.4, from Gao’s criterion), the locus S_gen of finite stabilizer and generation, and its closure (Lemma 3.5).

### Restricted Hilbert schemes of a polarized abelian variety

`UB.1/restricted-hilbert-scheme` · construction

Let A be an abelian variety over ℚ̄ with a very ample line bundle L and r, d ≥ 1. Among the finitely many Hilbert polynomials of irreducible r-dimensional subvarieties of L-degree d, the Hilbert schemes of A form a projective scheme H_{r,d}(A) with universal family X_{r,d}(A) ⊆ A × H_{r,d}(A). The locus of points whose fibre is geometrically integral is open; H_{r,d}(A)° is its maximal reduced subscheme. It is a quasi-projective variety whose ℚ̄-points are exactly the irreducible X ⊆ A with dim X = r and deg_L X = d, and for every irreducible component V of H_{r,d}(A) the intersection V ∩ H_{r,d}(A)° is empty or dense open in V.

**Hypotheses.** A abelian over ℚ̄; L very ample; r, d ≥ 1 integers.

**Construction or proof.**

1. Bound the Hilbert polynomials of irreducible subvarieties of fixed dimension and degree (finitely many; AlgebraicModuli R09.1).
2. Take the disjoint union of the corresponding Hilbert schemes (R09.2) with its universal closed family.
3. Geometric integrality of fibres of a proper flat family is an open condition; give the open locus its reduced structure.

**Uses.** Gao–Ge–Kühne, Lemmas 3.1–3.2: finitely many points of A cut a family of subvarieties down to a finite set; Gao–Ge–Kühne, (3.6): the fibres of the family version over a moduli point are these schemes.

**API.**

- `RestrictedHilbert` (data): H_{r,d}(A)° as a reduced quasi-projective ℚ̄-scheme with universal family X_{r,d}(A)° → H_{r,d}(A)°.
- `RestrictedHilbert.points` (characterisation): ℚ̄-points correspond bijectively to irreducible X ⊆ A with dim X = r and deg_L X = d.
- `RestrictedHilbert.universal_flat` (other): The universal family is flat and proper with geometrically integral fibres.
- `RestrictedHilbert.component_dense` (other): For each component V of H_{r,d}(A), V ∩ H_{r,d}(A)° is empty or dense open in V.
- `RestrictedHilbert.translate` (functoriality): Translation by a ∈ A(ℚ̄) acts on H_{r,d}(A)° compatibly with the universal family when L is replaced by t_a^*L.

**Unit tests.**

- `RestrictedHilbert.points_dim0` (degenerate): For r = 0 and d = 1 the points are the points of A (the construction is used only for r ≥ 1, but the r = 0 case is A itself).
- `RestrictedHilbert.whole_variety` (computation): For r = dim A and d = deg_L A the restricted Hilbert scheme is a single reduced point, the class of A.
- `RestrictedHilbert.reducible_excluded` (non-example): In an elliptic surface E × E, the union of two distinct fibres {P} × E and {Q} × E has dimension 1 and degree twice that of a fibre but is not a point of H°: reducible members are excluded.
- `RestrictedHilbert.translates_curve` (computation): For E elliptic and A = E × E, use the very ample bundle (O_E(3·0)) ⊠ (O_E(3·0)). The diagonal has degree 6 and its translates form a one-dimensional family in H_{1,6}(A)°.

**Needs.** `AlgebraicModuliForArithmeticGeometry:R09.2/hilbert-scheme`, `AlgebraicModuliForArithmeticGeometry:R09.1/bounded-degree-hilbert-polynomials`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`

**Sources.** ggk-2026, §3.1, (3.1)–(3.2), pp. 198–199: Defines the Hilbert scheme of subvarieties of fixed dimension and degree of a polarized abelian variety, the open locus of geometrically integral fibres and its reduced structure, and states the density property of its intersection with each component.

### The restricted Hilbert scheme over the moduli of principally polarized abelian varieties

`UB.1/restricted-hilbert-family` · construction

Let π_univ : 𝔄_g → 𝔸_g be the universal principally polarized abelian scheme over the fine moduli space of principally polarized abelian varieties of dimension g with level-4 structure over ℚ̄, and 𝔏_g a symmetric relatively ample line bundle on 𝔄_g/𝔸_g with c₁(𝔏_g|_{A_b}) = 2c₁(L_b) for the principal polarization L_b, so that 𝔏_g^{⊗4} is relatively very ample. For r ≥ 1 and d ≥ 1, H = ⊔_{P∈Ξ} Hilb_P(𝔄_g/𝔸_g) over the finite set Ξ of Hilbert polynomials of r-dimensional subvarieties of 𝔏_g^{⊗4}-degree d is projective over 𝔸_g; the locus with geometrically integral fibre is open, and H° = H_{r,d}(𝔄_g/𝔸_g)° is its maximal reduced subscheme, a quasi-projective ℚ̄-variety with universal family X_{H°} ⊆ A_{H°} = 𝔄_g ×_{𝔸_g} H° → H°. Its ℚ̄-points are the pairs ((A, L), X) with (A, L) principally polarized of dimension g and X ⊆ A irreducible of dimension r and 𝔏_g^{⊗4}-degree d; the fibre of H° → 𝔸_g over b is H_{r,d}(A_b)°.

**Hypotheses.** g ≥ 1, r ≥ 1, d ≥ 1; level-4 structure so that 𝔸_g is a fine moduli scheme.

**Construction or proof.**

1. Import 𝔸_g with its universal abelian scheme from PELModuli M5–M6 (Siegel case, principal polarization, level 4).
2. Choose 𝔏_g as the symmetric rigidified bundle whose fibres are twice the principal polarization (existence from the polarization theory of AbelianSchemesAndArithmeticModuli A2); 𝔏_g^{⊗4} is relatively very ample.
3. Form the relative Hilbert scheme for the finitely many Hilbert polynomials, restrict to the open locus of geometrically integral fibres and reduce.

**Uses.** Gao–Ge–Kühne, Propositions 3.4, 4.2 and 5.2: the families over subvarieties S ⊆ H° carry the height inequality and equidistribution; Gao–Ge–Kühne, Proposition 4.4: each pair ((A, L), X) is a point s of H° with deg_{𝔏_g^{⊗4}} X = 8^r deg_L X.

**API.**

- `RestrictedHilbertFamily` (data): H°_{r,d} with ι_{H°} : H° → 𝔸_g and universal X_{H°} ⊆ A_{H°}.
- `RestrictedHilbertFamily.fibre` (characterisation): ι_{H°}^{-1}(b) = H_{r,d}(A_b)° for every b ∈ 𝔸_g(ℚ̄).
- `RestrictedHilbertFamily.base_change` (functoriality): For a morphism S → H° from a variety, A_S → S is an abelian scheme and X_S ⊆ A_S is a subvariety dominating S.
- `RestrictedHilbertFamily.degree_normalization` (compatibility): For (A, L) principally polarized and X ⊆ A irreducible of dimension r, deg_{𝔏_g^{⊗4}|A} X = 8^r deg_L X (GGK (4.10)).
- `RestrictedHilbertFamily.height_normalization` (compatibility): ĥ_{𝔏_g^{⊗4}|A} = 4 ĥ_{L⊗[−1]^*L} on A(ℚ̄) (GGK (4.12)).

**Unit tests.**

- `RestrictedHilbertFamily.degree_8r` (computation): For an elliptic curve E (g = 1) and X = E (r = 1), deg_L E = 1 for the principal polarization L = O(0) and deg_{𝔏_1^{⊗4}} E = 8.
- `RestrictedHilbertFamily.genus_two_curve` (computation): For g = 2 and the Abel–Jacobi curve C ⊆ Jac(C) (r = 1), deg_Θ C = 2, so C is a point of H°_{1,16}.
- `RestrictedHilbertFamily.not_level_one` (non-example): Without level structure the moduli space is only coarse and carries no universal abelian scheme; the construction requires the fine level-4 moduli space.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-scheme`, `PELModuli:M5/siegel-moduli`, `PELModuli:M6/universal-family-export`, `AlgebraicModuliForArithmeticGeometry:R09.2/hilbert-scheme`, `AbelianSchemesAndArithmeticModuli:A2`

**Sources.** ggk-2026, §3.2, (3.4)–(3.7), pp. 200–201: Introduces the universal abelian variety over the level-4 fine moduli space, the relatively very ample bundle 𝔏_g^{⊗4}, the relative Hilbert scheme with its universal family, the open locus of geometrically integral fibres (the restricted Hilbert scheme) and the fibred-power diagram.

### Fibred powers of the universal subvariety and their moduli maps

`UB.1/fibred-power` · construction

For m ≥ 1 and a morphism S → H° (or S → H_{r,d}(A)°), X_S^{[m]} = X_S ×_S ⋯ ×_S X_S ⊆ A_S^{[m]} = A_S ×_S ⋯ ×_S A_S is the m-fold fibred power, with projection π^{[m]} : X_S^{[m]} → S and moduli map ι^{[m]} : A_S^{[m]} → 𝔄_g^{[m]} to the m-fold fibred power of the universal abelian scheme over 𝔸_g (for a fixed A, the map ι_A^{[m]} to A^m). The fibre over s ∈ S is X_s^m ⊆ A_s^m.

**Hypotheses.** S a variety mapping to H°; m ≥ 1.

**Construction or proof.**

1. Form the fibre products over S of the flat proper universal family; they are flat and proper over S.
2. The moduli map is the base change of ι_{H°} to the fibred powers.

**Uses.** Gao–Ge–Kühne, Lemma 3.3 and Proposition 3.4: generic finiteness of ι^{[m]} on X_S^{[m]} and non-degeneracy; Gao–Ge–Kühne, Proposition 4.2 Case (ii): the height inequality on X_S^{[m]} forces small points into a degeneracy locus.

**API.**

- `FibredPower` (data): X_S^{[m]} ⊆ A_S^{[m]} over S, with π^{[m]} and ι^{[m]}.
- `FibredPower.fibre` (characterisation): (X_S^{[m]})_s = (X_s)^m inside (A_s)^m.
- `FibredPower.flat` (other): π^{[m]} is flat and proper; if fibres of X_S → S are geometrically integral then X_S^{[m]} is irreducible when S is (every component dominates S by openness of flat maps).
- `FibredPower.succ` (relation): X_S^{[m+1]} = X_S^{[m]} ×_S X_S compatibly with ι^{[m+1]} = ι^{[m]} × ι.

**Unit tests.**

- `FibredPower.one` (degenerate): X_S^{[1]} = X_S and ι^{[1]} = ι.
- `FibredPower.point_base` (computation): For S a point s, X_S^{[m]} = X_s^m ⊆ A_s^m.
- `FibredPower.not_absolute_product` (non-example): X_S^{[2]} is the fibre product over S, not the absolute product X_S × X_S: for dim S > 0 they have different dimensions (2 dim X_S − dim S versus 2 dim X_S).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-family`, `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-scheme`

**Sources.** ggk-2026, (3.3), p. 199 and (3.7), p. 201: Defines the fibred powers of the universal family over the restricted Hilbert scheme and the commutative diagram of their projections to the base and maps to the fibred powers of the universal abelian scheme.

### Finitely many points cut a family of subvarieties to a finite set (GGK Lemmas 3.1–3.2)

`UB.1/points-cut-family` · theorem

Let V ⊆ H_{r,d}(A)° be a nonempty, possibly reducible subvariety. (1) There are m₀ = m₀(V) points P₁, …, P_{m₀} ∈ A(ℚ̄) such that {[X] ∈ V(ℚ̄) : P₁, …, P_{m₀} ∈ X} is non-empty and finite. (2) Consequently, for every m ≥ m₀ there is P ∈ A^m(ℚ̄) whose fibre under ι_A^{[m]} restricted to X_{r,d}(A)^{[m]} ×_{H} V is non-empty and finite.

**Hypotheses.** A abelian over ℚ̄ with ample L; V ⊆ H_{r,d}(A)° a nonempty subvariety.

**Construction or proof.**

1. Fix X₀ ∈ V. Induct on the dimension of the family of members through the chosen points: in each positive-dimensional component W of the current family choose a point of X₀ not lying on some X_W ≠ X₀; two distinct irreducible subvarieties of the same dimension and degree do not contain one another, so the dimension drops.
2. At each round choose one such point for every positive-dimensional component of the current parameter locus, keeping X₀ throughout. Each round lowers its maximal positive dimension, so finitely many rounds and finitely many chosen points leave a finite nonempty locus. If it is finite initially, choose one point of X₀ so that m₀ ≥ 1.
3. For m ≥ m₀ set P = (P₁, …, P_{m₀}, P_{m₀}, …, P_{m₀}); the fibre of ι_A^{[m]} over P projects isomorphically onto the finite set of part (1).

**Checks.**

- For V a single point the statement holds with m₀ = 1 and any point of X₀.
- For V the family of translates of an elliptic curve E × {0} in E × E, one point P₁ = (0, b) cuts V down to the single member E × {b}.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-scheme`, `HeightsRationalPointsAndObstructionsPartII:UB.1/fibred-power`

**Sources.** ggk-2026, Lemma 3.1 and proof, p. 199; Lemma 3.2 and proof, pp. 199–200: Chooses points one at a time inside a fixed member to cut down every positive-dimensional component of the family, then pads the tuple to length m to obtain a finite non-empty fibre of the moduli map.

### Generic finiteness of the moduli map on fibred powers (GGK Lemma 3.3)

`UB.1/moduli-map-generically-finite` · theorem

For an irreducible subvariety S ⊆ H° there is m₀ = m₀(S) ≥ 1 such that ι^{[m]} restricted to X_S^{[m]} is generically finite onto its image for every m ≥ m₀.

**Hypotheses.** S ⊆ H° irreducible.

**Construction or proof.**

1. Pick b ∈ ι_{H°}(S)(ℚ̄) and V = (ι_{H°}|_S)^{-1}(b) ⊆ H_{r,d}(A_b)°.
2. The fibre of ι^{[m]}|_{X_S^{[m]}} over P ∈ A_b^m equals the fibre computed in GGK (3.8) for V, so by the preceding lemma some fibre is finite and non-empty.
3. X_S^{[m]} is irreducible (every component dominates S by flatness, and the generic fibre is geometrically irreducible), so upper semicontinuity of fibre dimension gives generic finiteness.

**Checks.**

- If S is a point then X_S^{[m]} = X^m maps isomorphically and m₀ = 1.
- For S the family of all translates of a fixed X (dim S = g), m₀ grows with the number of points needed to pin a translate.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.1/points-cut-family`, `HeightsRationalPointsAndObstructionsPartII:UB.1/fibred-power`, `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-family`

**Sources.** ggk-2026, Lemma 3.3 and proof, p. 202: Deduces generic finiteness from a finite fibre over one point of a fibre of S → 𝔸_g, using irreducibility of X_S^{[m]} from flatness and geometric irreducibility of the fibres.

### Non-degenerate fibred powers over the restricted Hilbert scheme (GGK Proposition 3.4)

`UB.1/nondegenerate-fibred-powers` · theorem

Let S ⊆ H° be irreducible with geometric generic point η, and assume (i) X_η is an irreducible subvariety of A_η, (ii) X_s generates A_s for every s ∈ S(ℂ), (iii) X_η has finite stabilizer. Then there is m₀ = m₀(S) ≥ 1 such that X_S^{[m]} is a non-degenerate subvariety of A_S^{[m]} → S for every m ≥ m₀.

**Hypotheses.** S ⊆ H° irreducible satisfying (i)–(iii).

**Construction or proof.**

1. By the generic finiteness lemma, ι^{[m]}|_{X_S^{[m]}} is generically finite for m ≥ m₀(S).
2. Gao’s non-degeneracy criterion for fibred powers (AbelianSchemesAndArithmeticModuliPartII B4) applies under (i)–(iii) once m ≥ max(m₀, dim S).

**Checks.**

- Hypothesis (iii) cannot be dropped: for X_s = A_s (r = g, stabilizer A_s) and dim S > 0, X_S^{[m]} = A_S^{[m]} has complex dimension mg + dim S while its Betti map takes values in a real torus of dimension 2mg, so it is degenerate for every m.
- The proposition is applied only to the components of the closure of S_gen (GGK Lemma 3.5), where (i)–(iii) hold.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.1/moduli-map-generically-finite`, `HeightsRationalPointsAndObstructionsPartII:UB.1/fibred-power`, `AbelianSchemesAndArithmeticModuliPartII:B4/gao-fibre-power`, `AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate`

**Sources.** ggk-2026, Proposition 3.4 and proof, pp. 202–203: Combines Gao’s criterion for fibred powers with generic finiteness of the moduli map, replacing m₀ by the maximum of m₀ and dim S.

### The locus of finite stabilizer and generation

`UB.1/generic-locus` · definition

For a subvariety S ⊆ H°, S_gen ⊆ S(ℚ̄) is the set of s such that Stab_{A_s}(X_s) is finite and X_s generates A_s (no proper abelian subvariety contains a translate of X_s, equivalently the abelian subvariety generated by X_s − X_s is A_s).

**Hypotheses.** S ⊆ H° a subvariety.

**Construction or proof.**

1. Use the parent’s stabilizers and the abelian subvariety generated by differences.

**Uses.** Gao–Ge–Kühne, Propositions 4.2 and 5.2: the gap principle and uniform Bogomolov are proved for s ∈ S_gen; Gao–Ge–Kühne, Proposition 4.4: X with positive-dimensional stabilizer has empty X°, so only s ∈ H°_gen matter.

**API.**

- `GenericLocus` (data): S_gen as a subset of S(ℚ̄).
- `GenericLocus.mem_iff` (characterisation): s ∈ S_gen iff Stab(X_s) is finite and ⟨X_s − X_s⟩ = A_s.
- `GenericLocus.mono` (functoriality): For S′ ⊆ S, S′_gen = S_gen ∩ S′(ℚ̄).
- `GenericLocus.ueno_empty` (relation): If s ∉ S_gen because Stab(X_s) has positive dimension, then X_s° = ∅.

**Unit tests.**

- `GenericLocus.curve` (computation): For an Abel–Jacobi curve C ⊆ Jac(C) of genus g ≥ 2, the point of H° it defines lies in H°_gen.
- `GenericLocus.abelian_subvariety` (non-example): For X = B a proper abelian subvariety, Stab(X) = B is infinite and X does not generate A, so [B] ∉ H°_gen.
- `GenericLocus.whole` (degenerate): For X = A, the stabilizer is A, so [A] ∉ H°_gen although A generates A.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-family`, `HeightsRationalPointsAndObstructions:RP.5/stabilizer`, `HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety`

**Sources.** ggk-2026, (3.9), p. 203: Defines the subset of points of S at which the member has finite stabilizer and generates the abelian variety.

### Components of the closure of the generic locus satisfy the non-degeneracy hypotheses (GGK Lemma 3.5)

`UB.1/generic-locus-closure` · theorem

For a subvariety S ⊆ H°, each irreducible component S′ of the Zariski closure of S_gen, with its reduced structure, satisfies hypotheses (i)–(iii) of the non-degenerate fibred powers theorem for X_{S′} ⊆ A_{S′} → S′.

**Hypotheses.** S ⊆ H° a subvariety; S′ an irreducible component of the closure of S_gen.

**Construction or proof.**

1. (i): every fibre over H° is geometrically integral.
2. (ii): use the proper difference-sum map X^{[2g]} → A, (x₁,…,x_g,y₁,…,y_g) ↦ Σ(x_i−y_i). Its fibre image equals the abelian subvariety generated by X_s−X_s. Surjectivity holds precisely on the generation locus. The complement of this image in A has open image in S under the smooth structure map, so generation is closed and extends from the dense generic locus.
3. (iii): if Stab(X_η)⁰ were positive-dimensional, spread it out over a quasi-finite dominant S″ → S′; then every fibre over a dense open has positive-dimensional stabilizer, contradicting density of S_gen.

**Checks.**

- If S_gen is empty there are no components and the statement is vacuous.
- The closure is necessary: S_gen itself need not be constructible-open, but its closure’s components carry the hypotheses generically.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.1/generic-locus`, `HeightsRationalPointsAndObstructionsPartII:UB.1/nondegenerate-fibred-powers`, `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-family`

**Sources.** ggk-2026, Lemma 3.5 and proof, p. 203: Checks irreducibility from geometric irreducibility of fibres, generation from closedness of the generation condition in proper families, and finiteness of the generic stabilizer by spreading out its identity component.

## Layer UB.2: The height inequality for non-degenerate subvarieties

Dimitrov–Gao–Habegger’s height inequality ĥ(P) ≥ c₁h(π(P)) − c₂ on a dense open of a non-degenerate subvariety of an abelian scheme: the level hypothesis (Hyp), the cut-off Betti form, the graph construction X_N with F and M, the lower bound (F^d) ≥ κN^{2d}, the upper bound (M·F^{d−1}) ≤ cN^{2(d−1)}, Siu’s criterion on the total space, Theorem 1.6 under (Hyp) and Theorem B.1 in general by seven dévissages.

### The principal polarization and level hypothesis (Hyp)

`UB.2/level-hypothesis` · definition

An abelian scheme π : A → S over a variety satisfies (Hyp) if it carries a principal polarization and a symplectic level-ℓ structure for some ℓ ≥ 3, compatible with the polarization. Then S → 𝔸_{g,ℓ} classifies it, A is the pullback of the universal abelian scheme, and after shrinking S, A admits a closed immersion A → ℙⁿ × S whose generic fibre is projectively normal, obtained from L^{⊗l}, l ≥ 4, for a symmetric ample L on the generic fibre. Extending the embedding over the base may require a twist by a bundle from S.

**Hypotheses.** π : A → S an abelian scheme over an irreducible quasi-projective variety over ℚ̄; for the embedding, S regular, irreducible, quasi-projective and Zariski open in a projective S̄ ⊆ ℙ^m (DGH §1.2 and Remark 3.1).

**Construction or proof.**

1. A principal polarization and a level-ℓ structure with ℓ ≥ 3 give a classifying map to the fine moduli space (PELModuli M5).
2. Choose a projectively normal power of a symmetric ample bundle on the generic fibre (A2), choose a basis there, and spread the resulting immersion and equations to a dense open of S. A base twist extends the projective embedding when required; it does not alter fibrewise Néron–Tate heights (DGH Remark 3.1).

**Uses.** Dimitrov–Gao–Habegger, Theorem 1.6 and §§3–5: the height inequality is first proved under (Hyp); Dimitrov–Gao–Habegger, Theorem B.1, sixth and seventh dévissages: a finite étale base change achieves (Hyp).

**API.**

- `LevelHypothesis` (data): A structure on π : A → S: a principal polarization λ and a symplectic level-ℓ structure, ℓ ≥ 3.
- `LevelHypothesis.classifying` (universal-property): Under (Hyp) there is a unique S → 𝔸_{g,ℓ} with A ≅ the pullback of the universal family.
- `LevelHypothesis.base_change` (functoriality): (Hyp) is preserved by base change S′ → S.
- `LevelHypothesis.after_etale_cover` (other): Every principally polarized abelian scheme acquires (Hyp) after a finite étale base change (adjoin the level-ℓ structure).
- `LevelHypothesis.embedding` (other): After shrinking S, a basis on the generic fibre of L^{⊗l}, l ≥ 4, spreads to A → ℙⁿ × S with projectively normal generic fibre. A base twist may be necessary; no global trivialization of π_*L^{⊗l} is asserted.

**Unit tests.**

- `LevelHypothesis.elliptic` (computation): The Legendre family y² = x(x − 1)(x − λ) over ℙ¹ ∖ {0, 1, ∞} has full level-2 structure but not level ℓ ≥ 3; adjoining 3-torsion gives a finite étale cover satisfying (Hyp) for g = 1.
- `LevelHypothesis.rigid` (characterisation): A principally polarized abelian variety with level-ℓ structure, ℓ ≥ 3, has no non-trivial automorphism preserving both (Serre’s lemma), which is why the moduli space is fine.
- `LevelHypothesis.level_two_fails` (non-example): Level 2 does not suffice: [−1] preserves every level-2 structure, so the moduli problem is not rigid.

**Needs.** `PELModuli:M5/siegel-moduli`, `PELModuli:M6/universal-family-export`, `AbelianSchemesAndArithmeticModuli:A2`

**Sources.** dgh-2021, §1.2, p. 5, and Remark 3.1, p. 13 (arXiv v3): Introduces the hypothesis that the abelian scheme is principally polarized with level-ℓ structure for some ℓ ≥ 3, used in the body of the paper, and the projectively normal symmetric embedding used for the intersection computations.

### The compactly supported cut-off of the Betti form

`UB.2/betti-cutoff` · construction

Let π : A → S satisfy (Hyp) over ℚ̄ ⊆ ℂ, ω the Betti form on A^an (a closed semipositive (1,1)-form, AbelianSchemesAndArithmeticModuliPartII B1), s₀ ∈ S^an, Δ a relatively compact contractible neighbourhood of s₀ and ϑ : S^an → [0, 1] smooth with compact support K ⊆ Δ and ϑ(s₀) = 1. Put θ = ϑ ∘ π. Then θω is a smooth semipositive (1,1)-form on A^an with compact support in π^{-1}(K), not closed in general; it extends by zero to the compactification. For a non-degenerate X one takes s₀ = π(P₀) for a smooth point P₀ of X with (ω|_X)^{∧ dim X}_{P₀} > 0.

**Hypotheses.** (Hyp) holds; S^an is the analytification of the smooth locus used to define ω.

**Construction or proof.**

1. On π^{-1}(Δ) the Betti map trivializes A^an as Δ × (ℝ/ℤ)^{2g}, and ω is the pullback of the standard translation-invariant form (B0–B1).
2. Multiply by θ; semipositivity is pointwise and preserved by multiplication by a nonnegative function; compact support follows from that of ϑ.
3. Extend by zero, choosing the extension of ϑ to the compactification as recorded in source issue E8 of the DGH extraction (a smooth extension that vanishes off K).

**Uses.** Dimitrov–Gao–Habegger, Proposition 4.2: the integral of (θω)^d over X_N bounds the self-intersection F^d from below.

**API.**

- `BettiCutoff` (data): θω as a smooth (1,1)-form with compact support on A^an.
- `BettiCutoff.semipos` (other): θω is semipositive at every point.
- `BettiCutoff.support` (other): supp(θω) ⊆ π^{-1}(K), compact.
- `BettiCutoff.mul_pullback` (relation): [N]^*(θω) = N² θω for N ≥ 1, since [N]^*ω = N²ω and θ is constant along fibres.
- `BettiCutoff.positive_at` (other): If (ω|_X)^{∧d}_{P₀} > 0 and ϑ(π(P₀)) = 1, then ∫_{X} (θω)^{∧d} > 0.

**Unit tests.**

- `BettiCutoff.constant_family` (computation): For a constant family A = A₀ × S, ω is the pullback of the flat Kähler form of A₀ (the Betti map is the projection), and θω = ϑ·ω.
- `BettiCutoff.not_closed` (non-example): θω is not closed when dϑ ≠ 0 on the support of ω: d(θω) = dθ ∧ ω; the proof uses only semipositivity, never closedness of θω.
- `BettiCutoff.mult_two` (compatibility): Pulling back by [2] multiplies θω by 4, matching ĥ([2]P) = 4ĥ(P).

**Needs.** `AbelianSchemesAndArithmeticModuliPartII:B1/betti-form`, `AbelianSchemesAndArithmeticModuliPartII:B1/nonzero-smooth-point`, `HeightsRationalPointsAndObstructionsPartII:UB.2/level-hypothesis`

**Sources.** dgh-2021, §3.2 and Remark 3.3, pp. 14–15 (arXiv v3): Introduces the bump function on the base, the cut-off form θω supported over a compact subset of a contractible neighbourhood, and the choice of base point at a smooth point where the top power of the Betti form is positive.

### The graph construction X_N with the line bundles F and M

`UB.2/graph-construction` · construction

Under (Hyp) with A ⊆ ℙⁿ × S ⊆ ℙⁿ × ℙ^m, let X ⊆ A be closed irreducible dominating S and N ≥ 1. Let X_N = {(P, [N]P) : P ∈ X} ⊆ A ×_S A, viewed in ℙⁿ × ℙⁿ × ℙ^m, and X̄_N its Zariski closure, so dim X̄_N = dim X. Put F = O(0, 1, 1)|_{X̄_N} and M = O(0, 0, 1)|_{X̄_N}. For P_N = (P, [N]P) one has h_{X̄_N, F}(P_N) = h([N]P) + O(1) and h_{X̄_N, M}(P_N) = h(π(P)) + O(1), with O(1) depending on N.

**Hypotheses.** (Hyp); X ⊆ A closed irreducible dominating S; N ≥ 1.

**Construction or proof.**

1. The graph of [N] is closed in A ×_S A; restrict to X and close up in the projective triple product.
2. Heights for O(0,1,1) and O(0,0,1) restricted to X̄_N are, by the height machine (parent RP.0), the Weil heights of the projections up to bounded functions.

**Uses.** Dimitrov–Gao–Habegger, Propositions 4.1–4.3: the self-intersection (F^d) and mixed intersection (M·F^{d−1}) on X̄_N are compared, and Siu’s criterion gives sections of F^{⊗q} ⊗ M^{⊗−q c N²}.

**API.**

- `GraphConstruction` (data): X̄_N ⊆ ℙⁿ × ℙⁿ × ℙ^m with F and M.
- `GraphConstruction.dim` (other): dim X̄_N = dim X.
- `GraphConstruction.height_F` (relation): h_F(P_N) = h([N]P) + O_N(1) on X_N(ℚ̄).
- `GraphConstruction.height_M` (relation): h_M(P_N) = h(π(P)) + O_N(1).
- `GraphConstruction.nef` (other): F and M are nef on X̄_N (restrictions of globally generated bundles).

**Unit tests.**

- `GraphConstruction.N_one` (degenerate): For N = 1, X̄_1 is the closure of the diagonal copy of X and F restricts to O(1, 1) on X.
- `GraphConstruction.constant_point` (computation): For a constant family and X a constant section {P₀} × S with P₀ torsion of order dividing N, X_N lies in {P₀} × {0} × S.
- `GraphConstruction.closure_needed` (non-example): X_N itself is not projective when S is not; intersection numbers are taken on the closure X̄_N.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.2/level-hypothesis`, `HeightsRationalPointsAndObstructions:RP.0`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`

**Sources.** dgh-2021, §3.3, (3.3)–(3.5), p. 15 (arXiv v3): Defines the graph of multiplication by N restricted to X, its closure in a triple product of projective spaces, and the line bundles F and M whose heights are the naive height of [N]P and of π(P).

### Lower bound for the top self-intersection (DGH Proposition 4.2)

`UB.2/top-self-intersection-lower` · theorem

Under (Hyp), let X ⊆ A be closed irreducible of dimension d dominating S, with a smooth point of X^an at which (ω|_X)^{∧d} > 0. There is κ > 0, independent of N, such that (F^{·d}) ≥ κ N^{2d} on X̄_N for every N ≥ 1.

**Hypotheses.** (Hyp); X closed irreducible, dim X = d, dominant over S, with a smooth point where the top power of ω|_X is positive.

**Construction or proof.**

1. Choose a Fubini–Study representative α of O(1,1) on A and C > 0 with C·θα − θω ≥ 0 on A_Δ (compactness of K).
2. Pull back by [N]: C·[N]^*(θα) − N²θω is semipositive, so by the semipositive wedge inequality (C·[N]^*(θα))^{∧d} ≥ N^{2d}(θω)^{∧d} on X ∩ A_Δ.
3. Integrate over X; the left side is bounded by C^d times the intersection number of F on X̄_N (ComplexComparisonPartII C5, the DGH integration contract), the right side is N^{2d} times a positive constant by the choice of P₀.

**Checks.**

- For a degenerate X, for instance a constant section of a constant family (d = dim S), the integral of (θω)^d vanishes and no such κ exists.
- The exponent is 2d, the total dimension count: the height of [N]P grows like N², and F has d factors.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.2/graph-construction`, `HeightsRationalPointsAndObstructionsPartII:UB.2/betti-cutoff`, `ComplexComparisonPartII:C5/dgh-integration-application`, `ComplexComparisonPartII:C5/semipositive-wedge`

**Sources.** dgh-2021, Proposition 4.2 and proof, pp. 17–19 (arXiv v3): Proves the N^{2d} lower bound for the self-intersection of F on the graph closure by comparing a Fubini–Study form with the cut-off Betti form, pulling back by [N], and integrating over the graph.

### Upper bound for the mixed intersection (DGH Proposition 4.3)

`UB.2/mixed-intersection-upper` · theorem

With A presented by the projectively normal symmetric embedding of (Hyp) (l ≥ 4) and X ⊆ A closed irreducible of dimension d ≥ 1 dominating S, there is c > 0 depending on the data such that (M·F^{·(d−1)}) ≤ c N^{2(d−1)} on X̄_N for every N a power of 2.

**Hypotheses.** Projectively normal symmetric embedding with l ≥ 4; X dominant over S, dim X = d ≥ 1; N = 2^k.

**Construction or proof.**

1. Write [2^k] by iterating the bihomogeneous quartic formulas for duplication (parent RP.0, duplication by quartics); the coordinates of [N]P are forms of degree 4^k = N² in P with base-dependent coefficients of bounded degree D′.
2. X̄_N lies in the intersection of hypersurfaces of these degrees; Fulton’s refined Bézout and positivity bound the mixed degree (M·F^{d−1}) by a constant times (4^k max{1, D′})^{d−1}.
3. Use max{1, D′} in place of D′ in the displayed estimate (4.13) (source issue E9 of the DGH extraction: as printed the bound fails when D′ = 0).

**Checks.**

- The exponent 2(d − 1) is one less than in the lower bound, which is what allows Siu’s criterion to produce sections of F^{⊗q} ⊗ M^{⊗ −qcN²}.
- For d = 1 the bound says (M) on the curve X̄_N is bounded independently of N, as M is pulled back from the base and X̄_N → π(X) has degree independent of N.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.2/graph-construction`, `HeightsRationalPointsAndObstructions:RP.0/duplication-by-quartics`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`, `SchemeAndStackFoundations:SF.5`

**Sources.** dgh-2021, Proposition 4.3 and proof, pp. 19–21 (arXiv v3): Cuts out the graph closure by iterated quartic duplication formulas and bounds the mixed intersection number by Fulton’s positivity, using dominance of X over S but neither (Hyp) nor the Betti form.

### Height inequality on the total space (DGH Proposition 4.1)

`UB.2/height-inequality-total-space` · theorem

Under (Hyp), let X ⊆ A be closed irreducible of dimension d dominating S, with a smooth point of X^an at which (ω|_X)^{∧d} > 0. There is c₁ > 0 such that for every N a power of 2 there are a Zariski open dense U_N ⊆ X and c₂(N) with h([N]P) ≥ c₁N²h(π(P)) − c₂(N) for all P ∈ U_N(ℚ̄).

**Hypotheses.** (Hyp); X closed irreducible, dimension d, dominant over S; a smooth point with positive top Betti form.

**Construction or proof.**

1. For d ≥ 1 choose a rational c₁ > 0 with c₁ c d < κ, and a positive integer q divisible by its denominator. The case d = 0 is immediate.
2. The lower and upper intersection bounds imply F^d > d·c₁N²·(M·F^{d−1}). Siu’s nef-difference bound (RP.5) makes F^{⊗q} ⊗ M^{⊗(−qc₁N²)} big. Replacing q by a multiple gives a nonzero section, with all tensor exponents integral.
3. Heights are bounded below off the base locus of that section (parent RP.0); translate through the graph heights h_F and h_M to get h([N]P) ≥ c₁N²h(π(P)) − c₂(N) on the complement U_N.

**Checks.**

- c₁ does not depend on N; only U_N and c₂ do.
- The inequality fails on torsion sections of a non-constant elliptic family over a curve: ĥ = 0 while h(π(P)) is unbounded; such a section is a degenerate subvariety and is excluded by the Betti-form hypothesis.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.2/top-self-intersection-lower`, `HeightsRationalPointsAndObstructionsPartII:UB.2/mixed-intersection-upper`, `HeightsRationalPointsAndObstructionsPartII:UB.2/graph-construction`, `HeightsRationalPointsAndObstructions:RP.5`, `HeightsRationalPointsAndObstructions:RP.0/height-positivity-base-locus`

**Sources.** dgh-2021, Proposition 4.1, p. 16; proof §4.3, pp. 21–22 (arXiv v3): Deduces the height inequality from the two intersection bounds by Siu’s criterion: a power of F twisted by a negative multiple of M has a non-zero section, and heights are bounded below off its base locus.

### The height inequality under (Hyp) (DGH Theorem 1.6)

`UB.2/height-inequality-level` · theorem

Let S be a regular irreducible quasi-projective variety over ℚ̄, Zariski open in S̄ ⊆ ℙ^m, and π : A → S an abelian scheme satisfying (Hyp), presented by A → ℙⁿ × S from L^{⊗l}, l ≥ 4, with L symmetric ample on the generic fibre. If X ⊆ A is closed irreducible over ℚ̄, dominates S and is non-degenerate, there are c₁ > 0, c₂ ≥ 0 and a Zariski open dense U ⊆ X with ĥ_A(P) ≥ c₁h(π(P)) − c₂ for all P ∈ U(ℚ̄), where ĥ_A is the fibrewise Néron–Tate height of the embedding bundle.

**Hypotheses.** S regular irreducible quasi-projective over ℚ̄; (Hyp); X closed irreducible, dominant, non-degenerate.

**Construction or proof.**

1. Non-degenerate means full Betti rank somewhere, equivalently (ω|_X)^{∧d} ≠ 0 at a smooth point over S^sm (AbelianSchemesAndArithmeticModuliPartII B1).
2. Silverman–Tate (parent RP.0): |ĥ(Q) − h(Q)| ≤ c₀ max{1, h(π(Q))}.
3. Apply the total-space inequality to [N]P and divide by N² = ĥ([N]P)/ĥ(P): ĥ(P) ≥ (c₁ − c₀/N²)h(π(P)) − (c₂(N) + c₀)/N²; fix N a power of 2 with N² ≥ 2c₀/c₁ (killing the Zimmer constant).

**Checks.**

- For S a point the statement is trivial (h(π(P)) is constant).
- A torsion section of a non-isotrivial elliptic scheme over a curve is degenerate, and on it ĥ = 0 while h(π(P)) is unbounded, so non-degeneracy cannot be dropped.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.2/height-inequality-total-space`, `HeightsRationalPointsAndObstructions:RP.0/silverman-tate`, `AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate`, `AbelianSchemesAndArithmeticModuliPartII:B1/dgh-22`

**Sources.** dgh-2021, Theorem 1.6, pp. 4–5; proof §5, pp. 22–23 (arXiv v3): States the height inequality for non-degenerate dominant subvarieties under (Hyp) and proves it from the total-space inequality and Silverman–Tate, fixing a power of 2 large enough to absorb the Silverman–Tate error.

### DGH height inequality in Weil-height form: comparison with the adelic export

`UB.2/height-inequality` · comparison

Let π : A → S be an abelian scheme over an irreducible quasi-projective variety S over ℚ̄, L a symmetric relatively ample line bundle on A/S and M an ample line bundle on a projective compactification S̄ of S. If X ⊆ A is an irreducible (not necessarily closed) non-degenerate subvariety over ℚ̄, there are c₁ > 0, c₂ ≥ 0 and a Zariski open dense U ⊆ X with ĥ_{A,L}(P) ≥ c₁ h_{S̄,M}(π(P)) − c₂ for all P ∈ U(ℚ̄). This is the abelian-scheme Weil-height specialization of AH.5/non-degenerate-height-inequality, compared here with the geometric level-case construction of UB.2; it is not a second owner of the general dynamical inequality.

**Hypotheses.** S irreducible quasi-projective over ℚ̄; L symmetric relatively ample; M ample on a compactification; X irreducible non-degenerate.

**Construction or proof.**

1. Import the general dynamical theorem from AH.5 with f=[2] and its invariant adelic extension. Spread the finitely many data over a number field, identify its fibrewise canonical height with the Néron–Tate height (RP.0), and identify Betti non-degeneracy with adelic non-degeneracy (AH.5). The remaining steps give the geometric comparison route from the level case, not another ownership claim for the general theorem.
2. Replace X by its closure and S by the closure of π(X) (dévissages 1–2), keeping non-degeneracy by birational invariance of the generic Betti rank (B0); choose the base point over the regular locus as in source issue E15 of the DGH extraction.
3. Restrict to the regular locus of S (dévissage 3).
4. Over the function field A is isogenous to a principally polarized abelian variety (Mumford §23); spread the isogeny over a dense open and compare Néron–Tate heights (dévissages 4–5).
5. Adjoin a level-ℓ structure, ℓ ≥ 3, after a finite étale base change, using quasi-sections (SchemeAndStackFoundations SF.0) and that heights and non-degeneracy are preserved (dévissage 6).
6. Apply the (Hyp) case with ĥ_{A,L} comparable to ĥ_A for the embedding bundle (generic independence of fibre heights, parent RP.0), and compare h_{S̄,M} with the restriction of the Weil height (dévissage 7). The count of dévissages and of extra hypotheses follows source issue E5 of the DGH extraction (seven steps; (Hyp) is conditions (v)–(vi)).

**Checks.**

- Theorem B.1 restricted to a curve S and a non-generically-special X recovers Gao–Habegger’s Theorem 1.4 on X* (see the geometric Bogomolov layer).
- The Yuan–Zhang height inequality for non-degenerate subvarieties of polarized dynamical systems (ArakelovGeometryAndAbelianHeightsPartII AH.5) specializes to this statement for A → S with f = [2]; the two proofs are independent (geometric intersection theory here, adelic volumes there).
- X need not be closed: a non-degenerate open subset of a closed X gives the same inequality on a smaller U.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.2/height-inequality-level`, `HeightsRationalPointsAndObstructionsPartII:UB.2/level-hypothesis`, `SchemeAndStackFoundations:SF.0/quasi-sections`, `HeightsRationalPointsAndObstructions:RP.0/fibrewise-height-model-independence`, `AbelianSchemesAndArithmeticModuliPartII:B0/birational-betti-rank`, `AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate`, `AbelianSchemesAndArithmeticModuli:A2`, `ArakelovGeometryAndAbelianHeightsPartII:AH.5/non-degenerate-height-inequality`, `ArakelovGeometryAndAbelianHeightsPartII:AH.5/non-degenerate`

**Sources.** dgh-2021, Theorem B.1 and proof, pp. 40–47 (arXiv v3): States the height inequality without (Hyp) and without closedness, and reduces it to Theorem 1.6 by successive dévissages: closure, dominance, regular base, isogeny to a principally polarized scheme, principal polarization, level structure after a finite étale base change.; ggk-2026, (4.6), p. 206: Quotes the height inequality for non-degenerate subvarieties of families over the restricted Hilbert scheme.

## Layer UB.3: Equidistribution in families and uniform Bogomolov

The equilibrium measure of a non-degenerate subvariety (top power of the Betti form), Kühne’s equidistribution of small generic points in families in the uniform (δ, Z) form, the family Ullmo–Zhang argument over the restricted Hilbert scheme (GGK Proposition 5.2), uniform Bogomolov with an exceptional set (Proposition 5.1), the uniform Bogomolov theorem for all irreducible subvarieties (Theorem 1.3, repaired), and uniform Manin–Mumford for curves (Kühne Theorem 2; DGH Theorem 1.4 without dependence on the degree).

### The equilibrium measure of a non-degenerate subvariety

`UB.3/betti-equilibrium-measure` · construction

Let π : A → S be a polarized abelian scheme over a smooth irreducible quasi-projective variety over a number field K ⊆ ℂ, and X ⊆ A a non-degenerate irreducible subvariety of dimension d dominating S. The top power (β|_{X^{sm}})^{∧d}, extended by zero, is a nonzero positive Radon measure, where β is Kühne’s semipositive closed form, proportional to the Betti form. The invariant adelic extension supplies its canonical normalization (AH.5). When X admits a generic sequence of height tending to zero, Kühne Theorem 1 and Lemma 25 identify the equidistribution measure as μ_X = κ_X^{-1}(β|_X)^{∧d}, with κ_X the positive finite normalized graph-degree limit. Convergence is against compactly supported tests; this formulation asserts no total mass at the boundary.

**Hypotheses.** A → S abelian scheme over a smooth irreducible base; X ⊆ A irreducible, non-degenerate, dominant.

**Construction or proof.**

1. Restrict the semipositive closed Betti form to the smooth locus of X and take its top power; it is a positive smooth measure on X^{sm}(ℂ), non-zero by non-degeneracy (B1).
2. Extend by zero across the singular locus (Lelong integration over analytic cycles, ComplexComparisonPartII C5).
3. Import the canonical measure from AH.5 and its Betti-form comparison. Under the generic-small-sequence hypothesis of Kühne Theorem 1, use Lemma 25 to identify its scalar with κ_X^{-1}; β is proportional to the Betti form by Lemmas 7–8.

**Uses.** Gao–Ge–Kühne, Proposition 5.2, Steps 2–4: the measures μ₁ on X^{[m(M+2)]} and the pullback of μ₂ on its difference image are shown not proportional; Kühne, Theorem 1: the limit of Galois orbits of small generic sequences.

**API.**

- `BettiEquilibriumMeasure` (data): μ_X as a positive Radon measure on X(ℂ).
- `BettiEquilibriumMeasure.ne_zero` (other): μ_X ≠ 0 for non-degenerate X.
- `BettiEquilibriumMeasure.smooth_density` (characterisation): On X^{sm}(ℂ) over S^{sm}, μ_X = κ_X^{-1}(β|_X)^{∧d}, a positive constant multiple of (ω|_X)^{∧d}.
- `BettiEquilibriumMeasure.vanish_kernel` (relation): μ_X vanishes at a smooth point where the Betti map restricted to X is not of full rank (kernel identity of B1).
- `BettiEquilibriumMeasure.product` (functoriality): For the product polarization on A₁ ×_S A₂ the Betti form is pr₁^*β₁ + pr₂^*β₂. On a non-degenerate product subvariety of dimension e, its equilibrium measure is the e-th power of this restricted form with the canonical scalar. This does not assert an unspecified product measure on S.
- `BettiEquilibriumMeasure.compare_canonical` (compatibility): At an archimedean place, μ_X is proportional to the canonical measure c₁(L̄_{[2]}|_X)^{∧d} of the invariant adelic extension (ArakelovGeometryAndAbelianHeightsPartII AH.5).

**Unit tests.**

- `BettiEquilibriumMeasure.single_abelian_variety` (compatibility): For S a point and X = A, μ_A is a positive multiple of Haar measure on A(ℂ), and the equidistribution theorem specializes to Szpiro–Ullmo–Zhang (whose limit is the normalized Haar measure).
- `BettiEquilibriumMeasure.torsion_section_degenerate` (non-example): For a torsion section X of an elliptic scheme over a curve, (ω|_X) vanishes identically, X is degenerate and no equilibrium measure is defined.
- `BettiEquilibriumMeasure.non_torsion_section` (computation): For a non-torsion section of a non-isotrivial elliptic scheme over a curve (DeMarco–Mavraki), the measure is the pullback of the flat form by the section, a positive measure on the base curve.

**Needs.** `AbelianSchemesAndArithmeticModuliPartII:B1/betti-form`, `AbelianSchemesAndArithmeticModuliPartII:B1/betti-form-kernel`, `AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate`, `ComplexComparisonPartII:C5/analytic-cycle-integration`, `ArakelovGeometryAndAbelianHeightsPartII:AH.5`

**Sources.** kuhne-2021, Theorem 1, p. 3; Lemmas 7–8, pp. 17–21; Lemma 25, p. 38 (arXiv v4): Constructs, for a non-degenerate subvariety, the limiting measure of Galois orbits of small generic points and identifies it with a multiple of the top exterior power of the Betti form.; ggk-2026, §5.1, Step 2, p. 213: Uses that the equilibrium measures of the non-degenerate subvarieties X^{[m(M+2)]} and D(X^{[m(M+2)]}) are proportional to the top powers of the Betti forms.

### Equidistribution in families of abelian varieties (Kühne)

`UB.3/family-equidistribution` · theorem

Let π : A → S be an abelian scheme over a smooth irreducible quasi-projective variety over a number field, L a symmetric relatively ample line bundle and X ⊆ A a non-degenerate irreducible subvariety dominating S, with equilibrium measure μ_X at an archimedean place. For every continuous compactly supported f on X(ℂ) and every ε > 0 there are δ > 0 and a proper Zariski closed Z ⊊ X such that |∫ f dμ_X − (1/#O(x)) Σ_{y ∈ O(x)} f(y)| < ε for every x ∈ (X ∖ Z)(ℚ̄) with ĥ_L(x) < δ, where O(x) is the Galois orbit of x. Equivalently, the Galois orbits of every X-generic sequence (x_i) with ĥ_L(x_i) → 0 converge weakly to μ_X on compactly supported test functions.

**Hypotheses.** S smooth irreducible quasi-projective over a number field; X non-degenerate irreducible dominant; test functions continuous with compact support.

**Construction or proof.**

1. Generic-sequence form: by the Yuan–Zhang theorem for non-degenerate subvarieties of the polarized dynamical system (A, [2], L) (ArakelovGeometryAndAbelianHeightsPartII AH.5, part (2)), Galois orbits of a generic sequence with ĥ_L → 0 equidistribute for the canonical measure of L̄_{[2]}|_X.
2. Identify the canonical measure with μ_X at archimedean places (BettiEquilibriumMeasure.compare_canonical): the curvature form of the invariant metric on L is the Betti form (Kühne Lemma 25; Yuan–Zhang §6.2.2).
3. Uniform form: if no (δ, Z) existed for some f, ε, choose x_i with ĥ(x_i) < 1/i avoiding the first i members of an enumeration of proper closed subsets defined over the number field and violating the estimate; this sequence is generic, contradicting the generic form.
4. Kühne’s own proof (DGH height inequality, arithmetic intersection on compactified models, a family version of Zhang’s variational argument) is an alternative route that avoids adelic line bundles on quasi-projective varieties.

**Checks.**

- For S a point and X=A, this is Szpiro–Ullmo–Zhang equidistribution with Haar probability measure (parent RP.5). For a general X the canonical measure is the normalized restricted curvature power, not ambient Haar measure.
- Compact support of f is necessary: mass of Galois orbits may escape to the boundary of S, so test functions on the non-compact X(ℂ) must have compact support.
- Non-degeneracy is necessary: a torsion section of an elliptic scheme over a curve has ĥ = 0 at every point and Galois orbits of its points accumulate according to the base, not to a Betti measure.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.3/betti-equilibrium-measure`, `ArakelovGeometryAndAbelianHeightsPartII:AH.5/non-degenerate-height-inequality`, `ArakelovGeometryAndAbelianHeightsPartII:AH.5/non-degenerate`, `ArakelovGeometryAndAbelianHeightsPartII:AH.5/invariant-extension`, `HeightsRationalPointsAndObstructionsPartII:UB.2/height-inequality`

**Sources.** kuhne-2021, Theorem 1, p. 3; proof §3, pp. 28–38 (arXiv v4): Proves that Galois orbits of small generic sequences on a non-degenerate subvariety of a family of abelian varieties equidistribute to a measure on compactly supported continuous test functions.; ggk-2026, §5.1, Steps 2 and 4, pp. 213–215: Uses the theorem in the uniform form with δ and an exceptional proper closed subset, citing Kühne Theorem 1 and noting that Yuan–Zhang Theorem 6.7 and Gauthier give it too.

### Uniform Bogomolov over the restricted Hilbert scheme (GGK Proposition 5.2)

`UB.3/family-uniform-bogomolov` · theorem

Let S ⊆ H° = H°_{r,d}(𝔄_g/𝔸_g) be a subvariety over ℚ̄ and 𝓛 = ι^*𝔏_g^{⊗4}. There are c″₂, c″₃ > 0 depending on r, d and S such that for every s ∈ S_gen the set {x ∈ X_s°(ℚ̄) : ĥ_𝓛(x) ≤ c″₃} lies in a proper Zariski closed X′ ⊊ X_s with deg_{𝓛_s} X′ < c″₂.

**Hypotheses.** S ⊆ H° a subvariety over ℚ̄; s ranges over S_gen.

**Construction or proof.**

1. Induct on dim S; decompose into irreducible components and pass to the components S′ of the closure of S_gen, which satisfy the non-degeneracy hypotheses.
2. Step 1: choose m with X_{S′}^{[m]} non-degenerate and M with the generic fibre of the difference map D₀ on X^{m(M+1)} an orbit of the finite stabilizer (Zhang’s difference lemma, parent RP.5); X^{[m(M+2)]} and its image under D = (id, D₀) are non-degenerate (B4 difference product).
3. Step 2: with μ₁ the equilibrium measure of X^{[m(M+2)]} and μ₂ that of its D-image, D^*μ₂ vanishes at a diagonal point (z, Δ_z) where μ₁ does not (the differential of D has a kernel there), so μ₁ and ν = (1/d_D) D^*μ₂ are not proportional on the finite étale locus of D (source issue E17 of the GGK extraction: compare μ₁ with ν, keep μ₂ in its original normalization).
4. Step 3: choose f₁ compactly supported in the étale locus separating μ₁ from ν; average over the stabilizer group so that f₁ = f₂ ∘ D.
5. Step 4: by family equidistribution applied to both subvarieties, every point x of X^{[m(M+2)]} outside a proper closed subset has ĥ(x) ≥ δ or ĥ(D(x)) ≥ δ; use small-height hypotheses in both orbit estimates (source issue E16) and keep the ≥ alternative.
6. Step 5: if many small points of X_s° existed, their m(M+2)-fold products would land in the exceptional closed subset; the product-set lemma bounds the resulting proper X′ ⊊ X_s in degree, and the induction hypothesis handles the lower-dimensional strata of S. The block indices and degree normalizations follow source issues E6–E7.

**Checks.**

- For dim S = 0 the first three steps are the Ullmo–Zhang proof of the Bogomolov conjecture for one abelian variety (parent RP.5).
- The stabilizer is only assumed finite, not trivial: the averaging of Step 3 over the stabilizer is what handles it.
- The constants depend on S, r and d, not on s.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.3/family-equidistribution`, `HeightsRationalPointsAndObstructionsPartII:UB.3/betti-equilibrium-measure`, `HeightsRationalPointsAndObstructionsPartII:UB.1/nondegenerate-fibred-powers`, `HeightsRationalPointsAndObstructionsPartII:UB.1/generic-locus-closure`, `HeightsRationalPointsAndObstructionsPartII:UB.1/generic-locus`, `HeightsRationalPointsAndObstructionsPartII:UB.1/fibred-power`, `HeightsRationalPointsAndObstructionsPartII:UB.0/product-set-lemma`, `HeightsRationalPointsAndObstructions:RP.5/zhang-difference-lemma`, `HeightsRationalPointsAndObstructions:RP.5/ueno-locus`, `AbelianSchemesAndArithmeticModuliPartII:B4/difference-product`

**Sources.** ggk-2026, Proposition 5.2 and proof, Steps 1–5, pp. 211–217: Runs a family version of the Ullmo–Zhang argument: non-degenerate fibred powers and their difference images, two equilibrium measures shown not to be proportional, a test function constant on fibres of the difference map, a uniform small-height alternative, and noetherian induction with the product-set lemma.

### Uniform Bogomolov with an exceptional set (GGK Proposition 5.1)

`UB.3/uniform-bogomolov-exceptional` · theorem

For positive integers g, l, r, d there are c″₂, c″₃ > 0 depending on g, l, r, d such that for every polarized abelian variety (A, L) over ℚ̄ of dimension g with deg_L A = l and every irreducible X ⊆ A generating A with dim X = r and deg_L X = d, the set {x ∈ X°(ℚ̄) : ĥ_{L⊗[−1]^*L}(x) ≤ c″₃} lies in a proper Zariski closed X′ ⊊ X with deg_L X′ < c″₂.

**Hypotheses.** (A, L) polarized over ℚ̄, dim A = g, deg_L A = l; X irreducible generating A, dim X = r, deg_L X = d.

**Construction or proof.**

1. Principal case: apply the family version with S = H°_{r, 8^r d}, the degree normalization deg_{𝔏_g^{⊗4}|A} X = 8^r d and ĥ_{𝔏_g^{⊗4}|A} = 4ĥ_{L⊗[−1]^*L} (GGK (4.10), (4.12)); if Stab(X) is positive-dimensional then X° = ∅.
2. General polarizations: pass to a principally polarized isogenous (A₀, L₀) through the isogeny u₀ and its quasi-inverse u, rescaling c″₃ by (l/g!)² and the degree bound c″₂ by (l/g!)^{2(r−1)}, exactly as in the deduction of the gap principle for all polarizations (source issue E4 of the GGK extraction records the needed rescaling of the degree constant).

**Checks.**

- The constants do not depend on A, only on g, l, r, d.
- If X does not generate A the statement is applied to X − P inside the abelian subvariety it generates; generation is a hypothesis here, removed in the uniform Bogomolov theorem.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.3/family-uniform-bogomolov`, `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-family`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`

**Sources.** ggk-2026, Proposition 5.1, p. 211; proof sketch §5.2, pp. 217–218: States the uniform Bogomolov bound with an exceptional proper closed subset of bounded degree for arbitrary polarizations and deduces it from the restricted-Hilbert-scheme version as the gap-principle propositions are deduced.

### The uniform Bogomolov theorem (Gao–Ge–Kühne Theorem 1.3)

`UB.3/uniform-bogomolov` · theorem

For positive integers g and d there are c₃ = c₃(g, d) > 0 and c₄ = c₄(g, d) > 0 such that for every polarized abelian variety (A, L) over ℚ̄ of dimension at most g and every irreducible closed X ⊆ A with deg_L X ≤ d (generating A or not), #{P ∈ X°(ℚ̄) : ĥ_{L⊗[−1]^*L}(P) ≤ c₃} < c₄. In the generating case this is GGK Theorem 1.3 as printed; the statement for all X is the form its proof in §8 needs.

**Hypotheses.** (A, L) polarized over ℚ̄ with dim A ≤ g; X ⊆ A irreducible closed with deg_L X ≤ d.

**Construction or proof.**

1. Induct on dim X, with the zero-dimensional case bounded by one point. If the small-point set in X° is empty there is nothing to count; otherwise choose P₀ in that set and set B = ⟨X−X⟩, Y = X−P₀ ⊆ B. Then Y generates B and deg_{L|B} B is bounded in terms of g,d by the parent’s generated-subvariety bound.
2. Apply the exceptional-set theorem to Y ⊆ B. For the symmetric height, ĥ(P−P₀) ≤ 2ĥ(P)+2ĥ(P₀); choosing the final threshold at most one quarter of the exceptional threshold places every original small point into P₀+Y′. Take minima and maxima over the finitely many bounded dimensions and integral degrees involved.
3. The components of P₀+Y′ have smaller dimension and bounded total degree. Apply induction in the original ambient polarized A to each component. A point of X° in a component lies in that component’s Ueno complement, because every positive-dimensional coset in the component also lies in X. Sum the bounds and enlarge c₄ to make the final inequality strict.
4. This repairs both the initial non-generating case and the non-generating exceptional components. In the generating case it recovers GGK Theorem 1.3, whose second constant is c₄ (E1).

**Checks.**

- For X a curve of genus ≥ 2 in its Jacobian (X° = X), the theorem bounds the number of points of height ≤ c₃ uniformly in the curve: this is Kühne’s uniform Bogomolov for curves.
- X° cannot be replaced by X: a positive-dimensional coset contains infinitely many torsion points.
- The bound c₃ is absolute (not scaled by h_Fal(A)); the gap principle is the companion statement with a threshold proportional to max{1, h_Fal(A)}.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.3/uniform-bogomolov-exceptional`, `HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety`, `HeightsRationalPointsAndObstructions:RP.5/ueno-locus`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`

**Sources.** ggk-2026, Theorem 1.3 and (1.4), p. 192; proof §8, pp. 225–226: Theorem 1.3 assumes that X generates A. The node proves its extension to arbitrary irreducible X by the translated, rescaled induction explained in its proof; §8 requires the same stronger induction for exceptional components.; kuhne-2021, Theorem 3, pp. 6–7 (arXiv v4): Proves the case of curves embedded in their Jacobians with level structure.

### Uniform Manin–Mumford for curves (Kühne Theorem 2)

`UB.3/uniform-manin-mumford` · theorem

For each g ≥ 2 there is c(g) ≥ 1 such that for every smooth projective curve C of genus g over ℂ (Kühne Theorem 2), and more generally over any algebraically closed field F of characteristic 0, and every divisor D of degree 1 on C, #(ι_D(C) ∩ Jac(C)_tors) ≤ c(g), where ι_D(q) = [q] − D. This implies Dimitrov–Gao–Habegger Theorem 1.4 — #((C(ℚ̄) − P₀) ∩ Jac(C)_tors) ≤ c(g, d) for curves over number fields of degree ≤ d and P₀ ∈ C(ℚ̄) — with a constant independent of d.

**Hypotheses.** g ≥ 2; C smooth projective of genus g over an algebraically closed field of characteristic 0; D of degree 1.

**Construction or proof.**

1. Over ℚ̄: X = ι_D(C) ⊆ J = Jac(C) is a curve of degree g for the theta polarization, generating J, with X° = X since a curve of genus ≥ 2 contains no positive-dimensional coset.
2. Torsion points have Néron–Tate height 0 ≤ c₃, so the uniform Bogomolov theorem with (g, d) = (g, g) bounds their number by c₄(g, g).
3. Over an arbitrary algebraically closed F of characteristic 0: the torsion points of ι_D(C) are defined over a finitely generated field; specialize to ℚ̄ along a model keeping the curve smooth and the finitely many torsion points distinct (torsion injects under specialization in characteristic 0), as in the specialization step of the uniform Mordell–Lang layer.
4. This also proves DGH Theorem 1.4 with a constant independent of d (DGH’s own constant depends on d), and gives the bound uniform in P₀ that the small-height step of its printed proof lacks (E6). Kühne states Theorem 2 over ℂ; the step over arbitrary F is the specialization argument above (Kühne Theorem 4 with Γ the torsion subgroup gives the same).
5. For extension from ℚ̄ to an arbitrary algebraically closed characteristic-zero field, spread any finite configuration of torsion points with the curve and preserve distinctness and their finite orders on a suitable fibre. A putative violation of the uniform bound has such a finite witness; it is unnecessary to define all torsion points over one finitely generated field.

**Checks.**

- Stoll’s bielliptic genus-2 curve y² = x⁶ + 130x³ + 13 with a Weierstrass base point has 34 torsion points on its image, so c(2) ≥ 34 (DeMarco–Krieger–Ye Remark 1.2).
- No uniform bound on the order of these torsion points exists (DeMarco–Krieger–Ye Proposition 9.2 of the published version).
- For g = 1 the statement is false: every point of an elliptic curve is the image of a degree-one divisor class, and torsion is infinite.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.3/uniform-bogomolov`, `JacobianChallengePartII:JC2/degree-one-closed-immersion`, `JacobianChallengePartII:JC3/twice-theta`, `HeightsRationalPointsAndObstructions:RP.5/ueno-locus`, `HeightsRationalPointsAndObstructions:RP.5/manin-mumford`

**Sources.** kuhne-2021, Theorem 2, p. 6 (arXiv v4): States the uniform bound, depending only on the genus, for torsion points on a curve embedded in its Jacobian by a degree-one divisor.; yuan-2026, §1.1, p. 4 (author manuscript 21 August 2024): Records that the threshold-zero case of the new gap principle is a uniform Manin–Mumford theorem for curves, and that DeMarco–Krieger–Ye had treated a family of genus-two curves.; dgh-2021, Theorem 1.4, p. 3 and its proof p. 36 (arXiv v3): States uniform Manin–Mumford for curves of bounded field degree, with a constant depending on the genus and the degree; the small-height case of its proof needs a bound uniform in the base point (source issue E6 of the DGH extraction).

## Layer UB.4: The new gap principle

Uniform degree and height bounds for Abel–Jacobi curves (DGH Lemma 6.1), the base-point bound (Lemma 6.4), the Néron–Tate distance proposition for curves of large modular height (Proposition 7.1), the family height gap over the restricted Hilbert scheme (GGK Proposition 4.2), its principally polarized and general-polarization forms (Propositions 4.4, 4.1), the fixed-degree gap principle (Proposition 6.1), the new gap principle (Theorem 1.2) and its curve case.

### Uniform degree and height of Abel–Jacobi curves (DGH Lemma 6.1)

`UB.4/abel-jacobi-bounds` · theorem

Fix g ≥ 2, a level ℓ ≥ 3, the fine moduli space M_g of smooth genus-g curves with level-ℓ structure over ℚ̄ with universal curve C_g, the Torelli map τ : M_g → A_g to the fine Siegel moduli space with universal abelian scheme 𝔄_g ⊆ ℙⁿ × A_g, and an ample M on a compactification of A_g. There is c such that for all s ∈ M_g(ℚ̄): (i) deg(C_s − P) ≤ c for every P ∈ 𝔄_{g,τ(s)}(ℚ̄); (ii) some P_s ∈ C_s(ℚ̄) satisfies h(C_s − P_s) ≤ c·max{1, h_{A_g,M}(τ(s))}, where h is the height of a subvariety of ℙⁿ.

**Hypotheses.** g ≥ 2; level ℓ ≥ 3; fine moduli; projective immersion of the universal abelian scheme; M ample on a compactification.

**Construction or proof.**

1. The curves C_s − P, s ∈ M_g, P ∈ 𝔄_{g,τ(s)}, form one algebraic family over 𝔄_g ×_{A_g} M_g; degrees of fibres of a family are bounded (constructibility and Bézout), giving (i).
2. Choose an étale quasi-section of C_g → M_g (SchemeAndStackFoundations SF.0, EGA IV 17.16.3(ii)); over each piece of a finite stratification the point P_s is given by a morphism, so its height is ≤ c max{1, h(τ(s))} by the height machine.
3. C_s − P_s is a component of an intersection of the universal family with fixed hypersurfaces through the moduli point; arithmetic Bézout (parent RP.5, projective cycle heights) bounds its height linearly in the height of the point.

**Checks.**

- The constant does not depend on s; only (ii) depends on the moduli height.
- For P arbitrary the height of C_s − P can be arbitrarily large (translate by points of large height), so (ii) chooses P_s.

**Needs.** `StableReductionPartII:MC.7/consumer-dgh`, `JacobianChallengePartII:JC7/universal-level-jacobian`, `SchemeAndStackFoundations:SF.0/quasi-sections`, `HeightsRationalPointsAndObstructionsPartII:UB.0/chow-height`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`, `HeightsRationalPointsAndObstructions:RP.5`

**Sources.** dgh-2021, Lemma 6.1 and proof, pp. 25–26 (arXiv v3): Proves the uniform degree bound for translates of the curves in the universal Jacobian and a linear bound in the moduli height for the height of a suitable translate, by a quasi-section of the universal curve, constructibility of images, Bézout and Philippon’s arithmetic Bézout theorem.

### Few base points force a proper subvariety (DGH Lemma 6.4)

`UB.4/base-point-bound` · theorem

Let A be an abelian variety over ℚ̄, C ⊆ A a smooth curve of genus g ≥ 2, M ≥ 1, D_M : C^{M+1} → A^M the Faltings–Zhang map (P₀, …, P_M) ↦ (P₁ − P₀, …, P_M − P₀) and Z ⊊ D_M(C^{M+1}) an irreducible proper closed subset. Then #{P ∈ C(ℚ̄) : (C − P)^M ⊆ Z} ≤ 84(g − 1).

**Hypotheses.** C ⊆ A smooth curve of genus g ≥ 2; Z ⊊ D_M(C^{M+1}) irreducible proper closed.

**Construction or proof.**

1. The proper image D_M(C^{M+1}) is irreducible of dimension at most M+1. Thus its proper irreducible subset Z has dimension at most M. If any (C−P)^M lies in Z, both have dimension M and are equal. There is no case dim Z > M.
2. Then C − P₀ = C − P₁, so P₁ − P₀ stabilizes C − P₀, and translation by it is an automorphism of the curve.
3. The stabilizer of a genus-≥ 2 curve is finite and embeds in Aut(C), of order at most 84(g − 1) (Hurwitz).

**Checks.**

- The bound is independent of A, M and Z.
- For an elliptic curve (g = 1) every point stabilizes C − P and the lemma fails; genus ≥ 2 is used through finiteness of the stabilizer.

**Needs.** `HeightsRationalPointsAndObstructions:RP.5/faltings-zhang-map`, `HeightsRationalPointsAndObstructions:RP.5/stabilizer`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-11-automorphisms-and-the-hurwitz-bound`

**Sources.** dgh-2021, Lemma 6.4 and proof, pp. 28–29 (arXiv v3): Shows that two base points with (C − P)^M in the same irreducible proper closed subset differ by a point stabilizing a translate of C, which acts as an automorphism, and concludes with the Hurwitz bound.

### Néron–Tate distance between points on curves (DGH Proposition 7.1)

`UB.4/neron-tate-distance` · theorem

With M_g, τ, 𝔄_g and M as in the Abel–Jacobi bounds, for each irreducible closed S ⊆ M_g over ℚ̄ there are c₁, c₂, c₃, c₄ > 0 such that for every s ∈ S(ℚ̄) with h_{A_g,M}(τ(s)) ≥ c₁ there is a set Ξ_s ⊆ C_s(ℚ̄) with #Ξ_s ≤ c₂ such that every P ∈ C_s(ℚ̄) satisfies either P ∈ Ξ_s or #{Q ∈ C_s(ℚ̄) : ĥ(Q − P) ≤ h_{A_g,M}(τ(s))/c₃} < c₄.

**Hypotheses.** S ⊆ M_g irreducible closed; s with large modular height.

**Construction or proof.**

1. Induct on dim S. Gao’s theorem (AbelianSchemesAndArithmeticModuliPartII B4, DGH Theorem 6.2) makes D_M(C_S^{[M+1]}) non-degenerate for M = 3g − 2; the height inequality gives c > 0 and a proper closed exceptional set Z_S with Σ ĥ(P_i − P₀) ≥ c h(τ(s)) − c′ off Z_S.
2. If (C_s − P)^M ⊄ Z_s, at least one of M points close to P escapes Z_s once there are c₄ such points (the escape lemma); the inequality then forces ĥ(Q − P) > h(τ(s))/c₃ with c₃ = 2M/c for one of them.
3. The base points P with (C_s − P)^M ⊆ Z_s number at most 84(g − 1) per component (the base-point bound): they form Ξ_s, of bounded size; the lower-dimensional part of Z_S over a proper closed subset of S is handled by induction.

**Checks.**

- The threshold h/c₃ grows with the modular height, unlike the uniform Bogomolov threshold, which is absolute.
- Below the modular height bound c₁ the proposition says nothing; the uniform Bogomolov theorem covers that range.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.2/height-inequality`, `AbelianSchemesAndArithmeticModuliPartII:B4/dgh-25`, `HeightsRationalPointsAndObstructionsPartII:UB.4/base-point-bound`, `HeightsRationalPointsAndObstructionsPartII:UB.0/curve-power-escape`, `HeightsRationalPointsAndObstructionsPartII:UB.4/abel-jacobi-bounds`, `StableReductionPartII:MC.7/consumer-dgh`, `JacobianChallengePartII:JC7/universal-faltings-zhang`

**Sources.** dgh-2021, Proposition 7.1 and proof, pp. 29–31 (arXiv v3): Proves by induction on dim S that, for curves of large modular height, outside a bounded exceptional set of base points few points are close in Néron–Tate distance, from Gao’s non-degeneracy of D_M(C_S^{[M+1]}) with M = 3g − 2 and the height inequality.

### Height gap on the restricted Hilbert scheme (GGK Proposition 4.2)

`UB.4/family-height-gap` · theorem

Let S ⊆ H° be a subvariety over ℚ̄, 𝓛 = ι^*𝔏_g^{⊗4} and M the pullback to H° of an ample line bundle on a compactification of 𝔸_g. There are c′₁, c′₂, c′₃ > 0 depending on r, d and S such that for each s ∈ S_gen the set {x ∈ X_s°(ℚ̄) : ĥ_𝓛(x) ≤ c′₁ max{1, h_{H°,M}(s)} − c′₃} lies in a proper Zariski closed X′ ⊊ X_s with deg_{𝓛_s} X′ < c′₂.

**Hypotheses.** S ⊆ H° a subvariety; M pulled back from an ample moduli bundle; s ∈ S_gen.

**Construction or proof.**

1. Reduce to S irreducible and to the components S′ of the closure of S_gen; take m with X_{S′}^{[m]} non-degenerate.
2. Apply UB.2 with an ample height on a compactification of S′. The height of its moduli image is bounded above by a positive multiple of this height plus a constant (height machine for the moduli morphism). Hence Σ ĥ_𝓛(x_i) ≥ c·h_M(s)−c′ off a proper closed Z; no ampleness of the pulled-back M on H° is used.
3. Case (i): the points s over which Z contains the whole fibre form a proper closed subset of S′; its components are handled by the induction hypothesis.
4. Case (ii): otherwise Z_s ⊊ X_s^m, and points of height ≤ (c/m)h_M(s) − c′/m have m-th power in Z_s; the product-set lemma gives X′ of bounded degree, the bound depending on deg Z_s, which is uniform over the family.

**Checks.**

- The base case dim S = 0 is trivial: h_M(s) is constant, and the set of points of height below a constant minus c′₃ can be made empty.
- The degree bound of X′ depends on S only through the family, not on s.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.2/height-inequality`, `HeightsRationalPointsAndObstructionsPartII:UB.1/nondegenerate-fibred-powers`, `HeightsRationalPointsAndObstructionsPartII:UB.1/generic-locus-closure`, `HeightsRationalPointsAndObstructionsPartII:UB.1/generic-locus`, `HeightsRationalPointsAndObstructionsPartII:UB.1/fibred-power`, `HeightsRationalPointsAndObstructionsPartII:UB.0/product-set-lemma`, `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-family`

**Sources.** ggk-2026, Proposition 4.2 and proof, pp. 204–207: Proves the family gap principle by noetherian induction on dim S: on the generic part the height inequality on a non-degenerate fibred power forces the small points into a degeneracy locus, and the product-set lemma bounds the resulting exceptional set.

### Height gap for principally polarized abelian varieties (GGK Proposition 4.4)

`UB.4/principal-height-gap` · theorem

For positive integers g, r, d there are c′₁, c′₂, c′₃ > 0 depending on g, r, d such that for every principally polarized (A, L) over ℚ̄ of dimension g and every irreducible X ⊆ A generating A with dim X = r and deg_L X = d, the set {x ∈ X°(ℚ̄) : ĥ_{L⊗[−1]^*L}(x) ≤ c′₁ max{1, h_Fal(A)} − c′₃} lies in a proper Zariski closed X′ ⊊ X with deg_L X′ < c′₂.

**Hypotheses.** (A, L) principally polarized over ℚ̄ of dimension g; X irreducible generating A with dim r, degree d.

**Construction or proof.**

1. If Stab(X) is positive-dimensional, X° = ∅; otherwise [X] ∈ H°_gen for H° = H°_{r, 8^r d}.
2. Apply the family gap with S = H°: deg_{𝔏_g^{⊗4}|A} X = 8^r d and ĥ_{𝔏_g^{⊗4}|A} = 4ĥ_{L⊗[−1]^*L}.
3. Faltings’ comparison of the moduli height with the stable Faltings height (ArakelovGeometryAndAbelianHeights R35.5, GGK (4.11)): max{1, h_Fal(A)} ≤ c(g)h_M(b) + c′(g) log(h_M(b) + 2); rescale c′₁ and c′₃.
4. deg_L X′ ≤ deg_{𝔏_g^{⊗4}|A} X′ < c′₂ (source issue E3 of the GGK extraction: the inequality is not strict for zero-dimensional components, which does not affect the bound).

**Checks.**

- The constants depend only on g, r, d; the exceptional set X′ depends on A and X but has bounded degree.
- h_Fal is the stable Faltings height in the normalization of ArakelovGeometryAndAbelianHeights R35.3.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.4/family-height-gap`, `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-family`, `ArakelovGeometryAndAbelianHeights:R35.5/modular-height-equals-faltings-height`, `ArakelovGeometryAndAbelianHeights:R35.5/theta-faltings-comparison`, `ArakelovGeometryAndAbelianHeights:R35.3/stable-faltings-height`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`

**Sources.** ggk-2026, Proposition 4.4 and proof, pp. 208–210: Specializes the family gap principle to S = H°_{r, 8^r d}, converts degrees and heights between L and 𝔏_g^{⊗4}, and replaces the moduli height by the Faltings height using Faltings’ comparison.

### Height gap for all polarizations (GGK Proposition 4.1)

`UB.4/polarized-height-gap` · theorem

For positive integers g, l, r ≤ g and d there are c′₁, c′₂, c′₃ > 0 depending on g, l, r, d such that for every polarized (A, L) over ℚ̄ of dimension g with deg_L A = l and every irreducible X ⊆ A generating A with dim X = r and deg_L X = d, the set {x ∈ X°(ℚ̄) : ĥ_{L⊗[−1]^*L}(x) ≤ c′₁ max{1, h_Fal(A)} − c′₃} lies in a proper Zariski closed X′ ⊊ X with deg_L X′ < c′₂.

**Hypotheses.** (A, L) polarized over ℚ̄, dim g, deg_L A = l; X irreducible generating A.

**Construction or proof.**

1. Put n = l/g!. Choose a principally polarized (A₀,L₀) and isogenies u₀ : A → A₀ and u : A₀ → A with u∘u₀ = [n], u₀∘u = [n], u₀^*L₀ algebraically equivalent to L, and u^*L algebraically equivalent to [n]^*L₀ (GGK Lemma 2.2(iv)).
2. Apply the principal case to X₀ = u^{-1}(X)-component; h_Fal(A₀) and h_Fal(A) differ by O(log l) (isogeny estimate, ArakelovGeometryAndAbelianHeights R35.4).
3. Transport X′₀ to X′ = u(X′₀); by the projection formula deg_L X′ ≤ deg_{u^*L} X′₀ ≤ (l/g!)^{2(r−1)} c′₂, so c′₂ must be rescaled by (l/g!)^{2(r−1)} as well as c′₁ by (l/g!)² (source issue E4 of the GGK extraction).

**Checks.**

- For l = g! (principal polarization) the statement is the principal case.
- The degree constant genuinely changes under the reduction; a proof that keeps c′₂ fixed is wrong (E4).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.4/principal-height-gap`, `ArakelovGeometryAndAbelianHeights:R35.4/isogeny-height-bounds`, `AbelianSchemesAndArithmeticModuli:A2`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`

**Sources.** ggk-2026, Proposition 4.1, p. 203; proof §4.3, pp. 210–211: Reduces an arbitrary polarization of degree l to a principal one through an isogeny u₀ and a quasi-inverse u, using the projection formula and Faltings’ isogeny estimate.

### The gap principle for fixed polarization degree and dimension (GGK Proposition 6.1)

`UB.4/gap-principle-fixed` · theorem

For positive integers g, l, r, d there are c₁, c₂ > 0 depending on g, l, r, d such that for every polarized (A, L) over ℚ̄ of dimension g with deg_L A = l and every irreducible X ⊆ A generating A with dim X = r and deg_L X = d, the set {P ∈ X°(ℚ̄) : ĥ_{L⊗[−1]^*L}(P) ≤ c₁ max{1, h_Fal(A)}} lies in a proper Zariski closed X′ ⊊ X with deg_L X′ < c₂.

**Hypotheses.** (A, L), X as in the polarized height gap.

**Construction or proof.**

1. Let c′₁, c′₂, c′₃ be the height-gap constants and c″₂, c″₃ the uniform Bogomolov constants; put H = max{1, h_Fal(A)} and B = max{1, 2c′₃/c′₁}.
2. If H > B, then c′₁H − c′₃ ≥ (c′₁/2)H, so with c₁ ≤ c′₁/2 the height-gap exceptional set works.
3. If H ≤ B, then c₁H ≤ c₁B ≤ c″₃ for c₁ ≤ c″₃/B, so the uniform Bogomolov exceptional set works.
4. For fixed A only one of the two cases occurs, so a single exceptional set suffices and c₂ = max{c′₂, c″₂} as published (the extraction’s historical E8 is retracted: no union of exceptional sets is needed).

**Checks.**

- The threshold is now c₁ max{1, h_Fal(A)} with no subtracted constant.
- c₂ is max{c′₂, c″₂}, not their sum.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.4/polarized-height-gap`, `HeightsRationalPointsAndObstructionsPartII:UB.3/uniform-bogomolov-exceptional`

**Sources.** ggk-2026, Proposition 6.1 and proof, pp. 219–220: Combines the height gap (threshold proportional to the Faltings height minus a constant) with the uniform Bogomolov exceptional-set version (absolute threshold) to remove the additive constant.

### The new gap principle (Gao–Ge–Kühne Theorem 1.2)

`UB.4/new-gap-principle` · theorem

Given positive integers g and d there are c₁ = c₁(g, d) > 0 and c₂ = c₂(g, d) > 0 such that for every polarized abelian variety (A, L) over ℚ̄ of dimension g and every irreducible closed X ⊆ A generating A with deg_L X ≤ d, the set {P ∈ X°(ℚ̄) : ĥ_{L⊗[−1]^*L}(P) ≤ c₁ max{1, h_Fal(A)}} is contained in X′(ℚ̄) for a proper Zariski closed X′ ⊊ X with deg_L X′ < c₂.

**Hypotheses.** (A, L) polarized over ℚ̄, dim A = g; X irreducible closed generating A, deg_L X ≤ d.

**Construction or proof.**

1. Since X generates A, deg_L A is bounded in terms of g and deg_L X (GGK Lemma 2.5, via the generated abelian subvariety of the parent and the sum-of-translates degree bound; source issue E2 of the GGK extraction corrects its constants).
2. Apply the fixed-degree gap principle for each of the finitely many (l, r, d′) with l bounded, r ≤ g, d′ ≤ d; take the minimum of the c₁ and the maximum of the c₂.

**Checks.**

- The generation hypothesis cannot be dropped, and the exceptional set is not finite in general (examples in Gao’s survey §10.2 cited by GGK p. 192).
- For a curve of genus g ≥ 2 embedded in its Jacobian, X′ is a finite set of bounded cardinality: this is the gap principle for curves.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.4/gap-principle-fixed`, `HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety`, `ArakelovGeometryAndAbelianHeights:R35.3/stable-faltings-height`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`

**Sources.** ggk-2026, Theorem 1.2 and (1.3), p. 192; proof §6, p. 220: States the gap principle with threshold proportional to the Faltings height and exceptional set of bounded degree, and deduces it from the fixed-degree version since l = deg_L A is bounded in terms of g and d for generating X.

### The new gap principle for curves

`UB.4/curve-gap-principle` · theorem

For each g ≥ 2 there are c₁(g), c₂(g) > 0 such that for every smooth projective curve C of genus g over ℚ̄ and every y ∈ C(ℚ̄), #{x ∈ C(ℚ̄) : ĥ(x − y) ≤ c₁ max{h_Fal(C), 1}} ≤ c₂, where h_Fal(C) = h_Fal(Jac(C)) is the stable Faltings height and ĥ is half the canonical height of the symmetric twice-theta bundle (the Néron–Tate height for the principal polarization).

**Hypotheses.** g ≥ 2; C smooth projective genus g over ℚ̄; y ∈ C(ℚ̄).

**Construction or proof.**

1. X = C − y ⊆ J = Jac(C) is a curve of θ-degree g generating J with X° = X.
2. Apply the new gap principle with (g, d) = (g, g): the small points lie in a proper closed subset of X of degree < c₂, i.e. a finite set of fewer than c₂ points.
3. With L the symmetric principal polarization, ĥ_{L⊗[−1]^*L} = 2ĥ_L, and 2ĥ_L is the canonical height of the twice-theta bundle; absorb the factor into c₁.

**Checks.**

- Taking the threshold 0 recovers uniform Manin–Mumford for curves.
- Yuan’s uniform Bogomolov for curves (the last layer) strengthens this by adding ĥ((2g − 2)α − ω) to the threshold and allowing α ∈ Pic¹ and all global fields.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.4/new-gap-principle`, `JacobianChallengePartII:JC2/degree-one-closed-immersion`, `JacobianChallengePartII:JC3/twice-theta`, `HeightsRationalPointsAndObstructionsPartII:UB.4/neron-tate-distance`

**Sources.** yuan-2026, §1.1, p. 4 (author manuscript 21 August 2024): States the gap principle for curves with threshold proportional to max{h_Fal(C), 1}, attributing it to Gao’s survey Theorem 4.1 as a combination of DGH Proposition 7.1 and Kühne Theorem 3.; ggk-2026, Theorem 1.2, p. 192: The general gap principle, whose case X = C − y ⊆ Jac(C) gives this statement.

## Layer UB.5: Rémond’s quantitative Vojta method

The Néron–Tate Euclidean space of a finite-rank subgroup, the embedding constants c_NT and h₁ with their bounds by the Faltings height, Rémond’s generalized Vojta and Mumford inequalities, the isolated-fibre alternative, removal of the height of X, the bound for points of large height, the packing hypothesis, Rémond’s counting theorem under it (GGK Theorem 7.1), the packing hypothesis from the gap principle (Proposition 7.2), and Rémond’s bound for one subvariety in David–Philippon form.

### The Néron–Tate Euclidean space of a finite-rank subgroup

`UB.5/neron-tate-euclidean` · construction

Let A be an abelian variety over ℚ̄ with a symmetric ample line bundle L and Γ ⊆ A(ℚ̄) a subgroup of finite rank ρ. On Γ_ℝ = (Γ/Γ_tors) ⊗ ℝ the Néron–Tate height extends to a positive definite quadratic form; write |P| = ĥ_L(P)^{1/2} and ⟨P, Q⟩ = (ĥ_L(P + Q) − ĥ_L(P) − ĥ_L(Q))/2. Then (Γ_ℝ, ⟨·,·⟩) is a Euclidean space of dimension ρ, the image of Γ in it is a subgroup whose rational span has dimension ρ (dense when Γ is a division group), and points of Γ with equal image differ by torsion.

**Hypotheses.** A abelian over ℚ̄; L symmetric ample; Γ ⊆ A(ℚ̄) of finite rank ρ.

**Construction or proof.**

1. The Néron–Tate pairing (parent RP.0) is symmetric bilinear on A(ℚ̄) and vanishes exactly on torsion when paired with itself (Néron–Tate kernel over number fields).
2. Choose a finitely generated Γ₀ ⊆ Γ of rank ρ defined over a number field; ĥ is positive definite on Γ₀ ⊗ ℝ (finitely generated Mordell–Weil lattice), and Γ ⊆ division hull of Γ₀ (parent RP.5 finite rank), so Γ_ℝ = Γ₀ ⊗ ℝ.

**Uses.** Gao–Ge–Kühne, Appendix A.5: cones of angle (1 − 1/c₄) and the norm growth argument; Dimitrov–Gao–Habegger, Proposition 8.1: small points are packed in balls of radius r with r² = max{1, h}/c₃.

**API.**

- `NeronTateSpace` (data): Γ_ℝ with inner product ⟨·,·⟩_L and the map Γ → Γ_ℝ.
- `NeronTateSpace.norm_sq` (simp): |P|² = ĥ_L(P) for P ∈ Γ.
- `NeronTateSpace.finrank` (other): dim_ℝ Γ_ℝ = rk Γ.
- `NeronTateSpace.ker` (characterisation): P ∈ Γ maps to 0 iff P is torsion.
- `NeronTateSpace.mono` (functoriality): Γ′ ⊆ Γ induces an isometric embedding Γ′_ℝ → Γ_ℝ.
- `NeronTateSpace.translate` (other): For Q ∈ A(ℚ̄), ⟨Γ, Q⟩ has rank ≤ rk Γ + 1, and the space for it contains Γ_ℝ isometrically.

**Unit tests.**

- `NeronTateSpace.torsion` (degenerate): For Γ = A_tors, Γ_ℝ = 0.
- `NeronTateSpace.rank_one` (computation): For E: y² = x³ − 2 over ℚ and Γ = E(ℚ) = ℤ·(3, 5), Γ_ℝ ≅ ℝ with |(3,5)|² = ĥ((3,5)) (native Tau Ceti canonical height divided by 2 for L = O(O)).
- `NeronTateSpace.division_hull` (non-example): Γ = the division hull of ℤP has rank 1 but is not finitely generated; Γ_ℝ is still one-dimensional: finite rank, not finite generation, is the hypothesis.

**Needs.** `HeightsRationalPointsAndObstructions:RP.0/neron-tate-bilinear-form`, `HeightsRationalPointsAndObstructions:RP.0/neron-tate-kernel-number-field`, `HeightsRationalPointsAndObstructions:RP.5/finite-rank-subgroup`, `mathlib:Module.finrank`, `mathlib:EuclideanSpace`

**Sources.** ggk-2026, Appendix A.5, Step 1, p. 230: Endows Γ ⊗ ℝ with the Euclidean norm given by the square root of the Néron–Tate height and covers it by cones of small angle.; dgh-2021, Proof of Proposition 8.1, pp. 32–34 (arXiv v3): Works in the Euclidean space Γ ⊗ ℝ with the Néron–Tate norm for the ball-packing count.

### The constants c_NT and h₁ of an embedded abelian variety

`UB.5/embedding-constants` · construction

Let A ⊆ ℙⁿ be an abelian variety over ℚ̄ embedded projectively normally by a basis ξ₀, …, ξ_n of H⁰(A, L) for a symmetric very ample L. Then c_NT(A) ≥ 0 is the least constant with |ĥ_L − h| ≤ c_NT on A(ℚ̄), and h₁(A) is the height of the coefficient vector for a chosen family of bihomogeneous polynomials P_{ij} of bidegree (2, 2) with f^*(p₁^*ξ_i ⊗ p₂^*ξ_j) = P_{ij}(p₁^*ξ, p₂^*ξ) for f(P, Q) = (P + Q, P − Q).

**Hypotheses.** A ⊆ ℙⁿ projectively normal by a symmetric very ample L.

**Construction or proof.**

1. c_NT exists by the height machine (Tate’s limit, parent RP.0).
2. The polynomials P_{ij} exist since f^*(L ⊠ L) ≅ L² ⊠ L² (theorem of the cube) and projective normality makes the multiplication maps on sections surjective (Rémond, Proposition 5.2, cited by DGH).

**Uses.** Dimitrov–Gao–Habegger, Lemma 8.2: Rémond’s large-point bound depends on max{1, h(C), c_NT, h₁}; Gao–Ge–Kühne, (7.3)–(7.6): the counting of Theorem 7.1 is stated in terms of c_NT and h₁.

**API.**

- `EmbeddingConstants.cNT` (data): c_NT(A) for the embedding.
- `EmbeddingConstants.h1` (data): h₁(A; (P_{ij})) is the absolute logarithmic height of the projective coefficient vector of a chosen addition/difference polynomial family.
- `EmbeddingConstants.abs_sub_le` (characterisation): |ĥ_L(P) − h(P)| ≤ c_NT(A) for all P ∈ A(ℚ̄).
- `EmbeddingConstants.galois` (other): c_NT and h₁ are unchanged by simultaneously conjugating A, its embedding, and the chosen polynomial family.

**Unit tests.**

- `EmbeddingConstants.elliptic_x` (computation): For an elliptic curve in ℙ² by the Weierstrass embedding (L = O(3·O)), c_NT is bounded by an explicit multiple of max{1, h(j)} plus the height of the Weierstrass coefficients (Silverman’s difference bounds).
- `EmbeddingConstants.nonneg` (degenerate): c_NT ≥ 0 and h₁ ≥ 0.
- `EmbeddingConstants.not_projectively_normal` (non-example): Projective normality supplies the needed surjections on sections. Symmetric ample bundles which are not powers M^{⊗k}, k ≥ 3, can still be projectively normal (for example O_E(4·0)); being such a power is sufficient, not a necessary condition.

**Needs.** `HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`, `HeightsRationalPointsAndObstructions:RP.0/duplication-by-quartics`, `mathlib:Projectivization.logHeight`, `AbelianSchemesAndArithmeticModuli:A2`

**Sources.** dgh-2021, §8, (8.1)–(8.2), pp. 31–32 (arXiv v3): Defines the constant bounding the difference between the Néron–Tate and naive heights and the height of the addition-and-subtraction polynomials of bidegree (2, 2), whose existence it takes from Rémond.; ggk-2026, §7.1, (7.3)–(7.4), pp. 220–221: Uses the same two constants in the David–Philippon formulation of Rémond’s theorem.

### Bounds for c_NT and h₁ by the Faltings height (DGH (8.4), (8.7))

`UB.5/embedding-constants-bound` · theorem

Fix g, a projective embedding of the level-ℓ universal principally polarized family as in DGH §6.1, and the power l used there. For its fibre embeddings there is c′ depending on these fixed choices such that c_NT(A) ≤ c′ max{1,h_{A_g,M}([A])}, and one can choose addition/difference polynomials with h₁(A) ≤ c′ max{1,h_{A_g,M}([A])}. Thus both are bounded by c″ max{1,h_Fal(A)}. The embedding and polynomial family are controlled choices; arbitrary changes of projective coordinates are excluded. The extension to general polarization types used in GGK Appendix A is a separate input recorded as a gap.

**Hypotheses.** A principally polarized of dimension g with the fixed universal-family embedding and chosen controlled polynomial family of DGH §6.1 and §8.

**Construction or proof.**

1. c_NT: Silverman–Tate in the universal family (parent RP.0): |ĥ(P) − h(P)| ≤ c max{1, h(π(P))}.
2. h₁: the coefficients of the P_{ij} solve a linear system whose equations are evaluations at finitely many torsion points (Zariski dense, of height zero); Cramer’s rule bounds their height linearly in the height of the moduli point.
3. Convert the moduli height into max{1, h_Fal(A)} by the comparison of ArakelovGeometryAndAbelianHeights R35.5.

**Checks.**

- Both bounds are linear in max{1, h_Fal(A)}, which is what makes the threshold of the gap principle the right scale for Rémond’s large points.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.5/embedding-constants`, `HeightsRationalPointsAndObstructions:RP.0/silverman-tate`, `ArakelovGeometryAndAbelianHeights:R35.5/theta-faltings-comparison`, `PELModuli:M6/universal-family-export`

**Sources.** dgh-2021, Proof of Proposition 8.1, (8.4) and (8.6)–(8.7), pp. 32–33 (arXiv v3): Bounds c_NT by Silverman–Tate in the universal family and obtains the addition polynomials with controlled height by Cramer’s rule from a linear system at finitely many torsion points.; ggk-2026, §7.1, (7.3)–(7.4), p. 221: Records both constants as bounded by a constant depending on g and deg_L A times max{1, h_Fal(A)}.

**Open input.** Controlled embedding constants for general polarization types.

### Rémond’s generalized Vojta inequality

`UB.5/remond-vojta` · theorem

Let A be an abelian variety over ℚ̄ with L symmetric, very ample and projectively normal, n = deg_L A/g! − 1, and X ⊆ A irreducible. There are c₄, c₅ > 0 depending on g, deg_L X and deg_L A such that if P₀, …, P_{dim X} ∈ X°(ℚ̄) satisfy ⟨P_i, P_{i+1}⟩ ≥ (1 − 1/c₄)|P_i||P_{i+1}| and |P_{i+1}| ≥ c₄|P_i| for all i, then |P₀|² ≤ c₅ max{1, h(X), h_Fal(A)}. The Faltings-height form assumes the controlled-embedding bound in the hypotheses; for an arbitrary embedding its right side instead uses max{1,h(X),c_NT,h₁}.

**Hypotheses.** L symmetric very ample projectively normal; X irreducible; P_i ∈ X° in a narrow cone with rapidly increasing norms. For the displayed Faltings-height form, require a controlled embedding and a polynomial family with max{c_NT,h₁} ≤ C(g,deg_L A) max{1,h_Fal(A)}. Without that input, retain max{1,h(X),c_NT,h₁} in the bound.

**Construction or proof.**

1. Rémond’s explicit values (Théorème 1.1): with m = dim X + 1, c₁ = c₂ = max(deg X, (6m)^{2m})^{m^{3m²}} and c₃ = c₁(n + 1)^{(dim X)³} max(h(X), h₁, c_NT, n log(n + 1)); here the first point need only satisfy |x₁|² ≥ c₃ for some x_i to lie in Z_X. This is Rémond’s quantitative form of the Faltings–Vojta inequality: the parent plans the qualitative higher-dimensional Vojta method (RP.5, Faltings’ product theorem, small sections and dimension descent); Rémond’s version tracks every constant through the same construction in terms of n, deg X, h(X), c_NT and h₁.
2. First retain the bound in max{1,h(X),c_NT,h₁} for the chosen embedding. Only under the additional controlled-embedding hypothesis replace c_NT,h₁ by C(g,deg_L A) max{1,h_Fal(A)}. DGH proves this input for its fixed principally polarized family; the general-polarization input remains a gap.

**Checks.**

- The constants do not depend on A, X or the points beyond the listed degrees and heights.
- For X a curve of genus ≥ 2 in its Jacobian this is Bombieri’s explicit Vojta inequality with an explicit dependence on the height of the curve.
- The cone condition is essential: without small angles there is no inequality (two orthogonal points can have arbitrary norms).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.5/neron-tate-euclidean`, `HeightsRationalPointsAndObstructionsPartII:UB.5/embedding-constants-bound`, `HeightsRationalPointsAndObstructionsPartII:UB.0/chow-height`, `HeightsRationalPointsAndObstructions:RP.5/vojta-inequality`, `HeightsRationalPointsAndObstructions:RP.5/faltings-subvarieties`

**Sources.** ggk-2026, Theorem A.1, p. 227 (citing Rémond, Inégalité de Vojta en dimension supérieure, Theorem 1.1): Restates Rémond’s explicit Vojta inequality for points of the complement of the Ueno locus with growing norms in a narrow cone, with constants depending only on g and the degrees and the dependence on h(X) and h_Fal(A) explicit.; remond-2000-vojta, Théorème 1.1, p. 105, and Théorème 1.2, p. 106; setting §1, p. 104: For a geometrically integral X in a projectively normal symmetric embedding of A over a number field, shows that dim X + 1 points of X off the union Z_X of translates of positive-dimensional abelian subvarieties cannot be pairwise at small angle, of rapidly increasing norm and of large first norm, with explicit constants in deg X, n, h(X), c_NT and h₁.

**Open input.** Controlled embedding constants for general polarization types.

### Rémond’s generalized Mumford inequality

`UB.5/remond-mumford` · theorem

With A, L, n and X as in Rémond’s Vojta inequality, let D_{dim X} : X^{dim X+1} → A^{dim X}, (x₀, …, x_{dim X}) ↦ (x₁ − x₀, …, x_{dim X} − x₀). There are c₄, c₅ > 0 depending on g, deg_L X and deg_L A such that if P₀, …, P_{dim X} ∈ X(ℚ̄) with (P₀, …, P_{dim X}) isolated in its fibre of D_{dim X}, ⟨P₀, P_i⟩ ≥ (1 − 1/c₄)|P₀||P_i| and ||P₀| − |P_i|| ≤ |P₀|/c₄ for all i, then |P₀|² ≤ c₅ max{1, h(X), h_Fal(A)}. The Faltings-height form assumes the controlled-embedding bound in the hypotheses; for an arbitrary embedding its right side instead uses max{1,h(X),c_NT,h₁}.

**Hypotheses.** as in Rémond’s Vojta inequality; the tuple isolated in its D_{dim X}-fibre. For the displayed Faltings-height form, require a controlled embedding and a polynomial family with max{c_NT,h₁} ≤ C(g,deg_L A) max{1,h_Fal(A)}. Without that input, retain max{1,h(X),c_NT,h₁} in the bound.

**Construction or proof.**

1. Generalizes Mumford’s gap principle for curves (parent RP.5): an arithmetic Bézout estimate for the height of an isolated point of the fibre of D_{dim X} against the heights of the coordinates, with the quadratic terms controlled by the angle and norm conditions.
2. First retain the bound in max{1,h(X),c_NT,h₁} for the chosen embedding. Only under the additional controlled-embedding hypothesis replace c_NT,h₁ by C(g,deg_L A) max{1,h_Fal(A)}. DGH proves this input for its fixed principally polarized family; the general-polarization input remains a gap.

**Checks.**

- For dim X = 1 this is Mumford’s gap principle for curves with explicit constants.
- Isolation is necessary: if the fibre is positive-dimensional the tuple can be moved along a coset and no bound holds.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.5/neron-tate-euclidean`, `HeightsRationalPointsAndObstructionsPartII:UB.5/embedding-constants-bound`, `HeightsRationalPointsAndObstructionsPartII:UB.0/chow-height`, `HeightsRationalPointsAndObstructions:RP.5/mumford-gap`, `HeightsRationalPointsAndObstructions:RP.5/faltings-zhang-map`

**Sources.** ggk-2026, Proposition A.2, p. 228 (citing Rémond, Décompte dans une conjecture de Lang, Proposition 3.4): Restates Rémond’s generalized Mumford inequality: isolated tuples of points of nearly equal norm in a narrow cone have bounded norm, explicitly in the degrees and heights.

**Open input.** Rémond’s Décompte read only through Gao–Ge–Kühne Appendix A; Controlled embedding constants for general polarization types.

### Isolated fibres or a small exceptional set (GGK Proposition A.3)

`UB.5/isolated-fibre-alternative` · theorem

With X ⊆ A irreducible and D_{dim X} as in Rémond’s Mumford inequality, every Ξ ⊆ X°(ℚ̄) satisfies one of: (i) for every x ∈ X(ℚ̄) there are pairwise distinct x₁, …, x_{dim X} ∈ Ξ with (x, x₁, …, x_{dim X}) isolated in its fibre of D_{dim X}; (ii) Ξ ⊆ X′ for a proper Zariski closed X′ ⊊ X with deg X′ ≤ (deg_L X)^{2 dim X}.

**Hypotheses.** X ⊆ A irreducible; Ξ ⊆ X°(ℚ̄).

**Construction or proof.**

1. If Stab(X) is positive-dimensional, X° = ∅; assume it is finite.
2. A tuple (x, x₁, …, x_{dim X}) is isolated iff 0 is an isolated point of (X − x) ∩ (X − x₁) ∩ ⋯ ∩ (X − x_{dim X}).
3. If (i) fails, there is a stage i₀ < dim X with W = (X − x) ∩ ⋯ ∩ (X − x_{i₀}) whose components C_j through 0 of dimension dim X − i₀ ≥ 1 persist after intersecting with X − y for every y ∈ Ξ; then Ξ ⊆ ⋃_j ⋂_{c ∈ C_j} (X − c).
4. Each ⋂_{c ∈ C_j}(X − c) is an intersection of at most dim X translates, proper since Stab(X) is finite; Bézout gives degree ≤ (deg X)^{dim X} and at most (deg X)^{dim X} components C_j, so deg X′ ≤ (deg_L X)^{2 dim X} (non-strict, source issue E13 of the GGK extraction).

**Checks.**

- For X a curve (dim X = 1), alternative (ii) is Ξ ⊆ a finite set of at most (deg X)² points.
- The bound on deg X′ is ≤, not <: E13 records the misprinted strict inequality.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`, `HeightsRationalPointsAndObstructions:RP.5/stabilizer`, `HeightsRationalPointsAndObstructions:RP.5/ueno-locus`, `HeightsRationalPointsAndObstructions:RP.5/faltings-zhang-map`

**Sources.** ggk-2026, Proposition A.3 and proof, pp. 228–229 (citing Rémond, Décompte, Proposition 3.3): Shows that either suitable points give isolated tuples or the set lies in a finite union of intersections of translates of X through positive-dimensional components, of degree bounded by Bézout.

**Open input.** Rémond’s Décompte read only through Gao–Ge–Kühne Appendix A.

### Removing the height of X (GGK Lemma A.4)

`UB.5/subvariety-height-removal` · theorem

Let A ⊆ ℙⁿ be embedded by L as in Rémond’s inequalities and X ⊆ A irreducible of positive dimension. If S ⊆ X(ℚ̄) is finite and nonempty and every equidimensional subvariety Y ⊇ S of X of dimension dim X − 1 has deg_L Y > deg_L A·(deg_L X)²/g!, then h(X) ≤ (deg_L A/g! + 1)^{dim X+1} deg_L X (max_{x∈S} h(x) + 3 log(deg_L A/g!)).

**Hypotheses.** S ⊆ X(ℚ̄) finite, not contained in any equidimensional codimension-one Y of degree ≤ deg_L A (deg_L X)²/g!. dim X ≥ 1 and S is nonempty. Zero-dimensional X is handled separately in counting arguments.

**Construction or proof.**

1. The needed input is Rémond’s arithmetic interpolation lemma, restated as GGK Lemma A.4. Its low-degree containment hypothesis turns heights of a sufficiently spread finite set into the displayed bound for h(X).
2. Arithmetic Bézout alone does not prove this interpolation estimate, and hypersurfaces containing X cannot cut X down. A direct proof plan for the interpolation lemma is missing and remains an explicit gap; the lemma is not derived here from the qualitative Vojta method.

**Checks.**

- For X a point use the separate identity h(X)=h(x); the positive-dimensional interpolation theorem is not applied to codimension −1.
- The hypothesis on S cannot be dropped: if S lies in a low-degree hypersurface section, its points carry no information on the height of X.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.0/chow-height`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`, `HeightsRationalPointsAndObstructions:RP.5`

**Sources.** ggk-2026, Lemma A.4, p. 229 (citing Rémond, Décompte, Lemma 3.1): Bounds the height of a subvariety by the heights of a finite set of its points that is not contained in any hypersurface section of small degree.

**Open input.** Rémond’s Décompte read only through Gao–Ge–Kühne Appendix A.

### Rémond’s bound for points of large height

`UB.5/large-points-bound` · theorem

Let A, L be as in Rémond’s inequalities, X ⊆ A irreducible and Γ ⊆ A(ℚ̄) of finite rank. Assuming the counting theorem below for all subvarieties of dimension < dim X, there is c₆ = c₆(g, deg_L X, deg_L A) > 0 with #{P ∈ X°(ℚ̄) ∩ Γ : ĥ_L(P) ≥ c₅ max{1, h(X), h_Fal(A)}} ≤ c₆^{rk Γ + 1}. For curves (Dimitrov–Gao–Habegger Lemma 8.2): for C ⊆ A ⊆ ℙⁿ an irreducible curve that is not a translate of an algebraic subgroup, #{P ∈ C(ℚ̄) ∩ Γ : ĥ_L(P) > c·max{1, h(C), c_NT, h₁}} ≤ c^{rk Γ} with c = c(n, deg C).

**Hypotheses.** L symmetric very ample projectively normal; X irreducible; Γ of finite rank.

**Construction or proof.**

1. Cover Γ_ℝ by at most ⌊(1 + (8c₄)^{1/2})^{rk Γ}⌋ cones on which ⟨P, Q⟩ ≥ (1 − 1/c₄)|P||Q|.
2. In one cone order the large points by norm P₀, P₁, …; for each j the block {P_{j+1}, …, P_{j+N′}} with N′ = (deg_L X)^{2g} c(g, (deg_L X)^{2g}, deg_L A)^{rk Γ+1} + 1 is not contained in a proper X′ of degree ≤ (deg_L X)^{2 dim X} (else the induction hypothesis on X′ contradicts the choice of N′).
3. The isolated-fibre alternative gives an isolated tuple with P_j; Rémond’s Mumford inequality then fails, so some P_k in the block has |P_k| > (1 + 1/c₄)|P_j|.
4. Choose M with (1 + 1/c₄)^M ≥ c₄; every M N′ steps the norm grows by c₄, so dim X + 1 such points satisfy Rémond’s Vojta hypotheses, contradicting the lower bound on |P₀|². Hence each cone holds fewer than (dim X)·M·N′ large points.
5. When the counting statement uses a non-strict large-height threshold, enlarge it beyond the upper bounds in the Vojta and Mumford alternatives (for example double their common positive constant). This avoids equality at the original threshold.

**Checks.**

- For rk Γ = 0 there are no points of positive height, so the bound is trivial.
- The bound is exponential in rk Γ with base depending only on g and the degrees, not on the heights of A or X.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.5/remond-vojta`, `HeightsRationalPointsAndObstructionsPartII:UB.5/remond-mumford`, `HeightsRationalPointsAndObstructionsPartII:UB.5/isolated-fibre-alternative`, `HeightsRationalPointsAndObstructionsPartII:UB.5/neron-tate-euclidean`, `HeightsRationalPointsAndObstructionsPartII:UB.0/ball-packing`

**Sources.** ggk-2026, Appendix A.5, Step 1, (A.5)–(A.8) and proof, pp. 229–231: Covers Γ ⊗ ℝ by boundedly many narrow cones; in each cone, blocks of consecutive large points escape small exceptional sets by induction, the isolated-fibre alternative and Rémond’s Mumford inequality force geometric norm growth, and Rémond’s Vojta inequality caps the number of growth steps.; dgh-2021, Lemma 8.2, p. 32 (arXiv v3): States the curve case, citing Rémond’s Vojta and Mumford inequalities.; yuan-2026, §1.1, p. 4 (author manuscript 21 August 2024): Records that the Vojta, Faltings and Bombieri proofs, refined by de Diego and Rémond, bound the number of points of large height.

**Open input.** Controlled embedding constants for general polarization types.

### The packing hypothesis (Hyp pack)

`UB.5/packing-hypothesis` · definition

For (A, L) with L symmetric ample, X ⊆ A irreducible and Γ ⊆ A(ℚ̄) of finite rank, (Hyp pack) holds with constant c₀ = c₀(g, deg_L X) > 0 if for every P₀ ∈ X(ℚ̄): #{P − P₀ ∈ (X°(ℚ̄) − P₀) ∩ Γ : ĥ_L(P − P₀) ≤ c₀^{-1} max{1, h_Fal(A)}} ≤ c₀^{rk Γ + 1}.

**Hypotheses.** (A, L), X, Γ as stated.

**Construction or proof.**

1. A predicate on the data; it is the input Rémond’s counting needs for the small points and the output of the gap principle.

**Uses.** Gao–Ge–Kühne, Theorem 7.1: Rémond’s method under (Hyp pack) bounds #X° ∩ Γ; Gao–Ge–Kühne, Proposition 7.2: (Hyp pack) holds for L ⊗ [−1]^*L by the gap principle.

**API.**

- `PackingHypothesis` (data): The proposition (Hyp pack) for (A, L, X, Γ, c₀).
- `PackingHypothesis.mono_const` (other): If it holds with c₀ then it holds with every c₀′ ≥ c₀.
- `PackingHypothesis.subgroup` (functoriality): If it holds for Γ with constant c₀, it holds with the same c₀ for every subgroup Γ′ ⊆ Γ of the same rank.
- `PackingHypothesis.translate` (other): Replacing X by X − Q and Γ by ⟨Γ, Q⟩ preserves the hypothesis with rank increased by at most one.

**Unit tests.**

- `PackingHypothesis.rank_zero_torsion` (computation): For Γ = A_tors (rank 0) the hypothesis says #((X° − P₀) ∩ A_tors) ≤ c₀ for every P₀: a uniform Manin–Mumford statement.
- `PackingHypothesis.empty_ueno` (degenerate): If X° = ∅ the hypothesis holds trivially.
- `PackingHypothesis.fails_without_ueno` (non-example): With X° replaced by X, the hypothesis fails for X containing a positive-dimensional abelian subvariety B and Γ ⊇ B_tors: infinitely many torsion points of B are at distance 0.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.5/neron-tate-euclidean`, `HeightsRationalPointsAndObstructions:RP.5/ueno-locus`, `ArakelovGeometryAndAbelianHeights:R35.3/stable-faltings-height`

**Sources.** ggk-2026, §7.1, (7.1), p. 220; restated Appendix A, p. 227: Formulates the hypothesis that around every base point few points of the subgroup on the complement of the Ueno locus are close in Néron–Tate distance, at the scale of the Faltings height.

### Rémond’s counting theorem under (Hyp pack) (GGK Theorem 7.1)

`UB.5/remond-counting` · theorem

Assume (Hyp pack) holds for every (A, L), X, Γ with X generating A (in all dimensions up to that of the variety counted). Then for every polarized (A, L) over ℚ̄ with L symmetric and very ample, every irreducible X ⊆ A and every finite-rank Γ ⊆ A(ℚ̄): #(X°(ℚ̄) ∩ Γ) ≤ c(g, deg_L X, deg_L A)^{rk Γ + 1}, with c increasing in each argument.

**Hypotheses.** (Hyp pack) for all generating subvarieties in dimensions ≤ dim X; L symmetric very ample.

**Construction or proof.**

1. The parent’s qualitative finite-rank Mordell–Lang theorem makes X°∩Γ finite: in its finite coset decomposition, every positive-dimensional coset is removed by the Ueno locus. Thus the minima over point configurations in the subsequent packing alternative are attained. This qualitative input does not use the uniform count being proved.
2. Reduce to X generating A: X ⊆ A′ + Q with A′ = ⟨X − X⟩, replace Γ by ⟨Γ, Q⟩ (rank + 1) and use (X − Q)° = X° − Q; deg_L A′ is bounded in g and deg_L X (GGK Lemma 2.5); then square the constant.
3. Induct on dim X. Step 1: the large-points bound.
4. Step 2 (removing h(X)): with c₇ = deg_L A (deg_L X)²/g! · c(g, deg_L A (deg_L X)²/g!, deg_L A) and N″ = c₇^{rk Γ+1} + 1, for pairwise distinct P₀, …, P_{N″} ∈ X° ∩ Γ, Lemma A.4 applied to X − P₀ bounds the number of P with ĥ(P − P₀) ≥ c₈² max_i ĥ(P_i − P₀) + c₉ max{1, h_Fal(A)} by c₁₀^{rk Γ+1}.
5. Step 3 (packing alternative): either #X° ∩ Γ ≤ N″(8c₈ + 1)^{rk Γ} + c₁₀^{rk Γ+1} (the factor is 8c₈ + 1, source issue E11), or some Q ∈ X° ∩ Γ has at most c₁₀^{rk Γ+1} points P with ĥ(P − Q) ≥ 2c₉ max{1, h_Fal(A)}.
6. Step 4: in the second case cover the ball of radius (2c₉ max{1, h_Fal})^{1/2} around Q by (1 + 2(2c₉c₀)^{1/2})^{rk Γ} balls of radius (c₀^{-1} max{1, h_Fal})^{1/2} (ball packing); each contains at most c₀^{rk Γ+1} points by (Hyp pack) (source issue E9: the ball count is c₀^{rk Γ+1}, not c₀).

**Checks.**

- For rk Γ = 0 and Γ = A_tors this is a uniform Manin–Mumford count given (Hyp pack) at rank 0.
- Without (Hyp pack) the method bounds only the large points; the small points are exactly what the gap principle controls.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.5/large-points-bound`, `HeightsRationalPointsAndObstructionsPartII:UB.5/packing-hypothesis`, `HeightsRationalPointsAndObstructionsPartII:UB.5/subvariety-height-removal`, `HeightsRationalPointsAndObstructionsPartII:UB.0/ball-packing`, `HeightsRationalPointsAndObstructionsPartII:UB.5/neron-tate-euclidean`, `HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety`, `HeightsRationalPointsAndObstructions:RP.5/ueno-locus`, `HeightsRationalPointsAndObstructions:RP.5`

**Sources.** ggk-2026, Theorem 7.1, p. 220; proof sketch pp. 220–221; full proof Appendix A.5, Steps 1–4, pp. 229–232: Proves the exponential count from the packing hypothesis by Rémond’s method: reduction to generating X, large points by the Vojta and Mumford inequalities, removal of h(X) by a finite set of points, and a packing alternative with a minimal radius.

**Open input.** Controlled embedding constants for general polarization types.

### (Hyp pack) holds for L ⊗ [−1]^*L (GGK Proposition 7.2)

`UB.5/packing-hypothesis-holds` · theorem

For an abelian variety A of dimension g over ℚ̄ with ample L, (Hyp pack) holds, with L replaced by L ⊗ [−1]^*L and a constant c₀ = c₀(g, deg_L X), for every irreducible X ⊆ A generating A and every finite-rank Γ ⊆ A(ℚ̄).

**Hypotheses.** A abelian over ℚ̄, L ample; X irreducible generating A; Γ of finite rank.

**Construction or proof.**

1. Fix P₀ ∈ X(ℚ̄); apply the new gap principle to X − P₀ (which generates A): the points P − P₀ ∈ (X° − P₀) ∩ Γ with ĥ ≤ c₁ max{1, h_Fal(A)} lie in a proper X′ of degree < c₂.
2. Each component X† of X′ lies in a translate A† + Q of the abelian subvariety it generates; with Γ† = ⟨Γ, Q⟩ ∩ A†, Rémond’s counting (applicable by induction on dimension) bounds #((X† − Q)° ∩ Γ†) by c^{rk Γ+2}.
3. Use (X′)° ⊇ X° ∩ X′ and sum over the boundedly many components; set c₀ = max{c₁^{-1}, c₃} (source issue E10: c₁ enters inverted).

**Checks.**

- The polarization L ⊗ [−1]^*L is symmetric; the gap principle is stated for it.
- The constant depends only on g and deg_L X.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.5/packing-hypothesis`, `HeightsRationalPointsAndObstructionsPartII:UB.4/new-gap-principle`, `HeightsRationalPointsAndObstructionsPartII:UB.5/remond-counting`, `HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety`

**Sources.** ggk-2026, Proposition 7.2 and proof, pp. 222–223: Proves the packing hypothesis by induction on dim X: the gap principle applied to X − P₀ puts the close points in a bounded-degree exceptional set, whose components lie in translates of abelian subvarieties to which the induction and Rémond’s counting apply.

### Rémond’s bound for one subvariety (David–Philippon form)

`UB.5/remond-single-bound` · theorem

For a subvariety X of an abelian variety A over ℚ̄ of dimension g with symmetric ample L, and a subgroup Γ ⊆ A(ℚ̄) of finite rank r, X(ℚ̄) ∩ Γ is a union of at most (2^{34} h₀(A) deg_L X)^{(r+1) g^5 (dim X + 1)²} sets (x_i + B_i)(ℚ̄) ∩ Γ with x_i + B_i ⊆ X and B_i abelian subvarieties, where h₀(A) = max{1, h(A)} for David–Philippon’s height of the embedded A.

**Hypotheses.** A, L, X, Γ as stated.

**Construction or proof.**

1. Large points: the large-points bound (Rémond’s Vojta and Mumford inequalities), with c_NT and h₁ bounded by h₀(A).
2. Small points: David–Philippon’s lower bound for the Néron–Tate height on the complement of the Ueno locus in terms of h₀(A) and the degrees, combined with ball packing in the Néron–Tate space, bounds the points of height below the large-point threshold.
3. Induction on dim X handles the exceptional subvarieties; David–Philippon p. 643 records the resulting explicit constant. The David–Philippon article itself was not read for this plan (gap recorded): DGH and GGK quote only its form, and the explicit exponent is taken from the reviewed DGH extraction (item 67), whose reviewer read David–Philippon p. 643.

**Checks.**

- The bound depends on the height of A, unlike the uniform theorems; it is the input for the finitely many curves of small modular height in DGH Theorem 1.1.
- For r = 0 it is a bound, uniform in the base point, on torsion cosets: this repairs the small-height step of DGH Theorem 1.4 (source issue E6 of the DGH extraction).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.5/large-points-bound`, `HeightsRationalPointsAndObstructionsPartII:UB.0/ball-packing`, `HeightsRationalPointsAndObstructionsPartII:UB.5/neron-tate-euclidean`, `HeightsRationalPointsAndObstructionsPartII:UB.5/embedding-constants-bound`, `HeightsRationalPointsAndObstructions:RP.5/mordell-lang`

**Sources.** dgh-2021, Proofs of Theorems 1.1 and 1.2, pp. 34–36 (arXiv v3), citing David–Philippon, Comment. Math. Helv. 77 (2002), p. 643: Uses Rémond’s explicit bound for the number of cosets covering the points of a finite-rank subgroup on a fixed subvariety, in David–Philippon’s formulation, for the finitely many curves of small modular height.; ggk-2026, §7.1, (7.3)–(7.6), pp. 220–222 (citing David–Philippon, Theorem 6.8 and (6.41)): Recalls the David–Philippon formulation of Rémond’s theorem, in which the small-point count enters as a hypothesis.

**Open input.** David–Philippon’s form of Rémond’s bound not read.

## Layer UB.6: Uniform Mordell–Lang

The uniform count off the Ueno locus over ℚ̄ and over every algebraically closed field of characteristic 0 (GGK Theorem 1.1′, via Masser’s specialization and good models), the reduction from the count to cosets (Lemma 7.4), the uniform Mordell–Lang theorem (Theorem 1.1), its curve case (Kühne Theorem 4), and Dimitrov–Gao–Habegger’s bounds: the count for curves of large modular height (Proposition 8.1), Theorem 1.2 and Corollary 1.3, finiteness of small-height curves of bounded degree, and Theorem 1.1.

### The uniform count off the Ueno locus over ℚ̄

`UB.6/uniform-count-qbar` · theorem

For all g, d ≥ 0 there is c(g, d) > 0 such that for every abelian variety A over ℚ̄ of dimension g with ample L, every irreducible closed X ⊆ A with deg_L X = d and every finite-rank Γ ⊆ A(ℚ̄): #(X°(ℚ̄) ∩ Γ) ≤ c(g, d)^{1 + rk Γ}.

**Hypotheses.** A abelian over ℚ̄, L ample; X irreducible closed; Γ of finite rank.

**Construction or proof.**

1. Replace L by (L ⊗ [−1]^*L)^{⊗4}, symmetric, very ample and projectively normal; degrees change by a factor depending only on g and dim X.
2. Reduce to X generating A: X ⊆ A′ + Q with A′ = ⟨X − X⟩ of degree bounded in g, d (GGK Lemma 2.5); pass to X − Q ⊆ A′ and ⟨Γ, Q⟩ ∩ A′, raising the rank by at most one.
3. For generating X, (Hyp pack) holds (GGK Proposition 7.2), so Rémond’s counting theorem gives the bound with deg_L A bounded in terms of g and d.

**Checks.**

- For Γ = A_tors (rank 0) this is uniform Manin–Mumford: #(X° ∩ A_tors) ≤ c(g, d).
- For X = A, X° = ∅ (for g ≥ 1) and the bound is vacuous.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.5/remond-counting`, `HeightsRationalPointsAndObstructionsPartII:UB.5/packing-hypothesis-holds`, `HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety`, `HeightsRationalPointsAndObstructions:RP.5/ueno-locus`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`

**Sources.** ggk-2026, §7.2, pp. 222–223: Proves Theorem 1.1′ over ℚ̄: reduce to X generating A, then combine the packing hypothesis for L ⊗ [−1]^*L with Rémond’s counting theorem.

### Masser’s specialization of subgroups and endomorphisms

`UB.6/masser-specialization` · theorem

Let 𝒜 → V be an abelian scheme over an irreducible variety V over ℚ̄ with generic fibre A over the function field, and Γ ⊆ A a finitely generated subgroup of sections. The set of v ∈ V(ℚ̄) at which the specialization Γ → Γ_v is injective and End(A_{K̄}) → End(𝒜_v) is an isomorphism is Zariski dense in V.

**Hypotheses.** V irreducible over ℚ̄; 𝒜 → V abelian scheme; Γ finitely generated. K is the generic function field. All data descend to a finitely generated model over a number field; after a finite cover, generators of the geometric generic endomorphism ring extend, so the displayed specialization map is defined.

**Construction or proof.**

1. Injectivity on Γ: Masser’s Main Theorem (1989) gives a dense set of specializations injective on a finitely generated group of sections (a quantitative Silverman specialization; the parent’s Kummer–Hilbert specialization in RP.5 gives injectivity on a dense set as well).
2. Masser 1996 bounds the exceptional endomorphism-specialization locus, while Masser 1989 supplies quantitative injectivity on Γ. To obtain simultaneous density one needs a common bounded-degree/height counting family in which the union of both exceptional sets is smaller than the family. Intersecting two Zariski-dense sets is insufficient; neither the separate density statements nor Hilbert irreducibility without a thinness theorem proves the joint assertion.
3. The simultaneous quantitative specialization argument has not been verified from Masser 1989. GGK §7.2 invokes it; the existing source gap is strengthened to record this precise closure obstruction.

**Checks.**

- For a constant family with Γ generated by constant sections, the geometric endomorphism ring and Γ specialize identically at every point. Constancy of the abelian scheme alone does not make arbitrary sections constant.
- For the Legendre family and Γ generated by a non-torsion section, specialization at a parameter where the section becomes torsion is not injective; such parameters are Zariski dense yet the good set is still dense.

**Needs.** `AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension`, `HeightsRationalPointsAndObstructions:RP.5`, `InverseGaloisAndArithmeticFundamentalGroups:IG.2`

**Sources.** ggk-2026, Proof of Lemma 7.3, p. 224 (citing Masser, Trans. Amer. Math. Soc. 311 (1989), Main Theorem and Scholium 1; Masser, Bull. Soc. Math. France 124 (1996), Main Theorem): Uses Masser’s theorems that injectivity on a finitely generated group of sections and preservation of the endomorphism ring hold on a Zariski dense set of specializations.; masser-1996, Theorem, p. 459, and abstract, p. 457: For A over the function field of a variety V over a number field, the points of V(ℚ̄) of degree ≤ d and height ≤ h at which the absolute endomorphism ring of the fibre is not isomorphic to that of A lie on a hypersurface section of V of degree polynomial in max{d, h}.

**Open input.** Masser’s 1989 specialization theorem not read.

### Good models: the Ueno locus specializes

`UB.6/good-model-ueno` · theorem

Let X be a closed subvariety of an abelian variety A over the function field of an irreducible variety V over ℚ̄, spread out to a flat family 𝔛 ⊆ 𝒜 → V. After replacing V by a dense open, 𝔛 can be chosen so that for every v ∈ V(ℚ̄) the Ueno locus of 𝔛_v is the specialization of the Ueno locus of X; hence 𝔛_v° is the specialization of X°, and deg_L X = deg_{L_v} 𝔛_v.

**Hypotheses.** V irreducible over ℚ̄; X ⊆ A over ℚ̄(V).

**Construction or proof.**

1. The maximal cosets in X have finitely many directions B of bounded degree (parent RP.5, Ueno locus, Rémond’s bounds); spread each B and the loci X_B with Z(X) = ⋃ (X_B + B) over a dense open.
2. A coset in a fibre 𝔛_v of dimension > 0 has a direction of bounded degree; the bounded-degree abelian subschemes of 𝒜 are finite étale over a dense open (parent RP.5, §5.13c), so after shrinking V every such direction is the specialization of a generic one, and the coset lies in the specialization of Z(X).
3. Degrees are constant in flat families.

**Checks.**

- For X a curve of genus ≥ 2 the Ueno locus is empty generically and in every fibre of a good model.
- A good model must control specialization of the given X and its Ueno locus after shrinking. Extra endomorphisms alone need not create cosets in X; avoiding all CM fibres by one Zariski-open restriction is not asserted.

**Needs.** `HeightsRationalPointsAndObstructions:RP.5/ueno-locus`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`, `AbelianSchemesAndArithmeticModuli:A6`

**Sources.** ggk-2026, Proof of Lemma 7.3, p. 224 (citing Mazur, Bull. AMS 2000, pp. 219–220, and Hindry, Invent. Math. 94 (1988), Appendix 1, Lemma A): Chooses a good model in which the Ueno locus of each fibre is the specialization of the generic Ueno locus, so that the complements correspond and degrees are preserved by flatness.

### From ℚ̄ to arbitrary fields for finitely generated subgroups (GGK Lemma 7.3)

`UB.6/specialization-lemma` · theorem

If the uniform count off the Ueno locus holds over ℚ̄, then for every algebraically closed field F of characteristic 0, every abelian variety A over F with ample L, every irreducible X ⊆ A and every finitely generated Γ ⊆ A(F) of rank ρ, #(X°(F) ∩ Γ) ≤ c(g, deg_L X)^{1+ρ} with the same function c.

**Hypotheses.** F algebraically closed of characteristic 0; Γ finitely generated.

**Construction or proof.**

1. Choose a finitely generated ℚ̄-algebra over which A, L, X, the generators γ₁, …, γ_r of Γ and End(A) are defined; spread out over a regular irreducible variety V with A → V abelian, L relatively ample, endomorphisms extending, X flat, and γ_i sections.
2. Shrink V to make the model good for the Ueno locus.
3. For v in Masser’s dense set Θ, Γ → Γ_v is injective, so #(X°(F) ∩ Γ) ≤ #(𝔛_v°(ℚ̄) ∩ Γ_v) ≤ c(g, deg X)^{1 + rk Γ_v} ≤ c(g, deg X)^{1+ρ}.

**Checks.**

- For F = ℚ̄ the lemma is the identity.
- Only finitely generated Γ are treated here; finite rank is reached by a filtered union.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.6/uniform-count-qbar`, `HeightsRationalPointsAndObstructionsPartII:UB.6/masser-specialization`, `HeightsRationalPointsAndObstructionsPartII:UB.6/good-model-ueno`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`

**Sources.** ggk-2026, Lemma 7.3 and proof, pp. 223–224: Spreads the data over a regular variety over ℚ̄ and specializes at a point of Masser’s dense set, where the subgroup injects and the Ueno locus specializes.

### The uniform count off the Ueno locus (GGK Theorem 1.1′)

`UB.6/uniform-count` · theorem

For all g, d ≥ 0 there is c(g, d) > 0 such that for every algebraically closed field F of characteristic 0, every abelian variety A over F of dimension g with ample L, every irreducible closed X ⊆ A with deg_L X = d and every subgroup Γ ⊆ A(F) of finite rank: #(X°(F) ∩ Γ) ≤ c(g, d)^{1 + rk Γ}.

**Hypotheses.** F algebraically closed of characteristic 0; Γ of finite rank ρ.

**Construction or proof.**

1. Choose a finitely generated Γ₀ ⊆ A(F) of rank ρ with Γ contained in its division hull {x : [N]x ∈ Γ₀ for some N} (parent RP.5, finite rank).
2. For n ≥ 1, (1/n)Γ₀ = {x : [n]x ∈ Γ₀} is finitely generated of rank ρ; the specialization lemma gives #(X°(F) ∩ (1/n)Γ₀) ≤ c^{1+ρ} independently of n.
3. The (1/n!)Γ₀ form a filtered system exhausting the division hull, so #(X°(F) ∩ Γ) ≤ c^{1+ρ}. No End(A)-stability of Γ₀ is needed (source issue E14 of the GGK extraction: the printed choice Γ₀ = End(A)·Γ₀ can change the rank and is dropped).

**Checks.**

- For Γ = 0, X°(F) ∩ Γ is empty or the origin, and the bound holds trivially.
- The bound is independent of F and of A.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.6/specialization-lemma`, `HeightsRationalPointsAndObstructions:RP.5/finite-rank-subgroup`

**Sources.** ggk-2026, Theorem 1.1′ and (1.2), p. 191; proof §7.3, pp. 224–225: States the uniform count on the complement of the Ueno locus and proves it over arbitrary F from the finitely generated case by a filtered union of division groups.

### From the count off the Ueno locus to Mordell–Lang (GGK Lemma 7.4)

`UB.6/ueno-reduction` · theorem

If the uniform count off the Ueno locus holds for all (A, L), X and Γ, then the uniform Mordell–Lang theorem holds: for X generating A, X(F) ∩ Γ is covered by at most c₄c₆^{1+rk Γ} + #(X°(F) ∩ Γ) cosets x + B ⊆ X, with c₄, c₆ depending only on dim A and deg_L X.

**Hypotheses.** the uniform count off the Ueno locus for all data.

**Construction or proof.**

1. Reduce to X generating A as for the count over ℚ̄.
2. The maximal positive-dimensional directions B with x + B ⊆ X form a set Σ(X; A) of bounded size and degree (parent RP.5, Ueno locus: Bogomolov and Rémond’s bounds), and Z(X) = ⋃_B (X_B + B) with X_B = ⋂_{b∈B}(X − b) ∩ B^⊥ for a complement B^⊥ of bounded degree (parent RP.5, orthogonal complements; GGK cites Masser–Wüstholz for the complement).
3. Each coset of X ∩ Γ in direction B can be represented by a point of X_B° up to the addition isogeny f : B × B^⊥ → A: use the projected group Γ_B = pr₂(f^{-1}Γ) ⊆ B^⊥(F), of rank ≤ rk Γ (source issue E15 of the GGK extraction: the printed proof asks the representatives to lie in Γ itself).
4. Apply the count off the Ueno locus to each component of X_B with Γ_B, and once more to X° ∩ Γ for the zero-dimensional cosets.

**Checks.**

- If X° = X (no positive-dimensional cosets), the cosets are points and the statement is the count itself.
- Γ_B is not Γ ∩ B^⊥: intersecting with Γ can lose the coset representatives (E15).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.6/uniform-count`, `HeightsRationalPointsAndObstructions:RP.5/ueno-locus`, `HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety`, `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`

**Sources.** ggk-2026, Lemma 7.4 and proof, pp. 225–226: Writes the Ueno locus as a union over finitely many maximal coset directions B of X_B + B with X_B of bounded degree, chooses coset representatives off the Ueno loci of the X_B, and bounds their number by the count off the Ueno locus.

### The uniform Mordell–Lang theorem (Gao–Ge–Kühne Theorem 1.1)

`UB.6/uniform-mordell-lang` · theorem

For all integers g, d ≥ 0 there is c(g, d) > 0 such that for every algebraically closed field F of characteristic 0, every abelian variety A over F of dimension g with ample L, every irreducible closed X ⊆ A with deg_L X = d and every subgroup Γ ⊆ A(F) of finite rank, there are cosets x_i + B_i ⊆ X, 1 ≤ i ≤ N ≤ c(g, d)^{1 + rk Γ}, with X(F) ∩ Γ = ⋃_i (x_i + B_i)(F) ∩ Γ.

**Hypotheses.** F algebraically closed of characteristic 0; L ample; X irreducible closed; Γ of finite rank.

**Construction or proof.**

1. Apply the Ueno reduction to the uniform count off the Ueno locus; reduce a non-generating X to the abelian subvariety it generates after translation, which increases the rank by at most one and changes the constant only in terms of g and d.

**Checks.**

- For a curve C of genus ≥ 2 in its Jacobian this recovers the Dimitrov–Gao–Habegger–Kühne bound #(C(F) ∩ Γ) ≤ c(g)^{1 + rk Γ}.
- For Γ = A_tors it gives uniform Manin–Mumford: the torsion points of X lie on at most c(g, d) torsion cosets in X.
- The qualitative Mordell–Lang theorem of the parent (RP.5) is the statement without the bound on N; the uniform proof uses from it only the structure of the Ueno locus.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.6/ueno-reduction`, `HeightsRationalPointsAndObstructionsPartII:UB.6/uniform-count`, `HeightsRationalPointsAndObstructions:RP.5/mordell-lang`

**Sources.** ggk-2026, Theorem 1.1 and (1.1), p. 190; deduced from Theorem 1.1′ by Lemma 7.4, pp. 225–226: States the uniform Mordell–Lang conjecture: the points of a finite-rank subgroup on a subvariety are covered by a number of cosets inside the subvariety bounded exponentially in the rank, with base depending only on the dimension and degree.

### Uniform Mordell–Lang for curves (Kühne Theorem 4)

`UB.6/curve-uniform-mordell-lang` · theorem

For each g ≥ 2 there is c(g) > 0 such that for every smooth projective curve C of genus g over an algebraically closed field F of characteristic 0, every divisor D of degree 1 on C and every subgroup Γ ⊆ Jac(C)(F) of finite rank ρ, #(ι_D(C) ∩ Γ) ≤ c(g)^{1+ρ}. In particular a curve C of genus g over a number field K satisfies #C(K) ≤ c(g)^{1 + rk Jac(C)(K)}.

**Hypotheses.** g ≥ 2; C smooth projective over F algebraically closed of characteristic 0; D of degree 1; Γ of finite rank.

**Construction or proof.**

1. ι_D(C) ⊆ Jac(C) is an irreducible curve of degree g for the theta polarization with ι_D(C)° = ι_D(C).
2. Apply the uniform count with (g, d) = (g, g).
3. For rational points over K, choose D = a rational point if one exists (otherwise C(K) = ∅) and Γ = Jac(C)(K), of rank rk Jac(C)(K) (Mordell–Weil, parent RP.1).

**Checks.**

- Γ = Jac(C)_tors recovers uniform Manin–Mumford for curves.
- The bound for #C(K) does not depend on [K : ℚ], unlike Dimitrov–Gao–Habegger Theorem 1.1.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.6/uniform-mordell-lang`, `HeightsRationalPointsAndObstructionsPartII:UB.6/uniform-count`, `JacobianChallengePartII:JC2/degree-one-closed-immersion`, `JacobianChallengePartII:JC3/twice-theta`

**Sources.** kuhne-2021, Theorem 4, p. 8 (arXiv v4): States the uniform bound for points of a finite-rank subgroup on a curve embedded in its Jacobian, and the resulting bound for rational points depending only on the genus and the Mordell–Weil rank.; yuan-2026, §1.1, pp. 4–5 (author manuscript 21 August 2024): Recalls this bound as Kühne’s Theorem 4, obtained from the large-height bound and the gap principle, answering Mazur’s question.

### Counting on curves of large modular height (DGH Proposition 8.1)

`UB.6/large-moduli-height-count` · theorem

With M_g, τ, 𝔄_g and M as in the Abel–Jacobi bounds, there are c₁ ≥ 0 and c₂ ≥ 1 such that for every s ∈ M_g(ℚ̄) with h_{A_g,M}(τ(s)) ≥ c₁, every finite-rank Γ ⊆ 𝔄_{g,τ(s)}(ℚ̄) of rank ρ and every P₀ ∈ C_s(ℚ̄): #((C_s(ℚ̄) − P₀) ∩ Γ) ≤ c₂^{1+ρ}.

**Hypotheses.** s with large modular height; Γ of finite rank; P₀ ∈ C_s.

**Construction or proof.**

1. Choose P_s as in the Abel–Jacobi bounds, so h(C_s − P_s) ≤ c max{1, h(τ(s))}; replace Γ by Γ′ = ⟨Γ, P₀ − P_s⟩, of rank ≤ ρ + 1.
2. Large points: Rémond’s bound (curve case of the large-points bound) with c_NT, h₁ ≤ c max{1, h(τ(s))}: at most c^{ρ+1} points have ĥ > c₀ max{1, h(τ(s))}.
3. Small points: they lie in a ball of radius (c₀ max{1, h})^{1/2}; cover it by (1 + 2(c₀c₃)^{1/2})^{ρ+1} balls of radius (max{1, h}/c₃)^{1/2} centred at points of the set (ball packing; source issue E13 of the DGH extraction fixes the printed count); each ball holds fewer than c₄ points or its centre lies in the bounded exceptional set Ξ_s (the Néron–Tate distance proposition).

**Checks.**

- The bound does not depend on the height of the curve once that height is large.
- Below the threshold c₁ the proposition gives nothing; the small-height curves are handled by Northcott and Rémond’s single bound.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.4/neron-tate-distance`, `HeightsRationalPointsAndObstructionsPartII:UB.5/large-points-bound`, `HeightsRationalPointsAndObstructionsPartII:UB.5/embedding-constants-bound`, `HeightsRationalPointsAndObstructionsPartII:UB.4/abel-jacobi-bounds`, `HeightsRationalPointsAndObstructionsPartII:UB.0/ball-packing`, `HeightsRationalPointsAndObstructionsPartII:UB.5/neron-tate-euclidean`

**Sources.** dgh-2021, Proposition 8.1 and proof, pp. 31–34 (arXiv v3): Counts large points by Rémond’s large-point lemma with the constants c_NT, h₁ and the curve height bounded linearly in the modular height, and small points by ball packing at radius comparable to the modular height together with the Néron–Tate distance proposition; a general base point is handled by enlarging Γ.

### Uniform Mordell–Lang for curves of large modular height (DGH Theorem 1.2 and Corollary 1.3)

`UB.6/dgh-large-height` · theorem

For g ≥ 2 and an immersion ι of the coarse moduli space A_{g,1} into ℙ^m over ℚ̄ there are c₁ = c₁(g, ι) ≥ 0 and c₂ = c₂(g, ι) ≥ 1 such that for every smooth curve C of genus g over ℚ̄, P₀ ∈ C(ℚ̄) and finite-rank Γ ⊆ Jac(C)(ℚ̄) of rank ρ with h(ι([Jac(C)])) ≥ c₁: #((C(ℚ̄) − P₀) ∩ Γ) ≤ c₂^{1+ρ}. In particular (Γ = Jac(C)_tors) #((C(ℚ̄) − P₀) ∩ Jac(C)_tors) ≤ c₂.

**Hypotheses.** g ≥ 2; ι an immersion of the coarse moduli space; Jacobians of large height.

**Construction or proof.**

1. Choose a level-ℓ structure on C over ℚ̄, giving s ∈ M_g with τ(s) ↦ [Jac(C)] under the finite forgetful map ρ : A_{g,ℓ} → A_{g,1}.
2. Compare heights along ρ: h(ι(ρ(t))) ≤ c′h_{A_g,M}(t) + c″ (height machine; source issue E4 of the DGH extraction fixes the cross-reference), so a large height of ι([Jac(C)]) forces large modular height.
3. Apply the count for curves of large modular height; Γ = Jac(C)_tors has rank 0.

**Checks.**

- Corollary 1.3 is the case ρ = 0.
- The constants depend on the immersion ι, which the uniform Mordell–Lang theorem for curves removes together with the large-height hypothesis.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.6/large-moduli-height-count`, `StableReductionPartII:MC.6/smooth-torelli`, `ArakelovGeometryAndAbelianHeights:R35.5/modular-height-equals-faltings-height`, `HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`

**Sources.** dgh-2021, Theorem 1.2 and Corollary 1.3, p. 3; proof §8, pp. 35–36 (arXiv v3): States the bound for curves whose Jacobian has large height in a projective embedding of the coarse moduli space, and the torsion case as a corollary, deducing both from the count for curves of large modular height and a comparison of heights between the fine and coarse moduli spaces.

### Finitely many curves of small modular height and bounded degree

`UB.6/small-moduli-height-finite` · theorem

Fix g ≥ 2, d ≥ 1 and c₁. The smooth genus-g curves C defined over a number field F with [F : ℚ] ≤ d and h_{A_g,M}(τ(s)) < c₁ (for a level structure s over F′ ⊇ F) lie in finitely many ℚ̄-isomorphism classes, and the degree [F′ : F] of the field over which a level structure is defined is bounded in terms of g and the level.

**Hypotheses.** [F : ℚ] ≤ d; modular height < c₁.

**Construction or proof.**

1. A level-ℓ structure is defined over an extension F′ of degree at most #GL_{2g}(ℤ/ℓ); so τ(s) has bounded degree and bounded height.
2. Northcott on the moduli space (ArakelovGeometryAndAbelianHeights R35.5) leaves finitely many τ(s); Torelli has finite fibres (StableReductionPartII MC.6), so finitely many s.
3. Each s determines C over ℚ̄ up to isomorphism (the paper says F′-isomorphism classes; ℚ̄-isomorphism is what is used).

**Checks.**

- The field-degree bound is essential for Northcott: algebraic points of unbounded degree can have height zero (roots of unity in ℙ¹). Twists do not give distinct ℚ̄-isomorphism classes, so they are not a counterexample to this geometric finiteness statement.
- The finite set depends on (g, d, c₁, ℓ).

**Needs.** `ArakelovGeometryAndAbelianHeights:R35.5/moduli-height-northcott`, `StableReductionPartII:MC.6/torelli-finite-fibres`, `StableReductionPartII:MC.7/consumer-dgh`

**Sources.** dgh-2021, Proof of Theorem 1.1, pp. 34–35 (arXiv v3): Shows by Northcott on the moduli space and finiteness of the Torelli map that the curves of bounded degree and small modular height fall into finitely many isomorphism classes over the algebraic closure.

### Uniform bound for rational points (Dimitrov–Gao–Habegger Theorem 1.1)

`UB.6/dgh-rational-points` · theorem

For integers g ≥ 2 and d ≥ 1 there is c = c(g, d) ≥ 1 such that every smooth geometrically irreducible projective curve C of genus g over a number field F with [F : ℚ] ≤ d satisfies #C(F) ≤ c^{1+ρ}, ρ = rk Jac(C)(F). The constant can be chosen to grow at most polynomially in d.

**Hypotheses.** g ≥ 2; [F : ℚ] ≤ d.

**Construction or proof.**

1. If C(F) = ∅ there is nothing to prove; otherwise take P₀ ∈ C(F) and Γ = Jac(C)(F), of rank ρ (Mordell–Weil, parent RP.1).
2. Large modular height: the count for curves of large modular height.
3. Small modular height: finitely many curves over ℚ̄; for each, Rémond’s single bound (David–Philippon form) gives a bound uniform in P₀ and exponential in ρ.
4. Polynomial growth in d: in the small-height case h_Fal and the David–Philippon height are bounded (ArakelovGeometryAndAbelianHeights R35.5), and Rémond’s bound is polynomial in D·max{1, h_DP} with D ≤ [F′ : F]d.

**Checks.**

- The uniform Mordell–Lang theorem for curves removes the dependence on d.
- For ρ = 0, #C(F) is bounded in terms of g and d only (torsion packets are bounded).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.6/large-moduli-height-count`, `HeightsRationalPointsAndObstructionsPartII:UB.6/small-moduli-height-finite`, `HeightsRationalPointsAndObstructionsPartII:UB.5/remond-single-bound`, `ArakelovGeometryAndAbelianHeights:R35.5/theta-faltings-comparison`, `HeightsRationalPointsAndObstructions:RP.1`

**Sources.** dgh-2021, Theorem 1.1 and (1.1), pp. 1–2; proof §8 and the remark after it, pp. 34–35 (arXiv v3): Answers Mazur’s question for curves of bounded degree: large modular height by the count for curves of large height, small modular height by Northcott and Rémond’s bound for each of finitely many curves, with polynomial growth in the degree from the explicit form of Rémond’s bound and bounds for the Faltings and David–Philippon heights.

**Open input.** David–Philippon’s form of Rémond’s bound not read.

## Layer UB.7: Small points over function fields

Canonical heights over function fields as heights of invariant adelic extensions, the Zhang–Gubler inequalities e₁ ≥ ĥ(X) ≥ e₁/(dim X + 1) (so ĥ(X) = 0 iff small points are dense), dense sets of small points, special subvarieties tr(Y ⊗ K̄) + T, and density of small points on special subvarieties.

### Canonical heights as heights of the invariant adelic extension

`UB.7/adelic-canonical-comparison` · comparison

Let k be a field and K a function field of one variable over k (or k = ℤ and K a number field), A an abelian variety over K, L a symmetric ample line bundle and L̄ its invariant adelic extension with [2]^*L̄ = 4L̄. For x ∈ A(K̄), h_{L̄}(x) = ĥ_L(x), the Néron–Tate height in the normalization of adelic heights (over K, residue degrees over k), and for a closed subvariety X ⊆ A_{K̄} of dimension d, h_{L̄}(X) = (L̄|_X)^{d+1}/((d+1) deg_L X) equals the canonical height ĥ_L(X) of X (the limit n^{-2}h([n]X), equivalently the model intersection under everywhere good reduction).

**Hypotheses.** K a number field or a function field of one variable over k; L symmetric ample on A.

**Construction or proof.**

1. Both sides are invariant under [2] up to the factor 4 (L̄ by construction, AH.5; the canonical heights by the parent RP.0), and both differ from a model height by a bounded amount; Tate’s uniqueness gives equality on points.
2. For subvarieties, h_{L̄}(X) is the limit of model intersections along the Tate sequence 4^{-n}[2^n]^*L̄₀, which is the parent’s definition of ĥ_L(X) (model intersections agree with model metrics, RP.0); under everywhere good reduction it is the intersection of the rigidified symmetric model.

**Checks.**

- For X a point the subvariety height is the point height.
- For X = A (or an abelian subvariety, or a torsion translate of one) both sides vanish.
- The normalization over function fields keeps k fixed: replacing K by a finite extension multiplies neither side (heights are divided by the extension degree).

**Needs.** `ArakelovGeometryAndAbelianHeightsPartII:AH.5/invariant-extension`, `ArakelovGeometryAndAbelianHeightsPartII:AH.4/adelic-heights`, `HeightsRationalPointsAndObstructions:RP.0/geometric-subvariety-height`, `HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`, `HeightsRationalPointsAndObstructions:RP.0/model-mk-height-comparison`, `HeightsRationalPointsAndObstructions:RP.0/good-reduction-height-formula`

**Sources.** xy-2022, §1.1, (1.1)–(1.3), pp. 2–3 (arXiv v1): Defines canonical heights of subvarieties over function fields as limits of normalized model intersection numbers under multiplication; the identification with adelic heights is not stated there and is derived in this node.; yuan-2026, §2.3, p. 33; §4.1.2, pp. 63–64; §4.3.1, p. 71 (author manuscript 21 August 2024): Uses the invariant adelic extension of a symmetric rigidified bundle on an abelian scheme (citing Yuan–Zhang Theorem 6.1.1), normalizes heights of points of adelic line bundles over global fields, and takes the Néron–Tate height as half the canonical height of the twice-theta bundle; the equality of the two heights is used without a displayed statement.

### Essential minimum and canonical height over function fields (Zhang, Gubler)

`UB.7/zhang-gubler-minimum` · theorem

Let K be a function field of one variable over an algebraically closed field k, A/K an abelian variety, L symmetric ample and X ⊆ A_{K̄} closed and irreducible of dimension d. With e₁(X) = sup_{U ⊆ X open dense} inf_{x ∈ U(K̄)} ĥ_L(x): e₁(X) ≥ ĥ_L(X) ≥ e₁(X)/(d + 1). In particular ĥ_L(X) = 0 if and only if X contains a dense set of small points (X(ε) Zariski dense for every ε > 0).

**Hypotheses.** K/k of transcendence degree 1 with k algebraically closed; X irreducible.

**Construction or proof.**

1. Apply the fundamental inequality of ArakelovGeometryAndAbelianHeightsPartII AH.4 to L̄|_X, which is nef with ample (hence big) geometric part, and identify h_{L̄}(X) with ĥ_L(X) and point heights with Néron–Tate heights (the adelic comparison).
2. Both inequalities are the Yuan–Zhang fundamental inequality (Theorem 5.3.3 and Lemma 5.3.4) as planned in AH.4; Xie–Yuan quote only the upper one (Zhang, Gubler Lemma 4.1) and Gao–Habegger only the equivalence (Gubler Corollary 4.4).
3. If X(ε) is dense for all ε then e₁(X) = 0, so ĥ_L(X) = 0; conversely ĥ_L(X) = 0 gives e₁(X) ≤ (d + 1)·0 = 0, i.e. dense small points. The converse direction is the one Xie–Yuan’s induction needs (source issue E3 of the XY extraction).

**Checks.**

- For X a point, e₁ = ĥ(x) = ĥ(X).
- For X special (a torsion translate of the image of a constant subvariety), ĥ(X) = 0 and small points are dense.
- Over a number field the same inequalities hold (parent RP.5 essential minimum); the statement here is the function-field version needed for the geometric Bogomolov conjecture.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.7/adelic-canonical-comparison`, `ArakelovGeometryAndAbelianHeightsPartII:AH.4/fundamental-inequality`, `HeightsRationalPointsAndObstructions:RP.5/essential-minimum`

**Sources.** xy-2022, Proof of Lemma 5.2, p. 23 (arXiv v1), citing Zhang (1995, Theorem 1.10) and Gubler (2007, Lemma 4.1): Uses Zhang’s fundamental inequality in Gubler’s function-field form to show that dense small points force canonical height zero.; gh-2019, §A.3, p. 57 (arXiv v3), citing Zhang and Gubler (2007, Corollary 4.4): Uses the equivalence of vanishing essential minimum and vanishing canonical height of a subvariety over a function field.

### Dense sets of small points over a function field

`UB.7/small-points` · definition

Let k be algebraically closed, K/k finitely generated of transcendence degree ≥ 1 with a polarization (S, M) (S a normal projective model of K over k, M ample), A/K an abelian variety, L symmetric ample and ĥ the canonical height defined by L and (S, M). For a closed subvariety X ⊆ A_{K̄} and ε > 0 put X(ε) = {x ∈ X(K̄) : ĥ(x) < ε}. X contains a dense set of small points of A/K/k if X(ε) is Zariski dense in X for every ε > 0.

**Hypotheses.** K/k finitely generated, trdeg ≥ 1, k algebraically closed; polarization (S, M).

**Construction or proof.**

1. Use the parent’s canonical heights over polarized function fields (RP.0).
2. Independence: two choices of (L, S, M) give heights with n^{-1}ĥ ≤ ĥ′ ≤ nĥ (comparison of ample bundles, parent RP.0 height laws), so density of X(ε) for all ε is unchanged.

**Uses.** Xie–Yuan, Theorem 1.1: the hypothesis of the geometric Bogomolov conjecture; Gao–Habegger, Theorem 1.1: the conclusion is that small points are not dense.

**API.**

- `SmallPoints` (data): X(ε) ⊆ X(K̄) for ε > 0.
- `HasDenseSmallPoints` (data): The predicate: X(ε) Zariski dense in X for all ε > 0.
- `HasDenseSmallPoints.indep` (other): Independent of L and of the polarization (S, M).
- `HasDenseSmallPoints.image` (functoriality): If X has dense small points and f : A → B is a homomorphism, then the closure of f(X) has dense small points.
- `HasDenseSmallPoints.base_change` (functoriality): Preserved under finite extension of K and extension of the algebraically closed constant field (parent RP.0 base change).
- `HasDenseSmallPoints.iff_height_zero` (characterisation): For trdeg(K/k) = 1 and X irreducible: X has dense small points iff ĥ(X) = 0 (Zhang–Gubler).

**Unit tests.**

- `HasDenseSmallPoints.torsion_point` (computation): A torsion point x has ĥ(x) = 0, so {x} has dense small points.
- `HasDenseSmallPoints.nontorsion_trivial_trace` (non-example): If A has trivial geometric K̄/k̄-trace, a non-torsion point has ĥ > 0 and {x} has no dense small points.
- `HasDenseSmallPoints.constant_point` (computation): For a constant elliptic curve E₀ ⊗_k K and a point of E₀(k) of infinite order, ĥ = 0, so a non-torsion point can have dense small points over a function field (the trace).
- `HasDenseSmallPoints.whole` (degenerate): X = A has dense small points (torsion is dense).
- `HasDenseSmallPoints.isotrivial_twist` (non-example): In characteristic zero, a nontrivial quadratic twist over k(t) of a constant elliptic curve with generic j can have zero k(t)/k-trace but becomes constant after a quadratic extension. Non-torsion constant points then have geometric height zero. Ordinary trace zero cannot replace geometric trace zero.

**Needs.** `HeightsRationalPointsAndObstructions:RP.0/geometric-height-field`, `HeightsRationalPointsAndObstructions:RP.0/geometric-subvariety-height`, `HeightsRationalPointsAndObstructions:RP.0/geometric-height-laws`

**Sources.** xy-2022, §1.1, (1.4), p. 3 (arXiv v1): Defines the set of points of height below ε and the property of containing a dense set of small points, noting its independence of the choice of L and of the polarization since any two such heights bound each other up to positive multiples.

### Special subvarieties of an abelian variety over a function field

`UB.7/special-subvariety` · definition

Fix algebraic closures k̄ ⊆ K̄ for a function-field extension K/k, and let A/K be abelian. Let (T,tr) be the K̄/k̄-trace of A_{K̄}, with tr : T_{K̄} → A_{K̄}. An irreducible closed X ⊆ A_{K̄} is special for A/K/k if X = tr(Y_{K̄}) + (a+B), where Y ⊆ T is an irreducible closed subvariety over k̄, B ⊆ A_{K̄} is an abelian subvariety, and a is torsion. Here a torsion subvariety means one torsion translate, as in XY (1.5); a reducible closed set is treated componentwise.

**Hypotheses.** K/k a function-field extension, fixed algebraic closures k̄ ⊆ K̄; A/K abelian; X geometrically irreducible over K̄.

**Construction or proof.**

1. Apply the parent’s Chow trace to the regular extension K̄/k̄. The trace map has finite kernel (a closed immersion in characteristic zero; possibly inseparable kernel in positive characteristic). Its image and the torsion translate are summed by the proper addition map.
2. A torsion subvariety is a torsion translate a + C of an abelian subvariety C (XY’s convention for (1.5)); the sum is the image of the addition map.

**Uses.** Xie–Yuan, Theorem 1.1: the conclusion of the geometric Bogomolov conjecture; Xie–Yuan, Proposition 3.6: the field over which X becomes special is minimal and unique; Gao–Habegger, Definition 1.2: over a curve, a subvariety dominating S is generically special iff its geometric generic fibre is special in this sense.

**API.**

- `IsSpecial` (data): The predicate X special for A/K/k.
- `IsSpecial.torsion` (other): Every torsion subvariety is special (Y = {0}).
- `IsSpecial.constant` (other): tr(Y ⊗ K̄) is special for every Y ⊆ T.
- `IsSpecial.trivial_trace` (characterisation): If T = 0, X is special iff X is a torsion subvariety.
- `IsSpecial.image` (functoriality): The image of a special subvariety under a homomorphism is special.
- `IsSpecial.generically_special` (compatibility): For K = k(S) with S a curve over k = ℚ̄ (or algebraically closed of characteristic 0), an irreducible 𝒳 ⊆ 𝒜 dominating S is generically special (AbelianSchemesAndArithmeticModuliPartII B2) iff its geometric generic fibre is special.
- `IsSpecial.dense_small` (relation): Special subvarieties contain dense sets of small points.

**Unit tests.**

- `IsSpecial.point` (computation): A point x ∈ A(K̄) is special iff x ∈ tr(T(k̄)) + A_tors.
- `IsSpecial.constant_curve` (computation): For a constant abelian variety A = A₀ ⊗_k K and a curve C₀ ⊆ A₀, C₀ ⊗ K̄ is special though it is not a torsion subvariety.
- `IsSpecial.nonconstant_curve` (non-example): A genus-≥ 2 curve in its Jacobian over K with J of trivial trace (a non-isotrivial curve with simple non-isotrivial Jacobian) is not special.
- `IsSpecial.translate_nontorsion` (non-example): A translate x + C of an abelian subvariety by a point x that is non-torsion modulo C + tr(T) is not special.

**Needs.** `HeightsRationalPointsAndObstructions:RP.1/kk-trace`, `HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety`, `HeightsRationalPointsAndObstructions:RP.5/minimal-torsion-subvariety`, `AbelianSchemesAndArithmeticModuliPartII:B2/generically-special`

**Sources.** xy-2022, §1.1, (1.5), p. 3; §3.2, (3.3), p. 15 (arXiv v1): Defines special subvarieties as sums of the trace image of a constant subvariety and a torsion subvariety, first for k algebraically closed and then, in (3.3), for k algebraically closed in K using algebraic closures.

### Special subvarieties have dense small points

`UB.7/special-has-small-points` · theorem

If X ⊆ A_{K̄} is special for A/K/k, then X(ε) is Zariski dense in X for every ε > 0.

**Hypotheses.** X special.

**Construction or proof.**

1. Points of tr(Y ⊗ K̄)(k̄-rational, i.e. images of Y(k̄)) have height 0 (constant points are in the kernel of the Néron–Tate height over function fields, parent RP.1) and are dense in tr(Y ⊗ K̄).
2. Torsion points of an abelian subvariety C are dense in C (prime-to-p torsion is dense, AbelianSchemesAndArithmeticModuli A3) and have height 0.
3. Sums of height-zero points have height zero (ĥ is a quadratic form whose zero set is a subgroup); a dense subset of a product maps onto a dense subset of the sum.

**Checks.**

- A torsion point has dense small points trivially.
- Over number fields the trace part is absent, and special means torsion subvariety.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.7/special-subvariety`, `HeightsRationalPointsAndObstructionsPartII:UB.7/small-points`, `HeightsRationalPointsAndObstructions:RP.1/function-field-neron-tate-kernel`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`

**Sources.** xy-2022, §1.1, p. 3 (arXiv v1), citing Lang, Fundamentals of Diophantine Geometry, Chapter 6, Theorem 5.4: Records that special subvarieties contain dense sets of small points, the easy direction of the geometric Bogomolov conjecture.

## Layer UB.8: Geometric Bogomolov over function fields of curves in characteristic zero

Gao–Habegger: the complement X* of the generically special subvarieties (Proposition 1.3), bounded order of torsion of bounded degree (Proposition B.1), special points of V₀(k) × A_tors (Propositions 3.1, B.3), the height inequality over a curve on X* (Theorems 1.4, 1.4′, here from the DGH inequality and Gao–Habegger’s degeneracy theorem), the geometric Bogomolov theorem over ℚ̄(S) (Theorem 1.1), its Moriwaki-height version (Theorem A.3) and the extension to every algebraically closed field of characteristic 0.

### The complement X* of the generically special subvarieties (GH Proposition 1.3)

`UB.8/generically-special-locus` · construction

Let π : 𝒜 → S be an abelian scheme over a smooth irreducible curve S over an algebraically closed field k of characteristic 0 and X ⊆ 𝒜 irreducible closed. Only finitely many generically special subvarieties of 𝒜 contained in X are maximal for that property; X* = X ∖ ⋃{Y ⊆ X generically special} is Zariski open in X, and X* = ∅ if and only if X is generically special.

**Hypotheses.** S smooth irreducible curve over algebraically closed k of characteristic 0; X ⊆ 𝒜 irreducible closed.

**Construction or proof.**

1. Split A_{K̄} up to isogeny as A′ × A″ with A′ = tr(A^{K/k} ⊗ K̄) and (A″)^{K/k} = 0 (Poincaré reducibility).
2. A generically special Y corresponds on the geometric generic fibre to a subvariety of V × A″ meeting V₀(k) × A″_tor densely, with V₀ = A^{K/k}; the special-points theorem gives the product form and finiteness of maximal ones.
3. X* is the complement of a finite union of closed subsets, hence open.

**Uses.** Gao–Habegger, Theorem 1.4: the height inequality holds on X*; Gao–Habegger, Theorem 1.1: X ⊗ K̄ not special iff X* ≠ ∅ for its closure.

**API.**

- `GenericallySpecialLocus` (data): X* ⊆ X, open.
- `GenericallySpecialLocus.isOpen` (other): X* is Zariski open in X.
- `GenericallySpecialLocus.eq_empty_iff` (characterisation): X* = ∅ iff X is generically special.
- `GenericallySpecialLocus.finite_maximal` (other): Finitely many maximal generically special subvarieties lie in X.
- `GenericallySpecialLocus.inter_le` (relation): For Z ⊆ X closed irreducible, X* ∩ Z ⊆ Z*, hence X* ⊆ (X ∖ Z) ∪ Z* (GH (10.4)).

**Unit tests.**

- `GenericallySpecialLocus.torsion_section` (computation): For the image X of a torsion section, X is generically special and X* = ∅.
- `GenericallySpecialLocus.whole` (degenerate): X = 𝒜 is generically special (B = A), so 𝒜* = ∅.
- `GenericallySpecialLocus.non_torsion_section` (non-example): For a non-torsion section of a non-isotrivial elliptic surface, X* = X.

**Needs.** `AbelianSchemesAndArithmeticModuliPartII:B2/generically-special`, `HeightsRationalPointsAndObstructionsPartII:UB.7/special-subvariety`, `HeightsRationalPointsAndObstructionsPartII:UB.8/special-points-product`, `HeightsRationalPointsAndObstructions:RP.1/kk-trace`, `HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety`

**Sources.** gh-2019, Definition 1.2 and display below it, p. 3; Proposition 1.3, p. 3; proof §3.1, p. 12 (arXiv v3): Defines generically special subvarieties and the complement X*, and proves finiteness of the maximal ones through the Poincaré splitting into trace part and trace-free part and the special-points theorem for V₀(k) × A_tor.

### Torsion of bounded degree has bounded order (GH Proposition B.1)

`UB.8/torsion-bounded-order` · theorem

Let S be a smooth irreducible quasi-projective variety over an algebraically closed field k of characteristic 0, K = k(S), and A an abelian variety over K with (A_{K̄})^{K̄/k} = 0. For every D ≥ 1 the orders of the points of {P ∈ A(K̄)_tors : [K(P) : K] ≤ D} are bounded in terms of A and D.

**Hypotheses.** S smooth irreducible quasi-projective over algebraically closed k of characteristic zero; A is defined over K=k(S) and has trivial geometric K̄/k-trace.

**Construction or proof.**

1. Spread A to an abelian scheme over a dense open S° ⊆ S; the closure of a torsion point of order N is a component of 𝒜[N], finite étale over S°.
2. Finite étale covers of S° of degree ≤ D are finitely many up to isomorphism after fixing ramification (GH Lemma B.2: the compositum of all of them is a finite extension K_D).
3. All such torsion points lie in A(K_D)_tors, which is finite by Lang–Néron since the trace is zero (parent RP.1). The geometric trace hypothesis ensures the trace remains zero over the finite extension K_D.

**Checks.**

- For a constant abelian variety (non-zero trace) the statement fails: all torsion of A₀(k) is K-rational.
- D = 1 gives finiteness of A(K)_tors for trace-free A.
- An isotrivial twist with zero ordinary K/k-trace can acquire all constant torsion over a fixed finite extension, giving bounded-degree torsion of unbounded order. The geometric trace hypothesis excludes it.

**Needs.** `HeightsRationalPointsAndObstructions:RP.1/lang-neron`, `HeightsRationalPointsAndObstructions:RP.1/kk-trace`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`

**Sources.** gh-2019, Proposition B.1 and proof, p. 58; the case dim S = 1 is the claim (3.2), p. 14 (arXiv v3): Shows that the closure of a torsion point of bounded degree is finite étale over a dense open, bounds the compositum of the fields generated, and concludes by Lang–Néron.

### Special points of V₀(k) × A_tors (GH Propositions 3.1 and B.3)

`UB.8/special-points-product` · theorem

Let k be algebraically closed of characteristic 0, S a smooth irreducible quasi-projective variety over k, K = k(S)‾, A an abelian variety over K with A^{K/k} = 0, V₀ an irreducible variety over k, V = V₀ ⊗_k K and Σ = V₀(k) × A_tors. (i) If Y ⊆ V × A is irreducible closed with Y(K) ∩ Σ Zariski dense in Y, then Y = (W₀ ⊗_k K) × (P + B) with W₀ ⊆ V₀ irreducible closed, P ∈ A_tors and B an abelian subvariety. (ii) A given Y contains only finitely many maximal subvarieties of this form.

**Hypotheses.** k algebraically closed, char 0; A over k(S)‾ of trivial trace; V₀ irreducible over k.

**Construction or proof.**

1. Choose a finitely generated function field of definition F/k and a smooth model over which the geometric abelian variety, Y, and the finite set of subgroup types are defined. Apply the bounded-degree torsion theorem to that field F and its finite extensions; degrees over the already algebraically closed K̄ would carry no information.
2. View Y as a family over V₀: for v ∈ V₀(k) the fibre Y_v ⊆ A meets A_tors densely only along torsion cosets; uniform Manin–Mumford in families (parent RP.5) gives finitely many directions B and a uniform bound on the number of cosets.
3. The torsion points involved have bounded degree over K by a Galois-orbit count (k-points of V₀ are Galois-fixed), hence bounded order by the bounded-order proposition; apply [N] ∘ (A → A/B) to reduce to B = 0 and a finite set of torsion points.
4. Fibre dimension then forces Y = (W₀ ⊗ K) × (P + B); finiteness of maximal ones follows from the finiteness of directions and of torsion orders. Misprints E1–E3 and the torsion-point convention E20 of the GH extraction are applied.

**Checks.**

- For V₀ a point, (i) is Manin–Mumford over K for trace-free A.
- Trivial trace is necessary: for constant A = A₀ ⊗ K, the diagonal of A₀ × A₀ meets V₀(k) × A_tors (V₀ = A₀) in a dense set without being a product.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.8/torsion-bounded-order`, `HeightsRationalPointsAndObstructions:RP.5/uniform-manin-mumford`, `HeightsRationalPointsAndObstructions:RP.5/manin-mumford`

**Sources.** gh-2019, Proposition 3.1 and proof, pp. 12–15 (curve base); Proposition B.3, p. 59 (any base) (arXiv v3): Proves the product structure of subvarieties with dense special points using uniform Manin–Mumford in the family over V₀, a Galois-orbit bound and the bounded order of torsion of bounded degree, then extends from curves to bases of any dimension.

### Height inequality over a curve (Gao–Habegger Theorem 1.4)

`UB.8/curve-base-height-inequality` · theorem

Let π : 𝒜 → S be an abelian scheme over a smooth irreducible curve S over ℚ̄, L a symmetric relatively ample line bundle and M ample on a compactification S̄. For every closed irreducible X ⊆ 𝒜 there is c > 0 with h_{S̄,M}(π(P)) ≤ c(1 + ĥ_{𝒜,L}(P)) for all P ∈ X*(ℚ̄). With L′ = L ⊗ π^*M and an immersion ι : 𝒜 → ℙ^m × S̄ by (L′)^{⊗n}, also h_{𝒜,L′}(P) ≤ c(1 + ĥ_{𝒜,L}(P)) on X*(ℚ̄) (Theorem 1.4′).

**Hypotheses.** S smooth irreducible curve over ℚ̄; L symmetric relatively ample; M ample on S̄; X ⊆ 𝒜 closed irreducible.

**Construction or proof.**

1. If X is generically special, X* = ∅. Otherwise X is non-degenerate: over a curve, degenerate implies generically special (Gao–Habegger Theorem 5.1, AbelianSchemesAndArithmeticModuliPartII B2).
2. The height inequality for non-degenerate subvarieties gives a dense open U ⊆ X with ĥ(P) ≥ c₁h_{S̄,M}(π(P)) − c₂ on U, i.e. h(π(P)) ≤ c(1 + ĥ(P)).
3. Induct on dim X: the components Z_i of X ∖ U satisfy X* ⊆ U ∪ ⋃ Z_i* (GH (10.4)), and the induction hypothesis applies to each Z_i.
4. Theorem 1.4′: h_{𝒜,L′}(P) = n^{-1}h(ι(P)) + h_{S̄,M}(π(P)) up to O(1), and Silverman–Tate bounds n^{-1}h(ι(P)) by ĥ(P) + c(1 + h(π(P))) (the first inequality comes from the definition of L′, not from (1.1); source issue E15 of the GH extraction).
5. Gao–Habegger’s own proof of the inequality on a dense open (their §§6–10: auxiliary subvarieties, lattice points in Betti coordinates, many isolated division points, Habegger’s degree lemmas) is an alternative route, not used here.
6. If X is vertical over S, π(X) is one point, its base height is bounded, and the inequality follows from ĥ ≥ 0 after enlarging c. The generic-fibre argument is only needed for X dominating S.

**Checks.**

- The inequality fails on torsion multisections: ĥ = 0 while h(π(P)) is unbounded, so X* cannot be enlarged to X.
- For X = 𝒜 (generically special) the statement is empty.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.2/height-inequality`, `HeightsRationalPointsAndObstructionsPartII:UB.8/generically-special-locus`, `AbelianSchemesAndArithmeticModuliPartII:B2/degenerate-generically-special`, `AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate`, `HeightsRationalPointsAndObstructions:RP.0/silverman-tate`

**Sources.** gh-2019, Theorem 1.4 and (1.1), p. 4; Theorem 1.4′, p. 5; proof §10.2, p. 52 (arXiv v3): States the height inequality on the complement of the generically special subvarieties over a one-dimensional base and the version with a naive height, proving it by induction on dim X from the inequality on a dense open.; dgh-2021, Theorem B.1, p. 40 (arXiv v3): Generalizes the inequality to bases of any dimension for non-degenerate subvarieties.

### Geometric Bogomolov over function fields of curves over ℚ̄ (Gao–Habegger Theorem 1.1)

`UB.8/geometric-bogomolov-curve` · theorem

Let K be the function field of a smooth projective curve S over ℚ̄, A an abelian variety over K with symmetric ample L, and X ⊆ A irreducible closed with X ⊗_K K̄ irreducible and not special (not of the form B + (Z ⊗_ℚ̄ K̄) with Z ⊆ A^{K̄/ℚ̄} closed irreducible and B a torsion coset of A ⊗_K K̄). Then there is ε > 0 such that {x ∈ X(K̄) : ĥ_{K,A,L}(x) ≤ ε} is not Zariski dense in X.

**Hypotheses.** K = ℚ̄(S), S smooth projective curve; X ⊗ K̄ irreducible and not special.

**Construction or proof.**

1. Spread A, L to π : 𝒜 → S° over a dense open and let 𝒳 be the closure of X; X ⊗ K̄ not special means 𝒳 is not generically special, so 𝒳* is open dense.
2. For x ∈ X(K̄) with σ_x(S′) meeting 𝒳*, the height inequality gives h_S(ρ(t)) ≤ c(1 + ĥ(σ_x(t))) for t ∈ S′ with σ_x(t) ∈ 𝒳*.
3. Silverman’s height limit (parent RP.0): ĥ(σ_x(t))/h_S(ρ(t)) → ĥ_{K,A}(x) as h_S(ρ(t)) → ∞; hence ĥ_{K,A}(x) ≥ 1/c, i.e. ≥ deg(S)/c in GH’s normalization.
4. Small points therefore lie in the closed complement of 𝒳* restricted to the generic fibre, a proper closed subset of X.

**Checks.**

- A special X has dense small points (special-has-small-points), so the hypothesis is necessary.
- Agrees with Xie–Yuan Theorem 1.1 for characteristic 0 and transcendence degree 1.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.8/curve-base-height-inequality`, `HeightsRationalPointsAndObstructionsPartII:UB.8/generically-special-locus`, `HeightsRationalPointsAndObstructions:RP.0/silverman-specialization-limit`, `HeightsRationalPointsAndObstructionsPartII:UB.7/special-subvariety`, `HeightsRationalPointsAndObstructionsPartII:UB.7/small-points`

**Sources.** gh-2019, Theorem 1.1, p. 2; proof §11, pp. 52–54 (arXiv v3): Spreads out to an abelian scheme over an open of the curve, applies the height inequality to the closure of X and compares with Silverman’s height limit along the section of each small point, obtaining a lower bound for the function-field height off a proper closed subset.

### The height inequality with Moriwaki heights (GH Theorem A.3)

`UB.8/moriwaki-height-inequality` · theorem

Let k₀ be finitely generated over ℚ with a polarization B, 𝒜 → S an abelian scheme over a smooth irreducible quasi-projective curve over k₀, L symmetric relatively ample and M ample on S̄ (both over k₀), and X ⊆ 𝒜 closed irreducible over k₀ with X* as in the generically special locus for k = k̄₀. There is c > 0 depending on B, 𝒜/S, X, L, M with h^B_{S̄,M}(π(P)) ≤ c(1 + ĥ^B_{𝒜,L}(P)) for all P ∈ X*(k̄₀).

**Hypotheses.** k₀ finitely generated over ℚ with polarization B; S smooth irreducible curve over k₀.

**Construction or proof.**

1. Reduce to k₀ ⊆ ℂ by a field isomorphism (Moriwaki heights transport, AH.6).
2. Rerun the proof of the height inequality: the Betti-form and intersection arguments are geometric over ℂ; only the height machine, Néron–Tate heights and Silverman–Tate are replaced by their Moriwaki versions (ArakelovGeometryAndAbelianHeightsPartII AH.6).
3. The left-hand side is the base height h^B_{S̄,M}(π(P)) (E24).

**Checks.**

- For k₀ a number field, Moriwaki heights are Weil heights and the statement is the height inequality over a curve.
- This is a sketch in the source; the plan treats it as a theorem whose proof is the same as over ℚ̄ with the AH.6 inputs.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.8/curve-base-height-inequality`, `ArakelovGeometryAndAbelianHeightsPartII:AH.6/moriwaki-heights`, `ArakelovGeometryAndAbelianHeightsPartII:AH.6/moriwaki-height-machine`, `ArakelovGeometryAndAbelianHeightsPartII:AH.6/moriwaki-silverman-tate`, `ArakelovGeometryAndAbelianHeightsPartII:AH.6/moriwaki-neron-tate`

**Sources.** gh-2019, Theorem A.3 and sketch, p. 56 (arXiv v3): States the height inequality over a curve over a finitely generated field with Moriwaki heights, obtained by repeating the proof with the Moriwaki height machine and Silverman–Tate; the printed left-hand side names the wrong height (source issue E24 of the GH extraction).

### Geometric Bogomolov over function fields of curves in characteristic zero

`UB.8/geometric-bogomolov-char-zero` · theorem

Gao–Habegger’s Theorem 1.1 holds with ℚ̄ replaced by any algebraically closed field k of characteristic 0: for K the function field of a smooth projective curve over k, A/K abelian with symmetric ample L and X ⊆ A irreducible with X ⊗ K̄ irreducible and not special, the points of X(K̄) of small canonical height are not Zariski dense.

**Hypotheses.** k algebraically closed of characteristic 0; S smooth projective curve over k.

**Construction or proof.**

1. Descend S, A, L, X to a finitely generated k₀ ⊆ k; with Moriwaki heights the height inequality and Silverman’s limit (AH.6) give, as over ℚ̄, that X has no dense small points over k̄₀(S), i.e. e₁(X_{k̄₀}) > 0. Choose a big Moriwaki polarization on k₀ so that the ample base height has the unboundedness needed in the specialization-limit argument; arbitrary degenerate polarizations need not supply it.
2. By the Zhang–Gubler inequalities, e₁ > 0 iff ĥ(X) > 0; the canonical height of a subvariety is unchanged by extending the algebraically closed constant field from k̄₀ to k (parent RP.0 base and constant extension).
3. Hence ĥ(X_k) > 0 and e₁(X_k) ≥ ĥ(X_k) > 0. The source calls this a sketch; the plan supplies the two inputs as nodes.

**Checks.**

- Contained in Xie–Yuan Theorem 1.1, which also covers positive characteristic and higher transcendence degree.
- The constant field extension does not create new special structure: the trace does not grow under algebraically closed constant extension in characteristic 0.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.8/geometric-bogomolov-curve`, `HeightsRationalPointsAndObstructionsPartII:UB.8/moriwaki-height-inequality`, `HeightsRationalPointsAndObstructionsPartII:UB.7/zhang-gubler-minimum`, `HeightsRationalPointsAndObstructions:RP.0/geometric-height-base-change`, `ArakelovGeometryAndAbelianHeightsPartII:AH.6/moriwaki-silverman-tate`

**Sources.** gh-2019, Appendix A, §A.3, pp. 56–57 (arXiv v3): Sketches the extension to all algebraically closed fields of characteristic 0: descend to a finitely generated field, run the proof with Moriwaki heights, and pass to the full constant field through the essential minimum.

## Layer UB.9: The geometric Bogomolov conjecture in all characteristics

Xie–Yuan: fields of definition up to isogeny and of subvarieties (Lemma 3.3, Proposition 3.2, Lemma 3.4, Corollary 3.5), the field over which X becomes special (Proposition 3.6), generic pencil members and their height inequality (Lemma 3.7), lowering the transcendence degree (Proposition 3.1), torsion multi-sections and their numerical class (Proposition 4.2), Yamaki’s reduction, the reduction to (a)–(d), iterated sums and Lemma 5.3, the jump locus, torsion fibres of height zero (Proposition 5.4), the good-reduction case (§5.3) and Theorem 1.1, with the recorded repairs.

### Abelian varieties defined over a subfield up to isogeny

`UB.9/defined-up-to-isogeny` · definition

Let K be a field, k ⊆ K a subfield and A an abelian variety over K. A is defined over k up to isogeny if there is an abelian variety A′ over k with A isogenous to A′ ⊗_k K.

**Hypotheses.** k ⊆ K fields; A/K abelian.

**Construction or proof.**

1. A predicate on intermediate fields, using isogenies of abelian varieties over K (AbelianSchemesAndArithmeticModuli A6).

**Uses.** Xie–Yuan, Proposition 3.2 and Corollary 3.5(i): the set of algebraically closed intermediate fields over which A is defined up to isogeny has a least element k_A; Xie–Yuan, Proposition 3.6: the field k_{A,X} over which X becomes special contains k_A.

**API.**

- `AbelianVariety.DefinedUpToIsogeny` (data): The predicate for A/K and k ⊆ K.
- `DefinedUpToIsogeny.mono` (other): If k ⊆ k′ ⊆ K and A is defined over k up to isogeny, then over k′.
- `DefinedUpToIsogeny.isogeny_invariant` (other): The predicate depends only on the isogeny class of A.
- `DefinedUpToIsogeny.trace` (compatibility): For a regular extension K/k (in particular for algebraically closed k), A is defined over k up to isogeny iff the K/k-trace map is an isogeny. No trace existence or base-change claim is made for arbitrary inseparable extensions.

**Unit tests.**

- `DefinedUpToIsogeny.self` (degenerate): Every A is defined over K up to isogeny.
- `DefinedUpToIsogeny.constant` (computation): A₀ ⊗_k K is defined over k.
- `DefinedUpToIsogeny.legendre` (non-example): The Legendre elliptic curve y² = x(x − 1)(x − t) over k(t) (k algebraically closed) has non-constant j-invariant and is not defined over k up to isogeny.

**Needs.** `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `AbelianSchemesAndArithmeticModuli:A6`, `mathlib:IntermediateField`

**Sources.** xy-2022, §3.1, p. 13 (arXiv v1): Defines when an abelian variety over K is defined over a subfield up to isogeny.

### Isogeny descends to an algebraically closed base (XY Lemma 3.3)

`UB.9/isogeny-descent-closed` · theorem

Let A₁, A₂ be abelian varieties over an algebraically closed field k and K/k any field extension. If A₁ ⊗_k K is isogenous to A₂ ⊗_k K, then A₁ is isogenous to A₂.

**Hypotheses.** k algebraically closed.

**Construction or proof.**

1. The isogeny is defined over a finitely generated k-algebra R ⊆ K; it extends to a homomorphism of constant abelian schemes over a dense open of Spec R with finite kernel (relative Hom, AbelianSchemesAndArithmeticModuli A6).
2. Specialize at a k-point (k algebraically closed): the specialization is a homomorphism A₁ → A₂ with finite kernel and equal dimensions, hence an isogeny.

**Checks.**

- For k not algebraically closed the lemma can fail without a rational specialization point; for k algebraically closed every non-empty finite-type k-scheme has a k-point.
- Isomorphism is not descended this way in general for non-constant twists, but isogeny classes are.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.9/defined-up-to-isogeny`, `AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension`

**Sources.** xy-2022, Lemma 3.3 and proof, p. 13 (arXiv v1): Spreads an isogeny over a k-variety and specializes at a k-point.

### Isogeny classes defined over two subfields (XY Proposition 3.2)

`UB.9/isogeny-two-subfields` · theorem

Let k be algebraically closed, K/k an extension of finite transcendence degree, and k₁, k₂ algebraically closed intermediate fields with k₁ ∩ k₂ = k. If A₁/k₁ and A₂/k₂ are abelian varieties with A₁ ⊗_{k₁} K isogenous to A₂ ⊗_{k₂} K, then there is an abelian variety A over k, unique up to isogeny, with A₁ isogenous to A ⊗_k k₁ and A₂ isogenous to A ⊗_k k₂.

**Hypotheses.** k algebraically closed; trdeg(K/k) < ∞; k₁, k₂ algebraically closed, k₁ ∩ k₂ = k.

**Construction or proof.**

1. Reduce to K = acl(k₁k₂) by the descent lemma.
2. Independent case (transcendence defect δ = trdeg k₁ + trdeg k₂ − trdeg k₁k₂ = 0): view A₁ as a family over a k-variety with function field k₁ and A₂ over one with function field k₂; their isogeny over the product forces both families to be isotrivial up to isogeny over k (the printed proof).
3. For dependent fields, choose finite tuples c,b with k₁=acl(k(c)), k₂=acl(k(b)); let d_i=trdeg(k_i/k), e=trdeg(k₁k₂/k), δ=d₁+d₂−e>0. In an algebraically closed overfield choose a k₁-copy τK independent of K over k₁. The transported isogeny makes A₂ isogenous to τA₂, and k₂∩τk₂=k. Put a=trdeg(c/k(b,τb)). Independence gives trdeg(b,τb,c/k)=2e−d₁, hence the new defect is δ′=2δ−d₁+a. Since a≤d₁−δ, δ′≤δ. Equality would identify the loci of c over k₂ and τk₂ after their compositum extension; subvariety-field-descent then defines that locus over k, contradicting its dimension d₁−δ<d₁. Thus δ′<δ. Apply induction and then the isogeny descent lemma. This is the E18 repair, valid in arbitrary characteristic; it is not the printed independent-fields argument.

**Checks.**

- If k₁ = k the statement is the descent lemma.
- The hypothesis k₁ ∩ k₂ = k cannot be dropped: for k₁ = k₂ ⊋ k, any non-constant A₁ over k₁ is a counterexample.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.9/isogeny-descent-closed`, `HeightsRationalPointsAndObstructionsPartII:UB.9/defined-up-to-isogeny`, `mathlib:Algebra.trdeg`, `mathlib:IntermediateField`, `HeightsRationalPointsAndObstructionsPartII:UB.9/subvariety-field-descent`

**Sources.** xy-2022, Proposition 3.2 and proof, pp. 13–14 (arXiv v1): States that an isogeny class defined over two algebraically closed subfields meeting in k is defined over k, proving it geometrically for algebraically independent subfields.

### Fields of definition of subvarieties (XY Lemma 3.4)

`UB.9/subvariety-field-descent` · theorem

Let k₁, k₂ be intermediate fields of K/k with k₁ ∩ k₂ = k, Y a variety over k and X ⊆ Y_K a closed subvariety defined over k₁ and over k₂. Then X is defined over k. The linear-algebra core: a K-subspace of V₀ ⊗_k K that descends to k₁ and to k₂ descends to k.

**Hypotheses.** k₁, k₂ intermediate fields of K/k with k₁ ∩ k₂ = k.

**Construction or proof.**

1. Linear core: a finite-dimensional K-subspace W ⊆ V₀ ⊗ K has a unique reduced row echelon basis with respect to a fixed k-basis of V₀; if W descends to k₁ its RREF has entries in k₁, likewise in k₂, so the entries lie in k₁ ∩ k₂ = k.
2. Apply to the homogeneous ideal of X in each degree after embedding Y in projective space (or on an affine cover), passing to the limit over finite-dimensional pieces.
3. Mathlib has IsReducedRowEchelon but not its uniqueness; the uniqueness of the reduced row echelon form is part of this node.

**Checks.**

- For k₁ = k₂ = K the hypothesis k₁ ∩ k₂ = k forces K = k.
- A line {y = ax} in the plane over K with a ∈ k₁ ∩ k₂ descends; with a ∉ k it is not defined over both.

**Needs.** `mathlib:Matrix.IsReducedRowEchelon`, `mathlib:IntermediateField`, `mathlib:Submodule.span`

**Sources.** xy-2022, Lemma 3.4 and proof, pp. 14–15 (arXiv v1): Proves descent of a subvariety defined over two subfields with intersection k through uniqueness of the reduced row echelon form of a basis of the defining equations in each degree.

### Minimal fields of definition (XY Corollary 3.5)

`UB.9/minimal-fields` · theorem

(i) Let K/k be an extension of algebraically closed fields and A an abelian variety over K. There is an algebraically closed intermediate field k_A of finite transcendence degree over k such that, for every algebraically closed intermediate k′, A is defined over k′ up to isogeny iff k_A ⊆ k′. (ii) For a variety Y over k and a closed subvariety X ⊆ Y_K there is an algebraically closed intermediate field k_{X⊆Y_K} of finite transcendence degree over k such that, for every algebraically closed intermediate k′, X is defined over k′ iff k_{X⊆Y_K} ⊆ k′.

**Hypotheses.** K/k algebraically closed fields.

**Construction or proof.**

1. Choose k_A algebraically closed of minimal transcendence degree with A defined over it up to isogeny (A is defined over the algebraic closure of a finitely generated field).
2. For k′ with A defined over k′, apply the two-subfield proposition to k′ and k_A over k′ ∩ k_A (algebraically closed; source issue E8 corrects the cited reference) to see A is defined over k′ ∩ k_A, so minimality forces k_A ⊆ k′; the dependent-fields repair E18 is needed here.
3. (ii) is identical with the subvariety descent lemma in place of the two-subfield proposition.
4. If the ambient algebraically closed K has infinite transcendence degree, choose finite tuples of coefficients defining each variety and isogeny under comparison. The algebraic closure of their compositum has finite transcendence degree, so the preceding intersection theorem applies there before extending back to K.

**Checks.**

- For A constant, k_A = k.
- For the Legendre curve over the algebraic closure of k(t), k_A is the algebraic closure of k(j) = the algebraic closure of k(t).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.9/isogeny-two-subfields`, `HeightsRationalPointsAndObstructionsPartII:UB.9/subvariety-field-descent`, `HeightsRationalPointsAndObstructionsPartII:UB.9/defined-up-to-isogeny`

**Sources.** xy-2022, Corollary 3.5 and proof, p. 15 (arXiv v1): Deduces from the two-subfield statements that the algebraically closed fields of definition (up to isogeny for abelian varieties) have a least element of finite transcendence degree.

### The field over which X becomes special (XY Proposition 3.6)

`UB.9/special-field` · theorem

Let K/k be a field extension with k algebraically closed in K, I(K/k) the set of intermediate fields algebraically closed in K, A an abelian variety over K and X ⊆ A_{K̄} a closed subvariety. There is k_{A,X} ∈ I(K/k) such that for every k′ ∈ I(K/k), X is special for A/K/k′ iff k_{A,X} ⊆ k′.

**Hypotheses.** k algebraically closed in K; A/K abelian; X ⊆ A_{K̄} closed.

**Construction or proof.**

1. Over K̄/k̄: if X is special for k′, then X ⊆ tr(A^{K/k′}) + a + C; quotienting by the stabilizer reduces to trivial stabilizer, and then only the implication "special for k′ ⇒ k_A ⊆ k′" holds in the case tr(A^{K/k}) ≠ A; for k′ ⊇ k_A run the second case over k_A through an isogeny A → A₀ ⊗_{k_A} K (repair of the printed first case, source issue E1).
2. Define k_{A,X} over K̄/k̄ from the minimal fields of A and of the constant part of X (minimal fields, with E18).
3. In the algebraically closed case let F be the minimal specialness field obtained in the first two steps. For general K, let F″ be the algebraic closure inside K̄ of the compositum of every σF, σ∈Aut(K̄/K), and set k_{A,X}=F″∩K. This is an arbitrary compositum, with no assumed finite orbit. For x∈F″, all roots of its minimal polynomial over K, including inseparable multiplicities, lie in F″; the coefficients therefore lie in F″∩K. Hence F″ is algebraic over that intersection. For relatively algebraically closed k′⊆K its algebraic closure in K̄ is conjugation-stable, and F⊆k̄′ iff F″⊆k̄′ iff k_{A,X}⊆k′. This proves the claimed equivalence (E17 repair).

**Checks.**

- If X is a torsion subvariety, k_{A,X} = k.
- For A constant and X = C₀ ⊗ K̄ for a curve C₀ over k, k_{A,X} = k; translating C₀ by a non-constant non-torsion point moves k_{A,X} up.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.9/minimal-fields`, `HeightsRationalPointsAndObstructionsPartII:UB.7/special-subvariety`, `HeightsRationalPointsAndObstructions:RP.1/kk-trace`, `HeightsRationalPointsAndObstructions:RP.5/stabilizer`

**Sources.** xy-2022, Proposition 3.6 and proof, pp. 15–16 (arXiv v1): Proves the existence of a least field over which a subvariety becomes special, splitting into the case where the trace is all of A and the case where it is not.

### Generic pencil members as polarizations over a subfield (XY Lemma 3.7(1)–(2))

`UB.9/pencil-polarizations` · theorem

Let k be algebraically closed, K/k finitely generated with trdeg(K/k) > 1 and (S, M) a polarization with M very ample. There are infinitely many intermediate fields k′ of K/k, algebraically closed in K with trdeg(k′/k) = 1, each with a geometrically integral divisor H ⊆ S_{k′} linearly equivalent to M_{k′} such that H → S_{k′} → S is an isomorphism on generic points; after extending k′ to its algebraic closure k̄′ in K̄ and normalizing ν : H̃ → H_{k̄′}, the pair (H̃, ν^*(M_{k̄′}|_{H_{k̄′}})) is a polarization of Kk̄′/k̄′. Two such fields k₁ ≠ k₂ can be chosen with k₁ ∩ k₂ = k.

**Hypotheses.** k algebraically closed; trdeg(K/k) ≥ 2; M very ample on S.

**Construction or proof.**

1. For s₀, s₁ ∈ Γ(S, M) with s₁/s₀ non-constant, the blow-up of the base locus fibres S over ℙ¹; k′ = k(s₁/s₀) after algebraic closure in K, and H is the generic member, geometrically integral by Bertini.
2. Two distinct fields: fix s₀ with geometrically integral divisor and choose s₁, s₂ with s₁/s₀, s₂/s₀ algebraically independent (a general projection of S to ℙ² is dominant); the pencils give k₁ ≠ k₂ with k₁ ∩ k₂ = k (source issue E5 of the XY extraction: the printed proof builds only one).
3. Normalize the geometric generic member and pull M back; ampleness is preserved by finite pullback (source issue E19).

**Checks.**

- For trdeg(K/k) = 2 and S = ℙ², the pencils of lines through a point give k′ = k(y/x) and H the generic line.
- Without normalization the member H_{k̄′} may be non-normal and is not a polarization in the sense of §1.1 (E19).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.7/small-points`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.0`

**Sources.** xy-2022, Lemma 3.7 and proof, pp. 16–18 (arXiv v1): Builds from a pencil ⟨s₀, s₁⟩ of sections of M the field k′ = k(s₁/s₀) (algebraically closed in K) and the generic member H of the pencil as a polarization of the function field over k′.

### Heights decrease on generic pencil members (XY Lemma 3.7, height inequality)

`UB.9/pencil-height-inequality` · theorem

For (k′, H) as in the pencil lemma, every abelian variety A over K with symmetric ample L and every subvariety X ⊆ A_{K̄}: ĥ^M_L(X) ≥ ĥ^{M_{k′}|_H}_L(X), the left side computed for K/k with (S, M) and the right side for Kk̄′/k̄′ with the normalized pencil member.

**Hypotheses.** (k′, H) from the pencil lemma; A/K abelian; X ⊆ A_{K̄}.

**Construction or proof.**

1. Write ĥ^M_L(X) as a limit of ℒ^{dim X+1} · (π^*M)^{dim S−1} · 𝒳 over models (parent RP.0).
2. Base change to k′ and replace one factor π^*M by π^{-1}(H): the intersection with 𝒳_{k′} contains 𝒳*_H plus an effective cycle; nefness of ℒ and π^*M makes the dropped term ≥ 0 (SF.5 positivity).
3. Identify the remaining term with the height for the normalized pencil member, defined by the same intersection formula even before normalization (E19).

**Checks.**

- Equality holds when X is defined over k′ and the pencil is in general position (no excess part).
- Only the inequality is used: small points for K/k remain small for Kk̄′/k̄′.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.9/pencil-polarizations`, `HeightsRationalPointsAndObstructionsPartII:UB.7/adelic-canonical-comparison`, `HeightsRationalPointsAndObstructions:RP.0/geometric-subvariety-height`, `HeightsRationalPointsAndObstructions:RP.0/geometric-height-base-change`, `SchemeAndStackFoundations:SF.5`

**Sources.** xy-2022, Lemma 3.7, height inequality, p. 17; proof p. 18 (arXiv v1): Compares the canonical height of a subvariety for the original polarization with that for the generic pencil member by replacing one factor π^*M by the divisor of the pencil and dropping an effective cycle.

### Lowering the transcendence degree (XY Proposition 3.1)

`UB.9/transcendence-reduction` · theorem

Let k be algebraically closed, K/k finitely generated with trdeg(K/k) ≥ 2 and A an abelian variety over K. There are intermediate fields k₁, k₂ of K/k, algebraically closed in K with trdeg(k_i/k) = 1, such that for every closed subvariety X ⊆ A_{K̄}, the geometric Bogomolov statement holds for (A/K/k, X) if it holds for (A_{Kk̄₁}/Kk̄₁/k̄₁, X) and (A_{Kk̄₂}/Kk̄₂/k̄₂, X).

**Hypotheses.** k algebraically closed; trdeg(K/k) ≥ 2.

**Construction or proof.**

1. Take k₁ ≠ k₂ from two pencils with k₁ ∩ k₂ = k (E5).
2. If X has dense small points for A/K/k, then by the pencil height inequality it has dense small points over Kk̄_i/k̄_i; by hypothesis X is special for A/K/k_i, i = 1, 2.
3. By the special-field proposition k_{A,X} ⊆ k₁ ∩ k₂ = k, so X is special for A/K/k (source issue E10 fixes a missing negation in the printed contradiction).
4. Alternatively the shorter independent transcendence-degree-one argument recorded in the XY extraction can replace the field-theoretic step.

**Checks.**

- Induction on the transcendence degree reduces the geometric Bogomolov conjecture to trdeg(K/k) = 1.
- The two fields must meet in k; one pencil is not enough.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.9/pencil-polarizations`, `HeightsRationalPointsAndObstructionsPartII:UB.9/pencil-height-inequality`, `HeightsRationalPointsAndObstructionsPartII:UB.9/special-field`, `HeightsRationalPointsAndObstructionsPartII:UB.7/small-points`, `HeightsRationalPointsAndObstructionsPartII:UB.7/special-subvariety`

**Sources.** xy-2022, Proposition 3.1, p. 12; proof pp. 18–19 (arXiv v1): Chooses two pencils whose fields meet in k; small points over K/k stay small over each Kk̄_i/k̄_i by the height inequality, so X is special over both k_i, hence over k by the minimality of the field over which X becomes special.

### Multi-sections and torsion multi-sections

`UB.9/multi-section` · definition

Let π : 𝒜 → S be an abelian scheme over a smooth projective curve S over a field k (more generally a smooth curve). A multi-section of π is a closed integral subscheme 𝒯 ⊆ 𝒜 finite and flat over S. It is torsion of order m if the tautological point of 𝒜_𝒯(𝒯) it defines is torsion of exact order m. A torsion multi-section is the Zariski closure of a torsion point of the generic fibre A(K̄), and one of order m lies in 𝒜[m].

**Hypotheses.** π : 𝒜 → S abelian scheme over a smooth projective curve S over a field.

**Construction or proof.**

1. The closure of a torsion point of order m lies in the closed subgroup scheme 𝒜[m], which is finite over S; an integral closed subscheme finite and dominant over a smooth curve is flat. Over higher-dimensional normal bases flatness can fail, which is why the definition is made over curves.

**Uses.** Xie–Yuan, Proposition 4.2: the numerical class of a torsion multi-section is a multiple of the top power of the rigidified symmetric bundle; Xie–Yuan, Proposition 5.4: fibres of the summation map over torsion points are controlled through torsion multi-sections of 𝒜′.

**API.**

- `MultiSection` (data): A closed integral 𝒯 ⊆ 𝒜 finite flat over S.
- `MultiSection.deg` (data): deg(𝒯/S), the degree of the finite flat map.
- `MultiSection.IsTorsion` (data): The predicate torsion of order m.
- `MultiSection.torsion_closure` (characterisation): Torsion multi-sections are exactly the closures of torsion points of A(K̄).
- `MultiSection.mem_kernel` (other): A torsion multi-section of order m lies in 𝒜[m].

**Unit tests.**

- `MultiSection.zero_section` (degenerate): The zero section is a torsion multi-section of order 1 and degree 1.
- `MultiSection.two_torsion` (computation): For the Legendre family in characteristic different from 2 over ℙ¹ ∖ {0, 1, ∞}, the closure of the 2-torsion point (0, 0) is a torsion multi-section of order 2 and degree 1.
- `MultiSection.nontorsion` (non-example): The closure of a non-torsion section is a multi-section that is not torsion.

**Needs.** `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `AbelianSchemesAndArithmeticModuli:A1`

**Sources.** xy-2022, §4.1, p. 19 (arXiv v1): Defines multi-sections of an abelian scheme and torsion multi-sections, and notes that torsion multi-sections are closures of torsion points in the kernel of multiplication.

### Numerical class of a torsion multi-section (XY Proposition 4.2)

`UB.9/torsion-multisection-class` · theorem

Let S be a smooth projective curve over a field k, π : 𝒜 → S an abelian scheme of relative dimension g ≥ 1, ℒ a symmetric rigidified line bundle on 𝒜 and 𝒯 a torsion multi-section. Then [ℒ]^g ≡ (deg(ℒ_η)/deg(𝒯/S))·[𝒯] numerically as 1-cycles on 𝒜, where deg(ℒ_η) is the degree of ℒ on the generic fibre.

**Hypotheses.** S smooth projective curve over k; π abelian scheme of relative dimension g ≥ 1; ℒ symmetric rigidified.

**Construction or proof.**

1. Numerical classes of line bundles on 𝒜 are generated by rigidified ones and pullbacks π^*N (rigidification along the zero section).
2. For rigidified ℳ, split 2ℳ into symmetric and antisymmetric parts so that [m]^*ℳ ≅ m^iℳ, i = 2 or 1 (source issue E11); [m]^*[ℒ]^g pushes forward with factor m^{2g} while ℳ · [ℒ]^g scales by m^{2g+i}, forcing ℳ · [ℒ]^g = 0; likewise ℳ · [𝒯] = 0 since a torsion multi-section restricts ℳ to a torsion bundle (A1).
3. For ℳ = π^*N compare degrees: π^*N · [ℒ]^g = deg N · deg ℒ_η and π^*N · [𝒯] = deg N · deg(𝒯/S).

**Checks.**

- For an elliptic scheme over a smooth projective curve, take the rigidified normalization of O(2·0), twisting by a base bundle if necessary. Its numerical class is 2[0], consistent with generic degree 2 and degree-one zero section.
- Any two torsion multi-sections of degree 1 are numerically equivalent.
- Grushevsky–Zakharov prove the rational-equivalence version over higher-dimensional bases; only the numerical version over a curve is needed.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.9/multi-section`, `AbelianSchemesAndArithmeticModuli:A1/relative-cube-and-power`, `AbelianSchemesAndArithmeticModuli:A1/torsion-restriction-of-rigidified-lines`, `AbelianSchemesAndArithmeticModuli:A2/nef-normalized-lines-over-curves`, `SchemeAndStackFoundations:SF.5`

**Sources.** xy-2022, Proposition 4.2 and proof, pp. 20–21 (arXiv v1): Proves that a torsion multi-section is numerically proportional to the top power of a symmetric rigidified bundle by testing against rigidified bundles (both sides vanish, by the projection formula for multiplication) and against pullbacks from the base (degrees agree).

### Yamaki’s reduction to the nowhere degenerate trace-free part

`UB.9/yamaki-reduction` · theorem

Let k be algebraically closed, B normal projective of positive dimension, K=k(B), and A an abelian variety over K̄. Let 𝔪⊆A be its maximal nowhere-degenerate abelian subvariety, meaning potential good reduction at every geometric divisorial valuation in Yamaki’s setting, and let t be the image of the geometric K̄/k-trace. Then geometric Bogomolov holds for A iff it holds for 𝔪 iff it holds for 𝔪/t. These are geometric objects; they may require a finite extension of a chosen field of definition. In transcendence degree one the nowhere-degenerate quotient acquires an abelian-scheme model after a finite extension.

**Hypotheses.** k algebraically closed; K = k(B) for a normal projective B of dimension ≥ 1.

**Construction or proof.**

1. The statement was checked against Yamaki’s arXiv v5; its proof uses Gubler’s tropical equidistribution at places of bad reduction (for the step from A to 𝔪) and Yamaki’s analysis of closed subvarieties of abelian schemes over constant varieties, starting from the equivalence of dense small points and canonical height 0 (the Zhang–Gubler inequalities).
2. No roadmap of the atlas plans Gubler’s tropical equidistribution; the theorem is an input here, recorded as a gap.

**Checks.**

- If A has good reduction everywhere and trivial trace, 𝔪 = A and t = 0, and the statement is trivial.
- For A totally degenerate at some place, A has trivial trace and the conclusion for A is Gubler’s theorem.

**Needs.** `HeightsRationalPointsAndObstructions:RP.1/kk-trace`, `NeronModelsAndSemistableAbelianVarieties:R11.1`, `NeronModelsAndSemistableAbelianVarieties:R11.3`, `NeronModelsAndSemistableAbelianVarieties:R11.5/good-isogeny`, `HeightsRationalPointsAndObstructionsPartII:UB.7/special-subvariety`, `HeightsRationalPointsAndObstructionsPartII:UB.7/small-points`, `HeightsRationalPointsAndObstructionsPartII:UB.7/zhang-gubler-minimum`

**Sources.** xy-2022, §5, condition (d), p. 22 (arXiv v1), citing Yamaki, J. reine angew. Math. 2018, Theorem 1.5: Uses Yamaki’s theorem to reduce the geometric Bogomolov conjecture to abelian varieties with good reduction everywhere and trivial trace.; yamaki-2018, Theorem 1.5 (= Theorem 5.5), p. 5; setting §1.2, p. 5 (arXiv 1405.0896v5): Proves that the geometric Bogomolov conjecture for an abelian variety over the function field of a normal projective variety is equivalent to that for its maximal nowhere degenerate abelian subvariety and to that for the quotient of the latter by the image of the trace.

**Open input.** Yamaki’s reduction theorem cited, not planned.

### Reduction of the geometric Bogomolov conjecture to conditions (a)–(d)

`UB.9/reduction-to-good-reduction` · theorem

To prove that every closed X ⊆ A_{K̄} with dense small points is special, it suffices to treat the case where (a) trdeg(K/k) = 1, (b) the model S is a smooth projective curve, (c) A has semistable reduction over S, (d) A has trivial geometric K̄/k-trace and good reduction over S; and X may moreover be assumed defined over K after a finite extension of K.

**Hypotheses.** k algebraically closed; K/k finitely generated with trdeg ≥ 1.

**Construction or proof.**

1. (a) by induction with the transcendence reduction; (b) the regular projective model of a function field of one variable is unique.
2. (c) semistable reduction holds after a finite extension of K (NeronModels R11.3), which preserves small points and speciality (parent RP.0 base change).
3. (d) Yamaki’s reduction passes to 𝔪/t, which has good reduction and trivial trace; X is defined over a finite extension of K.

**Checks.**

- Every step preserves both the hypothesis (dense small points) and the conclusion (special).
- After (d), special means torsion subvariety.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.9/transcendence-reduction`, `HeightsRationalPointsAndObstructionsPartII:UB.9/yamaki-reduction`, `NeronModelsAndSemistableAbelianVarieties:R11.3/finite-separable-semistable-extension`, `HeightsRationalPointsAndObstructions:RP.0/geometric-height-base-change`, `HeightsRationalPointsAndObstructionsPartII:UB.7/small-points`

**Sources.** xy-2022, §5, pp. 22–23 (arXiv v1): Reduces the theorem to transcendence degree one, a smooth projective curve model, semistable reduction, trivial trace and good reduction, by Proposition 3.1, the semistable reduction theorem and Yamaki’s theorem.

### Iterated sums X_m of a subvariety

`UB.9/sum-varieties` · construction

For a nonempty closed subvariety X of an abelian variety A and m ≥ 1, X_m is the image of the addition morphism f_m : X^m → A, (x₁, …, x_m) ↦ x₁ + ⋯ + x_m, and X₀ = {0}. Then dim X_{m−1} ≤ dim X_m ≤ dim X_{m−1} + dim X.

**Hypotheses.** X ⊆ A nonempty and closed.

**Construction or proof.**

1. The addition map is proper, so X_m is closed; X_m = X_{m−1} + X gives the dimension bounds.

**Uses.** Xie–Yuan, Lemma 5.3: the sums stabilize at a torsion subvariety when X has dense small points; Xie–Yuan, §5.2: the summation X_{r−1} × X → A′ is studied fibre by fibre.

**API.**

- `IteratedSum` (data): X_m ⊆ A closed for m ≥ 0.
- `IteratedSum.succ` (simp): X_{m+1} = X_m + X.
- `IteratedSum.dim_mono` (other): dim X_{m−1} ≤ dim X_m ≤ dim X_{m−1} + dim X.
- `IteratedSum.stabilize` (other): For 0 ∈ X irreducible, the X_m increase and stabilize at the abelian subvariety generated by X, within dim A steps.
- `IteratedSum.translate` (relation): (X − x₀)_m = X_m − m x₀.

**Unit tests.**

- `IteratedSum.zero` (degenerate): X₀ = {0} and X₁ = X.
- `IteratedSum.curve_jacobian` (computation): For an Abel–Jacobi curve C ⊆ J of genus g through 0, C_m is the image of the m-th symmetric power, of dimension min(m, g), and C_g = J.
- `IteratedSum.point` (non-example): For X={x} with x non-torsion, X_m={mx} has dimension zero and need not be a subgroup. The hypothesis 0∈X in the stabilization API is essential; X={0} itself stabilizes immediately.

**Needs.** `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety`

**Sources.** xy-2022, §5.1, p. 23 (arXiv v1): Defines the iterated sums of X as images of addition maps and records the dimension inequalities.

### The sums become a torsion subvariety (XY Lemma 5.3)

`UB.9/sums-torsion` · theorem

Assume (a)–(d), dim X ≥ 1, X irreducible and X with dense small points. There is a unique integer r ≥ 1 with dim X_{r−1} < dim X_r and X_r a torsion subvariety of A. After a torsion translation and a finite extension of K one may assume (e): A′ := X_r is an abelian subvariety of A and dim X_{r−1} < dim X_r.

**Hypotheses.** (a)–(d); X irreducible with dim X ≥ 1 (source issue E4: the printed lemma omits it) and dense small points.

**Construction or proof.**

1. Choose any x₀∈X; the sums X_m−mx₀ increase and eventually stabilize at the abelian subvariety B generated by X−x₀. Let r be the first stabilization index. No assertion that one chosen point has height zero is needed.
2. Products of dense arbitrarily small sets map to dense arbitrarily small sets in X_r. Since X_r is a translate B+t, its image in A/B has height zero. Trivial geometric trace makes that image torsion; choose a torsion lift, so X_r is a torsion translate of B.
3. Its height is 0, and trivial trace makes height-0 points torsion (parent RP.1 kernel), so t is torsion mod B and X_r is a torsion subvariety; uniqueness of r because dim X ≥ 1 forces the first jump.

**Checks.**

- For X a point the conclusion fails: X_m = {mx} never jumps (E4).
- For a positive-dimensional abelian subvariety X through zero, r=1. For a genus-two ample curve C through zero in its abelian surface Jacobian, C+C=J and r=2. A smooth elliptic curve through zero in an abelian variety is a subgroup, so the former non-subgroup elliptic example cannot occur.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.9/sum-varieties`, `HeightsRationalPointsAndObstructionsPartII:UB.7/zhang-gubler-minimum`, `HeightsRationalPointsAndObstructionsPartII:UB.7/small-points`, `HeightsRationalPointsAndObstructions:RP.1/function-field-neron-tate-kernel`, `HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety`

**Sources.** xy-2022, Lemma 5.3, pp. 23–24, and condition (e), pp. 24–25 (arXiv v1): Shows that the iterated sums of a subvariety with dense small points stabilize at a torsion translate of an abelian subvariety, using heights on a product B × C and trivial trace.

### Relative dimension of the summation map and its jump locus

`UB.9/summation-jump-locus` · theorem

Under (e), the summation morphism f : X_{r−1} × X → A′ has relative dimension e = dim X_{r−1} + dim X − dim A′ < dim X, and A′_{e+1} = {y ∈ A′ : dim f^{-1}(y) ≥ e + 1} is closed of codimension ≥ 2 in A′.

**Hypotheses.** (a)–(e).

**Construction or proof.**

1. f is surjective onto A′ = X_r, so its generic fibre dimension is e = dim X_{r−1} + dim X − dim A′, which is < dim X since dim X_{r−1} < dim A′.
2. Upper semicontinuity of fibre dimension makes A′_{e+1} closed; the dimension count dim f^{-1}(A′_{e+1}) ≤ dim(X_{r−1} × X) gives codimension ≥ 2 when combined with irreducibility of X_{r−1} × X.

**Checks.**

- If X = A′ is already an abelian subvariety (r = 1), X_{0} × X = X and e = 0.
- Torsion points off A′_{e+1} are dense in A′ (codimension ≥ 2 complement; prime-to-p torsion is dense).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.9/sums-torsion`, `HeightsRationalPointsAndObstructionsPartII:UB.9/sum-varieties`

**Sources.** xy-2022, §5.2, p. 25 (arXiv v1): Computes the generic relative dimension of the summation map onto A′ and shows that the locus of larger fibres is closed of codimension at least two.

### Torsion fibres have height zero (XY Proposition 5.4)

`UB.9/torsion-fibres-height-zero` · theorem

Under (a)–(e), for every torsion point t ∈ A′(K̄) ∖ A′_{e+1}(K̄) of order prime to char k (the printed proposition allows every torsion t, but its proof treats only prime-to-p orders; source issue E2 of the XY extraction), every irreducible component of the fibre f^{-1}(t) ⊆ (X_{r−1} × X)_{K̄} has canonical height 0 in (A × A)_{K̄}.

**Hypotheses.** (a)–(e); t torsion of order prime to char k, off the jump locus.

**Construction or proof.**

1. Work on Néron models: 𝒜′_N for A′ and ℬ_N = 𝒜 ×_S 𝒜′_N for B ⊆ A × A, with the generic isomorphism A × A′ → B, (x, t) ↦ (x, t − x); the summation h is the flat second projection and 𝒴 the closure there, never a possibly nonsmooth embedded closure (source issue E16).
2. Xie–Yuan’s non-proper intersection inequality (their Proposition 2.1, owned by SchemeAndStackFoundations SF.5) bounds Σ m_i[𝒵_i] · [ℒ_ℬ]^{e+1} ≤ h^*[𝒯] · [𝒴] · [ℒ_ℬ]^{e+1} for the torsion multi-section 𝒯 of t (E13).
3. Replace [𝒯] by a[ℒ_{𝒜′}]^{dim A′} (numerical class of torsion multi-sections); ĥ(Y) = 0 for Y = X_{r−1} × X (dense small points and Zhang–Gubler) forces [𝒵_i] · [ℒ_ℬ]^{e+1} = 0, hence ĥ(Z_i) = 0 (E14).
4. Only t of order prime to the characteristic is treated: the multi-section must be étale (source issue E2).

**Checks.**

- For t = 0 the fibre f^{-1}(0) contains the antidiagonal-type locus {(y, −x)}; its components have height 0 when X has dense small points.
- In characteristic p, p-power torsion is excluded; prime-to-p torsion off A′_{e+1} is still dense, which is all §5.3 uses.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.9/summation-jump-locus`, `HeightsRationalPointsAndObstructionsPartII:UB.9/torsion-multisection-class`, `HeightsRationalPointsAndObstructionsPartII:UB.9/multi-section`, `HeightsRationalPointsAndObstructionsPartII:UB.7/zhang-gubler-minimum`, `HeightsRationalPointsAndObstructionsPartII:UB.7/adelic-canonical-comparison`, `HeightsRationalPointsAndObstructions:RP.0/good-reduction-height-formula`, `NeronModelsAndSemistableAbelianVarieties:R11.1`, `NeronModelsAndSemistableAbelianVarieties:R11.5/good-isogeny`, `SchemeAndStackFoundations:SF.5`

**Sources.** xy-2022, Proposition 5.4 and proof, pp. 25–26 (arXiv v1): Bounds the components of the fibre over a torsion multi-section by an intersection inequality for non-proper intersections, replaces the multi-section by a multiple of the top power of the rigidified bundle, and concludes that the components have zero height.

### The geometric Bogomolov conjecture under (a)–(d), by induction on dim X

`UB.9/good-reduction-case` · theorem

Assume (a)–(d). Every closed irreducible X ⊆ A_{K̄} with a dense set of small points is a torsion subvariety.

**Hypotheses.** (a)–(d); X irreducible closed with dense small points.

**Construction or proof.**

1. dim X = 0: dense small points mean ĥ(x) = 0, and over a function field the kernel of the Néron–Tate height is torsion plus trace points (parent RP.1), so with trivial trace x is torsion.
2. dim X ≥ 1: arrange (e). For prime-to-p torsion t ∈ A′ off A′_{e+1}, the components of f^{-1}(t) have height 0, hence dense small points (Zhang–Gubler converse, source issue E3), and dimension e < dim X; by induction (applied in A × A, which again satisfies (a)–(d)) they are torsion subvarieties.
3. These t are dense in A′, so X_{r−1} × X contains a dense set of torsion points; Manin–Mumford for abelian varieties with trivial trace in every characteristic (parent RP.5: Hrushovski, Pink–Rössler; Scanlon’s all-torsion form) makes X_{r−1} × X, hence X, a torsion subvariety. Torsion inside the translated components may have p-primary part.

**Checks.**

- For X a torsion coset the hypothesis holds and the conclusion is immediate.
- The induction runs on A × A, not on A: the hypotheses (a)–(d) are stable under products.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.9/torsion-fibres-height-zero`, `HeightsRationalPointsAndObstructionsPartII:UB.9/sums-torsion`, `HeightsRationalPointsAndObstructionsPartII:UB.9/summation-jump-locus`, `HeightsRationalPointsAndObstructionsPartII:UB.7/zhang-gubler-minimum`, `HeightsRationalPointsAndObstructionsPartII:UB.7/special-has-small-points`, `HeightsRationalPointsAndObstructions:RP.5/manin-mumford-positive-characteristic`, `HeightsRationalPointsAndObstructions:RP.5/manin-mumford`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `HeightsRationalPointsAndObstructions:RP.1/function-field-neron-tate-kernel`

**Sources.** xy-2022, §5.3, pp. 26–27 (arXiv v1): Proves the good-reduction trace-free case by induction on the dimension: fibres of the summation over prime-to-p torsion points are torsion by induction, so X_{r−1} × X has dense torsion and Manin–Mumford concludes.

### The geometric Bogomolov conjecture (Xie–Yuan Theorem 1.1)

`UB.9/geometric-bogomolov` · theorem

Let k be algebraically closed, K/k finitely generated of transcendence degree ≥ 1, A an abelian variety over K and X a nonempty closed irreducible subvariety of A_{K̄}. If X contains a dense set of small points of A/K/k, then X is special.

**Hypotheses.** k algebraically closed; K/k finitely generated of transcendence degree ≥ 1; X ⊆ A_{K̄} closed.

**Construction or proof.**

1. Reduce to (a)–(d) and to X irreducible and defined over K.
2. Apply the good-reduction case: X is a torsion subvariety of the trace-free quotient; lifting through Yamaki’s reduction makes X special for A/K/k.
3. The converse (special ⇒ dense small points) is the easy direction.

**Checks.**

- A special subvariety tr(Y ⊗ K̄) + T has dense small points, so the theorem is an equivalence.
- In characteristic 0 over a curve it agrees with Gao–Habegger’s Theorem 1.1.
- For constant A = A₀ ⊗ K every subvariety of the form Y ⊗ K̄ is special, so the trace term cannot be omitted from the conclusion.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.9/reduction-to-good-reduction`, `HeightsRationalPointsAndObstructionsPartII:UB.9/good-reduction-case`, `HeightsRationalPointsAndObstructionsPartII:UB.9/transcendence-reduction`, `HeightsRationalPointsAndObstructionsPartII:UB.9/yamaki-reduction`, `HeightsRationalPointsAndObstructionsPartII:UB.7/small-points`, `HeightsRationalPointsAndObstructionsPartII:UB.7/special-subvariety`

**Sources.** xy-2022, Theorem 1.1, p. 3; proof §5, pp. 22–27 (arXiv v1): Proves the geometric Bogomolov conjecture in all characteristics and finite transcendence degree, without Betti maps: reduction to transcendence degree one, Yamaki’s reduction to good reduction and trivial trace, and an induction on dimension ending in Manin–Mumford.

## Layer UB.10: Adelic non-degeneracy and small points in curve families

Yuan §§4.1–4.2 and 4.6: the small-points bound for potentially big families over number fields and function fields (Theorem 4.2), non-isotrivial function-field points, the integral bound across characteristics (Theorem 4.10), non-degeneracy of fibre powers from potential bigness (Proposition 4.16) and of the Abel, difference, shift and Faltings–Zhang powers (Theorem 4.17), the relative small-points property, Proposition 4.18 and the relative Bogomolov theorem for curve families (Theorem 4.19, function-field branches with maximal variation over the constants).

### Small-points bound for potentially big families (Yuan Theorem 4.2)

`UB.10/small-points-bound-families` · theorem

(1) Let S be a quasi-projective variety over a number field K, π : X → S a smooth relative curve, L̄ a nef adelic line bundle on X/ℤ and M̄ an adelic line bundle on S/ℤ. If L̄ is potentially big over S, there are a non-empty open U ⊆ S and c₁, c₂ > 0 such that for every y ∈ U(K̄), #{x ∈ X(K̄) : π(x) = y, h_{L̄}(x) ≤ c₁h_{M̄}(y)} ≤ c₂. (2) Let S be a positive-dimensional quasi-projective variety over a field k, π : X → S a smooth relative curve, L̄ nef adelic on X/k potentially big over S and M̄ adelic on S/k. There are a non-empty open U ⊆ S and c₁, c₂ > 0 such that for every point y ∈ U of dimension one (with function field k(y) of transcendence degree 1 over k), #{x ∈ X_y(k(y)‾) : h_{L̄|X_y}(x) ≤ c₁·deĝ(M̄|_y)} ≤ c₂, heights normalized over k(y)/k.

**Hypotheses.** π : X → S smooth relative curve; L̄ nef and potentially big over S.

**Construction or proof.**

1. Potential bigness gives m with m⊠L̄ big on X^m_{/S} (ArakelovGeometryAndAbelianHeightsPartII AH.12).
2. The Yuan–Zhang height inequality (AH.4, part (1)) gives ε > 0 and an effective divisor Z of a multiple of m⊠L̄ − επ^*M̄ such that points of X^m_{/S} off Z satisfy h_{m⊠L̄} ≥ εh_{M̄}∘π; for a strict inequality defining a closed exceptional set, add to M̄ an ample model bundle of positive degree on every point (source issues E20–E21 of the Yuan extraction).
3. Over a dense open U of S the fibres Z_y are proper in X_y^m with bounded degree; a set Σ of small points with Σ^m ⊆ Z_y has |Σ| ≤ (deg Z_y)^{1/d} by the product-grid bound, applied to each finite subset of Σ so that Σ itself is finite (source issue E22: the printed proof assumes the finiteness the lemma concludes).

**Checks.**

- The constants depend on the family and the bundles, not on y ∈ U.
- Potential bigness is necessary: for a constant family X = C × S over a positive-dimensional base with L̄ pulled back from C, the number of x with h_{L̄}(x) ≤ c₁h_{M̄}(y) tends to infinity with h_{M̄}(y), so no uniform c₂ exists; such an L̄ is not potentially big.

**Needs.** `ArakelovGeometryAndAbelianHeightsPartII:AH.12/potential-bigness`, `ArakelovGeometryAndAbelianHeightsPartII:AH.12/potential-bigness-criterion`, `ArakelovGeometryAndAbelianHeightsPartII:AH.4/height-inequality`, `ArakelovGeometryAndAbelianHeightsPartII:AH.12/product-grid-bound`, `ArakelovGeometryAndAbelianHeightsPartII:AH.4/adelic-heights`

**Sources.** yuan-2026, Theorem 4.2(1)–(2), p. 64; proof pp. 65–67 (author manuscript 21 August 2024): Bounds uniformly over a dense open of the base the number of points of small height in the fibres of a family of curves carrying a potentially big nef adelic line bundle, by the height inequality on a fibre power and the product-grid bound.

### Non-isotrivial function-field points

`UB.10/non-isotrivial-point` · definition

Let U be a scheme over ℤ, K a function field of one variable over a field k and k′ the algebraic closure of k in K. A morphism y : Spec K → U is non-isotrivial if it does not factor through Spec K → Spec k′. When U is a finite-type k-scheme and y is a k-morphism, this says that the closure of the image of y is a curve (a point of dimension one).

**Hypotheses.** K/k of transcendence degree 1.

**Construction or proof.**

1. Use the factoring predicate as stated. Finite extension of K preserves it. For finite-type k-schemes, the image has dimension at most one; quasi-finite k-morphisms preserve this dimension, giving the composition API.

**Uses.** Yuan, Theorem 4.10: the integral small-points bound holds for all non-isotrivial points of a dense open; Yuan, §4.3.2: a curve with level structure is non-isotrivial iff its moduli point is non-isotrivial.

**API.**

- `IsNonIsotrivialPoint` (data): The predicate on y : Spec K → U.
- `IsNonIsotrivialPoint.comp` (functoriality): For a quasi-finite morphism U→V of finite-type k-schemes and a K-point y of U, y is non-isotrivial iff its image in V is non-isotrivial. All morphisms here are k-morphisms.
- `IsNonIsotrivialPoint.finite_extension` (other): Preserved under finite extension K′/K.
- `IsNonIsotrivialPoint.closed_point` (characterisation): For U of finite type over k, y is isotrivial iff its image is a closed point.

**Unit tests.**

- `IsNonIsotrivialPoint.identity` (computation): For U = 𝔸¹_k and K = k(t), the point t is non-isotrivial and every constant c ∈ k is isotrivial.
- `IsNonIsotrivialPoint.algebraic_constant` (non-example): For k = ℝ and K = ℂ(t) (constant field k′ = ℂ), the point i ∈ 𝔸¹(K) is not in k but factors through Spec k′, so it is isotrivial: the criterion is factoring through the algebraic closure of k in K, not through k.
- `IsNonIsotrivialPoint.point_base` (degenerate): If U = Spec k, no point is non-isotrivial.

**Needs.** `ArakelovGeometryAndAbelianHeightsPartII:AH.12/cross-characteristic-restriction`, `mathlib:Algebra.trdeg`

**Sources.** yuan-2026, Explanation of Theorem 4.10, p. 82 (author manuscript 21 August 2024): Defines non-isotrivial morphisms from the spectrum of a function field to a base scheme as those not factoring through the algebraic closure of the constant field.

### Integral small-points bound across characteristics (Yuan Theorem 4.10)

`UB.10/integral-small-points-bound` · theorem

Let S be a quasi-projective flat integral scheme over ℤ, π : X → S a smooth relative curve, L̄ a nef adelic line bundle on X/ℤ and M̄ adelic on S/ℤ. If L̄ is potentially big on X/S, there are a non-empty open U ⊆ S and c₁, c₂ > 0 such that for every function field K of one variable over any field k and every non-isotrivial y : Spec K → U, #{x ∈ X_y(K̄) : h_{L̄|X_y}(x) ≤ c₁·deĝ(M̄|_y)} ≤ c₂, where the restrictions pass through S_ℚ/ℚ or S_{𝔽_p}/𝔽_p and then S_k/k, and heights are normalized over K/k.

**Hypotheses.** S quasi-projective flat integral over ℤ; L̄ nef, potentially big over S.

**Construction or proof.**

1. Choose m with m⊠L̄ big on X^m_{/S} over ℤ and ε > 0 with m⊠L̄ − επ^*M̄ big; a multiple has a non-zero effective section s over ℤ, Z = div(s).
2. Restriction across characteristics (AH.12) preserves effectivity: for every non-isotrivial y, small points of (X^m)_y lie in Z_y, with strict inequality as in E21.
3. The fibres Z_y over a dense open U are proper with degree bounded by the degree over ℤ; the product-grid bound concludes as in Theorem 4.2.

**Checks.**

- The constants are independent of k and of the characteristic.
- Isotrivial points must be excluded: for y factoring through k′, heights of constant points are 0 and deĝ(M̄|_y) = 0.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.10/small-points-bound-families`, `HeightsRationalPointsAndObstructionsPartII:UB.10/non-isotrivial-point`, `ArakelovGeometryAndAbelianHeightsPartII:AH.12/cross-characteristic-restriction`, `ArakelovGeometryAndAbelianHeightsPartII:AH.12/potential-bigness`

**Sources.** yuan-2026, Theorem 4.10 and proof, pp. 81–83 (author manuscript 21 August 2024): States the small-points bound uniformly for all function fields of one variable and all non-isotrivial points of a dense open of an integral base, proving it like Theorem 4.2(2) from an effective section of a multiple of m⊠L̄ − εM̄ defined over ℤ.

### Potential bigness implies non-degeneracy of fibre powers (Yuan Proposition 4.16)

`UB.10/fibre-power-nondegeneracy` · theorem

Let k be a field, S a quasi-projective normal k-variety, ψ : A → S an abelian scheme of relative dimension r, ι : Y → A a generically finite morphism from a quasi-projective k-variety, L a symmetric ψ-ample line bundle rigidified along zero and L̄ its invariant adelic extension over k. If Y → S is projective flat with geometrically integral generic fibre of dimension e, L|_Y has positive top degree on the generic fibre, and the relative Deligne pairing ⟨(ι^*L̄)^{e+1}⟩ is big on S/k, then ι^m : Y^m_{/S} → A^m_{/S} is non-degenerate for every m ≥ dim S.

**Hypotheses.** as stated; non-degeneracy in the adelic sense (bigness of ι^*L̄ on Y/k). The fibre-power exponent m is a positive integer, including when dim S=0.

**Construction or proof.**

1. By the potential-bigness criterion, m⊠ι^*L̄ is big on Y^m_{/S} for every m ≥ dim S.
2. Non-degeneracy of ι^m means bigness of (ι^m)^*(m⊠L̄) = m⊠ι^*L̄, i.e. exactly this (AH.5 non-degeneracy).

**Checks.**

- For S=Spec k, invariant adelic non-degeneracy is geometric bigness: a closed positive-dimensional subvariety with an ample restricted bundle satisfies it, including an abelian subvariety itself. No abelian-subvariety-free condition is required.
- Over ℂ the conclusion is full Betti rank of Y^m_{/S}, matching Gao’s criterion for fibred powers.

**Needs.** `ArakelovGeometryAndAbelianHeightsPartII:AH.5/non-degenerate`, `ArakelovGeometryAndAbelianHeightsPartII:AH.12/potential-bigness-criterion`, `ArakelovGeometryAndAbelianHeightsPartII:AH.3/deligne-pairing`, `ArakelovGeometryAndAbelianHeightsPartII:AH.5/invariant-extension`

**Sources.** yuan-2026, Proposition 4.16, p. 97 (author manuscript 21 August 2024): Deduces non-degeneracy of fibre powers from bigness of the Deligne pairing through the criterion for potential bigness; the structure morphism Y → S is written π where ψ∘ι is meant (source issue E26 of the Yuan extraction).

### Non-degeneracy of Abel, difference and Faltings–Zhang powers (Yuan Theorem 4.17)

`UB.10/abel-power-nondegeneracy` · theorem

Let k be any field, S a quasi-projective integral k-variety, π : X → S a smooth relative curve of genus g > 1 with maximal variation, J = Pic⁰_{X/S}, and α a line bundle of positive relative degree defining i_α : X → J. Then the following are non-degenerate: (1) i_α^m : X^m_{/S} → J^m_{/S} for m ≥ dim S; (2) i_Δ^m : (X_X)^m_{/X} → (J_X)^m_{/X} for m ≥ dim S + 1, with i_Δ(x, y) = (x, y − x); (3) i_{ω−Q}^m : (X_J)^m_{/J} → (J_J)^m_{/J} for m ≥ dim S + g, with the universal shift τ; (4) the Faltings–Zhang map X^{m+1}_{/S} → J^m_{/S} for m ≥ dim S + 1; (5) τ_m : X^m_{/S} ×_S J → J^m_{/S} for m ≥ dim S + g. S may be non-normal (restrict to a normal dense open). Here τ_m(x₁,…,x_m,y)=((2g−2)x₁−ω+y,x₂−x₁,…,x_m−x₁), with all divisor classes taken in the relative Jacobian, and m≥1 throughout.

**Hypotheses.** g > 1; π smooth with maximal variation; α of positive relative degree. The fibre-power exponent m is a positive integer, including when dim S=0.

**Construction or proof.**

1. Potential bigness of i_α^*Θ̄, i_Δ^*Θ̄_X and τ^*Θ̄_J (AH.12 theta potential bigness), with the Deligne pairings computed by the theta identities (AH.9).
2. Apply the fibre-power proposition to each map; the thresholds on m are dim of the respective base (S, X or J), i.e. dim S, dim S + 1 and dim S + g.
3. The Faltings–Zhang and shifted Faltings–Zhang maps are the difference and shift maps composed with fibre products (JacobianChallengePartII JC2, JC5).

**Checks.**

- In characteristic 0 over ℂ, part (4) recovers Gao’s non-degeneracy of D_M(C_S^{[M+1]}) (AbelianSchemesAndArithmeticModuliPartII B4) with a different threshold.
- Maximal variation cannot be dropped: for an isotrivial family the moduli map is constant and the Deligne pairing is not big.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.10/fibre-power-nondegeneracy`, `ArakelovGeometryAndAbelianHeightsPartII:AH.12/theta-potential-bigness`, `ArakelovGeometryAndAbelianHeightsPartII:AH.9/canonical-theta-identities`, `JacobianChallengePartII:JC2/curve-difference`, `JacobianChallengePartII:JC5/faltings-zhang`, `StableReductionPartII:MC.6/maximal-variation-hodge`

**Sources.** yuan-2026, Theorem 4.17, pp. 98–99 (author manuscript 21 August 2024): Proves non-degeneracy of five maps built from a curve family with maximal variation, from potential bigness of the theta pullbacks and Proposition 4.16, in every characteristic.

### The relative Bogomolov small-points property

`UB.10/relative-small-points` · definition

Let K be a number field (base k = ℤ) or a function field of one variable over k, S a normal quasi-projective K-variety, A → S an abelian scheme, ι : Y → A generically finite and L a symmetric relatively ample line bundle rigidified along zero, with fibrewise Néron–Tate height ĥ_L. For ε > 0 put Y(L, ε) = {y ∈ Y(K̄) : ĥ_L(ι(y)) ≤ ε}. ι has the small-points property if Y(L, ε) is not Zariski dense in Y for some ε > 0. The property does not depend on L: for two such L, L′ there is n > 0 with n^{-1}ĥ_L ≤ ĥ_{L′} ≤ nĥ_L on A(K̄).

**Hypotheses.** as stated.

**Construction or proof.**

1. Fibrewise Néron–Tate heights of L are the heights of its invariant adelic extension (AH.5).
2. Two symmetric relatively ample rigidified bundles dominate positive multiples of each other on the generic fibre, and canonical heights are monotone and linear in the bundle.

**Uses.** Yuan, Proposition 4.18 and Theorem 4.19: the property is established for maps built from curve families; Dimitrov–Gao–Habegger, relative Bogomolov conjecture: the general conjecture asserts the property for subvarieties generating the generic fibre, of dimension below the relative dimension; it is recorded only as context, never as an input.

**API.**

- `HasRelativeSmallPoints` (data): The predicate on ι.
- `HasRelativeSmallPoints.indep` (other): Independent of L.
- `HasRelativeSmallPoints.mono` (other): If Y′ → Y is dominant generically finite and ι∘(Y′ → Y) has the property, so does ι.
- `HasRelativeSmallPoints.point_base` (compatibility): For S a point and ι a closed immersion, the property is the conclusion of the Bogomolov theorem for ι(Y) (parent RP.5).

**Unit tests.**

- `HasRelativeSmallPoints.torsion_section` (non-example): A torsion section of an elliptic scheme over a curve has ĥ = 0 at every point and does not have the property.
- `HasRelativeSmallPoints.zero_section` (degenerate): The zero section never has the property (all heights vanish).
- `HasRelativeSmallPoints.genus_two_curve` (computation): For S a point and ι a genus-two curve embedded in its Jacobian over a number field, the property holds (Bogomolov).

**Needs.** `HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`, `ArakelovGeometryAndAbelianHeightsPartII:AH.5/invariant-extension`, `AbelianSchemesAndArithmeticModuli:A2`

**Sources.** yuan-2026, §4.6.3, p. 100 (author manuscript 21 August 2024): Defines the small-points property of a generically finite map to an abelian scheme for fibrewise canonical heights, notes its independence of the polarization, and recalls the relative Bogomolov conjecture of Dimitrov–Gao–Habegger, which it does not prove in general.

### Arithmetic potential bigness gives the small-points property (Yuan Proposition 4.18)

`UB.10/relative-bogomolov-bigness` · theorem

Let K be a number field or a function field of one variable over k, S a normal quasi-projective K-variety, A → S an abelian scheme, ι : Y → A generically finite and L symmetric relatively ample rigidified with canonical adelic extension L̄ over k (ℤ in the arithmetic case). If Y → S is projective flat with geometrically integral generic fibre of dimension e, L|_Y is big on that fibre, and the relative Deligne pairing ⟨(ι^*L̄)^{e+1}⟩_{Y/S} is big on S/k, then ι^m : Y^m_{/S} → A^m_{/S} has the small-points property for every m ≥ dim_K S + 1. Bigness over k is an explicit hypothesis; relative variation over K alone does not replace it.

**Hypotheses.** as stated, with bigness on S/k.

**Construction or proof.**

1. By the criterion, m⊠ι^*L̄ is big on Y^m_{/S} over k for m ≥ dim_K S + 1 (one more than the geometric threshold, since the base now has absolute dimension dim_K S + 1).
2. The height inequality (AH.4 part (1)) applied to m⊠ι^*L̄ and an auxiliary adelic Ā of height ≥ 1 at every point gives ε > 0 and a dense open U ⊆ Y^m_{/S} with h_{m⊠L̄} ≥ ε on U(K̄); points of Y^m all of whose coordinates have height ≤ ε/(2m) lie in the proper closed complement, so small points are not dense.

**Checks.**

- In the function-field case the hypothesis is bigness over the constant field k; a constant family fails it.
- The structure morphism is ψ∘ι, misprinted as π (E26).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.10/relative-small-points`, `ArakelovGeometryAndAbelianHeightsPartII:AH.12/potential-bigness-criterion`, `ArakelovGeometryAndAbelianHeightsPartII:AH.4/height-inequality`, `ArakelovGeometryAndAbelianHeightsPartII:AH.3/deligne-pairing`

**Sources.** yuan-2026, Proposition 4.18, p. 100 (author manuscript 21 August 2024): Shows that bigness of the arithmetic Deligne pairing over the base gives the relative small-points property for high fibre powers, via the height inequality.

### Relative Bogomolov for curve families (Yuan Theorem 4.19)

`UB.10/relative-bogomolov-curves` · theorem

Let K be a number field, or a function field of one variable over k with k its field of constants, S a quasi-projective K-variety and π : X → S a smooth relative curve of genus g > 1 with maximal variation — in the function-field case, maximal variation over k (the moduli morphism generically finite on a projective model of S over k). Let α have positive relative degree. Then the small-points property holds for: (1) i_α^m for m ≥ dim S + 1; (2) i_Δ^m for m ≥ dim S + 2; (3) i_{ω−Q}^m for m ≥ dim S + g + 1; (4) the Faltings–Zhang map X^{m+1}_{/S} → J^m_{/S} for m ≥ dim S + 2; (5) τ_m for m ≥ dim S + g + 1.

**Hypotheses.** g > 1; maximal variation (over k in the function-field case); α of positive relative degree.

**Construction or proof.**

1. Theta potential bigness over k (AH.12) gives bigness of the Deligne pairings over k; the thresholds rise by one from those of Theorem 4.17 because the base is now absolute.
2. Apply the arithmetic potential-bigness proposition.
3. Function fields: the counterexample recorded as E1 (a constant family over K with K-relative but not k-relative variation) shows the printed K-relative hypothesis is false; the plan states the corrected hypothesis.

**Checks.**

- For S a point over a number field, part (1) applies to the Abel image of C with m=1. Part (4) first applies at m=2, to the difference image of C³ in J². For genus two C−C=J, so claiming non-dense small points on that m=1 image would be false.
- The function-field branches hold only with maximal variation over the constants (E1).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.10/relative-bogomolov-bigness`, `HeightsRationalPointsAndObstructionsPartII:UB.10/abel-power-nondegeneracy`, `ArakelovGeometryAndAbelianHeightsPartII:AH.12/theta-potential-bigness`, `StableReductionPartII:MC.6/maximal-variation-hodge`

**Sources.** yuan-2026, Theorem 4.19, p. 101 (author manuscript 21 August 2024): Establishes the relative Bogomolov small-points property for the five maps attached to a curve family with maximal variation; in the function-field case the printed hypothesis of maximal variation over K is too weak and must be read over the constant field (source issue E1 of the Yuan extraction).

## Layer UB.11: Uniform Bogomolov for curves over global fields

Yuan’s Theorem 1.1: the twice-theta normalization, projective heights over function fields with fixed constants, isotrivial pairs and the isotriviality criteria (Lemma 4.8), the noetherian-induction small-points bound on the universal shift, the shifted height identity with Bost’s bound, moduli-height domination over function fields, uniformity across all characteristics (§4.4.3), and the uniform Bogomolov-type theorem.

### The twice-theta Néron–Tate normalization of a curve

`UB.11/twice-theta-height` · construction

Let C be a smooth projective curve of genus g > 1 over a number field or a function field of one variable K, J its Jacobian and x₀ ∈ C(K̄). θ_{x₀} is the image of C^{g−1} → J, (x_i) ↦ Σ x_i − (g − 1)x₀, and Θ = O(θ_{x₀} + [−1]^*θ_{x₀}) is symmetric ample, independent of x₀ and descends to J (it is the canonical twice-theta bundle). The Néron–Tate height of the curve is ĥ = ½ĥ_Θ, with ĥ_Θ the Tate limit of a Weil height of Θ in the normalization of heights over K (absolute over ℚ for number fields, over K/k for function fields).

**Hypotheses.** g > 1; K a global field (number field or function field of one variable).

**Construction or proof.**

1. The twice-theta bundle is the canonical one of JacobianChallengePartII JC3 (independent of x₀ by the theorem of the square).
2. Tate’s limit of the Weil height of Θ (parent RP.0); halve it.

**Uses.** Yuan, Theorem 1.1: the uniform bound is stated for ĥ(x − α); Yuan, §4.4.1: h_{τ^*Θ̄_J}(y, x) = 2ĥ((2g − 2)x − (ω − y)).

**API.**

- `Curve.neronTate` (data): ĥ : J(K̄) → ℝ≥0 for the curve C.
- `Curve.neronTate_eq_half` (characterisation): ĥ = ½ĥ_Θ for the twice-theta bundle Θ.
- `Curve.neronTate_principal` (compatibility): ĥ equals the Néron–Tate height of the principal polarization O(θ_{x₀}) when θ_{x₀} is symmetric, since Θ ≅ O(2θ_{x₀}) then.
- `Curve.neronTate_smul` (simp): ĥ(nP) = n²ĥ(P).
- `Curve.neronTate_eq_zero_iff` (characterisation): Over a number field, ĥ(P) = 0 iff P is torsion.

**Unit tests.**

- `Curve.neronTate_genus_two_weierstrass` (computation): For a genus-two curve and x₀ a Weierstrass point, θ_{x₀} is symmetric and Θ = O(2θ_{x₀}).
- `Curve.neronTate_zero` (degenerate): ĥ(0) = 0.
- `Curve.neronTate_not_full` (non-example): Using ĥ_Θ instead of ½ĥ_Θ doubles every height; the uniform constants c₁ are stated for the halved height.

**Needs.** `JacobianChallengePartII:JC3/twice-theta`, `JacobianChallengePartII:JC3/degree-one-theta`, `HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`, `ArakelovGeometryAndAbelianHeightsPartII:AH.8/canonical-theta-bundle`

**Sources.** yuan-2026, §4.3.1, p. 71 (author manuscript 21 August 2024): Defines the theta divisor by a base point, the symmetric twice-theta bundle, its independence of the base point and the Néron–Tate height as half the canonical height of that bundle, with the normalization of Weil heights.

### Projective heights over function fields with fixed constants

`UB.11/function-field-height-normalization` · construction

Let K/k be a function field of transcendence degree one and x = [x₀ : ⋯ : x_n] with coordinates in a finite extension K′/K. Put h(x) = [K′ : K]^{-1} Σ_v log max_i ‖x_i‖_v, where v runs over the closed points of the regular projective k-curve with function field K′ and ‖a‖_v = exp(−[k(v) : k]·ord_v(a)). The constant field k is kept fixed under extension of K. h is independent of homogeneous coordinates and of the choice of K′.

**Hypotheses.** K/k of transcendence degree one; k not necessarily algebraically closed.

**Construction or proof.**

1. Product formula on the regular projective curve of K′ (degrees of principal divisors vanish, weighted by [k(v) : k]) gives independence of coordinates.
2. Dividing by [K′ : K] gives independence of K′ (sum over places above v of e·f equals the degree).
3. Compare with the parent’s heights over polarized function fields (RP.0): for k algebraically closed the weights are 1 and the two agree.

**Uses.** Yuan, Theorem 1.1: heights over function fields are normalized this way, uniformly in k; Yuan, Theorem 4.10: deĝ(M̄|_y) uses the same weights.

**API.**

- `FunctionFieldHeight` (data): h : ℙⁿ(K̄) → ℝ≥0.
- `FunctionFieldHeight.coord_indep` (other): Independent of homogeneous coordinates (product formula).
- `FunctionFieldHeight.extension_indep` (other): Independent of the finite extension K′ containing the coordinates.
- `FunctionFieldHeight.constant_zero` (characterisation): h(x) = 0 iff x is defined over the algebraic closure of k in K̄ (all coordinate ratios constant).
- `FunctionFieldHeight.compat_polarized` (compatibility): For k algebraically closed, h agrees with the parent’s height for the polarized function field (S, M) with dim S = 1.

**Unit tests.**

- `FunctionFieldHeight.t` (computation): For K = k(t), h([1 : t]) = 1 (one pole of order 1 at infinity, residue degree 1).
- `FunctionFieldHeight.residue_weight` (computation): For k = ℝ, K = ℝ(t) and x = [1 : 1/(t² + 1)], h(x) = 2: the place t² + 1 has residue degree 2 over ℝ.
- `FunctionFieldHeight.constant` (non-example): h([1 : c]) = 0 for c ∈ k; a height without residue weights would give the wrong value when k is not algebraically closed (e.g. [1 : 1/(t² + 1)] over ℝ(t) would get 1).

**Needs.** `HeightsRationalPointsAndObstructions:RP.0/normalized-height`, `HeightsRationalPointsAndObstructions:RP.0/geometric-height-field`, `mathlib:Projectivization.logHeight`

**Sources.** yuan-2026, §4.3.1, pp. 71–72 (author manuscript 21 August 2024): Defines the projective height over a function field of one variable, with residue-degree weights over a fixed constant field and division by the extension degree, and records its independence of choices.

### Isotrivial curve–line-bundle pairs

`UB.11/isotrivial-pair` · definition

Fix a function field K of one variable over k and an embedding k̄ → K̄. A pair (C, α) over K̄, with C a smooth projective curve of genus g > 1 and α a line bundle of degree d on C, is isotrivial (over k) if it is isomorphic to the scalar extension of a pair (C₀, α₀) over k̄; otherwise it is non-isotrivial. Triples (C, η, α) with a full level-N structure η (N ≥ 3 prime to char k) are defined isotrivial in the same way.

**Hypotheses.** K/k of transcendence degree one; g > 1.

**Construction or proof.**

1. A predicate on isomorphism classes of pairs over K̄ relative to the fixed embedding of k̄.

**Uses.** Yuan, Theorem 1.1: the uniform bound over function fields assumes (C_{K̄}, α) non-isotrivial; Yuan, Lemma 4.8: non-isotriviality can be tested with level structure or after the canonical shift.

**API.**

- `IsIsotrivialPair` (data): The predicate on (C, α) over K̄.
- `IsIsotrivialPair.of_curve` (relation): If (C, α) is isotrivial then C is isotrivial; the converse fails.
- `IsIsotrivialPair.level` (characterisation): (C, η, α) isotrivial iff (C, α) isotrivial (Lemma 4.8(a)⇔(b)).
- `IsIsotrivialPair.shift` (characterisation): (C, η, α) isotrivial iff (C, η, (2g − 2)α − d·ω_C) isotrivial (Lemma 4.8(b)⇔(c)).
- `IsIsotrivialPair.moduli` (characterisation): Isotrivial iff the moduli point in Pic^d_{𝒞/M} comes from k̄, equivalently its image in the k-scheme is closed.

**Unit tests.**

- `IsIsotrivialPair.constant_curve_moving_point` (computation): Let C₀/k be smooth projective of genus >1 and K=k(C₀). On the constant curve C=C₀×_k K̄ take α=O(x) for its generic K-point x. Then C is isotrivial and the pair (C,α) is non-isotrivial.
- `IsIsotrivialPair.constant_pair` (degenerate): C₀ ⊗ K̄ with α = α₀ ⊗ K̄ is isotrivial.
- `IsIsotrivialPair.number_field` (non-example): The notion is only for function fields: over a number field there is no constant field to compare with, and Yuan’s theorem needs no such hypothesis there.

**Needs.** `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `JacobianChallengePartII:JC0/picard-representability`, `StableReductionPartII:MC.4/full-level`

**Sources.** yuan-2026, §4.3.2, pp. 73–74 (author manuscript 21 August 2024): Defines isotriviality of curves with line bundles (and with level structure) over function fields, noting that the curve alone may be constant while the pair is not.

### Isotriviality via level structure, canonical shift and the moduli point (Yuan Lemma 4.8)

`UB.11/isotriviality-criteria` · theorem

Let K/k be a function field of one variable, k̄ ⊆ K̄ fixed, and (C, η, α) over K̄ of genus g > 1, full level N ≥ 3 prime to char k, deg α = d. (a) (C, η, α) is isotrivial iff (C, α) is isotrivial. (b) (C, η, α) descends to k̄ iff (C, η, (2g − 2)α − d·ω_C) does. (c) The triple corresponding to a point of Pic^d_{𝒞/M_{g,N}}(K̄) is isotrivial iff that point comes from Pic^d_{𝒞/M_{g,N}}(k̄), equivalently its image in the k-scheme Pic^d_{𝒞/M_{g,N}} is a closed point. Geometric torsion points, including p-primary ones, are unchanged under algebraically closed constant extension.

**Hypotheses.** N ≥ 3 prime to char k; g > 1.

**Construction or proof.**

1. (a) Rigidity of level structures (StableReductionPartII MC.4): a level-N structure on an isotrivial curve is defined over k̄ after the identification, since the level-N torsion of a constant Jacobian is constant.
2. (b) α ↦ (2g − 2)α − dω_C is a finite map on Pic^d with finite fibres (translates by (2g − 2)-torsion), and torsion of a constant Jacobian is constant, including p-primary torsion over algebraically closed k̄.
3. (c) The fine moduli space M_{g,N} and its relative Picard scheme represent triples (MC.7); a K̄-point comes from k̄ iff it factors through the closed points of the k-scheme.

**Checks.**

- The full level structure supplies a fine moduli space with a universal curve and relative Picard scheme representing triples. Without it that representability argument is unavailable; this alone does not disprove the corresponding criterion on geometric isomorphism classes.
- The function μ_N in clause (3) of the triple definition is over F = k̄ (source issue E19 of the Yuan extraction).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.11/isotrivial-pair`, `HeightsRationalPointsAndObstructionsPartII:UB.10/non-isotrivial-point`, `StableReductionPartII:MC.4/fine-level-scheme`, `StableReductionPartII:MC.4/level-rigidity`, `StableReductionPartII:MC.7/level-picard-parameter`

**Sources.** yuan-2026, Lemma 4.8, p. 74, and §4.3.2, p. 75 (author manuscript 21 August 2024): Shows that non-isotriviality is unaffected by adding level structure and by the canonical shift, and identifies isotrivial triples with constant points of the relative Picard scheme over the fine moduli space.

### Small points over the universal shift by noetherian induction (Yuan §4.4.1)

`UB.11/noetherian-induction-bound` · theorem

Work over a field with a chosen primitive N-th root of unity and N invertible, or over B=Spec ℤ[1/N,ζ_N], N ≥ 3. Let S = M_{g,N} be the fine symplectic-level moduli scheme over this base of smooth genus-g > 1 curves with full level-N structure and π : X → S its universal curve (more generally, S quasi-finite over M_g, so that every closed subvariety of S has generically finite moduli map). With J = Pic⁰_{X/S}, Θ̄ its canonical nef symmetric twice-theta adelic bundle, X_J = J ×_S X, J_J = J ×_S J, q₁ : X_J → J, τ(y, x) = (y, y + (2g − 2)x − ω) and L̄ = τ^*p₂^*Θ̄: for every adelic M̄ on J (over ℤ in the arithmetic case) there are c₁, c₂ > 0 with #{z ∈ X_J(K̄) : q₁(z) = y, h_{L̄}(z) ≤ c₁h_{M̄}(y)} ≤ c₂ for all y ∈ J(K̄) over number fields, and the analogous bound with deĝ(M̄|_y) for non-isotrivial function-field points.

**Hypotheses.** S = M_{g,N} with its universal curve, or S quasi-finite over M_g; g > 1.

**Construction or proof.**

1. L̄ is potentially big on X_J/J (AH.12, theta potential bigness part (3)); the small-points bound gives the claim on a dense open U ⊆ J.
2. For every irreducible closed Y ⊆ J ∖ U, the restriction of L̄ to X_Y is potentially big over Y (part (4), whose hypothesis is that the image T of Y in S has generically finite moduli map — automatic for S quasi-finite over M_g, which is why S is the fine moduli space — with dim T for dim S as in source issue E16); apply the bound on a dense open of Y.
3. Noetherian induction on closed subsets of J terminates after finitely many steps; normalize subvarieties where the bound needs normal bases.
4. Over B=Spec ℤ[1/N,ζ_N], Theorem 4.10 applies to the horizontal integral strata after normalization. Vertical strata are varieties over finite fields and require the geometric small-points theorem 4.2(2); a vertical component is not flat over ℤ. The all-characteristic bookkeeping is kept separate in UB.11/characteristic-uniformity.

**Checks.**

- The constants depend on the family X → S and on M̄ only.
- Without part (4) of theta potential bigness the induction cannot leave the generic open set.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.10/small-points-bound-families`, `HeightsRationalPointsAndObstructionsPartII:UB.10/integral-small-points-bound`, `ArakelovGeometryAndAbelianHeightsPartII:AH.12/theta-potential-bigness`, `ArakelovGeometryAndAbelianHeightsPartII:AH.8/canonical-theta-bundle`, `StableReductionPartII:MC.4/fine-level-scheme`

**Sources.** yuan-2026, §4.4.1, pp. 76–77; §4.4.2, pp. 79–81 (author manuscript 21 August 2024): Over the fine moduli space M_{g,N} and its universal curve, applies the small-points bound to the universal shift family on a dense open of J, then to every closed subvariety by potential bigness of the restriction (whose hypothesis is a generically finite moduli map on the image in S), terminating by dimension.

### Heights on the universal shift and the moduli height (Yuan §4.4.1)

`UB.11/shifted-height-identity` · theorem

In the setting of the noetherian induction bound over a number field, for z = (y, x) ∈ X_J(K̄) above s ∈ S(K̄): h_{L̄}(z) = 2ĥ((2g − 2)x − (ω_{X_s} − y)). For M̄ = Θ̄ + π_J^*λ̄_S + O(c), with λ̄_S the adelic Hodge bundle of X → S, h_{M̄}(y) = 2ĥ(y) + h_Fal(X_s) + c. Bost’s lower bound for the Faltings height then gives h_{M̄}(y) ≥ c₃(max{h_Fal(X_s), 1} + ĥ(y)) for a suitable c.

**Hypotheses.** number-field normalization; s ∈ S(K̄).

**Construction or proof.**

1. Projection formula for τ₁ = p₂ ∘ τ : X_J → J, with τ₁(y, x) the class of y + (2g − 2)x − ω on X_s: h_{L̄}(z) = h_Θ(τ₁(z)) = 2ĥ(τ₁(z)), and [−1] symmetry of ĥ.
2. h_{Θ̄}(y) = 2ĥ(y), h_{λ̄_S}(s) = h_Fal(X_s) (AH.5, adelic Hodge bundle computes the Faltings height), and O(c) has height c.
3. Bost’s bound h_Fal ≥ −C(g) (AH.13, in the Faltings normalization; the constant printed by Yuan uses Deligne’s normalization, an erratum recorded by the Arakelov Part II plan): with c = C(g) + 1, h_{M̄}(y) = 2ĥ(y) + h_Fal(X_s) + c ≥ ĥ(y) + max{h_Fal(X_s), 1}, so c₃ = 1 works.

**Checks.**

- For y = ω − (2g − 2)α with α of degree 1, (2g − 2)x − (ω − y) = (2g − 2)(x − α), so the identity converts the claim into a bound for ĥ(x − α).
- The shift y ↦ ω − (2g − 2)α is surjective on degree-0 classes after extending K, which is why α may be any class in Pic¹(C_{K̄}).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.11/twice-theta-height`, `ArakelovGeometryAndAbelianHeightsPartII:AH.5/adelic-hodge-bundle`, `ArakelovGeometryAndAbelianHeightsPartII:AH.13/bost-lower-bound`, `ArakelovGeometryAndAbelianHeightsPartII:AH.9/canonical-theta-identities`, `ArakelovGeometryAndAbelianHeightsPartII:AH.4/adelic-heights`

**Sources.** yuan-2026, §4.4.1, pp. 77–78 (author manuscript 21 August 2024): Computes the heights of the theta pullback along the universal shift and of the auxiliary bundle built from the twice-theta bundle and the Hodge bundle, and uses Bost’s lower bound for the Faltings height.

### Moduli height domination over function fields (Yuan §4.4.2)

`UB.11/geometric-moduli-domination` · theorem

Over a field k, in the setting of the noetherian induction bound, take M̄ = Θ̄ + π_J^*λ̄_{S̄} + N with N ample on a projective compactification of J. For every point y ∈ J of dimension one with image s ∈ S, deĝ(M̄|_y) ≥ 2ĥ(y) + h_Fal(X_{s, k(y)}) + 1, the last term coming from the positive integral degree of N on the closure of y.

**Hypotheses.** k a field; y a dimension-one point of J.

**Construction or proof.**

1. Degrees are additive: deĝ(Θ̄|_y) = 2ĥ(y) in the normalization over k(y)/k, deĝ(λ̄|_y) = h_Fal(X_s) for the function-field Faltings height (AH.13) with the Hodge bundle on the stable compactification.
2. N is ample on a projective model, so its degree on the closure of y is a positive integer, at least 1.

**Checks.**

- The constant 1 replaces Bost’s bound: over function fields h_Fal ≥ 0 (AH.13).
- For isotrivial points the degree of N on the (zero-dimensional) closure is not defined; only dimension-one points are considered.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.11/twice-theta-height`, `ArakelovGeometryAndAbelianHeightsPartII:AH.5/adelic-hodge-bundle`, `ArakelovGeometryAndAbelianHeightsPartII:AH.13/function-field-faltings-height`, `HeightsRationalPointsAndObstructionsPartII:UB.11/function-field-height-normalization`, `ArakelovGeometryAndAbelianHeightsPartII:AH.4/adelic-heights`

**Sources.** yuan-2026, §4.4.2, pp. 79–80 (author manuscript 21 August 2024): Bounds the degree of the auxiliary adelic line bundle on a one-dimensional point from below by the Néron–Tate height, the Faltings height of the fibre and 1.

### Uniformity of the constants across all global fields (Yuan §4.4.3)

`UB.11/characteristic-uniformity` · theorem

For each g > 1 the constants of the uniform small-points bound for genus-g curves can be chosen depending only on g, simultaneously for all number fields and all function fields of one variable over all fields k of all characteristics.

**Hypotheses.** g > 1.

**Construction or proof.**

1. Over S=M_{g,N} over B=Spec ℤ[1/N,ζ_N], apply the integral small-points bound to q₁:X_J→J, with L̄=τ^*Θ̄_J and M̄=Θ̄+π_J^*λ̄_S+N̄. Its initial exceptional locus is a proper closed subset of J, the actual parameter space for y; it is not automatically a subset of S.
2. Apply the integral bound successively to horizontal components of the exceptional locus in J, using theta potential bigness after restriction and normalization. Dimension drops over ℚ, leaving a vertical closed subset of J with image in finitely many characteristics. This needs the restricted-family input; projecting one initial exceptional locus to S would not suffice.
3. For each remaining prime p (including primes dividing N), choose N″≥3 prime to p and run the geometric small-points theorem 4.2(2) on the universal shift over a fixed symplectic component of M_{g,N″} after adjoining ζ_{N″} to 𝔽_p, with noetherian induction on its Jacobian. The required uniform statement across constant-field extensions must be justified in this geometric setting; Yuan omits these details and the gap remains. It is not an application of Theorem 4.10 to a base flat over ℤ.
4. Number fields are covered by the arithmetic case; take the extrema of the finitely many constants (source issue E15 of the Yuan extraction corrects the cross-references to Theorem 4.7).
5. The cyclotomic base is finite flat over ℤ[1/N]. Geometric height normalization is invariant under finite extension of the function field; arithmetic heights are absolute. Thus adjoining level roots does not introduce constants depending on the input field.

**Checks.**

- The level N is fixed; changing it only changes finitely many characteristics.
- Uniformity over k is genuine: the constants do not depend on the constant field, which may be non-algebraically closed.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.10/integral-small-points-bound`, `HeightsRationalPointsAndObstructionsPartII:UB.11/noetherian-induction-bound`, `HeightsRationalPointsAndObstructionsPartII:UB.11/geometric-moduli-domination`, `HeightsRationalPointsAndObstructionsPartII:UB.11/isotriviality-criteria`, `StableReductionPartII:MC.4/fine-level-scheme`, `JacobianChallengePartII:JC7/universal-level-jacobian`

**Sources.** yuan-2026, §4.4.3, pp. 83–84 (author manuscript 21 August 2024): Works over the full-level moduli space over ℤ[1/N], applies the integral small-points bound and induction to remove the exceptional locus over ℚ, and treats the finitely many remaining characteristics over separate prime-to-p levels over 𝔽_p, taking extrema of finitely many constants; the details for the finitely many characteristics are omitted in the source.

**Open input.** Positive-characteristic step of Yuan §4.4.3 omitted in the source.

### The uniform Bogomolov-type theorem for curves (Yuan Theorem 1.1)

`UB.11/uniform-bogomolov-curves` · theorem

For each integer g > 1 there are c₁(g), c₂(g) > 0, valid simultaneously for all number fields and all function fields of one variable over any field k, in every characteristic, such that: for every smooth projective geometrically integral curve C of genus g over K and every α ∈ Pic(C_{K̄}) of degree 1, assuming in the function-field case that (C_{K̄}, α) is non-isotrivial over k, #{x ∈ C(K̄) : ĥ(x − α) ≤ c₁(max{h_Fal(C), 1} + ĥ((2g − 2)α − ω_{C/K}))} ≤ c₂. Here ĥ is half the canonical height of the symmetric twice-theta bundle, normalized absolutely over ℚ for number fields and over K/k (fixed k) for function fields.

**Hypotheses.** g > 1; K a number field or a function field of one variable over k; (C_{K̄}, α) non-isotrivial in the function-field case.

**Construction or proof.**

1. Choose a full level N and pass to a finite extension of K over which the level structure is defined (heights are invariant).
2. Number fields: the noetherian induction bound for the universal family with M̄ = Θ̄ + π_J^*λ̄_S + O(c), the shifted height identity, and y = ω − (2g − 2)α give #{x : (2g − 2)²ĥ(x − α) ≤ c₁c₃(max{h_Fal, 1} + ĥ(ω − (2g − 2)α))} ≤ c₂.
3. Function fields: the same with the geometric moduli domination and Lemma 4.8 to translate non-isotriviality of the moduli point; replace h_Fal + 1 by max{h_Fal, 1} using h_Fal ≥ 0.
4. Uniformity in K across characteristics: the characteristic-uniformity theorem.

**Checks.**

- For α = y ∈ C(K̄) over a number field, dropping the non-negative term ĥ((2g − 2)α − ω) recovers the new gap principle for curves.
- The non-isotriviality hypothesis is on the pair: for a constant curve and a constant α there are infinitely many points of height 0.
- Taking the threshold term only (c₁ max{h_Fal, 1}) and Γ = torsion gives uniform Manin–Mumford for curves over global fields of every characteristic (for non-isotrivial pairs).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.11/characteristic-uniformity`, `HeightsRationalPointsAndObstructionsPartII:UB.11/noetherian-induction-bound`, `HeightsRationalPointsAndObstructionsPartII:UB.11/shifted-height-identity`, `HeightsRationalPointsAndObstructionsPartII:UB.11/geometric-moduli-domination`, `HeightsRationalPointsAndObstructionsPartII:UB.11/isotriviality-criteria`, `HeightsRationalPointsAndObstructionsPartII:UB.11/isotrivial-pair`, `HeightsRationalPointsAndObstructionsPartII:UB.11/twice-theta-height`, `HeightsRationalPointsAndObstructionsPartII:UB.11/function-field-height-normalization`, `ArakelovGeometryAndAbelianHeightsPartII:AH.13/function-field-faltings-height`, `ArakelovGeometryAndAbelianHeights:R35.3/stable-faltings-height`

**Sources.** yuan-2026, Theorem 1.1, p. 5, and Theorem 4.7, p. 70; proof §4.4, pp. 76–84 (author manuscript 21 August 2024): States the uniform bound for points of small height relative to a degree-one class, strengthening the new gap principle by the extra term ĥ((2g − 2)α − ω), allowing α ∈ Pic¹ and covering global fields of all characteristics with uniform constants; the proof rests on bigness of the admissible canonical bundle on the universal curve.

## Layer UB.12: A bielliptic family: uniform Manin–Mumford by dynamics

DeMarco–Krieger–Ye: bielliptic genus-two curves as lifts of the diagonal (Proposition 9.1), uniform Manin–Mumford (Theorem 1.1) and uniform Bogomolov (Theorem 1.9, published 1.10) for their Weierstrass Abel–Jacobi images from the dynamical bounds of ArithmeticDynamics DY.6, and unboundedness of torsion orders (published Proposition 9.2); both theorems are special cases of the uniform theorems of UB.3.

### Bielliptic genus-two curves as lifts of the diagonal (DKY Proposition 9.1)

`UB.12/bielliptic-diagonal-lift` · theorem

Every smooth genus-2 curve X over ℂ admitting a degree-2 map to an elliptic curve has a model y² = x⁶ − s₁x⁴ + s₂x² − 1 and is the normalization of the lift of the diagonal D ⊆ ℙ¹ × ℙ¹ under π₁ × π₂, for elliptic curves E₁, E₂ with standard projections π_i satisfying |π₁(E₁[2]) ∩ π₂(E₂[2])| = 3, the group laws taken with origins O_i over a common branch value r. There are a Weierstrass point Q of X and an isogeny Φ : J(X) → E₁ × E₂ of degree 4 with Φ(j_Q(X)) = (π₁ × π₂)^{-1}(D); the non-zero elements of ker Φ are the differences of the two Weierstrass points over each common branch value.

**Hypotheses.** X smooth genus 2 over ℂ with a degree-2 map to an elliptic curve.

**Construction or proof.**

1. The Jacobi model of bielliptic genus-two curves is cited from Shaska–Völklein and Jacobi (not proved here); the two involutions (x, y) ↦ (−x, ±y) give quotients E₁, E₂.
2. The quotient maps combine to J(X) → E₁ × E₂ with kernel the 2-torsion classes listed; the image of the Abel–Jacobi curve based at a Weierstrass point Q over the common branch value r is the preimage of the diagonal (McMullen, Theorem 4.10, as DKY use it).

**Checks.**

- The bielliptic locus in M₂ is a surface (Jacobians with real multiplication by the order of discriminant 4).
- Exactly three common branch values occur; two would not give a degree-4 isogeny of this shape.

**Needs.** `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, `ArithmeticDynamics:DY.6/two-torsion-translation`, `ArithmeticDynamics:DY.6`

**Sources.** dky-2020, §§9.1–9.2, Proposition 9.1 and proof, pp. 45–47 (arXiv v2); published version pp. 994–996: Represents every bielliptic genus-two curve through the diagonal of the product of the two elliptic quotients with three common branch values, giving a degree-four isogeny of the Jacobian onto E₁ × E₂ carrying the Abel–Jacobi curve to the lift of the diagonal.; dky-published-2020, Proposition 9.1 and proof, §§9.1–9.2, pp. 995–996: Represents every bielliptic genus-two curve through the diagonal of the product of the two elliptic quotients with three common branch values, giving a degree-four isogeny of the Jacobian onto E₁ × E₂ carrying the Abel–Jacobi curve to the lift of the diagonal.

**Open input.** Jacobi model of bielliptic genus-two curves cited.

### Uniform Manin–Mumford for bielliptic genus-two curves (DKY Theorem 1.1)

`UB.12/bielliptic-uniform-manin-mumford` · theorem

There is a uniform B such that |j_P(X) ∩ J(X)_tors| ≤ B for every smooth bielliptic genus-2 curve X over ℂ and every Weierstrass point P of X, where j_P is the Abel–Jacobi embedding based at P.

**Hypotheses.** X bielliptic of genus 2 over ℂ; P a Weierstrass point.

**Construction or proof.**

1. A common x-coordinate has at most four lifts to E₁×E₂, and each point has at most four preimages under the degree-four isogeny Φ. Thus at most sixteen points of j_Q(X) lie above each common coordinate.
2. The common torsion images are uniformly bounded (ArithmeticDynamics DY.6, the three-common-branch-values bound).
3. Any other Weierstrass point P differs from Q by a 2-torsion class, so j_P(X) is a 2-torsion translate of j_Q(X) and has the same number of torsion points.
4. Consistency: the uniform Manin–Mumford theorem for curves gives the same conclusion with B = c(2); DKY’s proof is the independent dynamical one.

**Checks.**

- Stoll’s curve y² = x⁶ + 130x³ + 13, which is bielliptic, has 34 torsion points on its Weierstrass Abel–Jacobi image, so B ≥ 34.
- The bound is not explicit in DKY (Remark 1.2).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.12/bielliptic-diagonal-lift`, `ArithmeticDynamics:DY.6/common-torsion-images-three-common-branch-values`, `ArithmeticDynamics:DY.6/two-torsion-translation`, `HeightsRationalPointsAndObstructionsPartII:UB.3/uniform-manin-mumford`

**Sources.** dky-2020, Theorem 1.1, p. 1; proof §9.3, p. 47 (arXiv v2): Bounds the torsion points on the Abel–Jacobi image of a bielliptic genus-two curve by 16 times the number of common torsion images of the two elliptic quotients, which is uniformly bounded, and passes between Weierstrass base points by 2-torsion translation.; dky-published-2020, §9.3, p. 996: Bounds the torsion points on the Abel–Jacobi image of a bielliptic genus-two curve by 16 times the number of common torsion images of the two elliptic quotients, which is uniformly bounded, and passes between Weierstrass base points by 2-torsion translation.

### Uniform Bogomolov for bielliptic genus-two curves (DKY Theorem 1.9; Theorem 1.10 of the published version)

`UB.12/bielliptic-uniform-bogomolov` · theorem

There are B and b > 0 such that |{x ∈ j_P(X)(ℚ̄) : ĥ_{L_X}(x) ≤ b}| ≤ B for every smooth genus-2 curve X over ℚ̄ with a degree-2 map to an elliptic curve and every Weierstrass point P, where L_X = Φ^*L_D for the isogeny Φ : J(X) → E₁ × E₂ of the diagonal-lift proposition and D = {O₁} × E₂ + E₁ × {O₂}.

**Hypotheses.** X bielliptic of genus 2 over ℚ̄; P Weierstrass.

**Construction or proof.**

1. Functoriality: ĥ_{L_X} = ½(ĥ_{t₁} ∘ π ∘ Φ₁ + ĥ_{t₂} ∘ π ∘ Φ₂), with Lattès heights of the two elliptic quotients (ArithmeticDynamics DY.6).
2. A point of j_Q(X) of small ĥ_{L_X} maps to a point x of ℙ¹ with ĥ_{t₁}(x) + ĥ_{t₂}(x) small; the uniform joint small-points bound (DKY Theorem 8.1, DY.6) bounds such x, each with at most 16 preimages.
3. For any Weierstrass P, the class P−Q is 2-torsion. Translation by torsion leaves the quadratic canonical height for the same symmetric L_X exactly unchanged. The bijection j_Q(X)→j_P(X) therefore preserves the small-point count and supplies the missing base-point step in the printed proof (DKY E8).

**Checks.**

- A special case of the uniform Bogomolov theorem (Gao–Ge–Kühne Theorem 1.3) for X = j_P(X) in J(X) with the polarization L_X.
- The threshold b is absolute, not scaled by the Faltings height.

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.12/bielliptic-diagonal-lift`, `ArithmeticDynamics:DY.6/legendre-uniform-joint-small-points`, `ArithmeticDynamics:DY.6/lattes-map-canonical-height`, `HeightsRationalPointsAndObstructionsPartII:UB.3/uniform-bogomolov`

**Sources.** dky-2020, Theorem 1.9, p. 5; proof §9.4, p. 47 (arXiv v2); published version Theorem 1.10, p. 953, proof §9.4, p. 997: Proves uniform Bogomolov for the Abel–Jacobi images of bielliptic genus-two curves from the uniform bound on joint small points of two Lattès maps, writing the height for the pulled-back divisor as half the sum of the Lattès heights.; dky-published-2020, §9.4, p. 997 (Theorem 1.10): Proves uniform Bogomolov for the Abel–Jacobi images of bielliptic genus-two curves from the uniform bound on joint small points of two Lattès maps, writing the height for the pulled-back divisor as half the sum of the Lattès heights.

### No uniform bound on torsion orders (DKY Proposition 9.2 of the published version)

`UB.12/unbounded-torsion-order` · theorem

For every N > 0 there are a bielliptic genus-2 curve X over ℚ̄ and a Weierstrass point P ∈ X such that j_P(X) ∩ J(X)_tors contains a point of order ≥ N.

**Hypotheses.** N > 0.

**Construction or proof.**

1. Choose Legendre parameters t₁ ≠ t₂ with a common x-coordinate whose points have order ≥ N on both curves (DY.6, unbounded orders of common torsion images).
2. By the diagonal-lift proposition this pair lies under a point w of j_Q(X) for the bielliptic curve with these quotients; the finite kernel of Φ makes w torsion of order at least the order of its image, so ≥ N.

**Checks.**

- Contrast with uniform Manin–Mumford: the number of torsion points is bounded, their orders are not.
- Kühne makes the same remark for general curves (Theorem 2 and the comment after it).

**Needs.** `HeightsRationalPointsAndObstructionsPartII:UB.12/bielliptic-diagonal-lift`, `ArithmeticDynamics:DY.6/common-torsion-image-orders-unbounded`

**Sources.** dky-published-2020, Proposition 9.2 and proof, §9.5, p. 997; Proposition 8.3, p. 994: Shows that the torsion points on the Abel–Jacobi images can have arbitrarily large order, so only their number is uniformly bounded.

## Supplier contracts

### SchemeAndStackFoundations:SF.5

Intersection numbers c₁(L)^d ∩ [Z] on projective schemes over a field, the projection formula for finite maps, and the refined Bézout inequality Σ deg W ≤ Π deg Z_j over the components W of an intersection of closed subschemes of ℙⁿ (Fulton, Example 8.4.6), as SF.5 states its Bézout interface. Fulton’s positivity of intersection products of nef (globally generated) line bundles with effective cycles, used to bound mixed intersection numbers by Bézout-type degrees. Xie–Yuan’s intersection inequality for non-proper intersections on regular projective schemes over a curve (XY Proposition 2.1): for a flat h : 𝒴 → 𝒜′ and an effective cycle V, the components 𝒵_i of h^{-1}(V) with multiplicities satisfy Σ m_i[𝒵_i] · N ≤ h^*[V] · [𝒴] · N for nef N.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.0/subvariety-degree`, `HeightsRationalPointsAndObstructionsPartII:UB.2/mixed-intersection-upper`, `HeightsRationalPointsAndObstructionsPartII:UB.9/torsion-fibres-height-zero`.

### HeightsRationalPointsAndObstructions:RP.5

Existing layer cited as it stands (TauCetiRoadmap PR #1017 §5.9b): the projective cycle height of a pure-dimensional cycle of ℙⁿ over a number field (arithmetic intersection of Ō(1) with the Fubini–Study metric), its additivity, nonnegativity, arithmetic Bézout and coefficient-height (Chow form) comparison. Existing layer cited as it stands (PR #1017 §§5.2–5.4): scheme-theoretic stabilizers of subvarieties of abelian varieties, the abelian subvariety generated by X − X with its degree bound, and the Ueno locus X° with its closedness. Existing layer cited as it stands (PR #1017 §5.9c, nefDifference_sections): for nef M, N on an integral projective u-fold with N ample, liminf u!·h⁰(D(M − tN))/D^u ≥ M^u − u t M^{u−1}N (Siu’s inequality), used as Siu’s bigness criterion. Existing layer cited as it stands (PR #1017 §§5.9–5.10): the Vojta–Faltings method on subvarieties of abelian varieties (geometric product theorem, projective heights and controlled projections, difference bundles off the Ueno locus, small sections and dimension descent, Vojta’s inequality for curves), whose constants Rémond’s explicit versions track. Existing layer cited as it stands (PR #1017 §§5.13b–c): injective specialization of finitely generated groups and division hulls on a dense set of closed points (Kummer and Hilbert irreducibility), and the spreading of bounded-degree abelian subvarieties over a base. Existing layer cited as it stands (PR #1017 §§5.6–5.7): Manin–Mumford in characteristic zero and for abelian varieties over function fields with trivial trace in positive characteristic.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.0/chow-height`, `HeightsRationalPointsAndObstructionsPartII:UB.1/generic-locus`, `HeightsRationalPointsAndObstructionsPartII:UB.2/height-inequality-total-space`, `HeightsRationalPointsAndObstructionsPartII:UB.5/remond-vojta`, `HeightsRationalPointsAndObstructionsPartII:UB.6/masser-specialization`, `HeightsRationalPointsAndObstructionsPartII:UB.9/good-reduction-case`.

### AlgebraicModuliForArithmeticGeometry:R09.1

Chow varieties Ch(ℙⁿ, r, D) with their Chow-form embedding and degree bounds (node chow-open-and-embedding).

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.0/chow-height`.

### AlgebraicModuliForArithmeticGeometry:R09.2

Hilbert schemes of projective schemes over a base with their universal closed families, and the finiteness of Hilbert polynomials of subvarieties of bounded degree (R09.1), relative to the base 𝔸_g.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-scheme`.

### PELModuli:M5

The fine moduli scheme 𝔸_g of principally polarized abelian varieties of dimension g with level-4 structure over ℚ̄ (Siegel case) and its universal abelian scheme 𝔄_g, with a symmetric relatively ample 𝔏_g whose fibres have c₁ = 2c₁ of the principal polarization (M6 universal-family export). Siegel moduli with symplectic level-ℓ structure, ℓ ≥ 3, as fine moduli schemes over ℚ̄.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-family`, `HeightsRationalPointsAndObstructionsPartII:UB.2/level-hypothesis`.

### PELModuli:M6

The universal family export of the Siegel moduli (universal abelian scheme and Hodge line) used to form relative Hilbert schemes over 𝔸_g.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-family`.

### HeightsRationalPointsAndObstructions:RP.0

Existing layer cited as it stands (PR #1017 §§0.16–0.19, 0.25–0.27): Weil’s height machine on projective varieties over ℚ̄, the Néron–Tate height, duplication by quartic forms, the Silverman–Tate theorem in families |ĥ(P) − h(P)| ≤ c·max{1, h(π(P))} and the family duplication bound. Existing layer cited as it stands (PR #1017 §§0.19–0.21): the Néron–Tate height, its kernel over number fields and the symmetric bilinear form. Existing layer cited as it stands (PR #1017 §§0.31–0.35): heights of subvarieties over polarized function fields, their laws, base and constant field extension, model/local comparison and the good-reduction formula.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.2/graph-construction`, `HeightsRationalPointsAndObstructionsPartII:UB.5/neron-tate-euclidean`, `HeightsRationalPointsAndObstructionsPartII:UB.7/adelic-canonical-comparison`.

### AbelianSchemesAndArithmeticModuli:A2

Symmetric relatively ample line bundles on abelian schemes, projective normality of the fourth power of an ample symmetric bundle, and the isogeny from a polarized to a principally polarized abelian scheme over a dense open of the base.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.1/restricted-hilbert-family`, `HeightsRationalPointsAndObstructionsPartII:UB.2/height-inequality`, `HeightsRationalPointsAndObstructionsPartII:UB.2/level-hypothesis`.

### ArakelovGeometryAndAbelianHeightsPartII:AH.5

Height inequality and equidistribution on non-degenerate subvarieties of a polarized dynamical system over a quasi-projective base (Yuan–Zhang Theorems 6.2.2–6.2.3; node non-degenerate-height-inequality), the definition of non-degeneracy with its Betti-rank interpretation (node non-degenerate) and invariant adelic extensions on abelian schemes (node invariant-extension), with the identification of the archimedean canonical measure with the top power of the Betti form. The adelic Hodge bundle λ̄_S of a family of curves, whose heights are the Faltings heights of the fibres (node adelic-hodge-bundle).

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.3/family-equidistribution`, `HeightsRationalPointsAndObstructionsPartII:UB.11/shifted-height-identity`.

### StableReductionPartII:MC.7/consumer-dgh

The DGH moduli interface: fine level-ℓ curve moduli M_g, its universal curve, Torelli to the fine Siegel moduli with the Cartesian Jacobian square, and the section-free Abel and difference maps (node consumer-dgh).

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.4/abel-jacobi-bounds`.

### tauceti:TauCetiRoadmap/AlgebraicCurves#layer-11-automorphisms-and-the-hurwitz-bound

Existing Tau Ceti layer, cited as it stands: the Hurwitz bound #Aut(C) ≤ 84(g − 1) for curves of genus g ≥ 2 in characteristic 0.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.4/base-point-bound`.

### ArakelovGeometryAndAbelianHeights:R35.5

The comparison between the moduli height of a principally polarized abelian variety (for an ample bundle on a compactification of 𝔸_g) and its stable Faltings height, in both directions up to logarithmic error (GGK (4.11), citing Faltings; nodes modular-height-equals-faltings-height and theta-faltings-comparison).

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.4/principal-height-gap`.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2

Hilbert irreducibility over finitely generated fields of characteristic zero, used to make specialization sets Zariski dense.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.6/masser-specialization`.

### AbelianSchemesAndArithmeticModuli:A6

Relative Hom and the extension of endomorphisms and abelian subvarieties from the generic fibre to an abelian scheme over a dense open of a normal base.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.6/masser-specialization`.

### HeightsRationalPointsAndObstructions:RP.1

Existing layer cited as it stands (PR #1017 §1.7): the Mordell–Weil theorem for abelian varieties over number fields. Existing layer cited as it stands (PR #1017 §§1.9–1.11): Chow’s K/k-trace, Lang–Néron and the function-field kernel of the Néron–Tate height.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.6/dgh-rational-points`, `HeightsRationalPointsAndObstructionsPartII:UB.7/special-subvariety`.

### ArakelovGeometryAndAbelianHeightsPartII:AH.4

Heights of algebraic points and the fundamental inequality e₁ ≥ h_L̄(X) ≥ e₁/(dim X + 1) for nef adelic line bundles with big geometric part over number fields and function fields of one variable (nodes adelic-heights and fundamental-inequality).

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.7/adelic-canonical-comparison`.

### ArakelovGeometryAndAbelianHeightsPartII:AH.6

Moriwaki polarizations and heights over finitely generated fields, their height machine, Néron–Tate heights and Silverman–Tate and specialization theorems (nodes moriwaki-heights, moriwaki-height-machine, moriwaki-neron-tate, moriwaki-silverman-tate).

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.8/moriwaki-height-inequality`.

### SchemeAndStackFoundations:SF.4

Blow-ups of base loci of pencils on normal projective varieties over arbitrary fields and Bertini for the generic member (the all-characteristic pencil construction).

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.9/pencil-polarizations`.

### SchemeAndStackFoundations:SF.0

Ampleness of pullbacks of ample bundles along finite morphisms and generic triviality of line bundles, as used for normalized pencil members.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.9/pencil-polarizations`.

### AbelianSchemesAndArithmeticModuli:A1

Rigidified line bundles on abelian schemes: relative seesaw, theorem of the cube with [m]^*ℒ ≅ ℒ^{(m²+m)/2} ⊗ [−1]^*ℒ^{(m²−m)/2}, and restriction of rigidified bundles to torsion multi-sections (XY Lemma 4.1).

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.9/torsion-multisection-class`.

### NeronModelsAndSemistableAbelianVarieties:R11.1

Néron models over Dedekind bases, the abelian-scheme case, and (R11.3) semistable reduction after a finite extension; (R11.5) good reduction is isogeny invariant.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.9/yamaki-reduction`.

### NeronModelsAndSemistableAbelianVarieties:R11.3

Semistable reduction of abelian varieties over function fields of curves after a finite extension.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.9/yamaki-reduction`.

### ArakelovGeometryAndAbelianHeightsPartII:AH.12

Potential bigness, its criterion, the product-grid bound, potential bigness of theta pullbacks (Yuan Theorem 4.5) and restriction of adelic line bundles across characteristics (nodes potential-bigness, potential-bigness-criterion, product-grid-bound, theta-potential-bigness, cross-characteristic-restriction).

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.10/small-points-bound-families`, `HeightsRationalPointsAndObstructionsPartII:UB.10/abel-power-nondegeneracy`.

### JacobianChallengePartII:JC3

The canonical twice-theta bundle on the relative Jacobian with its symmetry, rigidification and relative ampleness, and the theta divisor of a degree-one class.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.11/twice-theta-height`.

### ArakelovGeometryAndAbelianHeightsPartII:AH.13

Bost’s lower bound for the Faltings height of curves (in the Faltings normalization) and the stable Faltings height over function fields with its positivity for non-isotrivial curves (nodes bost-lower-bound, function-field-faltings-height).

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.11/shifted-height-identity`.

### ArithmeticDynamics:DY.6

Legendre and standard-projection Lattès maps, the uniform bound for common torsion images of pairs of elliptic curves with three common branch values (DeMarco–Krieger–Ye Theorem 1.4, Corollary 8.2), the uniform bound on joint small points (Theorem 8.1) and the unboundedness of orders (Proposition 8.3), and translation by 2-torsion on the x-line. Use the degree-one O(O) elliptic height h_E=1/2 h_Lattès in DKY; the native Tau Ceti elliptic height normalization requires a separate corrected comparison (upstreamNotes).

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.12/bielliptic-diagonal-lift`.

### tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves

Existing Tau Ceti layer, cited as it stands: hyperelliptic curves, their hyperelliptic involution and Weierstrass points.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.12/bielliptic-diagonal-lift`.

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property

Existing Tau Ceti layer, cited as it stands: the Abel–Jacobi map of a curve with a base point and the universal property of the Jacobian.

Used by: `HeightsRationalPointsAndObstructionsPartII:UB.12/bielliptic-diagonal-lift`.

## Open proof and source gaps

These are obligations of later planning passes. Their presence is why the layers are planned, rather than closed.

### Rémond’s Décompte read only through Gao–Ge–Kühne Appendix A

Rémond, Décompte dans une conjecture de Lang (Invent. Math. 142 (2000), Propositions 3.3–3.4, Lemma 3.1, Lemme 6.1) could not be obtained; its statements are taken from GGK Appendix A, which restates them with n = deg_L A/g! − 1. Rémond’s Vojta paper (Ann. SNS Pisa 2000, Théorème 1.1) was read and agrees with GGK Theorem A.1. The proofs (explicit Mumford inequality, isolated fibres, height of X) are Rémond’s quantitative versions of the parent’s Vojta method and need their own lemma-level plan. In particular, UB.5/subvariety-height-removal needs arithmetic interpolation, not a Bézout argument using hypersurfaces containing X. Supply that estimate with its finite nonempty-set and positive-dimension hypotheses.

Needed by: `HeightsRationalPointsAndObstructionsPartII:UB.5/remond-mumford`, `HeightsRationalPointsAndObstructionsPartII:UB.5/isolated-fibre-alternative`, `HeightsRationalPointsAndObstructionsPartII:UB.5/subvariety-height-removal`.

### David–Philippon’s form of Rémond’s bound not read

David–Philippon, Comment. Math. Helv. 77 (2002), Theorem 6.8 and p. 643, is cited as DGH and GGK quote it; the explicit exponent and the lower bound for heights on X° in terms of h₀(A) were not checked at the source.

Needed by: `HeightsRationalPointsAndObstructionsPartII:UB.5/remond-single-bound`, `HeightsRationalPointsAndObstructionsPartII:UB.6/dgh-rational-points`.

### Chow-form heights compared with arithmetic-intersection heights

The comparison between the Weil height of the Chow form and the Bost–Gillet–Soulé height of a cycle (Philippon, Math. Ann. 289 (1991); Bost–Gillet–Soulé, J. Amer. Math. Soc. 7 (1994)) was not read; the papers routed here only fix some height of cycles. The parent’s projective cycle heights (RP.5) plan the coefficient-height comparison it rests on.

Needed by: `HeightsRationalPointsAndObstructionsPartII:UB.0/chow-height`.

### Masser’s 1989 specialization theorem not read

Masser, Trans. Amer. Math. Soc. 311 (1989), Main Theorem and Scholium 1 (Zariski density of specializations injective on a finitely generated group of sections) could not be downloaded and is taken as GGK cite it; Masser 1996 (endomorphism rings) was read. The precise missing step is simultaneous density of subgroup-injective and endomorphism-preserving fibres via a common quantitative exceptional-set bound. Separate Zariski-density assertions cannot be intersected to prove it.

Needed by: `HeightsRationalPointsAndObstructionsPartII:UB.6/masser-specialization`.

### Yamaki’s reduction theorem cited, not planned

Yamaki, J. reine angew. Math. 2018, Theorem 1.5 (statement checked against arXiv 1405.0896v5), reducing the geometric Bogomolov conjecture to the nowhere degenerate trace-free part, rests on Gubler’s tropical equidistribution at places of bad reduction; no roadmap of the atlas plans it. It is an input theorem here.

Needed by: `HeightsRationalPointsAndObstructionsPartII:UB.9/yamaki-reduction`.

### Positive-characteristic step of Yuan §4.4.3 omitted in the source

The initial exceptional locus lies in J, not S. Induct on its horizontal components using theta potential bigness after restriction; after normalization only finitely many vertical characteristics remain. For these use Theorem 4.2(2) over a prime-to-p symplectic-level component over 𝔽_p with the level roots adjoined. Theorem 4.10 cannot be applied directly to a vertical base, which is not flat over ℤ. A proof uniform in all constant-field extensions is still needed; the source omits it on p. 84.

Needed by: `HeightsRationalPointsAndObstructionsPartII:UB.11/characteristic-uniformity`.

### Jacobi model of bielliptic genus-two curves cited

DeMarco–Krieger–Ye cite the model y² = x⁶ − s₁x⁴ + s₂x² − 1 from Shaska–Völklein and Jacobi and McMullen’s Theorem 4.10; neither is planned in the atlas.

Needed by: `HeightsRationalPointsAndObstructionsPartII:UB.12/bielliptic-diagonal-lift`.

### Controlled embedding constants for general polarization types

DGH (8.4), (8.7) bounds c_NT and a chosen addition-polynomial height for its fixed principally polarized universal-family embeddings. GGK §7.1 invokes the extension to arbitrary fixed polarization degree, citing David–Philippon (6.41). That direct source and the corresponding theta-embedding construction have not been checked here. The general bound must be established before substituting h_Fal into the raw Rémond inequalities. Arbitrary projective coordinate changes cannot satisfy a moduli-only bound.

Needed by: `HeightsRationalPointsAndObstructionsPartII:UB.5/embedding-constants-bound`, `HeightsRationalPointsAndObstructionsPartII:UB.5/remond-vojta`, `HeightsRationalPointsAndObstructionsPartII:UB.5/remond-mumford`, `HeightsRationalPointsAndObstructionsPartII:UB.5/large-points-bound`, `HeightsRationalPointsAndObstructionsPartII:UB.5/remond-counting`.

## Coverage

- **UB.0: planned.** Lemma-level split of the refined Bézout bookkeeping (GGK (2.5)–(2.6), Lemma 2.4) once SF.5 states its Bézout interface.
- **UB.1: planned.** Lemma-level nodes for the finiteness of Hilbert polynomials in the relative setting over 𝔸_g and for the reduced-structure conventions of (3.2) and (3.6).
- **UB.2: planned.** Lemma-level nodes for the seven dévissages of DGH Theorem B.1 (one node per dévissage) and for Siu’s criterion as stated in DGH Theorem 2.2.15 citation.
- **UB.3: planned.** Lemma-level split of GGK Proposition 5.2 into its five steps (non-degenerate difference images, non-proportionality, invariant test functions, small-height alternative, noetherian induction).
- **UB.4: planned.** Lemma-level nodes for the induction of GGK Proposition 4.2 (Cases (i) and (ii)) and the constant rescalings of Proposition 4.1.
- **UB.5: planned.** Read Rémond’s Décompte (Invent. Math. 2000) and David–Philippon (Comment. Math. Helv. 2002) directly and confirm the restated constants; split Appendix A Steps 1–4 of GGK into lemma nodes. Close the controlled-embedding input for arbitrary fixed polarization degree and the arithmetic interpolation input; raw constants remain explicit until then.
- **UB.6: planned.** Read Masser (Trans. AMS 1989) and Hindry’s good-model lemma directly and confirm the specialization statements. Verify simultaneous good specialization from a quantitative common exceptional-set argument, not an intersection of dense sets.
- **UB.7: planned.** Confirm the identification of adelic and model canonical heights of subvarieties against Gubler 2007 §3 once the parent’s §§0.31–0.35 and AH.4–AH.5 are accepted.
- **UB.8: planned.** Lemma-level nodes for the Poincaré splitting step of GH Proposition 1.3 and Lemma B.2 (compositum of covers of bounded degree).
- **UB.9: planned.** Plan Gubler’s tropical equidistribution behind Yamaki’s reduction (or record its owner); lemma-level nodes for the dependent-fields induction E18 and the conjugate-stable compositum E17 of the Xie–Yuan extraction.
- **UB.10: planned.** Lemma-level split of Yuan Theorem 4.17 into its five maps and of Theorem 4.19 into its number-field and corrected function-field branches.
- **UB.11: planned.** State the positive-characteristic adaptation of the integral small-points bound for characteristics dividing N′ (omitted in Yuan p. 84) as its own node. Prove the vertical characteristic argument on the Jacobian parameter space using geometric, rather than flat-arithmetic, small-points bounds.
- **UB.12: planned.** Lemma-level node for the Jacobi model of bielliptic genus-two curves (Shaska–Völklein), cited rather than proved by DeMarco–Krieger–Ye.
