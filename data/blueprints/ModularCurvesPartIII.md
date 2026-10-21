# Modular curves, Part III: geometric Frey–Mazur

This is a completed import index for issue #3415. Its sole paper route already
names **GeometricFreyMazur**, whose design #1698 was independently accepted in
review #1725. The [accepted packet](../packets/GeometricFreyMazur.json) owns the
mathematics. This index imports its targets rather than making a second plan.
The [alias packet](../packets/ModularCurvesPartIII.json) gives the machine-readable
crosswalk and a merger proposal under PROTOCOL §§9 and 15.

There are 64 routed items: 63 import planned mathematics and item 119 is explicitly
excluded, following the accepted owner. All 67 owner nodes are imported, including
bridges beyond the direct extraction matches. Their 80 API items, 40 definition
tests and 53 planets keep their existing names and ownership. This alias introduces
zero nodes, API declarations, definition tests or planets. Eleven `source_decomposed`
records certify the import accounting; all owner stages remain `planned`, all
implementations unchecked, and no stage is closed. The nineteen supplier requests
remain open. The analytic supplier HyperbolicCurveVolumesAndGonality still has a
`needs_changes` review, so acceptance of this import index asserts no proof closure.

The accepted review corrected the packet and suggested file but could not edit the
[canonical reader](GeometricFreyMazur.md). In particular its old descent discussion
still routes through full image. Use the accepted packet and
[review report](../reviews/REV-DESIGN-GeometricFreyMazur.md) for corrected statements.
The canonical reader must be synchronized before packaging; this job does not edit it.

## Endpoints and conventions

Let k be algebraically closed of characteristic zero, and let U/k be a smooth
connected curve. Gonality means the gonality of its smooth proper model. For each
N>0 there is a bound M_N, uniform in k and U, such that if gon(U)<N, p>M_N is prime,
and E,E′/U are nonisotrivial elliptic schemes, an **actual linear** finite étale
isomorphism Ψ:E[p]≅E′[p] gives an isogeny over U. Nonisotriviality means nonconstant j.
The corresponding statement over K=k(B) follows by spreading the curves and torsion
maps over a common good-reduction open and taking generic fibres. These are BT16,
Theorems 1–2, p.710, in the conventions of GF.9.

The geometric endpoint is different data: every nonconstant curve map of gonality
<N into Z(p) has Hecke image once p is sufficiently large (BT16, Theorems 3 and 29,
pp.710,740–742). The rigidity bound and p>5 suffice for the final descent. The separate
GF.8 spectral/gonality/full-image results are retained targets, but are not premises
of that corrected descent. Uniform characteristic-zero transfer embeds a finitely
generated field of definition into C; it does not embed every possible k into C.

X(p) denotes the compact projective level curve, interpreted with both determinant
components and the parent's projective-frame convention. Z(p) is the diagonal
PGL₂(F_p) quotient of X(p)². A fixed component has effective deck group PSL₂(F_p).
The action on frames is left action by inverse precomposition. The scalar quotient
has residual [−1] automorphisms; it supplies no fine universal elliptic family.
We retain the actual Ψ when passing to its coarse classifying map.

CM⁺ and CM⁻ compare the two tangent characters of a common nontrivial projective
stabilizer. Either sign can have order 2 over j=1728 or order 3 over j=0. A singular
bicusp (SBC) has the same order-p cusp stabilizer on both coordinates. Mixed
cusp/elliptic types have no common nonidentity inertia for p>3.

Curvature is −1; ρ_X is half the shortest noncontractible compact length. Product
balls use the maximum distance and area is the sum of coordinate areas. For weighted
projected curve cycles set Deg C=Σ_j deg(pr_j)(2g_X−2); then vol(C)=2πDeg C.
Constant projections have degree and area zero, even at a cusp. Cyclic prime-to-p
Hecke degree is ψ(m)=m∏_(ℓ|m)(1+1/ℓ), rather than the all-subgroup degree σ₁(m).
Conjugate Hecke loci are real analytic in the original complex product, not divisors.
These conventions are needed throughout the source matches below.

## Layer ownership and proof flow

Every local reference GF.n/slug below means GeometricFreyMazur:GF.n/slug. The alias
layer GF.n imports the corresponding owner layer, with no arrow back to the alias.
Full hypotheses, proof steps, prerequisite node IDs, API statements and tests remain
at the owning packet node. The table is an ownership index, not a replacement plan.

| Alias layer | Single owner | Nodes | Imported responsibility |
| --- | --- | ---: | --- |
| GF.0 | GeometricFreyMazur:GF.0 | 6 | the existing scalar-framed projective level curve has two Weil-square-class components, a left PGL₂ action by inverse frame precomposition and residual [−1] automorphisms. The owner adds Z(p), its CM signs, singular bicusps, exact branch orders 2,3,p and finite Hecke images. It imports the parent’s compactified cyclic T_m and ψ(m) degree; no universal elliptic curve is asserted on the scalar quotient. |
| GF.1 | GeometricFreyMazur:GF.1 | 8 | for p>5 distinguish the cusped Γ(p) quotient from the compact (2,3,p) triangle quotient. Use the accepted surviving M_p, whose cusped and compact lengths are 4 log p+O(1), radius ρ_X=2 log p+O(1), cusp separation, metric inequalities and q-disc/Hecke-radius comparisons. The printed killed witness and single-cusp detour are not reused. |
| GF.2 | GeometricFreyMazur:GF.2 | 7 | entrywise matrix norm gives the existing height convention. Short elliptic and cusp displacement produces integral SL₂ lifts only within a fixed component; double-coset factors remain explicit. Unique cusp lifts, midpoint lenses and the O(p^(24δ)) overlap count require δ fixed sufficiently small before p grows. |
| GF.3 | GeometricFreyMazur:GF.3 | 6 | small linear equations reconstruct primitive matrices while preserving determinant sign. Positive-definite Gaussian/Eisenstein centralizers give Heegner repulsion; anti-Heegner points use conjugate real analytic loci. At least three bicusps give a signed small-Hecke locus, tube proximity and cusp separation; two do not suffice. |
| GF.4 | GeometricFreyMazur:GF.4 | 4 | big diagonals impose both matched-coordinate equalities and have codimension two. A logarithmic reduced-quadratic centralizer count feeds the signed overlap dichotomy. In the cusp branch the rotation bound uses min(p,1+p sinh R/sinh d), with p at d=0, before taking exponential shell bounds. |
| GF.5 | GeometricFreyMazur:GF.5 | 8 | canonical degree is the sum of weighted projection degrees times 2g_X−2, and volume equals 2πDeg. Keep separate CM⁺, CM⁻, stronger p-weighted SBC and qualified big-diagonal bounds. Projectionwise cusped measures give zero for constant cusp coordinates. Big-diagonal decay requires both projected cycles nonconstant and non-Hecke; all analytic supplier requests remain on the owner. |
| GF.6 | GeometricFreyMazur:GF.6 | 5 | normalize the image without increasing gonality, use a degree-n pencil to form P¹→SymⁿZ, and normalize a dominant pullback component under Gⁿ⋊S_n. Weighted projected cycles have the required nondegeneracy and degree sums. Native Sym only supplies the point-set carrier; it does not supply the projective surface quotient or relative cycle morphism. |
| GF.7 | GeometricFreyMazur:GF.7 | 5 | exhaust inertia by the CM signs, SBC and big diagonals. Cyclic local inertia has at most one p factor. Combine the four multiplicity estimates into Ram α=o(Deg C), retain the exact −2deg α term in Hurwitz, and contradict the independent Deg C/(2n) lower bound. This gives complex bounded-gonality geometric rigidity. |
| GF.8 | GeometricFreyMazur:GF.8 | 4 | derive gon(X_Γ)≥7[PSL₂(Z):Γ]/800 for congruence Γ from the imported spectral, area and Li–Yau inputs. A coset action killed by order-p transvections gives proper index ≥p and actual full SL₂ monodromy for p>max(5,800N/7), with a separate no-quadratic-self-twist target. These are separate results rather than prerequisites of the corrected Hecke descent. |
| GF.9 | GeometricFreyMazur:GF.9 | 9 | keep the actual Ψ after forming its coarse classifying map. Hecke containment supplies a geometric isogeny f with f[p]=λΨ; the rank-one Hom sign action and odd p descend f without a full-image premise. Extend over U by the original abelian-scheme interface. Finite-type spreading gives uniform characteristic-zero rigidity, separately transports monodromy, and proves the family and function-field formulations. |
| GF.10 | GeometricFreyMazur:GF.10 | 5 | enlarge strict thresholds for bounded genus and rational/elliptic normalizations. Apply the separate surface supplier to cyclic quotient charts, classify rational curves on the resolution as exceptional or Hecke strict transforms, and obtain some minimal model by known-curve contractions. General type for p>11 and uniqueness are explicitly excluded, as on the owner. |

