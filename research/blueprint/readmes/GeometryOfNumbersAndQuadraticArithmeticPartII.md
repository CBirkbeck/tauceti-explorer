# Quadratic and symmetric arithmetic at dyadic primes

This is the dyadic continuation of Geometry of numbers, quadratic forms and homogeneous arithmetic. Its endpoints are the periodic symmetric and quadratic L-groups of Dedekind rings, their global-field specializations, integral rigidity under completion and henselian reduction, and computed examples over the integers and Eisenstein integers. Its six layers run from integral residue coordinates to arithmetic fracture, then to group tables and the examples that distinguish quadratic from symmetric forms at 2.

The other two briefs attached to the design issue concern polynomial lattices over Laurent-series fields and toral joinings on adelic quotients. They are independent of this proof. The packet preserves every one of their 7 and 83 routed items in explicit split proposals, with suggested stages and supplier boundaries; neither is claimed planned here. All sixteen dyadic routed results are mapped below. The roadmap id stays GeometryOfNumbersAndQuadraticArithmeticPartII; QuadraticArithmeticAtDyadicPrimes is its extraction alias.

## Conventions and status

R is a commutative Dedekind domain unless a theorem explicitly allows a noncommutative ring. K is its fraction field. A quadratic form is Mathlib's quadratic map on a finite projective module, with **perfect full polar** b_q(x,y)=q(x+y)−q(x)−q(y). A symmetric form is a perfect symmetric bilinear pairing. Perfection is an isomorphism to the dual; over a ring it does not mean only a nonzero Gram determinant. Ws and Wq are the respective metabolic Witt groups. A Lagrangian is an admissible direct summand equal to its perpendicular, with q zero on it for Wq. For a projective module of rank zero the zero pairing is perfect and represents zero. Isometries, scalar extension and sums use the suppliers' genuine carriers, not a private proposition-valued replacement.

Ls and Lq mean the **periodic** Poincaré symmetric and quadratic L spectra, with integer-indexed homotopy groups L_n=π_n. They are distinct from genuine symmetric Lgs, which is not identified with its periodicization at 2. The basic sign is positive. The negative-sign theories are obtained by Σ², so their degree n is positive-sign degree n−2. Symmetric localization keeps the residue line p⁻¹M/M and its shift −1. A uniformizer is chosen only for a displayed field coordinate; ramified base change cannot discard this line. A direct sum over primes means finite support.

For char K≠2 let I={p: p divides 2}, d=#I, and C=R̂_2. Completion is ordinary ideal-adic completion when it represents derived completion. In the general fracture theorem this is a hypothesis; for a Dedekind domain in characteristic not 2 it holds. Pic(R)/2 means the cokernel of multiplication by 2. A(R) is the quotient of Ws(C) by the **sum** of the global symmetric image and the completed quadratic image. A short exact sequence involving A is retained as an extension, without choosing a splitting. For a finite characteristic-two field, the Arf coordinate is the absolute F2 trace, not merely its raw symplectic-basis sum.

The planning pass is complete and each layer is planned. It is not closed: G1–G5 and supplier contracts R1–R10 below are explicit remaining work. Every implementation status is unchecked. No theorem is certified by the accompanying Lean signatures. A new error in the Eisenstein calculation changes its quadratic degree-zero and degree-three entries; the corrected statement and argument have been independently checked against arXiv v4, with separate confirmed verdicts for all three findings.

## Ownership and library audit

The reviewed GN.2/GN.6 library audit was read at the required pins, then checked against current upstream. The four completion/CRT baseline entries added in independent review are native general-Dedekind inputs, rather than outputs of the S-integer stage. The pinned Mathlib commit is 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti is f790474821cf4256814db967cb154e7af3d0c369. The current read-only roadmap checkout was inspected at 0d144d044dacebca17b654695b6f1ad58f159b27 and its Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Completed IntegralLattices and GlobalQuadraticForms were read in full as adjacent roadmap models; the newer IntegralLattices and relevant QFI layers were checked for ownership.

QFI layer 4 and current Tau Ceti own the field Witt ring and its tensor/base-change API; layer 6 owns classification over nonarchimedean local fields, including Q2. This roadmap derives only the specific arithmetic coordinate and ideal calculation it needs. QFI layer 9 owns Scharlau transfer, but the needed quadratic-extension exact sequence is an additional contract, not something its existing statement promises. GlobalQuadraticForms layer 8 owns number-field classification and Witt localization injectivity; it explicitly does not claim the residue exact sequence and excludes function fields. GN.6 owns exact symmetric Witt groups, classical degree-zero integral GW, and the residue duality line; its displayed localization node is for GW, so its L version is requested explicitly. The newer integral-lattice theory is already owned upstream, including E8 and the half-norm convention. Finite/perfect characteristic-two **symmetric** L-theory belongs to KTheoryFiniteLocalFields L.1. Its prime-to-p K-rigidity is not the quadratic rigidity used here.

## Source policy

All statements, proof sketches and findings are in this roadmap's own words. Locators for the principal source refer to arXiv:2009.07225v4, the 63-page preprint, not Annals journal pagination. The paper is credited to Calmès, Dotto, Harpaz, Hebestreit, Land, Moi, Nardin, Nikolaus and Steimle. Its published citation is Annals of Mathematics 204 (2026), no. 1, 119–220, DOI 10.4007/annals.2026.204.1.2. The public preprint is the version actually read (SHA256 recorded below and in sourceVersions); the published text remained unavailable during independent review. Wall's 1970 lifting proof and CMM's completion-to-henselian argument were read at the precise locations below. The referenced books by Milnor–Husemoller, Lam and Scharlau are not cleared in the library index; no other copy was used. Local arithmetic calculations are instead derived from imported classification. Where that does not replace a full cited proof, a gap remains.


## DA.0. Integral forms and residues

Import exact symmetric Witt groups and the existing field Witt theory; state the quadratic-to-symmetric comparison and integral injections. Construct the canonical line-valued second residue with finite support and the finite-field Arf coordinate including its extension-degree law. Separate missing Poincaré carriers from arithmetic targets.

Requires: GeometryOfNumbersAndQuadraticArithmetic:GN.6, KTheoryFiniteLocalFields:L.1, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal.


### Integral Witt comparison

Target `DA.0/integral-comparison` (comparison).

For a commutative ring R, compare quadratic forms q on finite projective modules, required to have perfect polar pairing b_q(x,y)=q(x+y)−q(x)−q(y), with perfect symmetric bilinear forms. Polarisation induces σ:Wq(R)→Ws(R). These are metabolic quotients, with a direct-summand Lagrangian and, on the quadratic side, q vanishing on it. For 2 invertible σ is an isomorphism; its inverse sends b to x↦b(x,x)/2. Identify degree zero of periodic Lq and Ls with these classical Witt groups, using the supplier’s surgery comparison.

Hypotheses: R commutative; modules finite projective; perfect means the adjoint to the R-dual is an isomorphism.

Proof plan:

1. Import symmetric spaces and the exact Witt quotient from GN.6, and request the quadratic carrier and degree-zero comparison under gap G1.
2. Polarisation respects isometries, orthogonal sums and metabolic forms. When 2 is a unit, the half-diagonal is inverse by the quadratic identity.
3. Use actual Mathlib QuadraticMap and its polarBilin; do not treat nonzero determinant as unimodularity over a ring.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmetic:GN.6/symmetric-space, GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-witt-group, mathlib:QuadraticMap.polarBilin.

Source: CDHHLMNNS-III-v4, §2.3, pp. 41–48; Proposition 2.3.9, p. 44; Remark 2.3.17, p. 48. For a commutative ring R, compare quadratic forms q on finite projective modules, required to have perfect polar pairing b_q(x,y)=q(x+y)−q(x)−q(y), with perfect symmetric bilinear forms. Polarisation induces σ:Wq(R)→Ws(R). These are metabolic quotients, with a direct-summand Lagrangian and, on the quadratic side, q vanishing on it. For 2 invertible σ is an isomorphism; its inverse sends b to x↦b(x,x)/2. Identify degree zero of periodic Lq and Ls with these classical Witt groups, using the supplier’s surgery comparison.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. For R=F2 the quadratic plane x²+xy+y² is nonzero in Wq but its alternating polar class is zero in Ws; reject an unconditional comparison isomorphism.


### Integral Witt injection

Target `DA.0/integral-injectivity` (theorem).

For a Dedekind domain R with fraction field K, Ws(R)→Ws(K) is injective. If char K≠2, Wq(R)→Wq(K) and σ:Wq(R)→Ws(R) are injective. If char R=2, σ is zero: every polar form is alternating and every nonsingular alternating form over a Dedekind domain is metabolic.

Hypotheses: R Dedekind domain; finite projective nonsingular forms; no perfection assumption on K in characteristic 2.

Proof plan:

1. A generic Lagrangian L_K descends to the saturated intersection P∩L_K. The quotient is torsion-free, hence projective over R, and the rank-half saturated isotropic submodule equals its perpendicular by perfection. This gives a direct-summand Lagrangian.
2. For a quadratic form use the same argument and q=0 over K on the Lagrangian. Equivalently in characteristic not 2, b(x,x)=2q(x)=0 and R is 2-torsion-free.
3. In characteristic 2 the polar is alternating; split symplectic projective summands by choosing a line summand and the perfect pairing. This concerns bilinear metabolicity, not vanishing of quadratic Arf invariants.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/integral-comparison.

Source: CDHHLMNNS-III-v4, Proposition 2.3.1, proof, p. 41; Remark 2.3.17 and proof after Corollary 2.3.16, pp. 47–48. For a Dedekind domain R with fraction field K, Ws(R)→Ws(K) is injective. If char K≠2, Wq(R)→Wq(K) and σ:Wq(R)→Ws(R) are injective. If char R=2, σ is zero: every polar form is alternating and every nonsingular alternating form over a Dedekind domain is metabolic.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. Test both char K≠2 injection and char R=2 zero polar map; an argument dividing by 2 cannot cover the latter.


### Second residue

Target `DA.0/second-residue` (construction).

For each nonzero prime p of a Dedekind domain R, construct the symmetric Witt boundary ∂p:Ws(K)→Ws(kp;lp), where lp=p⁻¹/R at p is the canonical residue duality line. Choose a uniformizer π only to identify lp with kp. In that coordinate ∂p⟨πu⟩=⟨ū⟩ and ∂p⟨u⟩=0 for units u; valuation parity determines the general rank-one value. The family has finite support and gives ∂0:Ws(K)→⊕p Ws(kp;lp).

Hypotheses: R Dedekind; residue characteristic and fraction characteristic may be 2; the rank-one formula concerns symmetric bilinear forms.

Proof plan:

1. Import the residue coefficient line from GN.6 and request its L-theory localization form (R1).
2. Compute the boundary using the torsion linking pairing on the dual lattice modulo the integral lattice, identifying the coefficient by multiplication by π.
3. Diagonalize nonalternating summands over K; alternating summands are metabolic. Only finitely many primes divide denominators and the Gram determinant. Track the line when the uniformizer changes.


Uses:

- DA.1 symmetric tables: Identifies the boundary and its cokernel rather than leaving an unnamed abstract map.
- DA.4 dyadic integers: Computes the residue splitting by ⟨−1,2⟩.

API:

- `secondResidue`: A homomorphism to the line-valued residue Witt group.
- `secondResidue_unit`: A rank-one unit form has zero residue.
- `secondResidue_uniformizer`: The class ⟨πu⟩ has residue ⟨ū⟩ in the π-coordinate.
- `secondResidue_squareScale`: Scaling a coefficient by a square leaves its residue class unchanged.
- `secondResidue_changeUniformizer`: For π′=vπ, the displayed coordinate is multiplied by ⟨v̄⁻¹⟩; the line-valued map is unchanged.
- `secondResidue_finiteSupport`: For any class, only finitely many ∂p are nonzero.
- `secondResidue_add`: Residue is additive under orthogonal sum and descends through metabolic relations.

Discriminating checks:

