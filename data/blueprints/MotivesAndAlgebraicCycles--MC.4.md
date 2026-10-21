# Algebraic cycles, pure and mixed motives — MC.4, Part 2

This is the independently reviewed follow-up to the [base MC.4 reader](MotivesAndAlgebraicCycles.md).
Its 17 targets supply the cycle-theoretic input for duality, the Chow-motive comparison, the
perfect-field blow-up and Gysin statements, and the compact-support motivic measure. The
[packet](../packets/MotivesAndAlgebraicCycles--MC.4.json) and this reader retain **partial** coverage.
The [independent review](../reviews/REV-MotivesAndAlgebraicCycles--MC.4.md) is finished and accepts
the corrected plan with its explicit obligations. Neither that acceptance nor a theorem's statement
claims its proof is closed or its implementation exists.

The base part supplies effective geometric motives, Tate stabilization, projective bundles,
motives with compact support and higher-Chow comparison. MotivicEtaleKTheory:M.5a owns finite
correspondences, transfers and effective motivic complexes. SchemeAndStackFoundations owns
relative intersection infrastructure, blow-ups and deformation. General categorical
Grothendieck groups belong to Tau Ceti's GrothendieckEulerForms direction. In particular,
`TauCeti.TriangulatedK0` and its additive API **already exist at the pinned commit**; this part
imports them. Its tensor ring enhancement is requested from that existing owner as a Part II
extension. Nothing in the upstream roadmap or current library is reconstructed here.

This part concerns MC.4 only. MC.5–MC.7 have separate follow-ups (#10831–#10833). The handed-on
red-team findings concern PS.2's inversion of the Tate period and MC.6's reconstruction boundary,
respectively; they do not identify the variety Lefschetz class with an integration symbol or
make triangulated Tate motives a Tannakian heart. The present part introduces no integral
Tannakian reconstruction. Those distinctions must survive assembly.

## Conventions and proof boundaries

- `k` is a field, `R` is a commutative ring, `Sm/k` consists of smooth separated finite-type schemes,
  and `Sch/k` consists of separated finite-type schemes. Write integer coefficients when omitted.
- `M(X)` denotes the motive of a smooth scheme. For arbitrary finite-type `Y`, use `C_*(Y)`,
  the Suslin complex of its finite-correspondence presheaf. `M^c(X) = C_*z_equi(X,0)`.
- `R(1)` is the Tate object, `A(n) = A tensor R(n)`, and `[j]` denotes the cohomological shift.
  `A_{r,i}(Y,X)` uses cdh hypercohomology in degree `-i`. `r` is a dimension index, not a codimension.
- Homological Chow correspondences have `Hom(X,Y) = CH_dimX(X x Y) tensor R`. MC.1's convention is
  contravariant: transpose projectors and use `M(X)(-m)[-2m]` for its `(X,p,m)` twist.
- The source-based moving/duality route below assumes an infinite field. Resolution of singularities
  is a further hypothesis only where stated. The perfect-field blow-up and Gysin targets retain
  their full intended generality; categorical Gysin normalization is an explicit proof obligation.
- The curve units–divisor–Picard sequence is integral; flat coefficients allow termwise tensoring.
  Arbitrary coefficients use derived coefficient change and the motivic long exact sequence.
- Chow morphisms are not identified with effective relative cycles without the generic
  field-of-definition condition of FV Proposition 2.3.

The [suggested Lean file](../suggested/MotivesAndAlgebraicCycles--MC.4.lean) checks the existing
triangulated Grothendieck-group API. The required motivic categories, relative-cycle families,
cdh theory and Chow motives do not yet have the needed carriers at the pins. Their complete
statements belong below, with no substitute record of axioms or artificial coefficient restriction.
All 17 implementation statuses are `unchecked`.

## Coverage and remaining obligations

This completed independent review checks all 17 targets of the MC.4 follow-up and their relation to the base packet. The layer remains partial: moving-family realization, categorical Gysin normalization, precise supplier extensions and base rewiring remain explicit obligations. The perfect-field Gysin and blow-up targets keep their intended generality; no proof closure is inferred from their statements. Generic triangulated K_0 is already implemented and is imported. MC.5-MC.7 are outside this part.
- Implement the field-of-definition-compatible, effective-family moving construction over infinite fields (R09.1 request, E107); extend the route to finite fields separately (E101).
- Prove categorical Gysin/deformation cycle-class compatibility and alpha(A^c,0) normalization, including the positive valuation sign; these are needed for the perfect-field purity target (E103).
- Discharge the seven precise supplier requests: M.5a cdh/relative cycles; SF.4 resolution and compactification; SF.0 smooth-pair coordinates; R09.1 general-field Chow families; S.4 complex-valued descent; SF.5 general-field intersection compatibility; GrothendieckEulerForms Part II exact-tensor ring descent.
- Apply the seven base-node rewiring proposals in a separately authorized base-packet fix, preserving all recorded gaps until their bridges are proved. The current review does not edit the base packet.

The open gaps are:

**The moving lemma for bounded families, and the duality it gives, over finite fields.** The IAS preprint states the moving maps and projective duality over any field, but the cited FL construction uses rational points in open parameter loci and only supplies infinite or degree-dependent sufficiently large finite fields. This review confirms a missing argument in that preprint, not a false theorem or an error established in the published chapter. Keep the infinite-field targets; a finite-field extension needs a compatible transfer descent on the homology of the cone using two coprime extension degrees, not just the rational-equivalence argument of FL 3.4. Needed by `bounded-family-moving-lemma`, `projective-duality-for-equidimensional-cycles`, `chow-motives-functor`.

**Effective relative-family realization of the positive moving construction.** Implement the precise R09.1 request on the generic field-of-definition locus of FV 2.3. The signed parameter extension of FV 6.1 is insufficient for monoid-valued H^+,H^-; use FL 3.8 positive pushforward and crossed constants and prove they give natural effective relative families. The argument is planned but not discharged by the present suppliers. Needed by `bounded-family-moving-lemma`, `projective-duality-for-equidimensional-cycles`.

**Compatibility and normalization of the categorical Gysin map.** Relate the categorical deformation lift to the Chow specialization/zero-section class to prove the cycle-class clause. For the purity isomorphism it suffices instead to establish alpha(A^c,0) as the canonical quotient isomorphism of MVW Exercise 15.14, p. 124. Verify the +ord_x residue sign on t. Chow specialization alone and a blow-up splitting do not establish these identifications. Needed by `blow-up-formula-over-a-perfect-field`, `gysin-triangle-over-a-perfect-field`.

**Supplier interfaces beyond the statements currently available.** Discharge the explicit S.4 complex-descent, SF.5 general-field Tor/composition and GrothendieckEulerForms Part II tensor-ring requests. Their current cited nodes cover spectra, an algebraically closed field, and an additive triangulated K_0 respectively; none can silently supply the stronger interface. Needed by `naive-bivariant-comparison`, `chow-motives-functor`, `compactly-supported-motivic-measure`.

## Targets

### 1. Transfers, pushforward, flat pullback and products on the sheaves of equidimensional cycles

`MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers` — construction; implementation unchecked.

Let k be a field, X a scheme of finite type over k and r >= 0, and let z_equi(X, r) be the presheaf on Sm/k of MotivesAndAlgebraicCycles:MC.4/equidimensional-cycle-sheaves, whose restriction maps are the base changes cycl(f) of relative cycles. (i) Transfers. For smooth schemes U', U and an elementary finite correspondence W in Cor_k(U', U) (an integral closed W in U' x U, finite and surjective over a component of U'), the transfer W^*: z_equi(X, r)(U) -> z_equi(X, r)(U') sends a cycle Z on U x X, equidimensional of relative dimension r over U, to the pushforward along the finite map W x X -> U' x X of the base change cycl(W -> U)(Z) of Z along the composite W -> U' x U -> U; extended linearly, these maps make z_equi(X, r) a presheaf with transfers whose underlying presheaf is the given one (the transfer along the graph of f: U' -> U is cycl(f)); it is a Nisnevich, indeed etale, sheaf with transfers. For X proper and r = 0 it is the representable sheaf with transfers Z_tr(X), transfers included. (ii) Proper pushforward. For p: X -> Y proper, pushforward of cycles p_*: z_equi(X, r) -> z_equi(Y, r) is a morphism of presheaves with transfers, with (p'p)_* = p'_* p_*. (iii) Flat pullback. For q: W -> X flat and equidimensional of relative dimension n, flat pullback q^*: z_equi(X, r) -> z_equi(W, r + n) is a morphism of presheaves with transfers, with (q q')^* = q'^* q^*. (iv) Base change. For a cartesian square with q flat equidimensional and p proper, q^* p_* = p'_* q'^*. (v) Exterior product. Independent parameter schemes U and V give bilinear maps z_equi(X, r)(U) x z_equi(Y, s)(V) -> z_equi(X x Y, r + s)(U x V), natural for independent finite correspondences alpha and beta through alpha box beta. They induce z_equi(X, r) tensor_tr z_equi(Y, s) -> z_equi(X x Y, r + s) for the Day tensor product of presheaves with transfers. The same-base product is its restriction along the diagonal U -> U x U; it is natural for ordinary morphisms, but is not separately compatible with transfers on the same base. For r = s = 0 the external product induces the compact-support Kuenneth map. (vi) Duality embedding. For U smooth and equidimensional of dimension n, write z_equi(U, X, r) for the presheaf V -> z_equi(X, r)(U x V); regarding a cycle on X x U x V as a cycle over V gives an injective morphism of presheaves with transfers D: z_equi(U, X, r) -> z_equi(X x U, r + n), compatible with p_* and q^* in X.

**Hypotheses and conventions.**

- k is any field; X, Y, W are of finite type over k; U, U', V are smooth over k.
- The initial parameter U is smooth, hence regular. SV Proposition 3.3.15 and Corollary 3.4.5 give universal integrality of its relative cycles: pullback remains integral even along a singular correspondence support W -> U. No characteristic is inverted. This relative-cycle theory is requested from MotivicEtaleKTheory:M.5a.
- For (iii) and (iv), q is flat and every fibre of q has pure dimension n.

**Proof plan.**

1. Presheaf structure: by SV Theorem 3.4.2 and Corollary 3.4.5 a cycle on U x X equidimensional of relative dimension r over the regular scheme U is a relative cycle in SV's sense with universally integral base changes (SV Proposition 3.3.15); SV Theorem 3.3.1 gives cycl(f) for every f: U' -> U and its functoriality (imported from M.5a by request).
2. Transfers: in SV's notation W^*(Z) is the correspondence homomorphism Cor(cycl(pr)(Z), [W]) of SV section 3.7. SV Theorem 3.7.3 shows that it is a relative cycle of relative dimension r over U' and that it commutes with base change in U', so W^* is natural in U'; SV Proposition 3.7.7 and Corollary 3.7.8 (associativity of correspondence homomorphisms) give for W: U' -> U and W': U'' -> U', (W o W')^* = W'^* o W^* for the composition of finite correspondences of M.5a/finite-correspondence, which MVW Definition 1A.11 identifies with the correspondence composition; for the graph of f the correspondence homomorphism is cycl(f) (MVW 1A.11, last paragraph). The sheaf property is the one recorded after MVW Definition 16.1.
3. Proper case: for X proper a closed subvariety of U x X quasi-finite and proper over U is finite (MVW Example 16.2, SV Corollary 3.4.6), so z_equi(X, 0)(U) = Cor_k(U, X); both transfer structures are correspondence homomorphisms, hence equal.
4. Pushforward: SV Proposition 3.6.2 shows that p_* of a relative cycle is relative and commutes with base change, and SV Corollary 3.6.3 gives functoriality; compatibility with transfers is SV Proposition 3.7.6 (FV Proposition 5.8(1)).
5. Flat pullback: SV Lemma 3.6.4 (relative cycles pull back with the dimension shift, compatibly with base change; FV Proposition 2.1); compatibility with transfers by SV Lemma 3.7.2; base change square by SV Proposition 3.6.5.
6. Exterior product: use independent parameter bases U and V and the external product of relative cycles (SV section 3.7, pp. 54-55). SV 3.7.3 and 3.7.7 give (alpha box beta)^*(a box b) = alpha^*a box beta^*b. This is the pairing required by the Day tensor universal property (M.5a/tensor-product-transfers, MVW Definition 8.2 and Lemma 8.3). Restricting to a common base does not give separate transfer linearity: for the point and alpha = d times the identity, transferring a product gives d ab, whereas multiplying both transferred factors gives d^2 ab.
7. Duality embedding: SV Theorem 3.7.3 gives cycl(f)(Z) = cycl(id_U x f)(Z) for f: V' -> V (FV p. 5), so D is a morphism of presheaves; it is a morphism of presheaves with transfers by FV Proposition 5.8(3), and injectivity is clear on cycles.

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycle-sheaves`, `MotivicEtaleKTheory:M.5a/finite-correspondence`, `MotivicEtaleKTheory:M.5a/presheaf-with-transfers`, `MotivicEtaleKTheory:M.5a/tensor-product-transfers`, `MotivicEtaleKTheory:M.5a`, `SchemeAndStackFoundations:SF.5/flat-pullback`, `mathlib:AlgebraicGeometry.AlgebraicCycle.map`.

**Sources.**

- [SV.RelCycles](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s2.pdf), Theorem 3.3.1 (preprint p. 23), Proposition 3.3.15 (p. 32), Theorem 3.4.2 and Corollaries 3.4.5-3.4.6 (p. 34): Base change of relative cycles, its integrality over regular bases, and the description of equidimensional cycles over geometrically unibranch and regular bases as relative cycles.
- [SV.RelCycles](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s2.pdf), Proposition 3.6.2, Corollary 3.6.3, Lemma 3.6.4 and Proposition 3.6.5 (preprint pp. 45-47): Proper pushforward and flat pullback of relative cycles commute with base change, are functorial, and satisfy flat-proper base change.
- [SV.RelCycles](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s2.pdf), Section 3.7: Lemmas 3.7.1-3.7.2, Theorem 3.7.3, Corollary 3.7.5, Propositions 3.7.6-3.7.7, Corollary 3.7.8 and the external product (preprint pp. 49-55): Correspondence homomorphisms of relative cycles, their base change, associativity and compatibility with pushforward, which give the transfers and the external product.
- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Section 2, Proposition 2.1 and the duality embedding D (preprint pp. 4-5); Propositions 5.7 and 5.8 (pp. 25-26): The functoriality of z_equi(X, r) in X, the embedding z_equi(U, X, r) into z_equi(X x U, r + dim U), and the structure of pretheory (transfers) with the maps p_*, q^* and D as morphisms of pretheories.
- [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Section 4.2, paragraph before Definition 4.2.1 (preprint p. 45): States that z_equi(X, r) is a Nisnevich sheaf with a canonical structure of presheaf with transfers, covariant for proper and contravariant for flat equidimensional maps, and equal to L^c(X) for r = 0.
- [MVW.2006](https://www.claymath.org/library/monographs/cmim02.pdf), Lecture 16, Definition 16.1 and Exercise 16.3; Appendix 1A, Definition 1A.11: The source the base node used, which leaves the transfers as an exercise; the construction here supplies them from Suslin-Voevodsky.

**Planning API.**

- `zEqui.transfer` (structure): For W in Cor_k(U', U), the transfer W^*: z_equi(X, r)(U) -> z_equi(X, r)(U'), the pushforward of the base change of a cycle along W.
- `zEqui.transfer_graph` (simp): The transfer along the graph of f: U' -> U is the base change cycl(f).
- `zEqui.transfer_comp` (functoriality): For W: U' -> U and W': U'' -> U', (W o W')^* = W'^* o W^*; the identity correspondence acts as the identity.
- `zEqui.toPST` (structure): z_equi(X, r) as a Nisnevich sheaf with transfers on Sm/k.
- `zEqui.ofTr_eq_of_proper` (compatibility): For X proper, z_equi(X, 0) = Z_tr(X) as presheaves with transfers.
- `zEqui.pushforward` (functoriality): For p: X -> Y proper, p_*: z_equi(X, r) -> z_equi(Y, r) is a morphism of presheaves with transfers, with map_id and map_comp.
- `zEqui.flatPullback` (functoriality): For q: W -> X flat of relative dimension n, q^*: z_equi(X, r) -> z_equi(W, r + n) is a morphism of presheaves with transfers, with map_id and map_comp.
- `zEqui.pushforward_flatPullback` (compatibility): Flat-proper base change: q^* p_* = p'_* q'^* for a cartesian square with q flat equidimensional and p proper.
- `zEqui.extProduct` (structure): The independent-base pairing on U,V, natural for alpha box beta, induces z_equi(X,r) tensor_tr z_equi(Y,s) -> z_equi(X x Y,r+s). It is associative, symmetric under swapping both sets of factors, and unital with the point class. Diagonal restriction is natural for morphisms, not separately for same-base transfers.
- `zEqui.dualityEmbedding` (other): For U smooth of pure dimension n, the injective morphism of presheaves with transfers D: z_equi(U, X, r) -> z_equi(X x U, r + n), natural for proper pushforward and flat pullback in X.

**Uses that determine the API.**

- `MotivesAndAlgebraicCycles:MC.4/motives-with-compact-support`: M^c(X) = C_*z_equi(X, 0) needs z_equi(X, 0) as a sheaf with transfers and its proper and etale functoriality
- `MotivesAndAlgebraicCycles:MC.4/compact-support-kunneth`: the exterior product (v) for r = s = 0 is the natural map M^c(X) tensor M^c(Y) -> M^c(X x Y) the base node lacked
- `MotivesAndAlgebraicCycles:MC.4/bivariant-cycle-cohomology`: the bivariant groups are cdh hypercohomology of the Suslin complexes of z_equi(X, r), functorial in X through (ii) and (iii)
- `MotivesAndAlgebraicCycles:MC.4/projective-duality-for-equidimensional-cycles`: the duality embedding (vi) is the map shown to be a quasi-isomorphism
- `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycle-localisation`: the cokernels of restriction to open subschemes are presheaves with transfers, so the cdh vanishing theorem applies to them
- `Friedlander-Voevodsky, Theorem 6.1`: the moving maps on projective space are extended from an open subset of A^1 to A^1 by a transfer along a finite correspondence

**Unit tests.**

- `zEqui_transfer_point` (computation): For a finite separable extension L/k, X = Spec k, r = 0 and W = Spec L viewed as a finite correspondence from Spec k to Spec L, the transfer z_equi(Spec k, 0)(Spec L) = Z -> z_equi(Spec k, 0)(Spec k) = Z is multiplication by [L : k].
- `zEqui_transfer_id` (degenerate): The transfer along the diagonal of U is the identity of z_equi(X, r)(U).
- `zEqui_pushforward_degree` (compatibility): For X proper over k, pushforward along X -> Spec k on z_equi(X, 0)(Spec k), the group of zero-cycles of X, is the degree of zero-cycles (SchemeAndStackFoundations:SF.5/degree).
- `zEqui_pushforward_needs_proper` (non-example): For the non-proper projection A^1_t -> Spec k, pushing forward the hyperbola st = 1 in z_equi(A^1_t, 0)(A^1_s) gives the cycle G_m x Spec k on A^1_s, which is not closed in A^1_s; so an unrestricted pushforward of these presheaves cannot be defined for arbitrary non-proper maps.
- `zEqui_extProduct_points` (computation): The exterior product of the classes of closed points x of X and y of Y with k(x) = k(y) = k is the class of the point (x, y) of X x Y.
- `zEqui_external_transfer_degree` (non-example): For X = Y = U = V = Spec k, alpha = d id and beta = id, independent-base transfer sends a box b to d ab. With d = 2 and a = b = 1 this is 2; multiplying two same-base transferred factors gives 4 and must not be the external-product naturality law.

**Acceptance checks.**

- For X = Spec k and r = 0 the presheaf with transfers z_equi(Spec k, 0) is the constant sheaf Z, and the transfer along an elementary correspondence W from U' to U is multiplication by the degree of W over U'.
- For X proper and r = 0 the construction returns Z_tr(X) with its transfers, so M^c(X) = M(X) as objects of DM^eff,-_Nis, as MC.4/motives-with-compact-support records.
- Pushforward is defined only along proper maps: the hyperbola st = 1 in A^1_s x A^1_t, a section of z_equi(A^1_t, 0) over A^1_s, has image G_m x {point} under the projection to A^1_s x Spec k, which is not closed.

**Independent check.** Corrected universal-integrality hypotheses and independent-base tensor pairing; added a degree-two transfer test.

### 2. Bivariant cycle cohomology

`MotivesAndAlgebraicCycles:MC.4/bivariant-cycle-cohomology` — definition; implementation unchecked.

Let k be a field, X and Y schemes of finite type over k and r >= 0. Let pi: (Sch/k)_cdh -> (Sm/k)_Zar be the morphism of sites and C_*(z_equi(X, r)) the Suslin complex of MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers. The bivariant cycle cohomology of Y with coefficients in r-cycles on X is A_{r,i}(Y, X) = H^{-i}_cdh(Y, pi^* C_*(z_equi(X, r))), the cdh hypercohomology on Sch/k, for i in Z; write A_{r,i}(X) = A_{r,i}(Spec k, X), which equals h_i(z_equi(X, r))(Spec k), the i-th homology of the complex n -> z_equi(X, r)(Delta^n). The groups are contravariant in Y for every morphism, covariant in X for proper maps and contravariant in X for flat equidimensional maps of relative dimension n, with r -> r + n. There is a natural map h_i(z_equi(X, r))(U) -> A_{r,i}(U, X) for U smooth. Zariski open covers of Y give Mayer-Vietoris sequences and abstract blow-ups of Y give long exact blow-up sequences in the first variable. If k admits resolution of singularities, A_{r,i}(Y, X) = Hom_{DM^eff,-_Nis(k)}(C_*(Y)[i], C_*(z_equi(X, r))), where C_*(Y) is the Suslin complex of Z_tr(Y), the motive M(Y) when Y is smooth.

**Hypotheses and conventions.**

- k is a field; the definition needs nothing more. The comparison with Hom groups in DM^eff,- and every property beyond functoriality, Mayer-Vietoris and the blow-up sequence in Y need k to admit resolution of singularities in the sense of Friedlander-Voevodsky, Definition 3.4, which forces k to be perfect.
- The cdh topology on Sch/k (generated by Nisnevich covers and abstract blow-ups) and the comparison of morphisms out of C_*(Y) with cdh hypercohomology (Voevodsky, Triangulated categories of motives, Theorem 4.1.10) are requested from MotivicEtaleKTheory:M.5a.

**Proof plan.**

1. Define C_*(z_equi(X, r)) as a complex of presheaves with transfers (M.5a/suslin-complex-and-motivic-complexes applied to MC.4/equidimensional-cycles-transfers), pull it back along pi and take cdh hypercohomology (FV Definition 4.3).
2. Functoriality in Y is that of hypercohomology; in X it comes from (ii) and (iii) of MC.4/equidimensional-cycles-transfers.
3. Mayer-Vietoris and the blow-up sequence in Y: Zariski covers and abstract blow-ups are cdh covers (FV Propositions 4.4 and 4.5).
4. For Y = Spec k, cdh hypercohomology of the point is the value of the complex, so A_{r,i}(X) = h_i(z_equi(X, r))(Spec k) (FV, after Definition 4.3).
5. Under resolution of singularities, Hom(C_*(Y)[i], C_*(F)) = H^{-i}_cdh(Y, pi^* C_*(F)) for every presheaf with transfers F (Voevodsky, Triangulated categories of motives, Theorem 4.1.10, requested from M.5a), giving the Hom description (Definition 4.2.1 there).

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers`, `MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes`, `MotivicEtaleKTheory:M.5a/effective-motives`, `MotivicEtaleKTheory:M.5a`.

**Sources.**

- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Definition 4.3 and the paragraph after it, Propositions 4.4 and 4.5 (preprint pp. 18-19): The definition of A_{r,i}(Y, X) as cdh hypercohomology, its functoriality, A_{r,i}(X) = h_i(z_equi(X, r))(Spec k), and the Mayer-Vietoris and blow-up sequences in the first variable.
- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Theorem 4.2(1)-(2) (preprint p. 16): h_0(z_equi(X, r))(Spec k) is the Chow group of r-cycles, and for affine equidimensional X the groups h_i are Bloch's higher Chow groups (Suslin).
- [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Definition 4.2.1 with Theorem 4.1.10 (preprint pp. 44-46): The same groups as Hom groups in DM^eff,- out of the Suslin complex of Y, under resolution of singularities.

**Planning API.**

- `bivariant` (data): The group A_{r,i}(Y, X) for X, Y of finite type, r >= 0 and i in Z.
- `bivariant.mapLeft` (functoriality): Contravariance in Y: f: Y' -> Y induces f^*: A_{r,i}(Y, X) -> A_{r,i}(Y', X), with map_id and map_comp.
- `bivariant.pushforward` (functoriality): Covariance in X for proper maps p: X -> X', with map_id and map_comp.
- `bivariant.flatPullback` (functoriality): For q: W -> X flat equidimensional of relative dimension n, q^*: A_{r,i}(Y, X) -> A_{r+n,i}(Y, W).
- `bivariant.ofNaive` (data): The natural map h_i(z_equi(X, r))(U) -> A_{r,i}(U, X) for U smooth.
- `bivariant.point` (simp): A_{r,i}(Spec k, X) = h_i(z_equi(X, r))(Spec k).
- `bivariant.mayerVietoris` (relation): For Y = U_1 union U_2 Zariski open, the long exact sequence ... -> A_{r,i}(Y, X) -> A_{r,i}(U_1, X) + A_{r,i}(U_2, X) -> A_{r,i}(U_1 cap U_2, X) -> A_{r,i-1}(Y, X) -> ...
- `bivariant.blowUp` (relation): For an abstract blow-up p: Y' -> Y with centre Z, the long exact sequence ... -> A_{r,i}(Y, X) -> A_{r,i}(Y', X) + A_{r,i}(Z, X) -> A_{r,i}(p^{-1}Z, X) -> A_{r,i-1}(Y, X) -> ...
- `bivariant.homEquiv` (characterisation): Under resolution of singularities, A_{r,i}(Y, X) = Hom_{DM^eff,-}(C_*(Y)[i], C_*(z_equi(X, r))).