The main proof runs through GF.0–GF.7, then the geometric part of GF.9, and finally
the actual-torsion descent. GF.8 proves the independent modular gonality and full
linear monodromy results. GF.10 consumes rigidity and the separate surface interfaces.
The following are acceptance constraints on imports, not new repairs to the owner:

- **Compact length.** The printed U(p)L(−p) lies in the filling kernel. Use the
  accepted witness M_p with p=3r+x, x∈{1,2}, whose rows are
  (1+xp,3p) and (p(2−x²+2px)/3,1+2p²−xp). Its determinant is 1 and trace 2p²+2.
  The compact triangle trace has absolute value asymptotic to 27p²/(4π²), so the
  compact upper length survives. The lower comparison counts repeated deep cusp
  excursions; it cannot assume one visit per cusp. The resulting length is
  4 log p+O(1), hence ρ_X=2 log p+O(1).
- **Small lifts and signs.** Integral SL₂ lifts apply to component-preserving
  elements. The unique-cusp-lift proof needs 8δ<1 before taking p large. Primitive
  reconstruction keeps det Q positive or negative: det(−Q)=det Q in dimension two.
  Positive determinant gives ordinary Hecke; negative determinant gives conjugate
  Hecke. Order-three centralizers have norm a²−ab+b², with t₀²+t₀+I=0.
- **Multiplicity.** The rotation count is C min(p,1+p sinh R/sinh d), with p at d=0.
  For SBC decay the desired conclusion is p·mult_SBC=o(Deg), stronger than an
  unweighted decay claim. Choose δ₃ small first, then 3δ₁<2δ₃, then δ₂ small relative
  to δ₁, and count the p^(24δ₃) cusp overlap. Big-diagonal decay requires the projected
  cycles to be nonconstant and non-Hecke. Without that condition curves in T₁×T₁
  contradict the printed unrestricted assertion, with ratio 3p/(p−6).
- **Pencils and ramification.** Normalize the image without increasing gonality;
  a degree-n pencil gives a cycle-valued P¹→SymⁿZ with fibre multiplicities.
  Normalize a dominant pullback under Gⁿ⋊S_n and use weighted projected cycles.
  Finite effective local inertia is cyclic and bounded by 6n!p, with at most one p
  factor. For α:C→P¹ retain 2g(C)−2=−2deg α+Ram α≤o(Deg C), whereas a nonconstant
  coordinate gives 2g(C)−2≥Deg C/(2n). Choose the uniform error below 1/(2n).
- **Descent.** A Hecke lift gives a geometric prime-to-p cyclic isogeny f with
  f[p]=λΨ. Nonisotriviality gives a rank-one geometric Hom lattice, so σf=±f.
  Equivariance of the actual Ψ and odd p exclude the negative sign. Thus f descends
  and extends over the original U by the imported Néron/abelian-scheme interfaces.
  There is no full-SL₂-image premise in this argument.

## Source-to-owner crosswalk

The following 64 entries are our own statements, with proof routes and concrete
acceptance checks. They are grouped by imported mathematical layer; they do not
summarize the source section by section. An item number is from
PAPER-BAKKER-TSIMERMAN-16. Exact existing node identifiers are retained even where
one item requires several bridges. Source abbreviations and read scopes are below.

### Existing family and torsion interfaces

**Item 01 — Nonisotrivial elliptic families.** Use the existing elliptic-scheme carrier; nonisotrivial means that j is nonconstant on the connected base.

Source: BT16, §1, pp.709–710; Theorem 1.

Imports: `AbelianSchemesAndArithmeticModuli:A1/relative-elliptic-equivalence`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.

Proof route: Read the relative dimension-one comparison and the parent's fixed-pairing level interface; no replacement family record is introduced.

Check: A constant-j family does not meet the nonisotrivial hypothesis.

**Item 02 — Torsion local system and monodromy.** The finite étale p-torsion is a rank-two F_p local system; an isomorphism retains its linear action.

Source: BT16, §1, pp.709–710.

Imports: `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`, `tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`.

Proof route: Apply the scheme finite-cover/fibre-functor equivalence and its field comparison, transporting module structure and pairings.

Check: Projectivizing the representation discards quadratic characters and is insufficient for descent.

### GF.0 imports

**Item 21 — Diagonal quotient surface.** Z(p) is the normal projective diagonal quotient of X(p)² by PGL₂(F_p), with two determinant-square-class components.

Source: BT16, BTE, §2.3 Definition, p.715; erratum §1.

Imports: `GF.0/diagonal-quotient`.

Proof route: Descend composition of the two projective frames, and compare each component with the appropriate twisted fixed-pairing PSL₂ presentation.

Check: A nonsquare component must survive the comparison.

**Item 22 — Heegner CM points.** CM⁺ consists of pairs with a common nonidentity projective stabilizer and equal compatible tangent characters.

Source: BT16, §2.4 pp.715–716.

Imports: `GF.0/cm-strata`.

Proof route: Use the order-two/order-three effective cyclic stabilizers and prove independence of compatible lifts and generators.

Check: Equal j-invariants alone need not give a common stabilizer.

**Item 23 — Anti-Heegner CM points.** CM⁻ uses the opposite compatible tangent character, and conjugating the second complex factor exchanges the two CM signs.

Source: BT16, §2.4 p.716.

Imports: `GF.0/cm-strata`.

Proof route: Use the same common-stabilizer carrier and transport the character comparison under conjugation.

Check: For the order-three lift the other eigenvalue is −1−t, rather than −t.

**Item 24 — Singular bicusps.** A singular bicusp is a pair of cusps whose order-p projective stabilizers agree.

Source: BT16, §2.4 pp.715–716.

Imports: `GF.0/singular-bicusps`.

Proof route: Identify nontrivial intersection of the order-p stabilizers with equality and transport the p-gon boundary under G.

Check: A pair with distinct cusp inertia groups is excluded.

**Item 105 — Branch locus of the diagonal quotient.** The nonfree diagonal-quotient locus is exactly CM⁺∪CM⁻∪SBC, with orders 2 over j=1728, 3 over j=0, and p at SBC.

Source: BT16, §2.4 pp.715–716.

Imports: `GF.0/quotient-branch-locus`.

Proof route: Use the individual effective inertia list and coprimality to exclude mixed types.

Check: A cusp/elliptic pair has no common nonidentity inertia when p>3.

**Item 114 — Hecke divisors and non-Hecke curves on Z(p).** A Hecke curve is an irreducible component of the finite image H_m of the cyclic prime-to-p correspondence T_m.

Source: BT16, §1, p.709; Theorem 3 p.710; used in Theorem 29 and Propositions 25–26, erratum Propositions 4.1–4.2.

Imports: `GF.0/hecke-loci`.

Proof route: Import the parent's compactified cyclic correspondence and degree ψ(m); add only its quotient image and the non-Hecke component condition.

Check: At m=4 the cyclic multiplier is 6, while the full-subgroup multiplier is 7.

### GF.1 imports

**Item 29 — Compact triangle uniformization of X(p).** For prime p>5, a selected compact component is Ξ(p)\H for the (2,3,p) triangle quotient of PSL₂(Z), with effective deck group PSL₂(F_p).

Source: BT16, opening of §3, pp.717–718; accepted replacement for Lemma 5, p.718.

Imports: `GF.1/triangle-uniformization`, `GF.1/surviving-systolic-witness`.

Proof route: Use the imported polygon/uniformization interface and distinguish cusp filling from the cusped cover; keep the surviving witness.

Check: The reciprocal-angle sum is hyperbolic at p=7 and not at p=5.

**Item 30 — Cusped systole asymptotic.** Half the least cusped length among loops nontrivial after filling is 2 log p+O(1).

Source: BT16, Lemma 5 and proof, p.718.

Imports: `GF.1/cusped-systole`, `GF.1/surviving-systolic-witness`.

Proof route: Use tr M≡2 mod p² for the lower bound and the accepted M_p for an upper bound that survives filling.

Check: The printed U(p)L(−p) witness dies after U^p is killed.

**Item 31 — Uniformizing triangle coordinates.** The marked triangle has y_p=p/π+O(p⁻¹) and θ_p=π/3+O(p⁻¹); the owner's U_p,L_p fix this normalization.

Source: BT16, §3.2, p.719.

Imports: `GF.1/triangle-coordinates`.

Proof route: Use the triangle cosine rule, determinant/order identities and the positive square-root branch.

Check: The square-root discriminant is positive at p=7 and negative at p=5.

