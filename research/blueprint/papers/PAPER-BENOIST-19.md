# Benoist (2019): the period-index problem for real surfaces, extraction and routing

Issue [#1454](https://github.com/CBirkbeck/tauceti-explorer/issues/1454). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoints, whose report follows below as history.
- **The paper.** O. Benoist, *The period-index problem for real surfaces*, Publ. Math. IHÉS 130 (2019), 63–110.
  - The published Numdam PDF was re-fetched; its SHA-256 (8dfc0f22…) matches the checkpoint.
- **Items.** The result has **187 items: 13 library, 13 planned and 161 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Nineteen are recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**New items.** Conjectures 0.9 (Lang) and 0.11 (Pfister) were only in a side list. They are now statement-only items 186 and 187.

**E3 and E4 now affect a stated result.**
- **The failing step.** In the proof of Proposition 4.4 (p. 84), the degree-one term gives [ζ]_1 = [α̃]_0·[e]_1 on Ψ, not [e]_1.
- **Why it fails.** [α̃]_0 is α|_x, which is 0 on Ξ and 1 on Ψ∖Ξ. So Propositions 4.4, 4.5 and 6.6 are not established as stated when Ξ ≠ ∅ and Ψ ≠ Ξ.
- **Why the main theorems are unaffected.** They use these propositions only through Proposition 6.7. That proposition takes Ψ = Θ = {x : α|_x = 0}, where the evaluation of the lift of (n/2)α is identically 0. This is the uniform case the checkpoint repairs, so Theorems 0.3–0.5, 0.10 and 0.12 are unaffected, up to the cited Jannsen lemma.

**Reclassified to affect nothing.** E6, E11, E12, E16 and E18. Each is a sign, degree, twist or "cokernel" slip whose intended form is fixed by the displayed conventions or the cited source.

**Gaps.** The gap statuses are normalized.
- G2, G4, G5, G7, G8 and G12 are resolved.
- G1, G4a, G4b, G6 and G9 are recorded as findings.
- G10 (Jannsen's lemma) and G11 are deferred as cited suppliers' proofs.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.
- The one open mathematical gap does not reach the main theorems.

## Mistakes found (`sourceIssues`)

- **E1** (error; affects a stated result), Published §3.1 p.76. *Printed:* finite double cover *Correction:* The projective equation gives a proper generically degree-two map, finite flat on S0; introduce its finite Stein model separately. The explicit model and resolution are now174–185. The same finite-cover wording on p86 must refer only to the finite model or to the complement of the exceptional set, not to the full pullback of the auxiliary curve.
- **E2** (gap; affects the proof), Lemma1.4 p.70. *Printed:* p*p*α̃ *Correction:* Choose beta compatibly so beta modulo n equals p*aTilde before taking its trace.
- **E3** (gap; affects a stated result), Proposition4.4 p.84, after(4.8). *Printed:* ([ζ]₁)|Ψ=([e]₁)|Ψ *Correction:* The displayed computation gives [zeta]_1=[aTilde]_0[e]_1. The uniform case is repaired by item162; the general case remains G4a.
- **E4** (gap; affects a stated result), Proposition4.5 pp.84–85. *Printed:* β|TU=p*α̃+2ε+cl(ϕ) *Correction:* Supply a typed replacement. Items158–165 do so under uniform evaluation; do not assume aTilde has an integral lift on U.
- **E5** (gap; affects the proof), Proposition4.5 p.85, application of Assumption4.1(ii). *Printed:* δ−cl(θ₂) *Correction:* Subtract an additional Picard class nu made from the allowed curves before applying Proposition3.3; include2nu in the final theta.
- **E6** (misprint; affects nothing), Lemma7.3 p.98 and equation(7.13) p.103. *Printed:* p*η+ψ(ζ) *Correction:* Use p*eta-psi(zeta) with the displayed(1,-phi) convention; the traced equations are unchanged.
- **E7** (gap; affects the proof), Proof of Lemma7.3 p.99. *Printed:* Q→j*j*Q *Correction:* Use injectivity of the TARGET p_*(Z/n)→j_*j*p_*(Z/n). Item157 proves it in this setting.
- **E8** (gap; affects the proof), Proposition6.7 statement and proof p.95. *Printed:* n/2 *Correction:* Separate the odd case from the half-period hypothesis; initially conclude the restricted period divides n/2.
- **E9** (gap; affects the proof), Proof of Theorem0.12 p.95. *Printed:* K=∪iKi *Correction:* Include a transcendence basis of K/R in K0 before expressing K as the union of finite extensions of K0.
- **E10** (gap; affects the proof), Proof of Theorem0.13 p.96. *Printed:* not proportional *Correction:* Choose local parameters jointly so det(dy1,dy2) is nonzero, after restricting to a smooth point.
- **E11** (misprint; affects nothing), Equation(2.1) p.72. *Printed:* M(−k) *Correction:* Use coefficient M(dprime-d) in the source of the Gysin map.
- **E12** (misprint; affects nothing), Equation(5.7) p.88. *Printed:* H⁰(C,N_C/T) *Correction:* The normal-sequence boundary lands in H¹(C,N_C/T).
- **E13** (gap; affects the proof), Proof of Proposition0.7 p.108. *Printed:* (0:−1:1:1) *Correction:* Use general real points of the divisor u=0 away from zeros and poles, with the required sign, and justify simultaneous specialization.
- **E14** (misprint; affects nothing), Proof of Proposition0.7 p.107. *Printed:* Br(R(S)) *Correction:* Use Br(K(S)), for the real Puiseux field K defined in this proof.
- **E15** (misprint; affects nothing), Proof of Theorem0.6 p.107. *Printed:* unique δ *Correction:* Say unique NONZERO delta with component0 zero, as in the preceding paragraph on p.106.
- **E16** (misprint; affects nothing), Proof of Proposition7.1 p.103, following(7.14). *Printed:* kernel *Correction:* Use torsion-freeness of the cokernel of the Picard cycle map.
- **E17** (misprint; affects nothing), Proof of Theorem1.5 p.71. *Printed:* n=dl *Correction:* Distinguish Voisin’s hypersurface-degree parameter from the period n; substitute m=dn for surfaces in |dnH|.
- **E18** (misprint; affects nothing), Published §3.1 p77 first line; author-copy p15 has the same wording. *Printed:* v *Correction:* The fixed singular points over Sing R are where w vanishes, with v nonzero.
- **E19** (misprint; affects nothing), Published(5.5) p87, with the normalization fixed in §5.1 p86. *Printed:* rg *Correction:* The restriction coefficient is sqrt(a1)rg before rescaling g by the nonzero scalar sqrt(a1).

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G1** (recorded). E1 records the non-finite map; the checkpoint supplies the finite rank-two model and audits the later uses.
- **G2** (resolved). Choose β with β mod n = p*α̃ first, as Lemma 1.3 allows (E2).
- **G4a** (recorded). E3, now affecting Propositions 4.4, 4.5 and 6.6 as stated. The uniform case, which is all the main theorems use, is repaired.
- **G4b** (recorded). E4, as for G4a.
- **G4** (resolved). The sign (E6) and the target-restriction argument (E7, item 157) are supplied.
- **G5** (resolved). The odd case is separate. The restricted period divides n/2 and is at least n/2 by corestriction, so it equals n/2 (E8).
- **G6** (recorded). E9 and E10 record the two small proof completions.
- **G7** (resolved). E11: the coefficient is M(d′−d), as in the cited BW1 (1.22).
- **G8** (resolved). E12: the boundary lands in H¹(C, N_C/T), as in the cited Benoist 2018.
- **G9** (recorded). E13 records the generic-point repair.
- **G10** (deferred). Jannsen's lemma is a cited supplier's proof; the Springer chapter is not openly available.
- **G11** (deferred). The transitive closure of cited proof interiors is supplier and design work.
- **G12** (resolved). Item 157 supplies the target-sheaf argument (E7).

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of E3, E4, E6, E11, E12, E16 or E18, or the earlier gap statuses, this continuation supersedes it.

## Benoist: the period-index problem for real surfaces

Status: **partial**. This continuation of [PR2016](https://github.com/CBirkbeck/tauceti-explorer/pull/2016) supplies the finite double cover, its partial and full resolutions, the corrected fixed ambient blowup centres, and the function restriction used in the Noether–Lefschetz argument. It preserves the earlier conditional uniform-evaluation repair. The exact Jannsen comparison, general nonconstant-evaluation arguments and transitive prerequisites remain open.

### Sources and scope

The primary source is [the published article](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf), Publications Mathématiques de l’IHÉS 130 (2019), pp.63–110, DOI 10.1007/s10240-019-00108-7. Its SHA-256 is `8dfc0f221ab510ba1ecfe7c5b5fde12c217019f33d704ea89ce1a0c144398d3b`. PR2016 read all 48 pages and supplied the earlier image checks. This continuation freshly read published pp.76–80 and 85–87, inspected the images of pp.76–77, and compared author-copy p.15. The [author copy](https://www.math.ens.psl.eu/~benoist/articles/realperiodindex.pdf) has SHA-256 `e4c90a314c6d9ea38d3bd8498a6ec050aa763c4150890c98cc295390ef4ece2a`. These are targeted new checks, not a new full reading of every version.

Fresh foundational reading covers the statements and displayed proofs of Stacks [03H0](https://stacks.math.columbia.edu/tag/03H0), [03H2](https://stacks.math.columbia.edu/tag/03H2), [0AY8](https://stacks.math.columbia.edu/tag/0AY8) and [031S](https://stacks.math.columbia.edu/tag/031S). Their transitive references were not all read. The distinction between Noetherian finite Stein factorization and the general integral factorization is retained. The normal-target pushforward criterion is used with its reducedness and generic-point hypotheses. Hypersurface Cohen–Macaulayness remains an explicit shared supplier.

The prior targeted [Benoist–Wittenberg I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf) reading on pp.16–19 and 39–40, including the full proof of Proposition 2.9, remains attributed to PR2016. Other prerequisite readings retain their original attribution in the source ledger. Unread proof interiors are not certified here.

The inventory preserves all 167 previous IDs and adds 168–185: **185 items, 13 library, 13 planned, 159 missing**. Every missing item has exactly one route. All 69 definitions/constructions have API outlines and at least three proposed tests. Ten have structured contracts (28 named entries in total); 59 retain compact legacy outlines. There are 207 proposed tests, 132 internal and 14 external explicit dependency edges, 10 routes and 19 source findings. The dependency graph covers the stated edges, not every premise of the old proof outlines.

### What the paper establishes

The paper proves period equals index for real-surface Brauer classes that evaluate trivially at every real point. For an unramified class on a smooth projective real surface, it identifies a precise obstruction in the first real component of a mod-2 Kummer lift. It also treats real Enriques surfaces, the Elman–Lam u-invariant in transcendence degree two, and a non-archimedean real-closed counterexample. Its complex comparison argument uses moving hypersurfaces, integral cohomology and a Noether–Lefschetz cone.

The inventory includes the field Brauer arithmetic, all numbered main-paper results, the real-locus and trace constructions, the double-cover geometry, the Hodge variation argument, and the principal external inputs. G11 remains because several original prerequisite proofs have not yet been read to declaration-level closure; those may expose further intermediate objects.

### A typed repair sufficient for the main induction

Use the paper’s Assumptions3.1 and4.1. Write a for its period-two class, aTilde for a Kummer lift, and Psi for the avoided clopen real subset. Assume the first component of aTilde is zero on Psi and its zeroth component there is one constant t, either0 or1. The double cover is etale over Psi and has no real point above it.

First, the computation in Proposition4.4 gives the first component of the boundary class as t times the first component of the covering class. Multiply the Picard correction in the replacement preceding(4.6) by t. The two contributions then cancel. This repairs the component calculation and the remainder of its diagram chase, **conditional on the exact Jannsen comparison in item149**. It does not establish that unread comparison. This is item162.

The correction of Proposition4.5 uses the later trace quotient and has no circular dependence on the splitting theorem:

1. Restrict to U0, obtained by removing finitely many bad points, so that the cover is finite flat with smooth branch. An integral Brauer lift beta upstairs witnesses vanishing of the pulled-back Kummer Bockstein. The proof of Lemma7.2 requires only this vanishing, not full splitting of the Brauer class.
2. The exact trace sequence supplies integral classes eta and zeta with aTilde equal to the reduction of eta minus phi(zeta). Define the integral class b upstairs by subtracting psi(zeta) from the pullback of eta. Its reduction is the pulled-back Kummer class, and its trace is twice eta. No integral lift of aTilde on U0 is assumed.
3. Write beta restricted upstairs as b plus twice gamma0 plus the cycle class of phi0. Globally write the trace of beta as twice delta plus the cycle class of theta1. Subtraction gives twice the discrepancy between delta, eta and the trace of gamma0 as a Picard class. Torsion-freeness of the Picard cokernel divides that equation and supplies a line bundle mu, extended to S.
4. Over Psi, the quotient Q is the sign local system of the double cover. Its twist Q(1) has trivial stabilizer action, while its ordinary monodromy may remain nontrivial. Formula(2.12), equivalently BW1(1.33), gives the first component of phi(zeta) as the twisted Bockstein of t. This is t times the first component of the cover class, hence t times the real cycle class of a line bundle lambda. The integral class eta has zeroth component zero. These identities give the same first component for eta.
5. There are no real preimages over Psi, so the trace of gamma0 has zero first component there. Thus delta minus the cycle class of mu+t lambda has first component zero on Psi. Injection on H1 after deleting finitely many real points justifies extending the comparison from U0.
6. Assumption4.1(ii) supplies an **additional** curve class nu. Subtracting it makes this integral class a pushforward, by Proposition3.3. The final Picard correction is theta1+2mu+2t lambda+2nu. The nu term cannot be dropped merely because the restriction to Psi vanishes.

Items158–165 separate these interfaces and preserve the choice dependence of eta, zeta and the Picard extensions. Item166 uses them in the existing geometric/Hodge proof of Proposition6.6, with the added uniform-evaluation hypothesis. It uses the finite-model normalization supplied below; G10 and the shared/transitive inputs in G11 remain open.

For the main induction, let alpha have even period n and put a=(n/2)alpha and Psi=Theta(alpha). Evaluation in Br(R)=Z/2 shows that t is n/2 modulo2. Consequently t=1 when n is2 modulo4, but t=0 when n is divisible by4. In the latter case Theta(a) is empty even when Psi is nonempty. The earlier handoff’s identification of these loci was too strong. Item167 records the exact distinction, and the repaired main branch uses item166 in both cases. The odd-period branch has no half-period hypothesis. After quadratic splitting, the restricted period initially only divides n/2; period-index and extension divisibility finish the induction.

For a general nonconstant evaluation function on Psi, the product of that function with a global real Picard class need not have been shown algebraic. Thus unrestricted items66,67,85 retain their original proof gates. The new main branch avoids these items; it does not silently certify them.

### Coefficient signs and library reuse

The pinned Mathlib commit is `082e2d37e8b0463410cdb532e111cd43d5a66174`, and the Tau Ceti commit is `f790474821cf4256814db967cb154e7af3d0c369`. Mathlib already contains the finite cyclic projective resolution, its periodic cochain comparison and the odd/positive-even cohomology formulas. Their actual declaration statements were inspected. These are library items152–154, not a new resolution project.

Mathlib uses the first differential sigma-minus-identity, whereas the source uses its negative. Item155 gives the explicit degreewise sign isomorphism. For even n, the induced reduction on the twisted cyclic cohomology groups is identity in degree1 and multiplication by n/2 modulo2 in degree2. This is item156. It proves the degree-one property used in Lemma7.5 without declaring its circle extension split.

**A previous suspected error is withdrawn:** visual inspection of p.100 shows that the disputed labels denote the diagonal projections. They are not labels of the horizontal coefficient-reduction arrows. This is an extracting-worker reassessment, not an independent review verdict.

With the quotient convention of(7.2), Lemma7.3 and its application in(7.13) require subtraction of the psi term. Its trace is zero, so the subsequent traced equations and final mod-2 correction are unchanged. Equality of the sheaf maps over the etale locus extends using the restriction monomorphism on their **target**. Item157 obtains that property by applying pushforward to the locally constant coefficient extension on the smooth source; it does not assume finiteness over exceptional fibres.

### The finite cover and its resolutions

Let S be a smooth surface over a characteristic-zero field, R an SNC divisor with section r, and s a section of L²(R). Assume its zero divisor D is smooth, transverse to R and avoids Sing R. Set M=L(R). Then rs is a section of M² and determines

    C = Spec_S(O_S ⊕ M⁻¹), locally z² = rs.

Multiplication on the second summand is contraction with rs. This is finite locally free of rank two, including over the branch. At a smooth branch point its fibre has length two with one geometric point. The cover is étale off R∪D. Items 168–169 reuse Mathlib’s quadratic algebra, basis, root relation, trace, norm, determinant comparison and discriminant. Item 174 glues this particular algebra through the shared relative-Spec and line-bundle suppliers; it does not propose another general quadratic algebra.

The projective hypersurface Tbar defined by rv²=sw² maps properly to C. On w≠0 put x=v/w and z=rx; on v≠0 put y=w/v and z=sy. These expressions agree since xy=1 and rx²=s. The inverses are [v:w]=[z:r] when r is invertible and [s:z] when s is invertible. Thus Tbar→C is an isomorphism off R∩D, including near Sing R.

At R∩D the two charts of Tbar are

    U: s=rx², z=rx, with coordinates (r,x);
    V: r=sy², z=sy, with coordinates (s,y).

They glue by y=x⁻¹ and s=rx². Both are smooth; their exceptional curve is P1 and its normal bundle is O(−2). They are the Rees charts of the blowup of (r,z) in the node rs=z². The Rees construction requires cancellation: the unsaturated relation r(rx²−s)=0 would add a false component.

At Sing R, s is a unit, so rv²=sw² forces **w=0**, with v nonzero. Locally the remaining singularity is uv=y² after absorbing a unit into one parameter. These ambient points are independent of s. The published p.77 phrase using v therefore has the wrong coordinate; the author copy has the same wording. Blowing up these points resolves the remaining nodes. The vertex blowup of uv=z² has charts v=u a², z=u a and u=v b², z=v b. The z-chart has UV=1 and is contained in their union. Its exceptional conic UV=Z² is split P1 via [a:b]↦[a²:b²:ab], over the ground field. These formulas persist under the étale base changes used here.

The finite model is normal: it is a hypersurface, hence S2 by the shared complete-intersection theorem; away from the crossing points it is regular, giving R1. Apply Serre’s criterion. Normality does not force connectedness or integrality when the branch is empty. The proper birational normal-target theorem is applied componentwise.

Consequently the smooth resolution T factors through C and

    p_*O_T = O_S ⊕ L⁻¹(−R),    C = Spec_S(p_*O_T).

The same structure-sheaf identity holds for Tbar. The maps from T and Tbar to C have geometrically connected fibres. This identifies the finite Stein model without asserting that p itself is finite. For Delta=R∪D, the restriction over S0=S minus Sing Delta is finite flat of rank two, and over S*=S minus Delta it is finite étale of degree two. Over a geometric crossing point the resolved fibre is P1.

The fixed ambient blowup is at w=0 above Sing R. The strict transforms form a smooth projective family over the paper’s open parameter set B: the node charts verify relative smoothness at those centres, and the relative Jacobian criterion applies elsewhere. The moving R∩D loci already lie in the smooth part of each Tbar and need no additional ambient blowup centres.

### The local cohomology calculation

Item 185 also supplies the function identity and higher-direct-image vanishing directly. In the above resolution, the overlap has ring k[r,x,x⁻¹]. The U ring has monomials r^i x^j with i,j≥0. The V ring has i≥0 and j≤2i. Every overlap monomial lies in one image: use U for j≥0 and V for j<0. Therefore the degree-one Čech cokernel vanishes; higher cohomology vanishes for this two-affine cover with affine intersection.

Their intersection consists of 0≤j≤2i. Write j=2b+c with c either 0 or 1. Then

    r^i x^j = r^(i−b−c) (rx)^c (rx²)^b.

The exponent is nonnegative. These distinct normal forms identify the intersection with k[r,z,s]/(z²−rs). Localization and flat base change of the exact Čech complex give h_*O=O and R^i h_*O=0 for i>0 on the étale node charts. The shared quasi-coherent cohomology and base-change interfaces remain supplier obligations in SF.2. This proves the local calculation for these split nodes; it does not claim a general rational-singularity theorem.

### The auxiliary curve and later uses of finiteness

In §5.1 let C0 meet R transversely away from Sing R and let g have zeros disjoint from R, with s|C0=a1*r*g² and a1>0. The two graph sections [v:w]=[±sqrt(a1)g:1] are closed curves isomorphic to C0, avoiding the fixed singular centres. They lift unchanged to T. They meet where g=0; over R∩C0 they give distinct points on the exceptional P1. The full inverse image of C0 also contains those exceptional P1 fibres. Thus the two graph curves are strict-transform components, not the entire inverse image of a finite map.

The nonvanishing tautological w identifies its line bundle on the lifted curve with L|C0. On the plus graph the trace-zero root restricts to sqrt(a1)rg. Hence the map in (5.5) is

    O_S ⊕ L⁻¹(−R) → O_C0,    (a,b) ↦ a + sqrt(a1)rg b.

Its kernel is p_*O_T(−C0). This follows from left exactness of pushforward for the proper map; finiteness is unnecessary. Rescaling g by sqrt(a1) restores the printed coefficient rg and leaves the later injectivity argument unchanged. The scalar discrepancy is a harmless normalization issue, recorded as E19.

The audit of later consumers retains the finite-flat or étale restrictions explicitly named in §§3.2–3.3 and the p.98 Leray argument. Proper Gysin maps and exceptional support sequences are used on the full surfaces. The p.87 rational-node step uses the local calculation above. The p.97 alternating normal cover is a separate finite cover; it is not identified with Tbar.

### Routing and ownership

The current catalogue snapshot is `e238ff36f37a6456671946a8293ad613dc410409`: 530 file blobs were verified. Fresh readings include SF.0/SF.4, R09.1/R09.7a, upstream StableReduction layers 2/4 and R03.3, together with the relevant reviewed audits. The prior complete QuadraticFormInvariants and HodgeStructures README readings are retained. The actual pinned quadratic-algebra declarations were read; scoped negative searches in algebraic geometry and commutative algebra were checked against the owner descriptions and audits.

| Owner | Route | Items | Existing stage or parent |
|---|---|---:|---|
| SchemeAndStackFoundations | source | 8 | SchemeAndStackFoundations:SF.2 |
| MotivesAndAlgebraicCycles | source | 3 | MotivesAndAlgebraicCycles:MC.2 |
| MotivesAndAlgebraicCycles | source | 3 | MotivesAndAlgebraicCycles:MC.7 |
| AlgebraicModuliForArithmeticGeometry | source | 1 | AlgebraicModuliForArithmeticGeometry:R09.1, AlgebraicModuliForArithmeticGeometry:A0-extension |
| BrauerPeriodIndexArithmetic | part-ii | 3 | tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras |
| EquivariantTopologyRealVarieties | part-ii | 29 | tauceti:TauCetiRoadmap/AlgebraicTopology |
| DegeneratingHodgeStructures | part-ii | 11 | tauceti:TauCetiRoadmap/HodgeStructures |
| QuadraticFormsRealFunctionFields | part-ii | 12 | tauceti:TauCetiRoadmap/QuadraticFormInvariants |
| RealSurfacePeriodIndex | new | 89 | Application owner |
| ShimuraData | source | 1 | ShimuraData:D3 |

SF.2 owns the scheme Brauer/Kummer/purity interfaces and the local Čech calculation. MC.2 owns the real/equivariant cycle maps; MC.7 owns the proved divisor cases and primitive Picard-image theorem, as independent inputs to this application. AlgebraicModuli owns the coherent/projective family interfaces. ShimuraData:D3 owns the general variation carrier.

The four shared Part II proposals import their existing parents: equivariant topology extends ordinary topology; degenerating Hodge structures adds geometric/real criteria over the existing Hodge carrier and D3 variation; real function-field quadratic forms extends QuadraticFormInvariants; period-index arithmetic imports the existing algebraic index and splitting-extension theory. RealSurfacePeriodIndex assembles these suppliers for the real-surface theorem. Items 66, 67 and 149 remain routed unfinished obligations.

The continuation adds no new roadmap owner. Generic blowups and the node calculation import upstream StableReduction layer 4, also used by R09.7a. Hypersurface Cohen–Macaulayness and Serre normality coalesce with the R03.3 request in Böckle–Iyengar–Paškūnas23/087. Stein factorization uses the SF.1 supplier already requested by Witaszek22. Relative Spec and line bundles remain SF.0/SF.3; the generic double-cover interface is shared with EVW16/136. Paper proposals are not treated as accepted or implemented theorems.

The earlier coalescing with Benoist–Wittenberg20, Jannsen16, Gao–Habegger19 and Bakker–Klingler–Tsimerman20 is retained. A late screen of the changed Dittmann–Pop23, Bresciani24 and NgoDac21 extractions and the new Colmez–Dospinescu–Niziol21 and Newton–Thorne21/I–II routes found no competing owner for these suppliers. This was an ownership screen, not a full reading of those papers.

### Source findings and remaining work

There are 19 source findings, each with a locator, minimal quoted expression, proposed correction, argument and bounded search record. None has an independent-review verdict. E1 is expanded with the finite model and the auxiliary-curve interpretation; E2–E17 are preserved; E18–E19 are new. The earlier withdrawal of the suspected p.100 label error remains in sourceIssueReassessments.

| Finding | Substance |
|---|---|
| E1 | The projective double-cover model has positive-dimensional fibres at branch intersections. |
| E2 | The complex argument must choose an integral lift compatible with its Kummer class. |
| E3 | The first-component calculation omits the evaluation function; constant evaluation permits a repair. |
| E4 | The pushforward proof mixes mod-2 and integral coefficients; the trace quotient supplies a typed replacement in the uniform case. |
| E5 | Kernel generation requires an additional curve class before invoking the integral pushforward criterion. |
| E6 | The quotient contribution has the opposite sign to the one printed in Lemma7.3 and its later use. |
| E7 | Equality after restricting a sheaf map requires injectivity of restriction on the target. |
| E8 | The arbitrary-period statement needs separate odd/even cases; the first period-drop conclusion is divisibility. |
| E9 | The descended field must contain a transcendence basis before taking finite extensions. |
| E10 | The local-parameter argument requires joint independence of the two transformed differentials. |
| E11 | The Gysin coefficient twist depends on relative dimension. |
| E12 | The normal-sequence connecting map raises cohomological degree. |
| E13 | The specialization argument must avoid zeros and poles at the chosen real points. |
| E14 | The Puiseux-field example uses the function field over its stated ground field. |
| E15 | The Enriques half detector is unique among nonzero classes. |
| E16 | Dividing a cycle-class equation uses torsion-freeness of the cokernel. |
| E17 | The Voisin hypersurface parameter must agree with the degree of the family used here. |
| E18 | The fixed singular centres on p.77 have w=0, not v=0. |
| E19 | The arrow in (5.5) has coefficient sqrt(a1)rg before rescaling g; the missing unit does not affect injectivity. |

G1 now has an explicit local model and consumer audit. Its general geometric and cohomological suppliers remain part of G11. The urgent independent gate is G10: the exact Jannsen lemma on p.268 of [the letter to Gross](https://link.springer.com/chapter/10.1007/978-94-011-4098-0_8), together with the injective-complex replacement and signs in (4.3)–(4.5). The failed access attempts recorded by PR2016 are historical; this continuation does not claim a new reading. Obtain the text or reconstruct and verify the precise diagram chase. General G4a/G4b nonconstant-evaluation claims remain open. G6 and G9 retain the field-descent, joint-parameter and specialization details. G11 also includes unread prerequisite interiors and expansion of 59 compact legacy API outlines. No full transitive proof closure or formalization is claimed.

### Validation

The paper schema and submission-file checks pass. Structural validation confirms all 185 IDs, one route per missing item, the stated API/test counts, valid supplier stage IDs and an acyclic graph on 132 internal edges. The prior repaired main branch still avoids unrestricted items 66, 67 and 85 while retaining the Jannsen input 149. The new source records, pinned declaration excerpts and catalogue files have recorded hashes.

All 73,435 new exact diagnostics pass: quadratic multiplication/trace/norm, chart inverses and gluing, Rees-chart identities, exceptional transitions, conic charts, auxiliary-curve restriction and Čech monomial normal forms. The unchanged 7,926 prior arithmetic diagnostics were rerun and pass. The new certificate is included in the JSON for replay. These finite checks support the calculations; they do not certify the shared geometric/homological inputs. The 207 proposed API tests were not elaborated in Lean. Only the three authorized deliverables are submitted; no Lean file was requested or compiled.

### Added inventory

| Item | Name | Classification |
|---|---|---|
| 168 | Existing quadratic algebra and its rank-two basis | library |
| 169 | Existing quadratic trace, norm and discriminant | library |
| 170 | Hypersurfaces supply the S2 input | planned |
| 171 | Serre normality criterion | planned |
| 172 | Blowup charts and strict transforms | planned |
| 173 | Proper birational maps to a normal scheme preserve functions | planned |
| 174 | Finite cover associated with the branch product | missing |
| 175 | Normality of the SNC branch cover | missing |
| 176 | Map from the projective model to the finite cover | missing |
| 177 | The partial resolution at R intersect D | missing |
| 178 | Fixed singular centres of the projective family | missing |
| 179 | Blowing up the split ordinary double point | planned |
| 180 | Finite Stein model and function splitting | missing |
| 181 | Correct finite-flat and exceptional strata | missing |
| 182 | Resolved family in the corrected fixed ambient blowup | missing |
| 183 | Strict-transform lifts of the auxiliary curve | missing |
| 184 | Restriction of the trace-zero function summand | missing |
| 185 | Local Cech calculation for the node resolution | missing |