**Uses that determine the API.**

- `Friedlander-Voevodsky, Theorems 8.1-8.3`: the duality, homotopy invariance, suspension and Gysin theorems are statements about these groups
- `MotivesAndAlgebraicCycles:MC.4/hom-into-motives-with-compact-support`: Hom(M(Y)(r)[2r + i], M^c(X)) is identified with A_{r,i}(Y, X)
- `MotivesAndAlgebraicCycles:MC.4/bivariant-shifting-theorem`: the base node records these groups inside its proof; the definition with its API is this node
- `MotivesAndAlgebraicCycles:MC.4/borel-moore-motivic-homology`: Borel-Moore motivic homology Hom(R(i)[n], M^c(X)) is A_{i,n-2i}(Spec k, X)

**Unit tests.**

- `bivariant_chow` (computation): A_{r,0}(Spec k, X) = CH_r(X); for X = P^1 and r = 0 this is Z, the degree of zero-cycles.
- `bivariant_point_point` (degenerate): A_{0,i}(Spec k, Spec k) is Z for i = 0 and 0 otherwise: z_equi(Spec k, 0) is the constant presheaf Z and its Suslin complex at Spec k has homology Z in degree 0 only.
- `bivariant_affine_higherChow` (compatibility): For X affine equidimensional of dimension d, A_{r,i}(Spec k, X) is CH^{d-r}(X, i), the higher Chow group of MotivicEtaleKTheory:M.4/cycle-complex.
- `bivariant_not_homotopy_invariant_in_X` (non-example): A_{0,0}(Spec k, A^1) = CH_0(A^1) = 0 while A_{0,0}(Spec k, Spec k) = Z: the second variable is not homotopy invariant; it is the dimension shift A_{r,i}(Y, X) = A_{r+1,i}(Y, X x A^1) that holds.

**Acceptance checks.**

- A_{r,0}(Spec k, X) is the Chow group CH_r(X) of r-cycles modulo rational equivalence.
- For X affine and equidimensional of dimension d, A_{r,i}(X) is the higher Chow group CH^{d-r}(X, i).
- The second variable is not homotopy invariant: it shifts r.

**Independent check.** Verified integral cdh grading, variance, point evaluation and naive definition against FV 4.2-4.5 and the M.5a request.

### 3. Localisation, Mayer-Vietoris and blow-up triangles for equidimensional cycles

`MotivesAndAlgebraicCycles:MC.4/equidimensional-cycle-localisation` — theorem; implementation unchecked.

Let k be a field admitting resolution of singularities, X a scheme of finite type over k, Y a closed subscheme with open complement X - Y, X = U_1 union U_2 a Zariski open cover and r >= 0. There are canonical distinguished triangles of complexes of Zariski sheaves on Sm/k: C_*z_equi(Y, r) -> C_*z_equi(X, r) -> C_*z_equi(X - Y, r) -> C_*z_equi(Y, r)[1], C_*z_equi(X, r) -> C_*z_equi(U_1, r) + C_*z_equi(U_2, r) -> C_*z_equi(U_1 cap U_2, r) -> C_*z_equi(X, r)[1], and, for an abstract blow-up p: X' -> X with centre Z (p proper, an isomorphism over X - Z), C_*z_equi(p^{-1}Z, r) -> C_*z_equi(Z, r) + C_*z_equi(X', r) -> C_*z_equi(X, r) -> . Consequently, for every scheme U of finite type, the groups A_{r,*}(U, -) have the corresponding long exact localisation, Mayer-Vietoris and blow-up sequences in the second variable, and A_{r,i}(U x A^1, X) = A_{r,i}(U, X) (homotopy invariance in the first variable). For r = 0 the first triangle is the localisation triangle of motives with compact support, MC.4/compact-support-localisation-triangle.

**Hypotheses and conventions.**

- k admits resolution of singularities (FV Definition 3.4); in particular k is perfect.
- The cdh vanishing theorem: for a presheaf with transfers F on Sm/k with F_cdh = 0, the complex C_*(F)_Zar is acyclic, and Zariski and cdh hypercohomology of C_*(F) agree on smooth schemes (FV Theorem 5.5, MVW Theorem 13.25); requested from MotivicEtaleKTheory:M.5a with the exactness of pi^* (FV Lemma 3.6).
- Platification by blow-up (Raynaud-Gruson) is SchemeAndStackFoundations:SF.4/flattening-by-blowup.

**Proof plan.**