**Item 32 — Separated cusp balls.** Distinct cusps in the compact metric are separated by at least 2 log p−O(1), with radius log p−O(1) embedded cusp discs.

Source: BT16, Lemma 6, p.720.

Imports: `GF.1/cusp-separation`.

Proof route: Use incident triangle stars before applying the global injectivity-radius theorem.

Check: The local cusp-star bound is established before the global radius, avoiding a circular proof.

**Item 33 — Comparison of compact and cusped metrics.** For compact distance r to the nearest cusp, tanh²(r/2)h_Y≤h_X≤h_Y.

Source: BT16, Proposition 7, p.720.

Imports: `GF.1/metric-comparison`.

Proof route: Apply Schwarz–Pick to the inclusion and to a cusp-free compact disc; take square roots when comparing lengths.

Check: On r≥R the length factor is coth(R/2), whereas quadratic forms use its square.

**Item 34 — Compact injectivity radius.** The compact injectivity radius is 2 log p+O(1), with shortest nontrivial length 4 log p+O(1).

Source: BT16, Corollary 8, p.720.

Imports: `GF.1/compact-injectivity-radius`.

Proof route: Combine the surviving upper witness with an excursion count, metric comparison and bounded detour for each deep cusp visit.

Check: Repeated visits to one cusp are counted; no at-most-one-cusp assertion is assumed.

**Item 35 — Cusp discs and radius comparison.** The width-p coordinate q=exp(2πiz/p) identifies the embedded horoball disc with radius exp(−2πy/p) and yields both compact-radius containments.

Source: BT16, §3.2, equations (2)–(3), p.721.

Imports: `GF.1/cusp-coordinates`.

Proof route: Apply punctured-disc and filled-disc metric comparisons within the stated log p to 2 log p range.

Check: The factor p in the q-coordinate is retained.

**Item 36 — Hecke pullback of a cusp ball.** For sufficiently large p and an integer m≥1 prime to p, fix a uniform constant C and assume log p+C<R and R+log m<2 log p−C. The inverse cyclic Hecke image of a radius-R cusp ball lies in the union of balls of radius R+log m+C at the inverse cusps.

Source: BT16, Lemma 9, p.721.

Imports: `GF.1/cusp-coordinates`.

Proof route: Use the branch imaginary-part factor between 1/m and m together with the two q-radius estimates.

Check: Both log p+C<R and R+log m<2 log p−C remain in the application. An upper bound alone does not permit the q-disc comparison; m is a positive integer prime to p.

**Item 118 — The maps i_p, γ_p and q_p for X(p).** The compact triangle map γ_p kills the normal closure of the peripheral pth power; Ξ(p) is the image of Γ(p) and its quotient deck group is PSL₂(F_p).

Source: BT16, opening of §3 and Lemma 5, pp.717–718; accepted filling-witness correction.

Imports: `GF.1/triangle-uniformization`, `GF.1/surviving-systolic-witness`.

Proof route: Compare the cusped and filled orbifold groups and use the accepted nontrivial compact witness where an upper systolic bound is needed.

Check: The element U(p)L(−p) lies in the filling kernel despite being cusped hyperbolic.

### GF.2 imports

**Item 37 — Integral matrix height.** The integral matrix height is the entrywise maximum norm, with h(AB)≤2h(A)h(B) and h(A⁻¹)=h(A) for SL₂.

Source: BT16, §3.3 "Heights", Definition, p.721 (used on M₂(Z) in S′_δ, p.730).

Imports: `GF.2/height-adapter`.

Proof route: Specialize the pinned entrywise norm and the two-term matrix product; no general height is newly defined.

Check: The two-by-two all-ones matrix requires the factor 2 in the product estimate.

**Item 38 — Short displacement at elliptic lifts.** A component-preserving deck element moving a marked elliptic point less than δρ_X has an integral SL₂ lift of height O(p^(4δ)), for 0<δ<1/2.

Source: BT16, Lemma 10, p.722.

Imports: `GF.2/short-elliptic-displacement`.

Proof route: Use compact/cusped comparison and the real and imaginary parts of Mi; repeat at the order-three vertex.

Check: A nonsquare component-switching PGL element is outside this lift statement.

**Item 39 — Short cusp displacement representatives.** A cusp lift within (1+δ)ρ_X of the marked cusp lift is σγ_p(M)i y_p, with σ in the cusp stabilizer and h(M)=O(p^(4δ)).

Source: BT16, Lemma 11(a), pp.722–723.

Imports: `GF.2/cusp-lift-height`.

Proof route: Move an adjacent order-two vertex using the triangle star and apply the elliptic height bound.

Check: The stabilizer factor σ cannot be silently removed.

**Item 40 — Cusp double-coset height control.** A short component-preserving cusp displacement lies in Hγ_p(M)H modulo Ξ, with the same height bound.

Source: BT16, Lemma 11(b), pp.722–723.

Imports: `GF.2/cusp-double-coset`.

Proof route: Lift a shortest path and retain the stabilizer choices at both ends.

Check: This is a double-coset assertion, rather than a single representative assertion.

**Item 41 — Unique nearby cusp lift.** For sufficiently small fixed δ and large p, a distinct cusp has at most one lift in the radius-(1+δ)ρ_X ball about a chosen cusp lift.

Source: BT16, Proposition 12(a), pp.723–724.

Imports: `GF.2/cusp-unique-lift`.

Proof route: The lower matrix entry is both divisible by p and O(p^(8δ)); choose 8δ<1 before taking p large.

Check: The printed δ<1/4 does not justify an O(p^(8δ)) quantity being <p.

**Item 42 — Intersection of cusp balls.** Two radius-(1/2+δ)ρ_X balls about distinct cusps have intersection in a radius-δρ_X+O(1) ball.

Source: BT16, Proposition 12(b), pp.723–724.

Imports: `GF.2/cusp-lens`.

Proof route: Lift the lens using uniqueness, strengthen the smallness margin, and apply the hyperbolic midpoint-lens bound.

Check: The radius has a uniform additive constant and the centres are distinct.

**Item 43 — Counting nearby cusps.** At any point there are O(p^(24δ)) cusps within (1/2+δ)ρ_X, for sufficiently small fixed δ.

Source: BT16, Proposition 12(c), pp.724–725.

Imports: `GF.2/cusp-ball-count`.

Proof route: Combine the lens with short integral matrix counting at a nearby elliptic vertex.

Check: A point near zero or one cusp satisfies the bound without a reconstruction premise.

### GF.3 imports

**Item 45 — Corrected Heegner repulsion.** Two nearby distinct CM⁺ points of the same elliptic type lie on one cyclic T_m with m≤C_δp^(Aδ).

Source: BTE, Erratum Proposition 2.1, p.2, replacing Proposition 14 pp.725–727.

Imports: `GF.3/heegner-repulsion`.

Proof route: Use the corrected Heegner centralizer argument with h₀=1 and positive determinant in the definite algebra.

Check: The analogous ordinary-Hecke claim for CM⁻ is excluded.

**Item 46 — Centralizer rigidity at Heegner points.** The two short-lift intertwining equations in the distinct-Heegner setup cut the matrix solution space to dimension at most one.

Source: BT16, BTE, Lemma 15, pp.726–727; erratum §2.

Imports: `GF.3/cm-centralizer`, `GF.3/heegner-repulsion`, `GF.3/conjugate-hecke`.

Proof route: Use the Gaussian/Eisenstein centralizers; redundancy would force the integral determinant-one lifts to fix the elliptic vertex.

Check: For order three, det(aI+bt₀)=a²−ab+b².

**Item 47 — Conjugate Hecke loci.** The conjugate Hecke locus is the second-factor conjugate of T_m, a real analytic locus in the original complex product.

Source: BTE, Erratum §§1,4.1, pp.1,3.

Imports: `GF.3/conjugate-hecke`.

Proof route: Transport the metric and CM⁺ repulsion through the second-factor isometry, keeping the conjugate complex structure explicit.

Check: There is no algebraic divisor intersection C·T̄_m.

**Item 48 — Repulsion of singular bicusps.** At least three nearby singular bicusps force all nearby ones onto one small ordinary or conjugate Hecke locus, with the strengthened tube/cusp-complement outputs.

Source: BT16, Proposition 17, pp.727–728.

Imports: `GF.3/three-bicusp-repulsion`.

Proof route: Three projective-line incidence conditions give a unique small integral matrix; keep its determinant sign in the reconstruction.

Check: Two bicusps are insufficient, and multiplying a negative-determinant matrix by −1 does not make it positive.

**Item 52 — Small-height matrix reconstruction.** A unique invertible projective solution of small integral linear equations has a primitive small integral lift Q with p∤det Q.

