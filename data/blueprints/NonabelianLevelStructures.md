# Nonabelian level structures on elliptic curves

This roadmap constructs the elliptic specialization of admissible finite covers, describes its cusps by finite group data, and proves a divisibility theorem for the degrees of its coarse connected components. The cotangent line at a ramification point is the bridge: its inertia character controls a denominator in stack degree, while the local ramification equation identifies its power with the elliptic Hodge line. For subgroups of SL2 over finite fields, trace coordinates convert that geometric degree theorem into divisibility of Nielsen and Markoff orbits. The final layer combines those outputs with independently owned dynamics to obtain connected components, genus, finiteness of j-invariants and noncongruence.

The mathematical targets below are the specification. The accompanying [packet](../packets/NonabelianLevelStructures.json) records their dependency graph, and the [suggested file](../suggested/NonabelianLevelStructures.lean) gives a compact selection of statements on existing pinned carriers. No implementation is asserted. Every target has implementation status unchecked.

## Sources and conventions

The primary source is William Y. Chen, *Nonabelian level structures, Nielsen equivalence, and Markoff triples*, Annals of Mathematics 199 (2024), 301–443, [DOI 10.4007/annals.2024.199.1.5](https://doi.org/10.4007/annals.2024.199.1.5). The [published author copy](https://www.williamyunchen.com/s/Chen-Nonabelian-level-structures-Nielsen-equivalence-and-Markoff-triples.pdf) was read on 18 October 2026, mathematical text pp. 301–434; its target locators and appendices were independently checked on 19 October 2026. Its SHA-256 is `9386db34c31671966440f18bccfefe11bd806aa221010e0e3336fecf8ff920ac`. All theorem numbers and pages below refer to that text; version differences are recorded separately. Statements and proof plans are in our own words.

Use right G-actions on covers and left fundamental-group actions on fibres. Put [x,y]=xyx⁻¹y⁻¹. With the selected positive punctured-torus basis (a,b), the positive peripheral word is [b,a]. A compatible root-of-unity system fixes the Higman generator; its choice is retained, rather than asserting trace invariance under arbitrary coprime powers. Exterior epimorphisms are surjections modulo simultaneous inner conjugation. The mapping-class action uses right precomposition, so its polynomial realization is an anti-action.

Write A_G for the stack of elliptic admissible G-covers before central rigidification, M(G) for the smooth level stack and Mbar(G) for the rigidified compactification. A subscript X denotes a connected stack component; an explicit superscript “coarse” distinguishes its coarse curve. Every j-degree is a coarse generic degree. Stack line degree is rational, with the generic-stabilizer correction specified in NL.3. For a group element c, |c| denotes its order; a conjugacy class is identified explicitly as such. Valuations use positive finite group orders.

Admissible maps are finite and balanced at nodes. They are not required to be flat at a ramified node: the index-two chart has generic rank two and node fibre length three. Ramification divisors are finite étale over the base, hence have geometrically reduced fibres; their absolute total schemes need not be reduced over a nonreduced base. Full markings at unramified points remain part of the stable-curve comparison even when the ramification divisor is empty.

The finite-field trace surface is the imported coefficient-one Markoff level x²+y²+z²−xyz=t+2. The full CA.4 move group includes even sign changes, while the Vieta/permutation subgroup in Chen does not add those generators. Invariants under the algebraic group GL2 mean invariants of its scheme coaction, rather than of its finite group of rational points. A split semisimple trace means that X²−tX+1 has distinct roots in the field; this convention works in characteristic two, where the discriminant-square criterion does not.

## Ownership and build order

General admissible-cover and Hurwitz-stack theory belongs to IG.5, tangential Galois theory to IG.1 and NC.0, stable curves and their graphs to the current StableReduction roadmap, and rigidification and coarse moduli to R09. The present roadmap specializes those carriers to the pointed genus-one target. It does not reconstruct them. Integral reductive invariant theory remains in LP3; Dickson classification remains in R01.4; the Markoff surface and its moves remain in CA.4; rational stack degree remains in SF.5; full abelian levels remain in R13.2; Faltings remains in RP.4.

MappingClassGroupsAndCanonicalRepresentations supplies the analytic moduli identification through C.0/moduli-monodromy. Its required extensions are the punctured-torus Nielsen comparison, stack Riemann existence and Asada/BBCL curve consequence. ArithmeticDynamicsPartII owns Φ, finite-field point and rotation counts, BGS strong approximation, the effective exceptional set and the Meiri–Puder density and alternating-image inputs. The remaining mapping-class extensions and the unregistered dynamics supplier have exact contracts in G-MAPPING and G-DYNAMICS below. The necessary order is NL.6 → the counting/strong-approximation/large-image part of ArithmeticDynamicsPartII → NL.7. In particular the geometric orbit-divisibility theorem needed by BGS belongs to NL.6, while the count formulas used in NL.7 remain with dynamics. This is a stage order, not a mutual dependence of whole roadmaps.

The current Tau Ceti roadmaps and current library were checked alongside the older atlas snapshot. StableReduction and PeripheralActions were read in full; relevant ModularCurves, BelyiMaps and SemisimpleAlgebras interfaces were read. PeripheralActions concerns pro-p punctured-sphere peripheral automorphisms and supplies no discrete punctured-torus comparison. The specific level, cusp, trace and Higman targets were also searched across the nine newer roadmaps and the current library. A name match alone is not treated as a supplying theorem.

| Layer | Purpose | Targets | Planets |
| --- | --- | ---: | ---: |
| NL.0 | Elliptic nonabelian level structures | 13 | 6 |
| NL.1 | Cusps and their finite data | 9 | 4 |
| NL.2 | Cusp automorphism groups | 5 | 2 |
| NL.3 | Cotangent lines and degree congruences | 7 | 5 |
| NL.4 | Finite group obstruction bounds | 3 | 3 |
| NL.5 | Rank-two trace coordinates | 11 | 6 |
| NL.6 | SL2 stabilizers and orbit congruences | 10 | 6 |
| NL.7 | Markoff modular geometry | 7 | 6 |

## Existing pinned vocabulary

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each entry below was checked against its actual declaration, including hypotheses. The current-library search is additional nonduplication evidence, not a change of pins. There is no library-coverage entry for this new roadmap.

- `mathlib:alternatingGroup.isSimpleGroup` (Mathlib/GroupTheory/SpecificGroups/Alternating/Simple.lean): The alternating group is simple when its underlying finite type has cardinality at least five.
- `mathlib:nat_card_alternatingGroup` (Mathlib/GroupTheory/SpecificGroups/Alternating.lean): The cardinality of the alternating group is the factorial of the underlying finite cardinality divided by two, assuming the type is nontrivial.
- `mathlib:commutatorElement` (Mathlib/Algebra/Group/Commutator.lean): Group commutator xyx⁻¹y⁻¹, enabled by the commutatorElement scope.
- `mathlib:orderOf` (Mathlib/GroupTheory/OrderOfElement.lean): Element order, with zero for infinite order; its definition is the period of left multiplication.
- `mathlib:Function.minimalPeriod` (Mathlib/Dynamics/PeriodicPts/Defs.lean): Least positive point period, or zero for a nonperiodic point; the declaration is in namespace Function.
- `mathlib:FreeGroup` (Mathlib/GroupTheory/FreeGroup/Basic.lean): The free group, here on Fin 2, with its existing homomorphism API.
- `mathlib:Subgroup.centralizer` (Mathlib/GroupTheory/Subgroup/Centralizer.lean): Centralizers as subgroups, with membership h*g=g*h for every h in the input set.
- `mathlib:Subgroup.zpowers` (Mathlib/Algebra/Group/Subgroup/ZPowers/Basic.lean): The cyclic subgroup consisting of all integer powers.
- `mathlib:MulAction.orbit` (Mathlib/GroupTheory/GroupAction/Defs.lean): Orbits as the range of the action map.
- `mathlib:Matrix.SpecialLinearGroup` (Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean): Determinant-one matrices as a subtype of Matrix n n R, not the module-endomorphism SL carrier.
- `mathlib:Matrix.trace` (Mathlib/LinearAlgebra/Matrix/Trace.lean): Trace of a square matrix as the sum of diagonal entries.
- `mathlib:Nat.totient` (Mathlib/Data/Nat/Totient.lean): Euler totient counts residues below n coprime to n.
- `mathlib:Nat.factorization` (Mathlib/Data/Nat/Factorization/Defs.lean): Prime valuations as a finitely supported function; use only positive group orders.
- `mathlib:CategoryTheory.PreGaloisCategory.FiberFunctor` (Mathlib/CategoryTheory/Galois/Basic.lean): Existing categorical fibre-functor class; geometric constructions still belong to IG.0.
- `mathlib:WeierstrassCurve.j` (Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean): The j-invariant c4^3/Delta of an elliptic Weierstrass curve, with its unit discriminant hypothesis.
- `tauceti:TauCeti.PermutationTriple` (TauCeti/Combinatorics/PermutationTriple/Basic.lean): Three sheet permutations with sigmaInf*sigma1*sigma0=1.
- `tauceti:TauCeti.PermutationTriple.eulerChar` (TauCeti/Combinatorics/PermutationTriple/EulerCharacteristic.lean): Sum of three cycle counts minus the number of sheets.
- `tauceti:TauCeti.PermutationTriple.genus` (TauCeti/Combinatorics/PermutationTriple/EulerCharacteristic.lean): Combinatorial genus; read geometrically only for connected triples.
- `tauceti:TauCeti.PermutationTriple.IsConnected.two_sub_two_mul_genus` (TauCeti/Combinatorics/PermutationTriple/EulerCharacteristic.lean): For a connected permutation triple, Euler characteristic is 2−2g.
- `tauceti:TauCeti.CoveringSpace.monodromyFunctor` (TauCeti/Topology/Covering/Monodromy/Basic.lean): Monodromy functor from actual covering spaces to fundamental-groupoid actions; this is not Riemann existence for stacks.
- `mathlib:CongruenceSubgroup.Gamma` (Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean): The principal congruence subgroup is the kernel of reduction SL2(Z)→SL2(Z/N).
- `mathlib:CongruenceSubgroup.IsCongruenceSubgroup` (Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean): The existing predicate ∃N≠0, Gamma N≤Γ; this roadmap imports it unchanged.

## Layer targets

Within each layer, a target's prerequisites are direct edges, not a demand to rebuild the supplying roadmap. “API” gives planned public declarations and their mathematical contracts. The tests are implementation acceptance requirements: they are chosen to reject plausible incorrect definitions. The namespace is TauCeti.NonabelianLevel, with proposed modules Structures, Cusps, CuspAutomorphisms, DegreeCongruence, GroupBounds, TraceCoordinates, SL2Congruences and GeometricApplications under TauCeti/AlgebraicGeometry/NonabelianLevel.

## NL.0. Elliptic nonabelian level structures

Layer inputs: `InverseGaloisAndArithmeticFundamentalGroups:IG.5`; `AlgebraicModuliForArithmeticGeometry:R09.4`; `SchemeAndStackFoundations:SF.4`; `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`; `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3`; `AlgebraicModuliForArithmeticGeometry:R09.5`; `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`; `AlgebraicModuliForArithmeticGeometry:R09.6`; `ModularCurvesPartII:R13.4a`.

### The elliptic admissible-cover specialization

Target `NonabelianLevelStructures:NL.0/elliptic-admissible-covers` · construction · planet **Elliptic admissible covers**.

For finite G and S over Z[1/|G|], restrict the imported admissible (g,n)-cover stack to (1,1), identifying a stable one-pointed genus-one target with a 1-generalized elliptic curve E/S. Write A_G for this stack and A_G^0 for its smooth-target open. Retain the imported finite quotient map C→E, connected prestable source, G-torsor off the origin and nodes, tame cyclic inertia, and balanced charts x=ξ^e at a marking and (x,y)=(ξ^r,η^r), ξη=a, xy=a^r at a node. The quotient map is finite; flatness is not imposed at a ramified node. The full marking is the reduced ramified fibre for e>1 and the full étale fibre for e=1.

Hypotheses and ambient setting: G finite; all bases over Z[1/|G|]; additional characteristic-zero or generation assumptions are stated in the target.

Direct prerequisites: `InverseGaloisAndArithmeticFundamentalGroups:IG.5/admissible-g-covers`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/admissible-stacks-and-stable-curves`; `AlgebraicModuliForArithmeticGeometry:R09.4/arith-onegon-weierstrass`; `SchemeAndStackFoundations:SF.4/stable-curve-stack`; `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`.

Construction or proof plan:

1. Base-change the existing general Hurwitz stack along the stable (1,1) target stack.
2. Use the onegon Weierstrass presentation to identify the target with Ell_1 and descend the identity section and group law.
3. Transport the stable-marked-G-curve equivalence, retaining the full unramified marking and the corrected finite local contract.

API:

- `TauCeti.NonabelianLevel.elliptic_admissible_covers.restrict` (constructor): The (1,1) restriction functor commutes with arbitrary base change.
- `TauCeti.NonabelianLevel.elliptic_admissible_covers.toMarkedCurve` (equivalence): The equivalence with stable marked G-curves retains all points over the target marking.
- `TauCeti.NonabelianLevel.elliptic_admissible_covers.smoothOpen` (characterisation): A_G^0 is exactly the locus where E, equivalently C, is smooth.

Definition checks:

- **degenerate**, `elliptic_admissible_covers.check_1`: For G=1, the source equals E and the full marking is the origin, although the reduced ramification divisor is empty.
- **non-example**, `elliptic_admissible_covers.check_2`: At ξη=0, e=2, the fibre over the target node has length 3 rather than generic rank 2; the cover is admissible and finite but not flat.
- **compatibility**, `elliptic_admissible_covers.check_3`: For a smooth elliptic E and an étale connected G-cover of E, forgetting the full origin fibre would lose the required marked-curve object.

Acceptance:

- For G=1, the source equals E and the full marking is the origin, although the reduced ramification divisor is empty.
- At ξη=0, e=2, the fibre over the target node has length 3 rather than generic rank 2; the cover is admissible and finite but not flat.
- For a smooth elliptic E and an étale connected G-cover of E, forgetting the full origin fibre would lose the required marked-curve object.

Uses:

- `CHEN2024, §2.1, pp. 317–322; §2.4, Theorem 2.4.9, pp. 328–332; Definitions 4.1.1–4.1.3, pp. 361–362`: The the elliptic admissible-cover specialization supplies The (1,1) restriction functor commutes with arbitrary base change.; The equivalence with stable marked G-curves retains all points over the target marking.
- `NonabelianLevelStructures:NL.0/reduced-ramification`: The reduced ramification divisor: Use the tame smooth local chart to identify each fixed locus with a section after an étale cover.
- `NonabelianLevelStructures:NL.0/higman-invariant`: The Higman invariant: Use the tame local chart to prove χ_x faithful.

Source: Chen, §2.1, pp. 317–322; §2.4, Theorem 2.4.9, pp. 328–332; Definitions 4.1.1–4.1.3, pp. 361–362.

### The reduced ramification divisor

Target `NonabelianLevelStructures:NL.0/reduced-ramification` · definition · planet **Reduced ramification divisor**.

For an elliptic admissible cover π:C→E over S, let Δ(H) be the smooth fixed locus C_sm^H with all fixed loci C_sm^K for strictly larger cyclic K removed. Define R_π as the disjoint union of Δ(H) over nontrivial cyclic H≤G, with the induced fixed-locus scheme structures. It is an effective Cartier divisor finite étale over S, with geometrically reduced fibres; it is reduced as a scheme if S is reduced. The converse holds when R_π→S is surjective, in particular for e≥2 on a nonempty connected base. On a connected base the origin ramification index e is constant; if e≥2, R_π has degree |G|/e and is the fibrewise reduced origin fibre. If e=1, R_π is empty and the full marking is the whole étale origin fibre.

Hypotheses and ambient setting: G finite; all bases over Z[1/|G|]; additional characteristic-zero or generation assumptions are stated in the target.

Direct prerequisites: `NonabelianLevelStructures:NL.0/elliptic-admissible-covers`; `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

Construction or proof plan:

1. Use the tame smooth local chart to identify each fixed locus with a section after an étale cover.
2. Separate loci with different stabilizer subgroups; these are disjoint in the smooth locus.
3. Descend their union and the Cartier property, and count the geometric fibre G/H.

API:

- `TauCeti.NonabelianLevel.reduced_ramification.divisor` (constructor): R_π is a closed effective Cartier divisor in C_sm.
- `TauCeti.NonabelianLevel.reduced_ramification.baseChange` (functoriality): R for the pulled-back cover is the pullback of R_π.
- `TauCeti.NonabelianLevel.reduced_ramification.degree` (characterisation): For e≥2, degree(R_π/S)=|G|/e; for e=1 the divisor is empty.
- `TauCeti.NonabelianLevel.reduced_ramification.fixedLocus` (compatibility): Its geometric points are exactly points with nontrivial inertia above the origin.
- `TauCeti.NonabelianLevel.reduced_ramification.reducedIff` (characterisation): If R_π→S is surjective, R_π is reduced iff S is reduced; without surjectivity only the implication from S to R_π is asserted.

Definition checks:

- **degenerate**, `reduced_ramification.check_1`: Every unramified connected cover has R_π=∅, even though π^{-1}(O) has |G| points.
- **computation**, `reduced_ramification.check_2`: For S3 inertia of order 3, R_π has degree 2.
- **compatibility**, `reduced_ramification.check_3`: For the chart x=ξ^e, e≥2, R_π is ξ=0 with multiplicity one, not the different divisor of multiplicity e−1.
- **non-example**, `reduced_ramification.nonreduced_base`: After base change to k[ε]/(ε²), R_π remains finite étale and fibrewise reduced but need not be a reduced scheme; taking absolute reduction would break base change.
- **non-example**, `reduced_ramification.empty_nonreduced_base`: For G=1 over S=Spec(k[ε]/(ε²)), R_π is empty and reduced although S is not reduced. This rejects the converse without surjectivity.

Acceptance:

- Every unramified connected cover has R_π=∅, even though π^{-1}(O) has |G| points.
- For S3 inertia of order 3, R_π has degree 2.
- For the chart x=ξ^e, e≥2, R_π is ξ=0 with multiplicity one, not the different divisor of multiplicity e−1.

Uses:

- `CHEN2024, §2.2, pp. 322–325; Proposition 2.2.3 and Remark 2.2.4; Definition 3.2.1, pp. 351–352`: The the reduced ramification divisor supplies R_π is a closed effective Cartier divisor in C_sm.; R for the pulled-back cover is the pullback of R_π.
- `NonabelianLevelStructures:NL.0/ramification-monodromy`: Monodromy of the ramification divisor: The G-action commutes with finite étale monodromy and is transitive on the whole geometric fibre G/H.
- `NonabelianLevelStructures:NL.3/section-cotangent`: The universal section cotangent line: Import the canonical map Ω→ω and its smooth-locus isomorphism, with representable stack base-change from request Q-DUAL.

Source: Chen, §2.2, pp. 322–325; Proposition 2.2.3 and Remark 2.2.4; Definition 3.2.1, pp. 351–352.

### Monodromy of the ramification divisor

Target `NonabelianLevelStructures:NL.0/ramification-monodromy` · theorem · planet **Ramification monodromy**.

Assume S connected and π as above with e≥2. For a geometric ramified point x with inertia H, all connected components of R_π are isomorphic finite étale Galois covers of S. Their deck groups embed in N_G(H)/H. If S is regular integral and contains a primitive e-th root of unity, these groups embed in C_G(H)/H. For a connected component X of A_G over Z[1/|G|,ζ_e], the same assertion holds for the universal ramification divisor, by finite étale monodromy and descent of the inertia character.

Hypotheses and ambient setting: G finite; all bases over Z[1/|G|]; additional characteristic-zero or generation assumptions are stated in the target.

Direct prerequisites: `NonabelianLevelStructures:NL.0/reduced-ramification`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/admissible-stacks-and-stable-curves`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1/tame-tangential-fiber`.

Construction or proof plan:

1. The G-action commutes with finite étale monodromy and is transitive on the whole geometric fibre G/H.
2. An equivariant permutation is determined by its value at H; its stabilizer condition gives the normalizer quotient.
3. The faithful inertia character, constant over a regular integral base containing ζ_e, forces centralization.
4. For the universal stack, the fixed-subgroup loci of the finite étale ramification divisor are open and closed. On each connected component the faithful inertia character takes constant values in the constant group μ_e. Monodromy preserves that character, so its normalizer image centralizes H. Descend this character calculation through an atlas; a connected atlas alone need not preserve connected finite covers.

Acceptance:

- The centralizer quotient, not the normalizer quotient, supplies d_X in the characteristic-zero congruence.
- For odd dihedral G and full rotation inertia, the centralizer quotient has order 1.

Source: Chen, Proposition 2.2.5, pp. 325–326; Proposition 3.2.2, pp. 352–353.

### The Higman invariant

Target `NonabelianLevelStructures:NL.0/higman-invariant` · definition · planet **Higman invariant**.

Fix ζ_n on a Z[1/|G|]-base, with every inertia order e dividing n. At a point x over O the faithful action on its cotangent line is χ_x:H→μ_e. Define Hig_ζ(π) in ConjClasses(G) as the class of the unique c in H with χ_x(c)=ζ_n^(n/e). Set e=1 and c=1 in the unramified case. This is independent of the point and compatible with base change and isomorphisms. With right G-actions and a positively oriented punctured-torus basis (a,b), the positive peripheral loop is [b,a], for [x,y]=xyx^{-1}y^{-1}.

Hypotheses and ambient setting: G finite; all bases over Z[1/|G|]; additional characteristic-zero or generation assumptions are stated in the target.

Direct prerequisites: `NonabelianLevelStructures:NL.0/elliptic-admissible-covers`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1/tame-tangential-fiber`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3/exterior-epimorphisms`.

Construction or proof plan:

1. Use the tame local chart to prove χ_x faithful.
2. Changing x conjugates the generator, and étale-local charts give base-change compatibility.
3. Compare the chosen root-of-unity generator with the oriented complex peripheral loop.

API:

- `TauCeti.NonabelianLevel.higman_invariant.value` (constructor): Assign a conjugacy class to every geometric object with the chosen roots.
- `TauCeti.NonabelianLevel.higman_invariant.order` (characterisation): The order of a representative is the origin inertia index e.
- `TauCeti.NonabelianLevel.higman_invariant.changeRoot` (functoriality): Replacing ζ_n by ζ_n^a, (a,n)=1, raises the class to the a-th power.
- `TauCeti.NonabelianLevel.higman_invariant.peripheral` (compatibility): Over C the class is that of ϕ([b,a]), with the stated orientation.

Definition checks:

- **degenerate**, `higman_invariant.check_1`: For every abelian G, all elliptic G-covers have Higman class 1, since every commutator is 1.
- **computation**, `higman_invariant.check_2`: For a generating pair of S3 consisting of two distinct transpositions, the Higman class is the class of 3-cycles and e=3.
- **compatibility**, `higman_invariant.check_3`: Replacing ζ_e by its inverse inverts the inertia generator; no equality of a class with its inverse is assumed in a general finite group.

Acceptance:

- For every abelian G, all elliptic G-covers have Higman class 1, since every commutator is 1.
- For a generating pair of S3 consisting of two distinct transpositions, the Higman class is the class of 3-cycles and e=3.
- Replacing ζ_e by its inverse inverts the inertia generator; no equality of a class with its inverse is assumed in a general finite group.

Uses:

- `CHEN2024, Definition 2.3.1, p. 327; Proposition 2.3.2 and Definition 2.3.4, pp. 327–328; Situation 2.5.14, pp. 346–347`: The the higman invariant supplies Assign a conjugacy class to every geometric object with the chosen roots.; The order of a representative is the origin inertia index e.
- `NonabelianLevelStructures:NL.0/higman-components`: Open and closed Higman strata: Prove local constancy on tame charts and descend along an étale atlas.
- `NonabelianLevelStructures:NL.1/delta-classification`: Classification of cusps and their Higman class: Changing the torsor point conjugates the pair; changing the gluing representative multiplies h by u^k.

Source: Chen, Definition 2.3.1, p. 327; Proposition 2.3.2 and Definition 2.3.4, pp. 327–328; Situation 2.5.14, pp. 346–347.

### Open and closed Higman strata

Target `NonabelianLevelStructures:NL.0/higman-components` · theorem.

The index e and Hig_ζ are locally constant on A_G and on its smooth locus. Hence, after adjoining the requisite roots, each fixed conjugacy class gives an open and closed substack, and the disjoint union of these substacks is the whole moduli stack. The decomposition descends through the central rigidification and agrees on coarse spaces.

Hypotheses and ambient setting: G finite; all bases over Z[1/|G|]; additional characteristic-zero or generation assumptions are stated in the target.

Direct prerequisites: `NonabelianLevelStructures:NL.0/higman-invariant`; `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-base-change`.

Construction or proof plan:

1. Prove local constancy on tame charts and descend along an étale atlas.
2. Form the clopen inverse images and use invariance under central rigidification.

Acceptance:

- Each geometric cover belongs to exactly one Higman stratum, including the unramified identity stratum.
- Changing the primitive root permutes strata by the corresponding coprime power map.

Source: Chen, Proposition 2.3.2 and Definition 2.3.4, pp. 327–328.

### The sheaf of G-structures

Target `NonabelianLevelStructures:NL.0/g-structures` · definition · planet **Nonabelian G-structures**.

On the étale site of the elliptic moduli stack over Z[1/|G|], T_G is the sheafification of the presheaf assigning to E/S the isomorphism classes of right G-torsors over E\O with geometrically connected fibres over S. A G-structure is a section of this sheaf; M(G) is its associated stack over M(1). Over a separably closed field these sections are actual torsor classes. For center-free G the presheaf is already a sheaf. For general bases and nontrivial center, sheaf sections are not identified with global torsors without descent data.

Hypotheses and ambient setting: G finite; all bases over Z[1/|G|]; additional characteristic-zero or generation assumptions are stated in the target.

Direct prerequisites: `InverseGaloisAndArithmeticFundamentalGroups:IG.5/admissible-stacks-and-stable-curves`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3/exterior-epimorphisms`; `AlgebraicModuliForArithmeticGeometry:R09.4/arith-onegon-weierstrass`; `mathlib:CategoryTheory.PreGaloisCategory.FiberFunctor`.

Construction or proof plan:

1. Form the connected-torsor presheaf using the existing Galois-category fibre functor.
2. Sheafify and take the category of elements over M(1).
3. Identify the ambiguity in local torsor descent with central automorphisms.

API:

- `TauCeti.NonabelianLevel.g_structures.section` (constructor): A connected torsor gives a section of T_G, naturally in the base.
- `TauCeti.NonabelianLevel.g_structures.descent` (characterisation): Compatible local sections glue uniquely in T_G.
- `TauCeti.NonabelianLevel.g_structures.geometricFiber` (equivalence): At a separably closed field, T_G(E) is the set of connected torsor classes.
- `TauCeti.NonabelianLevel.g_structures.centerFree` (compatibility): If Z(G)=1, no sheafification changes the presheaf.

Definition checks:

- **degenerate**, `g_structures.check_1`: T_1 has one section on every elliptic curve and M(1) is recovered.
- **non-example**, `g_structures.check_2`: A disconnected trivial G-torsor for nontrivial G is excluded by geometric connectedness.
- **compatibility**, `g_structures.check_3`: Over C, T_G(E) is Epi(F2,G)/Inn(G); Hom(F2,G)/Inn(G) would incorrectly include non-surjective pairs.

Acceptance:

- T_1 has one section on every elliptic curve and M(1) is recovered.
- A disconnected trivial G-torsor for nontrivial G is excluded by geometric connectedness.
- Over C, T_G(E) is Epi(F2,G)/Inn(G); Hom(F2,G)/Inn(G) would incorrectly include non-surjective pairs.

Uses:

- `CHEN2024, §2.5.1, pp. 332–334; Remark 2.5.1, p. 334`: The the sheaf of g-structures supplies A connected torsor gives a section of T_G, naturally in the base.; Compatible local sections glue uniquely in T_G.
- `NonabelianLevelStructures:NL.0/level-moduli`: Geometry of the finite étale level stack: Use the locally constant finite connected-torsor sheaf to obtain the representable finite étale morphism.
- `NonabelianLevelStructures:NL.0/compactified-level-stack`: Central rigidification and compactification: Apply the existing rigidification and universal gerbe construction to the central vertical subgroup.
- `NonabelianLevelStructures:NL.0/absolute-structures`: Absolute and intermediate level structures: Postcompose exterior epimorphisms by automorphisms of G.

Source: Chen, §2.5.1, pp. 332–334; Remark 2.5.1, p. 334.

### Geometry of the finite étale level stack

Target `NonabelianLevelStructures:NL.0/level-moduli` · theorem.

M(G)→M(1) is representable finite étale over Z[1/|G|]. M(G) is smooth separated Deligne–Mumford. Its coarse scheme is normal affine, finite over the affine j-line, smooth of relative dimension one over Z[1/|G|], and étale away from j=0,1728. Formation of this coarse scheme commutes with a base change to a regular Noetherian base, or to an arbitrary base when 6 divides |G|. A non-two-generated G gives the empty stack.

Hypotheses and ambient setting: G finite; all bases over Z[1/|G|]; additional characteristic-zero or generation assumptions are stated in the target.

Direct prerequisites: `NonabelianLevelStructures:NL.0/g-structures`; `AlgebraicModuliForArithmeticGeometry:R09.5/coarse-j-line-recovery`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/admissible-stacks-and-stable-curves`; `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`; `AlgebraicModuliForArithmeticGeometry:R09.5/elliptic-coarse-recovery`.

Construction or proof plan:

1. Use the locally constant finite connected-torsor sheaf to obtain the representable finite étale morphism.
2. Use the existing coarse j-line and tame or regular-base coarse comparison, with the stated base-change hypotheses.
3. Identify the geometric fibre by exterior epimorphisms; its emptiness is the generation obstruction.

Acceptance:

- G=1 gives the level-one stack and the same coarse j-line.
- No arbitrary coarse base-change assertion is made when 6 does not divide |G| and the base is not regular.

Source: Chen, Theorem 2.5.2(1)–(4), pp. 335–337.

### Elliptic monodromy and branch cycles

Target `NonabelianLevelStructures:NL.0/monodromy-dictionary` · construction · planet **Elliptic monodromy dictionary**.

Over an algebraically closed characteristic-zero field, use a complex comparison and a positively oriented basis of F2=π1(E\O) to identify the geometric fibre of M(G) with Epi^ext(F2,G). The connected components are Out^+(F2)-orbits. On exterior pairs the branch operators are γ0(a,b)=(ab^{-1},a), γ1728(a,b)=(b^{-1},a), γ∞(a,b)=(a,ab), and γ−I(a,b)=(a^{-1},b^{-1}). The generic coarse fibre is the quotient by γ−I, and fibres at 0,1728,∞ are respectively quotients by γ0, γ1728, and the subgroup generated by γ−I and γ∞. Stack monodromy uses π1(M(1)^an), not π1 of the coarse affine line.

Hypotheses and ambient setting: G finite; all bases over Z[1/|G|]; additional characteristic-zero or generation assumptions are stated in the target.

Direct prerequisites: `NonabelianLevelStructures:NL.0/level-moduli`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3/exterior-epimorphisms`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3/general-riemann-existence`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1/charzero-base-extension`; `tauceti:TauCeti.CoveringSpace.monodromyFunctor`; `MappingClassGroupsAndCanonicalRepresentations:C.0/moduli-monodromy`.

Construction or proof plan:

1. Import C.0/moduli-monodromy for the analytic ordered moduli stack. The additional Nielsen identification for the punctured torus, stack Riemann existence and compatible orientation remain the exact G-MAPPING contract.
2. Apply the existing exterior-epimorphism fibre description to the elliptic universal family.
3. Compute the four words and the stabilizer quotients, distinguishing stack and coarse fibres.
4. Transport through characteristic-zero algebraically closed base extension.

API:

- `TauCeti.NonabelianLevel.monodromy_dictionary.fiber` (equivalence): The fibre equivalence intertwines monodromy with right precomposition.
- `TauCeti.NonabelianLevel.monodromy_dictionary.componentDegree` (characterisation): A component has coarse degree |O/⟨γ−I⟩|.
- `TauCeti.NonabelianLevel.monodromy_dictionary.branchCycles` (compatibility): The three exceptional fibres are the stated cyclic-orbit sets.
- `TauCeti.NonabelianLevel.monodromy_dictionary.abelian` (compatibility): For G=(Z/n)^2, this agrees with the imported full-level modular monodromy after fixing the Weil pairing.

Definition checks:

- **degenerate**, `monodromy_dictionary.check_1`: For G=1 every fibre has one element and every branch operator acts trivially.
- **computation**, `monodromy_dictionary.check_2`: For G=C2, the three nonzero pairs form one degree-three coarse component; the inversion acts trivially.
- **non-example**, `monodromy_dictionary.check_3`: The generic stack fibre can have twice the size of the coarse fibre when γ−I has no fixed point on the orbit; neither size may replace the other.

Acceptance:

- For G=1 every fibre has one element and every branch operator acts trivially.
- For G=C2, the three nonzero pairs form one degree-three coarse component; the inversion acts trivially.
- The generic stack fibre can have twice the size of the coarse fibre when γ−I has no fixed point on the orbit; neither size may replace the other.

Uses:

- `CHEN2024, Theorem 2.5.2(3)–(5), pp. 335–338; Situation 2.5.14, pp. 346–347`: The elliptic monodromy and branch cycles supplies The fibre equivalence intertwines monodromy with right precomposition.; A component has coarse degree |O/⟨γ−I⟩|.
- `NonabelianLevelStructures:NL.0/quotient-functor`: Functoriality under quotients of G: Take the quotient cover and extend over the admissible boundary using the general quotient construction.
- `NonabelianLevelStructures:NL.0/absolute-structures`: Absolute and intermediate level structures: Postcompose exterior epimorphisms by automorphisms of G.
- `NonabelianLevelStructures:NL.0/cofinality`: Cofinality of elliptic nonabelian levels: Import Asada cofinality for finite étale covers of the elliptic moduli stack through G-MAPPING, and apply the nonabelian level fibre dictionary.
- `NonabelianLevelStructures:NL.2/dihedral-obstruction`: The odd-dihedral obstruction example: Compute the dihedral generating pairs and their commutators directly.
- `NonabelianLevelStructures:NL.3/combinatorial-congruence`: The Higman and Nielsen congruences: If c=1, the claimed modulus is 1 and the conclusion is immediate; otherwise the inertia order is at least 2.
- `NonabelianLevelStructures:NL.6/trace-moduli-dictionary`: The trace and moduli correspondence: Descend the finite-field GL2 trace bijection by the rational normalizer action, and restrict to one actual image type.

Source: Chen, Theorem 2.5.2(3)–(5), pp. 335–338; Situation 2.5.14, pp. 346–347.

Explicit open inputs: `G-MAPPING`.

### Elliptic boundary deformation and density

Target `NonabelianLevelStructures:NL.0/deformation-and-density` · theorem.

At a geometric object in characteristic prime to |G|, the elliptic admissible-cover deformation map on universal rings is Λ[[T]]→Λ[[t]], T↦t^r, for a Cohen ring Λ and node stabilizer order r; for a smooth object r=1. Consequently A_G→Mbar(1) is flat proper quasi-finite and its smooth-target open is dense. In particular the entire compactification is empty if G is not two-generated.

Hypotheses and ambient setting: G finite; all bases over Z[1/|G|]; additional characteristic-zero or generation assumptions are stated in the target.

Direct prerequisites: `InverseGaloisAndArithmeticFundamentalGroups:IG.5/admissible-stacks-and-stable-curves`; `SchemeAndStackFoundations:SF.4/node-versal-deformation`; `NonabelianLevelStructures:NL.0/level-moduli`; `AlgebraicModuliForArithmeticGeometry:R09.6/completed-atlas-presentation`; `SchemeAndStackFoundations:SF.4`; `AlgebraicModuliForArithmeticGeometry:R09.6`.

Construction or proof plan:

1. Import equivariant nodal deformation theory and its framed DM-local comparison, requested in R09.6 and SF.4.
2. Specialize to the single target node; balanced smoothing gives T=t^r.
3. Flatness follows from the displayed free ring extension; density follows because t≠0 is dense.
4. Combine the dense-open result with the exterior generation obstruction.

Acceptance:

- A node with r=2 has T=t², so the compactified forgetful morphism is not étale there.
- A smooth cover has r=1; the generic point alone is not used to infer boundary étaleness.

Source: Chen, Proposition 2.5.3 and Corollary 2.5.4, pp. 338–341.

### Central rigidification and compactification

Target `NonabelianLevelStructures:NL.0/compactified-level-stack` · construction.

Define Mbar(G)=A_G rigidified by Z(G), using the imported central subgroup of the vertical inertia. Its open M(G) is identified with A_G^0 rigidified by Z(G). The rigidification has the same coarse scheme as A_G. Both compactified stacks are smooth proper relative curves over Z[1/|G|]; Mbar(G)→Mbar(1) is flat proper quasi-finite, and the coarse scheme is smooth proper of relative dimension one. Representability at the boundary requires a separate vertical-automorphism computation and is not automatic.

Hypotheses and ambient setting: G finite; all bases over Z[1/|G|]; additional characteristic-zero or generation assumptions are stated in the target.

Direct prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`; `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-base-change`; `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-coarse`; `NonabelianLevelStructures:NL.0/deformation-and-density`; `NonabelianLevelStructures:NL.0/g-structures`; `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-proper`; `ModularCurvesPartII:R13.4a/compactified-coarse-j-line`; `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`; `AlgebraicModuliForArithmeticGeometry:R09.5/elliptic-coarse-recovery`.

Construction or proof plan:

1. Apply the existing rigidification and universal gerbe construction to the central vertical subgroup.
2. Use the smooth-locus torsor interpretation to identify the open with M(G).
3. Transport coarse spaces through rigidification; use the existing local quotient presentations and ModularCurves 9D smooth finite-quotient theorem over the regular base, through Q-COARSE. This input does not require tame full stabilizers and therefore includes residue characteristics 2 and 3.

API:

- `TauCeti.NonabelianLevel.compactified_level_stack.rigidify` (constructor): A_G→Mbar(G) is the central rigidification and is compatible with base change.
- `TauCeti.NonabelianLevel.compactified_level_stack.open` (equivalence): Its restriction identifies A_G^0/Z(G) with M(G).
- `TauCeti.NonabelianLevel.compactified_level_stack.coarse` (compatibility): The two compactified coarse spaces are canonically isomorphic.
- `TauCeti.NonabelianLevel.compactified_level_stack.boundary` (characterisation): The complement of M(G) is exactly the nodal-target locus.

Definition checks:

- **degenerate**, `compactified_level_stack.check_1`: G=1 recovers Mbar(1), with coarse P¹_j.
- **compatibility**, `compactified_level_stack.check_2`: On the smooth locus the relative inertia is killed exactly by Z(G).
- **non-example**, `compactified_level_stack.check_3`: Odd dihedral covers can have noncentral vertical automorphisms at a cusp; rigidification by the center alone does not make the map representable.

Acceptance:

- G=1 recovers Mbar(1), with coarse P¹_j.
- On the smooth locus the relative inertia is killed exactly by Z(G).
- Odd dihedral covers can have noncentral vertical automorphisms at a cusp; rigidification by the center alone does not make the map representable.

Uses:

- `CHEN2024, Definition 2.5.9 and Proposition 2.5.10(a)–(e), pp. 343–345`: The central rigidification and compactification supplies A_G→Mbar(G) is the central rigidification and is compatible with base change.; Its restriction identifies A_G^0/Z(G) with M(G).
- `NonabelianLevelStructures:NL.0/quotient-functor`: Functoriality under quotients of G: Take the quotient cover and extend over the admissible boundary using the general quotient construction.
- `NonabelianLevelStructures:NL.0/absolute-structures`: Absolute and intermediate level structures: Postcompose exterior epimorphisms by automorphisms of G.
- `NonabelianLevelStructures:NL.2/cusp-stabilizers`: Full and marked cusp stabilizers: Use the normalizer/gluing description to compute the stabilizer of an origin point.
- `NonabelianLevelStructures:NL.6/sl2-vertical-stabilizers`: SL2 vertical automorphisms: The center-containment refinement of Dickson is requested in Q-DICKSON.

Source: Chen, Definition 2.5.9 and Proposition 2.5.10(a)–(e), pp. 343–345.

### Functoriality under quotients of G

Target `NonabelianLevelStructures:NL.0/quotient-functor` · construction.

For a surjection f:G1→G2 of finite two-generated groups, f induces M(G1)→M(G2) by quotienting a connected torsor by ker f, and a proper surjective quasi-finite extension Mbar(G1)→Mbar(G2). On geometric fibres this is postcomposition on exterior epimorphisms and is compatible with Higman classes. Surjectivity of the stack morphism uses lifting of generating pairs up to monodromy, equivalently the group-theoretic lifting theorem used in Chen; it is not inferred merely from surjectivity of G1→G2 on elements.

Hypotheses and ambient setting: G finite; all bases over Z[1/|G|]; additional characteristic-zero or generation assumptions are stated in the target.

Direct prerequisites: `NonabelianLevelStructures:NL.0/monodromy-dictionary`; `NonabelianLevelStructures:NL.0/compactified-level-stack`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/admissible-stacks-and-stable-curves`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/finite-cover-image-lemmas`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3`.

Construction or proof plan:

1. Take the quotient cover and extend over the admissible boundary using the general quotient construction.
2. Use the finite-group generating-tuple lifting input requested at IG.3 and the fibre dictionary for surjectivity.
3. Check identity and composition using the quotient universal property.

API:

- `TauCeti.NonabelianLevel.quotient_functor.map` (functoriality): Surjections compose to canonically isomorphic quotient maps.
- `TauCeti.NonabelianLevel.quotient_functor.fiber` (compatibility): The fibre map is ϕ↦f∘ϕ.
- `TauCeti.NonabelianLevel.quotient_functor.higman` (compatibility): The Higman class maps by f.
- `TauCeti.NonabelianLevel.quotient_functor.compactification` (compatibility): The map agrees with the proper quasi-finite extension on compactifications.

Definition checks:

- **degenerate**, `quotient_functor.check_1`: An isomorphism G1≅G2 gives an isomorphism of level stacks.
- **compatibility**, `quotient_functor.check_2`: G→1 gives the forgetful map and agrees with the existing target j-line.
- **non-example**, `quotient_functor.check_3`: A nonsurjective group homomorphism is not admitted as this functor: its postcomposition need not classify a connected target torsor.

Acceptance:

- An isomorphism G1≅G2 gives an isomorphism of level stacks.
- G→1 gives the forgetful map and agrees with the existing target j-line.
- A nonsurjective group homomorphism is not admitted as this functor: its postcomposition need not classify a connected target torsor.

Uses:

- `CHEN2024, Theorem 2.5.2(6), p. 337; Proposition 2.5.10(f), pp. 344–345`: The functoriality under quotients of g supplies Surjections compose to canonically isomorphic quotient maps.; The fibre map is ϕ↦f∘ϕ.

Source: Chen, Theorem 2.5.2(6), p. 337; Proposition 2.5.10(f), pp. 344–345.

### Absolute and intermediate level structures

Target `NonabelianLevelStructures:NL.0/absolute-structures` · definition.

For A≤Out(G), define T_{G|A}=T_G/A and M(G|A)=M(G)/A, with M(G)^abs for A=Out(G). The Out(G)-action on the geometric fibre T_G is free, hence the quotient is another finite locally constant sheaf; the same quotient notation on smooth compactifications means normalization of the coarse quotient, or the corresponding stack quotient with its residual stabilizers retained. A fixed Higman stratum is used only when A preserves that class, or else replaced by its A-orbit.

Hypotheses and ambient setting: G finite; all bases over Z[1/|G|]; additional characteristic-zero or generation assumptions are stated in the target.

Direct prerequisites: `NonabelianLevelStructures:NL.0/g-structures`; `NonabelianLevelStructures:NL.0/monodromy-dictionary`; `NonabelianLevelStructures:NL.0/compactified-level-stack`.

Construction or proof plan:

1. Postcompose exterior epimorphisms by automorphisms of G.
2. Surjectivity shows an automorphism fixing an exterior class is inner, proving freeness.
3. Take the finite-sheaf quotient and compare fibres and compactifications.

API:

- `TauCeti.NonabelianLevel.absolute_structures.quotient` (constructor): A section determines a (G|A)-section with the universal A-invariance property.
- `TauCeti.NonabelianLevel.absolute_structures.fiber` (characterisation): The geometric fibre is Epi^ext(F2,G)/A.
- `TauCeti.NonabelianLevel.absolute_structures.absolute` (simp): Taking A=Out(G) gives absolute structures.
- `TauCeti.NonabelianLevel.absolute_structures.nested` (functoriality): For A≤B, the quotient maps compose naturally.

Definition checks:

- **degenerate**, `absolute_structures.check_1`: A=1 recovers M(G).
- **computation**, `absolute_structures.check_2`: For G=C2, Out(G)=1 and absolute structures still give the degree-three cover.
- **non-example**, `absolute_structures.check_3`: An outer automorphism can exchange two Higman classes; a quotient of one stratum is then not defined without taking their union.

Acceptance:

- A=1 recovers M(G).
- For G=C2, Out(G)=1 and absolute structures still give the degree-three cover.
- An outer automorphism can exchange two Higman classes; a quotient of one stratum is then not defined without taking their union.

Uses:

- `CHEN2024, Definition 2.5.13 and Situation 2.5.14, pp. 346–347`: The absolute and intermediate level structures supplies A section determines a (G|A)-section with the universal A-invariance property.; The geometric fibre is Epi^ext(F2,G)/A.
- `NonabelianLevelStructures:NL.7/geometric-markoff-components`: Markoff components and Higman classes: Import the finite-field transitivity and point count from the lower combinatorial part of G-DYNAMICS, with the cross-stage ordering stated in that contract.
- `NonabelianLevelStructures:NL.7/projective-absolute-quotient`: The projective absolute-level quotient: Use the existing even sign action; identify it with central twists of rank-two representations.

Source: Chen, Definition 2.5.13 and Situation 2.5.14, pp. 346–347.

### Cofinality of elliptic nonabelian levels

Target `NonabelianLevelStructures:NL.0/cofinality` · theorem.

Every connected finite étale cover of M(1) over Qbar is dominated by a connected component of M(G) for some finite two-generated G. Consequently, for any smooth projective geometrically connected curve X/Qbar there is a nonempty open U⊂X and a component N of an elliptic nonabelian level curve with a finite étale Galois map N→U. The target is the open curve U, not the whole projective X.

Hypotheses and ambient setting: G finite; all bases over Z[1/|G|]; additional characteristic-zero or generation assumptions are stated in the target.

Direct prerequisites: `NonabelianLevelStructures:NL.0/monodromy-dictionary`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3/general-riemann-existence`.

Construction or proof plan:

1. Import Asada cofinality for finite étale covers of the elliptic moduli stack through G-MAPPING, and apply the nonabelian level fibre dictionary.
2. For the curve consequence request the strengthened BBCL22 Theorem 2.2.3 contract, including the chosen open U and the Galois domination, through G-MAPPING. A general Galois closure does not by itself identify a level component.
3. Use the existing Belyi theorem for the necessary three-point open curve; retain only the nonempty open U as target, as in published Theorem 2.5.2(7).

Acceptance:

- A positive-dimensional affine level curve cannot be a finite étale surjection onto a projective curve; the open U is essential.

Source: Chen, Theorem 2.5.2(7) and its proof, pp. 337–338.

Explicit open inputs: `G-MAPPING`.

## NL.1. Cusps and their finite data

Layer inputs: `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`; `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5`; `AnabelianGeometryAndNonabelianChabauty:NC.0`; `NonabelianLevelStructures:NL.0`.

### Normalization and gluing data at a cusp

Target `NonabelianLevelStructures:NL.1/cusp-gluing-data` · definition · planet **Cusp gluing data**.

Fix an algebraically closed characteristic-zero field k, compatible primitive roots, a nodal elliptic curve E and a standard normalization ν:P¹→E taking 1 to O and identifying 0 with ∞. A gluing datum is a finite right G-equivariant map q:D→P¹ from a possibly disconnected smooth curve whose restriction over P*=P¹\{0,1,∞} is a right G-torsor, together with a G-equivariant bijection α between the reduced fibres D_0 and D_∞. Morphisms are G-equivariant cover isomorphisms respecting α. A precuspidal cover of E means the finite quotient obtained by gluing, without imposing flatness at its nodes.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; finite G; fixed standard nodal normalization and good tangential path.

Direct prerequisites: `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`; `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/admissible-g-covers`; `AnabelianGeometryAndNonabelianChabauty:NC.0/chen-good-path`.

Construction or proof plan:

1. Normalize a nodal quotient and label its two branches by 0 and ∞.
2. Record the branch-fibre identification as reduced finite sets; retain all components of D.
3. Use the existing curve gluing carrier instead of introducing another nodal-curve or graph theory.

API:

- `TauCeti.NonabelianLevel.cusp_gluing_data.mk` (constructor): Form a datum from q and an equivariant fibre bijection.
- `TauCeti.NonabelianLevel.cusp_gluing_data.normalization` (projection): Recover q and α from the normalization of the precuspidal cover.
- `TauCeti.NonabelianLevel.cusp_gluing_data.iso` (extensionality): An isomorphism is determined by its map on D and compatibility with α.
- `TauCeti.NonabelianLevel.cusp_gluing_data.changeNormalization` (functoriality): A change of standard normalization transports the datum and its gluing canonically.
- `TauCeti.NonabelianLevel.cusp_gluing_data.torsorOnComplement` (characterisation): Every geometric fibre over P* is a free transitive right G-set; the normalized cover has degree |G|.

Definition checks:

- **degenerate**, `cusp_gluing_data.check_1`: G=1 with D=P¹ and α(0)=∞ glues to the standard nodal genus-one curve.
- **non-example**, `cusp_gluing_data.check_2`: D need not be connected: for G=C2 and the generating pair (u,h)=(1,h), D is two copies of P¹, whose gluing is connected.
- **compatibility**, `cusp_gluing_data.check_3`: Only reduced branch fibres are identified; gluing a scheme-theoretic fibre of length e at a branch would create the wrong singularity.
- **non-example**, `cusp_gluing_data.nonfree_quotient`: For G=S3 and an order-two subgroup H, the faithful action on (H\G)×P¹ has quotient P¹ but is not a gluing datum: its fibres have three points with nontrivial stabilizer, rather than six torsor points.

Acceptance:

- G=1 with D=P¹ and α(0)=∞ glues to the standard nodal genus-one curve.
- D need not be connected: for G=C2 and the generating pair (u,h)=(1,h), D is two copies of P¹, whose gluing is connected.
- Only reduced branch fibres are identified; gluing a scheme-theoretic fibre of length e at a branch would create the wrong singularity.

Uses:

- `CHEN2024, Definitions 4.1.1–4.1.3, pp. 361–362; Definition 4.4.1, p. 367; Definition 4.4.2, p. 367`: The normalization and gluing data at a cusp supplies Form a datum from q and an equivariant fibre bijection.; Recover q and α from the normalization of the precuspidal cover.
- `NonabelianLevelStructures:NL.1/normalization-gluing`: The cusp normalization equivalence: Apply StableReduction Layer 3 self- and external-clutching pushouts to the finitely many paired smooth points.

Source: Chen, Definitions 4.1.1–4.1.3, pp. 361–362; Definition 4.4.1, p. 367; Definition 4.4.2, p. 367.

### The cusp normalization equivalence

Target `NonabelianLevelStructures:NL.1/normalization-gluing` · comparison.

The normalization functor is an equivalence between precuspidal covers of E and gluing data relative to ν. Its inverse is the scheme pushout identifying each x∈D_0 with α(x)∈D_∞. The pushout is prestable, has normalization D, is unchanged off the glued fibres, and its local functions are precisely those with equal values on each paired pair. Connected balanced objects correspond exactly to the cusp fibre A_G×_{Mbar(1)}{E}; automorphisms over E are vertical automorphisms.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; finite G; fixed standard nodal normalization and good tangential path.

Direct prerequisites: `NonabelianLevelStructures:NL.1/cusp-gluing-data`; `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`.

Construction or proof plan:

1. Apply StableReduction Layer 3 self- and external-clutching pushouts to the finitely many paired smooth points.
2. Descend q to the fixed nodal target and descend the right G-action by the pushout universal property.
3. Use uniqueness of normalization and the conductor to prove the two natural inverse isomorphisms.
4. Read balanced node charts from the paired inertia characters.

Acceptance:

- The normalization may be disconnected even when its glued cover is connected.
- The equivalence preserves automorphism groups over the fixed target, not all automorphisms of the target.

Source: Chen, Proposition 4.1.4, pp. 362–363; Lemma 4.4.4 and Theorem 4.4.5, pp. 369–371.

### Finite precuspidal data

Target `NonabelianLevelStructures:NL.1/precuspidal-datum` · definition · planet **Precuspidal G-data**.

For a good tangential path δ: t0→t∞ on P*=P¹\{0,1,∞}, let Π=π1(P*,t0), a free profinite group generated by γ0 and γ∞^δ=δ^{-1}γ∞δ. A precuspidal G-datum is a finite set F with a continuous left Π-action and a commuting free transitive right G-action, and a G-equivariant bijection α:⟨γ0⟩\F→⟨γ∞^δ⟩\F. For x∈F, define ϕ_x by γx=xϕ_x(γ) and H_{δ,x}={h:α([x]_0)=[x]_∞h}. This is the left coset ⟨ϕ_x(γ∞^δ)⟩h, not a chosen element.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; finite G; fixed standard nodal normalization and good tangential path.

Direct prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.0/chen-good-path`; `AnabelianGeometryAndNonabelianChabauty:NC.0/tangential-inertia-specialization`; `mathlib:CategoryTheory.PreGaloisCategory.FiberFunctor`; `mathlib:Subgroup.zpowers`.

Construction or proof plan:

1. Take the tangential fibre of q; inertia orbit sets recover the reduced branch fibres.
2. Transport the second branch along δ and then transport α.
3. Use right torsor freeness to define ϕ_x and compute the ambiguity in h.

API:

- `TauCeti.NonabelianLevel.precuspidal_datum.mk` (constructor): Bundle the commuting actions and the equivariant bijection of inertia orbit sets.
- `TauCeti.NonabelianLevel.precuspidal_datum.monodromy` (projection): ϕ_x:Π→G is continuous and changes by g^{-1}ϕ_xg when x is replaced by xg.
- `TauCeti.NonabelianLevel.precuspidal_datum.gluingCoset` (characterisation): H_{δ,x} is a nonempty left coset with the stated stabilizer.
- `TauCeti.NonabelianLevel.precuspidal_datum.fiberEquivalence` (equivalence): The tangential fibre functor is an equivalence from gluing data to these finite data.

Definition checks:

- **computation**, `precuspidal_datum.check_1`: For F=G and left multiplication by u, the γ∞ orbit set is ⟨u⟩\G, consisting of left cosets.
- **degenerate**, `precuspidal_datum.check_2`: G=1 gives the singleton datum and a unique α.
- **non-example**, `precuspidal_datum.check_3`: Dropping free transitivity of the right G-action admits disconnected non-torsor generic fibres and must fail the constructor.

Acceptance:

- For F=G and left multiplication by u, the γ∞ orbit set is ⟨u⟩\G, consisting of left cosets.
- G=1 gives the singleton datum and a unique α.
- Dropping free transitivity of the right G-action admits disconnected non-torsor generic fibres and must fail the constructor.

Uses:

- `CHEN2024, Definition 4.6.1, p. 373; Proposition 4.4.3, pp. 367–369; §4.5, pp. 371–373`: The finite precuspidal data supplies Bundle the commuting actions and the equivariant bijection of inertia orbit sets.; ϕ_x:Π→G is continuous and changes by g^{-1}ϕ_xg when x is replaced by xg.
- `NonabelianLevelStructures:NL.1/cusp-component-graph`: The graph of a glued cover: Construct the two incidence maps using orbit-set projections.
- `NonabelianLevelStructures:NL.1/balanced-cuspidal-data`: Balance and connectedness in finite data: Use the faithful cotangent inertia characters on the two branches: balance is inverse character matching.

Source: Chen, Definition 4.6.1, p. 373; Proposition 4.4.3, pp. 367–369; §4.5, pp. 371–373.

### The graph of a glued cover

Target `NonabelianLevelStructures:NL.1/cusp-component-graph` · construction.

The graph of (F,α) uses the imported nodal-curve half-edge graph: vertices are Π\F, half-edges are ⟨γ0⟩\F disjoint union ⟨γ∞^δ⟩\F, incidence is projection to Π-orbits, and the fixed-point-free reversal pairs the two summands via α and α^{-1}. It identifies with the geometric dual graph of the glued cover and admits loops and multiple edges. It is connected iff ⟨ϕ_x(Π),h⟩=G for one, equivalently every, x and h∈H_{δ,x}.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; finite G; fixed standard nodal normalization and good tangential path.

Direct prerequisites: `NonabelianLevelStructures:NL.1/precuspidal-datum`; `NonabelianLevelStructures:NL.1/normalization-gluing`; `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

Construction or proof plan:

1. Construct the two incidence maps using orbit-set projections.
2. Pair the summands by α, with no fixed half-edge.
3. Translate paths in this graph into products of monodromy elements and h; this gives the generation criterion.

API:

- `TauCeti.NonabelianLevel.cusp_component_graph.graph` (constructor): Form the graph on the existing half-edge carrier.
- `TauCeti.NonabelianLevel.cusp_component_graph.dualGraph` (compatibility): Normalization identifies it with the dual graph of the glued curve.
- `TauCeti.NonabelianLevel.cusp_component_graph.connectedIff` (characterisation): Connectedness is equivalent to ⟨ϕ_x(Π),h⟩=G.
- `TauCeti.NonabelianLevel.cusp_component_graph.relabel` (functoriality): An isomorphism of data induces the graph isomorphism, preserving paired flags.

Definition checks:

- **degenerate**, `cusp_component_graph.check_1`: G=1 gives one vertex and one loop, with two half-edges and Betti number one.
- **computation**, `cusp_component_graph.check_2`: For G=C2, u=1 and h its generator, the graph has two vertices and two edges forming a cycle; the normalization is disconnected but the graph is connected.
- **non-example**, `cusp_component_graph.check_3`: A simple graph would erase the loop in the trivial-group example and give the wrong genus.

Acceptance:

- G=1 gives one vertex and one loop, with two half-edges and Betti number one.
- For G=C2, u=1 and h its generator, the graph has two vertices and two edges forming a cycle; the normalization is disconnected but the graph is connected.
- A simple graph would erase the loop in the trivial-group example and give the wrong genus.

Uses:

- `CHEN2024, Definition 4.7.2 and Propositions 4.7.3–4.7.4, pp. 375–377`: The the graph of a glued cover supplies Form the graph on the existing half-edge carrier.; Normalization identifies it with the dual graph of the glued curve.
- `NonabelianLevelStructures:NL.1/balanced-cuspidal-data`: Balance and connectedness in finite data: Use the faithful cotangent inertia characters on the two branches: balance is inverse character matching.

Source: Chen, Definition 4.7.2 and Propositions 4.7.3–4.7.4, pp. 375–377.

### Balance and connectedness in finite data

Target `NonabelianLevelStructures:NL.1/balanced-cuspidal-data` · theorem.

The glued cover is balanced iff ϕ_x(γ0)^{-1}=h^{-1}ϕ_x(γ∞^δ)h for one, equivalently every, x and h∈H_{δ,x}. Together with graph connectedness, this is equivalent to the two conditions ϕ_x(γ0)=h^{-1}u^{-1}h and ⟨u,h⟩=G, where u=ϕ_x(γ∞^δ). The normalization, fibre and gluing equivalences restrict to connected, balanced and cuspidal full subgroupoids.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; finite G; fixed standard nodal normalization and good tangential path.

Direct prerequisites: `NonabelianLevelStructures:NL.1/precuspidal-datum`; `NonabelianLevelStructures:NL.1/cusp-component-graph`; `AnabelianGeometryAndNonabelianChabauty:NC.0/tangential-inertia-specialization`.

Construction or proof plan:

1. Use the faithful cotangent inertia characters on the two branches: balance is inverse character matching.
2. Check independence of x by conjugation and of h by the cyclic inertia ambiguity.
3. Combine the balance equation with the component-graph generation criterion.

Acceptance:

- For u=1 and h generating a cyclic group, balance holds and the glued graph is a connected polygon.
- Replacing h by u^k h leaves both the balance and generation conditions invariant.

Source: Chen, Proposition 4.5.2, pp. 372–373; Definition 4.7.1, p. 375; Propositions 4.7.6 and 4.8.1, pp. 377–378.

### The cusp invariant set I(G)

Target `NonabelianLevelStructures:NL.1/delta-classes` · definition · planet **The delta invariant**.

Let Gen2(G)={(u,h):⟨u,h⟩=G}. Define I(G) as Gen2(G) modulo simultaneous conjugation by G and the commuting Z-action (u,h)↦(u,u^k h). Write [[u,h]] for the class. The second move is left multiplication of h by an integer power of u. This quotient classifies cusp isomorphism classes only after a good path and a standard normalization have been selected.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; finite G; fixed standard nodal normalization and good tangential path.

Direct prerequisites: `mathlib:FreeGroup`; `mathlib:Subgroup.zpowers`; `mathlib:MulAction.orbit`.

Construction or proof plan:

1. Restrict the two commuting actions to generating pairs.
2. Use the existing action quotient/setoid infrastructure and verify the generated equivalence relation.
3. Expose quotient descent and the explicit criterion for equality of classes.

API:

- `TauCeti.NonabelianLevel.delta_classes.class` (constructor): Map a generating pair to [[u,h]].
- `TauCeti.NonabelianLevel.delta_classes.eqIff` (characterisation): Equality is simultaneous conjugation followed by one twist h↦u^k h.
- `TauCeti.NonabelianLevel.delta_classes.descent` (universal-property): A function constant on both moves descends uniquely to I(G).
- `TauCeti.NonabelianLevel.delta_classes.groupIso` (functoriality): A group isomorphism induces an equivalence of I-sets.

Definition checks:

- **degenerate**, `delta_classes.check_1`: I(1) has exactly one element.
- **computation**, `delta_classes.check_2`: For C2, the generating pairs (1,h), (h,1), (h,h) give two classes: the last two are twist-equivalent and the first has u=1.
- **non-example**, `delta_classes.check_3`: Nongenerating (1,1) is not an element of I(G) for nontrivial G.

Acceptance:

- I(1) has exactly one element.
- For C2, the generating pairs (1,h), (h,1), (h,h) give two classes: the last two are twist-equivalent and the first has u=1.
- Nongenerating (1,1) is not an element of I(G) for nontrivial G.

Uses:

- `CHEN2024, Definition 4.8.2, p. 378; Theorem 4.8.4, pp. 379–380`: The the cusp invariant set i(g) supplies Map a generating pair to [[u,h]].; Equality is simultaneous conjugation followed by one twist h↦u^k h.
- `NonabelianLevelStructures:NL.1/standard-cusp`: Standard cusp from a generating pair: Use the free profinite universal property to define the two finite left permutations.
- `NonabelianLevelStructures:NL.2/cusp-automorphism-data`: The cusp automorphism group A(G,u,h): Prove closure of the displayed set under multiplication and inverse using commutation with u and h^{-1}uh.

Source: Chen, Definition 4.8.2, p. 378; Theorem 4.8.4, pp. 379–380.

### Standard cusp from a generating pair

Target `NonabelianLevelStructures:NL.1/standard-cusp` · construction.

For a generating pair (u,h), take F=G as a right torsor, let γ∞^δ act by left multiplication by u and γ0 by left multiplication by h^{-1}u^{-1}h, and define α(⟨h^{-1}u^{-1}h⟩x)=⟨u⟩hx. This is a connected balanced datum. Its normalization monodromy is M_{u,h}=⟨u,h^{-1}u^{-1}h⟩; its glued curve has [G:M_{u,h}] irreducible components.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; finite G; fixed standard nodal normalization and good tangential path.

Direct prerequisites: `NonabelianLevelStructures:NL.1/balanced-cuspidal-data`; `NonabelianLevelStructures:NL.1/delta-classes`.

Construction or proof plan:

1. Use the free profinite universal property to define the two finite left permutations.
2. Check α is well-defined on left cosets using conjugation by h.
3. The balance equation is built in, and the generation criterion gives connectedness.

API:

- `TauCeti.NonabelianLevel.standard_cusp.datum` (constructor): The formulas give a cuspidal datum and hence a cover.
- `TauCeti.NonabelianLevel.standard_cusp.monodromy` (characterisation): The monodromy subgroup at 1 is M_{u,h}.
- `TauCeti.NonabelianLevel.standard_cusp.changePair` (compatibility): Simultaneous conjugation and integer twisting give isomorphic data.
- `TauCeti.NonabelianLevel.standard_cusp.components` (characterisation): Irreducible components are the left M_{u,h}-orbits in G.

Definition checks:

- **degenerate**, `standard_cusp.check_1`: u=h=1 in G=1 gives the nodal elliptic curve itself.
- **computation**, `standard_cusp.check_2`: For cyclic G generated by h and u=1, M_{u,h}=1 and the source is a |G|-gon.
- **compatibility**, `standard_cusp.check_3`: For G=S3, u a 3-cycle and h a transposition, M_{u,h}=C3, giving two normalization components.

Acceptance:

- u=h=1 in G=1 gives the nodal elliptic curve itself.
- For cyclic G generated by h and u=1, M_{u,h}=1 and the source is a |G|-gon.
- For G=S3, u a 3-cycle and h a transposition, M_{u,h}=C3, giving two normalization components.

Uses:

- `CHEN2024, Definition 4.8.3, pp. 378–379; Theorem 4.10.3(c), p. 385`: The standard cusp from a generating pair supplies The formulas give a cuspidal datum and hence a cover.; The monodromy subgroup at 1 is M_{u,h}.
- `NonabelianLevelStructures:NL.1/delta-classification`: Classification of cusps and their Higman class: Changing the torsor point conjugates the pair; changing the gluing representative multiplies h by u^k.
- `NonabelianLevelStructures:NL.2/cusp-automorphism-data`: The cusp automorphism group A(G,u,h): Prove closure of the displayed set under multiplication and inverse using commutation with u and h^{-1}uh.

Source: Chen, Definition 4.8.3, pp. 378–379; Theorem 4.10.3(c), p. 385.

### Classification of cusps and their Higman class

Target `NonabelianLevelStructures:NL.1/delta-classification` · theorem.

The assignment (F,α)↦[[ϕ_x(γ∞^δ),h]] is independent of x and h and gives a bijection from isomorphism classes in the fixed cusp fibre of A_G to I(G), with inverse the standard construction. For [[u,h]], the Higman class is the class of [u^{-1},h^{-1}], which is conjugate to [u,h]. This is a bijection on isomorphism classes; it does not discard the automorphism groups of the cusp stack.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; finite G; fixed standard nodal normalization and good tangential path.

Direct prerequisites: `NonabelianLevelStructures:NL.1/standard-cusp`; `NonabelianLevelStructures:NL.0/higman-invariant`.

Construction or proof plan:

1. Changing the torsor point conjugates the pair; changing the gluing representative multiplies h by u^k.
2. Choose x as the torsor origin to identify any datum with its standard construction.
3. Use the good-path relation for the remaining puncture and the inertia-character convention to compute the Higman word.

Acceptance:

- For every abelian G the computed Higman class is 1.
- For S3 and (u,h) as above, it is a 3-cycle class.

Source: Chen, Theorem 4.8.4 and Definition 4.8.5, pp. 379–380; Proposition 4.8.6, p. 380.

### Inversion of the target at a cusp

Target `NonabelianLevelStructures:NL.1/cusp-inversion` · theorem · planet **Cusp inversion**.

Choose a symmetric good path. Pullback by [−1] on the nodal elliptic target sends [[u,h]] to [[u^{-1},h^{-1}]]. The target involution lifts to the cover iff these classes agree, equivalently iff (u^{-1},h^{-1}) is simultaneously conjugate to (u,u^r h) for some integer r. Existence of a lift does not choose a splitting of the resulting automorphism-group extension.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; finite G; fixed standard nodal normalization and good tangential path.

Direct prerequisites: `NonabelianLevelStructures:NL.1/delta-classification`; `AnabelianGeometryAndNonabelianChabauty:NC.0/symmetric-good-path-existence`.

Construction or proof plan:

1. Import the symmetric-path transformation identities rather than using a literal reflection of an arbitrary path.
2. Compute the two new generators and gluing coset after inversion.
3. Translate equality in I(G) into existence of an isomorphism of the pulled-back cusp.

Acceptance:

- The formula applied twice returns the same I(G)-class.
- A lift exists exactly under the stated conjugation-and-twist criterion; the criterion alone supplies no order-two lift.

Source: Chen, Proposition 4.9.1, pp. 380–382.

## NL.2. Cusp automorphism groups

Layer inputs: `NonabelianLevelStructures:NL.1`; `NonabelianLevelStructures:NL.0`; `AlgebraicModuliForArithmeticGeometry:R09.5`; `ModularCurvesPartII:R13.2`.

### The cusp automorphism group A(G,u,h)

Target `NonabelianLevelStructures:NL.2/cusp-automorphism-data` · definition · planet **Cusp automorphism groups**.

For finite G and generating (u,h), put M=⟨u,h^{-1}u^{-1}h⟩ and A(G,u,h)={a∈C_G(M):[a,h]∈⟨u⟩}. Let k_{u,h} be the least positive k such that (u,h) is simultaneously conjugate to (u,u^k h); it exists since k=|u| works. Retain Mathlib centralizers, cyclic subgroups and element orders. The restriction z(a)=[a,h] takes values in ⟨u⟩.

Hypotheses and ambient setting: Finite G and a generating pair (u,h); geometric cusp computations in characteristic zero.

Direct prerequisites: `NonabelianLevelStructures:NL.1/delta-classes`; `NonabelianLevelStructures:NL.1/standard-cusp`; `mathlib:Subgroup.centralizer`; `mathlib:Subgroup.zpowers`; `mathlib:commutatorElement`; `mathlib:orderOf`.

Construction or proof plan:

1. Prove closure of the displayed set under multiplication and inverse using commutation with u and h^{-1}uh.
2. The positive twist periods form the multiples of a divisor of |u|, defining k.
3. Define z as a homomorphism after checking the commutator multiplication formula on this subgroup.

API:

- `TauCeti.NonabelianLevel.cusp_automorphism_data.mem` (characterisation): Membership is exactly centralizing M and having [a,h] in ⟨u⟩.
- `TauCeti.NonabelianLevel.cusp_automorphism_data.period` (constructor): k is positive, divides |u| and characterizes all twist periods.
- `TauCeti.NonabelianLevel.cusp_automorphism_data.commutatorMap` (structure): z:A→⟨u⟩ is a group homomorphism.
- `TauCeti.NonabelianLevel.cusp_automorphism_data.conjugatePair` (functoriality): Conjugating (u,h) conjugates A and preserves k.

Definition checks:

- **degenerate**, `cusp_automorphism_data.check_1`: For abelian G, A=G, z=1 and k=|u|.
- **computation**, `cusp_automorphism_data.check_2`: For G=S3, u=(123), h=(12), A=⟨u⟩, k=1, and z maps onto ⟨u⟩.
- **compatibility**, `cusp_automorphism_data.check_3`: If M=G then A=Z(G), z=1 and k=|u|; this uses the existing centralizer of the full group.

Acceptance:

- For abelian G, A=G, z=1 and k=|u|.
- For G=S3, u=(123), h=(12), A=⟨u⟩, k=1, and z maps onto ⟨u⟩.
- If M=G then A=Z(G), z=1 and k=|u|; this uses the existing centralizer of the full group.

Uses:

- `CHEN2024, Proposition 4.10.1, pp. 383–384; Theorem 4.10.3, pp. 384–386`: The the cusp automorphism group a(g,u,h) supplies Membership is exactly centralizing M and having [a,h] in ⟨u⟩.; k is positive, divides |u| and characterizes all twist periods.
- `NonabelianLevelStructures:NL.2/automorphism-exact-sequence`: The cusp automorphism exact sequence: A torsor endomorphism commuting with right multiplication is left multiplication by a, and Π-equivariance means a centralizes M.
- `NonabelianLevelStructures:NL.3/combinatorial-obstructions`: The finite group obstruction pair: Form the finite family of cyclic ramification-point stabilizers using the cusp formula.

Source: Chen, Proposition 4.10.1, pp. 383–384; Theorem 4.10.3, pp. 384–386.

### The cusp automorphism exact sequence

Target `NonabelianLevelStructures:NL.2/automorphism-exact-sequence` · theorem · planet **Cusp automorphism exact sequence**.

For the preceding data, ker z=Z(G), im z=⟨u^{k_{u,h}}⟩ and 1→Z(G)→A(G,u,h)→⟨u^{k_{u,h}}⟩→1 is exact. In particular |A|=|Z(G)|·|u|/k_{u,h}. Evaluation at 1 identifies A with automorphisms of the standard datum, hence with vertical automorphisms of its glued cover.

Hypotheses and ambient setting: Finite G and a generating pair (u,h); geometric cusp computations in characteristic zero.

Direct prerequisites: `NonabelianLevelStructures:NL.2/cusp-automorphism-data`; `NonabelianLevelStructures:NL.1/normalization-gluing`.

Construction or proof plan:

1. A torsor endomorphism commuting with right multiplication is left multiplication by a, and Π-equivariance means a centralizes M.
2. Respecting α is equivalent to [a,h]∈⟨u⟩.
3. Compute the kernel using generation by u,h and the image using the twist-period characterization.

Acceptance:

- For D10 with u a rotation and h a reflection, |A|=5, |Z|=1, k=1 and the image has order 5.
- For an abelian G, z is trivial and the formula gives |A|=|G|, with k=|u|.

Source: Chen, Proposition 4.10.1, pp. 383–384; Theorem 4.10.3(a), pp. 384–385.

### Full and marked cusp stabilizers

Target `NonabelianLevelStructures:NL.2/cusp-stabilizers` · theorem.

For a cusp [[u,h]], Aut^v=A(G,u,h). The full automorphism group equals A if [[u,h]] is not fixed by inversion, and otherwise is an extension 1→A→Aut→C2→1. At a ramification point above O the vertical stabilizer is A∩⟨[u^{-1},h^{-1}]⟩. The cover is irreducible iff M_{u,h}=G. Moreover Mbar(G)→Mbar(1) is representable iff A(G,u,h)=Z(G), equivalently k_{u,h}=|u|, for every generating pair.

Hypotheses and ambient setting: Finite G and a generating pair (u,h); geometric cusp computations in characteristic zero.

Direct prerequisites: `NonabelianLevelStructures:NL.2/automorphism-exact-sequence`; `NonabelianLevelStructures:NL.1/cusp-inversion`; `NonabelianLevelStructures:NL.0/compactified-level-stack`; `AlgebraicModuliForArithmeticGeometry:R09.5/vertical-kernel-rigidification`.

Construction or proof plan:

1. Use the normalizer/gluing description to compute the stabilizer of an origin point.
2. Apply the lift criterion for the target involution to determine the image in Aut(E)=C2.
3. Use the imported inertia representability criterion after rigidifying by Z(G).

Acceptance:

- For D10 the source has two normalization components and vertical cusp group C5.
- After rigidification, representability is tested at every cusp and not only on the dense smooth locus.

Source: Chen, Theorem 4.10.3(a′)–(d), pp. 384–386.

### Comparison with abelian full levels

Target `NonabelianLevelStructures:NL.2/abelian-level-comparison` · comparison.

For abelian G, every cusp has A(G,u,h)=G=Z(G), so the rigidified forgetful map is representable. For G=(Z/n)^2 with n≥3, the resulting compactified full-level stack agrees with the existing Deligne–Rapoport full-level problem over Z[1/n], respecting determinant/Weil-pairing components; its cuspidal objects have no residual automorphisms. This is a comparison with the imported full-level carrier, not a second construction of modular curves.

Hypotheses and ambient setting: Finite G and a generating pair (u,h); geometric cusp computations in characteristic zero.

Direct prerequisites: `NonabelianLevelStructures:NL.2/cusp-stabilizers`; `ModularCurvesPartII:R13.2`.

Construction or proof plan:

1. Identify connected abelian punctured-elliptic torsors with étale isogenies and their level duals.
2. Use the full marking at unramified origins and the existing generalized elliptic compactification.
3. Check n≥3 kills residual automorphisms on each pairing component.

Acceptance:

- For G=(Z/3)^2, the comparison retains separate Weil-pairing components.
- Each cusp has no residual automorphisms after the central rigidification for n≥3.

Source: Chen, Remark 4.10.4, p. 386.

### The odd-dihedral obstruction example

Target `NonabelianLevelStructures:NL.2/dihedral-obstruction` · application.

For G=D_{2k}, k odd and k≥3, a generating pair has commutator of order k, but each compactified coarse component has degree 3 over P¹_j; there are φ(k)/2 components. The centralizer obstruction is d′=1, while m′=k; for a rotation u and a reflection h, M=⟨u⟩, A=⟨u⟩ and k_{u,h}=1. Thus divisibility of the coarse degree by the inertia order can fail arbitrarily strongly.

Hypotheses and ambient setting: Finite G and a generating pair (u,h); geometric cusp computations in characteristic zero.

Direct prerequisites: `NonabelianLevelStructures:NL.2/automorphism-exact-sequence`; `NonabelianLevelStructures:NL.0/monodromy-dictionary`; `mathlib:Nat.totient`.

Construction or proof plan:

1. Compute the dihedral generating pairs and their commutators directly.
2. Count their exterior monodromy orbits to obtain φ(k)/2 orbits of degree 3; no Chen 2018 theorem is taken as an unexamined axiom.
3. Compute C_G(⟨c⟩)=⟨c⟩, so the centralizer quotient is trivial.

Acceptance:

- k=3 gives the S3 component of degree 3.
- k=5 gives two components of degree 3 although the inertia order is 5.

Source: Chen, §4.11, p. 388, using Chen 2018, Theorem 4.2.2.

## NL.3. Cotangent lines and degree congruences

Layer inputs: `NonabelianLevelStructures:NL.0`; `SchemeAndStackFoundations:SF.2`; `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`; `SchemeAndStackFoundations:SF.5`; `ModularCurvesPartII:R13.4a`; `NonabelianLevelStructures:NL.2`.

### The universal section cotangent line

Target `NonabelianLevelStructures:NL.3/section-cotangent` · construction · planet **Section cotangent line**.

On A_G with origin inertia e≥2, let R be the universal reduced ramification divisor. For a connected component R_X over a component X of A_G, pull back the universal source C and target E to R_X and use its tautological section σ of C. The line L=σ*ω_{C/R_X} is canonically the conormal of σ and has a base-change-compatible isomorphism L^⊗e ≅ f*λ, where λ=O*ω_{E/A_G}. Here f:R_X→X→Ell_1 and ω is the relative dualizing line on the imported prestable family. The section is contained in C_sm, even at a cuspidal moduli point.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; connected admissible-cover component; origin inertia e≥2.

Direct prerequisites: `NonabelianLevelStructures:NL.0/reduced-ramification`; `SchemeAndStackFoundations:SF.2/relative-dualizing-module`; `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

Construction or proof plan:

1. Import the canonical map Ω→ω and its smooth-locus isomorphism, with representable stack base-change from request Q-DUAL.
2. For the section ideals I in E and J in C, the tame local equation gives I·O_C=J^e.
3. Take conormal lines along the sections; their e-th power comparison is independent of coordinates and descends.

API:

- `TauCeti.NonabelianLevel.section_cotangent.line` (constructor): The tautological section defines the invertible cotangent sheaf L.
- `TauCeti.NonabelianLevel.section_cotangent.power` (compatibility): L^⊗e≅f*λ, functorially under all base changes.
- `TauCeti.NonabelianLevel.section_cotangent.character` (characterisation): At a geometric point the vertical inertia acts through its faithful action on the smooth branch parameter.
- `TauCeti.NonabelianLevel.section_cotangent.dualizing` (compatibility): The line computed by the conormal agrees with σ*ω on the existing relative dualizing carrier.

Definition checks:

- **computation**, `section_cotangent.check_1`: For x=ξ^3, the target conormal generator maps to the third tensor power of the source conormal generator.
- **non-example**, `section_cotangent.check_2`: Pulling the differential dx to the ramified point gives zero; the power isomorphism comes from ideals, not from the differential map dπ.
- **compatibility**, `section_cotangent.check_3`: The same isomorphism holds above a nodal target since the marked section stays in the smooth locus.

Acceptance:

- For x=ξ^3, the target conormal generator maps to the third tensor power of the source conormal generator.
- Pulling the differential dx to the ramified point gives zero; the power isomorphism comes from ideals, not from the differential map dπ.
- The same isomorphism holds above a nodal target since the marked section stays in the smooth locus.

Uses:

- `CHEN2024, §3.1, pp. 348–351; Proposition 3.3.1, pp. 353–354`: The the universal section cotangent line supplies The tautological section defines the invertible cotangent sheaf L.; L^⊗e≅f*λ, functorially under all base changes.
- `NonabelianLevelStructures:NL.3/degree-obstructions`: The cotangent and cover obstructions: Take the finite coarse degree and the least common multiples of the orders of the finite stabilizer characters.
- `NonabelianLevelStructures:NL.3/main-degree-congruence`: The component degree congruence: Let n_X,n_R denote the generic stabilizer orders. By the section power relation and the stack pullback formula, e·deg(L)=(2/n_R)d_X·D/24, where D is the coarse j-degree.

Source: Chen, §3.1, pp. 348–351; Proposition 3.3.1, pp. 353–354.

### The stack Hodge degree

Target `NonabelianLevelStructures:NL.3/hodge-degree` · theorem · planet **Hodge degree**.

Over an algebraically closed characteristic-zero field, deg_{Ell_1}(λ)=1/24. For a proper smooth connected tame Deligne–Mumford curve Y with generic stabilizer order n_Y and a line whose stabilizer characters all vanish, its degree lies in (1/n_Y)Z. If g:Y→X is nonconstant between such curves, then deg_Y(g*L)=(n_X/n_Y) deg(g_coarse) deg_X(L). Degrees here are the rational stack degrees imported from SF.5, not degrees on coarse curves without the stabilizer correction.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; connected admissible-cover component; origin inertia e≥2.

Direct prerequisites: `SchemeAndStackFoundations:SF.5/dm-rational-degree`; `ModularCurvesPartII:R13.4a/coarse-local-structure`; `ModularCurvesPartII:R13.4a/compactified-coarse-j-line`.

Construction or proof plan:

1. Request the precise smooth-DM-curve degree and coarse pullback formulas Q-DEGREE from SF.5, retaining its existing foundational gap.
2. Use the existing λ^12≅j*O(1) statement, not a new construction of the Hodge bundle or compactified j-line.
3. The generic stabilizer of Ell_1 has order 2, so deg(j*O(1))=1/2 and division by 12 gives 1/24.

Acceptance:

- Using degree 1/12 would incorrectly replace the stack by its generic rigidification.
- On a curve with trivial generic stabilizer, a character-trivial line has integral degree.

Source: Chen, Proposition 3.4.8 and Proposition 3.4.9, pp. 357–358.

### The cotangent and cover obstructions

Target `NonabelianLevelStructures:NL.3/degree-obstructions` · definition.

For a connected characteristic-zero component X⊂A_G of inertia e≥2, define d_X as the degree of the induced map of coarse curves R_X^coarse→X^coarse for a connected component of universal R. Define m_X as the least positive integer killing the stabilizer character of L at every geometric point of R_X. Define m′_X similarly using only vertical automorphisms over the target elliptic curve. All components R_X are isomorphic, and these integers are independent of their choice. Finite inertia and finite type make the least common multiples finite; use exponent 1 for trivial characters.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; connected admissible-cover component; origin inertia e≥2.

Direct prerequisites: `NonabelianLevelStructures:NL.3/section-cotangent`; `NonabelianLevelStructures:NL.0/ramification-monodromy`; `SchemeAndStackFoundations:SF.5/dm-rational-degree`.

Construction or proof plan:

1. Take the finite coarse degree and the least common multiples of the orders of the finite stabilizer characters.
2. Use the isomorphisms of connected ramification covers to prove independence of R_X.
3. Distinguish full and vertical stabilizers before comparing their exponents.

API:

- `TauCeti.NonabelianLevel.degree_obstructions.coverDegree` (constructor): Return the positive coarse degree d_X.
- `TauCeti.NonabelianLevel.degree_obstructions.characterExponent` (constructor): Return m_X and m′_X, both positive.
- `TauCeti.NonabelianLevel.degree_obstructions.killsIff` (characterisation): An integer kills every relevant character iff the corresponding least common multiple divides it.
- `TauCeti.NonabelianLevel.degree_obstructions.componentIndependent` (compatibility): Changing R_X changes none of the three integers.

Definition checks:

- **degenerate**, `degree_obstructions.check_1`: If every vertical stabilizer acts trivially, m′_X=1, not 0.
- **non-example**, `degree_obstructions.check_2`: d_X is the coarse degree, and cannot be replaced by the stack degree when generic stabilizers differ.
- **computation**, `degree_obstructions.check_3`: For a character family with image orders 2 and 4, the least common killing exponent is lcm(2,4)=4, rather than the product 8.

Acceptance:

- If every vertical stabilizer acts trivially, m′_X=1, not 0.
- d_X is the coarse degree, and cannot be replaced by the stack degree when generic stabilizers differ.
- For a character family with image orders 2 and 4, the least common killing exponent is lcm(2,4)=4, rather than the product 8.

Uses:

- `CHEN2024, §3.4, pp. 354–358; Theorem 3.5.1 and its proof, pp. 358–359`: The the cotangent and cover obstructions supplies Return the positive coarse degree d_X.; Return m_X and m′_X, both positive.
- `NonabelianLevelStructures:NL.3/local-character-bounds`: Full and vertical character bounds: The quotient of a full stabilizer by its vertical subgroup embeds in Aut(E,O), whose relevant character exponent divides 12 in characteristic zero.
- `NonabelianLevelStructures:NL.3/main-degree-congruence`: The component degree congruence: Let n_X,n_R denote the generic stabilizer orders. By the section power relation and the stack pullback formula, e·deg(L)=(2/n_R)d_X·D/24, where D is the coarse j-degree.

Source: Chen, §3.4, pp. 354–358; Theorem 3.5.1 and its proof, pp. 358–359.

### Full and vertical character bounds

Target `NonabelianLevelStructures:NL.3/local-character-bounds` · theorem.

With the preceding hypotheses, m′_X divides m_X and m_X divides 12m′_X. Also d_X divides |C_G(⟨c⟩)/⟨c⟩| for the Higman generator c. At a smooth cover Aut^v(C,π,x)=Z(G)∩⟨c⟩. At an arbitrary ramification point its vertical automorphism group acts faithfully on the cotangent line: use freeness on the punctured smooth branch, together with the finite-order tame local action, rather than a general assertion that tangent representations are faithful.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; connected admissible-cover component; origin inertia e≥2.

Direct prerequisites: `NonabelianLevelStructures:NL.3/degree-obstructions`; `NonabelianLevelStructures:NL.0/ramification-monodromy`; `NonabelianLevelStructures:NL.2/cusp-stabilizers`.

Construction or proof plan:

1. The quotient of a full stabilizer by its vertical subgroup embeds in Aut(E,O), whose relevant character exponent divides 12 in characteristic zero.
2. Use the faithful branch action to identify the vertical character order with the order of its cyclic stabilizer.
3. Apply the centralizer-monodromy embedding to d_X and compute the smooth-locus central automorphisms.

Acceptance:

- For D10 the vertical character has exponent 5; the universal constant 12 cannot replace m′_X.
- The degree bound uses the centralizer quotient after adjoining roots of unity, retaining that hypothesis.

Source: Chen, Theorem 3.5.1 proof and Proposition 3.5.2, pp. 358–359.

### The component degree congruence

Target `NonabelianLevelStructures:NL.3/main-degree-congruence` · theorem · planet **Component degree congruence**.

Let k be algebraically closed of characteristic zero, G finite, X a connected component of A_G,k of inertia e≥2, and d_X,m_X as above. Then 12e/gcd(12e,m_X d_X) divides deg(X^coarse→P¹_j). In particular the degree is positive and the assertion concerns the whole compactified coarse component; its smooth open has the same generic degree.

Hypotheses and ambient setting: Algebraically closed characteristic-zero field; connected admissible-cover component; origin inertia e≥2.

Direct prerequisites: `NonabelianLevelStructures:NL.3/hodge-degree`; `NonabelianLevelStructures:NL.3/degree-obstructions`; `NonabelianLevelStructures:NL.3/section-cotangent`.

Construction or proof plan:

1. Let n_X,n_R denote the generic stabilizer orders. By the section power relation and the stack pullback formula, e·deg(L)=(2/n_R)d_X·D/24, where D is the coarse j-degree.
2. Since m_X kills all stabilizer characters, n_R m_X deg(L) is integral. Therefore 12e divides m_X d_X D.
3. Apply the elementary gcd cancellation equivalence to obtain the stated divisor.

Acceptance:

- The derivation retains n_R until it cancels; replacing rational stack degree by coarse degree at the outset loses a factor 2.
- e=1 lies outside the ramification-divisor construction and is not inferred by choosing an empty component.

Source: Chen, Theorem 3.5.1, pp. 358–359.

### The finite group obstruction pair

Target `NonabelianLevelStructures:NL.3/combinatorial-obstructions` · definition · planet **Combinatorial obstructions**.

For finite G and c∈G, let P_c be the generating pairs (u,h) for which [u,h] is conjugate to c. For each pair put M=⟨u,h^{-1}u^{-1}h⟩ and A={a∈C_G(M):[a,h]∈⟨u⟩}, as in NL.2. Define m′_c to be the least common multiple, over P_c, of the exponents of A∩⟨[u^{-1},h^{-1}]⟩. Define d′_c=|C_G(⟨c⟩)/⟨c⟩|. Each intersection is cyclic; the least common multiple of an empty family is 1. These are invariants of the conjugacy class of c.

Hypotheses and ambient setting: Finite group G and c∈G; no geometric component or nontrivial-inertia hypothesis is required.

Direct prerequisites: `NonabelianLevelStructures:NL.2/cusp-automorphism-data`; `NonabelianLevelStructures:NL.2/cusp-stabilizers`; `mathlib:Subgroup.centralizer`; `mathlib:Subgroup.zpowers`.

Construction or proof plan:

1. Form the finite family of cyclic ramification-point stabilizers using the cusp formula.
2. Use their group exponents, with the empty-family unit convention.
3. Use centralization of c to make ⟨c⟩ normal in its centralizer and form the existing finite group quotient.

API:

- `TauCeti.NonabelianLevel.combinatorial_obstructions.verticalExponent` (constructor): Return m′_c with divisibility by every cusp stabilizer exponent.
- `TauCeti.NonabelianLevel.combinatorial_obstructions.centralizerQuotient` (constructor): Return the positive integer d′_c.
- `TauCeti.NonabelianLevel.combinatorial_obstructions.conjugacy` (functoriality): Conjugating c leaves both integers unchanged.
- `TauCeti.NonabelianLevel.combinatorial_obstructions.bounds` (characterisation): Every actual cusp vertical character exponent divides m′_c, and d_X divides d′_c.

Definition checks:

- **degenerate**, `combinatorial_obstructions.check_1`: For G=1,c=1, both invariants equal 1.
- **computation**, `combinatorial_obstructions.check_2`: For D10 and c a nontrivial rotation, m′_c=5 and d′_c=1.
- **non-example**, `combinatorial_obstructions.check_3`: For a c which is not a commutator of a generating pair, the pair family is empty and m′_c=1; this alone asserts no nonempty moduli stratum.

Acceptance:

- For G=1,c=1, both invariants equal 1.
- For D10 and c a nontrivial rotation, m′_c=5 and d′_c=1.
- For a c which is not a commutator of a generating pair, the pair family is empty and m′_c=1; this alone asserts no nonempty moduli stratum.

Uses:

- `CHEN2024, Theorem 4.10.5 and its proof, pp. 386–387`: The the finite group obstruction pair supplies Return m′_c with divisibility by every cusp stabilizer exponent.; Return the positive integer d′_c.
- `NonabelianLevelStructures:NL.3/combinatorial-congruence`: The Higman and Nielsen congruences: If c=1, the claimed modulus is 1 and the conclusion is immediate; otherwise the inertia order is at least 2.
- `NonabelianLevelStructures:NL.4/j-zero-group-bound`: The normal-subgroup-free obstruction bound: Choose a cusp cyclic stabilizer containing z of order ℓ^k. Because |A| divides |u||Z(G)| and Z(G) is a proper normal ℓ-free subgroup, ℓ^k divides |u|.

Source: Chen, Theorem 4.10.5 and its proof, pp. 386–387.

### The Higman and Nielsen congruences

Target `NonabelianLevelStructures:NL.3/combinatorial-congruence` · theorem · planet **Higman congruence**.

For any nonempty characteristic-zero G-cover component with Higman class c, the integer |c|/gcd(|c|,m′_c d′_c) divides its coarse j-degree. It also divides the cardinality of every Out^+(F2)-orbit on Epi^ext(F2,G) of that class. The unquotiented orbit has the coarse degree or twice that degree, according as γ−I fixes or does not fix an exterior pair. The claim is not that this modulus divides the number of cusps.

Hypotheses and ambient setting: Finite G and c∈G; for the geometric assertion a nonempty connected component over an algebraically closed characteristic-zero field. The case c=1 is allowed and has modulus 1.

Direct prerequisites: `NonabelianLevelStructures:NL.3/main-degree-congruence`; `NonabelianLevelStructures:NL.3/local-character-bounds`; `NonabelianLevelStructures:NL.3/combinatorial-obstructions`; `NonabelianLevelStructures:NL.0/monodromy-dictionary`.

Construction or proof plan:

1. If c=1, the claimed modulus is 1 and the conclusion is immediate; otherwise the inertia order is at least 2.
2. Bound m_X by 12m′_c and d_X by d′_c and cancel 12 in the main divisibility.
3. Use density of the smooth locus and the explicit cusp stabilizer formula to bound every vertical character, including interior points.
4. Translate coarse degree to exterior Nielsen orbit size, retaining the possible factor 2.

Acceptance:

- For D10 with rotation inertia 5, m′=5 and d′=1 make the modulus 1, consistently with degree 3.
- The coarse orbit quotient can halve a Nielsen orbit; the displayed modulus still divides the larger orbit size.

Source: Chen, Theorem 4.10.5 and Remark 4.10.6, pp. 386–387.

## NL.4. Finite group obstruction bounds

Layer inputs: `NonabelianLevelStructures:NL.3`; `NonabelianLevelStructures:NL.2`.

### The normal-subgroup-free obstruction bound

Target `NonabelianLevelStructures:NL.4/j-zero-group-bound` · theorem · planet **Group obstruction bound**.

Let ℓ be prime, G finite nonabelian and c∈G, with r=ν_ℓ(|c|) and r+s=ν_ℓ(|G|). Assume G has no proper normal subgroup whose order is divisible by ℓ. If k=ν_ℓ(m′_c)>0, then G contains C_{ℓ^k}×C_{ℓ^k}, hence 2k≤r+s. Also ν_ℓ(d′_c)≤s. Consequently ν_ℓ(m′_c)≤⌊(r+s)/2⌋. This is the j=0 case only; it does not assert the printed general-j bound.

Hypotheses and ambient setting: Finite nonabelian G; ℓ prime; valuation and normal-subgroup hypotheses exactly as stated.

Direct prerequisites: `NonabelianLevelStructures:NL.3/combinatorial-obstructions`; `NonabelianLevelStructures:NL.2/automorphism-exact-sequence`; `mathlib:Nat.factorization`.

Construction or proof plan:

1. Choose a cusp cyclic stabilizer containing z of order ℓ^k. Because |A| divides |u||Z(G)| and Z(G) is a proper normal ℓ-free subgroup, ℓ^k divides |u|.
2. Put U=⟨u⟩ and U_h=⟨h^{-1}uh⟩. Their intersection is normalized by h (equal orders of subgroups in a cyclic group) and by u, hence is a proper normal ℓ-free subgroup.
3. The cyclic groups ⟨z⟩∩U and ⟨z⟩∩U_h cannot both have nontrivial ℓ-parts: their unique subgroups of order ℓ would coincide inside ⟨z⟩ and lie in U∩U_h. Choose the one with trivial intersection.
4. Since z centralizes U and U_h, its product with the chosen cyclic subgroup of order ℓ^k is C_{ℓ^k}². Lagrange gives 2k≤r+s. The inequality ν_ℓ(d′_c)≤s follows from |c|d′_c≤|G|. General j needs a repaired intersection estimate and is recorded as G-GENERAL-J.

Acceptance:

- The absence of ℓ-divisible proper normal subgroups is essential; D10 at ℓ=5 violates it and has m′=5.
- For r=1,s=0 the inequality forces k=0.

Source: Chen, Lemmas 4.12.1–4.12.2 and Corollary 4.12.4(a), pp. 389–390.

Explicit open inputs: `G-GENERAL-J`.

### The prime-power component bound

Target `NonabelianLevelStructures:NL.4/j-zero-degree-bound` · theorem · planet **Prime-power congruence**.

Under the hypotheses of the preceding bound, every nonempty Higman-c component and every associated Out^+(F2)-orbit has degree or size divisible by ℓ^max(⌈(r−3s)/2⌉,0). Here r=ν_ℓ(|c|) and r+s=ν_ℓ(|G|); ℓ need not be odd. This output uses only the proved j=0 obstruction estimate.

Hypotheses and ambient setting: Finite nonabelian G; ℓ prime; valuation and normal-subgroup hypotheses exactly as stated.

Direct prerequisites: `NonabelianLevelStructures:NL.4/j-zero-group-bound`; `NonabelianLevelStructures:NL.3/combinatorial-congruence`.

Construction or proof plan:

1. The valuation of the obstruction product is at most ⌊(r+s)/2⌋+s.
2. Subtract it from r, truncate at zero, and simplify r−⌊(r+s)/2⌋−s=⌈(r−3s)/2⌉.
3. Apply the finite-group congruence and its exterior-orbit comparison.

Acceptance:

- For r=1,s=0 the conclusion gives divisibility by ℓ; for r≤3s it asserts only the trivial modulus 1.
- The deduction uses no general-j invariant-factor claim.

Source: Chen, Corollary 4.12.5(a), p. 391, restricted to j=0.

Explicit open inputs: `G-GENERAL-J`.

### The simple-group congruence

Target `NonabelianLevelStructures:NL.4/simple-group-congruence` · theorem · planet **Simple-group congruence**.

Let G be finite nonabelian simple and not isomorphic to PSL2(F_q) for any prime power q. Let c∈G have ℓ-primary order ℓ^r with ℓ prime and ℓ^(r+1)≥|G|^(1/3). Assuming the abelian-subgroup cube bound |B|³<|G| for every abelian B≤G, every associated component degree and Out^+(F2)-orbit size is divisible by ℓ^⌈r/2⌉. The named unconditional theorem needs the missing Vdovin input G-VDOVIN; the conditional deduction is completely specified here.

Hypotheses and ambient setting: Finite nonabelian G; ℓ prime; valuation and normal-subgroup hypotheses exactly as stated.

Direct prerequisites: `NonabelianLevelStructures:NL.4/j-zero-group-bound`; `NonabelianLevelStructures:NL.3/combinatorial-congruence`.

Construction or proof plan:

1. A nontrivial ℓ-part in C_G(c)/⟨c⟩ gives an abelian subgroup of order at least ℓ^(r+1), contradicting the strict cube bound. Thus ν_ℓ(d′_c)=0.
2. If k=ν_ℓ(m′_c)>r/2, the direct product C_{ℓ^k}² from the j=0 lemma has order at least ℓ^(r+1), the same contradiction.
3. Apply the Higman congruence. Import the CFSG-dependent abelian bound through G-VDOVIN, rather than infer it from Dickson classification.

Acceptance:

- The exclusion covers PSL2 over every finite field, not just prime fields.
- The non-strict assumption ℓ^(r+1)≥|G|^(1/3) still contradicts the strict abelian cube inequality.

Source: Chen, Theorem 4.12.3 and Corollary 4.12.5(b), pp. 390–391; the cited Vdovin Theorem A is the unread input recorded in G-VDOVIN.

Explicit open inputs: `G-VDOVIN`.

## NL.5. Rank-two trace coordinates

Layer inputs: `NonabelianLevelStructures:NL.0`; `ArithmeticGaloisRepresentations:R01.4`; `LanglandsParameterStacks:LP3`; `ClassicalArithmeticCompletion:CA.4`; `ArithmeticGaloisRepresentations:R01.1`; `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-5-skolem-noether-and-the-centralizer-theorem`.

### Trace strata of SL2-covers

Target `NonabelianLevelStructures:NL.5/trace-invariant` · definition · planet **Trace invariant**.

For a prime power q and an SL2(F_q)-cover over Qbar, fix the compatible roots exp(2πi/n) through a chosen embedding in C. Define its trace invariant t as tr(c), where c is its Higman representative in SL2(F_q). Conjugacy invariance makes it independent of the ramification point. The t-strata are unions of Higman strata and are open and closed. The invariant descends through central rigidification and GL2(F_q)-conjugation. The root convention is part of the definition; arbitrary coprime powers of c need not preserve its trace.

Hypotheses and ambient setting: Commutative coefficient rings for integral trace identities; finite fields for trace fibres; q restrictions exactly as stated.

Direct prerequisites: `NonabelianLevelStructures:NL.0/higman-components`; `mathlib:Matrix.SpecialLinearGroup`; `mathlib:Matrix.trace`.

Construction or proof plan:

1. Apply matrix trace to a Higman representative with the fixed root convention.
2. Use trace invariance under conjugation and the local constancy of Higman classes.
3. Descend along the central rigidification and the diagonal outer action.

API:

- `TauCeti.NonabelianLevel.trace_invariant.value` (constructor): Return t∈F_q for a cover with its fixed Higman convention.
- `TauCeti.NonabelianLevel.trace_invariant.stratum` (characterisation): The t-locus is exactly the union of Higman classes with trace t.
- `TauCeti.NonabelianLevel.trace_invariant.baseChange` (functoriality): The stratum pulls back along every base change of the coefficient scheme.
- `TauCeti.NonabelianLevel.trace_invariant.inverse` (compatibility): tr(c^{-1})=tr(c), so the positive-peripheral and commutator-inverse conventions give the same t.

Definition checks:

- **computation**, `trace_invariant.check_1`: A noncentral matrix −[[1,1],[0,1]] in odd characteristic has trace −2 and order 2p.
- **non-example**, `trace_invariant.check_2`: Trace −2 does not force the matrix to equal −I.
- **compatibility**, `trace_invariant.check_3`: In characteristic 2 the labels 2 and −2 coincide, so they cannot define disjoint strata.

Acceptance:

- A noncentral matrix −[[1,1],[0,1]] in odd characteristic has trace −2 and order 2p.
- Trace −2 does not force the matrix to equal −I.
- In characteristic 2 the labels 2 and −2 coincide, so they cannot define disjoint strata.

Uses:

- `CHEN2024, Definition 5.1.1, p. 392`: The trace strata of sl2-covers supplies Return t∈F_q for a cover with its fixed Higman convention.; The t-locus is exactly the union of Higman classes with trace t.
- `NonabelianLevelStructures:NL.5/admissible-traces`: Admissible trace classes: Use the finite-field character coordinates and the classification of proper irreducible subgroups to decide which fibres contain generating pairs.

Source: Chen, Definition 5.1.1, p. 392.

### Admissible trace classes

Target `NonabelianLevelStructures:NL.5/admissible-traces` · definition.

Call a conjugacy class, or trace, q-admissible if it occurs as the commutator class, or trace, of a generating pair of SL2(F_q). For G=SL2(F_q), a trace t occurs as the commutator of a generating pair precisely as follows: all t≠2 for q=2,4,8 or q≥13; all t other than 1,2 for q=3,9,11; all t other than 0,2,4 for q=5; all t other than 0,1,2 for q=7. For t≠±2 there is one SL2-conjugacy class of trace t. When q is odd and −2 is admissible there are two admissible noncentral classes of trace −2, interchanged by a nonsquare-determinant GL2-conjugation. The central class of −I is excluded from these two classes.

Hypotheses and ambient setting: Commutative coefficient rings for integral trace identities; finite fields for trace fibres; q restrictions exactly as stated.

Direct prerequisites: `NonabelianLevelStructures:NL.5/trace-invariant`; `ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement`; `NonabelianLevelStructures:NL.5/finite-field-trace-bijection`.

Construction or proof plan:

1. Use the finite-field character coordinates and the classification of proper irreducible subgroups to decide which fibres contain generating pairs.
2. Separate central and noncentral unipotent conjugacy classes.
3. Check the exceptional small fields by exhaustive exact enumeration, recording q and the admitted set; do not infer them from a generic q formula.

API:

- `TauCeti.NonabelianLevel.admissible_traces.predicate` (constructor): Define admissibility of a class and of a trace by existence of a generating pair.
- `TauCeti.NonabelianLevel.admissible_traces.nonempty` (characterisation): The trace-t level moduli stack is nonempty iff t is q-admissible.
- `TauCeti.NonabelianLevel.admissible_traces.classification` (characterisation): The admitted traces and number of conjugacy classes are exactly those listed above.
- `TauCeti.NonabelianLevel.admissible_traces.outerSwap` (compatibility): For odd q with admissible −2, nonsquare determinant conjugation swaps the two noncentral classes.

Definition checks:

- **computation**, `admissible_traces.check_1`: For q=5, exactly traces 1 and 3 are admissible.
- **computation**, `admissible_traces.check_2`: For q=3, trace 1=−2 is excluded.
- **computation**, `admissible_traces.check_3`: For q=7, the admissible traces are 3,4,5,6.

Acceptance:

- For q=5 the admissible traces are 1 and 3=−2.
- For q=3, −2=1 is excluded.
- The two noncentral −2 classes are distinguished before passing to the GL2-induced outer quotient.

Uses:

- `CHEN2024, Definition 5.1.2 and Proposition 5.1.3, pp. 392–393`: The admissible trace classes supplies Define admissibility of a class and of a trace by existence of a generating pair.; The trace-t level moduli stack is nonempty iff t is q-admissible.
- `NonabelianLevelStructures:NL.7/geometric-markoff-components`: Markoff components and Higman classes: Import the finite-field transitivity and point count from the lower combinatorial part of G-DYNAMICS, with the cross-stage ordering stated in that contract.

Source: Chen, Definition 5.1.2 and Proposition 5.1.3, pp. 392–393.

### The noncentral trace order

Target `NonabelianLevelStructures:NL.5/noncentral-trace-order` · definition · planet **Noncentral trace order**.

For a∈F_q define n_q(a) to be the order of any noncentral element of SL2(F_q) of trace a. For q even and a=0 it is 2. For q odd, n_q(2)=p and n_q(−2)=2p. In every other case, choose a root ω of X²−aX+1 in F_{q²}; then n_q(a)=ord(ω), independent of the root. This definition excludes central matrices, whose orders at traces ±2 would be different.

Hypotheses and ambient setting: Commutative coefficient rings for integral trace identities; finite fields for trace fibres; q restrictions exactly as stated.

Direct prerequisites: `mathlib:Matrix.SpecialLinearGroup`; `mathlib:Matrix.trace`.

Construction or proof plan:

1. Use the rational canonical forms with fixed determinant and trace.
2. For repeated roots use the nontrivial Jordan block, with order p or 2p.
3. For distinct roots use diagonalization over F_{q²}; exchanging ω and ω^{-1} leaves the order unchanged.

API:

- `TauCeti.NonabelianLevel.noncentral_trace_order.value` (constructor): Define n_q(a) by the explicit characteristic-dependent cases.
- `TauCeti.NonabelianLevel.noncentral_trace_order.orderOf` (characterisation): Every noncentral trace-a matrix has order n_q(a).
- `TauCeti.NonabelianLevel.noncentral_trace_order.root` (compatibility): For distinct roots, n_q(a)=ord(ω)=ord(ω^{-1}).
- `TauCeti.NonabelianLevel.noncentral_trace_order.split` (characterisation): For distinct roots the order divides q−1 in the split case and q+1 in the nonsplit case.

Definition checks:

- **computation**, `noncentral_trace_order.check_1`: n_5(2)=5 and n_5(−2)=10.
- **non-example**, `noncentral_trace_order.check_2`: The central matrix −I has trace −2 but order 2, so is not covered by orderOf.
- **computation**, `noncentral_trace_order.check_3`: Over F4 an irreducible X²−aX+1 has root order 5, even though its discriminant a² is a square.

Acceptance:

- n_5(2)=5 and n_5(−2)=10.
- The central matrix −I has trace −2 but order 2, so is not covered by orderOf.
- Over F4 an irreducible X²−aX+1 has root order 5, even though its discriminant a² is a square.

Uses:

- `CHEN2024, Definition 5.1.4 and Proposition 5.1.5, pp. 393–394`: The the noncentral trace order supplies Define n_q(a) by the explicit characteristic-dependent cases.; Every noncentral trace-a matrix has order n_q(a).
- `NonabelianLevelStructures:NL.6/rotation-order`: The exact cusp rotation order: Diagonalize L_a over F_q or F_{q²} when its eigenvalues are distinct. A nonzero coordinate vector has period equal to the eigenvalue order; both inverse eigenvalues have that order.
- `NonabelianLevelStructures:NL.6/sl2-centralizer-bounds`: SL2 centralizer and cover degrees: Compute the centralizer of a nontrivial Jordan block directly.

Source: Chen, Definition 5.1.4 and Proposition 5.1.5, pp. 393–394.

### The rank-two SL2 character scheme

Target `NonabelianLevelStructures:NL.5/rank-two-character-variety` · construction · planet **Rank-two character scheme**.

For every commutative ring R, take the existing affine scheme SL2_R×SL2_R with diagonal GL2_R-conjugation. Its affine invariant quotient is the rank-two SL2 character scheme. The map (A,B)↦(tr A,tr B,tr AB) induces an isomorphism of invariant coordinate algebras R[x,y,z]≅O(SL2²)^GL2, and hence an isomorphism of the quotient with A³_R, compatible with every ring base change. Invariants here mean the group-scheme coaction, not invariance under only the finite group of R-valued points.

Hypotheses and ambient setting: Commutative coefficient rings for integral trace identities; finite fields for trace fibres; q restrictions exactly as stated.

Direct prerequisites: `LanglandsParameterStacks:LP3`; `mathlib:Matrix.SpecialLinearGroup`; `mathlib:Matrix.trace`.

Construction or proof plan:

1. Request the exact integral n=2 matrix-invariant generation, arbitrary-base-change, and determinant-one restriction statements Q-INVARIANTS from LP.3. These do not follow from the mere existence of reductive invariants.
2. Reduce words in two determinant-one 2×2 matrices by Cayley–Hamilton to the three traces.
3. Prove algebraic independence on a universal three-parameter family, then use the requested integral base-change theorem.

API:

- `TauCeti.NonabelianLevel.rank_two_character_variety.quotient` (constructor): Form the affine quotient using the existing scheme and invariant algebra carriers.
- `TauCeti.NonabelianLevel.rank_two_character_variety.coordinates` (equivalence): The trace-coordinate algebra map is an isomorphism over every R.
- `TauCeti.NonabelianLevel.rank_two_character_variety.baseChange` (functoriality): The isomorphism commutes with arbitrary R→S, including nonflat maps.
- `TauCeti.NonabelianLevel.rank_two_character_variety.conjugacy` (compatibility): The coordinate map is invariant under GL2-scheme conjugation; geometric orbit assertions require the absolutely irreducible locus.

Definition checks:

- **computation**, `rank_two_character_variety.check_1`: For (I,I) the coordinates are (2,2,2), with values reduced in R.
- **compatibility**, `rank_two_character_variety.check_2`: After reduction Z→F2 the same polynomial algebra is obtained; dividing by 2 in the proof is invalid.
- **non-example**, `rank_two_character_variety.check_3`: Reducible pairs with identical semisimplification can have equal coordinates without being conjugate; the quotient does not classify all actual orbits.

Acceptance:

- For (I,I) the coordinates are (2,2,2), with values reduced in R.
- After reduction Z→F2 the same polynomial algebra is obtained; dividing by 2 in the proof is invalid.
- Reducible pairs with identical semisimplification can have equal coordinates without being conjugate; the quotient does not classify all actual orbits.

Uses:

- `CHEN2024, Theorem 5.2.1 and Definitions 5.2.2–5.2.3, pp. 395–396; Appendix 6.2, pp. 426–427`: The the rank-two sl2 character scheme supplies Form the affine quotient using the existing scheme and invariant algebra carriers.; The trace-coordinate algebra map is an isomorphism over every R.
- `NonabelianLevelStructures:NL.5/fricke-trace-polynomial`: The commutator trace polynomial: Use Cayley–Hamilton A^{-1}=tr(A)I−A and the analogous identity for B.

Source: Chen, Theorem 5.2.1 and Definitions 5.2.2–5.2.3, pp. 395–396; Appendix 6.2, pp. 426–427.

### The commutator trace polynomial

Target `NonabelianLevelStructures:NL.5/fricke-trace-polynomial` · theorem · planet **Fricke trace identity**.

For any commutative ring R and A,B∈SL2(R), with x=tr A,y=tr B,z=tr AB, one has tr([A,B])=x²+y²+z²−xyz−2. Thus the fixed commutator-trace fibre t is the already-owned CA.4 Markoff level surface of level t+2. The identity is integral, including residue characteristics 2 and 3.

Hypotheses and ambient setting: Commutative coefficient rings for integral trace identities; finite fields for trace fibres; q restrictions exactly as stated.

Direct prerequisites: `NonabelianLevelStructures:NL.5/rank-two-character-variety`; `ClassicalArithmeticCompletion:CA.4/markoff-level-surface`.

Construction or proof plan:

1. Use Cayley–Hamilton A^{-1}=tr(A)I−A and the analogous identity for B.
2. Expand tr(ABA^{-1}B^{-1}) and reduce squares with determinant 1.
3. Identify the imported surface parameter as t+2, not t.

Acceptance:

- (I,I) gives commutator trace 2.
- The parabolic t=−2 locus is x²+y²+z²−xyz=0.

Source: Chen, Lemma 5.2.4, p. 396.

### Outer automorphisms in trace coordinates

Target `NonabelianLevelStructures:NL.5/outer-trace-action` · theorem · planet **Outer trace action**.

Right precomposition by Aut(F2) induces an antihomomorphism to polynomial automorphisms of A³_R. It factors through Out(F2)/⟨−I⟩≅PGL2(Z). The Nielsen generators r:(a,b)↦(a^{-1},b), s:(a,b)↦(b,a), t:(a,b)↦(a^{-1},ab) act by (x,y,xy−z), (y,x,z), (x,z,y). The central −I acts trivially. This identifies the image with the group generated by these Vieta/permutation moves, but asserts no faithfulness. The full CA.4 Markoff group also has even sign changes and must be compared as a larger group.

Hypotheses and ambient setting: Commutative coefficient rings for integral trace identities; finite fields for trace fibres; q restrictions exactly as stated.

Direct prerequisites: `NonabelianLevelStructures:NL.5/fricke-trace-polynomial`; `ClassicalArithmeticCompletion:CA.4/markoff-hurwitz-moves`; `mathlib:FreeGroup`.

Construction or proof plan:

1. Compute the three trace transforms using tr(AB)+tr(AB^{-1})=tr(A)tr(B).
2. Check the right-action composition order explicitly.
3. Use G-MAPPING for Out(F2)=GL2(Z) and the central class, and identify only the indicated image subgroup of the imported move action.

Acceptance:

- The homomorphism from Aut(F2) has inner automorphisms and γ−I in its kernel, so the published hooked arrow from Aut(F2) cannot mean injectivity. No nonfaithfulness of the induced PGL2(Z) action is claimed.
- Even sign changes are induced by central twists of the representation, rather than by these three generators alone.

Source: Chen, Proposition 5.2.5, pp. 396–397; factorization by inner and central inversion invariance.

Explicit open inputs: `G-MAPPING`.

### The matrix-algebra criterion

Target `NonabelianLevelStructures:NL.5/matrix-algebra-criterion` · theorem.

For a commutative ring R and A,B∈SL2(R), the R-subalgebra generated by A and B is M2(R) iff tr([A,B])−2=x²+y²+z²−xyz−4 is a unit. Over a field this is equivalent to absolute irreducibility of the associated two-generator representation, using the existing R01.1 predicate. Over a general ring the conclusion is the full matrix-algebra condition; no field-only representation predicate is silently extended.

Hypotheses and ambient setting: Commutative coefficient rings for integral trace identities; finite fields for trace fibres; q restrictions exactly as stated.

Direct prerequisites: `NonabelianLevelStructures:NL.5/fricke-trace-polynomial`; `ArithmeticGaloisRepresentations:R01.1/absolutely-irreducible`.

Construction or proof plan:

1. Cayley–Hamilton reduces the generated algebra to the span of I,A,B,AB.
2. Its determinant in the standard matrix basis is a unit exactly when the displayed commutator-trace difference is a unit.
3. Over a field use the supplied Burnside characterization of absolute irreducibility.

Acceptance:

- If A and B are simultaneously upper triangular the determinant vanishes.
- Over Z an element which is merely nonzero is not a unit, so the field formulation cannot replace the ring statement.

Source: Chen, Lemma 5.2.9, p. 398.

### Finite-field trace fibres

Target `NonabelianLevelStructures:NL.5/finite-field-trace-bijection` · theorem · planet **Finite-field trace bijection**.

For every finite field F_q the trace map SL2(F_q)²→F_q³ is surjective. On the absolutely irreducible locus it induces a bijection from simultaneous GL2(F_q)-conjugacy classes to triples with x²+y²+z²−xyz−2≠2. No surjectivity from generating pairs is asserted for all triples. In particular the GL2 quotient must be distinguished from the finer SL2 quotient in odd characteristic.

Hypotheses and ambient setting: Commutative coefficient rings for integral trace identities; finite fields for trace fibres; q restrictions exactly as stated.

Direct prerequisites: `NonabelianLevelStructures:NL.5/matrix-algebra-criterion`; `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-5-skolem-noether-and-the-centralizer-theorem`.

Construction or proof plan:

1. Construct representatives by the explicit two-by-two normal forms in the proof, including the singular trace fibre.
2. Two absolutely irreducible representatives with the same traces define the same full matrix algebra multiplication table.
3. Use Skolem–Noether for M2(F_q) to conjugate the induced algebra isomorphism; if a descent proof is chosen instead, its finite-field PGL2 torsor vanishing must be separately supplied.

Acceptance:

- Exhaustive q=3 and q=5 traces cover every triple, while the generation restriction excludes some traces.
- The centralizer of an absolutely irreducible pair consists of scalars; the descent step therefore gives GL2-conjugacy rather than a spurious SL2 bijection.

Source: Chen, Theorem 5.2.10, pp. 398–400.

### The diagonal outer group

Target `NonabelianLevelStructures:NL.5/diagonal-outer-action` · definition.

For G≤SL2(F_q), define D(q,G) to be the image of N_GL2(F_q)(G) in Out(G), equivalently N_GL2(F_q)(G)/(G·C_GL2(F_q)(G)). For G=SL2(F_q), write D(q); its order is 1 for even q and 2 for odd q, and for prime p, D(p)=Out(SL2(F_p)). This is the group which identifies SL2-conjugacy classes within one GL2-conjugacy class.

Hypotheses and ambient setting: Commutative coefficient rings for integral trace identities; finite fields for trace fibres; q restrictions exactly as stated.

Direct prerequisites: `ArithmeticGaloisRepresentations:R01.4/normal-subgroups-and-automorphisms-of-psl2-pgl2`; `mathlib:Subgroup.centralizer`.

Construction or proof plan:

1. Use conjugation by the normalizer and take its image in the existing outer automorphism quotient.
2. Identify the kernel as G times the centralizer, retaining inner automorphisms in that kernel.
3. For full SL2, determinant square classes compute the image; treat p=2,3 directly and use R01.4 only with its stated q restrictions.

API:

- `TauCeti.NonabelianLevel.diagonal_outer_action.image` (constructor): Construct the subgroup D(q,G) of Out(G).
- `TauCeti.NonabelianLevel.diagonal_outer_action.quotient` (equivalence): D(q,G) is the quotient N/(G·C), not N/C.
- `TauCeti.NonabelianLevel.diagonal_outer_action.traceFiber` (characterisation): Its orbits on exterior pairs are the GL2-conjugacy classes.
- `TauCeti.NonabelianLevel.diagonal_outer_action.fullOrder` (characterisation): |D(q)|=gcd(2,q−1).

Definition checks:

- **computation**, `diagonal_outer_action.check_1`: For q=5, D(q) has order 2, whereas N/C contains PSL2(F5) of order 60.
- **computation**, `diagonal_outer_action.check_2`: For q=4, D(q) is trivial.
- **non-example**, `diagonal_outer_action.check_3`: For a general subgroup G, N/C measures automorphisms including inner ones and cannot be used as the outer image.

Acceptance:

- For q=5, D(q) has order 2, whereas N/C contains PSL2(F5) of order 60.
- For q=4, D(q) is trivial.
- For a general subgroup G, N/C measures automorphisms including inner ones and cannot be used as the outer image.

Uses:

- `CHEN2024, Definition 5.2.12 and Proposition 5.2.13, pp. 400–401`: The the diagonal outer group supplies Construct the subgroup D(q,G) of Out(G).; D(q,G) is the quotient N/(G·C), not N/C.
- `NonabelianLevelStructures:NL.5/finite-subgroup-refinements`: The non-dihedral subgroup refinements: Import the full projective subgroup list with actual subfield conditions; do not interpret q′|q as sufficient.
- `NonabelianLevelStructures:NL.6/trace-moduli-dictionary`: The trace and moduli correspondence: Descend the finite-field GL2 trace bijection by the rational normalizer action, and restrict to one actual image type.

Source: Chen, Definition 5.2.12 and Proposition 5.2.13, pp. 400–401.

### Rationality of SLn normalizers

Target `NonabelianLevelStructures:NL.5/sl2-normalizer-descent` · theorem.

Let q be a prime power and n≥2. The normalizer of SL_n(F_q) in GL_n(F̄_q) is F̄_q^×·GL_n(F_q). For n=1 both sides equal F̄_q^×. Consequently an algebraic-closure conjugator between the standard full SL_n(F_q) groups can be rescaled to an F_q-rational conjugator. This is the specific normalizer theorem used here, not a new general Skolem–Noether development. The same normalizer formula holds with GL_n(F_q) in place of SL_n(F_q).

Hypotheses and ambient setting: Commutative coefficient rings for integral trace identities; finite fields for trace fibres; q restrictions exactly as stated.

Direct prerequisites: `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-5-skolem-noether-and-the-centralizer-theorem`.

Construction or proof plan:

1. If A normalizes SL_n(F_q), compare Frobenius(A) with A: A^{-1}Frobenius(A) centralizes every elementary matrix over F_q and hence is scalar.
2. All nonzero ratios between entries of A are Frobenius-fixed.
3. Rescale by any nonzero entry to obtain an invertible matrix over F_q; the converse is immediate.

Acceptance:

- For n=1 the normalizer equality reduces to the full multiplicative algebraic-closure group.
- Rescaling the conjugator preserves its conjugation action and places all matrix entries in F_q.

Source: Chen, Proposition 6.3.1, p. 428.

### The non-dihedral subgroup refinements

Target `NonabelianLevelStructures:NL.5/finite-subgroup-refinements` · theorem.

For q≥3 and an absolutely irreducible non-dihedral G≤SL2(F_q), the projective image is a subfield PSL2 or PGL2 group, or A4,S4,A5, with the characteristic-dependent cases and subfield embeddings supplied by Dickson classification. Then |D(q,G)|≤2. Every such G contains Z(SL2(F_q)). Its cusp-automorphism consequence is proved in NL.6 using the rotation period, rather than assumed from classification. The printed S5 is replaced by S4, and the quotient in the outer bound is N/(G·C).

Hypotheses and ambient setting: Commutative coefficient rings for integral trace identities; finite fields for trace fibres; q restrictions exactly as stated.

Direct prerequisites: `ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement`; `ArithmeticGaloisRepresentations:R01.4/normal-subgroups-and-automorphisms-of-psl2-pgl2`; `NonabelianLevelStructures:NL.5/sl2-normalizer-descent`; `NonabelianLevelStructures:NL.5/diagonal-outer-action`.

Construction or proof plan:

1. Import the full projective subgroup list with actual subfield conditions; do not interpret q′|q as sufficient.
2. For PSL2/PGL2 types apply the rational normalizer theorem and the supplied automorphism theorem.
3. Request Q-DICKSON for the exceptional-group central extension and normalizer calculations; the paper invokes GAP for multipliers, which is not an existing Lean theorem.
4. For odd q, an even-order projective element has a lift whose suitable power is −I; use the subgroup list to ensure such an element. The even-q center is trivial.

Acceptance:

- The exceptional projective list contains S4 and no S5.
- G=SL2(F5) has outer normalizer quotient of order 2, providing a counterexample to the printed N/C bound.

Source: Chen, Appendix 6.4, pp. 428–430; Theorem 5.3.2, pp. 405–406.

## NL.6. SL2 stabilizers and orbit congruences

Layer inputs: `NonabelianLevelStructures:NL.5`; `ClassicalArithmeticCompletion:CA.4`; `ArithmeticGaloisRepresentations:R01.4`; `NonabelianLevelStructures:NL.0`; `NonabelianLevelStructures:NL.2`; `NonabelianLevelStructures:NL.3`.

### The geometric trace subsets

Target `NonabelianLevelStructures:NL.6/trace-level-subsets` · definition · planet **Geometric trace subsets**.

Use the imported CA.4 surface at level t+2 for X_t(q). Define X_t*(q) as its triples corresponding under the finite-field trace bijection to absolutely irreducible representations whose projective image is neither trivial nor dihedral; the dihedral group of order 2 is included in the exclusion. Define X_t°(q) by surjectivity onto SL2(F_q). For t≠2, X_t*(q) consists exactly of triples having at least two nonzero coordinates. Both subsets at t=2 are empty. For q≥3, X_t°⊂X_t*; for q=2, X*(2) is empty and X°(2) is not. For prime p≥3 and t=−2, both subsets equal the punctured Markoff surface. This last equality is not extended to proper prime-power fields.

Hypotheses and ambient setting: q=p^f≥3 unless an explicit q=2 boundary example is given; t≠2 where required.

Direct prerequisites: `NonabelianLevelStructures:NL.5/finite-field-trace-bijection`; `ClassicalArithmeticCompletion:CA.4/markoff-level-surface`; `ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement`.

Construction or proof plan:

1. Define the subsets by the actual image of a trace representative and prove independence under GL2-conjugacy.
2. Use the projective dihedral classification to obtain the two-nonzero-coordinate criterion on t≠2.
3. Use the prime-field proper-subgroup exclusions for the t=−2 surjectivity assertion; request the exact refinement in Q-DICKSON.

API:

- `TauCeti.NonabelianLevel.trace_level_subsets.nonDihedral` (constructor): The subset X_t* uses the existing field absolute-irreducibility predicate and the projective image condition.
- `TauCeti.NonabelianLevel.trace_level_subsets.surjective` (constructor): The subset X_t° uses an epimorphic trace representative.
- `TauCeti.NonabelianLevel.trace_level_subsets.coordinateIff` (characterisation): For t≠2, membership in X_t* is equivalent to at least two nonzero coordinates.
- `TauCeti.NonabelianLevel.trace_level_subsets.markoffPrime` (compatibility): For odd prime p at t=−2, X_t*=X_t° equals the punctured imported surface.
- `TauCeti.NonabelianLevel.trace_level_subsets.moveStable` (functoriality): Both subsets are stable under the imported Vieta/permutation image action.

Definition checks:

- **degenerate**, `trace_level_subsets.check_1`: The origin is excluded from X_{−2}*(p) for every odd prime p.
- **computation**, `trace_level_subsets.check_2`: Over F2 the punctured zero-level Markoff surface has four points, but X_{−2}°(2)=∅ since −2=2.
- **non-example**, `trace_level_subsets.check_3`: At q=2 the inclusion X°⊂X* fails; a blanket all-q inclusion must be rejected.
- **compatibility**, `trace_level_subsets.check_4`: At p=5 the geometric subset is the 40 nonzero zero-level points; no rescaling by 3 is needed for the coefficient-one equation.

Acceptance:

- The origin is excluded from X_{−2}*(p) for every odd prime p.
- Over F2 the punctured zero-level Markoff surface has four points, but X_{−2}°(2)=∅ since −2=2.
- At q=2 the inclusion X°⊂X* fails; a blanket all-q inclusion must be rejected.
- At p=5 the geometric subset is the 40 nonzero zero-level points; no rescaling by 3 is needed for the coefficient-one equation.

Uses:

- `CHEN2024, Definitions 5.2.14–5.2.15 and Propositions 5.2.16–5.2.17, pp. 401–402`: The the geometric trace subsets supplies The subset X_t* uses the existing field absolute-irreducibility predicate and the projective image condition.; The subset X_t° uses an epimorphic trace representative.
- `NonabelianLevelStructures:NL.6/trace-moduli-dictionary`: The trace and moduli correspondence: Descend the finite-field GL2 trace bijection by the rational normalizer action, and restrict to one actual image type.
- `NonabelianLevelStructures:NL.6/rotation-conics`: Rotation fibres and their linear operator: Take the coordinate fibre of the existing surface; this is a geometric slice, not a second definition of the surface or of the Vieta moves.
- `NonabelianLevelStructures:NL.7/projective-absolute-quotient`: The projective absolute-level quotient: Use the existing even sign action; identify it with central twists of rank-two representations.

Source: Chen, Definitions 5.2.14–5.2.15 and Propositions 5.2.16–5.2.17, pp. 401–402.

### The trace and moduli correspondence

Target `NonabelianLevelStructures:NL.6/trace-moduli-dictionary` · construction · planet **Trace and moduli correspondence**.

Let q≥3, let ϕ:F2→SL2(F_q) have absolutely irreducible non-dihedral image G, and let P be its trace triple. The fibre of M(G)/D(q,G) over a geometric elliptic curve is Epi^ext(F2,G)/D(q,G); trace identifies it with the triples having GL2-conjugate image G. Its Out^+(F2)-orbit O corresponds to one coarse connected component of degree |O|. The branch permutations are γ0(x,y,z)=(xy−z,x,x²y−xz−y), γ1728(x,y,z)=(y,x,xy−z), γ∞(x,y,z)=(x,z,xz−y); γ−I is the identity. Fibres above 0,1728,∞ are the cycles of the respective permutations, with ramification index equal to cycle length.

Hypotheses and ambient setting: q=p^f≥3 unless an explicit q=2 boundary example is given; t≠2 where required.

Direct prerequisites: `NonabelianLevelStructures:NL.0/monodromy-dictionary`; `NonabelianLevelStructures:NL.5/outer-trace-action`; `NonabelianLevelStructures:NL.5/diagonal-outer-action`; `NonabelianLevelStructures:NL.6/trace-level-subsets`.

Construction or proof plan:

1. Descend the finite-field GL2 trace bijection by the rational normalizer action, and restrict to one actual image type.
2. Compute the three trace transformations, preserving the antihomomorphism convention.
3. Because γ−I is trivial on trace triples, its coarse quotient does not divide the orbit size by 2.
4. Apply stack Riemann existence in G-MAPPING to obtain the coarse branch cycles.

API:

- `TauCeti.NonabelianLevel.trace_moduli_dictionary.fiber` (equivalence): Trace is a bijection on the stated finite fibre quotient.
- `TauCeti.NonabelianLevel.trace_moduli_dictionary.component` (characterisation): The degree of the corresponding coarse component is |O|.
- `TauCeti.NonabelianLevel.trace_moduli_dictionary.branchCycles` (compatibility): The three permutations identify inertia cycles and ramification indices.
- `TauCeti.NonabelianLevel.trace_moduli_dictionary.baseExtension` (functoriality): The correspondence is unchanged under algebraically closed characteristic-zero base extension.

Definition checks:

- **non-example**, `trace_moduli_dictionary.check_1`: An irreducible dihedral image does not give a point of X_t*; the omitted non-dihedral hypothesis cannot be dropped.
- **computation**, `trace_moduli_dictionary.check_2`: γ∞ sends (x,y,z) to (x,z,xz−y), fixing the first coordinate.
- **compatibility**, `trace_moduli_dictionary.check_3`: γ1728²=(x,y,z) on trace coordinates, whereas its free-group class is −I; this accounts for the coarse involution.

Acceptance:

- An irreducible dihedral image does not give a point of X_t*; the omitted non-dihedral hypothesis cannot be dropped.
- γ∞ sends (x,y,z) to (x,z,xz−y), fixing the first coordinate.
- γ1728²=(x,y,z) on trace coordinates, whereas its free-group class is −I; this accounts for the coarse involution.

Uses:

- `CHEN2024, Proposition 5.2.20 and Remark 5.2.21, pp. 403–404`: The the trace and moduli correspondence supplies Trace is a bijection on the stated finite fibre quotient.; The degree of the corresponding coarse component is |O|.
- `NonabelianLevelStructures:NL.6/rotation-conics`: Rotation fibres and their linear operator: Take the coordinate fibre of the existing surface; this is a geometric slice, not a second definition of the surface or of the Vieta moves.
- `NonabelianLevelStructures:NL.6/trace-orbit-congruence`: Trace orbit congruences: A quotient of a component by D(q,G) can decrease its degree only by a divisor of |D(q,G)|≤2; retain this factor before canceling.
- `NonabelianLevelStructures:NL.7/geometric-markoff-components`: Markoff components and Higman classes: Import the finite-field transitivity and point count from the lower combinatorial part of G-DYNAMICS, with the cross-stage ordering stated in that contract.
- `NonabelianLevelStructures:NL.7/markoff-branch-data`: Markoff branch and cusp counts: Import Φ, |X*(p)| and the rotation-orbit count through G-DYNAMICS.

Source: Chen, Proposition 5.2.20 and Remark 5.2.21, pp. 403–404.

Explicit open inputs: `G-MAPPING`.

### Rotation fibres and their linear operator

Target `NonabelianLevelStructures:NL.6/rotation-conics` · definition · planet **Rotation conics**.

For a,t∈F_q with t≠2, let C_1(a)_t be the x=a fibre of the imported surface X_t(q): y²+z²−ayz+(a²−2−t)=0. Write C_1(a)_t*=C_1(a)_t∩X_t*. The imported cusp rotation acts on (y,z) by L_a=[[0,1],[−1,a]], with characteristic polynomial X²−aX+1. Every point in C_1(a)_t* has (y,z)≠(0,0). Split and nonsplit mean splitting of this polynomial, including in characteristic 2; a discriminant square test is used only when 2 is invertible.

Hypotheses and ambient setting: q=p^f≥3 unless an explicit q=2 boundary example is given; t≠2 where required.

Direct prerequisites: `NonabelianLevelStructures:NL.6/trace-level-subsets`; `NonabelianLevelStructures:NL.6/trace-moduli-dictionary`; `ClassicalArithmeticCompletion:CA.4/markoff-hurwitz-moves`.

Construction or proof plan:

1. Take the coordinate fibre of the existing surface; this is a geometric slice, not a second definition of the surface or of the Vieta moves.
2. Restrict the rotation to the y,z-plane and compute its characteristic polynomial.
3. Use the X_t* coordinate criterion to exclude the zero vector in this slice.

API:

- `TauCeti.NonabelianLevel.rotation_conics.fiber` (constructor): Define the conic slice and its non-dihedral subset.
- `TauCeti.NonabelianLevel.rotation_conics.rotation` (compatibility): The already-owned rotation restricts to multiplication by L_a.
- `TauCeti.NonabelianLevel.rotation_conics.splitType` (characterisation): Classify L_a by its characteristic polynomial over F_q.
- `TauCeti.NonabelianLevel.rotation_conics.baseField` (functoriality): Conic formation and the matrix formula commute with finite-field embeddings; orbit lengths need not remain unchanged.

Definition checks:

- **computation**, `rotation_conics.check_1`: For odd q,a=2 the equation is (y−z)²=t−2.
- **non-example**, `rotation_conics.check_2`: A nonsplit degenerate conic with a²=t+2 has the single point (a,0,0), which is removed in X_t*; the full affine conic is not empty.
- **computation**, `rotation_conics.check_3`: In F4, choose a with X²−aX+1 irreducible: L_a has order 5 despite the discriminant being a square.

Acceptance:

- For odd q,a=2 the equation is (y−z)²=t−2.
- A nonsplit degenerate conic with a²=t+2 has the single point (a,0,0), which is removed in X_t*; the full affine conic is not empty.
- In F4, choose a with X²−aX+1 irreducible: L_a has order 5 despite the discriminant being a square.

Uses:

- `CHEN2024, Proof of Lemma 5.3.1, pp. 406–409`: The rotation fibres and their linear operator supplies Define the conic slice and its non-dihedral subset.; The already-owned rotation restricts to multiplication by L_a.
- `NonabelianLevelStructures:NL.6/rotation-order`: The exact cusp rotation order: Diagonalize L_a over F_q or F_{q²} when its eigenvalues are distinct. A nonzero coordinate vector has period equal to the eigenvalue order; both inverse eigenvalues have that order.
- `NonabelianLevelStructures:NL.6/conic-fibre-geometry`: The split and nonsplit conic fibres: For repeated roots, complete the square in y∓z and use t−2≠0.

Source: Chen, Proof of Lemma 5.3.1, pp. 406–409.

### The exact cusp rotation order

Target `NonabelianLevelStructures:NL.6/rotation-order` · theorem · planet **Exact cusp rotation order**.

For q≥3,t≠2 and P=(a,y,z)∈C_1(a)_t*, the orbit of P under γ∞ has length n_q(a). The corresponding γ∞-orbit of an absolutely irreducible non-dihedral representation, modulo diagonal outer action and conjugacy, has the order of its first matrix. Split distinct-root slices reduce to a diagonal matrix with inverse eigenvalues; nonsplit slices use a norm-one eigenvalue in F_{q²}; repeated-root slices have order p or 2p. The condition (y,z)≠(0,0) and the conic equation remove possible shorter eigenline orbits in the exceptional slices.

Hypotheses and ambient setting: q=p^f≥3 unless an explicit q=2 boundary example is given; t≠2 where required.

Direct prerequisites: `NonabelianLevelStructures:NL.6/rotation-conics`; `NonabelianLevelStructures:NL.5/noncentral-trace-order`; `NonabelianLevelStructures:NL.5/finite-field-trace-bijection`; `mathlib:Function.minimalPeriod`; `mathlib:orderOf`.

Construction or proof plan:

1. Diagonalize L_a over F_q or F_{q²} when its eigenvalues are distinct. A nonzero coordinate vector has period equal to the eigenvalue order; both inverse eigenvalues have that order.
2. For a=±2 in odd characteristic use its nontrivial Jordan part; t≠2 excludes the fixed eigenline in the parabolic conic.
3. For characteristic 2 and a=0 the operator swaps y,z, and t≠2 excludes y=z.
4. Translate back through the trace bijection, noting that a non-dihedral representation cannot have central first matrix.

Acceptance:

- Over F4 the nonsplit matrix with trace a satisfying a²+a+1=0 has order 5.
- For odd q and a=−2, a nonzero vector on the t≠2 conic has period 2p, not p.

Source: Chen, Lemma 5.3.1 and its proof, pp. 405–409.

### SL2 vertical automorphisms

Target `NonabelianLevelStructures:NL.6/sl2-vertical-stabilizers` · theorem · planet **SL2 vertical automorphisms**.

For q≥3 and absolutely irreducible non-dihedral image G≤SL2(F_q), G contains Z(SL2(F_q)), all geometric vertical automorphism groups of A_G in characteristic zero equal that center, and the rigidified compactified forgetful map Mbar(G)→Ell_1 is representable. On the reduced ramification divisor of a Higman-c stratum the vertical group is Z(SL2(F_q))∩⟨c⟩. It is trivial for even q; for odd q it has order 2 exactly when n_q(tr c) is even, including the noncentral trace −2 case of order 2p.

Hypotheses and ambient setting: q=p^f≥3 unless an explicit q=2 boundary example is given; t≠2 where required.

Direct prerequisites: `NonabelianLevelStructures:NL.6/rotation-order`; `NonabelianLevelStructures:NL.2/automorphism-exact-sequence`; `NonabelianLevelStructures:NL.2/cusp-stabilizers`; `ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement`; `NonabelianLevelStructures:NL.0/compactified-level-stack`.

Construction or proof plan:

1. The center-containment refinement of Dickson is requested in Q-DICKSON.
2. Compare the exact rotation period with |u| in the cusp automorphism exact sequence; its cyclic quotient is trivial, leaving Z(G)=Z(SL2).
3. The smooth-locus vertical group is already Z(G), so rigidification kills all relative inertia everywhere.
4. Intersect the center with the inertia subgroup at the marked ramification point.

Acceptance:

- For SL2(F5) and noncentral trace −2, the ramification stabilizer is {±I}, of order 2.
- For SL2(F4) the ambient center and all vertical stabilizers are trivial.

Source: Chen, Theorem 5.3.2, pp. 405–406; Proposition 6.4.1(a), pp. 428–429.

### SL2 cotangent character exponents

Target `NonabelianLevelStructures:NL.6/sl2-character-exponents` · theorem.

For q≥3 and G as in the preceding theorem, m_X divides 24 for every component with t≠2. It divides 12 if q is even, or if q is odd and n_q(t) is odd. These bounds use the full stabilizer exponent; m′_X is 1 or 2 as determined by the vertical ramification group, and it is not itself generally 12 or 24.

Hypotheses and ambient setting: q=p^f≥3 unless an explicit q=2 boundary example is given; t≠2 where required.

Direct prerequisites: `NonabelianLevelStructures:NL.6/sl2-vertical-stabilizers`; `NonabelianLevelStructures:NL.3/local-character-bounds`.

Construction or proof plan:

1. The faithful vertical cotangent character has order at most 2 and exactly the computed vertical group order.
2. Multiply the vertical exponent by the characteristic-zero elliptic automorphism character exponent 12.

Acceptance:

- For even q the character exponent divides 12 despite nonsplit torus orders q+1.
- For odd q, only the even-order inertia case needs the bound 24.

Source: Chen, Proposition 5.4.1, p. 410.

### SL2 centralizer and cover degrees

Target `NonabelianLevelStructures:NL.6/sl2-centralizer-bounds` · theorem.

Let q=p^f≥3 and let c∈SL2(F_q) be noncentral with t=tr(c)≠2 and n=|c|. If q is odd and t=−2, then n=2p and |C(c)|=2q, so d_X divides p^(f−1). If X²−tX+1 has distinct roots in F_q, its centralizer is cyclic of order q−1 and d_X divides (q−1)/n. If that polynomial is irreducible over F_q, its centralizer is cyclic of order q+1 and d_X divides (q+1)/n. The last two cases both occur in even characteristic. For a subgroup G as above, C_G(c) embeds in the ambient centralizer and the same divisibility bounds hold.

Hypotheses and ambient setting: q=p^f≥3 unless an explicit q=2 boundary example is given; t≠2 where required.

Direct prerequisites: `NonabelianLevelStructures:NL.5/noncentral-trace-order`; `NonabelianLevelStructures:NL.0/ramification-monodromy`.

Construction or proof plan:

1. Compute the centralizer of a nontrivial Jordan block directly.
2. In a split eigenbasis the determinant-one centralizer is F_q^×.
3. For the nonsplit case identify it with the norm-one subgroup of F_{q²}^×.
4. Divide by ⟨c⟩ and apply the ramification monodromy embedding; use the characteristic polynomial instead of the discriminant in characteristic 2.

Acceptance:

- For q=5,t=−2 the centralizer has order 10 and d_X=1.
- Over F4 a nonsplit element of order 5 has centralizer order 5; a square-discriminant test would give the wrong answer.

Source: Chen, Proposition 5.4.2, pp. 411–412, with the characteristic-2 split criterion corrected.

### SL2 component congruences

Target `NonabelianLevelStructures:NL.6/sl2-degree-congruence` · theorem.

For q=p^f≥3, a nonempty component of A_G,t with t≠2 and absolutely irreducible non-dihedral G≤SL2(F_q) has the following coarse degree divisibility, where n=n_q(t). For q=p odd and t=−2, p divides its degree. For a distinct-root split trace, n/gcd(n,ε(q−1)/n) divides its degree; for an irreducible characteristic polynomial replace q−1 by q+1. Here ε=2 for odd q and ε=1 for even q. Every quotient inside gcd is an integer. The corrected even-q assertion includes nonsplit tori.

Hypotheses and ambient setting: q=p^f≥3 unless an explicit q=2 boundary example is given; t≠2 where required.

Direct prerequisites: `NonabelianLevelStructures:NL.3/main-degree-congruence`; `NonabelianLevelStructures:NL.6/sl2-character-exponents`; `NonabelianLevelStructures:NL.6/sl2-centralizer-bounds`.

Construction or proof plan:

1. Use m_X|24 or m_X|12 and the centralizer quotient bound in 12e|m_Xd_XD.
2. For prime-field trace −2, e=2p,d_X=1 and m_X|24 force p|D, including p=3 by the exact gcd cancellation.
3. For semisimple c substitute the split or nonsplit torus order, then cancel 12.

Acceptance:

- For p=5,t=−2 the degree modulus is 5 and the Markoff component degree is 40.
- The split and nonsplit formulas use integer torus quotients, including the even-characteristic nonsplit case.

Source: Chen, Theorem 5.4.3, p. 412, with the even-q case corrected.

### Trace orbit congruences

Target `NonabelianLevelStructures:NL.6/trace-orbit-congruence` · theorem · planet **Trace orbit congruence**.

For q≥3 and t≠2, put n=n_q(t). In a semisimple case t≠±2, let m=q−1 if X²−tX+1 splits and m=q+1 if it is irreducible. Every Aut^+(F2)-orbit O on X_t*(q) has size divisible by n/gcd(n,4m/n) for odd q and by n/gcd(n,m/n) for even q. These are the moduli after the possible factor-two loss from the component congruence when quotienting by D(q,G). For prime p≥3 and t=−2, every such orbit has size divisible by p. Consequently every orbit of the larger full Markoff move group on the punctured prime-field Markoff surface also has size divisible by p. More generally for t≠±2 and odd ℓ with r=ν_ℓ(n_q(t)),r+s=ν_ℓ(q³−q), every such orbit has size divisible by ℓ^max(r−s,0).

Hypotheses and ambient setting: q=p^f≥3 unless an explicit q=2 boundary example is given; t≠2 where required.

Direct prerequisites: `NonabelianLevelStructures:NL.6/sl2-degree-congruence`; `NonabelianLevelStructures:NL.6/trace-moduli-dictionary`; `NonabelianLevelStructures:NL.5/finite-subgroup-refinements`; `ClassicalArithmeticCompletion:CA.4/markoff-hurwitz-moves`.

Construction or proof plan:

1. A quotient of a component by D(q,G) can decrease its degree only by a divisor of |D(q,G)|≤2; retain this factor before canceling.
2. For even q the torus order n divides q−1 or q+1 and is odd. Thus the remaining possible outer factor 2 cancels from the odd modulus, even for a proper image subgroup.
3. For odd ℓ this factor and the vertical factor 2 do not affect the valuation.
4. At t=−2 over an odd prime field use X*=X° and the parabolic p-divisibility.
5. The larger move-group orbits are unions of orientation-preserving trace orbits, so divisibility survives; do not claim the two groups coincide.

Acceptance:

- The odd-q torus orbit modulus has 4 where the unquotiented component modulus has 2.
- For p=5 all orientation-preserving orbits on the 40-point punctured surface must have sizes divisible by 5.
- The generalized odd-ℓ congruence is exported to ArithmeticDynamicsPartII, rather than imported from a proof which already uses it.

Source: Chen, Theorem 5.4.4, pp. 413–414; Theorem 5.5.9, p. 417; Theorem 1.2.5, pp. 308–309.

### The split and nonsplit conic fibres

Target `NonabelianLevelStructures:NL.6/conic-fibre-geometry` · theorem.

Let q be odd and t≠2. At a=±2, the full conic C_1(a)_t is empty if t−2 is nonsquare and otherwise is two parallel lines, with 2q points. For distinct split roots of X²−aX+1 it has q−1 points if a²≠t+2, and 2q−1 points, two intersecting lines, if a²=t+2. For irreducible X²−aX+1 it has q+1 points if a²≠t+2, and exactly the single point (a,0,0) if a²=t+2. For even q and t≠0, C_1(0)_t has q points and its rotation orbits have size 2. These statements concern the full conic; X_t* additionally removes every point with fewer than two nonzero coordinates.

Hypotheses and ambient setting: q=p^f≥3 unless an explicit q=2 boundary example is given; t≠2 where required.

Direct prerequisites: `NonabelianLevelStructures:NL.6/rotation-conics`; `NonabelianLevelStructures:NL.6/rotation-order`.

Construction or proof plan:

1. For repeated roots, complete the square in y∓z and use t−2≠0.
2. For split distinct roots, factor the quadratic into two independent linear forms; the fibre is a nonzero product equation or the union of its axes.
3. For nonsplit distinct roots, identify the quadratic with a scalar multiple of the norm F_{q²}→F_q. A nonzero norm fibre has q+1 elements, whereas norm zero has only the zero vector.
4. In characteristic 2, the square map of F_q is bijective; y+z is fixed to a nonzero value and swapping the coordinates has no fixed point.

Acceptance:

- The nonsplit degenerate full fibre is a singleton, and its X_t* subset is empty.
- A split degenerate full fibre has 2q−1 points before removing its intersection or coordinate-axis exclusions.

Source: Chen, Proof of Lemma 5.3.1, pp. 406–409.

## NL.7. Markoff modular geometry

Layer inputs: `NonabelianLevelStructures:NL.6`; `NonabelianLevelStructures:NL.5`; `NonabelianLevelStructures:NL.0`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `SchemeAndStackFoundations:SF.3`; `HeightsRationalPointsAndObstructions:RP.4`; `ClassicalArithmeticCompletion:CA.4`; `ArithmeticGaloisRepresentations:R01.4`; `tauceti:TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems`.

### Markoff components and Higman classes

Target `NonabelianLevelStructures:NL.7/geometric-markoff-components` · theorem · planet **Markoff modular components**.

Let p≥5 be prime. Assume the group generated by Vieta moves and coordinate permutations, without adjoining even sign changes, is transitive on the punctured coefficient-one Markoff surface over F_p (input G-DYNAMICS). Then Aut^+(F2) is already transitive: an orientation-reversing coordinate transposition fixes the point (3,3,3), so the stabilizer meets both orientation cosets. The stack M(SL2(F_p))_{−2} has precisely two geometric connected components, distinguished by the two noncentral trace −2 Higman classes; the diagonal outer involution exchanges them. Each coarse component is isomorphic to the coarse absolute-level curve M_p and has j-degree D=p(p+3) for p≡1 mod4 and p(p−3) for p≡3 mod4. Its compactification is a smooth proper geometrically connected curve.

Hypotheses and ambient setting: p≥5 prime; characteristic-zero moduli geometry; transitivity and MP inputs only where explicitly assumed.

Direct prerequisites: `NonabelianLevelStructures:NL.6/trace-moduli-dictionary`; `NonabelianLevelStructures:NL.5/admissible-traces`; `NonabelianLevelStructures:NL.0/absolute-structures`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1/charzero-base-extension`.

Construction or proof plan:

1. Import the finite-field transitivity and point count from the lower combinatorial part of G-DYNAMICS, with the cross-stage ordering stated in that contract.
2. Use the Vieta/permutation group specified in G-DYNAMICS, without extra sign generators. The coordinate transposition fixing (3,3,3), an actual punctured point for p≥5, meets the reversing coset, so the orientation subgroup is transitive.
3. Separate the two SL2 Higman classes and the free diagonal outer interchange; an orbit on the quotient meets each class in exactly one exterior-pair orbit.
4. Use the existing smooth proper compactification and the trace/coarse correspondence.

Acceptance:

- The hypothesis is finite-field transitivity, not transitivity of the positive integer Markoff tree.
- The fixed-point argument uses one orientation-reversing element, not the false claim that every group generator fixes (3,3,3).

Source: Chen, Theorem 5.5.7(b), p. 416; opening of §5.6 and Theorem 5.6.3, pp. 417–418.

Explicit open inputs: `G-DYNAMICS`.

### Markoff branch and cusp counts

Target `NonabelianLevelStructures:NL.7/markoff-branch-data` · theorem.

Under the preceding transitivity hypothesis, put D=p(p+3) or p(p−3) as above. The fibre of the compactified M_p over 0 has (D+2)/3 points: exactly one fixed trace triple (3,3,6) and all other γ0-cycles have length 3. The fibre over 1728 has (D+f_p)/2 points, where f_p=2 for p≡1,7 mod8 and f_p=0 for p≡3,5 mod8. The cusp count is the supplied rotation-orbit count C_p=(p−1)Φ(p−1)/2+(p+1)Φ(p+1)/2+κ_p, with κ_p=(−5p+11)/4 if p≡1 mod4 and (−7p−1)/4 otherwise, and Φ(n)=Σ_{d|n}φ(d)/d. The definition of Φ and the finite-field point/rotation counts belong to ArithmeticDynamicsPartII (routed items 85–86), not a second theory here.

Hypotheses and ambient setting: p≥5 prime; characteristic-zero moduli geometry; transitivity and MP inputs only where explicitly assumed.

Direct prerequisites: `NonabelianLevelStructures:NL.7/geometric-markoff-components`; `NonabelianLevelStructures:NL.6/trace-moduli-dictionary`; `mathlib:Nat.totient`.

Construction or proof plan:

1. Import Φ, |X*(p)| and the rotation-orbit count through G-DYNAMICS.
2. Solve the γ0 and γ1728 fixed-point equations using the explicit trace formulas; γ0 has order 3 and γ1728 has order 2 on the trace locus.
3. Translate rotation cycles to cusps by the trace/moduli correspondence; this is a geometric comparison, not a new plan for the combinatorial orbit counts.

Acceptance:

- At p=5, D=40, the branch fibre counts are 14 and 20 and the cusp count is 8.
- At p=7, D=28, the branch fibre counts are 10 and 15 and the cusp count is 5.
- Replacing (D+2)/3 by (D+1)/3 would miss the correction for the one fixed point.

Source: Chen, Propositions 5.6.1–5.6.2 and proof of Theorem 5.6.3, p. 418.

Explicit open inputs: `G-DYNAMICS`.

### The genus formula

Target `NonabelianLevelStructures:NL.7/markoff-genus` · theorem · planet **Markoff genus formula**.

Assume p≥5 prime satisfies the transitivity input. Then the common genus of the two compactified trace −2 components equals p²/12−(p−1)Φ(p−1)/4−(p+1)Φ(p+1)/4+ε_p, with ε_p respectively 7p/8−29/24,5p/8+19/24,7p/8−17/24,5p/8+7/24 when p≡1,3,5,7 mod8. It is 0,0,1 for p=5,7,11 and is at least 2 for every p≥13 satisfying the hypothesis. The latter bound uses the explicit lower estimate p²/12−(p−1)^(3/2)/2−(p+1)^(3/2)/2+p/2 and a certified finite check for the remaining primes.

Hypotheses and ambient setting: p≥5 prime; characteristic-zero moduli geometry; transitivity and MP inputs only where explicitly assumed.

Direct prerequisites: `NonabelianLevelStructures:NL.7/markoff-branch-data`; `SchemeAndStackFoundations:SF.3/scheme-riemann-hurwitz`; `tauceti:TauCeti.PermutationTriple`; `tauceti:TauCeti.PermutationTriple.genus`; `tauceti:TauCeti.PermutationTriple.IsConnected.two_sub_two_mul_genus`.

Construction or proof plan:

1. Apply the imported tame Riemann–Hurwitz theorem to the smooth proper connected coarse curve with its three branch fibres.
2. Equivalently identify its connected branch permutation triple, with σ∞σ1σ0=1, and use its Euler/genus relation.
3. Substitute D, the two elliptic branch counts and C_p and simplify by p mod8.
4. Bound Φ(n) by 2sqrt(n), establish positivity beyond an explicit cutoff, and evaluate the finitely many smaller primes exactly; the finite check is part of acceptance, not an unspecified numerical claim.
5. For 13≤p<2304, exact rational evaluation at all 337 primes gives minimum genus 5 at p=13. For p≥2304, use (p±1)^(3/2)≤(2p)^(3/2)<3p^(3/2) and sqrt(p)≥48 to bound the displayed lower estimate below by p^(3/2)+p/2>2. This supplies a finite, reproducible arithmetic acceptance calculation, not a transitivity proof.

Acceptance:

- The exact formula gives g5=0,g7=0,g11=1,g13=5.
- The genus is computed from a connected permutation triple; applying one connected genus identity to a disconnected union of components would be invalid.

Source: Chen, Theorem 5.6.3 and proof, pp. 418–419.

### Finiteness of elliptic j-invariants

Target `NonabelianLevelStructures:NL.7/bounded-field-finiteness` · theorem · planet **Bounded-field finiteness**.

Let K be a number field and p≥13 a prime satisfying the transitivity hypothesis and the verified genus≥2 bound. There are only finitely many geometric elliptic-curve isomorphism classes, equivalently j-invariants in K, admitting a K-rational point on either trace −2 level component; in particular this holds for elliptic curves over K carrying a geometrically connected SL2(F_p)-torsor on E\O with that trace invariant. Apply Faltings after a finite extension over which the geometric components are defined. Do not conclude finiteness of K-isomorphism classes of elliptic curves: quadratic twists preserve j and can produce infinitely many such classes.

Hypotheses and ambient setting: p≥5 prime; characteristic-zero moduli geometry; transitivity and MP inputs only where explicitly assumed.

Direct prerequisites: `NonabelianLevelStructures:NL.7/markoff-genus`; `HeightsRationalPointsAndObstructions:RP.4/mordell-faltings`.

Construction or proof plan:

1. Extend K finitely so each relevant smooth proper genus≥2 component is defined and geometrically connected.
2. Apply the imported Mordell–Faltings theorem to its rational points.
3. Map the finite set of level points to the j-line and descend the finite set of j-invariants; the implication from an actual torsor to a sheaf level point is sufficient.

Acceptance:

- A finite set of j-invariants is equivalent to finitely many isomorphism classes over an algebraic closure.
- The proof must not count all quadratic twists as one K-isomorphism class.

Source: Chen, Theorem 5.6.4, p. 419, with the isomorphism-class formulation corrected.

### The projective absolute-level quotient

Target `NonabelianLevelStructures:NL.7/projective-absolute-quotient` · construction · planet **Projective absolute quotient**.

For p≥5, central twists by Hom(F2,{±I}) give the Klein four action (x,y,z)↦(ε1 x,ε2 y,ε1ε2 z) on X*(p). This is the even sign-change action already owned by CA.4. It is free on the punctured t=−2 locus: a nontrivial fixed sign change forces two zero coordinates and then the third to be zero. The resulting quotient is the finite trace fibre for absolute PSL2(F_p)-structures. Under transitivity its associated coarse component has degree d_p=D/4 and is the curve N_p used for the monodromy statement.

Hypotheses and ambient setting: p≥5 prime; characteristic-zero moduli geometry; transitivity and MP inputs only where explicitly assumed.

Direct prerequisites: `NonabelianLevelStructures:NL.7/geometric-markoff-components`; `NonabelianLevelStructures:NL.6/trace-level-subsets`; `NonabelianLevelStructures:NL.0/absolute-structures`; `ClassicalArithmeticCompletion:CA.4/markoff-hurwitz-moves`; `ArithmeticGaloisRepresentations:R01.4/normal-subgroups-and-automorphisms-of-psl2-pgl2`.

Construction or proof plan:

1. Use the existing even sign action; identify it with central twists of rank-two representations.
2. Prove freeness on X*(p) by the fixed-coordinate equations.
3. Compare lifts of projective representations and quotient by projective outer automorphisms, using the full SL2 trace fibre and the two Higman classes.

API:

- `TauCeti.NonabelianLevel.projective_absolute_quotient.twistComparison` (compatibility): Central twists correspond exactly to the imported even sign changes.
- `TauCeti.NonabelianLevel.projective_absolute_quotient.free` (characterisation): Every nonidentity Klein-four element has no fixed punctured Markoff point.
- `TauCeti.NonabelianLevel.projective_absolute_quotient.projectiveFiber` (equivalence): The sign quotient identifies with the stated projective absolute-level fibre.
- `TauCeti.NonabelianLevel.projective_absolute_quotient.degree` (characterisation): The coarse degree is d_p=p(p±3)/4.

Definition checks:

- **computation**, `projective_absolute_quotient.check_1`: At p=5, D=40 and d_p=10.
- **computation**, `projective_absolute_quotient.check_2`: At p=7, D=28 and d_p=7.
- **non-example**, `projective_absolute_quotient.check_3`: The origin is fixed by the entire sign group and must be removed before dividing the cardinality by 4.

Acceptance:

- At p=5, D=40 and d_p=10.
- At p=7, D=28 and d_p=7.
- The origin is fixed by the entire sign group and must be removed before dividing the cardinality by 4.

Uses:

- `CHEN2024, §5.6.2, pp. 419–421; Theorem 5.6.6, p. 420`: The the projective absolute-level quotient supplies Central twists correspond exactly to the imported even sign changes.; Every nonidentity Klein-four element has no fixed punctured Markoff point.
- `NonabelianLevelStructures:NL.7/alternating-monodromy`: Large projective monodromy: Import the large alternating subgroup theorem, its exact prime set and density-one conclusion from G-DYNAMICS.

Source: Chen, §5.6.2, pp. 419–421; Theorem 5.6.6, p. 420.

### Large projective monodromy

Target `NonabelianLevelStructures:NL.7/alternating-monodromy` · theorem · planet **Projective monodromy**.

Let P_MP be the density-one set of primes p≥5 specified by Meiri–Puder and Chen: p is outside the finite exceptional set E_bgs, and either p≡1 mod4 or p≡3 mod4 with the order of (3+sqrt(5))/2 in F_{p²}^× at least 32sqrt(p+1), interpreted after choosing a root in F_{p²}. For p∈P_MP the geometric monodromy of N_p→P¹_j is S_{d_p} when p≡5,7,9,11 mod16 and A_{d_p} when p≡1,3,13,15 mod16. Its proof requires the independent large-alternating permutation theorem and density result from ArithmeticDynamicsPartII, recorded in G-DYNAMICS, together with the orbit congruence supplied here. The residue classification is a parity computation for the projective branch permutations.

Hypotheses and ambient setting: p≥5 prime; characteristic-zero moduli geometry; transitivity and MP inputs only where explicitly assumed.

Direct prerequisites: `NonabelianLevelStructures:NL.7/projective-absolute-quotient`; `NonabelianLevelStructures:NL.6/trace-orbit-congruence`.

Construction or proof plan:

1. Import the large alternating subgroup theorem, its exact prime set and density-one conclusion from G-DYNAMICS.
2. The orientation-preserving subgroup has normal image of index at most two in the full permutation image on the even-sign quotient. Since the latter contains A_{d_p}, d_p≥7, and A_{d_p} has no nontrivial quotient of order two, its intersection with the orientation image is all of A_{d_p}. Transfer this image to the geometric fibre.
3. Compute the signs of the projective γ0 and γ1728 permutations to decide A versus S in each mod16 class.

Acceptance:

- At p=5 the projective degree is 10 and the stated residue class predicts S10.
- At p=7 the projective degree is 7 and the stated residue class predicts S7.
- The large permutation theorem is an explicit input, not a consequence of knowing only that a group acts transitively.

Source: Chen, Theorem 5.6.6, p. 420; condition (5.8) and Theorem 5.5.8, pp. 416–417.

Explicit open inputs: `G-DYNAMICS`.

### Noncongruence of Markoff levels

Target `NonabelianLevelStructures:NL.7/noncongruence-components` · theorem · planet **Noncongruence Markoff levels**.

For p∈P_MP, the finite-index subgroup of SL2(Z) associated to either trace −2 SL2(F_p) component is noncongruence: it contains no principal congruence subgroup. The same obstruction is visible already on the projective absolute quotient N_p, whose monodromy has A_{d_p} as a composition factor with d_p≥7. The only nonabelian simple composition factors of any congruence quotient SL2(Z/n) are PSL2(F_ℓ), and none is isomorphic to A_{d_p} for these d_p≥7. The congruence-subgroup predicate and principal subgroups already exist in Mathlib and are imported unchanged. The composition-factor extension of the existing modular-level quotient theory is requested in Q-CONGRUENCE.

Hypotheses and ambient setting: p≥5 prime; characteristic-zero moduli geometry; transitivity and MP inputs only where explicitly assumed.

Direct prerequisites: `NonabelianLevelStructures:NL.7/alternating-monodromy`; `ArithmeticGaloisRepresentations:R01.4/normal-subgroups-and-automorphisms-of-psl2-pgl2`; `mathlib:CongruenceSubgroup.IsCongruenceSubgroup`; `mathlib:CongruenceSubgroup.Gamma`; `tauceti:TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems`; `mathlib:alternatingGroup.isSimpleGroup`; `mathlib:nat_card_alternatingGroup`.

Construction or proof plan:

1. Use Mathlib CongruenceSubgroup.IsCongruenceSubgroup, and import only the reduction-quotient composition-factor theorem through Q-CONGRUENCE.
2. If the subgroup were congruence, its permutation monodromy and every quotient would factor through SL2(Z/n).
3. Use the pinned simplicity of A_d for d≥5. If A_d were PSL2(F_ℓ) with prime ℓ≥5, equality of orders would imply d!=ℓ(ℓ²−1). Since ℓ divides d!, it is at most d; but d!>d³ for d≥7, a contradiction. This avoids invoking an unproved general classification of accidental isomorphisms.
4. Conclude for the larger SL2 level cover because its projective monodromy is already a quotient.

Acceptance:

- At p=7, A7 is not PSL2(F_ℓ) for any prime ℓ; the accidental A5≅PSL2(F5) does not apply.
- A subgroup being nonnormal does not avoid the obstruction: use the permutation action on its cosets, not a group quotient by that subgroup.

Source: Chen, Corollary 5.6.8, pp. 420–421; Definition 5.6.5, p. 419.

## Worked finite checks

The following are exact arithmetic acceptance examples, not replacements for the general geometric proofs or the dynamics inputs. Direct enumeration of the punctured coefficient-one Markoff surface, followed by the three displayed branch permutations, gives the table. For these nine primes the orientation generators themselves are transitive. The projective column is the quotient by the free even-sign action; its branch signs agree with the residue rule of NL.7.

| p | Degree D | Points over 0 | Points over 1728 | Cusps | Genus | Projective degree |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 5 | 40 | 14 | 20 | 8 | 0 | 10 |
| 7 | 28 | 10 | 15 | 5 | 0 | 7 |
| 11 | 88 | 30 | 44 | 14 | 1 | 22 |
| 13 | 208 | 70 | 104 | 26 | 5 | 52 |
| 17 | 340 | 114 | 171 | 37 | 10 | 85 |
| 19 | 304 | 102 | 152 | 34 | 9 | 76 |
| 23 | 460 | 154 | 231 | 41 | 18 | 115 |
| 29 | 928 | 310 | 464 | 86 | 35 | 232 |
| 31 | 868 | 290 | 435 | 69 | 38 | 217 |

For reproducibility, form the triples with x²+y²+z²=xyz over F_p except (0,0,0), compute the cycles of γ0, γ1728 and γ∞ in NL.6, and evaluate (2+D−c0−c1728−c∞)/2. For the quotient, choose the lexicographically least representative among the four even-sign translates; compute the induced cycle signs as (−1)^(number of points−number of cycles). At p=5 the single γ0 fixed point is (3,3,1), and the other thirteen cycles have length three, giving fourteen points over zero. This rejects the erroneous numerator D−3 immediately.

The genus inequality is certified by a finite arithmetic range and an elementary tail estimate. Exact rational evaluation of the stated Φ formula at all 337 primes 13≤p<2304 gives minimum genus 5, at p=13. For p≥2304, each (p±1)^(3/2) is at most (2p)^(3/2)<3p^(3/2). Since sqrt(p)≥48, the stated lower bound is greater than p^(3/2)+p/2, hence greater than 2. A formal implementation can enumerate primes in that finite range with exact rational normalization; it does not need to prove or assume transitivity for primes outside the independent transitivity hypothesis.

Exact SL2 pair enumeration over F2,F3,F5,F7 also attains respectively all 8,27,125,343 trace triples. The generating-pair commutator trace sets are respectively {1}, {0}, {1,3}, {3,4,5,6}. For the trace-1 case over F5, take matrices with rows (0,1),(4,0) and (0,1),(4,2); their generated subgroup has all 120 elements. This tests the exceptional admissibility list separately from surjectivity of the unrestricted trace map.

Two conic checks distinguish full fibres from the non-dihedral locus. Over F5 take a=1,t=4: X²−X+1 is irreducible and y²+z²−yz=0 has only (0,0), so the full slice is the singleton (1,0,0) while its starred slice is empty. Over F4=F2[a]/(a²+a+1), X²+aX+1 has no root and the matrix with rows (0,1),(1,a) has order five. Its discriminant a² is a square. This supplies an explicit characteristic-two nonsplit test.

For D6,D10,D14, with u a rotation and h a reflection, enumeration gives A=⟨u⟩, trivial center and twist period one. Thus |A| is respectively 3,5,7 and the centralizer obstruction is one. These are checks of the finite cusp formulas, independent of stack constructions.

## Supplying contracts

An existing-contract request exposes mathematics already owned elsewhere; an extension specifies the additional general statement required from that owner. The precise input is recorded here so that no use of a general name conceals a stronger theorem.

### Q-COARSE

Supplier `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients` · existing-contract.

Expose the existing smooth relative-curve finite-quotient theorem over a regular locally Noetherian base, including finite groups whose order is not invertible, and the 9D coarse base-change comparisons. Combine with the R09.5 local coarse presentations and elliptic-coarse-recovery to apply Chen Lemma 2.1.10, pp. 321–322, to the proper elliptic admissible stack. No new finite-quotient smoothness theorem is planned here; it is already a named milestone in the current upstream ModularCurves README and Suggested.lean. Retain the special base-change hypotheses stated in NL.0/level-moduli.

Consumers: `NonabelianLevelStructures:NL.0/level-moduli`, `NonabelianLevelStructures:NL.0/compactified-level-stack`.

### Q-GASCHUTZ

Supplier `InverseGaloisAndArithmeticFundamentalGroups:IG.3` · extension.

For a surjection of finite groups G1→G2 with d(G1)≤2, every generating pair of G2 lifts to a generating pair of G1; make its induced surjection on exterior epimorphisms natural. Chen Theorem 2.5.2(6), pp. 336–337, uses this finite generating-tuple lifting input.

Consumers: `NonabelianLevelStructures:NL.0/quotient-functor`.

### Q-DEFORMATION

Supplier `SchemeAndStackFoundations:SF.4` · extension.

Extend the existing node-versal deformation contract to a stable marked G-curve with tame balanced action: the framed elliptic deformation map is Λ[[T]]→Λ[[t]], T↦t^r; smooth objects have r=1. Include equivariant global unobstructedness and the fact that the single node orbit supplies one parameter. This is Chen Proposition 2.5.3, pp. 338–341, not a new deformation theory in NL.

Consumers: `NonabelianLevelStructures:NL.0/deformation-and-density`.

### Q-DM-COMPLETION

Supplier `AlgebraicModuliForArithmeticGeometry:R09.6` · extension.

Supply the precise extension of the existing framed-deformation/completed-atlas comparison to an algebraically closed geometric point whose residue field need not be finite over the Cohen base: identify the universal framed deformation ring with the completed étale local ring, retaining the point identification and residual automorphisms. Chen Appendix 6.5, pp. 430–434.

Consumers: `NonabelianLevelStructures:NL.0/deformation-and-density`.

### Q-DUAL

Supplier `SchemeAndStackFoundations:SF.2/relative-dualizing-module` · extension.

Supply Ω_{C/S}→ω_{C/S} for a proper flat prestable family, an isomorphism on its smooth locus, compatible with arbitrary base change, and descend this construction for representable prestable families over a Deligne–Mumford base. The underlying scheme duality remains owned by SF.2/StableReduction. Chen §3.1, pp. 348–351.

Consumers: `NonabelianLevelStructures:NL.3/section-cotangent`.

### Q-DEGREE

Supplier `SchemeAndStackFoundations:SF.5/dm-rational-degree` · extension.

For proper smooth tame DM curves over an algebraically closed characteristic-zero field: degree of a line via a finite flat scheme cover; independence of cover; degree in (1/n)Z for a character-trivial line with generic stabilizer n; and deg_Y f*L=(n_X/n_Y)deg(f_coarse)deg_X L. Include tame coarse descent for lines. Do not silently close the supplier existing rational-pushforward gap. Chen Propositions 3.4.6–3.4.8, pp. 356–358.

Consumers: `NonabelianLevelStructures:NL.3/hodge-degree`, `NonabelianLevelStructures:NL.3/degree-obstructions`.

### Q-INVARIANTS

Supplier `LanglandsParameterStacks:LP3` · extension.

Extend integral reductive invariants to the exact n=2 simultaneous-matrix input of Chen Theorem 6.2.2 and Lemma 6.2.3, pp. 426–427: over every commutative ring, invariants are generated by traces of words and the determinants, arbitrary base change commutes, and restriction to determinant-one pairs is surjective on invariants. This requires an actual good-filtration/vanishing argument, not the characteristic-zero Reynolds operator. Generic invariant quotient machinery remains in LP3.

Consumers: `NonabelianLevelStructures:NL.5/rank-two-character-variety`.

### Q-DICKSON

Supplier `ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement` · extension.

Supply the following exact refinements of the existing finite-projective subgroup classification, with S4 in the exceptional list and genuine subfield embeddings: non-dihedral absolutely irreducible G≤SL2(F_q) contains the ambient center; |N_GL2(G)/(G·C_GL2(G))|≤2, including the exceptional central extensions; for odd prime p a trace −2 absolutely irreducible non-dihedral pair generates SL2(F_p). Keep q=2 and q=3 exceptions explicit. Chen Proposition 6.4.1, pp. 428–430, and Proposition 5.2.17, p. 402.

Consumers: `NonabelianLevelStructures:NL.5/finite-subgroup-refinements`, `NonabelianLevelStructures:NL.6/trace-level-subsets`, `NonabelianLevelStructures:NL.6/sl2-vertical-stabilizers`.

### Q-CONGRUENCE

Supplier `tauceti:TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems` · extension.

Extend the existing finite-level reduction quotient interface by: every nonabelian simple composition factor of SL2(Z/n), n≥1, is PSL2(F_ℓ) for a prime ℓ≥5; an action of a congruence subgroup quotient factors through such a finite reduction. Use Chinese remainders and the solvable congruence kernels, with small primes separated. The predicate and Gamma N themselves are pinned Mathlib definitions. Chen proof of Corollary 5.6.8, p. 421.

Consumers: `NonabelianLevelStructures:NL.7/noncongruence-components`.

### Q-FULL-LEVEL

Supplier `ModularCurvesPartII:R13.2` · existing-contract.

Expose the already-planned compactified full-level problem for (Z/n)^2, n≥3 over Z[1/n], with its Weil-pairing components, in a form usable for the abelian G-structure comparison. No reconstruction of full-level curves is requested.

Consumers: `NonabelianLevelStructures:NL.2/abelian-level-comparison`.

### Q-GRAPHS

Supplier `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs` · existing-contract.

Import the existing normalization and nodal-curve half-edge graph, admitting loops and parallel edges, and its normalization/connectedness comparison. Expose the identification with the explicitly defined cusp graph; do not use SimpleGraph.

Consumers: `NonabelianLevelStructures:NL.1/cusp-gluing-data`, `NonabelianLevelStructures:NL.1/cusp-component-graph`.

### Q-CURVE-DUALITY

Supplier `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity` · existing-contract.

Import the existing scheme duality and effective-Cartier section conormal interfaces for prestable curves; no additional general coherent curve theory is owned here.

Consumers: `NonabelianLevelStructures:NL.0/reduced-ramification`, `NonabelianLevelStructures:NL.3/section-cotangent`.

### Q-PRESTABLE

Supplier `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves` · existing-contract.

Import the existing pointed prestable and stable family carriers, their smooth locus and normalization, and finite gluing of disjoint smooth sections. The finite gluing comparison is used in the cuspidal fibre, not flatness of a quotient map at a ramified node.

Consumers: `NonabelianLevelStructures:NL.0/elliptic-admissible-covers`, `NonabelianLevelStructures:NL.1/cusp-gluing-data`, `NonabelianLevelStructures:NL.1/normalization-gluing`.

### Q-SKOLEM

Supplier `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-5-skolem-noether-and-the-centralizer-theorem` · existing-contract.

Import existing Skolem–Noether with both finite-dimensional central simple algebras over a field. Here both algebras are M2(F_q); no extension to arbitrary coefficient rings is requested.

Consumers: `NonabelianLevelStructures:NL.5/finite-field-trace-bijection`, `NonabelianLevelStructures:NL.5/sl2-normalizer-descent`.

## Explicit open inputs and scope limits

### G-MAPPING: Missing extensions of the punctured-torus and stack comparison supplier

MappingClassGroupsAndCanonicalRepresentations now has a 62-node packet. Its C.0/moduli-monodromy supplies π1 of the ordered analytic moduli stack as the pure mapping-class group and is imported in NL.0/monodromy-dictionary. The remaining exact inputs are: Nielsen Out(F2)≅GL2(Z) with orientation subgroup SL2(Z), the oriented punctured elliptic fundamental group and positive peripheral commutator, stack Riemann existence extending the scheme-only IG.3 contract, Asada cofinality for finite étale covers of M(1), and the BBCL22 Theorem 2.2.3 curve consequence giving a level component finite étale Galois over a nonempty open of any smooth projective Qbar curve. Extend or register those supplier nodes before replacing this leaf. PeripheralActions supplies pro-p punctured-sphere peripheral automorphisms, not this comparison.

Consumers: `NonabelianLevelStructures:NL.0/monodromy-dictionary`, `NonabelianLevelStructures:NL.0/cofinality`, `NonabelianLevelStructures:NL.5/outer-trace-action`, `NonabelianLevelStructures:NL.6/trace-moduli-dictionary`.

### G-DYNAMICS: Missing arithmetic dynamics supplier and stage order

ArithmeticDynamicsPartII design #3367 has no registered stage/node at this checkout. It owns the definition Φ(n)=Σ_{d|n}φ(d)/d and the point and rotation-orbit counts (routed 85–86); BGS giant-orbit estimate and its effective finite exceptional set after using the p-divisibility from NL.6; finite-field transitivity outside E_bgs; and the MP(p) density-one and large alternating-image theorem on the even-sign quotient. Its combinatorial input part may consume the conic geometry and orbit congruence here. NL.7 then imports those outputs. Required order is NL.6 → the dynamics counting/strong-approximation/large-image stages → NL.7, never a circular import of NL.7 geometry into the giant-orbit proof. The full Vieta/permutation group here excludes additional sign generators unless explicitly compared.

Consumers: `NonabelianLevelStructures:NL.7/geometric-markoff-components`, `NonabelianLevelStructures:NL.7/markoff-branch-data`, `NonabelianLevelStructures:NL.7/alternating-monodromy`.

### G-VDOVIN: Unexpanded CFSG-dependent abelian subgroup bound

Chen Theorem 4.12.3, p. 390, imports Vdovin Theorem A: for a finite nonabelian simple group outside every PSL2(F_q) family, every abelian subgroup B satisfies |B|³<|G|. No checked supplier exists for this CFSG-dependent theorem and the Vdovin proof has not been read in this run. The simple-group deduction is given conditionally on exactly this input. Register an appropriate finite-simple-group owner and supply its proof/source decomposition; Dickson classification does not imply it.

Consumers: `NonabelianLevelStructures:NL.4/simple-group-congruence`.

### G-GENERAL-J: Unrepaired general-j source claim outside the proved scope

The accepted brief permits the j=0 specialization. Published Lemma 4.12.2, pp. 389–390, does not justify its direct-product step when j>0: the intersection estimate does not establish the asserted invariant factors. This plan proves only j=0 and does not certify the stronger general-j congruence in routed items 3,4,72,73. A follow-up must repair that group-theoretic claim or maintain the explicit j=0 scope. It is not an implementation omission in the j=0 proof.

Consumers: `NonabelianLevelStructures:NL.4/j-zero-group-bound`, `NonabelianLevelStructures:NL.4/j-zero-degree-bound`.

## Source corrections and version boundaries

Independent review on 19 October 2026 confirmed the following findings. Each is a correction or proof repair in our own words; E14, E15 and E17 concern only the historical arXiv v2 text. The published author copy governs the targets. The historical copy was read at [arXiv:2011.12940v2](https://arxiv.org/pdf/2011.12940v2), pp. 5, 26 and 82; its SHA-256 is `f60283b0b406554c064e3135b18d4446617aed05eb74f7b8d7b66a2f453980cc`. No separate erratum was located in the official article, author-site and title/author searches.

- **E1**, error, Published Proposition 2.4.4, p. 330; Definition 4.1.2, p. 361, and cuspidal-cover wording in §4.1: Retain finite quotient maps; omit flatness at ramified nodes, consistently with the admissible local model. Reason: At the balanced node x=ξ²,y=η², ξη=0, the fibre over x=y=0 has basis 1,ξ,η of length 3, rather than the generic rank 2. Review: confirmed.
- **E2**, gap, Published Lemma 4.12.2 proof, pp. 389–390: Use only j=0, where one of the two cyclic intersections is trivial, until the general-j intersection argument is repaired. Reason: Bounding the intersection by ℓ^j does not by itself give the stated invariant factors after powering; the displayed powering step is insufficient. Review: confirmed.
- **E3**, error, Published Proposition 5.2.5, p. 397: Use an anti-homomorphism; it factors through Out(F2)/⟨−I⟩. No assertion of nonfaithfulness of this latter quotient is intended. Reason: Inner automorphisms act by simultaneous conjugation and have identical trace coordinates; γ−I also acts trivially. Review: confirmed.
- **E4**, error, Published proof of Lemma 5.3.1, nonsplit degenerate case, p. 408: Its full fibre is the singleton (a,0,0); its non-dihedral subset is empty. Reason: The norm of y−ωz is zero only at y=z=0. This point satisfies the original conic equation. Review: confirmed.
- **E5**, misprint, Published Remark 5.2.21, p. 404: With columns given by images of a,b and γ∞(a,b)=(a,ab), the upper-right entry is +1. Reason: Abelianization sends b to a+b. Review: confirmed.
- **E6**, error, Published Proposition 5.6.1(a), p. 418: The count is (D+2)/3. Reason: There is one cycle of length 1 and (D−1)/3 cycles of length 3; at p=5 the count is 14. Review: confirmed.
- **E7**, error, Published Theorem 5.6.4, p. 419; introductory Theorem 1.2.10, p. 310: Conclude finiteness of j-invariants in K, or geometric isomorphism classes; level points map to coarse j-values. Reason: Faltings bounds rational points on the level coarse curve, while quadratic twists can give infinitely many K-isomorphism classes with the same j. Review: confirmed.
- **E8**, misprint, Published Proposition 6.4.1(E4) and its proof, pp. 428–429: Use S4 throughout the exceptional projective classification and recheck the central-extension calculation with that group. Reason: Dickson classification has A4,S4,A5; S5 is not the octahedral projective subgroup. Review: confirmed.
- **E9**, error, Published Proposition 6.4.1(b) and proof, p. 429: The relevant quotient is N/(G·C), the image in Out(G). Reason: For G=SL2(F5), the subgroup of inner automorphisms inside N/C already has order 60. Review: confirmed.
- **E10**, error, Published Proposition 5.4.2 and Theorems 5.4.3–5.4.4, pp. 411–413: For all q classify by whether X²−tX+1 splits or is irreducible. In even characteristic keep both q−1 and q+1 torus orders and use the vertical factor 1. Reason: Every element of F4 is a square, yet SL2(F4) contains a nonsplit torus of order 5; an irreducible X²−tX+1 gives such a matrix. Review: confirmed.
- **E11**, error, Published Proposition 5.2.20, p. 403: Require that the actual image be non-dihedral, or use the full absolutely irreducible locus instead of X*. Reason: The definition of X* excludes absolutely irreducible representations of dihedral type; for example a suitable quaternion image in odd characteristic is excluded. Review: confirmed.
- **E12**, misprint, Published proof of Proposition 5.2.16(d), p. 402: The trace must be different from 2. Reason: Lemma 5.2.9 gives a unit t−2; over a field this is precisely t≠2. Review: confirmed.
- **E13**, misprint, Published proof of Corollary 4.12.4, p. 390: Refer to the second assertion of part (b). Reason: The corollary has parts (a) and (b), and the sentence concerns the bound on m′. Review: confirmed.
- **E14**, error, arXiv v2 Theorem 2.5.2(7), compared with published pp. 337–338: Use a nonempty open U of the projective curve. The published version already states this correctly. Reason: A nonproper level component cannot be a finite étale cover of a proper curve. This is a version-collation note, not a new objection to the published theorem. Review: confirmed.
- **E15**, misprint, arXiv v2 proof of Theorem 5.5.7(a), compared with published p. 416: Only an orientation-reversing coordinate transposition needs to fix it. The published proof uses exactly that argument. Reason: A stabilizer meeting the nontrivial orientation coset makes the orientation subgroup transitive when the full group is transitive. Review: confirmed.
- **E16**, error, Published introductory paragraph before Corollary 1.1.2, p. 305; compare Theorem 2.5.2(3)–(5), pp. 336–338: The coarse degree is the exterior orbit cardinality or half of it. Reason: The coarse fibre is the quotient of the exterior orbit by γ−I. A quotient by an involution cannot double cardinality. Review: confirmed.
- **E17**, error, arXiv v2 Theorem 1.1.2, p. 5, compared with published Corollary 1.1.2, p. 305: The extra factor occurs when γ−I does not fix the exterior epimorphism class. The published corollary omits that strengthening. Reason: The unquotiented orbit is twice its quotient exactly when the central involution acts freely on that orbit. This version note makes no claim that the published corollary retains the older sentence. Review: confirmed.
- **E18**, error, Published Theorem 1.2.10, p. 310, compared with its preceding p≥5 setup: Assume p≥5, consistently with the preceding setup and the geometric Markoff targets. Reason: At p=3 the trace −2 equals 1 and the punctured Markoff set is empty; the claimed connected curve is not obtained. Review: confirmed.
- **E19**, misprint, Published §4.2, p. 364, immediately before Definition 4.2.2: Remove the origin 0, so that the identification is with the multiplicative group. Reason: The tangent-line isomorphism sends zero to zero and the tangential base point to 1; the puncture is at zero. Review: confirmed.
- **E20**, misprint, Published Proposition 4.4.3(d), p. 369: The loop on the left side is based at t0. Reason: After transporting x∞ by δ⁻¹, its fibre is over t0; the source of its monodromy homomorphism is π1(P*,t0). Review: confirmed.
- **E21**, error, Published Lemma 4.4.4(g), proof on p. 370; compare Definition 4.1.2, p. 361: Keep the finite quotient and the balanced admissible local model; establish the normalization equivalence by the nodal clutching/conductor contract, without this flatness assertion. Reason: The ramified node of index 2 has generic rank 2 and special fibre length 3. The flatness conclusion cannot follow from the cited gluing application. Review: confirmed.
- **E22**, error, Published proof of Proposition 5.4.2(c), p. 412: Infer instead that their ratio lies in F_q, so the eigenline is defined over F_q; an F_q-matrix preserving that line has its associated eigenvalue in F_q, contradicting irreducibility of the characteristic polynomial. Reason: The equations x^q=ax and y^q=ay give x^(q−1)=y^(q−1)=a when both coordinates are nonzero; they do not force a=1. The projective-line argument proves the required independence of v and v^σ. Review: confirmed.
- **E23**, error, Published proof of Proposition 5.4.2, general eigenvector observation, p. 411: For ACA⁻¹=C^n, it is A⁻¹ that sends a λ-eigenvector of C to a λ^n-eigenvector. Reason: Applying the equation to v gives C(A⁻¹v)=λ^n A⁻¹v. The ensuing centralizer application uses n=1 and is unchanged. Review: confirmed.
- **E24**, gap, Published proof of Lemma 4.12.1, p. 389: For possibly infinite U, compare their finite indices inside gUg⁻¹ instead; conjugation gives equal indices in G and both ambient cyclic groups have the same finite index in G. Reason: Two infinite subgroups of a cyclic group can have equal infinite orders but be different. Equality of their finite indices is what implies equality. In the finite groups used by NL.4 the original equal-order argument suffices. Review: confirmed.
- **E25**, error, Published Remark 2.2.4, p. 324; Proposition 3.2.2(a), p. 352: Reducedness of S implies reducedness of R_π; the converse requires R_π→S surjective. Its degree is |G|/e for e≥2, while e=1 gives the empty divisor. Reason: Take G=1 over Spec(k[ε]/(ε²)): the ramification divisor is empty and reduced over a nonreduced base and has degree 0, not 1. The nonempty finite étale case has the converse by faithfully flat descent. Review: confirmed.
- **E26**, error, Published §4.11, p. 388, odd-dihedral example: For a primitive rotation c, C_G(⟨c⟩)=⟨c⟩, so d′=1. The normalizer quotient has order 2. Reason: A reflection conjugates c to c⁻¹ and does not centralize it for odd k≥3; quotienting its cyclic centralizer by ⟨c⟩ is trivial. The existing NL.2 example already uses the correct value. Review: confirmed.
- **E27**, error, Published proof of Proposition 3.2.2(b), p. 353: Use smooth surjectivity with nonempty geometrically connected configuration-space fibres. Those properties suffice for connected pullback; no properness is needed. Reason: After a first marking, the next point varies on the curve minus its existing markings, an open nonproper fibre. The connected-cover argument uses openness and connected fibres and survives this repair. Review: confirmed.
- **E28**, gap, Published proof of Proposition 5.2.16(d), p. 402: If one generator is a rotation and one a reflection, the reflection and their product are involutions; if both are reflections, use those two. Thus at least two of the three traces vanish. Reason: Over F7 take A=diag(2,4) and B with rows (0,6),(1,0). Their projective orders are 3 and 2, they generate a dihedral image, and their traces are (6,0,0). This missing case repairs the argument without changing the criterion. Review: confirmed.
- **E29**, error, Published Lemma 5.3.1, p. 405, parenthetical before the orbit conclusion: Only the simultaneous vanishing of the last two coordinates is excluded. Full non-dihedral type additionally excludes the other two-zero patterns. The stated orbit calculation still works under its displayed weaker hypothesis. Reason: Swap the matrices of E28: the absolutely irreducible dihedral pair has trace triple (0,6,0) over F7 and commutator trace 6≠2, while the last two coordinates are not both zero. NL.6 already imposes the stronger non-dihedral hypothesis where needed. Review: confirmed.

## Suggested-file boundary and acceptance

The suggested file follows WORKERS.md's compact statement shape: the full target and definition API stays in this reader, while only light real-bodied definitions on existing carriers, selected milestones and a few examples enter Lean. Its five definitions are the subgroup generated by the two normalization monodromies, the explicit cusp-automorphism membership predicate, the triple of matrix traces, the rotation matrix and its product-coordinate linear step. The membership predicate is the actual formula on an existing group, not a substitute carrier for a missing construction. The separate geometric automorphism subgroup and comparison remain reader targets.

The kernel, period/cardinality, square and conditional cube bounds are NL.2/NL.4 milestones. The integral Fricke identity, matrix-algebra unit criterion, inversion invariance and finite-field surjectivity are NL.5 milestones. Exact rotation period and the corrected nonsplit degenerate fibre are NL.6 milestones. Three cusp, three trace and three rotation examples exercise these carriers. Heavy stacks, sheaves, character quotients and cusp quotient carriers are not fabricated to state their theorems at the pins. The file elaborates with admitted proofs as its only warnings; elaboration is a signature check, not a proof certificate.

Acceptance of the plan requires the packet and reader to cover every target, every definition/construction to have its stated API and at least three discriminating tests, and every prerequisite chain to terminate at a checked baseline declaration, supplying node or requested layer, or an explicit open input. All 66 routed items have such a disposition; item 39 is imported from IG.5 rather than duplicated. All eight layers are planned, with no claim of closure while the supplying contracts and four open inputs remain. The dependency graph within the 65 targets is acyclic. Subsequent package preparation uses the reviewed supplier contracts and preserves the order through the dynamics stages.

Independent design review accepted this plan on 19 October 2026 after checking all 65 targets, 22 pinned baseline declarations, supplier interfaces, APIs and definition tests. The review corrected the empty-divisor reducedness converse, the normalization torsor condition, the orbit-modulus wording and source locators; it also narrowed the mapping-class gap after importing its existing analytic moduli node. The four explicit gaps and fourteen supplier requests remain open. See [the review report](../reviews/REV-DESIGN-NonabelianLevelStructures.md) for the complete audit and finite verification results.