1. The sequences of presheaves 0 -> z_equi(Y, r) -> z_equi(X, r) -> z_equi(X - Y, r) and 0 -> z_equi(X, r) -> z_equi(U_1, r) + z_equi(U_2, r) -> z_equi(U_1 cap U_2, r) are exact; their maps are morphisms of presheaves with transfers (MC.4/equidimensional-cycles-transfers), so the cokernels are presheaves with transfers.
2. The cdh sheafification of each cokernel vanishes: given a cycle Z in z_equi(X - Y, r)(U), take the closure of each component in X x U, flatten it over U by a blow-up U' -> U (SF.4/flattening-by-blowup), make U' smooth by resolution; the proper transform lies in z_equi(X, r)(U') and restricts to cycl(p)(Z) (FV, proof of Theorem 5.11).
3. The cdh vanishing theorem (imported) makes C_* of each cokernel Zariski-acyclic, giving the first two triangles; the blow-up triangle is the same argument for coker(z_equi(Z, r) + z_equi(X', r) -> z_equi(X, r)) (FV Theorem 5.13).
4. Apply pi^*, exact under resolution (FV Lemma 3.6), and cdh hypercohomology to obtain the long exact sequences (FV Corollaries 5.12 and 5.14); homotopy invariance in the first variable is FV Theorem 5.5(3) for F = z_equi(X, r) (FV Proposition 5.9).

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers`, `MotivesAndAlgebraicCycles:MC.4/bivariant-cycle-cohomology`, `MotivicEtaleKTheory:M.5a`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.4/flattening-by-blowup`, `mathlib:CategoryTheory.Pretriangulated.Triangle`.

**Sources.**

- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Theorem 5.5 (preprint p. 23), Proposition 5.9 (p. 26), Theorem 5.11 with its proof and Corollary 5.12 (pp. 27-29), Theorem 5.13 and Corollary 5.14 (p. 29): The cdh vanishing theorem for pretheories, the localisation and Mayer-Vietoris triangles for C_*z_equi(-, r) with their long exact sequences, the abstract blow-up triangle, and homotopy invariance in the first variable.
- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Definition 3.4 and Lemma 3.6 (preprint pp. 10-11): The resolution hypothesis used throughout and the exactness of pi^* from Zariski sheaves on Sm/k to cdh sheaves on Sch/k.

**Acceptance checks.**

- For X = A^1, Y the origin and r = 0 the first triangle is M^c(0) -> M^c(A^1) -> M^c(G_m) -> M^c(0)[1].
- For X = P^1 and r = 1 the localisation sequence at Spec k reads 0 -> A_{1,0}(A^1) -> ... with A_{1,0}(P^1) = CH_1(P^1) = Z restricting isomorphically to CH_1(A^1) = Z.
- Without resolution of singularities the flattening step does not produce smooth U', and the triangles are not claimed.

**Independent check.** Verified localization, Mayer-Vietoris and abstract blow-up triangles under resolution, using the requested cdh vanishing and flattening interfaces.

### 4. The moving lemma for families of cycles of bounded degree

`MotivesAndAlgebraicCycles:MC.4/bounded-family-moving-lemma` — theorem; implementation unchecked.

Let k be an infinite field, X in P^N a smooth projective equidimensional scheme of dimension m over k, and d, e, r, s >= 0 with r + s >= m. There are homomorphisms of abelian monoids H^+_U, H^-_U: z^eff_equi(X, r)(U) -> z^eff_equi(X, r)(U x A^1), defined for all smooth schemes U over k, such that: (1) they are natural in U (H_{U'} cycl(f) = cycl(f x id) H_U for f: U' -> U); (2) for every geometric point xbar of U x {0} and every Z in z^eff_equi(X, r)(U) of degree <= d, cycl(xbar)(H^+(Z)) = cycl(xbar)(H^-(Z)) + cycl(xbar)(Z), and the components of excess dimension of the intersection of either cycl(xbar)(H^{+-}(Z)) with an effective s-cycle W of degree <= e lie in Supp(cycl(xbar)Z) cap Supp(W); (3) for every geometric point xbar of U x (A^1 - {0}) and every such Z and W, the cycles cycl(xbar)(H^{+-}(Z)) meet W properly. Here z^eff_equi(X, r)(U) is the monoid of effective cycles of z_equi(X, r)(U) and the degree is taken in the fibres.

**Hypotheses and conventions.**

- k is infinite. Friedlander and Lawson prove their moving lemma when k is infinite or a finite field that is large enough for the given degrees; Friedlander-Voevodsky state the presheaf form over an arbitrary field (MotivesAndAlgebraicCycles/E101).
- Chow parameters over general infinite fields are requested from AlgebraicModuliForArithmeticGeometry:R09.1. FV Proposition 2.3 (pp. 6-8) sends every effective relative cycle over smooth quasi-projective U to a Chow morphism. The converse requires that the generic cycle have field of definition equal to the residue field of the Chow point; arbitrary morphisms to the Chow monoid need not lift. The requested operations must preserve this admissible locus. R09.1/chow-parameters currently assumes an algebraically closed characteristic-zero field and does not supply this generality.

**Proof plan.**

1. Projective cones (FL section 1, FV Proposition 6.2): for a generic family F of m + 1 forms of a large degree D, the projection p_F: X -> P^m is finite and flat, and R_F(Z) = p_F^* p_{F*}(Z) - Z has excess intersections with every effective s-cycle of degree <= e only inside the ramification locus of p_F (FL Theorem 1.7, Proposition 1.9); R_F is a morphism of presheaves built from flat pullback and proper pushforward (MC.4/equidimensional-cycles-transfers (ii), (iii)).
2. Iterating m + 1 generic projections writes every effective r-cycle as an alternating sum of pullbacks of cycles from P^m and a cycle R_{F_m} ... R_{F_0}(Z) meeting every effective s-cycle of degree <= e properly (FL formula (1.9.1)).
3. Moving in P^m (FL section 2): linear projections from (t - 1)-planes L_j of P^{m+t} give continuous algebraic maps Theta_N on C_r(P^m) x l^o, with l^o open in a line, whose values at t != 0 meet every cycle of degree <= e properly and whose value at 0 is a fixed multiple of the identity (FL Propositions 2.3-2.5, Theorem 2.6); k-rational points avoiding the finitely many bad loci exist because k is infinite.
4. Combine the two coprime-degree projection constructions as in FL Theorem 3.1 (pp. 19-22), obtaining positive monoid maps Psi^+, Psi^- on an open O in P^1 containing 0. Use FL Theorem 3.8 (pp. 25-26) to extend to A^1: choose finite g: O -> A^1 with 0 a simple point of g^{-1}(0). Define H^+ by the positive finite pushforward of Psi^+ plus the constant family obtained by summing Psi^- over the nonzero part of g^{-1}(0); define H^- with signs exchanged. The extra constant families cancel the unwanted zero-fibre contributions, leaving H^+_0 - H^-_0 = Z. They already meet the bounded test cycles properly, since their parameter points are nonzero. Multiplicities and residue degrees in every sum are those of finite pushforward.
5. To obtain effective relative families, realize the Chow constructions on the field-of-definition locus of FV Proposition 2.3 and verify compatibility with relative-cycle base change, first for quasi-projective U and then by Zariski gluing. This realization is an explicit remaining request to R09.1, not an identification of every Chow morphism with a relative cycle. FV Theorem 6.1 instead extends using a signed correspondence m Gamma_u + n Gamma_w (pp. 31-33); that gives an additive-group operation but does not establish preservation of the effective monoid when a coefficient is negative (E107). The positive FL extension supplies the route; its family realization remains open in this plan.

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers`, `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycle-sheaves`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.1/chow-parameters`, `SchemeAndStackFoundations:SF.4/generic-projection`, `SchemeAndStackFoundations:SF.5/flat-pullback`.

**Sources.**

- [FL.Moving](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/14.pdf), Theorem 1.7 (preprint pp. 10-12), Proposition 1.9 (p. 12), Propositions 2.3-2.5 and Theorem 2.6 (pp. 15-19), Theorem 3.1 (pp. 19-22), Theorem 3.8 and its positive-sum proof (pp. 25-26): The projective cone construction, moving in projective space by linear projections, the moving lemma for cycles of bounded degree over an infinite or sufficiently large finite field, and its extension to A^1.
- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Section 6: Theorem 6.1 (preprint p. 30), Proposition 6.2 (p. 33), Theorem 6.3 (p. 34): Presheaf moving targets, restricted here to infinite fields; the signed extension in the proof of 6.1 does not by itself preserve effective cycles. The positive FL 3.8 construction and its relative-family realization are distinguished in the proof plan.
- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Section 2, Chow varieties and Proposition 2.3 (preprint pp. 6-8): Effective relative cycles determine Chow morphisms; the reverse direction is conditional on the generic cycle field of definition. No unconditional parametrization bijection is imported.

**Acceptance checks.**

- For U = Spec k and t = 0 the two moved cycles differ by Z itself; for t != 0 they meet every effective s-cycle of degree <= e properly.
- For X = P^m the projective cone step is not needed and the maps come from FL Theorem 2.6 alone.
- The construction is not a moving lemma for single cycles modulo rational equivalence: it moves all cycles of degree <= d simultaneously and algebraically in families.

**Independent check.** Corrected Chow field-of-definition restriction and signed-positivity claim; planned the positive FL 3.8 route with an explicit family-realization gap.

### 5. Duality for equidimensional cycles on smooth projective schemes

`MotivesAndAlgebraicCycles:MC.4/projective-duality-for-equidimensional-cycles` — theorem; implementation unchecked.

Let k be an infinite field, X and Y smooth projective equidimensional schemes over k and r >= 0. The duality embedding D: z_equi(Y, X, r) -> z_equi(X x Y, r + dim Y) of MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers induces isomorphisms h_i(z_equi(Y, X, r)) -> h_i(z_equi(X x Y, r + dim Y)) of presheaves on Sm/k for all i. In particular, with r = 0, i = 0 and evaluation at Spec k: the group h_0(Y, X) = coker(Cor_k(Y x A^1, X) -> Cor_k(Y, X)), the difference of the restrictions to Y x {0} and Y x {1}, is canonically CH_{dim Y}(Y x X), the class of a finite correspondence going to its cycle class.

**Hypotheses and conventions.**

- k is infinite, through MC.4/bounded-family-moving-lemma; FV state the theorem over an arbitrary field (MotivesAndAlgebraicCycles/E101).
- X and Y are smooth and projective; no resolution of singularities is used.

**Proof plan.**

1. Embed X x Y in P^N and bound the degrees of the fibres X x {y} of the projection to Y. Apply the bounded-family moving lemma to cycles of dimension r + dim Y and test cycles of dimension dim X, so the expected intersection dimension is r. This corrects the X/Y swap in the IAS proof of FV Theorem 7.1 (p. 38; E106).
2. Apply FV Lemma 6.6 with F = z_equi(X x Y, r + dim Y), F_d its cycles of degree <= d and G the image of D: H commutes with base change (property (1)), at t = 0 it is the identity up to the moved difference (property (2b)), and at t = 1 it lands in G because a cycle on X x Y x U equidimensional over U lies in the image of D as soon as each geometric fibre is equidimensional over Y (FV Proposition 6.4, effective cycles; property (3)); property (2a) shows that H preserves G cap F_d.
3. FV Lemma 6.6 then makes C_*(G) -> C_*(F) a quasi-isomorphism of complexes of presheaves; D is injective, so this is the statement on h_i (FV Theorem 7.1).
4. For r = 0, z_equi(X, 0)(Y x V) = Cor_k(Y x V, X) because X is proper (MC.4/equidimensional-cycles-transfers), so h_0(z_equi(Y, X, 0))(Spec k) = h_0(Y, X); and h_0(z_equi(T, s))(Spec k) is CH_s(T) (FV Theorem 4.2(1): a rational equivalence on T is a cycle on T x P^1, restricted to T x A^1 after moving the two fibres to 0 and 1).

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/bounded-family-moving-lemma`, `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers`, `SchemeAndStackFoundations:SF.5/chow-group`, `MotivicEtaleKTheory:M.5a/finite-correspondence`.

**Sources.**

- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Proposition 6.4 (preprint p. 35), Lemma 6.6 (pp. 36-37), Theorem 7.1 and proof (pp. 37-38): Fibrewise criterion for lying in the image of D, the homotopy lemma, and the duality theorem for smooth projective X and Y over a field.
- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Theorem 4.2(1) (preprint p. 16): h_0 of z_equi(X, r) at Spec k is the group of r-cycles modulo rational equivalence.
- [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Proof of Proposition 2.1.4 (preprint pp. 6-7): Uses the case r = 0, i = 0 to identify h_0(X, Y) with the Chow group of dim X-cycles on X x Y.

**Acceptance checks.**

- For Y = Spec k, h_0(Spec k, X) = Z_0(X)/(rational equivalence) = CH_0(X).
- For X = Spec k and Y = P^1, h_0(P^1, Spec k) = Z = CH_1(P^1).
- The isomorphism is of presheaves, so it holds after evaluation at every smooth U, not only at Spec k.

**Independent check.** Corrected the fibre labels and dimensions in projective duality; retained infinite fields and effective-family prerequisites.

### 6. Duality for equidimensional cycles with a smooth quasi-projective parameter

`MotivesAndAlgebraicCycles:MC.4/duality-for-equidimensional-cycles` — theorem; implementation unchecked.

Let k be an infinite field admitting resolution of singularities, U a smooth quasi-projective equidimensional scheme of dimension n, X a scheme of finite type over k and r >= 0. The duality embedding D: z_equi(U, X, r) -> z_equi(X x U, r + n) induces a quasi-isomorphism of complexes of abelian groups C_*(z_equi(U, X, r))(Spec k) -> C_*(z_equi(X x U, r + n))(Spec k), that is, isomorphisms h_i(z_equi(X, r))(U) -> A_{r+n,i}(Spec k, X x U) for all i.

**Hypotheses and conventions.**

- k is an infinite field admitting resolution of singularities in the sense of FV Definition 3.4, for example any field of characteristic zero (FV Proposition 3.5); infinite because the moving lemma is used (MotivesAndAlgebraicCycles/E101).
- A smooth projective compactification U in Ubar and an open embedding of X in a proper scheme Xbar (Nagata) are requested from SchemeAndStackFoundations:SF.4 with resolution of singularities.

**Proof plan.**

1. For q: Ybar -> Xbar proper, let Phi_Ybar be the subpresheaf of z_equi(Ubar x Ybar, n + r) generated by the effective cycles whose proper pushforward to Ubar x Xbar, restricted to U x X, lies in the image of D (FV p. 38).
2. FV Proposition 7.3, case Ybar smooth projective: the moving maps of MC.4/bounded-family-moving-lemma on Ubar x Ybar satisfy the hypotheses of FV Lemma 6.6 for G = Phi_Ybar, by the fibrewise criterion FV Lemma 7.2, so h_i(Phi_Ybar)(Spec k) = h_i(z_equi(Ubar x Ybar, r + n))(Spec k).
3. General Ybar, by induction on dimension: resolve Ybar by Ybar' -> Ybar, an isomorphism off a closed Zbar of smaller dimension; compare the abstract blow-up sequences for Phi and for z_equi; the cokernels are presheaves with transfers whose cdh sheaves vanish, so the cdh vanishing theorem and FV Lemma 3.6 give the comparison (FV, end of proof of Proposition 7.3, as in MC.4/equidimensional-cycle-localisation).
4. FV Theorem 7.4: compare 0 -> ker -> Phi_Xbar -> z_equi(U, X, r) -> coker_1 -> 0 with 0 -> ker(alpha) -> z_equi(Ubar x Xbar) -> z_equi(U x X) -> coker_2 -> 0; the left maps are isomorphisms, Proposition 7.3 handles the middle, and h_i(coker_j)(Spec k) = 0 because coker_j are presheaves with transfers (FV Proposition 5.8(2), (3)) with vanishing cdh sheaves.
5. Identify the target with A_{r+n,i}(Spec k, X x U) (MC.4/bivariant-cycle-cohomology) and the source with h_i(z_equi(X, r))(U), by definition of z_equi(U, X, r).

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/bounded-family-moving-lemma`, `MotivesAndAlgebraicCycles:MC.4/projective-duality-for-equidimensional-cycles`, `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycle-localisation`, `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers`, `MotivesAndAlgebraicCycles:MC.4/bivariant-cycle-cohomology`, `SchemeAndStackFoundations:SF.4`, `MotivicEtaleKTheory:M.5a`.

**Sources.**

- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Section 7: Lemma 7.2 (preprint p. 39), Proposition 7.3 (p. 40), Theorem 7.4 with its proof (pp. 41-42): The duality embedding is a quasi-isomorphism at Spec k for U smooth quasi-projective and X arbitrary of finite type, under resolution of singularities.

**Acceptance checks.**

- For U = Spec k (n = 0) the map is the identity.
- For U and X smooth projective the statement is MC.4/projective-duality-for-equidimensional-cycles evaluated at Spec k.
- The comparison is of complexes evaluated at Spec k, not of presheaves: the cdh vanishing theorem concerns sheafifications.

**Independent check.** Verified the quasi-projective/resolution induction and the fact that the general embedding is tested at Spec k, not claimed a presheaf quasi-isomorphism.

### 7. Naive and cdh bivariant cycle cohomology agree on smooth quasi-projective schemes

`MotivesAndAlgebraicCycles:MC.4/naive-bivariant-comparison` — theorem; implementation unchecked.

Let k be an infinite field admitting resolution of singularities, X a scheme of finite type over k, U a smooth quasi-projective scheme over k and r >= 0. The natural maps h_i(z_equi(X, r))(U) -> A_{r,i}(U, X) of MotivesAndAlgebraicCycles:MC.4/bivariant-cycle-cohomology are isomorphisms for all i in Z. In particular for X proper and r = 0: A_{0,0}(U, X) = h_0(U, X) = coker(Cor_k(U x A^1, X) -> Cor_k(U, X)).

**Hypotheses and conventions.**

- k is an infinite field admitting resolution of singularities in the sense of Friedlander-Voevodsky, Definition 3.4, for example any field of characteristic zero (FV Proposition 3.5); infinite because the duality theorems rest on the moving lemma (MotivesAndAlgebraicCycles/E101).
- The complex-valued Brown-Gersten theorem needed here is MVW Theorem 19.11 (p. 162), for a complex of presheaves with the Zariski Mayer-Vietoris property. S.4/brown-gersten-vanishing is spectra-valued; its complex specialization, or the requisite Eilenberg-Mac Lane comparison, is requested explicitly from SchemeKTheoryOperations:S.4.
- The comparison of Zariski and cdh hypercohomology of C_*(F) on smooth schemes for a presheaf with transfers F (FV Theorem 5.5(1)) is requested from MotivicEtaleKTheory:M.5a.

**Proof plan.**

1. For V smooth of pure dimension n and a Zariski cover V = V_1 union V_2 with V_3 = V_1 cap V_2, the sequence 0 -> C_*z_equi(X, r)(V) -> C_*z_equi(X, r)(V_1) + C_*z_equi(X, r)(V_2) -> C_*z_equi(X, r)(V_3) is, by MC.4/duality-for-equidimensional-cycles, quasi-isomorphic to the value at Spec k of the Mayer-Vietoris triangle of MC.4/equidimensional-cycle-localisation for the cover X x V = (X x V_1) union (X x V_2); so V -> C_*z_equi(X, r)(V) has the Mayer-Vietoris property on quasi-projective smooth schemes ('pseudo-flasque').
2. Apply the requested complex-valued Brown-Gersten theorem (MVW 19.11, p. 162), giving H^{-i}_Zar(U, C_*z_equi(X,r)_Zar) = h_i(z_equi(X,r))(U). The existing spectra-valued S.4/brown-gersten-vanishing is context for this request, not a direct application to a complex.
3. FV Theorem 5.5(1) identifies the left side with H^{-i}_cdh(U, pi^* C_*z_equi(X, r)) = A_{r,i}(U, X) (FV Theorem 8.1).

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/duality-for-equidimensional-cycles`, `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycle-localisation`, `MotivesAndAlgebraicCycles:MC.4/bivariant-cycle-cohomology`, `SchemeKTheoryOperations:S.4/brown-gersten-vanishing`, `MotivicEtaleKTheory:M.5a`, `SchemeKTheoryOperations:S.4`.

**Sources.**

- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Theorem 8.1 with its proof (preprint pp. 42-43): The natural maps from the naive groups to the bivariant groups are isomorphisms for U smooth quasi-projective, by duality, localisation and Brown-Gersten.
- [MVW.2006](https://www.claymath.org/library/monographs/cmim02.pdf), Definition 19.10 and Theorem 19.11 (printed p. 162): The Mayer-Vietoris condition and Zariski descent for complexes, rather than only spectra.

**Acceptance checks.**

- For U = Spec k the statement is the definition A_{r,i}(X) = h_i(z_equi(X, r))(Spec k).
- For U = P^1, X = Spec k, r = 0, i = 0: A_{0,0}(P^1, Spec k) = h_0(z_equi(Spec k, 0))(P^1) = Z.
- The naive groups need not have Mayer-Vietoris in U without the duality theorem; the comparison is what supplies it.

**Independent check.** Corrected spectra/complex mismatch with a precise complex-valued Brown-Gersten request and direct MVW 19.11 locator.

### 8. The duality theorem for bivariant cycle cohomology

`MotivesAndAlgebraicCycles:MC.4/bivariant-duality` — theorem; implementation unchecked.

Let k be an infinite field admitting resolution of singularities, X and Y schemes of finite type over k, U a smooth scheme of pure dimension n over k and r >= 0. There are canonical isomorphisms A_{r,i}(Y x U, X) -> A_{r+n,i}(Y, X x U) for all i, natural in Y, induced by the duality embeddings z_equi(U_j, X, r) -> z_equi(X x U_j, r + n) for a quasi-projective open cover (U_j) of U. For Y = Spec k: A_{r,i}(U, X) = A_{r+n,i}(Spec k, X x U).

**Hypotheses and conventions.**

- k is an infinite field admitting resolution of singularities in the sense of Friedlander-Voevodsky, Definition 3.4, for example any field of characteristic zero (FV Proposition 3.5); infinite because the duality theorems rest on the moving lemma (MotivesAndAlgebraicCycles/E101).
- U smooth of pure dimension n; X and Y arbitrary of finite type.

**Proof plan.**

1. Cover U by quasi-projective opens U_j and form the total complex C_*(z(U_., X, r)) of the Cech bicomplex; there is a canonical map H^{-i}_cdh(Y, C_*(z(U_., X, r))_cdh) -> A_{r,i}(Y x U, X).
2. The duality embeddings (MC.4/equidimensional-cycles-transfers (vi)) with MC.4/duality-for-equidimensional-cycles give a quasi-isomorphism of cdh complexes C_*(z(U_., X, r))_cdh -> C_*(z_equi(X x U, r + n))_cdh.
3. It remains to see that the first map is an isomorphism; the question is cdh-local in Y, so by resolution of singularities Y may be taken smooth and quasi-projective, where it follows from MC.4/naive-bivariant-comparison and MC.4/duality-for-equidimensional-cycles (FV Theorem 8.2).

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/duality-for-equidimensional-cycles`, `MotivesAndAlgebraicCycles:MC.4/naive-bivariant-comparison`, `MotivesAndAlgebraicCycles:MC.4/bivariant-cycle-cohomology`, `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycle-localisation`, `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers`, `SchemeAndStackFoundations:SF.4`.

**Sources.**

- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Theorem 8.2 with its proof (preprint p. 43): The duality isomorphisms A_{r,i}(Y x U, X) -> A_{r+n,i}(Y, X x U) for U smooth of pure dimension n.
- [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Theorem 4.2.2(3) (preprint p. 46): The same duality, for Y smooth equidimensional, as used in the triangulated category of motives.

**Acceptance checks.**

- For n = 0 (U = Spec k) both sides are A_{r,i}(Y, X).
- For X = Spec k, Y = Spec k, U = A^1, r = 0, i = 0: A_{0,0}(A^1, Spec k) = Z and A_{1,0}(Spec k, A^1) = CH_1(A^1) = Z.
- This is the input of motivic duality: with MC.4/hom-into-motives-with-compact-support it becomes Hom(M(X x T)[n], M^c(Y)) = Hom(M(X)(d)[2d + n], M^c(T x Y)) for T smooth of dimension d.

**Independent check.** Verified FV 8.2 dimensions, first/second variables and infinite-field/resolution restrictions.

### 9. Homotopy invariance, suspension, cosuspension and the Gysin sequence for bivariant cycle cohomology

`MotivesAndAlgebraicCycles:MC.4/bivariant-suspension-and-gysin` — theorem; implementation unchecked.

Let k be an infinite field admitting resolution of singularities and X, Y schemes of finite type over k. (1) Homotopy invariance: flat pullback along X x A^1 -> X induces A_{r,i}(Y, X) = A_{r+1,i}(Y, X x A^1). (2) Suspension: with p: X x P^1 -> X and i: X -> X x P^1 a section at a rational point, i_* + p^* induces A_{r+1,i}(Y, X) + A_{r,i}(Y, X) = A_{r+1,i}(Y, X x P^1). (3) Cosuspension: A_{r,i}(Y x P^1, X) = A_{r+1,i}(Y, X) + A_{r,i}(Y, X), where the summand A_{r,i}(Y, X) is the image of pullback along Y x P^1 -> Y and the projection to it is restriction along Y x {point}. (4) Gysin: for a closed immersion Z in U of smooth schemes of pure codimension c, there is a long exact sequence ... -> A_{r+c,i}(Z, X) -> A_{r,i}(U, X) -> A_{r,i}(U - Z, X) -> A_{r+c,i-1}(Z, X) -> ....

**Hypotheses and conventions.**

- k is an infinite field admitting resolution of singularities in the sense of Friedlander-Voevodsky, Definition 3.4, for example any field of characteristic zero (FV Proposition 3.5); infinite because the duality theorems rest on the moving lemma (MotivesAndAlgebraicCycles/E101).
- In (4), Z and U are smooth and every component of Z has codimension c in U.

**Proof plan.**

1. (1): the maps are natural in Y; by the Mayer-Vietoris and blow-up sequences in Y (MC.4/bivariant-cycle-cohomology) and resolution, Y may be taken smooth and quasi-projective; then MC.4/naive-bivariant-comparison, MC.4/duality-for-equidimensional-cycles and homotopy invariance of the presheaves h_i (FV Lemma 4.1) give it (FV Theorem 8.3(1)).
2. (2): the localisation sequence of MC.4/equidimensional-cycle-localisation for X x A^1 in X x P^1, with complement X x {infinity}, together with (1); the section i splits it.
3. (3): MC.4/bivariant-duality moves P^1 from the first variable to the second, and (2) splits the result.
4. (4): MC.4/bivariant-duality writes the three groups as A_{*,i}(Spec k, X x -) for X x Z in X x U, and the localisation sequence of MC.4/equidimensional-cycle-localisation gives the long exact sequence; the dimension of Z gives the index r + c.

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/bivariant-duality`, `MotivesAndAlgebraicCycles:MC.4/naive-bivariant-comparison`, `MotivesAndAlgebraicCycles:MC.4/duality-for-equidimensional-cycles`, `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycle-localisation`, `MotivesAndAlgebraicCycles:MC.4/bivariant-cycle-cohomology`.

**Sources.**

- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Theorem 8.3 (1)-(4) with its proof, and Remark 8.4 (preprint pp. 44-45): Homotopy invariance, suspension, cosuspension and the Gysin sequence, proved from Theorems 8.1, 8.2, 7.4 and the localisation sequence.
- [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Lemma 4.1 (preprint p. 14): The homology presheaves of a singular simplicial complex are homotopy invariant.
- [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Theorem 4.2.2(1)-(2) (preprint p. 46): Cosuspension and homotopy invariance as used for the triangulated category of motives.

**Acceptance checks.**

- For Y = X = Spec k, (1) is A_{0,i}(Spec k) = A_{1,i}(A^1): both are Z for i = 0.
- (3) is the projective bundle theorem for P^1 in the first variable; the summand A_{r+1,i}(Y, X) is the twist by Z(1)[2] in the motivic form.
- In (4) for U = A^1, Z = {0}, X = Spec k, r = 0, i = 0: A_{1,0}(Spec k, Spec k) = 0 -> A_{0,0}(A^1) = Z -> A_{0,0}(G_m) = Z -> A_{1,-1}(Spec k) = 0.

**Independent check.** Verified all four FV 8.3 shifts, homotopy and Gysin indices; corrected-sheaf route retained.

### 10. Morphisms into motives with compact support are bivariant cycle cohomology

`MotivesAndAlgebraicCycles:MC.4/hom-into-motives-with-compact-support` — theorem; implementation unchecked.

Let k be an infinite field admitting resolution of singularities, X and Y schemes of finite type over k, r >= 0 and i in Z. Write C_*(Y) for the Suslin complex of Z_tr(Y), which is M(Y) for Y smooth, and M^c(X) = C_*z_equi(X, 0) (MotivesAndAlgebraicCycles:MC.4/motives-with-compact-support). There are canonical isomorphisms Hom_{DM^eff,-_Nis(k)}(C_*(Y)(r)[2r + i], M^c(X)) = A_{r,i}(Y, X), and globally RHom(Z(r)[2r], M^c(X)) = C_*z_equi(X, r) in DM^eff,-_Nis(k). Consequences: (a) shifting: Hom(A(1)[2], C_*z_equi(X, r)) = Hom(A, C_*z_equi(X, r + 1)) for every A in DM^eff,-_Nis(k), and Hom(A(r)[2r], M^c(X)) = Hom(A, C_*z_equi(X, r)); (b) duality: for T smooth of pure dimension d and every n, Hom(C_*(X x T)[n], M^c(Y)) = Hom(C_*(X)(d)[2d + n], M^c(T x Y)); (c) flat pullback: a flat equidimensional f: X -> Y of relative dimension n induces f^*: M^c(Y)(n)[2n] -> M^c(X); (d) for X smooth, CH^i(X) = Hom(M(X), Z(i)[2i]); (e) for X and Y smooth proper, Hom(M(X), M(Y)) = CH_{dim X}(X x Y) and Hom(M(X), M(Y)[i]) = 0 for i > 0.

**Hypotheses and conventions.**

- k is an infinite field admitting resolution of singularities in the sense of Friedlander-Voevodsky, Definition 3.4, for example any field of characteristic zero (FV Proposition 3.5); infinite because the duality theorems rest on the moving lemma (MotivesAndAlgebraicCycles/E101).
- The comparison Hom(C_*(Y)[i], C_*(F)) = H^{-i}_cdh(Y, pi^* C_*(F)) (Voevodsky, Triangulated categories of motives, Theorem 4.1.10) and the internal Hom RHom(A, -) for A a summand of a motive of a smooth scheme (MVW 14.12) come from MotivicEtaleKTheory:M.5a (the latter is the rhom item of M.5a/effective-motives).

**Proof plan.**

1. r = 0: z_equi(X, 0) is L^c(X), so Hom(C_*(Y)[i], M^c(X)) = A_{0,i}(Y, X) by MC.4/bivariant-cycle-cohomology (homEquiv).
2. Induction on r: Z(1)[2] is the summand of M(P^1) cut out by the projector id - (P^1 -> Spec k -> P^1) (MC.4/motive-of-projective-space), and C_*(Y x P^1) = C_*(Y) tensor M(P^1) (Kuenneth for Suslin complexes of schemes of finite type, MVW 14.2 for Y smooth and the abstract blow-up triangle MC.4/blow-up-triangle-and-formula with resolution in general); so C_*(Y)(r)[2r] is the corresponding summand of C_*(Y x P^1)(r - 1)[2r - 2], and the cosuspension isomorphism of MC.4/bivariant-suspension-and-gysin (3) identifies the summands (Voevodsky, Proposition 4.2.3).
3. Global form: by M.5a's internal Hom, RHom(Z(r)[2r], M^c(X)) is the summand of R p_* p^* C_*z_equi(X, 0) on (P^1)^r cut out by the projector; the morphism C_*z_equi((P^1)^r, X, 0) -> R p_* p^* C_*z_equi(X, 0) is a quasi-isomorphism by MC.4/naive-bivariant-comparison, and pushforward along (P^1)^r x U x X -> U x X maps z_equi((P^1)^r, X, 0) to z_equi(X, r), giving the isomorphism (Voevodsky, Proposition 4.2.8).
4. (a) is the global form with adjunction; it is the theorem MVW cite as Theorem 16.22. (b): Hom(C_*(X x T)[n], M^c(Y)) = A_{0,n}(X x T, Y) = A_{d,n}(X, Y x T) by MC.4/bivariant-duality = Hom(C_*(X)(d)[2d + n], M^c(T x Y)); this is the theorem MVW cite as Theorem 16.24.
5. (c): flat pullback C_*z_equi(Y, 0) -> C_*z_equi(X, n) (MC.4/equidimensional-cycles-transfers (iii)) composed with the global form for r = n is adjoint to M^c(Y)(n)[2n] -> M^c(X) (Voevodsky, Corollary 4.2.4; MVW Corollary 16.23).
6. (d): Z(i)[2i] = M^c(A^i) (MC.4/motives-with-compact-support), so Hom(M(X), Z(i)[2i]) = A_{0,0}(X, A^i) = A_{dim X,0}(Spec k, A^i x X) = CH^i(A^i x X) = CH^i(X) by MC.4/bivariant-duality, MC.4/bivariant-suspension-and-gysin (1) and homotopy invariance (Voevodsky, Corollary 4.2.5); it agrees with MC.4/motivic-cohomology-higher-chow.
7. (e): Hom(M(X), M(Y)[i]) = A_{0,-i}(X, Y) = A_{dim X,-i}(Spec k, Y x X) = h_{-i}(z_equi(Y x X, dim X))(Spec k), zero for i > 0 and CH_{dim X}(X x Y) for i = 0 (Voevodsky, Corollary 4.2.6).

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/bivariant-cycle-cohomology`, `MotivesAndAlgebraicCycles:MC.4/bivariant-duality`, `MotivesAndAlgebraicCycles:MC.4/bivariant-suspension-and-gysin`, `MotivesAndAlgebraicCycles:MC.4/naive-bivariant-comparison`, `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers`, `MotivesAndAlgebraicCycles:MC.4/motives-with-compact-support`, `MotivesAndAlgebraicCycles:MC.4/motive-of-projective-space`, `MotivesAndAlgebraicCycles:MC.4/blow-up-triangle-and-formula`, `MotivicEtaleKTheory:M.5a/effective-motives`, `MotivicEtaleKTheory:M.5a`.

**Sources.**

- [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Proposition 4.2.3 and Corollaries 4.2.4-4.2.7 (preprint pp. 47-48), Proposition 4.2.8 and proof (pp. 48-49): Hom groups into the motive with compact support are bivariant cycle cohomology, with the flat pullback, Chow groups, morphisms between motives of smooth proper schemes, and the global form RHom(Z(r)[2r], C^c_*(X)) = C_*z_equi(X, r).
- [MVW.2006](https://www.claymath.org/library/monographs/cmim02.pdf), Theorems 16.22 and 16.24, Corollary 16.23 (printed pp. 130-131): The shifting and duality theorems that MVW cite without proof; (a), (b) and (c) are these statements, now proved from Friedlander-Voevodsky.

**Acceptance checks.**

- For X = Y = Spec k, r = 0, i = 0: Hom(Z, Z) = A_{0,0}(Spec k, Spec k) = Z.
- (a) for r = 0 and A = Z: Hom(Z(1)[2], M^c(X)) = Hom(Z, C_*z_equi(X, 1)) = CH_1(X) at i = 0; for X = A^1 this is Z, matching M^c(A^1) = Z(1)[2].
- (e) for X = Y = P^1: End(M(P^1)) = CH_1(P^1 x P^1) = Z^2, matching End(Z + Z(1)[2]) = Z + Z.

**Independent check.** Corrected singular-scheme notation to C_*(X) and completed the locator for the internal-Hom proof; verified the signs and positive-Ext direction.

### 11. The functor from Chow motives to geometric motives

`MotivesAndAlgebraicCycles:MC.4/chow-motives-functor` — construction; implementation unchecked.

Let k be an infinite field and R a commutative ring. Let C_k(R) be the category of smooth projective k-schemes with Hom(X, Y) = CH_{dim X}(X x Y) tensor R (dimension of X taken componentwise) and composition of correspondences, and Chow^eff(k, R) its idempotent completion (homological convention, as in Voevodsky's Triangulated categories of motives, section 2.1). There is an R-linear symmetric monoidal functor Phi: Chow^eff(k, R) -> DM^eff_gm(k, R) with Phi(X) = M(X), Phi(class of W) = M(W) for every finite correspondence W in Cor_k(X, Y) (so Phi(graph of f) = M(f)), and Phi(P^1, Delta - P^1 x {x0}) = R(1)[2]. If k moreover admits resolution of singularities, Phi is fully faithful and Hom(Phi(A), Phi(B)[i]) = 0 for i > 0. If k is perfect and R = Q, composing with the transpose of correspondences gives a Q-linear contravariant functor from the Chow motives of MotivesAndAlgebraicCycles:MC.1/chow-motive to DM_gm(k, Q), sending h(X) to M(X), the twisted motive (X, p, m) to the summand of M(X)(-m)[-2m] cut out by the transpose of p, and the Lefschetz motive to Q(1)[2].

**Hypotheses and conventions.**

- k is infinite, for MC.4/projective-duality-for-equidimensional-cycles (MotivesAndAlgebraicCycles/E101).
- Full faithfulness and the vanishing of positive Ext use resolution of singularities through MC.4/hom-into-motives-with-compact-support (e).
- The extension to twisted Chow motives uses the Tate stabilisation of MC.4/tate-stabilised-motives, hence k perfect.

**Proof plan.**

1. For X, Y smooth projective, a finite correspondence W in Cor_k(X, Y) gives M(W): M(X) -> M(Y) (M.5a/effective-motives, M is a functor on Cor_k).
2. M(W) depends only on the class of W in h_0(X, Y) = coker(Cor_k(X x A^1, Y) -> Cor_k(X, Y)): the two restrictions of a correspondence on X x A^1 differ by a map through M(X x A^1) -> M(X), an isomorphism (MC.4/homotopy-invariance-and-mayer-vietoris).
3. h_0(X, Y) = CH_{dim X}(X x Y) by MC.4/projective-duality-for-equidimensional-cycles; define Phi on Hom groups as the inverse of this isomorphism followed by W -> M(W), tensored with R.
4. Composition requires the general-field identification of relative pullback with the Serre/Fulton Tor-intersection formula, then proper pushforward. MVW Examples 1A.13-1A.14 (p. 11; citing SV 3.5.8) explain this identification for regular bases; apply it to the diagonal of the smooth middle scheme in X x Y x Z. Since every Chow class has a finite-correspondence representative by projective duality, the resulting equality on representatives proves composition and identities. SF.5/tor-intersection is stated over an algebraically closed field, so the required general-field compatibility is requested from SF.5 rather than silently weakening the present theorem. This is the missing check in E104.
5. Tensor structure: the exterior product of correspondences maps to the exterior product of cycles (SF.5/exterior-product) and M(X x Y) = M(X) tensor M(Y) (M.5a/effective-motives); the symmetry constraints correspond.
6. Extend to the idempotent completion by Mathlib's karoubiUniversal, DM^eff_gm(k, R) being closed under retracts (MC.4/effective-geometric-motives); the projector Delta - P^1 x {x0} cuts out R(1)[2] of M(P^1) (MC.4/motive-of-projective-space).
7. Full faithfulness under resolution: Hom(M(X), M(Y)) = CH_{dim X}(X x Y) and positive Ext vanish by MC.4/hom-into-motives-with-compact-support (e); the identification sends the class of a finite correspondence W to M(W), because for X smooth quasi-projective and Y proper Hom(M(X), M(Y)) = A_{0,0}(X, Y) = h_0(X, Y) (MC.4/naive-bivariant-comparison), the class of W corresponding to M(W).
8. Comparison with MC.1: MC.1's Hom(h(Y), h(X)) = CH^{dim Y}(Y x X)_Q is CH_{dim X}(X x Y)_Q after transposing, so h -> Phi is a contravariant Q-linear functor; on twists use M(X)(-m)[-2m] in DM_gm(k, Q) (MC.4/tate-stabilised-motives).

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/projective-duality-for-equidimensional-cycles`, `MotivesAndAlgebraicCycles:MC.4/hom-into-motives-with-compact-support`, `MotivesAndAlgebraicCycles:MC.4/naive-bivariant-comparison`, `MotivesAndAlgebraicCycles:MC.4/effective-geometric-motives`, `MotivesAndAlgebraicCycles:MC.4/homotopy-invariance-and-mayer-vietoris`, `MotivesAndAlgebraicCycles:MC.4/motive-of-projective-space`, `MotivesAndAlgebraicCycles:MC.4/tate-stabilised-motives`, `MotivesAndAlgebraicCycles:MC.1/chow-motive`, `MotivesAndAlgebraicCycles:MC.1/lefschetz-motive`, `MotivicEtaleKTheory:M.5a/finite-correspondence`, `MotivicEtaleKTheory:M.5a/effective-motives`, `SchemeAndStackFoundations:SF.5/exterior-product`, `SchemeAndStackFoundations:SF.5/smooth-intersection`, `mathlib:CategoryTheory.Idempotents.karoubiUniversal`, `SchemeAndStackFoundations:SF.5`.

**Sources.**

- [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Section 2.1, the category Chow^eff(k), Proposition 2.1.4 with its proof and Corollary 2.1.5 (preprint pp. 6-7): Constructs the functor from effective Chow motives to geometric motives over a field through h_0(X, Y) and the duality theorem, and deduces that the switch of Z(1) tensor Z(1) is the identity.
- [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Remark after Corollary 2.1.5 (p. 7), Corollary 4.2.6 (p. 48) and the summary in section 2.2 (p. 11): Under resolution of singularities the functor is a full embedding, positive Ext between motives of smooth projective varieties vanish, and the tensor additive subcategory generated by the M(X)(n)[2n] is the category of Chow motives.
- [MVW.2006](https://www.claymath.org/library/monographs/cmim02.pdf), Proposition 20.1 and Remark 20.2 (printed pp. 167-168): The bijections of Hom groups and the functor that MVW assert; this node constructs the functor.
- [MVW.2006](https://www.claymath.org/library/monographs/cmim02.pdf), Examples 1A.13-1A.14 (printed p. 11), with the reference to SV 3.5.8: Over a general field, relative-cycle composition agrees with finite-correspondence composition and regular-base pullback agrees with the alternating Tor formula. This specifies the requested compatibility for the Chow functor.

**Planning API.**

- `chowToDM` (data): The R-linear functor Phi: Chow^eff(k, R) -> DM^eff_gm(k, R).
- `chowToDM_obj` (simp): Phi(X) = M(X) for X smooth projective.
- `chowToDM_map_corr` (compatibility): Phi of the class of a finite correspondence W is M(W).
- `chowToDM_map_graph` (simp): Phi of the graph of f: X -> Y is M(f).
- `chowToDM_monoidal` (instance): Phi is symmetric monoidal: Phi(X x Y) = Phi(X) tensor Phi(Y), compatibly with the symmetries.
- `chowToDM_lefschetz` (example): Phi(P^1, Delta - P^1 x {x0}) = R(1)[2].
- `h0Equiv` (equivalence): h_0(X, Y) = CH_{dim X}(X x Y) for X, Y smooth projective, the class of a correspondence going to its cycle class.
- `chowToDM_fullyFaithful` (characterisation): Under resolution of singularities Phi is fully faithful.
- `chowToDM_ext_eq_zero` (other): Under resolution of singularities Hom(M(X), M(Y)[i]) = 0 for i > 0 and X, Y smooth projective.
- `chowToDM_contravariant` (compatibility): For k perfect and R = Q, the contravariant functor from MC.1 Chow motives to DM_gm(k, Q): h(X) -> M(X), (X, p, m) -> the summand of M(X)(-m)[-2m] cut out by the transpose of p.

**Uses that determine the API.**

- `MotivesAndAlgebraicCycles:MC.4/chow-motives-into-geometric-motives`: the base node records the Hom bijections but no functor (gap E24); this node constructs the functor and identifies its Hom maps with those bijections
- `Voevodsky, Triangulated categories of motives, Corollary 2.1.5`: the switch of Z(1) tensor Z(1) is the identity because it is so for Chow motives
- `MotivicEtaleKTheory:M.5c/rost-motive`: the Rost motive is a direct summand of the Chow motive of a norm variety, transported into DM
- `MotivesAndAlgebraicCycles:MC.4/compactly-supported-motivic-measure`: for X smooth projective the class of M^c(X) = M(X) is the image of the Chow motive of X

**Unit tests.**

- `chowToDM_point` (degenerate): Phi(Spec k) is the unit R and End(Phi(Spec k)) = CH_0(Spec k) tensor R = R.
- `chowToDM_projectiveLine` (computation): Phi(P^1, P^1 x {x0}) = R and Phi(P^1, Delta - P^1 x {x0}) = R(1)[2], so Phi(P^1) = R + R(1)[2].
- `chowToDM_graph` (compatibility): For f: X -> Y a morphism of smooth projective schemes, Phi([Gamma_f]) = M(f).
- `chowToDM_needs_projective` (non-example): With integral coefficients and X = A^1, CH_1(A^1 x A^1) = 0 whereas End(M(A^1)) = End(Z) = Z. The smooth-projective Hom description cannot be extended to all smooth schemes.

**Acceptance checks.**

- Phi(Spec k) = R with End = R.
- Phi sends the decomposition of P^1 into its two projectors to M(P^1) = R + R(1)[2].
- Under resolution, End(M(P^1)) = CH_1(P^1 x P^1) tensor R = R^2; for R = Z this is Z^2.

**Independent check.** Corrected general-field intersection supplier boundary and R^2 example; verified homological covariance and transpose/twist comparison with MC.1.

### 12. The blow-up triangle for a smooth centre over a perfect field

`MotivesAndAlgebraicCycles:MC.4/smooth-blow-up-triangle` — theorem; implementation unchecked.

Let k be a perfect field, R a commutative ring, X a smooth scheme over k, Z a smooth closed subscheme, p: X_Z -> X the blow-up of X along Z and E = p^{-1}(Z) its exceptional divisor, with q: E -> Z and i: E -> X_Z. Then there is a distinguished triangle M(E) -> M(Z) + M(X_Z) -> M(X) -> M(E)[1] in DM^eff,-_Nis(k, R), the first map (M(q), M(i)) and the second M(Z -> X) - M(p). No resolution of singularities is assumed.

**Hypotheses and conventions.**

- k is perfect: the proof uses Voevodsky's theorem that Nisnevich cohomology of a homotopy invariant sheaf with transfers is homotopy invariant (MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves, MVW Theorem 13.8).
- Z is smooth, so E is the projective bundle P(N_{Z/X}) of the normal bundle, Zariski locally trivial over Z (SchemeAndStackFoundations:SF.5/normal-deformation and SF.5/normal-cone, the blow-up itself coming from Tau Ceti's StableReduction Layer 4).

**Proof plan.**

1. First split off any connected component of X contained in Z. On such a component the blow-up and exceptional divisor are empty and the triangle is the identity triangle of M(Z). For the remaining components Z has positive codimension; its exceptional projective bundle has positive rank and the local-surjectivity argument below applies. Treat varying positive codimensions componentwise.
2. Let Phi be the complex R_tr(E) -> R_tr(Z) + R_tr(X_Z) -> R_tr(X); it suffices that Phi is zero in DM^eff,-_Nis(k, R), i.e. that Hom(Phi, F[n]) = 0 for every homotopy invariant Nisnevich sheaf with transfers F and every n, these F[n] detecting A^1-local objects (M.5a/effective-motives, MVW 14.8 and 14.11; Voevodsky, Theorem 3.2.6).
3. Replace the sheaves with transfers by the free Nisnevich sheaves Z_Nis(-) without transfers: for a smooth T, Ext^n(R_tr(T), F) = H^n_Nis(T, F) = Ext^n(Z_Nis(T), F) (M.5a/presheaf-with-transfers; Voevodsky, Proposition 3.1.8).
4. The complex Z_Nis(E) -> Z_Nis(Z) + Z_Nis(X_Z) -> Z_Nis(X) is exact except at its right end: Z_Nis(E) -> Z_Nis(Z) is surjective because E -> Z is Zariski locally trivial, and ker Z_Nis(q) = ker Z_Nis(p) because X_Z x_X X_Z is the union of the diagonal and E x_Z E (CTP Proposition 5.19). So Hom(Phi, F[n]) = Ext^n(coker Z_Nis(p), F).
5. These Ext groups vanish (CTP Proposition 5.21): the question is local on X; Nisnevich excision (CTP Proposition 5.18, SchemeAndStackFoundations:SF.2/elementary-distinguished-square) and etale coordinates for the smooth pair (Z, X) reduce to Z x A^d with centre Z x {0}; there the blow-up is a line bundle over Z x P^{d-1}, so its cohomology with coefficients in F is that of Z x P^{d-1} and the cohomology of Z x A^d is that of Z, by homotopy invariance of Nisnevich cohomology (M.5a/homotopy-invariant-sheaves, used in place of CTP Theorem 5.6, whose proof rests on CTP Proposition 4.23; MotivesAndAlgebraicCycles/E105); the cokernel then has no cohomology by CTP Proposition 5.19 applied to E = Z x P^{d-1}.

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/homotopy-invariance-and-mayer-vietoris`, `MotivesAndAlgebraicCycles:MC.4/vector-bundle-invariance`, `MotivicEtaleKTheory:M.5a/effective-motives`, `MotivicEtaleKTheory:M.5a/presheaf-with-transfers`, `MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves`, `SchemeAndStackFoundations:SF.5/normal-deformation`, `SchemeAndStackFoundations:SF.5/normal-cone`, `SchemeAndStackFoundations:SF.2/elementary-distinguished-square`, `SchemeAndStackFoundations:SF.0`, `mathlib:CategoryTheory.Pretriangulated.Triangle`.

**Sources.**

- [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Proposition 3.5.2 with its proof (preprint p. 35); Theorem 3.2.6 (p. 26) and Proposition 3.1.8 (p. 16): The blow-up triangle for a smooth centre in DM^eff_gm over a perfect field, proved by testing against homotopy invariant sheaves and reducing to free Nisnevich sheaves.
- [V.CTP](https://web.archive.org/web/20160101000000id_/http://www.math.uiuc.edu/K-theory/0368/s3.pdf), Section 5.4: Propositions 5.18, 5.19 and 5.21, Corollary 5.22 (preprint pp. 50-52): Nisnevich excision for an etale map isomorphic over a closed subscheme, the kernel comparison for a smooth blow-up, and the vanishing of Ext from the cokernel of Z_Nis(p) into homotopy invariant sheaves.

**Acceptance checks.**

- If Z is a divisor, p is an isomorphism, E = Z and the triangle is split trivially.
- For a rational point Z of a smooth surface X, E = P^1 and with MC.4/blow-up-formula-over-a-perfect-field the triangle gives M(X_Z) = M(X) + R(1)[2].
- The statement holds over every perfect field, for instance a finite field, where resolution of singularities is not known; this is the difference from MC.4/blow-up-triangle-and-formula.

**Independent check.** Verified the perfect-field excision proof using corrected homotopy-invariant sheaves, and added the codimension-zero component case before using projective-bundle surjectivity.

### 13. The motive of a blow-up with smooth centre, and the Gysin map, over a perfect field

`MotivesAndAlgebraicCycles:MC.4/blow-up-formula-over-a-perfect-field` — theorem; implementation unchecked.

Let k be a perfect field, R a commutative ring, X a smooth scheme over k, Z a smooth closed subscheme of pure codimension c and p: X_Z -> X the blow-up. (1) M(p): M(X_Z) -> M(X) has a canonical splitting and M(X_Z) = M(X) + (sum for n from 1 to c - 1 of M(Z)(n)[2n]) in DM^eff,-_Nis(k, R). (2) There is a canonical Gysin map g_Z: M(X) -> M(Z)(c)[2c], natural for smooth morphisms X' -> X (with Z' = Z x_X X') and with g_{Z x Y} = g_Z tensor M(Y) for Y smooth. (3) The composite of g_Z with M(Z)(c)[2c] -> R(c)[2c], induced by Z -> Spec k, is the class of Z in H^{2c,c}(X, R) = CH^c(X) tensor R.

**Hypotheses and conventions.**

- k perfect; no resolution of singularities (compare MC.4/blow-up-smooth-centre-and-gysin-map, which uses it).
- Z smooth of pure codimension c >= 1 in X; for c = 1 the sum in (1) is empty.

**Proof plan.**

1. Let q: (X x A^1)_{Z x 0} -> X x A^1 be the blow-up along Z x {0} (the deformation to the normal cone, SchemeAndStackFoundations:SF.5/normal-deformation); its exceptional divisor is P(N + O) over Z, containing E = P(N).
2. The triangles of MC.4/smooth-blow-up-triangle for p and for q (Voevodsky's proof cites his Proposition 4.1.3, which needs resolution; Proposition 3.5.2 is the one that applies, MotivesAndAlgebraicCycles/E102) are connected by the maps induced by X = X x {0} -> X x A^1.
3. M(id x {0}) = M(id x {1}) is an isomorphism (MC.4/homotopy-invariance-and-mayer-vietoris), and id x {1} lifts to the blow-up since Z x {0} misses X x {1}; this splits the right column, hence its middle map onto M(X x A^1).
4. P(N) -> P(N + O) is a split monomorphism on motives with canonical splitting (MC.4/projective-bundle-theorem); composing splits M(E) -> M(Z) + M(X_Z) and hence M(X_Z) -> M(X) (exists_iso_binaryBiproduct_of_distTriang); insert M(E) = sum for n < c of M(Z)(n)[2n] (MC.4/projective-bundle-theorem) to obtain (1).
5. Gysin map (Voevodsky p. 37): the difference of the split map M(X) -> M(Z x 0) + M((X x A^1)_{Z x 0}) and the lift of id x {1} maps to zero in M(X x A^1), so lifts to M(P(N + O)); project to the top summand M(Z)(c)[2c] of the projective bundle formula. Naturality for smooth maps and products holds because every step does.
6. Remaining bridge for (3): prove that the categorical Gysin map constructed from the deformation triangles induces the Chow specialization/zero-section class under motivic-cohomology comparison. SF.5/specialization and the Chow projective-bundle formula describe operations on Chow groups; neither identifies them with this categorical lift. Once that compatibility is proved, the top projective-bundle coefficient is 1 and (3) follows. For purity alone it suffices to prove the more specific normalization alpha(A^c,0) is the canonical quotient isomorphism (MVW Exercise 15.14, p. 124). Neither identification is claimed established here (E103).

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/smooth-blow-up-triangle`, `MotivesAndAlgebraicCycles:MC.4/projective-bundle-theorem`, `MotivesAndAlgebraicCycles:MC.4/homotopy-invariance-and-mayer-vietoris`, `MotivesAndAlgebraicCycles:MC.4/motivic-cohomology-higher-chow`, `SchemeAndStackFoundations:SF.5/normal-deformation`, `SchemeAndStackFoundations:SF.5/specialization`, `SchemeAndStackFoundations:SF.5/projective-bundle-formula`, `mathlib:CategoryTheory.Pretriangulated.exists_iso_binaryBiproduct_of_distTriang`.

**Sources.**

- [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Proposition 3.5.3 with its proof (preprint p. 36), the construction of g_Z after it (p. 37), and its naturality conditions, stated in the proof of Proposition 3.5.4 (p. 38): The splitting of the motive of a blow-up with smooth centre over a perfect field, via the deformation diagram, and the Gysin map with its naturality and the cycle-class property.
- [MVW.2006](https://www.claymath.org/library/monographs/cmim02.pdf), Corollary 15.13 (printed p. 123) and Exercise 15.14 (p. 124): Blow-up decomposition via the abstract blow-up triangle under resolution; Exercise 15.14 isolates the Gysin normalization still required in this plan.

**Acceptance checks.**

- For the blow-up of a smooth surface at a rational point (c = 2), M(X_Z) = M(X) + R(1)[2], matching CH^1(X_Z) = CH^1(X) + Z.
- For c = 1, p is an isomorphism and g_Z composed with the structure map is the divisor class [Z] in Pic(X).
- For X = P^c and Z a rational point, (3) says that g_Z composed with M(Z)(c)[2c] = R(c)[2c] is the class of a point, a generator of CH^c(P^c) tensor R = R.

**Independent check.** Kept the perfect-field blow-up target but replaced an unsupported cycle-class identification by an explicit categorical compatibility gap.

### 14. The Gysin triangle over a perfect field and the boundary map at a closed point of a curve

`MotivesAndAlgebraicCycles:MC.4/gysin-triangle-over-a-perfect-field` — theorem; implementation unchecked.

Let k be a perfect field, R a commutative ring, X a smooth scheme over k and Z a smooth closed subscheme of pure codimension c. There is a canonical distinguished triangle M(X - Z) -> M(X) -> M(Z)(c)[2c] -> M(X - Z)[1] in DM^eff,-_Nis(k, R), with first map induced by the open immersion and second map the Gysin map g_Z of MotivesAndAlgebraicCycles:MC.4/blow-up-formula-over-a-perfect-field; it is natural for smooth morphisms X' -> X with Z' = Z x_X X' and compatible with products with smooth Y. For X a smooth curve and x a closed point, k(x) is finite separable over k, Spec k(x) is smooth, and the triangle reads M(X - x) -> M(X) -> M(Spec k(x))(1)[2] -> M(X - x)[1]; applying Hom(-, R(i)[n]) gives the exact localisation sequence ... -> H^{n-2,i-1}(k(x), R) -> H^{n,i}(X, R) -> H^{n,i}(X - x, R) -> H^{n-1,i-1}(k(x), R) -> ..., whose last map is the boundary map at x. For integral coefficients R = Z, the weight-one part is 0 -> O(X)^x -> O(X - x)^x -> Z -> Pic(X) -> Pic(X - x) -> 0, with boundary ord_x and 1 mapping to the divisor class of x. For flat Z-algebras R this sequence may be tensored termwise with R. For arbitrary R retain the derived motivic-cohomology long exact sequence: H^{1,1}(X,R) can contain Tor_1^Z(Pic(X),R) and need not equal O(X)^x tensor R.

**Hypotheses and conventions.**

- k perfect; no resolution of singularities. This replaces the resolution hypothesis of MC.4/gysin-triangle (MotivesAndAlgebraicCycles/E21).
- Etale coordinates for the smooth pair (X, Z): locally on X there is an etale f: X -> A^d with Z = f^{-1}(A^{d-c}) (EGA IV 17.12.2); requested from SchemeAndStackFoundations:SF.0, whose SF.0/etale-coordinates gives the absolute case.
- The boundary sign must be checked against the cone and Gysin normalization: t on (A^1,0) must map to +1. This remains part of the normalization gap, rather than following from a freely chosen sign convention.

**Proof plan.**

1. For codimension zero the smooth closed Z is a union of components, and the triangle is the split decomposition of X. In the remaining proof assume c > 0.
2. Write M(X/(X - Z)) for the cone of M(X - Z) -> M(X), the class of C_*(Z_tr(X)/Z_tr(X - Z)); it suffices to give an isomorphism alpha(X, Z): M(X/(X - Z)) -> M(Z)(c)[2c] through which g_Z factors.
3. Run the deformation diagram of MC.4/blow-up-formula-over-a-perfect-field for the relative objects M(X_Z/(X_Z - E)) and M(X/(X - Z)); as there, M(X_Z/(X_Z - E)) = M(X/(X - Z)) + sum for 1 <= n < c of M(Z)(n)[2n] compatibly with the triangles, and g_Z factors through alpha(X, Z), which is natural for smooth maps and products (Voevodsky pp. 37-38).
4. alpha is compatible with the Mayer-Vietoris triangles of an open cover of X and of the induced cover of Z (MC.4/homotopy-invariance-and-mayer-vietoris), so being an isomorphism is local on X.
5. Locally choose etale coordinates f: X -> A^d with Z = f^{-1}(A^{d-c}); in Y = X x_{A^d} (Z x A^c) the diagonal copy of Z is open and closed in the preimage of Z, and on the open X' = Y - (the other components) Nisnevich excision (CTP Proposition 5.18, M.5a/presheaf-with-transfers) gives isomorphisms M(X'/(X' - Z')) -> M(X/(X - Z)) and M(X'/(X' - Z')) -> M(Z x A^c/(Z x A^c - Z x 0)). By naturality and the product compatibility it suffices that alpha(A^c, 0), equivalently alpha(P^c, pt), is an isomorphism.
6. Normalization still required (E103): the projective-space quotient identifies M(P^c/(P^c - pt)) with R(c)[2c], but identifying alpha(P^c,pt) with multiplication by 1 uses the unresolved cycle-class compatibility of the preceding node. Alternatively prove directly that alpha(A^c,0) agrees with the canonical quotient isomorphism of MVW Exercise 15.14 (p. 124). An arbitrary endomorphism of the Tate object need not be a unit. Purity for the constructed map is therefore a recorded gap, not inferred from the existence of the blow-up splitting alone.
7. Curve case, after normalization: apply Hom(-,R(i)[n]) and cancellation to the distinguished triangle. For R = Z use the weight-one comparison H^{1,1}(X,Z) = O(X)^x and H^{2,1}(X,Z) = Pic(X), and check the residue of t at (A^1,0) is +1. Flat coefficients preserve the integral exact sequence. For arbitrary coefficients use derived coefficient change; the universal-coefficient contribution Tor_1(Pic(X),R) prevents the asserted termwise tensor formula in general.

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/blow-up-formula-over-a-perfect-field`, `MotivesAndAlgebraicCycles:MC.4/smooth-blow-up-triangle`, `MotivesAndAlgebraicCycles:MC.4/projective-space-quotient`, `MotivesAndAlgebraicCycles:MC.4/vector-bundle-invariance`, `MotivesAndAlgebraicCycles:MC.4/motive-of-projective-space`, `MotivesAndAlgebraicCycles:MC.4/homotopy-invariance-and-mayer-vietoris`, `MotivesAndAlgebraicCycles:MC.4/effective-geometric-motives`, `MotivesAndAlgebraicCycles:MC.4/motivic-cohomology-higher-chow`, `MotivicEtaleKTheory:M.5a/presheaf-with-transfers`, `MotivicEtaleKTheory:M.5a/effective-motives`, `MotivicEtaleKTheory:M.5a/cancellation`, `MotivicEtaleKTheory:M.4/weight-zero-and-one`, `SchemeAndStackFoundations:SF.0`, `mathlib:CategoryTheory.Pretriangulated.Triangle`.

**Sources.**

- [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Proposition 3.5.4 with its proof (preprint pp. 37-39): The Gysin triangle for a smooth pair over a perfect field, built from the morphism alpha(X, Z) and proved to be an isomorphism by Mayer-Vietoris, Nisnevich excision and reduction to (P^c, point).
- [V.CTP](https://web.archive.org/web/20160101000000id_/http://www.math.uiuc.edu/K-theory/0368/s3.pdf), Proposition 5.18 (preprint p. 50): Nisnevich excision for an etale map that is an isomorphism over a closed subscheme.
- [MVW.2006](https://www.claymath.org/library/monographs/cmim02.pdf), Exercise 15.14 and Theorem 15.15 (printed p. 124): The normalization exercise and the resulting Gysin triangle under the hypotheses of Lecture 15. The perfect-field proof here retains its separate normalization gap.

**Acceptance checks.**

- For X = P^1 and a rational point x, M(A^1) -> M(P^1) -> R(1)[2] -> recovers M(A^1) = R from M(P^1) = R + R(1)[2].
- For X = A^1 over Q and x = V(t^2 + 1), the third term is M(Spec Q(i))(1)[2], not R(1)[2]; the boundary map O(A^1 - x)^x -> H^{0,0}(Spec Q(i)) = Z sends t^2 + 1 to 1.
- The triangle exists over every perfect field, including finite fields and their algebraic closures, which is what the norm residue arguments of MotivicEtaleKTheory:M.5c need in characteristic different from l.
- Coefficient test: if Pic(X) has nonzero n-torsion and R = Z/n, the universal-coefficient exact sequence for H^{1,1}(X,R) has quotient Tor_1(Pic(X),Z/n) = Pic(X)[n]. A units-only formula for this group fails; the integral divisor sequence remains the acceptance test for ord_x.

**Independent check.** Corrected integral versus arbitrary coefficients, Tor contribution and residue normalization; retained perfect-field target with an honest purity gap.

### 15. Tate motives

`MotivesAndAlgebraicCycles:MC.4/tate-motives` — construction; implementation unchecked.

Let k be a perfect field and R a commutative ring. The category DTM(k, R) of Tate motives is the full subcategory of DM_gm(k, R) (MotivesAndAlgebraicCycles:MC.4/tate-stabilised-motives) on the thick envelope of the objects R(n), n in Z: the smallest triangulated subcategory closed under retracts and isomorphisms containing every R(n). It is a tensor triangulated subcategory stable under all twists, and contains M(Spec k), M(A^n), M(G_m), M(P^n) and every effective geometric motive built from these by cones. Its Hom groups are motivic cohomology of k: Hom(R(p), R(q)[m]) = H^{m,q-p}(Spec k, R) for q >= p, and = 0 for q < p. For R = Q these are rational motivic cohomology groups CH^{q-p}(k, 2(q - p) - m) tensor Q of the field, the input of the mixed Tate t-structure that PeriodsAndSpecialValues:PS.9 constructs.

**Hypotheses and conventions.**

- k perfect, for the Tate stabilisation and cancellation (MotivicEtaleKTheory:M.5a/cancellation).
- No t-structure is installed here: the heart MT(k) of mixed Tate motives, which exists for number fields by Beilinson-Soule vanishing, belongs to PeriodsAndSpecialValues:PS.9/mixed-tate-z, which imports this category.

**Proof plan.**

1. Take the Mathlib triangulated envelope of the object property 'isomorphic to some R(n)' in DM_gm(k, R) and the full subcategory on it, as for MC.4/effective-geometric-motives.
2. Tensor stability: R(a) tensor R(b) = R(a + b), and the class of objects A with A tensor R(b) in DTM is thick and contains the generators, so it is everything; repeat in the other variable.
3. Hom groups for q >= p: by cancellation Hom(R(p), R(q)[m]) = Hom(R, R(q - p)[m]) (MC.4/tate-stabilised-motives, hom_mk), which is H^{m,q-p}(Spec k, R) by representability (M.5a/effective-motives).
4. For q < p reduce to Hom(R(n),R[m]) with n > 0. The object R(n)[n] is the fully reduced summand of M(G_m^n), cut out by the product of complements of the n coordinate unit-section projectors. In every degree the weight-zero cohomology of G_m^n is R in degree 0 and zero otherwise, as for Spec k; each coordinate projector acts as the identity on it. The fully reduced projector therefore acts as zero, so Hom(R(n)[n],R[j]) = 0 for every j. This proves all negative weights at once; reducing n > 1 to n = 1 without an argument would not suffice.
5. Membership: M(A^n) = R, M(G_m) = R + R(1)[1] and M(P^n) = sum of R(i)[2i] (MC.4/motive-of-projective-space).
6. For rational coefficients identify nonnegative-weight motivic cohomology with CH^{q-p}(k,2(q-p)-m) tensor Q by MC.4/motivic-cohomology-higher-chow (MVW Theorem 19.1, p. 159).

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/tate-stabilised-motives`, `MotivesAndAlgebraicCycles:MC.4/effective-geometric-motives`, `MotivesAndAlgebraicCycles:MC.4/motive-of-projective-space`, `MotivicEtaleKTheory:M.5a/cancellation`, `MotivicEtaleKTheory:M.5a/effective-motives`, `MotivicEtaleKTheory:M.4/weight-zero-and-one`, `mathlib:CategoryTheory.ObjectProperty.triangEnvelope`, `mathlib:CategoryTheory.ObjectProperty.triangEnvelope_le_iff`, `MotivesAndAlgebraicCycles:MC.4/motivic-cohomology-higher-chow`.

**Sources.**

- [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Section 2.1, definition of Z(1) and of DM_gm(k) (preprint p. 5); Corollary 3.4.3 (p. 33): The Tate object as the reduced motive of P^1 shifted by -2, the category obtained by inverting it, and Hom(M(X), Z(1)[j]) as Zariski cohomology of G_m, the weight-one input of the Hom computation.
- [MVW.2006](https://www.claymath.org/library/monographs/cmim02.pdf), Lecture 14, Definition 14.1 and the paragraph after Definition 14.2: The geometric and Tate-stabilised categories in which the thick envelope is taken.
- [MVW.2006](https://www.claymath.org/library/monographs/cmim02.pdf), Theorem 19.1 and Vanishing Theorem 19.3 (printed p. 159): Higher-Chow interpretation and the degree range; negative weights are proved separately using reduced powers of G_m.

**Planning API.**

- `DTM` (data): The full subcategory of DM_gm(k, R) on the thick envelope of the R(n), n in Z.
- `DTM.of_tate` (constructor): R(n) is a Tate motive for every integer n.
- `DTM.incl` (projection): The fully faithful triangulated inclusion DTM(k, R) -> DM_gm(k, R).
- `DTM.isTriangulated` (instance): The defining property is triangulated and closed under retracts and isomorphisms.
- `DTM.le_iff` (universal-property): DTM is contained in a thick subcategory Q if and only if every R(n) lies in Q.
- `DTM.tensor` (instance): DTM is closed under the tensor product and under twisting by R(n).
- `DTM.hom_tate` (characterisation): Hom(R(p), R(q)[m]) = H^{m,q-p}(Spec k, R) for q >= p.
- `DTM.hom_tate_neg` (relation): Hom(R(p), R(q)[m]) = 0 for q < p and all m.
- `DTM.motive_projectiveSpace` (example): M(P^n) and M(G_m) are Tate motives.

**Uses that determine the API.**

- `PeriodsAndSpecialValues:PS.9/mixed-tate-z`: the mixed Tate heart MT(Q) is taken inside the Tate-generated triangulated subcategory of MC.4, with Hom groups given by rational motivic cohomology of the field
- `ZagierConjecturePolylogarithms:Z.3/motivic-correlator`: mixed Tate motives over a number field F live in DTM(F, Q); the request MT-1 for the heart over number fields is answered by PS.9 on top of this category
- `MotivesAndAlgebraicCycles:MC.4/compactly-supported-motivic-measure`: the image of the Lefschetz class is the class of the Tate object

**Unit tests.**

- `dtm_hom_weight_one` (computation): Hom_{DTM(k,Q)}(Q, Q(1)[1]) = k^x tensor Q, and Hom(Q, Q(1)[2]) = Pic(Spec k) tensor Q = 0.
- `dtm_hom_unit` (degenerate): Hom(R, R[m]) is R for m = 0 and 0 for m != 0.
- `dtm_projectiveSpace` (characterisation): M(P^2) = R + R(1)[2] + R(2)[4] lies in DTM(k, R).
- `dtm_needs_negative_twists` (non-example): Assume R is nonzero. R(-1) is in DTM(k,R) and outside the thick envelope of R(n), n >= 0: that envelope is left orthogonal to all R(-1)[m] by negative-weight vanishing, while End(R(-1)) = R has nonzero identity. For R = 0 this non-example is inapplicable.

**Acceptance checks.**

- Hom(Q(0), Q(1)[1]) = H^{1,1}(Spec k, Q) = k^x tensor Q.
- Hom(Q(0), Q(0)[m]) is Q for m = 0 and 0 otherwise.
- When R is nonzero, R(-1) belongs to DTM(k,R) but not to the thick subcategory generated by effective Tate objects R(n), n >= 0. The exclusion is not asserted for the zero ring.

**Independent check.** Corrected negative-weight proof for every n>0 and required nonzero R in the non-effectivity test; added direct higher-Chow prerequisite.

### 16. The Grothendieck ring of varieties

`MotivesAndAlgebraicCycles:MC.4/grothendieck-ring-of-varieties` — definition; implementation unchecked.

Let k be a field. K_0(Var_k) is the quotient of the free abelian group on the isomorphism classes [X] of separated schemes of finite type over k by the scissor relations [X] = [Z] + [X - Z] for every closed subscheme Z of X; it is a commutative ring with [X] [Y] = [X x_k Y] and unit [Spec k]. The Lefschetz class is L = [A^1]. Consequences: [X] = [X_red], [empty] = 0, [A^n] = L^n, [P^n] = 1 + L + ... + L^n, [G_m] = L - 1, and an assignment X -> phi(X) in a commutative ring that is constant on isomorphism classes, satisfies the scissor relations, is multiplicative and sends Spec k to 1 factors uniquely through a ring homomorphism K_0(Var_k) -> A.

**Hypotheses and conventions.**

- k a field; schemes are separated of finite type; the scissor relation uses reduced or arbitrary closed subschemes indifferently, since [X] = [X_red] follows from it with Z = X_red.
- Fix a universe and a small model for the essentially small category of separated finite-type k-schemes before forming its set of isomorphism classes. The quotient is independent up to its class-preserving universal isomorphism. No extra relation for arbitrary universal homeomorphisms is imposed.

**Proof plan.**

1. Define the free abelian group on isomorphism classes (Mathlib FreeAbelianGroup on the quotient type of isomorphism classes) and quotient by the subgroup generated by the scissor relations.
2. The product is well defined: for Z in X closed, (X x Y) = (Z x Y) union ((X - Z) x Y) with Z x Y closed, so the relations form an ideal; associativity, commutativity and unit come from those of the fibre product over k.
3. Consequences: X_red closed with empty complement gives [X] = [X_red], and the empty scissor relation gives [empty] = 0. The product decomposition A^n = (A^1)^n gives [A^n] = L^n; the standard stratification P^n = A^n union P^{n-1} gives its geometric sum; G_m = A^1 - {0}. These arguments work over any field and do not use Bittner Theorem 3.1.
4. Universal property: by the universal property of the free abelian group and of the quotient.

**Direct prerequisites.** `mathlib:FreeAbelianGroup`, `mathlib:AlgebraicGeometry.Scheme.Over`.

**Sources.**

- [Bittner.2001](https://arxiv.org/pdf/math/0111062v1), Conventions (p. 2) and section 3, definition before Theorem 3.1 (p. 3): The free abelian scissor quotient and product-induced ring. The source assumes characteristic zero throughout; the elementary quotient and product argument here explicitly works for every field, without importing the characteristic-zero alternative presentation.

**Planning API.**

- `K0Var` (data): The ring K_0(Var_k).
- `K0Var.mk` (constructor): The class [X] of a separated scheme of finite type over k.
- `K0Var.mk_scissor` (relation): [X] = [Z] + [X - Z] for Z closed in X.
- `K0Var.mk_prod` (simp): [X x_k Y] = [X] [Y].
- `K0Var.mk_point` (simp): [Spec k] = 1.
- `K0Var.mk_iso` (extensionality): Isomorphic schemes have the same class.
- `K0Var.lefschetz` (data): L = [A^1].
- `K0Var.mk_affineSpace` (example): [A^n] = L^n.
- `K0Var.mk_projectiveSpace` (example): [P^n] = 1 + L + ... + L^n.
- `K0Var.lift` (universal-property): A scissor-additive, multiplicative, isomorphism-invariant assignment with phi(Spec k) = 1 factors uniquely through a ring homomorphism from K_0(Var_k).

**Uses that determine the API.**

- `MotivesAndAlgebraicCycles:MC.4/compactly-supported-motivic-measure`: the source of the motivic measure X -> [M^c(X)]
- `LogicAndDefinabilityInNumberTheory:LD.3/geometric-realization-interface`: geometric residue classes are realised in a localisation of the Grothendieck ring of motives through K_0(Var_k), which LD.3 keeps distinct from its definable Grothendieck rings

**Unit tests.**

- `k0var_projectiveLine` (computation): [P^1] = 1 + L in K_0(Var_k).
- `k0var_empty` (degenerate): [empty] = 0 and [Spec k] = 1.
- `k0var_multiplicativeGroup` (computation): [G_m] = L - 1 and [G_m x G_m] = L^2 - 2L + 1.
- `k0var_not_disjoint_union_only` (non-example): In the group completion of isomorphism classes under disjoint union alone, [A^1] and [G_m] + [Spec k] are distinct (A^1 is connected and not isomorphic to G_m disjoint union a point); the scissor relation identifies them, and without it the Lefschetz class would not satisfy [P^1] = 1 + L.
- `k0var_nilpotents` (compatibility): For X = Spec(k[epsilon]/(epsilon^2)), the closed reduced point has empty complement, so [X] = 1. This detects failure to impose the closed-subscheme scissor relations.

**Acceptance checks.**

- [P^1] = 1 + L and [G_m] = L - 1.
- [empty] = 0 and [Spec k] = 1.
- The scissor relation is not a consequence of the disjoint-union relation: A^1 is not a disjoint union of G_m and a point.

**Independent check.** Replaced a non-definition citation with the direct Bittner scissor-ring definition, explaining its characteristic-zero convention and the independent all-field construction; corrected affine-space computation and smallness.

### 17. The motivic measure given by motives with compact support

`MotivesAndAlgebraicCycles:MC.4/compactly-supported-motivic-measure` — construction; implementation unchecked.

Let k be an infinite field admitting resolution of singularities. For a commutative coefficient ring R, write K_0(DM_gm(k,R)) for the existing TauCeti.TriangulatedK0 specialized to an essentially small model of DM_gm(k,R). Its group, class map, triangle relations and shift signs are library imports. Equip it with the ring induced by the exact tensor product; the general ring descent is requested as a GrothendieckEulerForms, Part II extension, and [R(1)] is a unit with inverse [R(-1)]. Then X -> [M^c(X)] gives a ring homomorphism chi_c: K_0(Var_k) -> K_0(DM_gm(k,Z)), with chi_c(L) = [Z(1)] = [Z(1)[2]] and chi_c(X) = [M(X)] for X proper. It extends uniquely after inverting L. Derived coefficient extension DM_gm(k,Z) -> DM_gm(k,Q) induces a ring map on K_0, giving chi_c,Q. After localizing its target at 1 - [Q(-i)] for i >= 1, chi_c,Q extends to K_0(Var_k)[L^{-1}, (1 - L^{-i})^{-1} : i >= 1]. For X smooth projective, chi_c(X) is the class of the image of its Chow motive. No identification of K_0(DM_gm(k,Q)) with K_0(DM_gm(k,Z)) tensor Q is asserted.

**Hypotheses and conventions.**

- k is infinite and admits resolution of singularities, for example of characteristic zero: M^c(X) is geometric (MC.4/compact-support-geometric), has the localisation triangle (MC.4/compact-support-localisation-triangle) and the Kuenneth isomorphism (MC.4/compact-support-kunneth), all under resolution.
- The localisations are those of Mathlib's Localization, at the submonoids generated by the listed elements.
- The geometric motive categories must be essentially small in the selected universe, with additive shifts and an exact symmetric tensor product, so the pinned TriangulatedK0 hypotheses hold. Generic ring descent and its behavior under exact tensor functors are requested from GrothendieckEulerForms, Part II; motivic coefficient extension is derived tensor with Q, not scalar extension of an abstract K_0 group.
- Resolution in FV Definition 3.4 already implies that k is perfect (FV p. 10), so the base Tate-stabilized DM_gm construction applies; perfection is not silently deduced from infinitude.

**Proof plan.**

1. Import TauCeti.TriangulatedK0, of, of_distTriang, of_shift and liftEquiv. Do not reconstruct their quotient or universal property. Apply the requested exact-tensor ring extension to DM_gm(k,R); exactness in each tensor variable makes the triangle relations multiplicative, with tensor-unit class as 1.
2. Scissors: the triangle M^c(Z) -> M^c(X) -> M^c(X - Z) -> gives [M^c(X)] = [M^c(Z)] + [M^c(X - Z)]; isomorphic schemes have isomorphic M^c.
3. Products: M^c(X x Y) = M^c(X) tensor M^c(Y) (MC.4/compact-support-kunneth, whose natural map is the exterior product of MC.4/equidimensional-cycles-transfers (v)); M^c(Spec k) = Z.
4. So K0Var.lift (MC.4/grothendieck-ring-of-varieties) gives chi_c. M^c(A^1) = Z(1)[2] (MC.4/motives-with-compact-support), so chi_c(L) = [Z(1)[2]] = [Z(1)], a unit because Z(1) tensor Z(-1) = Z in DM_gm (MC.4/tate-stabilised-motives).
5. L maps to the unit [Z(1)], so IsLocalization.lift gives the first extension. Derived coefficient extension to Q is exact and symmetric monoidal and hence induces a K_0 ring map by the requested functorial ring API. Compose chi_c with this map and then the target localization. Only there are the elements 1 - [Q(-i)] units, by definition of that localization; IsLocalization.lift gives the remaining extension. Rational coefficients in a motivic category do not entail that its K_0 group is a rational vector space.
6. For X proper M^c(X) = M(X); for X smooth projective, M(X) is the image of its Chow motive.

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/grothendieck-ring-of-varieties`, `MotivesAndAlgebraicCycles:MC.4/motives-with-compact-support`, `MotivesAndAlgebraicCycles:MC.4/compact-support-localisation-triangle`, `MotivesAndAlgebraicCycles:MC.4/compact-support-kunneth`, `MotivesAndAlgebraicCycles:MC.4/compact-support-geometric`, `MotivesAndAlgebraicCycles:MC.4/tate-stabilised-motives`, `MotivesAndAlgebraicCycles:MC.4/motive-of-projective-space`, `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers`, `MotivesAndAlgebraicCycles:MC.4/chow-motives-functor`, `mathlib:IsLocalization.lift`, `mathlib:Localization`, `tauceti:TauCeti.TriangulatedK0`, `tauceti:TauCeti.TriangulatedK0.of`, `tauceti:TauCeti.TriangulatedK0.of_distTriang`, `tauceti:TauCeti.TriangulatedK0.of_eq_sub_of_distTriang`, `tauceti:TauCeti.TriangulatedK0.of_shift`, `tauceti:TauCeti.TriangulatedK0.liftEquiv`, `tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-2-split-exact-abelian-and-triangulated-grothendieck-groups`.

**Sources.**

- [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Section 2.2, motives with compact support, items 1-4 (preprint p. 9); Propositions 4.1.5 and 4.1.7, Corollary 4.1.8 (pp. 42-43): M^c(X) = M(X) for proper X, the localisation triangle, the Kuenneth isomorphism and M^c(X x A^1) = M^c(X)(1)[2], the properties that make X -> [M^c(X)] a ring homomorphism from K_0(Var_k).

**Planning API.**

- `MotivicK0` (data): Specialize the existing TauCeti.TriangulatedK0 to the essentially small DM_gm(k,R), using the requested tensor-induced ring structure. No new generic Grothendieck-group datatype is planned.
- `MotivicK0.triangle` (relation): Imported TauCeti.TriangulatedK0.of_distTriang: [B] = [A] + [C] for a distinguished triangle A -> B -> C -> A[1].
- `MotivicK0.shift` (simp): Imported TauCeti.TriangulatedK0.of_shift: [A[n]] = (-1)^n [A], in particular [A[2]] = [A].
- `MotivicK0.tensor` (simp): [A tensor B] = [A] [B] and [Z] = 1.
- `MotivicK0.isUnit_tate` (other): [R(1)] is a unit with inverse [R(-1)].
- `chiC` (data): The ring homomorphism chi_c: K_0(Var_k) -> K_0(DM_gm(k, Z)), [X] -> [M^c(X)].
- `chiC_lefschetz` (simp): chi_c(L) = [Z(1)].
- `chiC_of_proper` (compatibility): chi_c(X) = [M(X)] for X proper; for X smooth projective it is the class of the image of the Chow motive of X.
- `chiC.localized` (universal-property): The unique extension of chi_c,Q, formed by the K_0 map induced by derived rational coefficient extension, into K_0(DM_gm(k,Q))[(1 - [Q(-i)])^{-1} : i >= 1]. The domain inverts L and 1 - L^{-i}; the target localization, not the unlocalized target, supplies these latter units.
- `MotivicK0.changeCoefficients` (functoriality): The exact symmetric monoidal functor - tensor^L Q induces K_0(DM_gm(k,Z)) -> K_0(DM_gm(k,Q)); on class generators it sends [A] to [A tensor^L Q].

**Uses that determine the API.**

- `LogicAndDefinabilityInNumberTheory:LD.3/geometric-realization-interface`: the requested scissor and product realisation into an explicitly named localised rational Grothendieck ring of motives, with L and 1 - L^{-i} invertible
- `MotivesAndAlgebraicCycles:MC.4/tate-motives`: the image of K_0(Var_k) on cellular varieties lies in the subring generated by the classes of Tate motives

**Unit tests.**

- `chiC_projectiveLine` (computation): chi_c(P^1) = 1 + [Z(1)] = 1 + chi_c(L).
- `chiC_point` (degenerate): chi_c(Spec k) = 1 and chi_c(empty) = 0.
- `chiC_multiplicativeGroup` (computation): chi_c(G_m) = [Z(1)] - 1, from M^c(G_m) = Z(1)[2] + Z[1].
- `chiC_not_motive` (non-example): Any putative measure agreeing with X -> [M(X)] on smooth schemes sends L to [M(A^1)] = 1. Therefore it cannot extend across inversion of 1 - L^{-1} into any nonzero target: the denominator would map to 0. This obstruction does not require an unproved inequality [Z(1)] != 1 in the motivic Grothendieck group.
- `chiC_localization_denominators` (compatibility): In the localized rational target, the image of 1 - L^{-i} is 1 - [Q(-i)] and is a unit for every i >= 1. The test does not assert it was a unit before localization, nor that rational coefficient change is tensoring K_0 with Q.

**Acceptance checks.**

- chi_c(P^n) = sum for i from 0 to n of [Z(i)], from M(P^n) = sum of Z(i)[2i].
- chi_c(G_m) = [Z(1)] - 1, from M^c(G_m) = Z(1)[2] + Z[1].
- chi_c(Spec k) = 1 and chi_c(empty) = 0.

**Independent check.** Removed duplicate generic triangulated K_0 planning; imported pinned APIs, requested the ring extension from its owner, and corrected rational coefficient change and denominator units.

## Supplier requests and ownership

These requests state interfaces beyond those currently supplied; a stage reference does not certify that the request is already fulfilled.

**`MotivicEtaleKTheory:M.5a`.** (1) The cdh topology on Sch/k generated by Nisnevich covers and abstract blow-ups (Voevodsky, Triangulated categories of motives, Definition 4.1.9; FV Definition 3.2), with the exactness of pi^* from Zariski sheaves on Sm/k to cdh sheaves on Sch/k under resolution of singularities (FV Lemma 3.6); the cdh vanishing theorem for a presheaf with transfers F: if F_cdh = 0 then C_*(F)_Zar is acyclic, Zariski and cdh hypercohomology of C_*(F) agree on smooth schemes, and cdh hypercohomology of C_*(F) is homotopy invariant (FV Theorem 5.5, MVW Theorem 13.25); and Hom_{DM^eff,-}(C_*(X)[i], C_*(F)) = H^i_cdh(X, pi^* C_*(F)) for X of finite type (Voevodsky, Theorem 4.1.10). (2) Relative cycles: base change cycl(f) of relative cycles along arbitrary morphisms of Noetherian schemes, its functoriality, and its integrality over regular bases, so that cycles equidimensional over a smooth scheme have integral base changes (Suslin-Voevodsky, Theorem 3.3.1, Proposition 3.3.15, Theorem 3.4.2, Corollary 3.4.5; MVW Theorems 1A.6, 1A.8, 1A.10). M.5a's own coverage lists these among its remaining items; MC.4 builds z_equi's transfers, bivariant cycle cohomology and the duality theorems on them. Needed by `equidimensional-cycles-transfers`, `bivariant-cycle-cohomology`, `equidimensional-cycle-localisation`, `duality-for-equidimensional-cycles`, `naive-bivariant-comparison`, `hom-into-motives-with-compact-support`.

**`SchemeAndStackFoundations:SF.4`.** The hypothesis that a field k admits resolution of singularities in Friedlander-Voevodsky's sense (Definition 3.4: every scheme of finite type is the image of a proper surjection from a smooth scheme, and every abstract blow-up of a smooth scheme is dominated by a composite of blow-ups with smooth centres), Hironaka's theorem that fields of characteristic zero admit it (FV Proposition 3.5), smooth projective compactifications of smooth quasi-projective schemes, and Nagata compactification of a scheme of finite type. The base packet's request to SF.4 asks for the same hypothesis; this part uses it in the bivariant theory. Needed by `equidimensional-cycle-localisation`, `duality-for-equidimensional-cycles`, `bivariant-duality`.

**`SchemeAndStackFoundations:SF.0`.** Etale coordinates for a smooth pair: for X smooth over k and Z a smooth closed subscheme of pure codimension c, every point of Z has an open neighbourhood U in X with an etale morphism f: U -> A^d such that Z cap U = f^{-1}(A^{d-c}) for a linear subspace A^{d-c} (EGA IV 17.12.2). SF.0/etale-coordinates gives the case without Z. Needed by `smooth-blow-up-triangle`, `gysin-triangle-over-a-perfect-field`.

**`AlgebraicModuliForArithmeticGeometry:R09.1`.** General-infinite-field Chow parameters and their admissible relative-cycle locus: FV Proposition 2.3 (pp. 6-8) requires equality of the generic cycle field of definition with the residue field of the Chow point for the converse construction. Supply this comparison with smooth quasi-projective parameter schemes, plus Zariski gluing to arbitrary smooth parameters, and show the projection, residual-cycle and positive FL 3.8 finite-pushforward/crossed-constant operations preserve the locus, commute with relative-cycle base change and preserve effective monoids. This extends, rather than reuses unchanged, R09.1/chow-parameters over algebraically closed characteristic-zero fields. Needed by `bounded-family-moving-lemma`.

**`SchemeKTheoryOperations:S.4`.** Complex-valued Brown-Gersten descent: for a complex C of abelian presheaves on the small Zariski site of a finite-dimensional Noetherian scheme, satisfying C(empty) acyclic and binary Zariski Mayer-Vietoris for every open, prove H^j(C(U)) = H^j_Zar(U,C_Zar) naturally in U,j (MVW Definition 19.10 and Theorem 19.11, p. 162). The existing spectra-valued brown-gersten-vanishing is not yet this theorem; provide the complex form or its Eilenberg-Mac Lane comparison. Needed by `naive-bivariant-comparison`.

**`SchemeAndStackFoundations:SF.5`.** Extend the algebraically-closed-field tor-intersection interface to smooth schemes over a general infinite field, or provide the precise relative-cycle pullback/Serre Tor compatibility of MVW Examples 1A.13-1A.14 (p. 11, citing SV 3.5.8). In X x Y x Z, restriction to the regular diagonal of smooth Y followed by proper pushforward must agree with composition of finite correspondences, after passage to Chow groups, and commute with exterior products. This is needed for the R-linear symmetric monoidal Chow functor without narrowing k to an algebraically closed field. Needed by `chow-motives-functor`.

**`tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-2-split-exact-abelian-and-triangulated-grothendieck-groups`.** GrothendieckEulerForms, Part II: tensor ring descent on the already implemented TauCeti.TriangulatedK0 of an essentially small symmetric tensor triangulated category, whose tensor is exact in each variable. Supply [A tensor B] = [A][B], tensor-unit class = 1, and the induced ring homomorphism for an exact symmetric monoidal functor. Reuse the pinned group, shifts, triangle relations and universal property; do not re-plan them. Split/exact monoidal K_0 in the current library is not a substitute for distinguished-triangle relations. Needed by `compactly-supported-motivic-measure`.

## Pinned library boundary

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration below was checked in the actual pinned source, including its surrounding hypotheses.

**`mathlib:AlgebraicGeometry.AlgebraicCycle.map`**, `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`. Weighted pushforward of locally finite algebraic cycles along a quasi-compact morphism, with supplied dimension weights and residue degrees. This is raw cycle infrastructure; proper pushforward functoriality, relative-cycle compatibility and passage to Chow groups still come from SF.5 and the relative-cycle request.

**`mathlib:CategoryTheory.Pretriangulated.Triangle`**, `Mathlib/CategoryTheory/Triangulated/Basic.lean`. Triangles in a category with a shift; the carrier of the distinguished triangles stated here.

**`mathlib:CategoryTheory.Pretriangulated.exists_iso_binaryBiproduct_of_distTriang`**, `Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean`. A distinguished triangle whose third morphism is zero splits: its middle object is the biproduct of the other two.

**`mathlib:CategoryTheory.Idempotents.karoubiUniversal`**, `Mathlib/CategoryTheory/Idempotents/FunctorExtension.lean`. Functors C -> D into an idempotent complete D are equivalent to functors Karoubi C -> D; extends the Chow functor to idempotent completions.

**`mathlib:CategoryTheory.ObjectProperty.triangEnvelope`**, `Mathlib/CategoryTheory/Triangulated/Generators.lean`. The smallest triangulated object property closed under retracts containing a given property; defines the thick envelope of the Tate objects.

**`mathlib:CategoryTheory.ObjectProperty.triangEnvelope_le_iff`**, `Mathlib/CategoryTheory/Triangulated/Generators.lean`. The triangulated envelope is contained in a triangulated property closed under retracts iff the generating property is.

**`mathlib:FreeAbelianGroup`**, `Mathlib/GroupTheory/FreeAbelianGroup.lean`. The free abelian group on a type; used for the new variety-scissor quotient. Generic triangulated K_0 is imported from Tau Ceti rather than rebuilt with this definition.

**`mathlib:AlgebraicGeometry.Scheme.Over`**, `Mathlib/AlgebraicGeometry/Over.lean`. The structure morphism of a scheme over a base; schemes over Spec k.

**`mathlib:IsLocalization.lift`**, `Mathlib/RingTheory/Localization/Defs.lean`. The ring homomorphism out of a localisation induced by a ring homomorphism sending the submonoid to units.

**`mathlib:Localization`**, `Mathlib/GroupTheory/MonoidLocalization/Basic.lean`. The commutative-monoid localisation carrier, an Ore localisation. The commutative-ring structure and its universal property are consumed through Mathlib ring-localisation instances and IsLocalization.lift, not supplied by this abbreviation alone.

**`tauceti:TauCeti.TriangulatedK0`**, `TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean`. Grothendieck group of an essentially small pretriangulated preadditive category with zero object and additive integer shifts. Its universe is controlled by EssentiallySmall; it is already the quotient by distinguished-triangle relations.

**`tauceti:TauCeti.TriangulatedK0.of`**, `TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean`. Class map from objects into the existing triangulated Grothendieck group.

**`tauceti:TauCeti.TriangulatedK0.of_distTriang`**, `TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean`. For T distinguished, the class of T.obj2 is the sum of the classes of T.obj1 and T.obj3.

**`tauceti:TauCeti.TriangulatedK0.of_eq_sub_of_distTriang`**, `TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean`. For T distinguished, the class of its third object is the class of its second minus its first.

**`tauceti:TauCeti.TriangulatedK0.of_shift`**, `TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean`. For every integer n, the class of X shifted by n is (-1)^n times the class of X. In particular shifting by two preserves the class.

**`tauceti:TauCeti.TriangulatedK0.liftEquiv`**, `TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean`. Triangle-additive, isomorphism-invariant object assignments with values in an additive commutative group G correspond to additive homomorphisms out of TriangulatedK0 C.

The reviewed audit has no separate MC.4 layer entry. Its M.5a and M.4 entries record missing motivic categories, correspondences and cycle complexes; SF.5 records only partial raw-cycle pushforward. Reading the pinned declarations adds the important positive result that triangulated K_0 is already implemented. The current read-only GrothendieckEulerForms and AlgebraicVectorBundles roadmaps were checked as ownership boundaries; current split/exact monoidal K_0 is not substituted for triangulated K_0.

## Source versions and independent findings

All locators use the pages of the named public version. The IAS preprints were checked directly; the published FV chapter was not collated. Findings on those proofs therefore make no claim that the version of record contains the same omission. Everything below is paraphrased; no source passage is reproduced.

**[V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf)** — Vladimir Voevodsky, *Triangulated categories of motives over a field*. In E. M. Friedlander, A. Suslin, V. Voevodsky, Cycles, Transfers, and Motivic Homology Theories, Annals of Mathematics Studies 143, Princeton University Press, 2000, pp. 188-238. Read in the author's preprint posted on his IAS publications page (56 pages); page numbers in locators are those of the preprint. SHA-256 `b15df626bd9e0bc41080dc7712ae8bab8bc8cd2ad8d20bf668593ce87eee70ad`.

**[FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf)** — Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*. In Cycles, Transfers, and Motivic Homology Theories, Annals of Mathematics Studies 143, Princeton University Press, 2000, pp. 138-187. Read in the preprint posted on Voevodsky's IAS publications page (55 pages); page numbers in locators are those of the preprint. SHA-256 `c5edd97134be2d8e3d625b54e604739e6a25590ce686acc8a71a316cfa104554`.

**[SV.RelCycles](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s2.pdf)** — Andrei Suslin and Vladimir Voevodsky, *Relative cycles and Chow sheaves*. In Cycles, Transfers, and Motivic Homology Theories, Annals of Mathematics Studies 143, Princeton University Press, 2000, pp. 10-86. Read in the preprint posted on Voevodsky's IAS publications page (86 pages); page numbers in locators are those of the preprint. SHA-256 `4f2cfb7162e9ca5febd9010ffca3a3d1ebe3e34b7031c6d514bd02b00e53ce92`.

**[V.CTP](https://web.archive.org/web/20160101000000id_/http://www.math.uiuc.edu/K-theory/0368/s3.pdf)** — Vladimir Voevodsky, *Cohomological theory of presheaves with transfers*. In Cycles, Transfers, and Motivic Homology Theories, Annals of Mathematics Studies 143, Princeton University Press, 2000, pp. 87-137. Read in the K-theory preprint archive copy (preprint 0368, file s3.pdf, 56 pages) retrieved through the Internet Archive; page numbers in locators are those of that copy. SHA-256 `5072e58b964d8883e76f2e0f98ba9c73ecf8f43b6ab88129caae8294699434aa`.

**[FL.Moving](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/14.pdf)** — Eric M. Friedlander and H. Blaine Lawson, *Moving algebraic cycles of bounded degree*. Inventiones Mathematicae 132 (1998), 91-119. Read in the authors' preprint posted on Friedlander's USC page (27 pages); page numbers in locators are those of the preprint. SHA-256 `da01bf9a4ccc26bd421af94d562e266c43d008ee7d97790c377d4e7b1dbe87de`.

**[MVW.2006](https://www.claymath.org/library/monographs/cmim02.pdf)** — Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*. Clay Mathematics Monographs 2, American Mathematical Society and Clay Mathematics Institute, 2006; the freely posted Clay PDF. SHA-256 `1197e239873e2a7f7f4dcbd1d115af67281a6d0867eff8816cc630b86b67f020`.

**[Bittner.2001](https://arxiv.org/pdf/math/0111062v1)** — Franziska Bittner, *The universal Euler characteristic for varieties of characteristic zero*. arXiv:math/0111062v1, 7 November 2001. The conventions on p. 2 assume characteristic zero and reduced varieties; only the scissor-ring definition before Theorem 3.1 is used. The elementary construction here is given for any field and permits nonreduced schemes, whose classes reduce by scissors. SHA-256 `484d2c3586977503dc6f1b43fca158af059cd0f9c5322731d0ebae6d643e160c`.

### MotivesAndAlgebraicCycles/E101 — gap

**Locator:** FV.BivCycl, Theorems 6.1 and 6.3 (preprint pp. 30, 34) and Theorem 7.1 (p. 37), in the IAS preprint; the proofs cite Friedlander-Lawson [9, 3.1] and [9, 3.2].

**Source assertion, paraphrased:** The presheaf forms of the moving lemma and the duality theorem for smooth projective varieties are stated over an arbitrary field k.

**Correction or missing argument:** In the proof plan retain infinite fields, or supply a finite-field descent argument compatible with the presheaf homology. A degree-dependent large finite field does not provide one fixed field for every bound. This finding alone does not establish that the stated theorem is false.

**Reason:** Friedlander-Lawson prove the moving lemma when k is infinite or a sufficiently large finite field (Theorem 3.1, p. 19, and the discussion of finite fields before Proposition 2.5, p. 17), the size depending on the degree bounds; for an arbitrary finite field they use two extensions of coprime degrees only in Theorem 3.4 (pp. 23-24), on rational equivalence of intersection products, not for the moving maps themselves. FV Lemma 6.6, used for Theorem 7.1, needs the moving maps over the fixed field k for every degree bound d, which a fixed finite field does not provide.

**Independent verdict:** confirmed. Confirmed only as an incomplete finite-field route in the IAS proof. No counterexample or finding about the uncollated published chapter is inferred. Reach: the proof. No correction found in the public author versions checked; finding scoped to the IAS preprint. The published chapter was not collated.

### MotivesAndAlgebraicCycles/E102 — misprint

**Locator:** V.DM, Proof of Proposition 3.5.3, preprint p. 36.

**Source assertion, paraphrased:** The vertical triangles of the deformation diagram are said to be distinguished by Proposition 4.1.3.

**Correction or missing argument:** They are distinguished by Proposition 3.5.2, the blow-up triangle for a smooth centre over a perfect field.

**Reason:** Both columns are blow-ups of smooth schemes along smooth centres (Z in X and Z x 0 in X x A^1), to which Proposition 3.5.2 applies; Proposition 4.1.3 rests on Theorem 4.1.2 and so on resolution of singularities, which section 3.5 does not assume.

**Independent verdict:** confirmed. Confirmed: both deformation columns use the smooth-centre blow-up triangle, Proposition 3.5.2, not the resolution-dependent 4.1.3. Reach: nothing. new

### MotivesAndAlgebraicCycles/E103 — gap

**Locator:** V.DM, Construction of g_Z after Proposition 3.5.3 (preprint p. 37) and last step of the proof of Proposition 3.5.4 (p. 39).

**Source assertion, paraphrased:** The composite of the Gysin map with the projection to Z(c)[2c] is stated to be the class of Z, and the isomorphism property of alpha(P^c, point) is said to follow easily from the construction, with a reference to Homology of schemes.

**Correction or missing argument:** Supply the categorical deformation/Chow-class compatibility and prove that alpha(A^c,0) is the canonical quotient isomorphism, or compute alpha(P^c,pt) as multiplication by 1 with a justified cycle-class comparison. The normalization and sign are explicit remaining gaps in this plan.

**Reason:** The source does not give this comparison; its reference to Homology of schemes uses another motivic category and is not by itself a proof in the category here. MVW Exercise 15.14 isolates the corresponding local normalization. This records an omitted argument, not a counterexample to purity.

**Independent verdict:** confirmed. Confirmed as an omitted categorical normalization/comparison argument. The former packet had restated this bridge as proved; it is now an explicit gap. Reach: the proof. new

### MotivesAndAlgebraicCycles/E104 — gap

**Locator:** V.DM, Proof of Proposition 2.1.4, preprint pp. 6-7.

**Source assertion, paraphrased:** The proof says it is clearly sufficient to give, for smooth projective X and Y, a canonical homomorphism from cycles of dimension dim X on X x Y modulo rational equivalence to Hom(M(X), M(Y)).

**Correction or missing argument:** A functor also needs compatibility with composition and with the tensor product: composition of finite correspondences agrees with composition of Chow correspondences because both are computed by intersection multiplicities of properly meeting cycles, and every Chow class is the class of a finite correspondence by the duality theorem.

**Reason:** The homomorphism alone does not make a functor; the compatibility is not stated.

**Independent verdict:** confirmed. Confirmed as an omitted functoriality check. MVW 1A.13-1A.14 supplies the precise general-field comparison to request; this is not a false-functor finding. Reach: the proof. new

### MotivesAndAlgebraicCycles/E105 — error

**Locator:** V.CTP, Proposition 4.23 with its one-line proof (preprint p. 34), used for Theorem 4.27 and, through its proof, Theorem 5.6.

**Source assertion, paraphrased:** Proposition 4.23 asserts a short exact Mayer-Vietoris sequence for any pretheory on any two-open cover of a smooth semilocal scheme, citing Lemma 4.6 and the proof of Proposition 4.17.

**Correction or missing argument:** MVW Lemma 22.10: given S = U_0 union V there is an open U in U_0 with S = U union V for which the sequence is exact; the argument must pass from U_0 to such a U. In this packet homotopy invariance of Nisnevich cohomology is imported from MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves (MVW Theorem 13.8, completed in Lectures 22-24) instead of CTP Theorem 5.6.

**Reason:** MVW state after Lemma 22.10 (pp. 185-186) that it corrects this result of Cohomological theory, which omitted the passage from U_0 to a smaller U; Voevodsky also said publicly that the proof of this key lemma is wrong (acknowledged on his IAS publications page).

**Independent verdict:** confirmed. Confirmed against CTP p. 34 and MVW 22.10 with the following remark (pp. 185-186). The packet uses the corrected homotopy-invariant-sheaf route rather than silently inheriting CTP 5.6. Reach: the proof. MVW Lemma 22.10 and the remark after it (pp. 185-186); Voevodsky's statement on the IAS publications page (https://www.math.ias.edu/Voevodsky/voevodsky-publications_abstracts.html, entry for Cohomological theory of presheaves with transfers)

### MotivesAndAlgebraicCycles/E106 — misprint

**Locator:** FV.BivCycl, IAS preprint, Theorem 7.1 (p. 37) and proof (p. 38).

**Source assertion, paraphrased:** The proof switches the order of the variables in the source of D and tests fibres with the other factor fixed, while the stated map has source z_equi(Y,X,r).

**Correction or missing argument:** For the stated D, use the projection X x Y -> Y and the test fibres X x {y}, of dimension dim X. Apply the moving theorem with cycle dimension r + dim Y and test dimension dim X.

**Reason:** Its expected intersection dimension is r, precisely the criterion for relative dimension r over Y in FV Proposition 6.4. Testing {x} x Y instead addresses the transposed duality map.

**Independent verdict:** confirmed. Confirmed by comparing the stated D with Proposition 6.4: the base is Y, so the tested fibres must be X x {y}. Reach: nothing. No correction found in the public IAS version; not collated against the published chapter.

### MotivesAndAlgebraicCycles/E107 — gap

**Locator:** FV.BivCycl, IAS preprint, Theorem 6.1 (p. 30), parameter-extension proof (pp. 31-33).

**Source assertion, paraphrased:** The theorem asks for maps of effective-cycle monoids, while the extension from an open parameter uses an integral linear combination of two finite correspondences whose degrees have greatest common divisor one.

**Correction or missing argument:** A signed correspondence gives an operation on cycle groups but need not preserve effective monoids. Use the positive finite-pushforward and crossed-constant construction of FL Theorem 3.8 (pp. 25-26), with its relative-family and field-of-definition checks.

**Reason:** The Bezout coefficients can include a negative integer. Linearity of transfers proves no positivity statement. FL 3.8 provides a positive route; this is a gap in the presented extension argument, not a claim that the moving theorem is false.

**Independent verdict:** confirmed. Confirmed narrowly: the displayed signed extension does not prove effective-monoid preservation. The positive FL 3.8 route still requires the explicit family-realization checks. Reach: the proof. No correction found in the IAS version checked; FL 3.8 provides an alternative positive extension. Published FV chapter not collated.

## Structure and assembly

The base MC.4 packet already chooses six planets: Effective geometric motives, Geometric motives, Motive of projective space, Gysin triangle, Motives with compact support and Projective bundle theorem. This follow-up adds no seventh planet to that unsplit layer. Its existing four-group restructuring proposal names additional central definitions and theorems for the eventual subdivision; those names are proposals rather than active planets. The Gysin triangle label must not conceal its normalization gap.

The proposed groups remain: geometric motives and Tate twists; fundamental triangles; equidimensional cycles and bivariant duality; higher-Chow/Chow-motive comparisons and the motivic measure. Applying them requires the maintainer and a separately authorized base-packet fix.

- `MotivesAndAlgebraicCycles:MC.4/gysin-triangle` → `MotivesAndAlgebraicCycles:MC.4/gysin-triangle-over-a-perfect-field`: Point to the perfect-field target, but retain the categorical normalization gap E103 and integral/flat coefficient qualifications for the divisor sequence. Do not mark the proof closed.
- `MotivesAndAlgebraicCycles:MC.4/blow-up-smooth-centre-and-gysin-map` → `MotivesAndAlgebraicCycles:MC.4/blow-up-formula-over-a-perfect-field`: Use the perfect-field blow-up splitting and Gysin-map target. The cycle-class clause still depends on the recorded deformation compatibility gap.
- `MotivesAndAlgebraicCycles:MC.4/friedlander-voevodsky-duality` → `MotivesAndAlgebraicCycles:MC.4/hom-into-motives-with-compact-support`: Add the Hom/bivariant comparison and bivariant-duality nodes, keeping the infinite-field restriction and the moving-family, cdh and complex-descent obligations.
- `MotivesAndAlgebraicCycles:MC.4/bivariant-shifting-theorem` → `MotivesAndAlgebraicCycles:MC.4/hom-into-motives-with-compact-support`: Its first isomorphism is part (a) of the new node, its flat pullback part (c).
- `MotivesAndAlgebraicCycles:MC.4/compact-support-kunneth` → `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers`: The natural map M^c(X) tensor M^c(Y) -> M^c(X x Y) is the exterior product (v).
- `MotivesAndAlgebraicCycles:MC.4/chow-motives-into-geometric-motives` → `MotivesAndAlgebraicCycles:MC.4/chow-motives-functor`: Import the functor target and its convention comparison. Keep the general-field Tor/composition request, moving-family gap and the resolution hypothesis for full faithfulness.
- `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycle-sheaves` → `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers`: Retain the bare relative-cycle presheaf here and move transfer/functoriality clauses to the new node, preventing a dependency cycle. Construction remains conditional on the M.5a relative-cycle request.

The MC.4 Tate-generated triangulated category serves PS.9; a mixed Tate heart and its t-structure remain with PS.9. The scissor ring and the compact-support measure serve LD.3. Neither the categorical Tate inverse nor the Lefschetz class replaces the formal-period algebra localization owned by PS.2.