Source: BT16, Proofs of Propositions 17–18, pp.728,730–731.

Imports: `GF.3/small-height-reconstruction`.

Proof route: Use rank-three cofactors and lift small minors from mod p to Z; split the Smith-form interpretation according to the sign of det Q.

Check: Q and −Q have the same determinant sign; m is abs(det Q).

**Item 113 — CM± coset criterion.** The Heegner centralizer argument uses the identity normalizer coset; the other CM sign is obtained through conjugation rather than a chosen integral normalizer lift.

Source: BT16, BTE, Proof of Proposition 14, p.726; erratum §2.

Imports: `GF.3/cm-centralizer`, `GF.3/heegner-repulsion`, `GF.3/conjugate-hecke`.

Proof route: Read the corrected h₀=1 proof and the Gaussian/Eisenstein rank argument with the two characteristic polynomials distinguished.

Check: A common integral lift in the other normalizer coset is not assumed to exist.

**Item 115 — Hecke curves contain no anti-Heegner CM points.** An ordinary cyclic prime-to-p Hecke locus has no CM⁻ point.

Source: BT16, BTE, Remark 16, first clause, p.727; used in erratum §1.

Imports: `GF.3/hecke-avoids-anti`.

Proof route: In the commutative CM endomorphism algebra the isogeny intertwines the same tangent character; prime-to-p torsion distinguishes the opposite one.

Check: This exclusion does not imply unconditional repulsion among anti-Heegner points.

### GF.4 imports

**Item 49 — Big diagonals and small Hecke curves.** Δ_g imposes both matched-coordinate equalities in S²; τ_(g,m) restricts its source to T_m, with a separate real analytic signed companion.

Source: BT16, §4.4 p.728.

Imports: `GF.4/big-diagonals`.

Proof route: Use the diagonal action graph and midpoint argument for the max-product tube formula.

Check: The radius-R tube uses coordinate distances <2R, and Δ_g has codimension two.

**Item 50 — Diagonal-overlap dichotomy.** More than C log p overlapping diagonal tubes force a bicusp configuration or proximity to an ordinary or conjugate small Hecke locus.

Source: BT16, Proposition 18, pp.728–731.

Imports: `GF.4/diagonal-overlap`.

Proof route: Separate cusp-normalizer and reduced-quadratic-centralizer cases; reconstruct signed matrices in the scalar-centralizer case.

Check: A conjugate small locus cannot be silently replaced by a holomorphic curve.

**Item 51 — Quantitative overlap near bicusps.** The cusp rotation count is bounded by C min(p,1+p sinh R/sinh d) for d>0; at d=0 use p.

Source: BT16, Proposition 18(a) and proof, pp.729–730.

Imports: `GF.4/bicusp-rotation-count`.

Proof route: Use sinh(D/2)=sinh d times abs(sin(θ/2)) and count order-p rotation angles; use inverses for either projection.

Check: Keep the additive 1 and sinh R when R grows with log p.

**Item 53 — Quadratic-torus height count.** For a nonscalar reduced quadratic rational algebra, determinant-one integral centralizer elements of height ≤p^A number O_A(log p).

Source: BT16, Proof of Proposition 18, pp.730–731.

Imports: `GF.4/quadratic-centralizer-count`.

Proof route: Bound imaginary/split unit groups directly and use uniform logarithmic separation of real quadratic units.

Check: A nonreduced unipotent algebra returns to the cusp branch; the logarithmic claim is not made there.

### GF.5 imports

**Item 68 — Volume-to-degree decay.** For fixed t>0, vol(C)/a(tρ_X)=O(p^(−2t)Deg C) uniformly in effective cycles.

Source: BT16, §6 p.736.

Imports: `GF.5/degree-conventions`, `GF.5/heegner-multiplicity`.

Proof route: Compose ρ_X=2 log p+O(1), a(r)=4πsinh²(r/2), and vol=2πDeg.

Check: The exponent is −2t and constant coordinate projections contribute degree zero.

**Item 69 — Heegner multiplicity decay.** The CM⁺ multiplicity is O((p^(−2δ₂)+p^(3δ₁−1))Deg C) for a cycle without Hecke components.

Source: BT16, BTE, Proposition 25 proof, pp.736–737, restricted by erratum §4.1.

Imports: `GF.5/heegner-multiplicity`.

Proof route: Separate CM⁺ off/on small Hecke loci, use disjoint point balls off them and cyclic pull-push plus diagonal bounds on them.

Check: Choose 3δ₁<1 and then δ₂ sufficiently small before taking p large.

**Item 70 — Anti-Heegner multiplicity decay.** The same decay holds for CM⁻, using conjugate Hecke tubes and no conjugate divisor intersection.

Source: BTE, Erratum Proposition 4.1, p.3.

Imports: `GF.5/anti-heegner-multiplicity`.

Proof route: Use fixed ε-balls, holomorphic Hecke pull-push and the conjugate-diagonal relative volume estimate.

Check: The ratio is sinh ε/sinh R; its reciprocal would grow rather than decay.

**Item 71 — Total CM multiplicity decay.** Total CM multiplicity is the sum of the separately proved positive and negative character bounds.

Source: BT16, BTE, Proposition 25, pp.736–737; erratum §4.1.

Imports: `GF.5/heegner-multiplicity`, `GF.5/anti-heegner-multiplicity`.

Proof route: Use the CM partition and the minimum of their positive decay exponents.

Check: One cannot apply ordinary Heegner repulsion to both signs.

**Item 72 — Corrected singular-bicusp decay.** For every non-Hecke effective cycle, p times its SBC multiplicity is O(p^(−η)Deg C), with η>0.

Source: BT16, BTE, Proposition 26, p.737, with proof replaced by erratum Proposition 4.2 p.4.

Imports: `GF.5/bicusp-multiplicity`.

Proof route: Use the signed off/on small-Hecke split and the strengthened erratum argument on the diagonal and conjugate diagonal.

Check: An O(p^(−1+δ)) bound for mult_SBC is too weak for ramification.

**Item 73 — Bicusp error exponents.** Choose δ₃ small first, then 3δ₁<2δ₃, then δ₂ small relative to δ₁; the two SBC exponents are −1−2δ₂ and −1−2δ₃+3δ₁.

Source: BTE, Erratum Proposition 4.2 proof, p.4.

Imports: `GF.5/bicusp-multiplicity`.

Proof route: Include both determinant signs and the cusp-ball overlap factor p^(24δ₃); fix δ₃ to absorb that factor before the remaining choices.

Check: For δ₃=1/1000, δ₁=1/10000, δ₂=1/100000, both p-weighted displayed exponents are negative; this tests signs, not all hidden geometric constants.

**Item 74 — Total big-diagonal multiplicity.** Big-diagonal multiplicity decays for cycles outside every Δ_g whose two projected cycles are nonconstant and non-Hecke.

Source: BT16, Proposition 27, pp.737–740.

Imports: `GF.5/big-diagonal-multiplicity`.

Proof route: Apply the accepted overlap decomposition, signed tube estimates and separate point-ball comparison; the pencil construction supplies the extra hypotheses.

Check: The unrestricted printed proposition fails on curves inside T₁×T₁, where the accepted counterexample ratio is 3p/(p−6).

**Item 75 — Compact versus cusped curve volume.** Define cusped area projectionwise; its positive difference from compact area on any measurable subset is O(p⁻¹vol C).

Source: BT16, Lemma 28, p.738.

Imports: `GF.5/cusped-measure`, `GF.5/cusped-volume-error`.

Proof route: Integrate nonconstant projections and use the cusp/genus ratio; a constant cusp coordinate contributes zero.

Check: At p=7 the area ratio is 7, matching 1+6/(p−6), not an omitted cusp term.

**Item 76 — Hecke tube comparison and cusp exceptions.** Away from suitably enlarged cusp balls, compact Hecke tubes compare with cusped ones; cusped Hecke branches are local isometries.

Source: BT16, Proof of Proposition 27, pp.738–740.

Imports: `GF.5/hecke-tube-comparison`.

Proof route: Apply holomorphic cyclic pull-push and the O(p⁻¹) total-measure error, then ordinary or conjugate relative tube bounds.

Check: The ordinary tube bound needs projected non-Hecke components; the conjugate bound is a volume statement.

### GF.6 imports

**Item 84 — A gonality pencil gives a rational curve.** A degree-n gonality pencil on the normalization of a curve birational to its image gives a nonconstant, generically injective P¹→SymⁿZ.

Source: BT16, Proof of Theorem 29, p.741.

Imports: `GF.6/pencil-cycle-map`, `GF.6/image-normalization`, `GF.6/surface-symmetric-power`.