- **unitAtTwo** (computation): For Z_(2), ∂⟨3⟩=0.
- **uniformizerAtTwo** (computation): For Z_(2), ∂⟨2⟩=⟨1⟩≠0 in Ws(F2).
- **squareValuation** (non-example): ∂⟨4⟩=0, so merely testing divisibility by 2 gives the wrong map.
- **oddPrimeSign** (computation): At 3 with π=3, ∂⟨6⟩=⟨2⟩ in Ws(F3), retaining the unit square class.
- **ramificationGuard** (non-example): For Z→Z[i], the residue map Ws(F2)→Ws(F2) at 2 and 1+i is zero, although the residue-field map is the identity: the ramified linking pairing has zero Witt class (Remark 2.2.6).


Direct dependencies: GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line, GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/integral-comparison.

Source: CDHHLMNNS-III-v4, Lemma 2.2.9 and Remark 2.2.10, pp. 40–41; Lemma 2.2.2, p. 37. For each nonzero prime p of a Dedekind domain R, construct the symmetric Witt boundary ∂p:Ws(K)→Ws(kp;lp), where lp=p⁻¹/R at p is the canonical residue duality line. Choose a uniformizer π only to identify lp with kp. In that coordinate ∂p⟨πu⟩=⟨ū⟩ and ∂p⟨u⟩=0 for units u; valuation parity determines the general rank-one value. The family has finite support and gives ∂0:Ws(K)→⊕p Ws(kp;lp).

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. The five named definition checks must be realized with actual residue coordinates and the canonical line comparison.


### Finite Arf coordinate

Target `DA.0/finite-arf` (construction).

For k=F_(2^r), r≥1, and a finite-dimensional quadratic map q with perfect polar form, define Arf_k(q) as Tr_(k/F2)(Σ_i q(e_i)q(f_i)) in F2 for a symplectic basis (e_i,f_i). Prove basis independence and descent to an additive isomorphism Wq(k)≃Z/2. For a finite extension k′/k of degree m, extension of forms acts on these coordinates by multiplication by m modulo 2.

Hypotheses: k finite of characteristic 2; use the full polar, never the half-polar; dimension is even.

Proof plan:

1. Split off symplectic planes by the perfect alternating polar form. Symplectic changes of basis alter the raw invariant by x²+x, annihilated by the absolute trace.
2. A binary plane ax²+xy+by² is hyperbolic precisely when Tr(ab)=0; solve the associated Artin–Schreier equation. Pair two trace-one planes to obtain a hyperbolic form.
3. Under scalar extension use Tr_(k′/F2)(a)=m Tr_(k/F2)(a) for a in k. This is essential for the Eisenstein computation.


Uses:

- DA.3 number-field quadratic groups: Names each degree-two residue coordinate.
- DA.4 E8 reduction: Computes the integral generator’s reduction.
- DA.5 Eisenstein diagram: Distinguishes the zero F2→F4 map from an identity.

API:

- `finiteArf`: Absolute trace of the symplectic-basis sum.
- `finiteArf_basisIndependent`: Changing symplectic basis preserves the trace.
- `finiteArf_orthogonalSum`: The invariant is additive.
- `finiteArf_hyperbolic`: A hyperbolic plane has invariant zero.
- `finiteArf_eq_zero`: A nonsingular finite-field form has invariant zero exactly when metabolic.
- `finiteArf_wittEquiv`: The descended map is Wq(k)≃+Z/2.
- `finiteArf_baseChange`: For degree m, the base-change map is multiplication by m on Z/2.
- `finiteArf_nativePolar`: Regularity is perfectness of Mathlib QuadraticMap.polarBilin, not Q.associated in characteristic 2.

Discriminating checks:

- **hyperbolicPlane** (computation): Over F2, q(x,y)=xy has perfect polar and Arf 0.
- **anisotropicPlane** (computation): Over F2, x²+xy+y² has perfect polar and Arf 1; all three nonzero vectors have value 1.
- **evenExtension** (compatibility): Over F4, x²+xy+y² has Arf 0 and is hyperbolic: if ζ²+ζ+1=0, (ζ,1) is isotropic.
- **nonregularSquare** (non-example): Over F2, x² has zero polar and is excluded despite being a nonzero quadratic map.
- **zeroSpace** (degenerate): The zero-dimensional nonsingular form has invariant 0.


Direct dependencies: mathlib:QuadraticMap.polarBilin, mathlib:QuadraticMap.proj, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/integral-comparison.

Source: CDHHLMNNS-III-v4, Corollary 2.3.10, p. 45; Examples 2.3.13–14, pp. 46–47. The source uses residue quadratic Witt groups Z/2 through Arf invariants. This node supplies the explicit finite-field coordinate and its scalar-extension law; the latter corrects the diagram in Example 2.3.14.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. The F2 anisotropic plane and its F4 hyperbolic extension must have different coordinates; this is the regression for E3.


### Field L comparison

Target `DA.0/field-l-adapter` (comparison).

Import the field-level identifications of periodic L-groups and their shift laws. In characteristic different from 2, Ls_n(K)=W(K) for n≡0 mod 4 and zero otherwise, and Lq≃Ls. For a field of characteristic 2, symmetric L-theory has zero odd groups, even groups Ws(k), and period 2. For perfect such k, Ws(k)=Z/2 by rank parity. Keep genuine symmetric Lgs separate from periodic Ls.

Hypotheses: Fields and sign/shift conventions as in the primary source; finite even residue fields are perfect.

Proof plan:

1. Use current QFI field Witt and local classification APIs as imports, not a new field Witt construction.
2. The finite-even symmetric L calculation and perfect-field base change already have nodes in KTheoryFiniteLocalFields L.1.
3. The missing general Poincaré/field identification is part of G1; a finite-field arithmetic adapter does not manufacture its spectrum.


Direct dependencies: tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal, KTheoryFiniteLocalFields:L.1/finite-even-symmetric-l-groups, KTheoryFiniteLocalFields:L.1/perfect-char-two-symmetric-l-base-change.

Source: CDHHLMNNS-III-v4, Proposition 2.3.1, proof, p. 41; Corollary 2.3.4, p. 42. Import the field-level identifications of periodic L-groups and their shift laws. In characteristic different from 2, Ls_n(K)=W(K) for n≡0 mod 4 and zero otherwise, and Lq≃Ls. For a field of characteristic 2, symmetric L-theory has zero odd groups, even groups Ws(k), and period 2. For perfect such k, Ws(k)=Z/2 by rank parity. Keep genuine symmetric Lgs separate from periodic Ls.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. For F2 all even symmetric groups are Z/2, including degree 2; for Q2 degree 2 is zero.


Layer status: planned. Remaining: G1: shared Poincaré foundations and field/shift identification. R1: expose symmetric L residue localization.


## DA.1. Symmetric L-groups

Compute the four-periodic symmetric Dedekind table in characteristic not 2, identify the global boundary cokernel with Pic(R)/2, prove the characteristic-two two-periodic analogue, give DVR tables without a finiteness assumption, and record the two sign shifts.

Requires: ArithmeticKTheory:N.2, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0, KTheoryFiniteLocalFields:L.1, tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-8-global-classification-and-witt-consequences.


### Symmetric Dedekind table

Target `DA.1/symmetric-dedekind` (theorem).

Let R be Dedekind with fraction field K of characteristic not 2; let I be its finite set of dyadic primes. For n≡0,1,2,3 mod 4 respectively, Ls_n(R) is Ws(R), ⊕_(p∈I) Ws(kp), 0, coker(∂0). The identifications are induced by localization, with residue duality lines retained until uniformizers are chosen. In particular there is an exact sequence 0→Ls_(2a)(R)→Ls_(2a)(K)→⊕p Ls_(2a)(kp)→Ls_(2a−1)(R)→0.

Hypotheses: R commutative Dedekind domain; K char≠2; n and a arbitrary integers.

Proof plan:

1. Apply the L-variant of symmetric localization requested in R1, using the canonical shifted residue coefficient.
2. Use the field L table and degree-zero injectivity to break the localization long exact sequence into the displayed short pieces.
3. Only dyadic residue fields have nonzero symmetric groups in degree 2 modulo 4; identify degree 3 as the degree-zero boundary cokernel.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/second-residue, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/integral-injectivity, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/field-l-adapter.

Source: CDHHLMNNS-III-v4, Proposition 2.3.1, p. 41. Let R be Dedekind with fraction field K of characteristic not 2; let I be its finite set of dyadic primes. For n≡0,1,2,3 mod 4 respectively, Ls_n(R) is Ws(R), ⊕_(p∈I) Ws(kp), 0, coker(∂0). The identifications are induced by localization, with residue duality lines retained until uniformizers are chosen. In particular there is an exact sequence 0→Ls_(2a)(R)→Ls_(2a)(K)→⊕p Ls_(2a)(kp)→Ls_(2a−1)(R)→0.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. At R=Z recover Ws(Z),Z/2,0,coker ∂0, with the nonzero term in degree 1 rather than degree 2.


### Global residue cokernel

Target `DA.1/global-residue-cokernel` (theorem).

For R Dedekind with global fraction field K of characteristic not 2, the cokernel of ∂0:W(K)→⊕p Ws(kp;lp) is naturally Pic(R)/2. Fix the residue coordinates and relate rank parity of residues to the valuation divisor modulo 2; the remaining determinant/Hasse data must be eliminated by the global Witt residue theorem.

Hypotheses: Global field means a number field or a finite extension of Fq(t); R is Dedekind with that fraction field.

Proof plan:

1. Construct the map from residue classes to divisor classes modulo 2 by residue rank parity. Principal divisors give zero.
2. Prove surjectivity using the classes of primes. Kernel exactness is the substantial global Witt residue input, not a consequence of parity alone.
3. For number fields request the extension of GlobalQuadraticForms layer 8 (R3); for global function fields record G2 because that supplier explicitly excludes them. Calmes cites Milnor–Husemoller IV §4 and Scharlau 6.6, Theorem 6.11; these proofs were not available in the cleared library.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/second-residue, tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-8-global-classification-and-witt-consequences, ArithmeticKTheory:N.2/the-three-classical-rows.

Source: CDHHLMNNS-III-v4, Corollary 2.3.2 and proof, pp. 41–42. For R Dedekind with global fraction field K of characteristic not 2, the cokernel of ∂0:W(K)→⊕p Ws(kp;lp) is naturally Pic(R)/2. Fix the residue coordinates and relate rank parity of residues to the valuation divisor modulo 2; the remaining determinant/Hasse data must be eliminated by the global Witt residue theorem.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. For a PID the boundary is surjective; parity alone must not be accepted as the full kernel proof for a general global field.


### Global symmetric table

Target `DA.1/global-symmetric` (theorem).

With R and K as above, d the number of dyadic primes, the four symmetric groups are [Ws(R),(Z/2)^d,0,Pic(R)/2]. Each dyadic degree-one coordinate is residue rank parity. Odd-characteristic global fields have d=0.

Hypotheses: R Dedekind; K global; char K≠2; every residue field at a nonzero prime is finite.

Proof plan:

1. Apply the symmetric Dedekind table and global residue cokernel.
2. Identify each finite dyadic symmetric Witt group with Z/2 by rank, as supplied by KTheoryFiniteLocalFields.
3. Keep the Picard quotient as an actual group; Pic(R)=0 is used only for a PID.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/symmetric-dedekind, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/global-residue-cokernel, KTheoryFiniteLocalFields:L.1/finite-even-symmetric-l-groups.

Source: CDHHLMNNS-III-v4, Corollary 2.3.2, pp. 41–42. With R and K as above, d the number of dyadic primes, the four symmetric groups are [Ws(R),(Z/2)^d,0,Pic(R)/2]. Each dyadic degree-one coordinate is residue rank parity. Odd-characteristic global fields have d=0.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. When 2 is inverted the degree-one group vanishes, while Pic(R)/2 may still contribute in degree 3.


### Characteristic two table

Target `DA.1/characteristic-two` (theorem).

If R is Dedekind with global fraction field K of characteristic 2, Ls_(2a)(R)=Ws(R) and Ls_(2a+1)(R)=Pic(R)/2 for every integer a. The spectrum is 2-periodic. The map Ws(R)→Ws(K) is injective, whereas Wq(R)→Ws(R) is zero.

Hypotheses: R Dedekind; K a global function field of characteristic 2; all closed residue fields finite.

Proof plan:

1. Use symmetric localization and the 2-periodic field table.
2. Identify finite residue Ws with Z/2 by rank. The residue of ⟨a⟩ has rank v_p(a) modulo 2.
3. One-dimensional classes generate Ws(K), including the imperfect global field case; diagonalization of nonalternating summands and metabolicity of alternating summands give generation. The divisor exact sequence then identifies the cokernel with Pic(R)/2.
4. Apply integral Witt injection and the characteristic-two polar observation from DA.0.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/integral-injectivity, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/field-l-adapter, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/second-residue, ArithmeticKTheory:N.2/the-three-classical-rows.

Source: CDHHLMNNS-III-v4, Corollary 2.3.4 and Remark 2.3.17, pp. 42, 48. If R is Dedekind with global fraction field K of characteristic 2, Ls_(2a)(R)=Ws(R) and Ls_(2a+1)(R)=Pic(R)/2 for every integer a. The spectrum is 2-periodic. The map Ws(R)→Ws(K) is injective, whereas Wq(R)→Ws(R) is zero.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. For R=F2[t], Pic=0, so all odd symmetric groups vanish and Ws(R) occurs in every even degree.


### Local symmetric table

Target `DA.1/local-symmetric` (theorem).

For a DVR R with fraction field K and residue field k, the symmetric residue Ws(K)→Ws(k) is surjective and Ws(R) is its kernel. If char K≠2, Ls_2(R)=Ls_3(R)=0, and Ls_1(R)=Ws(k) when char k=2 and zero otherwise. If char K=2, symmetric L-theory is 2-periodic and every odd group of R vanishes.

Hypotheses: R a DVR, not necessarily complete or henselian; k need not be finite.

Proof plan:

1. Lift a nonsingular residue symmetric form to a unit determinant matrix over the local ring, then multiply by a uniformizer to realize its boundary.
2. Use the symmetric localization sequence and the field tables.
3. In characteristic 2 use symmetric rank-one generation and the same residue-surjectivity argument. No local-field finiteness assumption is added.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/symmetric-dedekind, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/field-l-adapter, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/second-residue.

Source: CDHHLMNNS-III-v4, Remark 2.3.5, p. 42. For a DVR R with fraction field K and residue field k, the symmetric residue Ws(K)→Ws(k) is surjective and Ws(R) is its kernel. If char K≠2, Ls_2(R)=Ls_3(R)=0, and Ls_1(R)=Ws(k) when char k=2 and zero otherwise. If char K=2, symmetric L-theory is 2-periodic and every odd group of R vanishes.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. At a mixed-characteristic dyadic DVR, degree 1 is Ws(k), while a characteristic-two DVR has degree 1 zero.


### Negative sign shifts

Target `DA.1/sign-shifts` (theorem).

For the sign −1 coefficient involution, L^(−s)(R)≃Σ²Ls(R) and L^(−q)(R)≃Σ²Lq(R). Thus π_n of either negative-sign theory is π_(n−2) of its positive-sign version. These are equivalences with the supplied shifted Poincaré structures, not an assertion that a symmetric form is alternating.

Hypotheses: R and coefficient duality in the supplier’s periodic L-theory; all integers n.

Proof plan:

1. Import the generic duality-shift equivalences under G1.
2. Record the homotopy indexing and rotate each arithmetic table by two places.
3. Check that degree 0 in the negative quadratic table for Z is the positive degree 2 group Z/2.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/field-l-adapter.

Source: CDHHLMNNS-III-v4, Remarks 2.3.3 and 2.3.11, pp. 42, 45. For the sign −1 coefficient involution, L^(−s)(R)≃Σ²Ls(R) and L^(−q)(R)≃Σ²Lq(R). Thus π_n of either negative-sign theory is π_(n−2) of its positive-sign version. These are equivalences with the supplied shifted Poincaré structures, not an assertion that a symmetric form is alternating.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. Over Z the negative-quadratic degree-zero group is Z/2, from positive degree 2, rather than Z.


Layer status: planned. Remaining: G1: shared Poincaré foundations and field/shift identification. G2/R3: global Witt residue kernel exactness for number fields and function fields; R7 is an existing general divisor import.


## DA.2. Completion and rigidity

Identify the dyadic completion as a product of complete DVRs. State the general localization-completion Poincaré–Verdier square with its K0 image controls and ordinary-versus-derived hypothesis. Prove quadratic isometry lifting, complete quadratic rigidity in all degrees and its henselian extension, retaining the relation and approximation proof gaps. The product completion comparison builds on pinned CRT, adic completion, complete-DVR and residue-field declarations.

Requires: GeneralAlgebraicKTheory:K.6, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1, StableHomotopyKTheory:H.5:spectra.


### Dyadic completion

Target `DA.2/dyadic-completion` (construction).

For a Dedekind domain R with char Frac(R)≠2, identify the ordinary 2-adic completion C=lim_m R/(2^m) with ∏_(p|2) R̂_p by Chinese remainders and cofinality of the powers. It is a finite product of complete DVRs. The empty product when 2 is a unit is the zero ring, and both L spectra vanish there. Preserve the maps R→C→C[1/2].

Hypotheses: R Dedekind, char fraction field≠2; completion is ordinary ring completion, with bounded 2-torsion automatically satisfied.

Proof plan:

1. Factor the ideal (2)=∏p p^e_p and iterate the pinned coprime-ideal Chinese remainder equivalence at each power. Use the existing AdicCompletion compatible-limit carrier, not a new completion definition.
2. Use cofinality of e_p m among positive powers and commute a finite product with inverse limits.
3. Localize at p before completion and compare limits. The e_p affect the topology’s presentation, not the number of residue coordinates.
4. The existing completed integer ring is a complete DVR with residue R/p for arbitrary Dedekind R. Identify its maximal-ideal powers with the localized p-adic filtration; density of R_(p) identifies its compatible quotient limit with that ring. The new target is the product comparison, not a second local completion theory.


Uses:

- DA.3 quadratic table: Reduces complete quadratic theory to finitely many dyadic residues.
- DA.5 Eisenstein example: Identifies the completion extension and its residue degree.

API:

- `dyadicCompletionEquiv`: The canonical ring equivalence C≃∏p R̂_p.
- `dyadicCompletion_map`: Its p-projection composed with R→C is local completion.
- `dyadicCompletion_residue`: The p-component has residue field R/p.
- `dyadicCompletion_invertTwo`: After inverting 2 the p-component is Frac(R̂_p).
- `dyadicCompletion_away`: Inverting only nondyadic primes induces an equivalence on C.
- `dyadicCompletion_empty`: When (2)=R, C is the zero ring, not R.
- `dyadicCompletionEquiv_ext`: Two ring maps into C agree if their composites with every completed-DVR projection agree; for an empty dyadic set the condition is vacuous.

Discriminating checks:

- **integers** (computation): For R=Z there is one factor Z_2 with residue F2.
- **invertTwo** (degenerate): For Z[1/2] the dyadic set is empty and C=0.
- **eisenstein** (computation): For Z[ζ3] there is one unramified quadratic factor with residue F4, not two factors and not F2.
- **ramifiedPrime** (non-example): For Z[i] the single dyadic factor remains one factor although (2) has exponent 2.


Direct dependencies: mathlib:AdicCompletion, mathlib:Ideal.quotientMulEquivQuotientProd, tauceti:IsDedekindDomain.HeightOneSpectrum.isAdicComplete_adicCompletionIntegers, tauceti:IsDedekindDomain.HeightOneSpectrum.residueFieldEquivAdicCompletionIntegers.

Source: CDHHLMNNS-III-v4, Proof of Proposition 2.3.9, pp. 44–45. For a Dedekind domain R with char Frac(R)≠2, identify the ordinary 2-adic completion C=lim_m R/(2^m) with ∏_(p|2) R̂_p by Chinese remainders and cofinality of the powers. It is a finite product of complete DVRs. The empty product when 2 is a unit is the zero ring, and both L spectra vanish there. Preserve the maps R→C→C[1/2].

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. Check the empty dyadic set and distinguish the inert F4 example from a ramified single prime.


### Arithmetic fracture

Target `DA.2/arithmetic-fracture` (theorem).

Let R be a ring, M an invertible module with involution over R, in the coefficient-duality sense of the source, and ℓ a positive integer. Assume ordinary ℓ-adic completion R̂_ℓ represents derived completion (bounded ℓ-power torsion suffices). For each m∈Z∪{±∞}, the square Dp(R)→Dp(R̂_ℓ), over Dc(R[1/ℓ])→Dc′(R̂_ℓ[1/ℓ]), with structures Q_M^(≥m), is Poincaré–Verdier. Here c and c′ are precisely the involution-stable images of the respective K0 maps. Applying GW or L gives a homotopy pullback square.

Hypotheses: Possibly noncommutative R; preserve the invertible bimodule and involution; ℓ≥1; ordinary/derived completion comparison explicitly assumed.

Proof plan:

1. The underlying perfect-complex square follows from the derived localization/completion pullback. Import this general categorical input under G1.
2. Keep the K0-controlled full subcategories instead of asserting that all projectives descend in an arbitrary ring.
3. Apply the Poincaré–Verdier criterion [II] Proposition 4.5.5; the Tate obstruction vanishes on the rational overlap. Then use localizing invariance of GW and L.


Direct dependencies: GeneralAlgebraicKTheory:K.6, StableHomotopyKTheory:H.5:spectra.

Source: CDHHLMNNS-III-v4, Proposition 2.3.6, p. 43. Let R be a ring, M an invertible module with involution over R, in the coefficient-duality sense of the source, and ℓ a positive integer. Assume ordinary ℓ-adic completion R̂_ℓ represents derived completion (bounded ℓ-power torsion suffices). For each m∈Z∪{±∞}, the square Dp(R)→Dp(R̂_ℓ), over Dc(R[1/ℓ])→Dc′(R̂_ℓ[1/ℓ]), with structures Q_M^(≥m), is Poincaré–Verdier. Here c and c′ are precisely the involution-stable images of the respective K0 maps. Applying GW or L gives a homotopy pullback square.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. A general ring statement must retain c,c′; only the subsequent Dedekind specialization may remove them.


### Quadratic isometry lifting

Target `DA.2/quadratic-lifting` (theorem).

If R is complete and separated for powers of an involution-stable two-sided ideal J, projectives and nonsingular quadratic forms lift from R/J. Two nonsingular quadratic refinements on the same finite projective module which are isometric modulo J are isometric over R by an isometry reducing to the prescribed one. No invertibility of 2 is assumed.

Hypotheses: Involution and quadratic form parameter compatible with J; complete and separated, not merely dense; finite projective modules.

Proof plan:

1. Lift idempotents and homomorphisms of projectives. Use Nakayama to recognize a lifted polar map as invertible.
2. Lift the prescribed residue isometry first as a module map. Apply successive quadratic corrections: error in J^r is replaced by error in J^(2r).
3. Completeness gives the convergent product of the corrections and separation turns the limiting equality into equality. This is the quadratic lifting theorem; the analogous arbitrary symmetric statement at 2 is false.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/integral-comparison.

Source: CDHHLMNNS-III-v4, Proposition 2.3.7, pp. 43–44, invoking Wall (1970), Lemma 1 and Theorem 2. If R is complete and separated for powers of an involution-stable two-sided ideal J, projectives and nonsingular quadratic forms lift from R/J. Two nonsingular quadratic refinements on the same finite projective module which are isometric modulo J are isometric over R by an isometry reducing to the prescribed one. No invertibility of 2 is assumed.; Wall-1970, Lemma 1, p. 427; Theorem 2 and proof, pp. 428–429. Recognizes nonsingularity and corrects a quadratic isometry by successively squaring its ideal-adic error.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. The lifting proof must use quadratic corrections without dividing by 2, and require convergence and separation.


### Complete quadratic rigidity

Target `DA.2/complete-rigidity` (theorem).

For R complete and separated in an involution-stable ideal J, reduction is an equivalence Lq(R;ε)≃Lq(R/J;ε) of periodic spectra for ε=±1 and every homotopy degree. The coefficient is the standard ring duality with its specified sign; no arbitrary invertible-coefficient extension is asserted.

Hypotheses: R possibly noncommutative with specified involution and standard coefficient duality; J invariant under that involution; J-adic completeness and separation.

Proof plan:

1. Use projective and quadratic isometry lifting to identify Lq_0 and the relevant K0 controls.
2. For Lq_1, lifting isometries proves surjectivity, but one must also compare the elementary/formation relations to prove injectivity. Wall (1973) Corollary 1, Lemma 1 and Proposition 4 supply this input; its full proof remains G3.
3. Use negative-sign shifts and four-periodicity to cover all integers. An isomorphism only on L0 is not a spectrum proof.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2/quadratic-lifting, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/sign-shifts.