Proof route: Use the relative finite-flat fibre-cycle map and disjoint images of distinct generic fibres.

Check: A ramified double-cover fibre is 2[f(b)], not its reduced support.

**Item 85 — Normalized pullback and quotient group.** Normalizing a dominant component of the pullback of the pencil map gives C→Sⁿ and finite α:C→P¹, with stabilizer quotient C/H=P¹.

Source: BT16, Proof of Theorem 29, p.741.

Imports: `GF.6/normalized-pullback`.

Proof route: Use W=Gⁿ⋊S_n, generic orbit transitivity and the smooth proper curve/function-field dictionary; remove any action kernel for inertia.

Check: For n=1 the permutation factor vanishes but G-inertia remains.

**Item 86 — Projected cycles retain degrees.** Weighted projected cycles are nonconstant and non-Hecke, with pair projections outside Δ_g; ΣDeg C_i=Deg C and Σ_(i<j)Deg C_ij=(n−1)Deg C.

Source: BT16, Proof of Theorem 29, pp.741–742.

Imports: `GF.6/projection-cycles`.

Proof route: Use transitivity on pencil slots, generic distinctness of fibres and the projection formula with generic map multiplicities.

Check: For n=1 the pair sum is empty; for n=2 each coordinate occurs once in it.

### GF.7 imports

**Item 05 — Gonality rigidity on the diagonal quotient.** Every nonconstant bounded-gonality curve map to Z(p) has Hecke image for sufficiently large p, uniformly over algebraically closed characteristic-zero fields.

Source: BT16, Theorems 3 and 29, pp.710,740–742.

Imports: `GF.7/complex-geometric-rigidity`, `GF.9/characteristic-zero-spread`.

Proof route: Use the complex Hurwitz contradiction and the separate finite-type spreading node for arbitrary k.

Check: Both determinant components are included; N≤1 has no positive gonality <N.

**Item 87 — Ramification support on four strata.** Ramification support consists of CM⁺, CM⁻ or SBC in one slot, or simultaneous equalities Δ_g in two moved slots.

Source: BT16, Proof of Theorem 29, p.741.

Imports: `GF.7/ramification-support`.

Proof route: Separate stabilizers with trivial/nontrivial permutation; use étaleness on the free quotient locus and normalization branch inertia.

Check: A single matched X-coordinate equality does not define the required big-diagonal stratum.

**Item 88 — Stabilizer and ramification-index bounds.** For fixed n and p>max(5,n), local effective cyclic inertia has order at most 6n!p, and at most 6n! off the SBC strata.

Source: BT16, Proof of Theorem 29, p.741.

Imports: `GF.7/local-indices`.

Proof route: Raise an element to n! to remove permutation and use coordinate stabilizer orders dividing 2,3,p.

Check: Several bicusp slots still produce one factor p, rather than p^n.

**Item 89 — Ramification is negligible.** Ram α is O_n(p^(−η_n)Deg C) uniformly in the pencil pullback.

Source: BT16, Proof of Theorem 29, pp.741–742.

Imports: `GF.7/ramification-decay`.

Proof route: Charge ramification to weighted projected multiplicities and combine the two CM, p-weighted SBC and qualified diagonal estimates.

Check: The degree identities absorb sums over slots and pairs without dropping map multiplicities.

**Item 90 — Contradictory Hurwitz bounds.** Hurwitz gives 2g(C)−2=−2deg α+Ram α≤o(Deg C), while a largest nonconstant X-projection gives 2g(C)−2≥Deg C/(2n).

Source: BT16, Proof of Theorem 29, p.742.

Imports: `GF.7/hurwitz-contradiction`.

Proof route: Use the algebraic canonical-degree convention and choose the uniform error coefficient <1/(2n).

Check: Retain −2deg α in the equality; there is no extra 2π in the algebraic lower bound.

### GF.8 imports

**Item 94 — Abramovich linear modular gonality.** A congruence subgroup of PSL₂(Z) of index D has compact modular curve gonality ≥7D/800.

Source: ABR96, BT16, ABR96, Theorem 0.1 and §§1.4–1.7, preprint pp.1–3; BT16 remark after Theorem 2, p.710.

Imports: `GF.8/modular-gonality`.

Proof route: Combine the imported gap 21/100, effective area πD/3 and singular-metric Li–Yau bound λ′₁Area≤8πgon.

Check: The exact scalar product (21/100)/24 is 7/800; arbitrary noncongruence subgroups are excluded.

**Item 97 — Full torsion monodromy for bounded gonality.** Bounded-gonality nonisotrivial elliptic families have full actual SL₂(F_p) image for p>max(5,800N/7), also over general algebraically closed characteristic-zero k.

Source: BT16, §1 p.710 and footnote 3.

Imports: `GF.8/proper-subgroup-index`, `GF.8/full-linear-monodromy`, `GF.9/characteristic-zero-monodromy`.

Proof route: A coset action of index <p kills order-p transvections, proving proper index ≥p; apply modular gonality and then characteristic-zero finite-étale invariance.

Check: A full projective image still requires exclusion of a proper subgroup above it; no semisimplification replaces actual image.

### GF.9 imports

**Item 03 — Geometric Frey–Mazur for families.** For N>0 there is M_N, uniform in algebraically closed characteristic-zero k and smooth connected U with gon(U)<N, such that actual p-torsion isomorphism of nonisotrivial elliptic schemes implies an isogeny over U for every prime p>M_N.

Source: BT16, Theorem 1, p.710.

Imports: `GF.9/geometric-frey-mazur`.

Proof route: Use geometric rigidity, the Hecke lift with f[p]=λΨ, sign descent in the rank-one Hom lattice, and extension over U.

Check: The conclusion is over the original U, with no finite base cover in its place.

**Item 04 — Geometric Frey–Mazur over function fields.** For K=k(B), with k algebraically closed of characteristic zero and B smooth proper of gonality <N, actual G_K-linear p-torsion isomorphism implies K-isogeny above the same uniform threshold.

Source: BT16, Theorem 2, p.710.

Imports: `GF.9/function-field-form`.

Proof route: Spread both curves and inverse torsion maps over a common good-reduction open, apply the family theorem, and take generic fibres; reverse using extension.

Check: Removing finitely many base points leaves the proper-model gonality unchanged.

**Item 91 — From local systems to a modular surface map.** Actual finite étale torsion isomorphism Ψ gives a nonconstant U→Z(p) when j(E) is nonconstant; its multiplier determines the component.

Source: BT16, §1 Theorems 1–3, pp.709–711; §2.3 p.715.

Imports: `GF.9/actual-torsion-classifying-map`.

Proof route: Choose frames étale-locally, transport by Ψ, descend the invariant quotient map and extend to the proper base.

Check: Ψ and −Ψ define the same coarse map but Ψ must remain available as linear input.

**Item 92 — Descent from projective congruence to an actual isogeny.** Hecke containment yields a geometric cyclic isogeny f with f[p]=λΨ; rank-one geometric Hom implies σf=±f, and actual Ψ forces the plus sign for odd p.

Source: BT16, Reduction of Theorems 1–2 to Theorem 3, p.710.

Imports: `GF.9/nonisotrivial-hom-lattice`, `GF.9/actual-linear-descent`, `GF.9/extend-isogeny-over-base`, `GF.9/geometric-prime-to-p-isogeny`.

Proof route: Lift the generic point through the cyclic correspondence, descend the morphism using its invertible torsion restriction, then extend over U by the imported Néron interface.

Check: Full SL₂ monodromy is not an assumption of this descent; projective data alone permit a quadratic twist.

**Item 93 — Algebraically closed characteristic-zero reduction.** The same complex rigidity threshold works over any algebraically closed characteristic-zero k.

Source: BT16, Theorems 1–3, p.710; proof carried out over C in §§2–7.

Imports: `GF.9/characteristic-zero-spread`.

Proof route: Descend the map and a pencil of degree <N to a finitely generated subfield, embed that field in C, descend Hecke containment faithfully flatly and lift the generic isogeny over k.

Check: An embedding of all of k into C is not asserted.

### GF.10 imports

**Item 98 — Bounded-genus rigidity.** For genus g<N the nonconstant image is Hecke after enlarging the geometric threshold to M_(N+1).

Source: BT16, Corollary 30, p.742.

Imports: `GF.10/bounded-genus`.

Proof route: Use gon≤g+1≤N<N+1; handle constant maps separately.

Check: A bound stated for strict gonality <N cannot be applied directly at gon=N.

**Item 99 — Rational and elliptic curves are Hecke.** For p>M_3, every integral rational or elliptic curve in Z(p) is Hecke.