Source: CDHHLMNNS-III-v4, Proposition 2.3.7, pp. 43–44. For R complete and separated in an involution-stable ideal J, reduction is an equivalence Lq(R;ε)≃Lq(R/J;ε) of periodic spectra for ε=±1 and every homotopy degree. The coefficient is the standard ring duality with its specified sign; no arbitrary invertible-coefficient extension is asserted.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. Verify L0 and L1 for both signs and the relation-kernel map; a bijection of form isometry classes alone is insufficient.


### Henselian quadratic rigidity

Target `DA.2/henselian-rigidity` (theorem).

For every commutative henselian pair (R,J), reduction induces Lq(R)≃Lq(R/J), integrally, for both signs. Neither 2 invertible nor nilpotence of J is required.

Hypotheses: R commutative; (R,J) henselian; periodic quadratic L-theory commutes with filtered colimits.

Proof plan:

1. Reduce by filtered colimits to henselizations of finitely presented pairs.
2. Apply the completion-to-henselian argument of CMM Remark 5.6: noetherian completion is ind-smooth by Popescu, and the relevant smooth maps split through the henselian pair by Elkik approximation. Obtain the required maps as filtered colimits of split injections and use the retraction argument.
3. Apply complete quadratic rigidity and colimit preservation. This imports the Popescu/Elkik input under G4; it is not Gabber prime-to-residue-characteristic K-theory rigidity.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2/complete-rigidity.

Source: CDHHLMNNS-III-v4, Remark 2.3.8, p. 44. For every commutative henselian pair (R,J), reduction induces Lq(R)≃Lq(R/J), integrally, for both signs. Neither 2 invertible nor nilpotence of J is required.; CMM, Remark 5.6, p. 39. General passage from noetherian complete-pair invariance and filtered colimits to henselian-pair invariance using Popescu and Elkik.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. A henselian dyadic DVR must be included integrally, so a theorem requiring 2 invertible is not an acceptable supplier.


Layer status: planned. Remaining: G1: shared Poincaré foundations and field/shift identification. G3: Wall degree-one relations; G4: full Popescu/Elkik input.


## DA.3. Quadratic L-groups

Deduce the quadratic/symmetric pullback for Dedekind rings, define the actual total-cokernel correction A, give the four-periodic quadratic table and number-field Arf coordinates, prove the parity quotient for multiple dyadic primes, and establish quadratic dévissage precisely away from those primes.

Requires: ArithmeticKTheory:N.1, ArithmeticKTheory:N.2, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field.


### Quadratic comparison square

Target `DA.3/quadratic-fracture` (theorem).

For a Dedekind domain R with char K≠2 and C=R̂_2, the comparison square Lq(R)→Lq(C), over Ls(R)→Ls(C), is a homotopy pullback. The coefficient is R with positive involution; the negative-sign version follows by shift.

Hypotheses: R Dedekind domain; K its fraction field of characteristic not 2; C as DA.2.

Proof plan:

1. Apply arithmetic fracture to both flavors. Over R[1/2] and C[1/2], the quadratic-to-symmetric comparison is an equivalence.
2. Remove the K0 controls only here: every projective on a Dedekind localization has a projective lattice before localization, so K0(R)→K0(R[1/2]) is surjective; the same applies to the completion product.
3. Paste the two pullbacks. No assertion of generic K0-surjectivity for arbitrary rings is used.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2/arithmetic-fracture, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2/dyadic-completion, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/integral-comparison, ArithmeticKTheory:N.1, ArithmeticKTheory:N.2/the-three-classical-rows.

Source: CDHHLMNNS-III-v4, Proposition 2.3.9, diagram (9), pp. 44–45. For a Dedekind domain R with char K≠2 and C=R̂_2, the comparison square Lq(R)→Lq(C), over Ls(R)→Ls(C), is a homotopy pullback. The coefficient is R with positive involution; the negative-sign version follows by shift.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. With 2 a unit the completion terms vanish and the square reduces to the flavor equivalence.


### Dyadic correction

Target `DA.3/correction-term` (definition).

For C=R̂_2, define A(R)=Ws(C)/(im(Ws(R)→Ws(C))+im(σ_C:Wq(C)→Ws(C))). Equivalently it is the cokernel of coker(σ_R)→coker(σ_C), since the comparison square commutes. The definition is an additive quotient, without choosing a splitting of any L-group extension.

Hypotheses: R Dedekind with char K≠2; C dyadic completion; actual additive Witt carriers from the suppliers.

Proof plan:

1. Form the two additive subgroup ranges in Ws(C), take their supremum, and use the existing quotient-group carrier.
2. Commutativity sends im σ_R into im σ_C. Apply quotient universal properties twice to identify the total cokernel.
3. Derive functoriality only for maps for which completion and both comparison maps commute.


Uses:

- DA.3 quadratic table: Names the kernel of Lq_(−1)(R)→Ls_(−1)(R).
- DA.5 Eisenstein table: Computes the quotient using both images; omitting the local quadratic image gives the wrong group.

API:

- `dyadicCorrection`: The quotient by the sum of the two named images.
- `dyadicCorrection_mk`: The quotient map Ws(C)→A(R) is surjective.
- `dyadicCorrection_zero`: A representative is zero exactly when it is a global symmetric image plus a completed quadratic image.
- `dyadicCorrection_lift`: An additive map out factors uniquely precisely when it kills both images.
- `dyadicCorrection_totalCokernel`: Identify A with coker(coker σ_R→coker σ_C).
- `dyadicCorrection_map`: A commuting comparison/completion diagram induces the unique quotient map.
- `dyadicCorrection_nativeQuotient`: Use D/(s.range ⊔ q.range), the Mathlib additive quotient, not a new quotient structure.

Discriminating checks:

- **surjectiveGlobal** (characterisation): If Ws(R)→Ws(C) is onto, then A(R)=0, even if σ_C is not onto.
- **surjectiveQuadratic** (characterisation): If σ_C is onto, A(R)=0, even if the global image vanishes.
- **diagonalParityModel** (computation): For D=(Z/2)^d, s the constant diagonal and q zero, the quotient has order 2^(d−1) for d≥1.
- **singlePrimeGuard** (non-example): The parity quotient is zero at d=1, but it does not force A(R)=0; the Eisenstein computation supplies a nonzero example.
- **emptyDyadicSet** (degenerate): When 2 is a unit, C=0 and A(R)=0.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/quadratic-fracture, mathlib:QuotientGroup.mk', mathlib:MonoidHom.range.

Source: CDHHLMNNS-III-v4, Proposition 2.3.9, pp. 44–45; Remark 2.3.12, pp. 45–46. For C=R̂_2, define A(R)=Ws(C)/(im(Ws(R)→Ws(C))+im(σ_C:Wq(C)→Ws(C))). Equivalently it is the cokernel of coker(σ_R)→coker(σ_C), since the comparison square commutes. The definition is an additive quotient, without choosing a splitting of any L-group extension.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. Both images must be quotiented; the Eisenstein A differs from the symmetric restriction cokernel.


### Quadratic Dedekind table

Target `DA.3/quadratic-dedekind` (theorem).

For R Dedekind, char K≠2, and dyadic primes I, Lq_n(R) for n≡0,1,2 mod 4 is Wq(R), 0, ⊕_(p∈I) Wq(kp). The fourth group is specified by an exact sequence 0→A(R)→Lq_(−1)(R)→Ls_(−1)(R)→0. This exact sequence is not asserted to split.

Hypotheses: All integer degrees; no global-field or finite-residue hypothesis.

Proof plan:

1. In the pullback square use complete rigidity on C=∏R̂_p and the local symmetric table.
2. Compute degrees 0,1,2 by the long exact sequence, respecting the coefficient shifts.
3. In degree −1 identify the total cokernel with A and obtain the displayed extension. Preserve its maps rather than replacing it by a direct sum.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/quadratic-fracture, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/correction-term, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2/complete-rigidity, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/local-symmetric, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/symmetric-dedekind.

Source: CDHHLMNNS-III-v4, Proposition 2.3.9, pp. 44–45. For R Dedekind, char K≠2, and dyadic primes I, Lq_n(R) for n≡0,1,2 mod 4 is Wq(R), 0, ⊕_(p∈I) Wq(kp). The fourth group is specified by an exact sequence 0→A(R)→Lq_(−1)(R)→Ls_(−1)(R)→0. This exact sequence is not asserted to split.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. Recover a short exact sequence with A as its kernel, without asserting a splitting when Pic(R)/2 is nonzero.


### Number field quadratic table

Target `DA.3/number-field-quadratic` (theorem).

If R is Dedekind with number-field fraction field and d dyadic primes, Lq_2(R)≃(Z/2)^d by the residue Arf coordinates. Its degree-three group fits 0→A(R)→Lq_3(R)→Pic(R)/2→0, where A(R) is a finite 2-primary group. Together with Wq(R),0 in degrees 0,1 this gives the four-periodic quadratic table.

Hypotheses: Number-field fraction field; R need not be the full ring of integers.

Proof plan:

1. Use finite Arf coordinates in the quadratic Dedekind table and the global symmetric table.
2. Each completed symmetric Witt group embeds in the Witt group of a finite extension of Q2. The imported local classification makes those finite 2-primary groups; their finite product and its quotient A are finite 2-primary.
3. Pic(R)/2 is finite by the class-number/localization input; the extension is still not canonically split.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/quadratic-dedekind, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/finite-arf, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/global-symmetric, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field, ArithmeticKTheory:N.1.

Source: CDHHLMNNS-III-v4, Corollary 2.3.10 and proof, p. 45. If R is Dedekind with number-field fraction field and d dyadic primes, Lq_2(R)≃(Z/2)^d by the residue Arf coordinates. Its degree-three group fits 0→A(R)→Lq_3(R)→Pic(R)/2→0, where A(R) is a finite 2-primary group. Together with Wq(R),0 in degrees 0,1 this gives the four-periodic quadratic table.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. For d=1 the degree-two group is one copy of Z/2; ramification degree does not change that count.


### Dyadic parity obstruction

Target `DA.3/parity-obstruction` (theorem).

For R as in the preceding theorem and d≥2, rank parity induces a canonical surjection A(R)→(Z/2)^d/Δ(Z/2)≃(Z/2)^(d−1). Hence A(R) is nonzero. For d=1 the same quotient is zero and gives no vanishing conclusion about A.

Hypotheses: R Dedekind with number-field fraction field; d the number of distinct dyadic primes, not ramification-weighted.

Proof plan:

1. Every quadratic perfect polar form over a dyadic local ring reduces to a perfect alternating form, hence has even rank. Thus local quadratic images are killed by parity.
2. The rank of a global projective is constant, so its parity image is diagonal. All vectors of parity occur in the product of symmetric Witt groups via unit rank-one forms in the individual factors.
3. Pass to the quotient and identify the cokernel of the diagonal by subtracting a chosen coordinate. The resulting group isomorphism depends on that choice; the quotient surjection does not.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/correction-term, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/number-field-quadratic.

Source: CDHHLMNNS-III-v4, Remark 2.3.12, pp. 45–46. For R as in the preceding theorem and d≥2, rank parity induces a canonical surjection A(R)→(Z/2)^d/Δ(Z/2)≃(Z/2)^(d−1). Hence A(R) is nonzero. For d=1 the same quotient is zero and gives no vanishing conclusion about A.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. For d=2 obtain a surjection onto Z/2; for d=1 assert no vanishing conclusion for A.


### Quadratic localization

Target `DA.3/away-dyadic-devissage` (theorem).

For a Dedekind domain R with char K≠2 and a set S of nondyadic primes, Lq(R)→Lq(R_S)→⊕_(p∈S) Lq(kp) is a fibre sequence after choosing the residue coefficient trivializations. Retain the canonical line and shift before trivializing. This statement does not extend to a dyadic S: over Z it would force the nonzero Lq_2(Z)=Z/2 to vanish.

Hypotheses: No dyadic prime in S; R_S denotes inversion of the specified primes; finite supports for arbitrary S.

Proof plan:

1. R and R_S have canonically equivalent dyadic completions. Paste their quadratic/symmetric pullbacks.
2. The left comparison square is a pullback; symmetric localization identifies its cofiber with the residue sum. At these primes 2 is invertible so Ls≃Lq.
3. For S={2} over Z, the would-be sequence has π_3 Lq(F2)=0 and π_2 Lq(Z[1/2])=0, so exactness would force Lq_2(Z)=0, contradicting the integral table.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/quadratic-fracture, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2/dyadic-completion, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/second-residue.

Source: CDHHLMNNS-III-v4, Remark 2.3.15, p. 47; Remark 2.2.8, p. 40. For a Dedekind domain R with char K≠2 and a set S of nondyadic primes, Lq(R)→Lq(R_S)→⊕_(p∈S) Lq(kp) is a fibre sequence after choosing the residue coefficient trivializations. Retain the canonical line and shift before trivializing. This statement does not extend to a dyadic S: over Z it would force the nonzero Lq_2(Z)=Z/2 to vanish.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. At DA.4, use the integer L-table to check the dyadic non-example; it is not needed to prove the nondyadic localization theorem. Use finite support for an infinite S, and retain the explicit Z at 2 counterexample after DA.4.


Layer status: planned. Remaining: G1: shared Poincaré foundations and field/shift identification. Inherited dependencies G2–G4 through the arithmetic tables.


## DA.4. The integers

Derive the explicit W(Q2) coordinate and ideal calculations from imported local classification; import integral GW/lattice foundations for the E8 comparison, compute the dyadic integral Witt subgroup and its quadratic image, and obtain the symmetric and quadratic integer L-tables.

Requires: GeometryOfNumbersAndQuadraticArithmetic:GN.6, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3, tauceti:Completed/IntegralLattices#layer-5-rank-one-and-ade-discriminant-forms, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field.


### Dyadic Witt coordinates

Target `DA.4/q2-coordinates` (theorem).

In the imported field Witt ring W(Q2), put u=⟨1⟩, v=⟨1,−2⟩, c=⟨1,3⟩=⟨1,−5⟩. They give W(Q2)≃Z/8{u}⊕Z/2{v}⊕Z/2{c}. Multiplication by c sends u to c, v to 4u, and c to 0. Consequently (c)=⟨c,4u⟩≃(Z/2)^2 and ann(c)=⟨2u,c⟩≃Z/4⊕Z/2. The latter is also generated by 2u and ⟨1,−3⟩=2u+c; ⟨1,−2⟩ is not in it.

Hypotheses: Field Q2; the field Witt ring, Hilbert symbol formula and complete local classification are imports, not redefined here.

Proof plan:

1. Apply the Q2 square-class and Hilbert-symbol formula to the 32 displayed classes. It verifies orders and distinctness through dimension parity, signed determinant and Hasse invariant after hyperbolic stabilization.
2. Use −5/3≡1 modulo 8 to identify the two binary forms. Tensor and classify the three products with c; solve a c+b(4u)=0 using independent c and 4u.
3. The corrected annihilator generator tensors with c to a hyperbolic form. The printed one gives ⟨1,3,−2,−6⟩, anisotropic: the norm from the unramified quadratic extension has even valuation, incompatible with multiplication by 2.


Direct dependencies: tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field, mathlib:Padic, mathlib:QuadraticMap.weightedSumSquares, mathlib:QuadraticMap.Anisotropic, mathlib:QuadraticMap.Equivalent.

Source: CDHHLMNNS-III-v4, Examples 2.3.13–14, pp. 46–47; the ring computations here are derived from the imported local invariant classification. In the imported field Witt ring W(Q2), put u=⟨1⟩, v=⟨1,−2⟩, c=⟨1,3⟩=⟨1,−5⟩. They give W(Q2)≃Z/8{u}⊕Z/2{v}⊕Z/2{c}. Multiplication by c sends u to c, v to 4u, and c to 0. Consequently (c)=⟨c,4u⟩≃(Z/2)^2 and ann(c)=⟨2u,c⟩≃Z/4⊕Z/2. The latter is also generated by 2u and ⟨1,−3⟩=2u+c; ⟨1,−2⟩ is not in it.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. The 32 coordinate classes must be distinct; multiplication by c must have image of size 4 and kernel of size 8.


### Integral signature

Target `DA.4/integer-witt` (theorem).

For Z, Ws(Z)≃Z by signature and Wq(Z)≃Z by signature divided by 8; polarisation is multiplication by 8. The quadratic generator is the positive E8 lattice with q(x)=B(x,x)/2, and its reduction modulo 2 has Arf invariant 0.

Hypotheses: Unimodular forms on finite free Z-modules; the half-norm convention for the quadratic E8 form.

Proof plan:

1. Use GN.6’s classical symmetric and quadratic degree-zero GW calculations, quotienting hyperbolic classes to obtain the two Witt groups. This avoids repeating the classification of integral forms.
2. Alternatively use even-unimodular signature divisibility from the current IntegralLattices roadmap and E8 of signature 8. The bilinear form B, not B(x,x), is the polar of q.
3. Reduce the actual E8 quadratic refinement modulo 2. In a simple-root basis q(x)=Σx_i²−Σ_edges x_i x_j, with the E8 graph having arms of lengths 2,4,1, enumerate 136 zeros among its 256 vectors. Since 136=2^7+2^3, its Arf invariant is 0. This checks the refinement, not merely the alternating bilinear reduction.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmetic:GN.6/integer-classical-degree-zero, GeometryOfNumbersAndQuadraticArithmetic:GN.6/integer-quadratic-table, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/finite-arf, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/integral-injectivity, tauceti:Completed/IntegralLattices#layer-5-rank-one-and-ade-discriminant-forms, tauceti:TauCeti.IntegralLattice.

Source: CDHHLMNNS-III-v4, Example 2.3.13, p. 46; §3.2 introduction, pp. 54–55. For Z, Ws(Z)≃Z by signature and Wq(Z)≃Z by signature divided by 8; polarisation is multiplication by 8. The quadratic generator is the positive E8 lattice with q(x)=B(x,x)/2, and its reduction modulo 2 has Arf invariant 0.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. Use the quadratic half-norm refinement on E8: the diagonal polynomial B(x,x) has the wrong polar at 2.


### Dyadic integral Witt group

Target `DA.4/dyadic-integer-witt` (theorem).

Ws(Z_2) is the kernel of the surjective second residue W(Q2)→Z/2, hence has order 16 and is Z/8⊕Z/2. The section of the residue is ⟨−1,2⟩ of order 2. The map Wq(Z_2)=Z/2→Ws(Z_2) is injective and its image together with ⟨1⟩ spans Ws(Z_2); it is represented by the polar matrix [[2,1],[1,2]], whose Q2 Witt class is c+4u.

Hypotheses: Z_2 the 2-adic integers; Q2 its fraction field; u,c from DA.4.

Proof plan:

1. The residue of v is nonzero, while u and c have zero residue; the 32-class presentation gives the kernel.
2. The Arf-one plane x²+xy+y² lifts to Z_2; diagonalize its polar over Q2 as ⟨2,3/2⟩ and use the coordinate product formula to identify c+4u.
3. Together u and c+4u generate the kernel; check the order-two section ⟨−1,2⟩ using local invariants.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.4/q2-coordinates, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/local-symmetric, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2/complete-rigidity, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/finite-arf.

Source: CDHHLMNNS-III-v4, Example 2.3.13, p. 46. Ws(Z_2) is the kernel of the surjective second residue W(Q2)→Z/2, hence has order 16 and is Z/8⊕Z/2. The section of the residue is ⟨−1,2⟩ of order 2. The map Wq(Z_2)=Z/2→Ws(Z_2) is injective and its image together with ⟨1⟩ spans Ws(Z_2); it is represented by the polar matrix [[2,1],[1,2]], whose Q2 Witt class is c+4u.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. The Arf-one integral polar must map to c+4u, and ⟨−1,2⟩ must give a nonzero residue of order two.


### Integer L-groups

Target `DA.4/integer-table` (theorem).

For every integer n, the symmetric L-groups of Z in residues 0,1,2,3 mod 4 are [Z,Z/2,0,0], and the quadratic groups are [Z,0,Z/2,0]. The comparison in degree zero is multiplication by 8 and the correction A(Z) is zero.

Hypotheses: Periodic Ls and Lq, not the genuine nonperiodic symmetric L-theory.

Proof plan:

1. Use Pic(Z)=0 and the global symmetric table.
2. The completed quadratic and global symmetric images span Ws(Z_2), so A(Z)=0.
3. Use the quadratic table and Arf invariant, with the E8 comparison fixing the generators and map in degree zero.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.4/integer-witt, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.4/dyadic-integer-witt, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/quadratic-dedekind, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/global-symmetric.

Source: CDHHLMNNS-III-v4, Example 2.3.13, p. 46. For every integer n, the symmetric L-groups of Z in residues 0,1,2,3 mod 4 are [Z,Z/2,0,0], and the quadratic groups are [Z,0,Z/2,0]. The comparison in degree zero is multiplication by 8 and the correction A(Z) is zero.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. Check degree-zero multiplication by 8, A(Z)=0 and the Arf group in quadratic degree 2.


Layer status: planned. Remaining: G1: shared Poincaré foundations and field/shift identification. Inherited dependencies G2–G4 through the arithmetic tables.


## DA.5. The Eisenstein integers

Prove the single dyadic place is inert with residue F4. Compute the global symmetric Witt group and the unramified quadratic restriction ideal/cokernel. Use the zero quadratic Arf map F2→F4 and the new local quadratic generator to correct the Eisenstein quadratic table to [0,0,Z/2,Z/4]. The additional transfer exactness contract is G5/R4; all three preprint findings are independently confirmed.

Requires: ArithmeticKTheory:N.1, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.4, tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-8-global-classification-and-witt-consequences, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-9-transfer-and-the-relative-stiefel-whitney-formula.


### Eisenstein dyadic place

Target `DA.5/eisenstein-arithmetic` (theorem).

Let ζ²+ζ+1=0 and R=Z[ζ] inside K=Q(√−3). R is the full ring of integers, a norm-Euclidean PID, with unit group μ6 and unit square classes represented by ±1. The ideal (2) is prime with residue F4. Its completion O is the unramified quadratic extension of Z_2 with fraction field E=Q2(√−3). Pic(R)=0.

Hypotheses: ζ primitive cube root; 2 is unramified and inert, the second condition requires its own proof.

Proof plan:

1. Use the integral basis and discriminant −3. For Euclideanity, round both coefficients of a+bζ to nearest integers; the remainder has norm x²−xy+y²≤3/4<1.
2. Solve norm 1 to get the six units; their squares give the stated two square classes.
3. Reduce t²+t+1 modulo 2: it has no root, hence is irreducible. Its separability and discriminant prove unramified inertness and residue degree 2. Nondivisibility of the discriminant alone proves only unramifiedness.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2/dyadic-completion, ArithmeticKTheory:N.1.

Source: CDHHLMNNS-III-v4, Example 2.3.14, p. 46. Let ζ²+ζ+1=0 and R=Z[ζ] inside K=Q(√−3). R is the full ring of integers, a norm-Euclidean PID, with unit group μ6 and unit square classes represented by ±1. The ideal (2) is prime with residue F4. Its completion O is the unramified quadratic extension of Z_2 with fraction field E=Q2(√−3). Pic(R)=0.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. The factor at 2 has residue F4; a proof using only discriminant −3 does not establish inertness.


### Eisenstein symmetric Witt group

Target `DA.5/eisenstein-symmetric` (theorem).

For R=Z[ζ3], Ws(R)≃Z/4 generated by u=⟨1⟩. Under generic and completed base change this generator still has order 4.

Hypotheses: R and K as above; import number-field Hasse–Minkowski and dyadic local classification.

Proof plan:

1. Ws(R) injects into W(K). The determinant of a unimodular form is a unit; modulo squares the units are ±1. At odd finite primes unit diagonalization makes its local Hasse invariant 1. There are no real places. The global product formula therefore forces Hasse invariant 1 at the only remaining place, above 2.
2. The Hamilton class (−1,−1) splits after extension to K: its invariant at 2 is killed by the unramified degree-two extension and there is no real obstruction. Thus 4u=0, while 2u≠0 because −1 is not a square in K or E.
3. Match each of the four possible rank-parity and signed-determinant patterns by 0,u,2u,3u. Stabilize by hyperbolic planes to compare equal dimensions and apply the imported local/global invariant classification. This is an independent proof of the cited target, not a claim to have read Milnor–Husemoller Corollary 4.2.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.5/eisenstein-arithmetic, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/integral-injectivity, tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-8-global-classification-and-witt-consequences, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field.

Source: CDHHLMNNS-III-v4, Example 2.3.14, p. 46; proof adapted here using GlobalQuadraticForms layer 8 instead of the inaccessible book citation. For R=Z[ζ3], Ws(R)≃Z/4 generated by u=⟨1⟩. Under generic and completed base change this generator still has order 4.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. The class u has exact order 4 over both K and E, not merely order dividing 4.


### Unramified restriction

Target `DA.5/eisenstein-restriction` (theorem).

For E=Q2(√−3), restriction θ′:W(Q2)→W(E) has kernel (c)=⟨c,4u⟩≃(Z/2)^2. The same kernel and cokernel occur for θ:Ws(Z_2)→Ws(O), since 2 is a uniformizer in both and Ws(F2)→Ws(F4) is the identity on rank parity. The cokernel is ann(c)≃Z/4⊕Z/2, using the quadratic-extension transfer exact sequence with a functional s:E→Q2 satisfying s(1)=0.

Hypotheses: E/Q2 unramified quadratic; symmetric residue groups, not quadratic Arf groups, occur in this diagram.

Proof plan:

1. Request the quadratic-extension Witt kernel/transfer exact sequence as an extension of QFI layer 9 (R4); the currently stated transfer and Frobenius reciprocity alone do not imply it. The unregistered exactness extension is G5; it is not inferred from Frobenius reciprocity.
2. Apply the explicit ideal and annihilator computation of DA.4.
3. Compare symmetric residue exact sequences. The right vertical map is rank parity and is an isomorphism; the kernel/cokernel lemma gives the integral comparison.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.4/q2-coordinates, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.4/dyadic-integer-witt, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.5/eisenstein-arithmetic, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-9-transfer-and-the-relative-stiefel-whitney-formula.

Source: CDHHLMNNS-III-v4, Example 2.3.14, p. 47. For E=Q2(√−3), restriction θ′:W(Q2)→W(E) has kernel (c)=⟨c,4u⟩≃(Z/2)^2. The same kernel and cokernel occur for θ:Ws(Z_2)→Ws(O), since 2 is a uniformizer in both and Ws(F2)→Ws(F4) is the identity on rank parity. The cokernel is ann(c)≃Z/4⊕Z/2, using the quadratic-extension transfer exact sequence with a functional s:E→Q2 satisfying s(1)=0.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. Use the symmetric rank-parity identity on residues; do not reuse it for quadratic Arf base change.


### Eisenstein Arf base change

Target `DA.5/eisenstein-arf-change` (theorem).

The map Wq(Z_2)→Wq(O) is zero, since its residue degree is 2. Let t be the image in Ws(O) of the Arf-one form q=x²+xy+ζy² over O. It has order 2 and signed determinant d=1−4ζ. Norm_(E/Q2)(d)=21 is not a Q2 square. Consequently t∉⟨u⟩⊂Ws(O): the only possible nonzero order-two class there is 2u, whose signed determinant −1 has square norm. Thus ⟨u⟩∩⟨t⟩=0.

Hypotheses: ζ reduces to a trace-one element of F4; O unramified quadratic over Z_2; polar matrix [[2,1],[1,2ζ]].

Proof plan:

1. Apply finite Arf base change and complete rigidity. The polynomial t²+t+1 splits over F4, so the F2 anisotropic plane becomes hyperbolic.
2. Tr_(F4/F2)(ζ)=1, so the new O quadratic plane is a generator. Its polar determinant is 4ζ−1, hence its signed determinant is d.
3. Compute (1−4ζ)(1−4ζ²)=21. A Q2 unit is square only if congruent to 1 mod 8, whereas 21≡5. The signed determinant in the even-dimensional Witt ideal is multiplicative under orthogonal sum, so comparison with 0 and 2u proves the intersection claim.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/finite-arf, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2/complete-rigidity, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.5/eisenstein-symmetric, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.5/eisenstein-arithmetic.

Source: CDHHLMNNS-III-v4, Example 2.3.14, diagram pp. 46–47, corrected by the finite-field Arf scalar-extension calculation. The map Wq(Z_2)→Wq(O) is zero, since its residue degree is 2. Let t be the image in Ws(O) of the Arf-one form q=x²+xy+ζy² over O. It has order 2 and signed determinant d=1−4ζ. Norm_(E/Q2)(d)=21 is not a Q2 square. Consequently t∉⟨u⟩⊂Ws(O): the only possible nonzero order-two class there is 2u, whose signed determinant −1 has square norm. Thus ⟨u⟩∩⟨t⟩=0.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. Norm(1−4ζ)=21 and Norm(−1)=1 must distinguish the local quadratic generator from the global class 2u.


### Eisenstein L-groups

Target `DA.5/eisenstein-table` (theorem).

For R=Z[ζ3], the symmetric groups in degrees 0,1,2,3 mod 4 are [Z/4,Z/2,0,0]. The quadratic groups are [0,0,Z/2,Z/4]. These correct the quadratic degree-zero and degree-three entries in Example 2.3.14. In particular A(R)=Z/4, even though there is only one dyadic prime.

Hypotheses: All integer degrees; positive-sign periodic theories; corrected Arf base-change diagram used throughout.

Proof plan:

1. Use the quadratic/symmetric pullback in degree zero. The map Ws(R)⊕Wq(O)→Ws(O) has trivial kernel by the preceding intersection computation, so Wq(R)=0.
2. For A, start with coker θ≃ann(c)=⟨2u,c⟩. The global symmetric image is im θ=⟨u⟩, because θ kills c and 4u. One must still quotient by the new local quadratic generator t.
3. Under the transfer description of coker θ, transfer the new local quadratic generator t using λ(1)=0, λ(√−3)=1. Its polar has rational diagonalization ⟨1,−1,4,−21/4⟩, hence Witt class ⟨1,−21⟩=c because −7 is a Q2 square. Thus A(R)=ann(c)/⟨c⟩≃Z/4, generated by the image of 2u. This quotients by the additional local quadratic image; the intermediate symmetric cokernel is not A.
4. Apply Pic(R)=0 and the two tables to obtain the result. Do not use the source’s identity map on quadratic residue groups; the abstract annihilator alone is the cokernel of θ, not yet A.


Direct dependencies: GeometryOfNumbersAndQuadraticArithmeticPartII:DA.5/eisenstein-restriction, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.5/eisenstein-arf-change, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/correction-term, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/quadratic-dedekind, GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/global-symmetric.

Source: CDHHLMNNS-III-v4, Example 2.3.14, pp. 46–47; corrected calculation from Proposition 2.3.9 and finite Arf base change. For R=Z[ζ3], the symmetric groups in degrees 0,1,2,3 mod 4 are [Z/4,Z/2,0,0]. The quadratic groups are [0,0,Z/2,Z/4]. These correct the quadratic degree-zero and degree-three entries in Example 2.3.14. In particular A(R)=Z/4, even though there is only one dyadic prime.

Acceptance: Establish the stated maps and identifications, not only an abstract cardinality. Check every characteristic, finiteness and coefficient convention in this statement. The corrected diagram must give Wq(R)=0 and A(R)=Z/4; coker θ=Z/4⊕Z/2 is an intermediate group only.


Layer status: planned. Remaining: G1: shared Poincaré foundations and field/shift identification. Inherited dependencies G2–G4 through the arithmetic tables. G5/R4: register the quadratic-extension transfer exactness extension; E1–E3 are independently confirmed against arXiv v4.


## Table checks and the Eisenstein correction

| Ring and theory | n=0 mod 4 | n=1 mod 4 | n=2 mod 4 | n=3 mod 4 |
| --- | --- | --- | --- | --- |
| Dedekind R, char K≠2, symmetric | Ws(R) | ⊕_(p|2) Ws(kp) | 0 | coker ∂0 |
| Global K, char K≠2, symmetric | Ws(R) | (Z/2)^d | 0 | Pic(R)/2 |
| Dedekind R, char K≠2, quadratic | Wq(R) | 0 | ⊕_(p|2) Wq(kp) | extension of Ls_3(R) by A(R) |
| Z, symmetric | Z | Z/2 | 0 | 0 |
| Z, quadratic | Z | 0 | Z/2 | 0 |
| Z[ζ3], symmetric | Z/4 | Z/2 | 0 | 0 |
| Z[ζ3], quadratic, corrected | 0 | 0 | Z/2 | Z/4 |

In characteristic 2 with global fraction field the symmetric groups alternate Ws(R), Pic(R)/2, with period two. No global characteristic-two quadratic table is asserted here. If 2 is already a unit, the dyadic product and A are zero and the two flavor tables coincide. Two dyadic primes force a nonzero parity quotient of A; one prime supplies no such test, and the Eisenstein ring has A=Z/4.

The symmetric completion diagram has the same rank-parity map Z/2→Z/2 on F2 and F4. The quadratic completion diagram has the zero map, because absolute Arf trace scales by extension degree. Conflating these two arrows is the additional source error. One can test the issue before using any L-spectrum: over F2 all nonzero values of x²+xy+y² are 1; over F4 the vector (ζ,1) is a nonzero zero.

There is also a concrete transfer check for the corrected quotient. Set s=√−3 and choose the Q2-linear functional λ with λ(1)=0, λ(s)=1. For q=x²+xy+ζy² with ζ=(−1+s)/2, its polar matrix is [[2,1],[1,2ζ]]. On the basis (1,s) in each coordinate, transfer gives the symmetric matrix

| | | | |
| --- | --- | --- | --- |
| 0 | 2 | 0 | 1 |
| 2 | 0 | 1 | 0 |
| 0 | 1 | 1 | −1 |
| 1 | 0 | −1 | −3 |

Its determinant is 21, hence its signed determinant square class is −3 in Q2. An explicit diagonalization is ⟨1,−1,4,−21/4⟩. Removing the hyperbolic pair and scaling squares gives ⟨1,−21⟩=c, since −7 is a Q2 square. Therefore A(R)=ann(c)/⟨c⟩=Z/4. This supplies the coordinate check that the intermediate symmetric cokernel Z/4⊕Z/2 is not already A(R).


## Supplier contracts


- **R1**, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization`: Expose the Ls version of the existing GW localization/dévissage theorem, with the canonical coefficient line, all integer shifts, and finite-support boundary. The packet node presently states only GW. Depend on the missing HermitianKTheoryOfPoincareCategories foundation when its registered stages exist; do not identify it with classical exact-category GW.

- **R2**, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`: Import the existing genuine field Witt ring, Witt class, addition/tensor, signed determinant and base change. Current Tau Ceti already implements them; this is an import contract, not a request to rebuild the field carrier.

- **R3**, `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-8-global-classification-and-witt-consequences`: Part II extension: the number-field Dedekind Witt residue cokernel is Pic(R)/2, with coefficient lines and finite support. Layer 8 currently gives classification and local-global injection, and explicitly does not promise this residue exactness. The global-function-field version remains G2 with no fabricated upstream stage.

- **R4**, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-9-transfer-and-the-relative-stiefel-whitney-formula`: Part II extension: for a quadratic field extension F(√a)/F, exactness of restriction, Scharlau transfer for a functional s with s(1)=0, and multiplication by ⟨1,−a⟩. In particular ker res is its principal ideal and coker res identifies with its annihilator. The existing layer gives transfer/Frobenius reciprocity, not this exact sequence.

- **R5**, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field`: Import complete finite-extension-of-Q2 classification, the normalized Q2 Hilbert formula and square-class tests. Use it to derive the specific 32-class presentation here; do not duplicate field classification.

- **R6**, `ArithmeticKTheory:N.1`: Import N.1’s S-integer localization and finite-extension projective-module comparisons and the finiteness of localized number-field Picard groups via its existing class-group sources. Generic Dedekind K0≃Z⊕Pic and K0(R)→K0(K) surjectivity are supplied by N.2/the-three-classical-rows (importing KTheoryLowDegrees Z.4), not proved by N.1. Prime and completion carriers are library inputs to the CRT/cofinality construction in DA.2.