Source: BT16, Corollary 31, p.742.

Imports: `GF.10/rational-elliptic-curves`.

Proof route: Apply rigidity to its normalization, of gonality one or two, and identify equal-dimensional integral images.

Check: The normalization genus is used even for a singular image curve.

**Item 100 — Cyclic quotient singularities of Z(p).** Resolve the cyclic quotient points with effective orders 2,3,p and tangent weights of type 1/n(1,a); known curves are exceptional components and Hecke strict transforms.

Source: BT16, §7 following Corollary 31, p.742.

Imports: `GF.10/quotient-resolution`.

Proof route: Apply the separate Hirzebruch–Jung surface supplier to the local stabilizer characters.

Check: The 1/2(1,1) chart gives one (−2)-curve, which cannot be contracted to a smooth point by the (−1) criterion.

**Item 102 — Known-curve minimal model.** For sufficiently large p some smooth minimal model is reached by contractions whose original strict transforms are known rational curves.

Source: BT16, Corollary 32, p.742.

Imports: `GF.10/known-curve-minimal-model`, `GF.10/known-rational-curves`.

Proof route: Classify rational curves on the resolution, then apply Castelnuovo and Picard-number termination from the surface owner.

Check: A curve contracted later need not have self-intersection −1 on the initial resolution; uniqueness is not claimed.

### Explicit exclusion

**Item 119 — Z(p) is of general type for p > 11 (Hermann).** The general-type and uniqueness assertion is outside this route's retained mathematical targets.

Source: BT16, §1, p.710; used for uniqueness of the minimal model in Corollary 32, p.742.

Imports: none; excluded from retained targets.

Proof route: Follow the owner's explicit exclusion: minimal-model existence follows from known rational curves and contractions without Hermann's classification.

Check: No theorem for p>11 or uniqueness is inferred; the excluded statement is not marked proved or imported.

## Definition contracts and unit tests

These are references to existing contracts, not new alias definitions. Each row
names its existing API and all existing test names, so the import can be audited
without counting a second copy. The owning node supplies the complete statements,
`uses` and test kinds. Every definition/construction has at least three tests;
GF.4/big-diagonals has four. GF.0/projective-frames is a comparison adapter, not
another definition of the parent's projective level curve.

### GF.0/diagonal-quotient

API (6): `TauCeti.GeometricFreyMazur.quotientSurface_mk`, `TauCeti.GeometricFreyMazur.quotientSurface_desc`, `TauCeti.GeometricFreyMazur.quotientSurface_orbit`, `TauCeti.GeometricFreyMazur.quotientSurface_fixedPairing`, `TauCeti.GeometricFreyMazur.quotientSurface_swap`, `TauCeti.GeometricFreyMazur.quotientSurface_baseChange`.

Tests (3): `TauCeti.GeometricFreyMazur.diagonal_quotient_test1`, `TauCeti.GeometricFreyMazur.diagonal_quotient_test2`, `TauCeti.GeometricFreyMazur.diagonal_quotient_test3`.

### GF.0/cm-strata

API (6): `TauCeti.GeometricFreyMazur.cm_commonStabilizer`, `TauCeti.GeometricFreyMazur.cm_sign`, `TauCeti.GeometricFreyMazur.cm_disjoint`, `TauCeti.GeometricFreyMazur.cm_liftIndependent`, `TauCeti.GeometricFreyMazur.cm_conjugateSecond`, `TauCeti.GeometricFreyMazur.cm_baseChange`.

Tests (3): `TauCeti.GeometricFreyMazur.cm_strata_test1`, `TauCeti.GeometricFreyMazur.cm_strata_test2`, `TauCeti.GeometricFreyMazur.cm_strata_test3`.

### GF.0/singular-bicusps

API (6): `TauCeti.GeometricFreyMazur.sbc_mem`, `TauCeti.GeometricFreyMazur.sbc_stabilizer`, `TauCeti.GeometricFreyMazur.sbc_diagonal`, `TauCeti.GeometricFreyMazur.sbc_action`, `TauCeti.GeometricFreyMazur.sbc_conjugate`, `TauCeti.GeometricFreyMazur.sbc_baseChange`.

Tests (3): `TauCeti.GeometricFreyMazur.singular_bicusps_test1`, `TauCeti.GeometricFreyMazur.singular_bicusps_test2`, `TauCeti.GeometricFreyMazur.singular_bicusps_test3`.

### GF.0/hecke-loci

API (6): `TauCeti.GeometricFreyMazur.hecke_mem`, `TauCeti.GeometricFreyMazur.hecke_one`, `TauCeti.GeometricFreyMazur.hecke_projectiveIndependent`, `TauCeti.GeometricFreyMazur.hecke_degree`, `TauCeti.GeometricFreyMazur.hecke_pullPush_degree`, `TauCeti.GeometricFreyMazur.hecke_baseChange`.

Tests (3): `TauCeti.GeometricFreyMazur.hecke_loci_test1`, `TauCeti.GeometricFreyMazur.hecke_loci_test2`, `TauCeti.GeometricFreyMazur.hecke_loci_test3`.

### GF.1/triangle-coordinates

API (6): `TauCeti.GeometricFreyMazur.triangleU_det`, `TauCeti.GeometricFreyMazur.triangleU_orders`, `TauCeti.GeometricFreyMazur.triangleU_fixedPoint`, `TauCeti.GeometricFreyMazur.triangleU_power`, `TauCeti.GeometricFreyMazur.triangleCoordinates_changeMarking`, `TauCeti.GeometricFreyMazur.triangleCoordinates_conjugate`.

Tests (3): `TauCeti.GeometricFreyMazur.triangle_coordinates_test1`, `TauCeti.GeometricFreyMazur.triangle_coordinates_test2`, `TauCeti.GeometricFreyMazur.triangle_coordinates_test3`.

### GF.3/conjugate-hecke

API (7): `TauCeti.GeometricFreyMazur.conjugateHecke_mem`, `TauCeti.GeometricFreyMazur.conjugateHecke_involutive`, `TauCeti.GeometricFreyMazur.conjugateHecke_tube`, `TauCeti.GeometricFreyMazur.conjugateHecke_repulsion`, `TauCeti.GeometricFreyMazur.conjugateHecke_degree`, `TauCeti.GeometricFreyMazur.conjugateHecke_realization`, `TauCeti.GeometricFreyMazur.conjugateHecke_negativeMatrix`.

Tests (3): `TauCeti.GeometricFreyMazur.conjugate_hecke_test1`, `TauCeti.GeometricFreyMazur.conjugate_hecke_test2`, `TauCeti.GeometricFreyMazur.conjugate_hecke_test3`.

### GF.4/big-diagonals

API (7): `TauCeti.GeometricFreyMazur.bigDiagonal_mem`, `TauCeti.GeometricFreyMazur.bigDiagonal_tube`, `TauCeti.GeometricFreyMazur.bigDiagonal_swap`, `TauCeti.GeometricFreyMazur.smallHecke_mem`, `TauCeti.GeometricFreyMazur.bigDiagonal_changeFrames`, `TauCeti.GeometricFreyMazur.bigDiagonal_baseChange`, `TauCeti.GeometricFreyMazur.smallConjugateHecke_mem`.

Tests (4): `TauCeti.GeometricFreyMazur.big_diagonals_test1`, `TauCeti.GeometricFreyMazur.big_diagonals_test2`, `TauCeti.GeometricFreyMazur.big_diagonals_test3`, `TauCeti.GeometricFreyMazur.small_conjugate_hecke_test`.

### GF.5/cusped-measure

API (6): `TauCeti.GeometricFreyMazur.cuspedMeasure_nonconstant`, `TauCeti.GeometricFreyMazur.cuspedMeasure_constant`, `TauCeti.GeometricFreyMazur.cuspedMeasure_add`, `TauCeti.GeometricFreyMazur.cuspedMeasure_total`, `TauCeti.GeometricFreyMazur.cuspedMeasure_positiveDifference`, `TauCeti.GeometricFreyMazur.cuspedMeasure_transport`.

Tests (3): `TauCeti.GeometricFreyMazur.cusped_measure_test1`, `TauCeti.GeometricFreyMazur.cusped_measure_test2`, `TauCeti.GeometricFreyMazur.cusped_measure_test3`.

### GF.6/surface-symmetric-power

API (6): `TauCeti.GeometricFreyMazur.surfaceSym_mk`, `TauCeti.GeometricFreyMazur.surfaceSym_eq`, `TauCeti.GeometricFreyMazur.surfaceSym_desc`, `TauCeti.GeometricFreyMazur.surfaceSym_cycleMap`, `TauCeti.GeometricFreyMazur.surfaceSym_pointSet`, `TauCeti.GeometricFreyMazur.surfaceSym_baseChange`.