- **R7**, `ArithmeticKTheory:N.2/the-three-classical-rows`: Import the existing divisor/principal-divisor/Picard exact sequence for any Dedekind domain, including characteristic 2. Reduce its divisor group and class map modulo 2 to obtain the parity cokernel Pic(R)/2. This is an existing general-Dedekind contract, not a new number-field or function-field extension; it supplies no global Witt residue kernel exactness (G2).

- **R8**, `GeneralAlgebraicKTheory:K.6`: Import GeneralAlgebraicKTheory:K.6/frobenius-spectrum-localization and K.6/dense-triangulated-class-criterion: exact Frobenius models give nonconnective localization, and dense full triangulated subcategories are detected by the image on K0. The comparison to the perfect-complex completion square and the Poincaré criterion remain G1.

- **R9**, `StableHomotopyKTheory:H.5:spectra`: Import integer-indexed true homotopy groups, the stable homotopy category with suspension an autoequivalence, and its distinguished-triangle long exact sequences. Compute spectral pullbacks by stable fibres of the difference map. Use the true groups (or a justified semistable model), not naive homotopy groups of an arbitrary symmetric spectrum. The Poincaré L construction remains G1.

- **R10**, `tauceti:Completed/IntegralLattices#layer-5-rank-one-and-ade-discriminant-forms`: Import the existing E8 lattice and its unimodular/even Gram model; current IntegralLattices additionally owns signature divisibility. The new arithmetic check here is the quadratic refinement’s Arf invariant modulo 2.


## Explicit closure gaps


### G1. Unregistered Poincaré-category supplier

HermitianKTheoryOfPoincareCategories is routed by the Calmes extraction but has no registered roadmap/stage or target packet in this checkout. Needed: Dp with coefficient duality; Qq,Qs,Q^(≥m) and sign shifts; genuine versus periodic comparisons; L spectrum and field surgery/Witt identification; Poincaré–Verdier criterion [II] 4.5.5 and localizing invariance; derived localization/completion of perfect complexes, K0-controlled subcategories and rational Tate-vanishing. Existing GN.6 exact-category GW and StableHomotopyKTheory spectra do not supply these. DA.0 comparison, DA.1 field tables and DA.2 fracture are conditional on this exact inventory. Register/plan the one shared owner; do not create parallel foundations here.


### G2. Global Witt residue exactness proof

DA.1/global-residue-cokernel needs full kernel exactness, not only a map onto Pic(R)/2. Calmes Corollary 2.3.2 cites Milnor–Husemoller (1973), Chapter IV §4 and Scharlau (1985), Chapter 6 §6 Theorem 6.11. Neither book is cleared in the library index. No other copy was used. The public paper’s statement and proof reduction were read; the referenced proofs were not verified. R3 requests a number-field extension of GlobalQuadraticForms layer 8. Its stated scope excludes global function fields; a separate registered supplier contract must cover those. The characteristic-two divisor argument is written explicitly and does not silently import a char≠2 field theorem.


### G3. Degree-one quadratic rigidity relations

The public Wall (1970) Lemma 1 and Theorem 2 and their proofs were read, and justify quadratic isometry lifting. Equivalence of Lq spectra additionally needs the L1 relation/kernel comparison in Wall (1973), On the classification of hermitian forms III, Inventiones 19, 59–71, Corollary 1, Lemma 1 and Proposition 4, as cited by Calmes Proposition 2.3.7. That complete text was not obtained. Verify those precise relation and free/projective comparisons; surjectivity on isometries or GW1 alone is insufficient.


### G4. Henselian approximation input

CMM arXiv:1803.10897v2 Remark 5.6 p. 39 was read and the reduction to finitely presented henselizations, Popescu ind-smoothness and Elkik splitting was checked at the argument level. The full Popescu theorem and Elkik Theorem 3.15 were not read or found in a matching supplier node. Record this general approximation contract once under the henselian/commutative algebra owner before closing DA.2. It is separate from the prime-to-p K-theory rigidity in KTheoryFiniteLocalFields L.2.


### G5. Unregistered quadratic-extension Witt exactness

R4 requires the quadratic-extension Witt exact sequence (Lam, Introduction to Quadratic Forms over Fields, VII Theorem 3.5, cited in Calmes Example 2.3.14 p. 47). QFI layer 9 supplies Scharlau transfer and Frobenius reciprocity but does not state exactness of restriction, transfer and multiplication by ⟨1,−a⟩. Lam is not cleared and its proof was not read. Register this precise Part II extension under the existing field-form owner before closing DA.5; it is not an already exported result of layer 9. The independent finite Q2 calculations verify the local arithmetic conditional on this standard exactness contract, rather than verifying the unread general theorem.

## Source findings

The field named `printed` in the machine-readable packet contains a paraphrase, never a source excerpt. Independent review REV-DESIGN-GeometryOfNumbersAndQuadraticArithmeticPartII confirmed E1–E3 on 2026-10-19 against arXiv v4. The restricted Annals text was not compared; these findings do not assert what the journal version prints.


### E1 (misprint)

arXiv:2009.07225v4, Example 2.3.14, p. 47, annihilator generators. The annihilator calculation places the binary class with coefficients 1 and −2 among its generators.

Correction: Use ⟨1,−3⟩ instead, together with 2⟨1⟩; equivalently use c=⟨1,3⟩ and 2⟨1⟩.

Check: Tensoring the printed binary form with c gives the anisotropic norm-difference form ⟨1,3,−2,−6⟩ over Q2. Tensoring the corrected form gives hyperbolic pairs ⟨1,−1⟩ and ⟨3,−3⟩ after square scaling. The abstract annihilator is still Z/4⊕Z/2.

Reach: the proof. Independently confirmed by REV-DESIGN-GeometryOfNumbersAndQuadraticArithmeticPartII on 2026-10-19 against arXiv:2009.07225v4. No dedicated correction was found in the recorded searches; the restricted Annals journal PDF was not compared.

Independent verdict: **confirmed**. Discriminant −3 proves unramifiedness but does not exclude splitting. Reduction of t²+t+1 modulo 2 is irreducible and proves the intended inertness; t²+t+2 for Q(√−7) gives the stated unramified split counterexample.

Independent verdict: **confirmed**. The printed generator ⟨1,−2⟩ tensors with c to ⟨1,3,−2,−6⟩, the anisotropic norm-difference form for the unramified quadratic extension. Independent Q2 Hilbert-symbol enumeration gives cv=4u≠0 and ann(c)=⟨2u,c⟩. The corrected ⟨1,−3⟩ tensors to two hyperbolic planes.


### E2 (gap)

arXiv:2009.07225v4, Example 2.3.14, p. 46, dyadic prime assertion. The discussion infers primality of (2) from the absence of 2 in the field discriminant.

Correction: Prove inertness separately by irreducibility of t²+t+1 over F2. The discriminant only proves that 2 is unramified.

Check: An unramified prime can split. For example, 2 is unramified but split in Q(√−7), where the integral-basis polynomial t²+t+2 reduces to t(t+1).

Reach: the proof. Independently confirmed by REV-DESIGN-GeometryOfNumbersAndQuadraticArithmeticPartII on 2026-10-19 against arXiv:2009.07225v4. No dedicated correction was found in the recorded searches; the restricted Annals journal PDF was not compared.

Independent verdict: **confirmed**. Discriminant −3 proves unramifiedness but does not exclude splitting. Reduction of t²+t+1 modulo 2 is irreducible and proves the intended inertness; t²+t+2 for Q(√−7) gives the stated unramified split counterexample.

Independent verdict: **confirmed**. The printed generator ⟨1,−2⟩ tensors with c to ⟨1,3,−2,−6⟩, the anisotropic norm-difference form for the unramified quadratic extension. Independent Q2 Hilbert-symbol enumeration gives cv=4u≠0 and ann(c)=⟨2u,c⟩. The corrected ⟨1,−3⟩ tensors to two hyperbolic planes.


### E3 (error)

arXiv:2009.07225v4, Example 2.3.14, diagram p. 46 and quadratic table p. 47. The vertical completion map on the quadratic Z/2 factor is treated as the identity, and the resulting quadratic groups have Z/2 in degree 0 and Z/4⊕Z/2 in degree 3.

Correction: The quadratic factor map is zero, since the residue extension F2→F4 has even degree. The corrected quadratic groups in residues 0,1,2,3 are 0,0,Z/2,Z/4. The symmetric table and the intermediate symmetric restriction cokernel Z/4⊕Z/2 remain unchanged.

Check: The Arf-one plane x²+xy+y² becomes isotropic over F4, so the claimed identity cannot commute with reduction and rigidity. Over the Eisenstein completion the new Arf-one polar class t has signed determinant d=1−4ζ with Norm(d)=21 nonsquare in Q2, while the nonzero order-two class 2u in the global Z/4 has determinant −1 with square norm. Hence the global symmetric and local quadratic images intersect trivially, proving Wq(R)=0. Under the transfer description coker θ≃ann(c), the polar transfer diagonalizes as ⟨1,−1,4,−21/4⟩, whose Witt class is c. Thus A(R)=ann(c)/⟨c⟩=Z/4. See the final two target proof sketches for the maps and determinant normalization.

Reach: a stated result. Independently confirmed by REV-DESIGN-GeometryOfNumbersAndQuadraticArithmeticPartII on 2026-10-19 against arXiv:2009.07225v4. No dedicated correction was found in the recorded searches; the restricted Annals journal PDF was not compared.

Independent verdict: **confirmed**. Over F4, the vector (ζ,1) is a nonzero zero of x²+xy+y²; absolute trace sends 1 to 0, so quadratic base change is zero. The new Arf-one plane with last coefficient ζ has polar signed determinant of norm 21, separating it from global 2u. Independent exact transfer elimination yields ⟨1,−1,4,−21/4⟩ with class c; quotienting ann(c) by this local image gives Z/4 and the pullback kernel gives Wq(R)=0. This confirms the corrected [0,0,Z/2,Z/4] table against arXiv v4 only; it makes no claim about the unexamined journal text.


## Routing completeness

All sixteen selected Calmes items have a target, including the corrected example.

| Routed item | Target |
| --- | --- |

| PAPER-CALMES-ETAL-26/330 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/symmetric-dedekind |

| PAPER-CALMES-ETAL-26/331 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/global-symmetric |

| PAPER-CALMES-ETAL-26/332 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/characteristic-two |

| PAPER-CALMES-ETAL-26/333 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2/arithmetic-fracture |

| PAPER-CALMES-ETAL-26/334 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2/complete-rigidity |

| PAPER-CALMES-ETAL-26/335 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/quadratic-dedekind |

| PAPER-CALMES-ETAL-26/336 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/number-field-quadratic |

| PAPER-CALMES-ETAL-26/337 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.4/integer-table |

| PAPER-CALMES-ETAL-26/338 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.5/eisenstein-table |

| PAPER-CALMES-ETAL-26/343 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/sign-shifts |

| PAPER-CALMES-ETAL-26/344 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/local-symmetric |

| PAPER-CALMES-ETAL-26/345 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.2/henselian-rigidity |

| PAPER-CALMES-ETAL-26/346 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/sign-shifts |

| PAPER-CALMES-ETAL-26/347 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/parity-obstruction |

| PAPER-CALMES-ETAL-26/348 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/away-dyadic-devissage |

| PAPER-CALMES-ETAL-26/349 | GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/integral-injectivity |


## Independent split proposals

The packet contains the exact complete item lists and a partition among the proposed stages. The proposals preserve source-extraction briefs; they do not certify those papers’ proofs as read or decomposed here.


### FunctionFieldLatticesAndShrinking

Parent: GeometryOfNumbersAndQuadraticArithmetic. Area: functionfields. Preserved routed items: 7.


Polynomial lattices in Fq((T⁻¹)) with strict-ball counts and exact shrinking. Independent of dyadic L-theory and toral joinings.


- **FL.0 Polynomial lattices**: Use Mathlib LaurentSeries and the valuation at infinity. Define M Fq[T]^N for M invertible, sup norm and inverse-transpose adjoint; polynomial integer parts and strict balls must be explicit. Items: PAPER-BROWNING-SAWIN-20/infinitynorm, PAPER-BROWNING-SAWIN-20/lattice.

- **FL.1 Reduced minima**: Orthogonal reduced basis, discrete successive minima and exact strict-ball cardinality, including boundary radii. Items: PAPER-BROWNING-SAWIN-20/minimacount.