Tests (3): `TauCeti.GeometricFreyMazur.surface_symmetric_power_test1`, `TauCeti.GeometricFreyMazur.surface_symmetric_power_test2`, `TauCeti.GeometricFreyMazur.surface_symmetric_power_test3`.

### GF.6/pencil-cycle-map

API (6): `TauCeti.GeometricFreyMazur.pencilCycle_fibre`, `TauCeti.GeometricFreyMazur.pencilCycle_nonconstant`, `TauCeti.GeometricFreyMazur.pencilCycle_degreeOne`, `TauCeti.GeometricFreyMazur.pencilCycle_changeBasis`, `TauCeti.GeometricFreyMazur.pencilCycle_baseChange`, `TauCeti.GeometricFreyMazur.pencilCycle_Sym`.

Tests (3): `TauCeti.GeometricFreyMazur.pencil_cycle_map_test1`, `TauCeti.GeometricFreyMazur.pencil_cycle_map_test2`, `TauCeti.GeometricFreyMazur.pencil_cycle_map_test3`.

### GF.6/normalized-pullback

API (6): `TauCeti.GeometricFreyMazur.pullbackCurve_maps`, `TauCeti.GeometricFreyMazur.pullbackCurve_stabilizer`, `TauCeti.GeometricFreyMazur.pullbackCurve_quotient`, `TauCeti.GeometricFreyMazur.pullbackCurve_changeComponent`, `TauCeti.GeometricFreyMazur.pullbackCurve_finite`, `TauCeti.GeometricFreyMazur.pullbackCurve_baseChange`.

Tests (3): `TauCeti.GeometricFreyMazur.normalized_pullback_test1`, `TauCeti.GeometricFreyMazur.normalized_pullback_test2`, `TauCeti.GeometricFreyMazur.normalized_pullback_test3`.

### GF.9/actual-torsion-classifying-map

API (6): `TauCeti.GeometricFreyMazur.torsionClassifyingMap_mk`, `TauCeti.GeometricFreyMazur.torsionClassifyingMap_eval`, `TauCeti.GeometricFreyMazur.torsionClassifyingMap_frameIndependent`, `TauCeti.GeometricFreyMazur.torsionClassifyingMap_multiplier`, `TauCeti.GeometricFreyMazur.torsionClassifyingMap_nonconstant`, `TauCeti.GeometricFreyMazur.torsionClassifyingMap_baseChange`.

Tests (3): `TauCeti.GeometricFreyMazur.actual_torsion_classifying_map_test1`, `TauCeti.GeometricFreyMazur.actual_torsion_classifying_map_test2`, `TauCeti.GeometricFreyMazur.actual_torsion_classifying_map_test3`.

### GF.10/quotient-resolution

API (6): `TauCeti.GeometricFreyMazur.quotientResolution_morphism`, `TauCeti.GeometricFreyMazur.quotientResolution_localType`, `TauCeti.GeometricFreyMazur.quotientResolution_exceptional`, `TauCeti.GeometricFreyMazur.knownCurve_mem`, `TauCeti.GeometricFreyMazur.knownCurve_pushforward`, `TauCeti.GeometricFreyMazur.knownCurve_baseChange`.

Tests (3): `TauCeti.GeometricFreyMazur.quotient_resolution_test1`, `TauCeti.GeometricFreyMazur.quotient_resolution_test2`, `TauCeti.GeometricFreyMazur.quotient_resolution_test3`.

The alias suggested file checks native PGL scalar classes, cyclic degree 6 versus
full degree 7 at m=4, both accepted witness residue classes (p=7,11), determinant
sign under negation, the Eisenstein polynomial, parameter-exponent signs, the
cusped-area ratio at p=7, repeated symmetric-power points, functorial mapping,
the negative Hurwitz term, 7/800, and separation of signs. These are anonymous
acceptance examples, not replacements for the forty owner definition tests.

For the area example the effective index is p(p²−1)/2, the cusp count is
s=(p²−1)/2, and 2g−2=(p²−1)(p−6)/12. Thus s/(2g−2)=6/(p−6), and
Area(Y)/Area(X)=1+6/(p−6). At p=7, g=3 and s=24 give ratio 7. The uniform
O(p⁻¹) assertion does not mean this ratio is already close to one at p=7.
The owner's normalized-area contract is GF.5/cusped-measure; BT16 Lemma 28, p.738.

## Complete target and planet inventory

The table includes every owner target, even when a bridge is absent from the direct
extraction map. The canonical packet retains its internal dependency graph. A dash
means there is no planet attached to that node; it does not suggest a new planet.

| Owner node (GeometricFreyMazur:) | Kind | Existing planet |
| --- | --- | --- |
| `GF.0/projective-frames` | comparison | — |
| `GF.0/diagonal-quotient` | construction | Diagonal quotient surface |
| `GF.0/cm-strata` | definition | Heegner CM points |
| `GF.0/singular-bicusps` | definition | Singular bicusps |
| `GF.0/quotient-branch-locus` | theorem | Quotient branch locus |
| `GF.0/hecke-loci` | construction | Cyclic Hecke curves |
| `GF.1/triangle-uniformization` | theorem | Compact triangle uniformization |
| `GF.1/triangle-coordinates` | construction | Triangle coordinates |
| `GF.1/surviving-systolic-witness` | theorem | Surviving systolic witness |
| `GF.1/cusped-systole` | theorem | Cusped systole |
| `GF.1/cusp-separation` | theorem | — |
| `GF.1/metric-comparison` | theorem | — |
| `GF.1/compact-injectivity-radius` | theorem | Compact injectivity radius |
| `GF.1/cusp-coordinates` | theorem | — |
| `GF.2/height-adapter` | comparison | — |
| `GF.2/short-elliptic-displacement` | theorem | Small-height lifts |
| `GF.2/cusp-lift-height` | theorem | Cusp height bound |
| `GF.2/cusp-double-coset` | theorem | — |
| `GF.2/cusp-unique-lift` | theorem | Unique cusp lift |
| `GF.2/cusp-lens` | theorem | Cusp lens bound |
| `GF.2/cusp-ball-count` | theorem | Cusp overlap count |
| `GF.3/small-height-reconstruction` | theorem | Small-height reconstruction |
| `GF.3/cm-centralizer` | theorem | Heegner centralizer bound |
| `GF.3/heegner-repulsion` | theorem | Heegner repulsion |
| `GF.3/conjugate-hecke` | definition | Conjugate Hecke loci |
| `GF.3/hecke-avoids-anti` | theorem | — |
| `GF.3/three-bicusp-repulsion` | theorem | Three-bicusp repulsion |
| `GF.4/big-diagonals` | definition | Big diagonals |
| `GF.4/quadratic-centralizer-count` | theorem | Quadratic centralizer count |
| `GF.4/diagonal-overlap` | theorem | Diagonal-overlap dichotomy |
| `GF.4/bicusp-rotation-count` | theorem | Cusp-rotation overlap |
| `GF.5/degree-conventions` | comparison | — |
| `GF.5/heegner-multiplicity` | theorem | Heegner multiplicity bound |
| `GF.5/anti-heegner-multiplicity` | theorem | Anti-Heegner multiplicity bound |
| `GF.5/bicusp-multiplicity` | theorem | Singular-bicusp multiplicity bound |
| `GF.5/cusped-measure` | construction | Cusped-volume measure |
| `GF.5/cusped-volume-error` | theorem | — |
| `GF.5/hecke-tube-comparison` | theorem | — |
| `GF.5/big-diagonal-multiplicity` | theorem | Big-diagonal multiplicity bound |
| `GF.6/surface-symmetric-power` | construction | Surface symmetric powers |
| `GF.6/image-normalization` | application | — |
| `GF.6/pencil-cycle-map` | construction | Gonality-pencil cycle map |
| `GF.6/normalized-pullback` | construction | Normalized wreath pullback |
| `GF.6/projection-cycles` | theorem | Weighted projection cycles |
| `GF.7/ramification-support` | theorem | Wreath ramification support |
| `GF.7/local-indices` | theorem | Linear cusp inertia bound |
| `GF.7/ramification-decay` | theorem | Ramification decay |
| `GF.7/hurwitz-contradiction` | theorem | Hurwitz contradiction |
| `GF.7/complex-geometric-rigidity` | theorem | Bounded-gonality rigidity |
| `GF.8/modular-gonality` | theorem | Modular gonality lower bound |
| `GF.8/proper-subgroup-index` | theorem | Growing proper-subgroup index |
| `GF.8/full-linear-monodromy` | theorem | Full linear monodromy |
| `GF.8/no-quadratic-self-twist` | theorem | No quadratic self-twist |
| `GF.9/actual-torsion-classifying-map` | construction | Actual-torsion classifying map |
| `GF.9/nonisotrivial-hom-lattice` | application | — |
| `GF.9/geometric-prime-to-p-isogeny` | theorem | — |
| `GF.9/actual-linear-descent` | theorem | Actual-torsion isogeny descent |
| `GF.9/extend-isogeny-over-base` | theorem | Isogeny over the original base |
| `GF.9/characteristic-zero-spread` | theorem | Characteristic-zero rigidity |
| `GF.9/characteristic-zero-monodromy` | theorem | — |
| `GF.9/geometric-frey-mazur` | theorem | Geometric Frey–Mazur theorem |
| `GF.9/function-field-form` | theorem | Function-field Frey–Mazur |
| `GF.10/bounded-genus` | theorem | Bounded-genus rigidity |
| `GF.10/rational-elliptic-curves` | theorem | Rational and elliptic Hecke curves |
| `GF.10/quotient-resolution` | construction | Known curves on the resolution |
| `GF.10/known-rational-curves` | theorem | All rational curves are known |
| `GF.10/known-curve-minimal-model` | theorem | Known-curve minimal model |