- **FL.2 Adjoint minima**: Minima duality via the corrected nonarchimedean orthogonalization input; do not import Euclidean covolume duality. Items: PAPER-BROWNING-SAWIN-20/minimadual.

- **FL.3 Block lattices**: Encode the symmetric linear inequalities and prove R_i R_(2n+1−i)=q^(c−a) for the special block lattice. Items: PAPER-BROWNING-SAWIN-20/Nlinear, PAPER-BROWNING-SAWIN-20/specialminima.

- **FL.4 Shrinking**: Browning–Sawin Lemma 6.4: N_(γ,a,c)≤q^(ns+n max(floor((a−c)/2),0)) N_(γ,a−s,c+s), for symmetric γ and integral a,c,s with c>0,s≥0. Include a≤0 and arbitrary finite q without q-dependent constants. Items: PAPER-BROWNING-SAWIN-20/shrink.


Supplier boundary:

- Native LaurentSeries and valuation/linear-algebra APIs; parent lattice vocabulary only where the carrier matches.
- Browning–Vishe (2017) §4, cited Lee thesis inputs and the nonarchimedean orthogonalization correction must be read by that design worker.


Acceptance cases: γ=0, n=1, s=0, odd a−c, strict boundary radius, arbitrary finite extension of the constant field.


Exports: ExponentialSumsAndCircleMethod:ES.0; do not import the mapping-space application back.


### GeometryOfNumbersPartIIToralJoinings

Parent: GeometryOfNumbersAndQuadraticArithmetic. Area: classical. Preserved routed items: 83.


For a form G of PGL2/Q, maximal Q-anisotropic tori T_i, toral joining sets [T_i^Δ(A)(g_i,s_i g_i)], two fixed split primes, fixed archimedean torus, bounded conductors, no exceptional Landau–Siegel zeros, |D_i|→∞ and g_i⁻¹T_i(Q)s_i g_i avoiding each fixed compact eventually, every weak-* limit is invariant under (G×G)(A)^+. The conclusion is a mixture of Haar measures on residual-component fibers, not necessarily Haar on the whole product. Identify the permitted mixture using Proposition 3.6.

Prove (2−θ_l⁻¹)/3 < 1/(2+2/(1−θ)). At θ_l=2/3 and θ=1/2 both endpoints equal 1/6, so there is no strict overlap. Use an admissible θ_l in (131/208,2/3) with θ=1/2, or improved θ<1/2 with a compatible θ_l. Name exactly where absence of an exceptional zero compares the ideal-counting sum to the class number via L(1,χ).


- **TJ.0 Toral packets**: Toral sets and discriminants, self-joinings, residual quotient and component measures; import adelic arithmetic and quadratic-order foundations. Items: PAPER-KHAYUTIN-19/7, PAPER-KHAYUTIN-19/9, PAPER-KHAYUTIN-19/16, PAPER-KHAYUTIN-19/22, PAPER-KHAYUTIN-19/112, PAPER-KHAYUTIN-19/113, PAPER-KHAYUTIN-19/115, PAPER-KHAYUTIN-19/116.

- **TJ.1 Joining rigidity**: Fixed local normalization, S-arithmetic joining classification and the Haar/Hecke dichotomy. Import Duke/Linnik and the Einsiedler–Lindenstrauss theorem with their exact hypotheses. Items: PAPER-KHAYUTIN-19/20, PAPER-KHAYUTIN-19/25, PAPER-KHAYUTIN-19/26, PAPER-KHAYUTIN-19/27, PAPER-KHAYUTIN-19/125, PAPER-KHAYUTIN-19/28, PAPER-KHAYUTIN-19/29, PAPER-KHAYUTIN-19/30, PAPER-KHAYUTIN-19/31, PAPER-KHAYUTIN-19/32.

- **TJ.2 Quaternionic invariants**: Local and archimedean quaternion coordinates, different/maximal orders, good representatives, Bowen balls, GIT double quotient, invariant rings and descent. Items: PAPER-KHAYUTIN-19/33, PAPER-KHAYUTIN-19/34, PAPER-KHAYUTIN-19/35, PAPER-KHAYUTIN-19/38, PAPER-KHAYUTIN-19/39, PAPER-KHAYUTIN-19/40, PAPER-KHAYUTIN-19/41, PAPER-KHAYUTIN-19/42, PAPER-KHAYUTIN-19/43, PAPER-KHAYUTIN-19/44, PAPER-KHAYUTIN-19/45, PAPER-KHAYUTIN-19/46, PAPER-KHAYUTIN-19/47, PAPER-KHAYUTIN-19/48, PAPER-KHAYUTIN-19/49, PAPER-KHAYUTIN-19/50, PAPER-KHAYUTIN-19/92, PAPER-KHAYUTIN-19/117.

- **TJ.3 Hecke correlations**: Hecke volume and denominator/minimal-ideal-norm equivalence; pair correlation, orbital integral expansion, local estimates and arithmetic invariant fibers. Items: PAPER-KHAYUTIN-19/51, PAPER-KHAYUTIN-19/52, PAPER-KHAYUTIN-19/53, PAPER-KHAYUTIN-19/54, PAPER-KHAYUTIN-19/55, PAPER-KHAYUTIN-19/56, PAPER-KHAYUTIN-19/57, PAPER-KHAYUTIN-19/58, PAPER-KHAYUTIN-19/59, PAPER-KHAYUTIN-19/60, PAPER-KHAYUTIN-19/61, PAPER-KHAYUTIN-19/62, PAPER-KHAYUTIN-19/63, PAPER-KHAYUTIN-19/64, PAPER-KHAYUTIN-19/65, PAPER-KHAYUTIN-19/66, PAPER-KHAYUTIN-19/67, PAPER-KHAYUTIN-19/68, PAPER-KHAYUTIN-19/69, PAPER-KHAYUTIN-19/70, PAPER-KHAYUTIN-19/71, PAPER-KHAYUTIN-19/72, PAPER-KHAYUTIN-19/73, PAPER-KHAYUTIN-19/74, PAPER-KHAYUTIN-19/93, PAPER-KHAYUTIN-19/118.

- **TJ.4 Arithmetic savings**: Shifted convolution, eccentric ellipse, sieve, density and analytic estimates; prove both large- and small-ideal-norm ranges and strict overlap. Items: PAPER-KHAYUTIN-19/88, PAPER-KHAYUTIN-19/89, PAPER-KHAYUTIN-19/90, PAPER-KHAYUTIN-19/91, PAPER-KHAYUTIN-19/94, PAPER-KHAYUTIN-19/96, PAPER-KHAYUTIN-19/97, PAPER-KHAYUTIN-19/98, PAPER-KHAYUTIN-19/99, PAPER-KHAYUTIN-19/100, PAPER-KHAYUTIN-19/121, PAPER-KHAYUTIN-19/123, PAPER-KHAYUTIN-19/124.

- **TJ.5 Joint equidistribution**: Assemble Theorems 1.3,1.4,3.2,3.9,3.10 in the published numbering, with n-fold and Shimura reciprocity applications. Items: PAPER-KHAYUTIN-19/1, PAPER-KHAYUTIN-19/2, PAPER-KHAYUTIN-19/3, PAPER-KHAYUTIN-19/4, PAPER-KHAYUTIN-19/18, PAPER-KHAYUTIN-19/19, PAPER-KHAYUTIN-19/23, PAPER-KHAYUTIN-19/24.


Supplier boundary:

- GeometryOfNumbersAndQuadraticArithmetic:GN.2, GN.3 and GN.4: quadratic forms, lattice counting, equidistribution/mixing.
- AdelicAlgebraicGroups:AA.1, AA.3, AA.4: adelic quotients, volume and approximation.
- HeegnerPointEulerSystems:HE.0 and HE.1: quadratic orders, ideals, conductors, class fields and CM points.
- Existing GlobalNumberFields layer 11 and QuadraticFormInvariants layer 2 own Picard/order and quaternion foundations.
- SieveMethodsAndPrimePatterns:SV.0–SV.2; AnalyticNumberTheory:AN.1,AN.3,AN.5; ShimuraVarieties:V4; HilbertModularVarietiesAndShimuraCurves:R18.1.
- External joining classification, Duke/Linnik, Ellenberg–Michel–Venkatesh and Einsiedler–Lindenstrauss–Michel–Venkatesh are imports whose full hypotheses must be read and recorded by that worker.


## Suggested Lean inventory

The suggested file states selected milestones and native examples over existing carriers. It defines only a light binary quadratic polynomial, a light quotient expression and a diagonal additive homomorphism. Native quotient examples additionally check a surjective global image and surjectivity of the additive quotient projection. It states the F2 anisotropy/F4 isotropy distinction, the Q2 anisotropic counterexample and corrected hyperbolic tensor, the quotient/parity milestone, and elementary norm/discriminant arithmetic needed in the last example. The file follows the 2026-10-12 state-without-development rule; it has no placeholder data definitions.

The following remain README targets because their carriers are absent at the pins: ring-valued symmetric and quadratic Witt quotients with these Poincaré comparisons; stable Poincaré categories, their flavor functors, periodic L spectra and K0-controlled Verdier subcategories; the global L residue maps, arithmetic fracture square and its derived completions; complete/henselian L equivalences; the actual arithmetic correction A and its group identifications. The current-only field Witt/local-classification declarations are existing upstream imports, not dependencies compiled into a file against the older pin. The native quotient model in the file is the exact algebraic expression for the two-image quotient; it does not claim to instantiate missing Witt carriers. No local class, L-group, matrix or residue table is replaced by a predicate that merely asserts its desired answer.

## Sources read


- **CDHHLMNNS-III-v4**: Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus and Wolfgang Steimle. *Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings*. arXiv:2009.07225v4, 27 April 2026; locators use the 63-page preprint, not Annals pagination. [Public version](https://arxiv.org/pdf/2009.07225v4). Read 2026-10-19: §2.2, Lemma 2.2.2, Theorem 2.2.4, Corollary 2.2.5 and Lemma 2.2.9, pp. 36–41; §2.3, pp. 41–48, including proofs and Examples 2.3.13–14; §3.2 introduction, pp. 54–55. SHA256: 1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c.

- **Wall-1970**: C. T. C. Wall. *On the classification of hermitian forms. I. Rings of algebraic integers*. Compositio Mathematica 22 (1970), 425–451. [Public version](https://www.numdam.org/article/CM_1970__22_4_425_0.pdf). Read 2026-10-19: Lemma 1, p. 427; Theorem 2 and its proof, pp. 428–429. SHA256: fbca6504af22e92262722d21d68729616353df4da3a5cecf83044f271ab3f5c5.

- **CMM**: Dustin Clausen, Akhil Mathew and Matthew Morrow. *K-theory and topological cyclic homology of henselian pairs*. arXiv:1803.10897v2, 20 July 2020, Remark 5.6, p. 39. [Public version](https://arxiv.org/pdf/1803.10897v2). Read 2026-10-19: Remark 5.6 and the preceding completion discussion, p. 39. SHA256: ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c.

## Reproducing the finite arithmetic audit

For Q2 write a=2^αu and b=2^βv with odd units u,v. Use the imported formula (a,b)_2=(−1)^e, with e=((u−1)/2)((v−1)/2)+α(v²−1)/8+β(u²−1)/8 modulo 2. Thus unit residues modulo 8 and valuation parity suffice. Enumerate a*u+b*v+e*c for 0≤a<8 and b,e∈{0,1}, where u,v,c now denote the three Witt generators in DA.4. Stabilize each pair of forms to the same dimension by ⟨1,−1⟩ planes; compare plain determinant square class and the product of pairwise Hilbert symbols. This checks distinctness, orders, all three products with c and the annihilator. Exact rational symmetric elimination diagonalizes the displayed transfer matrix as ⟨1,−1,4,−21/4⟩. For the finite-field check use F2[z]/(z²+z+1) and substitute (z,1) into the binary plane. These finite calculations were independently re-executed in review and matched every displayed value; they do not replace the imported classification theorem or formal proofs.

Independent review also counted 136 zeros in the E8 quadratic refinement modulo 2 (256 vectors), confirming Arf 0. The pinned quotient declarations are AddMonoidHom.range and QuotientAddGroup.mk'; the baseline records their indexed multiplicative source generators and the to_additive names separately. The suggested file explicitly elaborates both additive declarations.