## Inherited obligations

The packet snapshots all eleven owner coverage records and all nineteen open
supplier requests in `inheritedObligations`. It creates no alias request or gap.
An empty new-gap list is not a claim that the imported mathematics is proved.
The following lists the same nineteen contracts by supplier; exact consuming node
IDs and full requested statements remain in that snapshot and the owner packet.

| Supplier | Retained contract |
| --- | --- |
| HyperbolicCurveVolumesAndGonality HV.4 | Relative point-ball area bound V(r)≤C_n(1+r)e^(r−R)V(R), including weights and the quotient injectivity range; false monotonicity of V/a is excluded. |
| HyperbolicCurveVolumesAndGonality HV.6 | Gonality cannot increase on the target of a nonconstant finite map of smooth proper curves, using norm-pushforward of pencils. |
| HyperbolicCurveVolumesAndGonality HV.0 | Half-plane trace/translation, triangle and rotation identities in curvature −1. |
| SchemeAndStackFoundations SF.1 | Free-locus étaleness of finite quotients and relative finite-flat cycle maps; retain the already stated upstream projectivity interface. |
| SchemeAndStackFoundations SF.4 | Cyclic-quotient resolution and Castelnuovo contraction with projectivity and Picard-number termination; the dedicated surface continuation remains proposed. |
| SchemeAndStackFoundations SF.5 | Hirzebruch–Jung self-intersections and the contraction update C_new²=C_old²+(C_old·E)². |
| ModularCurves §2C | Factorisation dual compositions equal multiplication by the constant isogeny degree. |
| AlgebraicCurves Layer 12 | Proper smooth models/normalization plus extension and normalized-image genus; analytic comparison stays with ComplexComparisonPartII. |
| AlgebraicCurves Layer 7 | Curve Riemann–Hurwitz through the function-field dictionary in characteristic zero. |
| FuchsianOrbifolds Layer 0 | Effective projective action and finite cyclic stabilizers. |
| FuchsianOrbifolds Layer 1 | Elliptic quotient charts and faithful tangent action of finite curve inertia. |
| FuchsianOrbifolds Layer 2 | Triangle presentations/discreteness and area π[PSL₂(Z):Γ]/3. |
| FuchsianOrbifolds Layer 3 | Width-normalized cusp q-coordinates and q↦q^e cusp covers. |
| FuchsianOrbifolds Layer 4 | Compactified quotients and cusp ramification; GF.1 proves the required torsion-freeness. |
| FuchsianOrbifolds Layer 5 | Finite holomorphic degree, local multiplicity and branched-cover Euler characteristic. |
| ModularCurves §0D | Field finite-étale/Galois equivalence with module maps and pairings. |
| ModularCurves §0E | Effective descent/spreading with smooth connected shrinking and agreement loci. |
| ModularCurves §5B | Actual ordered torsion bases, fixed pairing and determinant action. |
| ModularCurves §5C | Twisted curves representing actual pairing-preserving torsion data. |

The parent inputs remain ModularCurvesPartII R12 (uniformization/comparison), R13
(projective levels and boundary charts) and R14.1 (compactified cyclic Hecke boundary
and degree). The accepted owner cites exact supplier nodes where available rather
than bare stages. Its IG, NéronModels, AbelianSchemesAndArithmeticModuli and
ComplexComparisonPartII dependencies retain their own recorded gaps; none is
silently discharged by this alias or by compiling its native examples.

The twenty-one existing source findings E1–E10 and E12–E22 remain with the owner.
The packet references their IDs and locators without copying their source passages
or claiming a new independent errata verdict. This import uses their accepted
corrections, including the killed witness, signed reconstruction, rotation bound,
qualified diagonal estimate, point-ball bridge and erratum cusp-overlap correction.

## Sources, baseline and current-library boundary

Sources were accessed on 2026-10-19. Statements above are in our own words. No book
is needed for this import audit. The owner's Néron extension remains its existing
supplier/source contract; this worker does not claim to have re-read its BLR source.

- **BT16**: Benjamin Bakker and Jacob Tsimerman, [p-torsion monodromy representations of elliptic curves over geometric function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf). Annals of Mathematics 184 (2016), no. 3, 709–744; published version. Read: Entire published article, §§1–7, pp.709–744, read to match the routed targets; no source excerpt is retained. SHA-256: `814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a`.

- **BTE**: Benjamin Bakker and Jacob Tsimerman, [Erratum to p-torsion monodromy representations of elliptic curves over geometric function fields](https://benjamin-bakker.github.io/P.torsion.erratum.pdf). Five-page author erratum, including Propositions 2.1, 3.1, 4.1, 4.2. Read: Entire five-page author erratum, §§1–5, including Propositions 2.1, 3.1, 4.1 and 4.2. SHA-256: `db8effa1d3ef6a96c843e8ffad085a0ad03cd86a486f5e6cc3956bd14352acc1`.

- **ABR96**: Dan Abramovich, [A linear lower bound on the gonality of modular curves](https://arxiv.org/pdf/alg-geom/9609012). Author preprint alg-geom/9609012, corresponding to IMRN 1996, 1005–1011; locators below use the five-page preprint. Read: Theorem 0.1 and §§1.1–1.7, pp.1–3 of the five-page author preprint. SHA-256: `5ff2134fbfb6bd702fa7051637027405c8e0d77a595830a63e8ad36f50791779`.

The eleven native baseline declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`: PGL and its scalar equality criterion,
PSL, the entrywise matrix norm and entry bound, subgroup index, Sym and its map and
composition law, SL₂ perfectness, and transvection generation. The Tau Ceti build
source was byte-compared with its pinned blob. Index uses Nat.card of the quotient
(infinite index is zero); only finite groups are used here. Sym is a multiset
carrier of fixed cardinality, not a scheme symmetric power. SL₂ perfectness requires
a≠0 and a²≠1, available over F_p for p>3. Native carriers are reused, not redefined.

Read-only current-library inspection used TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The FuchsianOrbifolds and
ConformalMapping readers were read in full, plus ModularCurves §§0D,0E,2C,5B,5C and their
suggested interfaces. Whole-word searches for Frey–Mazur, gonality and systole in
both current trees found no new owner of the route-specific rigidity or repulsion
claims. Reviewed library-coverage boundaries were checked for R12.2, R13.4a, R14.1,
parent level/Galois inputs and curve/area comparisons. Existing roadmap targets are
imports, including the roadmaps absent from the older atlas snapshot. This bounded
search is not a fresh theorem-completeness audit of either current library.

## Proposed merger and validation

Keep GeometricFreyMazur and all of its identifiers. Map alias GF.n to owner GF.n
for n=0,…,10. After checking incoming links and queue routes, the maintainer can
retire the alias's roadmap, packet, reader and suggested file. Preserve every
open obligation, implementation status and source exclusion. This proposal has
not been applied; no owner file, queue, atlas data or upstream file is edited.

The suggested file uses only available carriers and anonymous proved examples.
The finite-characteristic sign checks distinguish −x from x for nonzero x in F₇
and exhibit −1=1 in F₂, where the odd-prime descent argument fails. No heavy
structure stores a desired theorem as a field, and there are no admitted data
definitions. Compiling this index does not verify the canonical prototype or
close its geometric targets. Exact validation commands and results are recorded in
the [design handoff](../handoff/DESIGN-ModularCurvesPartIII.md) and the
[independent review](../reviews/REV-DESIGN-ModularCurvesPartIII.md).
