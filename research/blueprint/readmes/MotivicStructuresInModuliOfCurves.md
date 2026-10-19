# Tautological rings and motivic structures in curve moduli

**Summary.** This roadmap develops the cohomology of the moduli stacks of stable curves through tautological operations, semi-tautological extensions and geometric control of the pure cohomology of their smooth open parts. The principal endpoints are finite generation in each degree; odd vanishing through degree nine; tautological degree-four cohomology, stable degree-six cohomology and even homology through fourteen; cusp generation of degree-thirteen and degree-fifteen homology; and the realization classification in cohomological degrees thirteen, fourteen and fifteen. The genus-four point-count calculation and the genus-seven Chow–Künneth argument supply different finite bases for these endpoints.

The plan has thirteen layers and covers the 86 items routed here from Canning–Larson–Payne (CLP) and the 48 from Bergström–Faber–Payne (BFP). Every target is planned. No layer is certified closed: the exact supplier extensions, primary-source proofs, corrected Mukai gates and finite calculation certificates are listed below. In particular, a printed theorem is a target to establish, rather than evidence that its formal dependency chain is already closed. Implementation status is unchecked throughout.

## Conventions and imported geometry

Let g,n be natural numbers with 2g−2+n>0 and d=3g−3+n. Import the stacks and stable-graph geometry from `StableReductionPartII:key/moduli-curves` and its operation contract `StableReductionPartII:MC.7/consumer-clp`. Write Mbar_g,n for the smooth proper Deligne–Mumford stack over Z of stable pointed curves and M_g,n for its smooth-curve open. The latter is generally not proper. Graph vertex factors in normalized closed boundary strata are compact Mbar stacks; factors in the ordinary open-stratum Euler decomposition are smooth M stacks. The universal curve, finite clutching maps, stabilization, relabelling, marking cotangent lines and rank-g Hodge bundle are imports, not new definitions of this roadmap.

Use rational Betti cohomology with its geometric mixed Hodge structure over C and Q_l etale cohomology with its continuous Galois action in arithmetic statements. Algebraic-cycle constructions in the genus-seven argument are over characteristic zero; the BFP count endpoints explicitly range over every finite field, including characteristic two. The stack comparison obligations below connect these settings and are never inferred simply from smoothness. Write W_k H^k for the pure lowest-weight part of ordinary cohomology, and Gr_k^W H_c^k for the corresponding compact-support graded part; these are different objects connected by the exact functorial statements.

The convention L=Q(−1)=H2(P1) gives geometric Frobenius eigenvalue q. Cycle classes of codimension c lie in degree 2c with type (c,c), and become weight-zero realization morphisms after twist (c). Ordinary H_k of a smooth proper d-dimensional stack is H^(2d−k)(d); Borel–Moore H_k of an open smooth stack is H^(2d−k)(d), while its dual is H_c^k. When speaking of an STE containing H_k, use its untwisted complementary cohomological subspace S^(2d−k); do not redefine the STE as a homology ring. Superscript ss means semisimplification, and no statement about a virtual Euler class splits a Galois extension.

Two tests pin the geometry. M_0,4 is P1 minus three points whereas Mbar_0,4 is P1. The cross-ratio family over C((t)) acquires a stable nodal fibre at t=0 but no smooth extension there. Likewise a finite-field moduli count is groupoid mass, summing 1/|Aut| over rational isomorphism classes. It is not the number of those classes. For connected quotient groups, division by the rational group order uses the torsor/trace comparison; disconnected quadric stabilizers require the explicit orbit-stabilizer formula.

## Ownership and build order

Start with TC.0–TC.3 for the curve-specific ring operations, dimension bounds, genus-one inputs, symplectic local systems and the marking quotient. The genus-two even calculation is placed after that quotient in TC.3. TC.4 isolates Chow–Künneth generation; TC.5 and TC.6 provide its genus-seven geometry, with central-lift and descent gates before the marked spinor model is used. Independently, TC.7–TC.9 compute the genus-four count input and odd vanishing. TC.10 then treats even classes, TC.11 supplies the exceptional cusp graphs and genus-two Galois classification, and TC.12 proves the final realizations.

Existing abstract Hodge structures, finite locally free algebra, half-spin representations and fixed-degree symmetric functions are imported from the current Tau Ceti roadmaps and library. The current AlgebraicVectorBundles roadmap does not own projective/Grassmann bundles: the exact quotient-convention `AlgebraicModuliForArithmeticGeometry:R09.1/coherent-grassmannian` and smoothness nodes are used instead. Current SchurWeyl Layers 7 and 9 supply fixed-degree characteristics and harmonic tensors; completed symmetric functions belong to the routed Part II extension. Generic stack duality belongs to the routed stacks Part II. The SF.5 scheme exterior product, MC.2 projective-scheme realization and DWP.9 scheme hard Lefschetz statements do not silently gain DM-stack generality here.

The source texts are CLP, *Forum of Mathematics, Pi* 12 (2024), e23, pp.1–31, and BFP, *Annals of Mathematics* 199 (2024), pp.1323–1365. Both were read as published author copies, including the sieve tables and graph figures. Getzler–Kapranov §8 was read in its published form. Gorsky’s v3 preprint was read, and its genus-four degree-three expansion was independently reproduced with the corrected formula. Its published text remains uncollated. Kannan’s later Remark3.8 was read for the prior typo corrections. Exact URLs, hashes, dates and read ranges appear in the packet and in the bibliography below.

## TC.0. Tautological operations and cusp realizations

This layer adds the operations and realization conventions specific to curve cohomology to the imported moduli stacks. The test of every pushforward is its codimension and Tate shift.

Atlas planets: Tautological rings; Stable-pair induction; Boundary exact sequences; Cusp motives on moduli.

<a id="TC0-tautological-rings"></a>

### Tautological Chow and cohomology rings

For all stable pairs take the least system of unital graded rational Chow subalgebras R*(Mbar_g, n) closed under proper forgetting and clutching pushforward and the corresponding defined pullbacks and relabellings. The usual equivalent decorated-stable-graph description uses marking psi classes, vertex kappa classes and gluing. Put R*(M_g, n)=image of restriction and RH*=image under the cycle map. Cohomological degree is twice Chow codimension.

The target is `TC.0/tautological-rings`. Intersect all such systems; the full Chow system supplies existence. Use the graph calculus, projection and excess formulas to compare the closure and graph descriptions; the stack cycle realization is an explicit supplier obligation.

Builds on `StableReductionPartII:key/moduli-curves`, `StableReductionPartII:MC.7/consumer-clp`, `StableReductionPartII:MC.3/cotangent-line`, `SchemeAndStackFoundations:SF.5/stack-chow`, `SchemeAndStackFoundations:SF.5/dm-gysin-ring`, `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.2`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), Introduction pp.1–3; §2.1 p.4; §5 pp.13–22.

The API serves CLP Theorems1.5 and 1.10 (Defines both the cohomological and Chow conclusions.); CLP Lemma 2.1 (The quotient removes known tautological classes.).

| Declaration | Contract |
| --- | --- |
| `TautologicalRings.least` | Every tautological-operation-stable unital system contains R*. |
| `TautologicalRings.restriction` | Restriction maps the compact tautological system onto the open one by definition. |
| `TautologicalRings.cycle` | Cycle realization sends codimension r into degree 2r and commutes with the stated operations. |
| `TautologicalRings.graph_span` | Decorated stable-graph pushforwards span R*. |
| `TautologicalRings.ext` | Two operation-stable systems with the same graded subalgebras at every stable pair are equal. |

**Checks.**

- Mbar_0,3 has R0=Q and no positive-degree classes.
- On Mbar_0,4≅P1, a boundary point has nonzero degree-one Chow class and degree-two cohomology class.
- An odd-degree nonzero cusp class in H11(Mbar_1,11) cannot belong to RH*.

<a id="TC0-kappa-classes"></a>

### Kappa classes of pointed curves

For a stable forgetful map pi:Mbar_g, n+1→Mbar_g, n define kappa_a=pi_*(psi_(n+1)^(a+1)) for a≥0. Use the imported marking cotangent line and imported Hodge bundle E=f_*omega, retaining their forgetting corrections. Lambda_j means c_j(E); no new Hodge bundle is constructed.

The target is `TC.0/kappa-classes`. Form powers of the imported Chern class and apply rational proper pushforward. GRR and the graph identities give the relations needed here; GRR for a nodal stack family is requested separately from scheme projective GRR.

Builds on [TC.0/tautological-rings](#TC0-tautological-rings), `StableReductionPartII:MC.3/cotangent-line`, `StableReductionPartII:MC.5/hodge-bundle`, `StableReductionPartII:MC.3/forget-cotangent-line`, `SchemeAndStackFoundations:SF.5`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), §2.1 p.4; §§3,5 pp.9–10,21–22.

The API serves CLP §5.1 (Expresses pushforwards from tetragonal bundles in tautological classes.); CLP Lemma 3.1 (Supplies multiplication by psi in the marking filtration.).

| Declaration | Contract |
| --- | --- |
| `KappaClasses.degree` | kappa_a has Chow codimension a. |
| `KappaClasses.forget` | kappa_a on n+1 marks equals pi* kappa_a on n marks plus psi_(n+1)^a. |
| `KappaClasses.zero` | kappa_0=(2g−2+n)·1. |
| `KappaClasses.hodge` | Lambda classes use the determinant and exterior-power API of the imported finite locally free Hodge bundle. |
| `KappaClasses.push_psi` | For every a≥0, pi_*(psi_(n+1)^(a+1))=kappa_a, with Chow degree reduced by one. |

**Checks.**

- kappa_0=1 on Mbar_0,3.
- kappa_0=1 on Mbar_1,1.
- kappa_0 increases by one after adding a marking; it is not the unpointed value2g−2.

<a id="TC0-induction-order"></a>

### The stable-pair induction order

For pairs of natural numbers define (g′, n′)≺(g, n) iff g′≤g, 2g′+n′≤2g+n, and the pairs differ. Restrict to 2g−2+n>0 when using moduli. Use integer d=3g−3+n. The order is well founded by lexicographic descent of (g,2g+n).

The target is `TC.0/induction-order`. If genus stays equal, the second coordinate strictly decreases; otherwise genus strictly decreases. For a stable graph, the genus formula and stability show each vertex pair is smaller than the total whenever the graph has an edge.

Builds on `StableReductionPartII:key/moduli-curves`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), §2.1 p.4; BFP Notation4.1 p.1331.

The API serves CLP Lemma 2.1 (Orders the boundary induction.); BFP Proposition 4.2 (Orders open/closed point-count recovery.).

| Declaration | Contract |
| --- | --- |
| `InductionOrder.irrefl` | No pair precedes itself. |
| `InductionOrder.trans` | The relation is transitive and well founded. |
| `InductionOrder.boundary` | Every vertex of a positive-edge stable graph precedes its total pair. |
| `InductionOrder.forget` | (g, n−1) precedes (g, n) when both are stable and n>0. |

**Checks.**

- (0,4)≺(1,2), although both have2g+n=4.
- (1,2) does not precede(0,4).
- (1,1) does not precede itself; the unstable pair(0,2) is excluded from moduli induction.

<a id="TC0-boundary-exactness"></a>

### Pure-weight boundary exact sequences

For a stable pair with D the normalized boundary, there are exact sequences H^(k−2)(D)(−1)→H^k(Mbar_g, n)→W_k H^k(M_g, n)→0 and H_k(D)→H_k(Mbar_g, n)→W_(−k)H_k^BM(M_g, n)→0. The first arrow is the sum of finite Gysin maps with graph-automorphism invariants; H_k^BM(U)=H^(2d−k)(U)(d).

The target is `TC.0/boundary-exactness`. Apply excision and weight strictness to the imported normal-crossings compactification; normalized one-edge products detect the image. Dualize with stack Poincaré/Verdier duality, keeping the Tate twist. The missing stack duality and cycle-realization contracts are recorded as gaps.

Builds on `StableReductionPartII:MC.7/consumer-clp`, `DeligneWeightsAndPurity:DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`, [TC.0/induction-order](#TC0-induction-order). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), §2.1 p.4; §6.2 equation(6.1) p.23.

**Check.** For Mbar_0,4, boundary Gysin maps Q(−1) onto H2(P1), so omitting(−1) fails weights. Do not replace ordinary H_k by H^(2d−k) without its(d) twist.

<a id="TC0-cusp-moduli-identification"></a>

### Cusp realizations on genus-one moduli

Identify S12=H11(Mbar_1,11) and S16=W15 H15(M_1,15) with the rank-two level-one parabolic realizations of cusp forms of weights12 and 16. L=Q(−1)=H2(P1), geometric Frobenius q. S12 has Hodge types(11,0),(0,11); S16 has(15,0),(0,15). General S_r has rank 2 dim S_r(SL2Z), rather than always rank two.

The target is `TC.0/cusp-moduli-identification`. Use the alternating genus-one configuration summand and Eichler–Shimura/parabolic comparison; identify the cusp spaces already supplied by modular-form theory. In weights12 and 16 their dimensions are one. The new content is the moduli comparison, not the construction of a cusp-form representation.

Builds on `StableReductionPartII:key/moduli-curves`, `mathlib:CuspForm`, `AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), Introduction p.1; Proposition 2.2 pp.5–7; Lemma 8.3 p.29.

**Check.** S14=0, while S12 and S16 each have rational dimension 2. L S12 has pure weight13 and Hodge types(12,1),(1,12), not(11,0).

## TC.1. Dimension bounds and finite odd-degree bases

Boundary induction turns dimension bounds into a finite list of cases. The strict improvement for zero or one marking is essential; using only the unrefined virtual dimension leaves extra bases.

Atlas planets: Harer dimension bounds; Low Borel–Moore vanishing; Odd-degree induction.

<a id="TC1-vcd"></a>

### Virtual cohomological dimension bounds

Ordinary rational H^i(M_g, n) vanishes for i>4g−5 when g≥2, n=0 and for i>4g−4+n when g≥1, n≥1. These are rational bounds obtained from mapping-class-group virtual cohomological dimension, not statements that the stack itself has no stabilizers.

The target is `TC.1/vcd`. Use the Teichmüller presentation and a torsion-free finite-index subgroup with the indicated cohomological dimension; pass to finite invariants over Q.

Builds on `StableReductionPartII:key/moduli-curves`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §2 pp.1327–1328, Harer input.

**Check.** For M_1,1 the bound is1; it does not imply vanishing in degree 1 without the next input.

<a id="TC1-top-vcd-vanishing"></a>

### Vanishing in top virtual dimension

H^(4g−5)(M_g)=0 for g≥2, and H^(4g−3)(M_g,1)=0 for g≥1, with rational coefficients. No analogous blanket claim for n≥2 is included.

The target is `TC.1/top-vcd-vanishing`. Import the mapping-class-group top-degree vanishing theorems, with genus-one positive-degree cohomology checked separately. Their primary proofs remain a precise source-verification gap.

Builds on [TC.1/vcd](#TC1-vcd). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §2 p.1328, Church–Farb–Putman and Morita–Sakasai–Suzuki inputs.

**Check.** The marked result is essential to remove the genus4 one-mark degree 9 base case; the vcd bound alone does not do so.

<a id="TC1-compact-support-vanishing"></a>

### Low compact-support and Borel–Moore vanishing

For g≥1, H_c^k(M_g, n)=0 if k<2g for n=0 or1, and if k<2g−2+n for n≥2. Equivalently H_k^BM(M_g, n)=0 in these ranges. Interpret only stable pairs.

The target is `TC.1/compact-support-vanishing`. Duality converts ordinary cohomological upper bounds to compact-support lower bounds. The two top-vcd vanishings give the strict improvement at n=0,1; homological duality gives the BM statement.

Builds on [TC.1/vcd](#TC1-vcd), [TC.1/top-vcd-vanishing](#TC1-top-vcd-vanishing), [TC.0/boundary-exactness](#TC0-boundary-exactness). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Proposition 2.1 p.1328; CLP §6.2 p.23.

**Check.** At(g, n)=(4,1), H_c^k=0 for k<8, not automatically k=8. At(g, n)=(2,12), the threshold is14, leaving the degree 15 exceptional calculation.

<a id="TC1-normalized-boundary-injection"></a>

### Arbarello–Cornalba boundary injection

If H_c^k(M_g, n)=0, restriction H^k(Mbar_g, n)→H^k(Dnorm) is injective. Dnorm is the disjoint union of normalized one-edge boundary quotient stacks, with rational graph-automorphism invariants.

The target is `TC.1/normalized-boundary-injection`. Excision injects into boundary cohomology; purity and weight strictness identify its lowest-weight image inside normalized components. Alternatively take the first differential of the oriented normal-crossings weight complex. Singular boundary cohomology cannot simply be replaced by its normalization in all weights.

Builds on [TC.0/boundary-exactness](#TC0-boundary-exactness), `DeligneWeightsAndPurity:DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §2, cited AC Lemma 2.6, p.1328.

**Check.** Check the compact-support vanishing hypothesis before using normalized boundary restriction.

<a id="TC1-odd-induction"></a>

### Arbarello–Cornalba odd-degree induction

For an odd k≥1, suppose every odd q≤k vanishes for all stable g≥1 pairs with max(2g,2g−2+n)≤k. Then every odd q≤k vanishes for every stable pair, with genus-zero even cohomology supplied separately. This is a sufficient finite base region.

The target is `TC.1/odd-induction`. Induct on odd degree and the stable-pair order. Outside the finite base region the compact-support bound forces an injection into boundary products; Künneth gives an odd factor of smaller degree or pair.

Builds on [TC.1/compact-support-vanishing](#TC1-compact-support-vanishing), [TC.1/normalized-boundary-injection](#TC1-normalized-boundary-injection), [TC.0/induction-order](#TC0-induction-order), [TC.1/genus-zero-cohomology](#TC1-genus-zero-cohomology). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §2, cited AC Lemma 2.9, p.1328.

**Check.** For k=9 the unresolved bases after lower genus are genus4, n≤3; no infinite marking verification is needed.

<a id="TC1-genus-zero-cohomology"></a>

### Keel presentation in genus zero

For n≥3, rational cycle class CH*(Mbar_0, n)→H^(2*)(Mbar_0, n) is an isomorphism, generated by boundary divisors with the symmetry, four-label cross-ratio and incompatible-boundary product relations; H^odd=0.

The target is `TC.1/genus-zero-cohomology`. Use Keel’s iterated boundary blow-up construction and its Chow presentation; the blow-up cohomology formula supplies algebraicity and odd vanishing.

Builds on [TC.0/tautological-rings](#TC0-tautological-rings). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §2 p.1328 (Keel); CLP §6.2 p.23.

**Check.** Mbar_0,3 is a point; Mbar_0,4 has three equal boundary-point classes.

<a id="TC1-odd-135"></a>

### Vanishing in degrees one, three and five

H^k(Mbar_g, n)=0 for k∈{1,3,5} and all stable pairs.

The target is `TC.1/odd-135`. Supply the small-genus base calculations of Arbarello–Cornalba and apply boundary induction. Their primary finite base calculations are included in the source-input gap, not assumed to follow just from vcd.

Builds on [TC.1/genus-zero-cohomology](#TC1-genus-zero-cohomology), [TC.1/odd-induction](#TC1-odd-induction). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §2 pp.1328–1329, AC Theorem 2.1 input.

**Check.** Mbar_1,1 has no rational H1 despite orbifold stabilizers.

<a id="TC1-lower-polynomial-counts"></a>

### Lower-genus polynomial-count base ranges

The compact stacks have polynomial point counts over every finite field for g=1, n≤10; g=2, n≤7; and g=3, n≤5. The needed equivariant extensions satisfy g′≤3 and 2g′+n′≤11, with genus-zero all n. Keep the polynomial coefficients and symmetric actions from their respective source computations.

The target is `TC.1/lower-polynomial-counts`. Use Getzler’s genus-one calculation, genus-two configuration/local-system calculations and genus-three point counts. Primary source collation and explicit coefficient certificates are recorded in G-source-inputs and G-computations.

Builds on `StableReductionPartII:key/moduli-curves`, `WeilConjectures:WC.1/stack-count-comparison`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §2 p.1328; §9 pp.1351–1353.

**Check.** The genus-one range stops at 10: H11(Mbar_1,11) has dimension 2.

<a id="TC1-odd-seven"></a>

### Vanishing in degree seven

For every stable pair H7(Mbar_g, n)=0.

The target is `TC.1/odd-seven`. Apply polynomial-count odd vanishing on the lower-genus finite bases, then the odd-induction theorem. The DM comparison extension is required explicitly.

Builds on [TC.1/lower-polynomial-counts](#TC1-lower-polynomial-counts), [TC.1/odd-135](#TC1-odd-135), [TC.1/odd-induction](#TC1-odd-induction), `WeilConjectures:WC.5/polynomial-counts-over-z-and-tate-cohomology`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Theorem 1.1, proof for k=7 p.1328.

**Check.** No genus-four sieve input is needed for degree 7.

<a id="TC1-low-genus-odd-nine"></a>

### Odd vanishing through nine in genus at most three

For every stable g≤3 pair, H^q(Mbar_g, n)=0 for odd q≤9.

The target is `TC.1/low-genus-odd-nine`. Run the boundary induction restricted to g≤3. Its degree 9 finite bases have n≤9,7,5 in genera1,2,3, precisely the polynomial-count ranges. The stack comparison is recorded separately.

Builds on [TC.1/lower-polynomial-counts](#TC1-lower-polynomial-counts), [TC.1/odd-induction](#TC1-odd-induction), [TC.1/genus-zero-cohomology](#TC1-genus-zero-cohomology), `WeilConjectures:WC.5/polynomial-counts-over-z-and-tate-cohomology`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §2 pp.1328–1329.

**Check.** This supplies no genus-four degree 9 base case.

## TC.2. Genus-one pure cohomology and symplectic systems

The genus-one cusp formula supplies concrete seeds. Symplectic systems keep the tensor weight separate from the Specht representation that controls permutation of markings.

Atlas planets: Symplectic local systems; Genus-one pure cohomology.

<a id="TC2-symplectic-local-systems"></a>

### Symplectic local systems on curve moduli

For g≥1 on smooth M_g, let V=R1 f_*Q for its universal curve, rank 2g with alternating cup pairing V⊗V→Q(−1). For a partition lambda of length≤g define V_lambda by the irreducible symplectic highest-weight summand in tensor/Schur constructions, with central weight |lambda| and Tate factors fixed by contractions. For g=4 this is BFP’s V_lambda; T_lambda denotes a Specht module and is a different object.

The target is `TC.2/symplectic-local-systems`. Apply the imported symplectic harmonic-tensor representation construction to the monodromy torsor. Descent constructs the local system; geometric Künneth and contraction compatibility are a supplier gap.

Builds on `StableReductionPartII:MC.7/consumer-clp`, `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-9-schur-weyl-duality-for-the-orthogonal-and-symplectic-groups-the-brauer-algebra`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP §3 pp.9–10; BFP §11.4 pp.1361–1362.

The API serves CLP Lemma 3.1 (Describes the marking quotient.); BFP Theorem 11.5 (Receives configuration-count Euler characteristics.).

| Declaration | Contract |
| --- | --- |
| `SymplecticLocalSystems.standard` | V_(1)=V, V_empty=Q. |
| `SymplecticLocalSystems.weight` | V_lambda is pure of weight \|lambda\|. |
| `SymplecticLocalSystems.involution` | The central element−1 acts by(−1)^\|lambda\|. |
| `SymplecticLocalSystems.base_change` | Formation commutes with pullback of smooth curve families. |
| `SymplecticLocalSystems.trivial` | The empty partition gives the constant rank-one system Q; the alternating contraction of V has target Q(−1). |

**Checks.**

- For lambda=(1), rank=2g, so rank 8 on M4.
- For g=1 a one-row partition(r) gives Sym^r V.
- The primitive exterior-square system removes the Q(−1) contraction summand; it is not the whole exterior square.

<a id="TC2-genus-one-pure"></a>

### Pure cohomology of smooth genus-one moduli

For k>0, n≥k, W_k H^k(M_1, n)≅S_(k+1)⊗T_(n−k+1,1^(k−1)). Its cusp multiplicity is binomial(n−1, k−1). Pullbacks from k-subsets containing a fixed marking give a free family of copies of S_(k+1). It vanishes for n<k; degree 0 is Q separately.

The target is `TC.2/genus-one-pure`. Use the configuration-space spectral sequence over M1,1 and the alternating cusp summand; straighten subsets with the fixed marking and identify the hook Specht character. This includes the primary Getzler input under G-source-inputs.

Builds on [TC.0/cusp-moduli-identification](#TC0-cusp-moduli-identification), [TC.2/symplectic-local-systems](#TC2-symplectic-local-systems), `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Proposition 2.2 pp.5–7.

**Check.** At n=k=11 the group is S12 of dimension 2. At k=13, S14=0 for every n.

<a id="TC2-genus-one-even"></a>

### Even genus-one cohomology is tautological

For every n≥1, all even cohomology H^(2r)(Mbar_1, n) is tautological. Its ring is generated by boundary divisor and higher boundary-stratum classes with the unit; cotangent classes are rational boundary combinations.

The target is `TC.2/genus-one-even`. Import Petersen’s genus-one even-cohomology theorem with boundary generation, not merely the statement that the groups are Tate. Use its psi-boundary relation for the cusp-STE operations.

Builds on [TC.0/tautological-rings](#TC0-tautological-rings), [TC.1/genus-zero-cohomology](#TC1-genus-zero-cohomology). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP §2.2 pp.5–7, Petersen input.

**Check.** At n=1, the boundary relation gives psi1=delta_irr/12 with the stack divisor normalization.

<a id="TC2-stable-tautological-range"></a>

### Stable range and coarse cohomological bound

For g≥2, ordinary H^k(M_g, n) is tautological if k≤(2g−2)/3. Also H^k(M_g, n)=0 for k>4g−4+n. Use these deliberately nonsharp bounds in the finite-generation argument.

The target is `TC.2/stable-tautological-range`. Combine homological stability, stable cohomology generated by kappa classes and the marking psi classes. Preserve the weak boundary inequality actually used. Primary stability and stable-cohomology proofs require the source-input contract.

Builds on [TC.1/vcd](#TC1-vcd), [TC.0/tautological-rings](#TC0-tautological-rings). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP proof of Theorem 1.3 p.10, Harer and Wahl inputs.

**Check.** The genus inequality g≥3k/2+1 is sufficient; no claim is made for every g outside it.

## TC.3. Semi-tautological extensions and finite generation

The STE closure operations give the algebra in which uniform generation is meaningful. The filling criterion below strengthens the printed hypotheses so that forgetting in the same degree is justified.

Atlas planets: Marking filtration; Local-system quotient; Semi-tautological extension; Filling criterion; Finite generation theorem.

<a id="TC3-marking-filtration"></a>

### The marking subspaces Phi and Psi

On a stable smooth pair, Phi^k=sum_i pi_i* W_k H^k(M_g, n−1), where pi_i* here denotes pullback, and Psi^k=sum_i psi_i·Phi^(k−2), with the resulting Tate twist understood in realizations. A sum uses only stable forgetful targets; if there are none it is zero. Degrees below zero give zero.

The target is `TC.3/marking-filtration`. Take finite sums of the imported linear pullback images and cup-product images. Record inclusion into the pure-weight piece and label equivariance.

Builds on [TC.0/induction-order](#TC0-induction-order), `StableReductionPartII:MC.3/cotangent-line`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP §2.1 p.4; Lemma 3.1 pp.9–10.

The API serves CLP Lemma 2.1 (Forms the filling quotient.); CLP Lemma 3.1 (Isolates full-weight local-system contributions.).

| Declaration | Contract |
| --- | --- |
| `MarkingFiltration.phi_image` | Each stable forgetting pullback lands in Phi. |
| `MarkingFiltration.psi_degree` | Psi^k is generated by degree(k−2) pullbacks multiplied by degree 2 psi classes. |
| `MarkingFiltration.relabel` | Relabelling carries the summands to the permuted summands. |
| `MarkingFiltration.unstable` | There is no fictitious forgetful map M1,1→M1,0. |
| `MarkingFiltration.mem_phi` | A pure degree-k class lies in Phi^k exactly when it is a sum of pullbacks from the stable one-mark-forgotten targets. |
| `MarkingFiltration.mem_psi` | A class lies in Psi^k exactly when it is a sum of psi_i times classes from Phi^(k−2); negative degrees contribute zero. |

**Checks.**

- Phi^k on M1,1 is zero under the stable-target convention.
- Phi0 on M_g, n is Q when n>0 and the forgetting target is stable.
- Psi1=0, since H^(−1)=0.

<a id="TC3-local-system-quotient"></a>

### The local-system marking quotient

For g≥2, W_k H^k(M_g, n)/(Phi^k+Psi^k)≅⊕_(|lambda|=n) W_k H^(k−n)(M_g, V_lambda)⊗T_(lambda^transpose). If n>0 and n≥k, W_k H^k(M_g, n)=Phi^k. Partitions have length≤g; the zero and unit cases are handled separately.

The target is `TC.3/local-system-quotient`. Use the relative configuration spectral sequence, symplectic contraction decomposition and the alternating sign from degree-one tensors to transpose the Specht partition. For n≥k the positive-local-weight invariants vanish; reduce products with psi through the filtration.

Builds on [TC.2/symplectic-local-systems](#TC2-symplectic-local-systems), [TC.3/marking-filtration](#TC3-marking-filtration), `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-9-schur-weyl-duality-for-the-orthogonal-and-symplectic-groups-the-brauer-algebra`, `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 3.1 pp.9–10.

**Check.** The Specht index is transposed; for n=1 the degree-one tensor is the standard local system. For n=k=0 the assertion W0=Phi is intentionally not made.

<a id="TC3-genus-two-even"></a>

### Genus-two even pure and compact cohomology

For 0≤r≤10 and every n≥0, W_(2r)H^(2r)(M_2, n)=RH^(2r)(M_2, n); consequently H^(2r)(Mbar_2, n)=RH^(2r)(Mbar_2, n).

The target is `TC.3/genus-two-even`. Start from Petersen’s finite-marking compact-type calculation, reduce extra markings through the local-system quotient of TC.3, and lift by boundary induction. The proof’s quotient dependency is supplied as an input contract here and expanded in TC.3; avoid a graph cycle by taking this result after that quotient when building.

Builds on [TC.2/symplectic-local-systems](#TC2-symplectic-local-systems), [TC.0/boundary-exactness](#TC0-boundary-exactness), [TC.1/genus-zero-cohomology](#TC1-genus-zero-cohomology), [TC.2/genus-one-even](#TC2-genus-one-even), [TC.3/local-system-quotient](#TC3-local-system-quotient), [TC.1/low-genus-odd-nine](#TC1-low-genus-odd-nine). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Proposition 2.6 p.7 and Corollary 2.7 p.8.

**Check.** The bound is cohomological degree 20, not codimension20.

<a id="TC3-semi-tautological-extension"></a>

### Semi-tautological extensions

An STE is a system of unital graded Q-subalgebras S*(Mbar_g, n) containing RH*, stable under all relabelling and forgetting pullbacks and all clutching pushforwards, including external products on factors. Do not impose forgetting pushforward or clutching pullback in its definition. The STE generated by a family is the intersection of systems containing it; motivic means sub-Hodge structures and G_Q-stable spaces in the respective realizations.

The target is `TC.3/semi-tautological-extension`. Intersect the full-system upper bounds in each degree. Functoriality preserves intersections. Each generated class has a finite graph expression with finitely many seed decorations.

Builds on [TC.0/tautological-rings](#TC0-tautological-rings), `StableReductionPartII:MC.7/consumer-clp`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Definition1.2 p.2; §2.1 p.4.

The API serves CLP Theorem 1.3 (Expresses finite generation.); CLP Theorems1.6–1.7 (Express homology generation by cusp classes.).

| Declaration | Contract |
| --- | --- |
| `SemiTautologicalExtension.generated_le` | The generated STE is contained in S iff S contains all seeds. |
| `SemiTautologicalExtension.monotone` | Enlarging seeds enlarges their STE. |
| `SemiTautologicalExtension.tautological` | The empty seed family generates RH*. |
| `SemiTautologicalExtension.graph_expression` | Classes are finite sums of decorated-graph expressions with seed classes and tautological decorations. |
| `SemiTautologicalExtension.ext` | Equality of the graded subalgebras on every stable pair implies equality of STEs. |
| `SemiTautologicalExtension.operations` | An STE contains the units and RH, and is closed under relabelling, forgetting pullback and clutching pushforward of exterior products, as in its definition. |

**Checks.**

- The full cohomology system is an STE.
- The empty family gives RH*, rather than zero.
- H11(Mbar_1,11) is not in the empty-seed STE because tautological classes have even degree.

<a id="TC3-filling-criterion"></a>

### The filling criterion

Let S be an STE and fix stable(g, n), k≥0. Suppose S^q(Mbar_g′, n′) surjects onto W_qH^q(M_g′, n′)/(Phi^q+RH^q) for the current triple and every stable smaller pair, 0≤q≤k, with 2d′−q≤2d−k. Then S^k(Mbar_g, n)=H^k(Mbar_g, n). This strengthened sufficient criterion includes same-degree forgetting cases; the printed q≤k−2 condition alone is false.

The target is `TC.3/filling-criterion`. Induct on the stable-pair order. The enlarged hypotheses pass to every boundary Künneth factor of degree≤k−2 and to every stable forgetful source in the same degree k. Lift Phi using these same-degree sources, lift RH by the STE condition, and lift the remaining open quotient by assumption. Pure-weight boundary exactness then gives the desired equality. This is a repair of the printed lemma, not a quotation of its hypotheses.

Builds on [TC.3/semi-tautological-extension](#TC3-semi-tautological-extension), [TC.3/marking-filtration](#TC3-marking-filtration), [TC.0/boundary-exactness](#TC0-boundary-exactness), [TC.0/induction-order](#TC0-induction-order). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 2.1 pp.4–5.

**Check.** Do not replace the lower-triple hypotheses by only the current pure quotient. Negative control: for the tautological STE at(1,12,11), the pure H11 is generated by forgotten-marking pullbacks, so the printed current quotient and all q≤9 tests vanish, but RH11=0 and H11≠0. The strengthened hypotheses include(1,11,11) and exclude this counterexample.

<a id="TC3-genus-two-odd-markings"></a>

### Odd-marking reduction in genus two

For odd n≥1 and k≥2, the STE generated by H^k(Mbar_2, n−1), H^(k−2)(Mbar_2, n−1) and H^(k−2)(Mbar_1, m) for 1≤m≤n+2 contains H^k(Mbar_2, n).

The target is `TC.3/genus-two-odd-markings`. The hyperelliptic involution kills the |lambda|=n odd quotient. Phi and Psi reduce to n−1; boundary factors reduce to the listed genus-one and genus-two groups.

Builds on [TC.3/local-system-quotient](#TC3-local-system-quotient), [TC.3/filling-criterion](#TC3-filling-criterion), [TC.1/genus-zero-cohomology](#TC1-genus-zero-cohomology). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 3.2 p.10.

**Check.** Use n=11, k=13 and n=13, k=15 to recover the exceptional base reductions.

<a id="TC3-cusp-ste-operations"></a>

### Cusp-generated extensions and all tautological operations

The STE generated by H11(Mbar_1,11) contains every H11(Mbar_g, n) and every H13(Mbar_1, n), and is closed also under forgetting pushforward and clutching pullback. The same operation-closure argument applies to an STE generated by rational subspaces of genus-one cusp-form realizations, with Hodge/Galois closure when required.

The target is `TC.3/cusp-ste-operations`. S14=0 forces genus-one H13 onto the boundary. Use the earlier all-genus H11 boundary-generation theorem, excess intersection and vanishing of forgetting pushforwards of cusp seeds. The earlier H11 theorem is a named missing source input, not an automatic consequence of Proposition 2.2.

Builds on [TC.3/semi-tautological-extension](#TC3-semi-tautological-extension), [TC.2/genus-one-pure](#TC2-genus-one-pure), [TC.2/genus-one-even](#TC2-genus-one-even), [TC.0/boundary-exactness](#TC0-boundary-exactness). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Corollary 2.3, Proposition 2.4 and Remark 2.5 p.7; earlier CLP H11 input cited there.

**Check.** Arbitrary nonrational vectors in a complex cusp space do not define a rational motivic STE without taking their rational realization span.

<a id="TC3-finite-generation"></a>

### Finite generation in each cohomological degree

For every k≥0 the STE generated by all H^(k′)(Mbar_g′, n′) with 0≤k′≤k, g′<3k′/2+1, n′≤k′ and 4g′−4+n′≥k′ contains H^k(Mbar_g, n) for every stable pair. The set of seed triples is finite; k=0 follows from the units already in RH.

The target is `TC.3/finite-generation`. Outside the genus bound use stability; outside the n bound remove markings; above the cohomological bound use vanishing. Fill the remaining quotients by induction.

Builds on [TC.3/filling-criterion](#TC3-filling-criterion), [TC.3/local-system-quotient](#TC3-local-system-quotient), [TC.2/genus-one-pure](#TC2-genus-one-pure), [TC.2/stable-tautological-range](#TC2-stable-tautological-range), [TC.1/genus-zero-cohomology](#TC1-genus-zero-cohomology). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Theorem 1.3 p.2 and proof p.10.

**Check.** The bound is strict in g′ and weak in n′ and 4g′−4+n′. There is no unstable seed at(k′, g′, n′)=(0,0,0).

<a id="TC3-homological-generation"></a>

### Homological finite generation

For fixed k≥0 a finitely generated STE has S^(2d−j)(Mbar_g, n)=H^(2d−j)(Mbar_g, n) for every0≤j≤k. One sufficient finite seed region consists of stable g≥1 pairs with n≤1,2g≤k or n≥2,2g−2+n≤k; at each take the entire groups H^(2d−j), for 0≤j≤min(k,2d), together with the tautological system. Ordinary H_j has the additional(d) duality twist. These coarse bounds are derived from BM vanishing, not displayed in Remark 3.3.

The target is `TC.3/homological-generation`. Induct first on j≤k and then on the stable-pair order. Outside the finite seed region the open BM term vanishes; every boundary Künneth factor has homological degree at most j, with all lower degrees covered. Genus-zero groups are tautological. Inside the region retain the finite seed groups. Translate each group with its own source dimension.

Builds on [TC.1/compact-support-vanishing](#TC1-compact-support-vanishing), [TC.0/boundary-exactness](#TC0-boundary-exactness), [TC.3/semi-tautological-extension](#TC3-semi-tautological-extension), [TC.1/genus-zero-cohomology](#TC1-genus-zero-cohomology). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Remark 3.3 p.10.

**Check.** All complementary degrees and twists are recalculated at the source pair; a fixed cohomological degree is not fixed homological degree.

<a id="TC3-finite-simple-types"></a>

### Finitely many simple realization types per degree

For each fixed k only finitely many simple rational Hodge structures, respectively simple Q_l[G_Q]-representations, occur in H^k(Mbar_g, n)^ss over all stable pairs.

The target is `TC.3/finite-simple-types`. Finite seed groups contribute finitely many simple factors. At a fixed output degree there are finitely many tensor lengths and edge Tate shifts; graph operations give subquotients of those finite lists.

Builds on [TC.3/finite-generation](#TC3-finite-generation), [TC.3/semi-tautological-extension](#TC3-semi-tautological-extension). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Corollary 1.4 p.2.

**Check.** This is a separate finite list for each k; it does not assert finitely many motives across all degrees.

<a id="TC3-top-heavy"></a>

### Top-heaviness and growth below the middle

Let S be an STE on Mbar_g, n and let d=3g−3+n. For a tautological ample divisor a, cup product by a^(d−k) gives an injection S^k→S^(2d−k) for 0≤k≤d. Cup product by a gives an injection S^k→S^(k+2) for k<d, so dimensions are nondecreasing toward the middle separately in even and odd degree.

The target is `TC.3/top-heavy`. Restrict the ambient hard-Lefschetz isomorphism a^(d−k) to S. Multiplication preserves S because the ample class is tautological. If ax=0 for k<d, then a^(d−k)x=0, so x=0. Full paritywise unimodality additionally asserts decrease above the middle; this argument alone does not establish that stronger assertion. The ample/projective coarse-space input and the stronger assertion are recorded in G-projectivity-lefschetz.

Builds on [TC.3/semi-tautological-extension](#TC3-semi-tautological-extension). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Introduction p.3, hard-Lefschetz argument.

**Check.** No perfect Poincaré pairing on S is claimed; top-heavy permits unequal opposite dimensions.

## TC.4. Chow–Kunneth generation and pure algebraicity

The product-surjectivity property is geometric and quantifies over every allowed test stack. Its diagonal argument controls only pure-weight cohomology of an open stack.

Atlas planets: Chow–Künneth generation; Chow–Künneth permanence; Pure algebraicity lemma.

<a id="TC4-chow-kunneth-generation"></a>

### The Chow–Künneth generation property

A smooth finite-type algebraic stack X/k stratified by quotient stacks has CKgP if, for every finite-type algebraic stack Y/k stratified by quotient stacks, the ungraded rational exterior product A_*(X)⊗Q A_*(Y)→A_*(X×Y) is surjective. Y need not be smooth or proper; the universal quantifier is essential.

The target is `TC.4/chow-kunneth-generation`. Form a property of the imported Chow exterior-product maps. Retain the entire graded sum so a homogeneous target can be projected to its degree; record base-field and quotient-stratification hypotheses.

Builds on `SchemeAndStackFoundations:SF.5/stack-chow`, `SchemeAndStackFoundations:SF.5/dm-gysin-ring`, `SchemeAndStackFoundations:SF.5`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Definition4.1 p.11.

The API serves CLP Lemma 4.3 (Decomposes the diagonal.); CLP Theorem 1.10 (Is the geometric genus-seven conclusion.).

| Declaration | Contract |
| --- | --- |
| `ChowKunnethGeneration.exterior_surjective` | For every permitted Y each class on X×Y is a finite sum of exterior products. |
| `ChowKunnethGeneration.degree` | A degree-r target can be expressed using products with total homological degree r. |
| `ChowKunnethGeneration.iso` | An isomorphism of stacks preserves CKgP. |
| `ChowKunnethGeneration.point` | Spec k has CKgP because its exterior product is the identity. |

**Checks.**

- A point has CKgP, and the exterior product with an arbitrary Y is onto.
- P1 has CKgP using its point and fundamental class.
- A complex elliptic curve fails CKgP: its diagonal has an H1⊗H1 component unavailable to algebraic exterior products. Checking only Y=point would miss this failure.

<a id="TC4-ckgp-permanence"></a>

### Permanence of Chow–Künneth generation

Within smooth finite-type stacks stratified by quotient stacks, CKgP passes to opens, to proper surjective targets along maps representable by DM stacks, and from all pieces of a finite stratification to their union. It is equivalent along affine bundles, passes to Grassmann bundles, and holds for BGL_r, BSL_r and BPGL_r.

The target is `TC.4/ckgp-permanence`. Use localization after product with every Y, proper rational surjectivity via a generically finite multisection, affine homotopy invariance and the Grassmann bundle formula. Classifying stacks use finite-dimensional approximations. The stack exterior-product and bundle formulas are exact supplier requests.

Builds on [TC.4/chow-kunneth-generation](#TC4-chow-kunneth-generation), `SchemeAndStackFoundations:SF.5/stack-chow`, `SchemeAndStackFoundations:SF.5/dm-gysin-ring`, `SchemeAndStackFoundations:SF.5/dm-rational-degree`, `SchemeAndStackFoundations:SF.5`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Proposition 4.2 p.11, citing Canning–Larson §3.1.

**Check.** A proper surjective map is required for descent; a mere surjection on geometric points does not supply the Chow pushforward argument.

<a id="TC4-pure-algebraicity"></a>

### Chow–Künneth generation makes pure cohomology algebraic

Let X be open in a smooth proper DM stack Xbar/C, with pure dimension d and CKgP. For every r the cycle class A_(d−r)(X)→W_(2r)H^(2r)(X)(r) is onto. W_kH^k(X)=0 for odd k, and its even part is Hodge–Tate. Over a finitely generated characteristic-zero field the analogous l-adic statement uses a smooth proper compactification and the corresponding weight/cycle comparison.

The target is `TC.4/pure-algebraicity`. Express the diagonal of X as a sum of Chow exterior products; lift their factors to Xbar. Localization leaves a correction supported on Xbar×(Xbar−X). Apply correspondences to a pure class lifted to Xbar. The supported correction restricts to zero and product correspondences contribute only in matching even degree, with image in the cycle span.

Builds on [TC.4/chow-kunneth-generation](#TC4-chow-kunneth-generation), [TC.0/boundary-exactness](#TC0-boundary-exactness), `SchemeAndStackFoundations:SF.5/stack-chow`, `SchemeAndStackFoundations:SF.5/dm-gysin-ring`, `MotivesAndAlgebraicCycles:MC.2`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 4.3 pp.11–12 and Remark 4.4 p.12.

**Check.** Surjectivity is asserted; injectivity of the open cycle map is not. For X=P1 minus three points, this says only the weight-k part of H^k is algebraic, not all mixed cohomology.

<a id="TC4-known-ckgp-ranges"></a>

### Known low-genus Chow–Künneth ranges

For g=0 take every stable n; for g=1,2,3,4,5,6 take n≤10,10,11,11,7,5 respectively. Then M_g, n has CKgP and A*=R*. Consequently W_kH^k=RH^k, and odd W_kH^k and Gr_k^W H_c^k both vanish. The genus-seven extension n≤3 is supplied by TC.6, not assumed here.

The target is `TC.4/known-ckgp-ranges`. Import the earlier low-genus geometric descriptions with Chow generation. Apply the pure-algebraicity lemma and weight strictness for compact supports. The primary earlier paper and its detailed geometry must be verified under the source-input gap.

Builds on [TC.4/pure-algebraicity](#TC4-pure-algebraicity), [TC.1/genus-zero-cohomology](#TC1-genus-zero-cohomology). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Table1 p.13 and Proposition 4.5 p.12; Canning–Larson Theorem 1.4 cited there.

**Check.** The genus-three bound is11, genus-five bound7 and genus-six bound5; the table is not a uniform marking bound.

## TC.5. Tetragonal covers and gonality strata

The low-gonality and tetragonal support arguments supply the complement of the pentagonal open. A class being algebraic does not suffice: its pushforward must be tautological.

Atlas planets: Genus-seven gonality strata; Tetragonal Hurwitz model; Tetragonal splitting strata; Tetragonal Chow generation.

<a id="TC5-gonality-strata"></a>

### Gonality strata in genus seven

Inside smooth M_7, n let M^≤a_7, n be the locus of curves with geometric gonality at most a; let M^a denote exact gonality a. Genus seven has gonality≤5. Use the closed≤3 locus, the exact tetragonal stratum≤4 minus≤3, and the open pentagonal stratum M^circle=M^5. Markings are ordered distinct smooth sections.

The target is `TC.5/gonality-strata`. Use relative linear-series properness to define closed gonality bounds and the genus-seven maximal-gonality theorem. Pull back along forgetting markings. These geometric inputs are included in the primary-source contract.

Builds on `StableReductionPartII:key/moduli-curves`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP §5 opening pp.13–14.

The API serves CLP §5.1 (Separates low-gonality and tetragonal contributions.); CLP §5.3 (Provides the domain of the corrected Mukai comparison.).

| Declaration | Contract |
| --- | --- |
| `GonalityStrata.closed` | The≤a bounds are closed and nested in this range. |
| `GonalityStrata.forget` | Gonality strata are inverse images of unmarked strata. |
| `GonalityStrata.decomposition` | The≤3, exact4 and exact5 strata partition M7, n. |
| `GonalityStrata.mem_exact` | A geometric pointed curve lies in exact gonality a iff it admits a degree-a map to P1 and admits no map of smaller positive degree. |

**Checks.**

- A hyperelliptic genus-seven curve belongs to≤3 and not exact4.
- A tetragonal curve of exact gonality4 is excluded from the pentagonal open.
- Adding a marking does not change geometric gonality.

<a id="TC5-low-gonality-input"></a>

### The low-gonality genus-seven locus

For n≤14, M^≤3_7, n has CKgP and every Chow class on M7, n supported on that closed locus is tautological.

The target is `TC.5/low-gonality-input`. Import the hyperelliptic/trigonal Hurwitz descriptions and support pushforward theorem from the cited earlier paper. Distinguish the intrinsic Chow ring of the stratum from classes supported on it in M7, n.

Builds on [TC.5/gonality-strata](#TC5-gonality-strata), [TC.4/chow-kunneth-generation](#TC4-chow-kunneth-generation), [TC.0/tautological-rings](#TC0-tautological-rings). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP §5 p.13, citing Canning–Larson Lemma 9.9.

**Check.** The support statement is needed to extend tautological generation from the pentagonal open.

<a id="TC5-tetragonal-hurwitz"></a>

### Tetragonal Hurwitz data and Casnati–Ekedahl bundles

Let H^diamond_4,7, n parametrize finite flat degree-four maps C→P1 from smooth genus-seven curves of gonality at least4, with n distinct ordered points, modulo target PGL2. Its Casnati–Ekedahl data are rank-three E and rank-two F of degree 10 on the universal P1, with detE≅detF and C cut out by two relative quadrics in P(E dual). Retain target automorphisms and the determinant comparison.

The target is `TC.5/tetragonal-hurwitz`. Construct the cover stack through finite-flat algebra and the Casnati–Ekedahl resolution; compare the universal embedded curve. General Hurwitz representability and the resolution are missing source inputs, not consequences of the curve-moduli supplier.

Builds on [TC.5/gonality-strata](#TC5-gonality-strata), `SchemeAndStackFoundations:SF.5/stack-chow`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP §5.1 pp.13–14.

The API serves CLP Lemmas5.1–5.7 (Provides the projective-bundle pushforward and splitting stratification.).

| Declaration | Contract |
| --- | --- |
| `TetragonalHurwitz.forget` | Forgetting the map is proper onto exact gonality4 after excluding≤3. |
| `TetragonalHurwitz.bundles` | E, F and their determinant comparison pull back with families. |
| `TetragonalHurwitz.embedding` | The universal curve embeds in P(E dual) as the indicated complete intersection. |
| `TetragonalHurwitz.base_change` | Base change of finite flat covers and marked sections gives pullback of Hurwitz families and, on the target lift where they exist, of the Casnati–Ekedahl data. |
| `TetragonalHurwitz.isomorphism` | Isomorphisms of cover data are commuting squares of source and target isomorphisms preserving ordered sections; target automorphisms are retained. |

**Checks.**

- The ranks are3 and 2 and both degrees are10 at genus7.
- A degree-four map factoring through a hyperelliptic curve is excluded by the gonality condition.
- Permuting the two defining quadrics changes an F frame, not the underlying cover.

<a id="TC5-tetragonal-splitting"></a>

### Tetragonal splitting strata

In H^diamond_4,7,0 take X with E=O(3)⊕O(3)⊕O(4), F=O(5)⊕O(5) or O(4)⊕O(6); Sigma2 with E=(2,4,4), F=(4,6); Sigma3 with E=(2,3,5), F=(4,6). The remaining hyperelliptic splitting locus is removed. Subscript n means pullback to n distinct markings.

The target is `TC.5/tetragonal-splitting`. Use splitting semicontinuity and the smooth irreducible cover constraints. Present each stratum by the appropriate automorphism group of the split bundles and open equation locus.

Builds on [TC.5/tetragonal-hurwitz](#TC5-tetragonal-hurwitz). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP §5.1 pp.14–15, splitting table.

The API serves CLP Lemmas5.2–5.6 (Provides the three pieces of the Chow localization argument.).

| Declaration | Contract |
| --- | --- |
| `TetragonalSplitting.cover` | X, Sigma2, Sigma3 form a finite stratification of H^diamond. |
| `TetragonalSplitting.pullback` | The marked strata are the inverse images of unmarked strata. |
| `TetragonalSplitting.rank_degree` | Each listed splitting has rank/degree matching E and F. |
| `TetragonalSplitting.geometric_membership` | Membership of a geometric cover in X, Sigma2 or Sigma3 is equivalent to the respective pair of displayed E and F splitting types, within H^diamond. |

**Checks.**

- (3,3,4) sums to10, and(5,5) sums to10.
- Sigma2 and Sigma3 are distinct despite equal F splitting.
- A splitting corresponding to the excluded hyperelliptic locus is not admitted to H^diamond.

<a id="TC5-ce-pushforward"></a>

### Casnati–Ekedahl pushforward is tautological

For any genus g≥2 in the tetragonal construction, define the same Hurwitz stack with rank 3 E and rank 2 F both of degree g+3. A class in the image A*((P E dual)^n)→A*(H^diamond_4, g, n) pushes forward under the proper forgetting map to a tautological class on M_g, n minus its gonality≤3 locus. The genus-seven instance has degree 10.

The target is `TC.5/ce-pushforward`. Expand in the projective hyperplane classes and Chern classes of E, F; push along the cover incidence and use GRR to express the resulting classes in kappa, psi and Hodge classes. The exact nodal/stack GRR and Hurwitz-source inputs remain supplier contracts.

Builds on [TC.5/tetragonal-hurwitz](#TC5-tetragonal-hurwitz), [TC.0/kappa-classes](#TC0-kappa-classes), [TC.0/tautological-rings](#TC0-tautological-rings), `SchemeAndStackFoundations:SF.5`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 5.1 p.14, earlier Lemma 10.5 cited there.

**Check.** A statement merely asserting all classes are algebraic would not give the required tautological pushforward.

<a id="TC5-open-tetragonal-stratum"></a>

### The open tetragonal stratum with at most three marks

For 0≤n≤3, X_n has CKgP and restriction A*((P E dual)^n)→A*(X_n) is onto.

The target is `TC.5/open-tetragonal-stratum`. Present the equations vanishing at n points as a vector-bundle kernel over the n-fold ambient incidence. Evaluation is onto for n≤3, of the specified rank 2n; restrict to the smooth-cover open and apply affine-bundle and quotient permanence.

Builds on [TC.5/tetragonal-splitting](#TC5-tetragonal-splitting), [TC.4/ckgp-permanence](#TC4-ckgp-permanence). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 5.2 p.14.

**Check.** The evaluation rank is2n, not n; no n=4 conclusion is inferred.

<a id="TC5-sigma-chow"></a>

### Chow generation on the special tetragonal strata

For ell=2,3 and n≤3, the Chow ring of Sigma_(ell, n) is generated over A*(Sigma_ell) by the n base and projective hyperplane classes z_i, zeta_i; Sigma_(ell, n) has CKgP. The ambient restriction A*((P E dual)^n)→A*(Sigma_(ell, n)) is onto.

The target is `TC.5/sigma-chow`. Use the open equation bundles for each fixed splitting, the evaluation-surjectivity conditions and the explicit lower-stratum Chow presentations. Express their base generators as restrictions of E, F Chern classes. Retain the cited Canning–Larson stratum-class calculations in the source contract.

Builds on [TC.5/tetragonal-splitting](#TC5-tetragonal-splitting), [TC.4/ckgp-permanence](#TC4-ckgp-permanence). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemmas5.3 and 5.5 pp.15–16.

**Check.** Verify both ell=2 and ell=3, including the boundary between their splitting loci.

<a id="TC5-tetragonal-global-chow"></a>

### Tetragonal Chow generation and support theorem

For n≤3, H^diamond_4,7, n and the exact tetragonal locus have CKgP; ambient restriction onto A*(H^diamond_4,7, n) is surjective. Every class on M7, n supported on its tetragonal locus after removing≤3 is tautological.

The target is `TC.5/tetragonal-global-chow`. Localize through X, Sigma2, Sigma3. Use ambient formulas for the fundamental classes of the closed strata, projection formula and their restriction surjectivity to lift the supported terms; then descend CKgP and push classes via the proper Hurwitz map.

Builds on [TC.5/open-tetragonal-stratum](#TC5-open-tetragonal-stratum), [TC.5/sigma-chow](#TC5-sigma-chow), [TC.5/ce-pushforward](#TC5-ce-pushforward), [TC.4/ckgp-permanence](#TC4-ckgp-permanence). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Corollary 5.4 and Lemmas5.6–5.7 pp.16–17.

**Check.** Surjectivity on each stratum alone is insufficient unless the supported fundamental classes lift; include those class formulas.

## TC.6. Orthogonal geometry and the corrected Mukai gates

The half-spin representation is already available algebraically. The work here is its family-level curve comparison and the central descent of bundles and Chow classes. Both gates are prerequisites, even when the desired realization statement is quoted in CLP.

Atlas planets: Universal orthogonal Grassmannian; Mukai lift and rigidification; Mukai descent and transfer; Marked spinor incidence; Genus-seven tautological Chow theorem.

<a id="TC6-orthogonal-universal-chow"></a>

### Universal maximal-isotropic Chow generation

For a split nondegenerate10-dimensional quadratic space over C, fix one connected component OG+(5,10). The quotient[OG+/SO10] is BP for its maximal-isotropic parabolic, with Levi GL5 and split unipotent radical of dimension 10. It has CKgP and rational Chow ring Q[c1(U),…, c5(U)]. On BP the standard quadratic bundle fits0→U→V→U dual→0; do not require an equivariant direct-sum splitting.

The target is `TC.6/orthogonal-universal-chow`. Identify the parabolic and its Levi; the map BGL5→BP is the unipotent affine-bundle comparison. Apply homotopy invariance, obtaining the polynomial Chern presentation. The nonsplit representation extension suffices for Chern identities.

Builds on [TC.4/ckgp-permanence](#TC4-ckgp-permanence), `tauceti:TauCeti.spinPlus`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 5.8 and Remark 5.9 pp.18–19.

**Check.** The relative dimension is10. The disconnected union of both isotropic components is not the fixed component of the spinor embedding.

<a id="TC6-orthogonal-fibre-powers"></a>

### Orthogonal Grassmann fibre powers

For n≥1 and the universal oriented quadratic bundle over BSO10 with split rank-ten model, the n-fold fibre product of the fixed maximal-isotropic component has CKgP; its Chow ring is generated by the Chern classes of U1,…, Un. The relative-bundle step requires an oriented nondegenerate quadratic form and the chosen component, and a proved rational Chow generation theorem for such bundles; underlying vector-bundle triviality alone does not trivialize the form.

The target is `TC.6/orthogonal-fibre-powers`. Use the type-D rational Giambelli formula on the split fibre and a valid descent or splitting-principle argument for the specific universal iterated bundles. The source’s proof passes from vector-bundle triviality to form triviality; G-orthogonal records the missing justification and prohibits using the unrestricted printed lemma.

Builds on [TC.6/orthogonal-universal-chow](#TC6-orthogonal-universal-chow), [TC.4/ckgp-permanence](#TC4-ckgp-permanence). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 5.10 and Corollary 5.11 p.19.

**Check.** A nondegenerate quadratic form with nontrivial splitting obstruction cannot be made split just by choosing a basis of its vector bundle. n=0 is excluded from the stated Chern-generator conclusion: the empty list cannot generate A*(BSO10).

<a id="TC6-mukai-lift-gate"></a>

### Mukai central lift and moduli comparison

For the smooth pentagonal genus-seven linear-section incidence I_n in the spinor embedding OG+⊂P(S+), S+ has rank 16 and the action is Spin10, not SO10. Construct[I_n/Spin10] and its central rigidification by the projectively ineffective Z(Spin10)=mu4. Prove the comparison of the resulting effective quotient[I_n/PSO10] with the actual stack M^circle_7, n, preserving precisely curve automorphism groups and all marking-forgetting maps. A residual gerbe description must name its band and any remaining stabilizers.

The target is `TC.6/mukai-lift-gate`. Use Mukai’s canonical construction W=ker(Sym²H0(omega)→H0(omega²)), rank 10 with its quadratic structure, and the rank 5 kernels from omega(−p). Prove the family comparison and full faithfulness including automorphisms. Existing half-spin algebra supplies only the representation; the central quotient and curve-family comparison are unproved gates G-mukai, not conclusions of the printed SO quotient.

Builds on [TC.5/gonality-strata](#TC5-gonality-strata), [TC.6/orthogonal-fibre-powers](#TC6-orthogonal-fibre-powers), `tauceti:TauCeti.spinPlus`, `tauceti:TauCeti.spinPlusAction`, `tauceti:TauCeti.spinPlusSubrep`, `tauceti:TauCeti.finrank_spinPlus`, `StableReductionPartII:key/moduli-curves`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-stabilizers`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-base-change`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP §5.3 pp.20–21, equations(5.10)–(5.13); corrected extraction items95–96.

**Check.** The central−1 acts nontrivially on S+, so an SO10 half-spin vector representation is impossible. The effective projective action factors through PSO10, while actual curve automorphisms must survive. At n=0 the model uses7-dimensional subspaces of a16-dimensional half-spin space.

<a id="TC6-mukai-descent-gate"></a>

### Mukai bundle descent and rational transfer

On the corrected lifted incidence, compute the mu4 central characters of S+, each tautological point line L_i, Q_n and the rank(7−n) subbundle E_n. Descend only zero-character combinations, or tensor by a specifically constructed cancelling line with its descent datum. Prove the resulting rational Chow and cohomology transfers to M^circle_7, n, including exterior products with every test stack for CKgP; keep character-zero Chow identities compatible with forgetting markings.

The target is `TC.6/mukai-descent-gate`. First compute centre weights and distinguish a projective bundle from descent of its vector bundle. Then use an explicit gerbe/rigidification Chow comparison with rational coefficients, natural after every product. The required cancelling lines and transfer theorem are recorded as G-mukai; neither a Spin replacement alone nor a pointwise gerbe argument proves this target.

Builds on [TC.6/mukai-lift-gate](#TC6-mukai-lift-gate), `SchemeAndStackFoundations:SF.5/stack-chow`, `SchemeAndStackFoundations:SF.5/dm-gysin-ring`, `SchemeAndStackFoundations:SF.5/dm-rational-degree`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP §5.3 equations(5.10)–(5.13) and Lemmas5.14–5.17 pp.20–22; corrected extraction item96.

**Check.** A weight-one L_i cannot descend untwisted through mu4. A rational Chow isomorphism for the base alone is insufficient to establish CKgP. The relation for a descended line must include the chosen twist; retain c1(L_i)=−psi_i only on a verified compatible model.

<a id="TC6-marked-spinor-incidence"></a>

### Marked spinor incidence model

On the Spin10 lift, let Z_n⊂(OG+)^n be the locus where the sum of the n tautological lines injects into S+. Put Q_n=coker(⊕L_i→S+), rank 16−n. For 0≤n≤4 use the subspace Grassmannian Gr^sub_(7−n)(Q_n), equivalently the supplier’s rank-nine quotient Grassmannian Gr_9(Q_n). Its universal kernel E_n has rank 7−n; its inverse image in S+ is the desired rank-seven subbundle containing the marked lines. Remove the nonsmooth-section locus. Gonality5 ensures independence of the marked canonical points. Transfer to M^circle_7, n requires both Mukai gates; the orthogonal fibre-power Chow argument applies only for n≥1.

The target is `TC.6/marked-spinor-incidence`. Form the open rank locus and actual quotient bundle upstairs, then the relative Grassmannian and smooth complete-intersection open. Apply the separately proved stack comparison; do not identify a generic Grassmann quotient with curve moduli without it.

Builds on [TC.6/mukai-lift-gate](#TC6-mukai-lift-gate), [TC.6/mukai-descent-gate](#TC6-mukai-descent-gate), [TC.6/orthogonal-fibre-powers](#TC6-orthogonal-fibre-powers), `AlgebraicModuliForArithmeticGeometry:R09.1/coherent-grassmannian`, `AlgebraicModuliForArithmeticGeometry:R09.1/grassmann-smoothness`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP equations(5.11)–(5.13), Lemma 5.13 pp.20–21.

The API serves CLP Lemma 5.13 (Supplies CKgP via a Grassmann-bundle open.); CLP Lemmas5.14–5.17 (Supplies bundles whose Chern classes must become tautological.).

| Declaration | Contract |
| --- | --- |
| `MarkedSpinorIncidence.ranks` | rankQ_n=16−n, rankE_n=7−n, and rank(Q_n/E_n)=9. |
| `MarkedSpinorIncidence.forget` | Forgetting a marked line compares the incidence models via the specified flag correspondence. |
| `MarkedSpinorIncidence.smooth` | The smooth linear-section locus is exactly the intended pentagonal curve family after comparison. |
| `MarkedSpinorIncidence.universal` | For a test scheme T over Z_n, points of Gr_9(Q_n) are locally free rank-nine quotients of Q_n\|T up to quotient isomorphism, equivalently rank-(7−n) subbundles with locally free quotient. |
| `MarkedSpinorIncidence.base_change` | The universal sequence 0→E_n→Q_n→B_n→0 and its inverse-image rank-seven subbundle commute with base change. |
| `MarkedSpinorIncidence.relative_dimension` | The Grassmannian over Z_n is smooth of relative dimension 9(7−n), before passing to its smooth-section open. |

**Checks.**

- n=0 gives Gr^sub_7(16)≅Gr_9(16), with universal quotient rank9.
- n=4 gives rankQ=12, rankE=3 and quotient rank9.
- A repeated point has dependent lines and lies outside Z_n.
- At n=4, the supplier’s Gr_3(Q_n) parametrizes rank-three quotients and has kernel rank9; it cannot supply E_n of rank3. The intended object is Gr_9(Q_n).

<a id="TC6-spinor-tautological-bundles"></a>

### Tautological Chern identities on the corrected model

For n≤4, after the Mukai descent gate, express the Chern classes of pulled-back U_i, L_i and E_n in kappa, psi and Hodge classes. Upstairs, U_i is determined by the rank 5 quadratic-kernel construction for omega(−sigma_i); L_i has c1=−psi_i in the source’s compatible linearization, and 0→⊕L_i→E_Hodge dual→E_n→0 has ranks n,7,7−n. Any central-cancelling twist changes these formulas and must be explicitly accounted for.

The target is `TC.6/spinor-tautological-bundles`. Use the exact quadratic multiplication sequence for f_*omega(−sigma_i), identify the point line by the canonical embedding, and compare the 7-plane with the dual Hodge bundle. Apply stack GRR and Chern exactness only after correcting descent data.

Builds on [TC.6/marked-spinor-incidence](#TC6-marked-spinor-incidence), [TC.6/mukai-descent-gate](#TC6-mukai-descent-gate), [TC.0/kappa-classes](#TC0-kappa-classes), `StableReductionPartII:MC.5/hodge-bundle`, `SchemeAndStackFoundations:SF.5`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemmas5.14–5.16 pp.21–22.

**Check.** The point-line sign is negative. The rank of E_n decreases with n; it is7−n, not16−n.

<a id="TC6-genus-seven-chow"></a>

### Genus-seven Chow–Künneth generation and tautological Chow ring

For 0≤n≤4, the pentagonal locus M^circle_7, n has CKgP and A*=R* once the corrected quotient and transfer gates are proved. For 0≤n≤3, M7, n itself has CKgP and A*(M7, n)=R*(M7, n). These are targets whose proof route is blocked by G-mukai and G-orthogonal; this packet does not certify the printed quotient proof.

The target is `TC.6/genus-seven-chow`. For 1≤n≤4 generate the pentagonal Chow ring using Ui, Li, En and the corrected Chern identities. For n=0 use the proper surjective forgetful map pi:M^circle_7,1→M^circle_7: rational proper pushforward is surjective, giving CKgP, and pi_*(psi_1 pi*alpha)=kappa_0 alpha=12alpha proves tautological generation. This handles the zero-mark case without applying the n≥1 orthogonal Chern-generator statement to an empty fibre product. Combine the pentagonal locus with exact4 and≤3 strata for 0≤n≤3; localization and support-tautological results give the whole Chow ring.

Builds on [TC.6/spinor-tautological-bundles](#TC6-spinor-tautological-bundles), [TC.6/orthogonal-fibre-powers](#TC6-orthogonal-fibre-powers), [TC.4/ckgp-permanence](#TC4-ckgp-permanence), [TC.5/tetragonal-global-chow](#TC5-tetragonal-global-chow), [TC.5/low-gonality-input](#TC5-low-gonality-input), [TC.0/kappa-classes](#TC0-kappa-classes). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Theorem 1.10 p.4; Lemmas5.13,5.17 pp.20–22.

**Check.** n=4 belongs to the pentagonal conclusion only; it is not a claim about all M7,4. For n=0 the forgetting calculation has kappa_0=12, so division by12 is permitted over Q.

## TC.7. Hyperelliptic counts and the quadric sieve

The sieve keeps singular and nonreduced complete intersections until their inverse-zeta contributions cancel. The displayed high-degree truncations are not exact smooth-fibre counts.

Atlas planets: Pointed hyperelliptic counts; Canonical quadric incidence; Hasse–Weil sieve tail bounds.

<a id="TC7-hyperelliptic-quotient"></a>

### Hyperelliptic binary-form quotient

For g≥2 over Z[1/2], present H_g as the quotient of squarefree binary forms of degree 2g+2 by the standard Arsie–Vistoli change-of-variables group. Its rational-point mass is the number of such forms divided by the connected group order(q²−1)(q²−q). This is a quotient-stack mass assertion, not an assertion that every curve has trivial automorphisms.

The target is `TC.7/hyperelliptic-quotient`. Use double-cover equations and their variable-scaling action. Apply Lang’s theorem to the connected group and count the squarefree forms; verify the precise quotient group and torsor character in the primary input.

Builds on `StableReductionPartII:key/moduli-curves`, `WeilConjectures:WC.1/stack-count-comparison`, `FiniteFieldsAndCharacterSums:FF.3/hyperelliptic-presentation-count`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §5 pp.1331–1332, Arsie–Vistoli input.

**Check.** The equation model here assumes odd characteristic; the all-q conclusion below needs the separate characteristic-two input.

<a id="TC7-hyperelliptic-moments"></a>

### The first hyperelliptic Frobenius moments

For odd q, let a_C=q+1−#C(F_q) and sum with weight1/Aut(C) over H_g(F_q). For g≥2 the zeroth moment is q^(2g−1), every odd moment is zero, and the second moment is q^(2g)−1.

The target is `TC.7/hyperelliptic-moments`. Quadratic twisting pairs the odd moments. For the second moment sum quadratic-character correlations over binary forms; interpolate values at at most two points and use the squarefree sieve. Treat zero and nonzero character values separately.

Builds on [TC.7/hyperelliptic-quotient](#TC7-hyperelliptic-quotient), `FiniteFieldsAndCharacterSums:FF.1/projective-two-evaluation-uniform`, `FiniteFieldsAndCharacterSums:FF.1/projective-two-point-character-sum`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Lemma 5.2 pp.1332–1333.

**Check.** The second moment has the constant−1, not0. Odd moments vanish as weighted sums; individual a_C need not be zero.

<a id="TC7-hyperelliptic-marked-counts"></a>

### Hyperelliptic counts with at most three marks

For every finite field and g≥2: #H_g=q^(2g−1), #H_g,1=(q+1)q^(2g−1), #H_g,2=(q+2)q^(2g)−1, and #H_g,3=(q²+3q−1)q^(2g)−3q. Marks are ordered and distinct. The odd-characteristic proof uses the moments; the all-characteristics extension imports Bergström’s characteristic-two calculation.

The target is `TC.7/hyperelliptic-marked-counts`. Expand the falling factorials of#C(F_q) for ordered distinct marks and apply moments through degree 3. Supply the separate characteristic-two theorem rather than extend quadratic-character equations to q even.

Builds on [TC.7/hyperelliptic-moments](#TC7-hyperelliptic-moments). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Proposition 5.1 pp.1332–1333.

**Check.** At g=4, n=0 the count is q7. At n=2 the factor is#C(#C−1), not#C².

<a id="TC7-quadric-incidence"></a>

### Canonical genus-four quadric incidence families

For g=4 nonhyperelliptic C, the canonical image in P3 is a smooth complete intersection of a unique reduced irreducible quadric and a cubic modulo that quadric. Use three F_q quadric types Q_con, Q_nsp, Q_spl. Their equation spaces are A15 for cone cubics avoiding the vertex, and P15 for each smooth quadric. V^type_n parametrizes the equation plus n ordered distinct points lying on it; C^type_n is its universal complete-intersection curve, including singular and nonreduced fibres for the sieve.

The target is `TC.7/quadric-incidence`. Apply canonical genus-four Petri geometry and classify reduced irreducible quadrics over finite fields, including characteristic2. The cone’s vertex condition selects an affine chart; the other equations are sections of O(3,3).

Builds on `StableReductionPartII:key/moduli-curves`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §6 pp.1333–1336; §§7–8 pp.1336–1340.

The API serves BFP Proposition 6.2 (Recovers moduli counts by dividing by quadric automorphisms.); BFP Propositions8.1–8.8 (Defines the families whose signed singular-point counts are computed.).

| Declaration | Contract |
| --- | --- |
| `QuadricIncidence.forget` | V_n maps to the unmarked equation space by forgetting the ordered incidence points. |
| `QuadricIncidence.distinct` | Incidence points are pairwise distinct; being singular is allowed until smooth-fibre selection. |
| `QuadricIncidence.quadric` | The type is cone, nonsplit smooth or split smooth over F_q. |
| `QuadricIncidence.dimension` | A marked point generically imposes one linear equation on the cubic section. |
| `QuadricIncidence.membership` | A geometric point consists of an allowed cubic equation class and an ordered tuple of pairwise distinct points of its zero curve; singular or nonreduced zero curves are permitted at the incidence stage. |

**Checks.**

- The unmarked cone space has q15 rational points; smooth quadrics have p15=1+q+…+q15.
- A cubic through the cone vertex is excluded from the cone model.
- A double component can be a sieve fibre; excluding it before the sieve loses cancellation.

<a id="TC7-quadric-orbit-count"></a>

### Counting genus-four curves by their quadric

For every q and n≤3, the nonhyperelliptic moduli count is the sum over the three types of N^type_n(q)/a_type(q), where N counts smooth fibres in V^type_n. The automorphism orders are a_con=q7−q6−q5+q4, a_nsp=2(q6−q2), a_spl=2(q3−q)^2.

The target is `TC.7/quadric-orbit-count`. Use canonical embeddings and the PGL4 orbit-stabilizer formula with stack weights. Classify the quadric orbit stabilizers, including the disconnected factor of order2 on the smooth quadrics; connected-group division is not misapplied directly to those disconnected stabilizers.

Builds on [TC.7/quadric-incidence](#TC7-quadric-incidence), `WeilConjectures:WC.1/stack-count-comparison`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Propositions6.1–6.2 and equation(6) pp.1334–1336.

**Check.** All denominators are nonzero for prime powers q≥2. The split automorphism group includes exchange of the two rulings.

<a id="TC7-nonreduced-sieve-bounds"></a>

### Nonreduced fibres and terminating sieve bounds

For the cone incidence, the reduced singular locus of a nonreduced fibre is P1 and has even Betti sum2, hence its signed coefficients vanish in degrees≥3. On Q_nsp the singular locus is a(1,1) curve, possibly with an isolated point, with even Betti sum≤4; on Q_spl it is a ruling or(1,1) curve, possibly with points, with even Betti sum≤5. Apply these to the finite inverse-zeta sieve; smooth fibres contribute1 and nonempty singular loci contribute0 in the full sum.

The target is `TC.7/nonreduced-sieve-bounds`. Classify nonreduced(3,3) divisors and cone cubics; compute the cohomology of each reduced singular locus. Nilpotent thickenings do not change the l-adic point-count/cohomology input. Distinguish coefficient vanishing above the Betti sum from the total cancellation at t=1.

Builds on [TC.7/quadric-incidence](#TC7-quadric-incidence), `WeilConjectures:WC.1/hasse-weil-sieve-for-curve-families`, `WeilConjectures:WC.1/inverse-zeta-even-cohomology-termination`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Examples7.7–7.9 pp.1338–1340.

**Check.** For P1, inverse zeta=(1−t)(1−qt), degree 2; its t2 coefficient is q and need not vanish.

<a id="TC7-quadric-inverse-zeta"></a>

### Inverse zeta functions for the three quadric types

For X=Q_con minus its vertex, Z_X(t)^−1=(1−qt)(1−q²t). For Q_nsp it is(1−t)(1−qt)(1+qt)(1−q²t); for Q_spl it is(1−t)(1−qt)^2(1−q²t). Signed configuration coefficients use one minus sign per Frobenius orbit, not per geometric point.

The target is `TC.7/quadric-inverse-zeta`. Compute point counts over each extension, noting that the nonsplit rulings are exchanged over odd extensions and split over even ones. Take the inverse exponential and compare coefficients.

Builds on [TC.7/quadric-incidence](#TC7-quadric-incidence), `WeilConjectures:WC.1/inverse-zeta-configuration-formula`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §8.1 p.1340, §8.2 p.1343, §8.3 p.1345.

**Check.** s2(Q_nsp)=0. s3(Q_spl)=−q4−2q3−q². A single degree-two orbit contributes−t², whereas two rational points contribute+t².

<a id="TC7-cone-sieve"></a>

### Cone sieve coefficients

For 0≤n, d≤3 the signed sieve coefficient S_d(C^cone_n) is the polynomial in the attached table, with p_r=1+q+…+q^r and qj meaning q^j. For the split marked rows, displayed S2, S3 and the n=3 S1 are their degree≥6 polynomial part with error o(q6) as q grows through prime powers; unmarked rows and the other marked S0, S1 formulas are exact. Cone and nonsplit tables are exact.

The target is `TC.7/cone-sieve`. Stratify configurations by singular/marked coincidences and dependence of imposed linear conditions. A singular point imposes3 and a distinct marking1; a marking which is singular adds only2. Separate rulings, collinear triples and coplanar points. Cancel the dependent ruling configurations using inverse-zeta coefficients, including s3(P1)=0. Count each remaining affine or projective equation kernel.

Builds on [TC.7/quadric-inverse-zeta](#TC7-quadric-inverse-zeta), [TC.7/nonreduced-sieve-bounds](#TC7-nonreduced-sieve-bounds), [TC.7/quadric-incidence](#TC7-quadric-incidence). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Propositions8.1–8.2 pp.1341–1343.

**Check.** The cone unmarked sum through d=3 is q15−q14−q13+q12. The nonsplit unmarked S2 is zero, whereas split S2 is not. The table gives a coefficient result with its error cutoff, not an exact smooth-fibre count.

In this and the twisted table, p_r=1+q+⋯+q^r; a token q17 means q^17. Rows index n and columns index d. Exactness and truncation are as specified in the target.

| n | S0 | S1 | S2 | S3 |
| --- | --- | --- | --- | --- |
| 0 | q15 | -q14-q13 | q12 | 0 |
| 1 | q16+q15 | -q15-3q14-q13+q12 | 2q13+q12-q11 | 0 |
| 2 | q17+2q16-q14 | -q16-5q15-3q14+3q13+2q12 | 3q14+4q13-3q12-3q11+q10 | -q12+q11+q10-q9 |
| 3 | q18+3q17-5q15-q14+2q13 | -q17-7q16-6q15+12q14+7q13-5q12 | 4q15+9q14-10q13-9q12+6q11 | -3q13+5q12-5q11+7q10+2q9-12q8+6q7 |

<a id="TC7-nonsplit-sieve"></a>

### Nonsplit-quadric sieve coefficients

For 0≤n, d≤3 the signed sieve coefficient S_d(C^nonsplit_n) is the polynomial in the attached table, with p_r=1+q+…+q^r and qj meaning q^j. For the split marked rows, displayed S2, S3 and the n=3 S1 are their degree≥6 polynomial part with error o(q6) as q grows through prime powers; unmarked rows and the other marked S0, S1 formulas are exact. Cone and nonsplit tables are exact.

The target is `TC.7/nonsplit-sieve`. Stratify configurations by singular/marked coincidences and dependence of imposed linear conditions. A singular point imposes3 and a distinct marking1; a marking which is singular adds only2. Separate rulings, collinear triples and coplanar points. Cancel the dependent ruling configurations using inverse-zeta coefficients, including s3(P1)=0. Count each remaining affine or projective equation kernel.

Builds on [TC.7/quadric-inverse-zeta](#TC7-quadric-inverse-zeta), [TC.7/nonreduced-sieve-bounds](#TC7-nonreduced-sieve-bounds), [TC.7/quadric-incidence](#TC7-quadric-incidence). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Propositions8.4–8.5 pp.1343–1344.

**Check.** The cone unmarked sum through d=3 is q15−q14−q13+q12. The nonsplit unmarked S2 is zero, whereas split S2 is not. The table gives a coefficient result with its error cutoff, not an exact smooth-fibre count.

In this and the twisted table, p_r=1+q+⋯+q^r; a token q17 means q^17. Rows index n and columns index d. Exactness and truncation are as specified in the target.

| n | S0 | S1 | S2 | S3 |
| --- | --- | --- | --- | --- |
| 0 | p15 | (-q2-1)p12 | 0 | (q4+q2)p6 |
| 1 | (q2+1)p14 | -(q4+q2)p11-(q2+1)p12 | q13+q11 | (q6+q4)p5+(q4+q2)p6 |
| 2 | (q4+q2)p13 | (-q6+q2)p10-2(q4+q2)p11 | 2q14+q13+q12+q11-q10 | 3q11+3q10+5q9+5q8+3q7+3q6+q5+q4 |
| 3 | (q6-q2)p12 | (-q8+2q6+q4-2q2)p9-3(q6-q2)p10 | 3(q15+q14-q13-q11-q10+q9) | -2q13+6q12+2q11+2q10+3q9-5q8-2q7-2q6-q5-q4 |

<a id="TC7-split-sieve"></a>

### Split-quadric sieve coefficients

For 0≤n, d≤3 the signed sieve coefficient S_d(C^split_n) is the polynomial in the attached table, with p_r=1+q+…+q^r and qj meaning q^j. For the split marked rows, displayed S2, S3 and the n=3 S1 are their degree≥6 polynomial part with error o(q6) as q grows through prime powers; unmarked rows and the other marked S0, S1 formulas are exact. Cone and nonsplit tables are exact.

The target is `TC.7/split-sieve`. Stratify configurations by singular/marked coincidences and dependence of imposed linear conditions. A singular point imposes3 and a distinct marking1; a marking which is singular adds only2. Separate rulings, collinear triples and coplanar points. Cancel the dependent ruling configurations using inverse-zeta coefficients, including s3(P1)=0. Count each remaining affine or projective equation kernel.

Builds on [TC.7/quadric-inverse-zeta](#TC7-quadric-inverse-zeta), [TC.7/nonreduced-sieve-bounds](#TC7-nonreduced-sieve-bounds), [TC.7/quadric-incidence](#TC7-quadric-incidence). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Propositions8.6–8.7 pp.1345–1346.

**Check.** The cone unmarked sum through d=3 is q15−q14−q13+q12. The nonsplit unmarked S2 is zero, whereas split S2 is not. The table gives a coefficient result with its error cutoff, not an exact smooth-fibre count.

In this and the twisted table, p_r=1+q+⋯+q^r; a token q17 means q^17. Rows index n and columns index d. Exactness and truncation are as specified in the target.

| n | S0 | S1 | S2 | S3 |
| --- | --- | --- | --- | --- |
| 0 | p15 | (-q2-2q-1)p12 | 2(q3+q2+q)p9 | (-q4-2q3-q2)p6 |
| 1 | (q+1)^2p14 | -(q+1)^2((q2+2q)p11+p12) | 3q13+12q12+21q11+24q10+24q9+24q8+24q7+24q6 | -3q11-10q10-15q9-16q8-16q7-16q6 |
| 2 | (q+1)^2(q2+2q)p13 | -(q+1)^2(q2+2q)((q2+2q-1)p10+2p11) | 4q14+27q13+61q12+75q11+73q10+72q9+72q8+72q7+70q6 | -10q12-31q11-45q10-49q9-49q8-47q7-41q6 |
| 3 | (q+1)^2(q2+2q)(q2+2q-1)p12 | -q17-12q16-54q15-106q14-117q13-102q12-96q11-96q10-96q9-96q8-95q7-87q6 | 5q15+53q14+151q13+190q12+153q11+141q10+147q9+142q8+128q7+90q6 | -30q13-96q12-116q11-94q10-97q9-93q8-62q7-24q6 |

<a id="TC7-sieve-tail"></a>

### Bounds for four or more singularities

For each type and 0≤n≤2, sum_(d≥4) S_d(C^type_n)/a_type=o(q^((9+n)/2)). For n=3 it is B_type q6+o(q6) with B_type an integer. The same statements hold for the nontrivial marking twists used in TC.8.

The target is `TC.7/sieve-tail`. Bound nonreduced strata by dimensions and inverse-zeta termination. For reduced(3,3) divisors classify high-singularity decompositions: (2,1)+(1,2), singular(2,2)+(1,1), (3,2)+(0,1), and(2,2)+(1,0)+(0,1). Track four-point general-position and ruling exceptions, using genus-one counts with 4–7 marks for the last family. Record the integer leading coefficient rather than asserting the entire tail vanishes.

Builds on [TC.7/nonreduced-sieve-bounds](#TC7-nonreduced-sieve-bounds), [TC.7/quadric-orbit-count](#TC7-quadric-orbit-count), [TC.7/quadric-inverse-zeta](#TC7-quadric-inverse-zeta). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Proposition 8.8 pp.1346–1350; §11.2 p.1357.

**Check.** n=3 leaves an unknown integral middle coefficient; discarding it would force the wrong genus-four Betti number.

<a id="TC7-four-point-signed-count"></a>

### Signed four-point general-position count

On P1×P1 over F_q, the signed Frobenius-stable degree-four configuration count with no two points on a ruling and not all on an irreducible(1,1) curve equals(q+1)^2 q²(q−1)^2=#(PGL2×PGL2)(F_q). The sign is(−1)^number-of-Frobenius-orbits; this is not the count of ordered four-tuples.

The target is `TC.7/four-point-signed-count`. Subtract ruling and(1,1)-curve configurations from the inverse-zeta coefficient. Independently evaluate the five Frobenius orbit types with their class-size denominators; the resulting polynomial identity gives the same answer.

Builds on [TC.7/quadric-inverse-zeta](#TC7-quadric-inverse-zeta). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §8.4 and Remark 8.11 pp.1348–1351.

**Check.** At q=2 the result is36. The denominator24 in the split orbit-type contribution reflects unordered configurations; do not multiply every term by 4!.

## TC.8. Equivariant realizations and the graph transform

Twisting markings extracts symmetric-group characters. Ordinary open-stratum assembly has Koszul automorphism signs; the edge-orientation determinant belongs to the separate normalized-closed-strata weight complex.

Atlas planets: Marking twists; Equivariant weight Euler characteristic; Stable-graph transform; Getzler–Kapranov formula.

<a id="TC8-curve-marking-twists"></a>

### Twists by permutations of markings

For a partition lambda of n, choose sigma of that cycle type and descend M_g, n, Fbar_q with geometric Frobenius sigma F_q to M_g, lambda. Its rational objects are curves with ordered geometric marks permuted in the chosen cycles. Define compact and hyperelliptic twists with the same convention. Stack descent retains automorphisms and its trace comparison must be proved; a groupoid cannot be replaced by its set of isomorphism classes.

The target is `TC.8/curve-marking-twists`. Use finite-order descent of the moduli pseudofunctor and its marking action. Compare cohomology with sigma F_q. The finite smooth-cover presentation used in BFP requires a compatible action lift; G-stack-comparisons records the stronger presentation/comparison contract.

Builds on `StableReductionPartII:key/moduli-curves`, `WeilConjectures:WC.1/stack-count-comparison`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §9.1 pp.1351–1352; §11 pp.1356–1357.

The API serves BFP Theorem 11.1 (Determines symmetric-group character values.); BFP Proposition 9.6 (Feeds vertex permutations into boundary graph counts.).

| Declaration | Contract |
| --- | --- |
| `CurveMarkingTwists.cycle_type` | Conjugate permutations give isomorphic twists and equal masses. |
| `CurveMarkingTwists.trace` | The twisted mass is the alternating compact-support trace of sigma F_q. |
| `CurveMarkingTwists.identity` | The identity twist is ordinary ordered marked moduli. |
| `CurveMarkingTwists.forget` | Forgetting a union of Frobenius cycles descends the appropriate forgetful morphism. |
| `CurveMarkingTwists.conjugacy` | Conjugating sigma by a marking permutation gives an isomorphism of twists, compatible with compact-support traces and preserving groupoid mass. |

**Checks.**

- lambda=(1,1) gives two distinct rational marks.
- lambda=(2) gives one degree-two orbit of two distinct geometric points.
- A fixed mark and a conjugate pair is type(2,1), not three independent rational marks.

<a id="TC8-weight-euler-characteristic"></a>

### Weight-graded equivariant Euler characteristic

For an S_n-variety or admissible DM stack over C define e_c^(S_n)(X)=sum_(i, w)(−1)^i[Gr_w^W H_c^i(X)] in the Grothendieck ring of rational realizations with S_n action. When every contributing weight piece is Tate, write it as sum_j a_j L^j with a_j virtual rational S_n-representations. No positivity or individual purity is asserted for an open stack.

The target is `TC.8/weight-euler-characteristic`. Form finite alternating sums using bounded cohomology and weight strictness. Use exact-sequence additivity and Künneth; under a Tate realization identify coefficients with the imported representation ring and fixed-degree Frobenius characteristic.

Builds on `tauceti:TauCeti.repRing`, `tauceti:TauCeti.repRingCharacter`, `DeligneWeightsAndPurity:DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`, `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §9 pp.1351–1354 and Remark 1.6 p.1326.

The API serves BFP Theorem 11.1 (Records the open equivariant polynomial.); BFP Theorem 11.5 (Extracts local-system Euler characteristics.).

| Declaration | Contract |
| --- | --- |
| `WeightEulerCharacteristic.additive` | For a stable open/closed decomposition, e_c(X)=e_c(U)+e_c(Z). |
| `WeightEulerCharacteristic.product` | e_c of a product is the tensor product, with cohomological Koszul signs. |
| `WeightEulerCharacteristic.identity` | Character evaluation at the identity recovers the nonequivariant weight Euler polynomial. |
| `WeightEulerCharacteristic.specialize` | L→q with Adams psi_r(q)=q^r gives the point-count realization when trace and integrality hypotheses hold. |
| `WeightEulerCharacteristic.coefficient` | The coefficient at realization weight w is the alternating sum of Gr_w^W H_c^i as a virtual group representation; it is not ordinary H^i for a nonproper space. |

**Checks.**

- e_c(A1)=L.
- e_c(G_m)=L−1, so coefficients need not be nonnegative.
- For the S3 standard representation coefficient, evaluation at the identity multiplies it by 2.

<a id="TC8-stable-graph-transform"></a>

### The stable-graph transform

For a stable collection V(g, n) of graded characteristic-zero S_n-representations, zero when2g−2+n≤0, define MV(g, n)=direct sum over connected stable graphs of total(g, n) of (tensor_v V(g_v, n_v))_(AutGamma). Automorphisms act by flag permutations and cohomological Koszul signs. There is no extra det(edge) twist in this ordinary free modular transform.

The target is `TC.8/stable-graph-transform`. Enumerate finite stable graph types in fixed(g, n), tensor the vertex representations, and take finite coinvariants, equivalent to invariants in characteristic zero. This construction is specific to the boundary assembly; the completed symmetric-function carrier remains with its designated supplier.

Builds on `StableReductionPartII:MC.7/consumer-clp`, [TC.0/induction-order](#TC0-induction-order), `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk`. Source: [Ezra Getzler; Mikhail Kapranov](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/F104F3BA8ACC4FBC07F93AC93787BA88/S0010437X98000050a.pdf/modular-operads.pdf), GK §2, recalled in §8.13 pp.110–111; BFP Proposition 9.6 p.1354.

The API serves BFP Proposition 9.6 (Computes boundary Euler/count coefficients.); CLP Lemma 7.3 (Supplies genus-two multiplicity calculations after realization.).

| Declaration | Contract |
| --- | --- |
| `StableGraphTransform.corolla` | The zero-edge corolla summand is V(g, n). |
| `StableGraphTransform.boundary` | MV−V sums exactly the positive-edge connected stable graphs. |
| `StableGraphTransform.relabel` | Relabelling external legs defines the S_n action. |
| `StableGraphTransform.genus` | The genus is sum of vertex genera plus b1 of the connected graph. |
| `StableGraphTransform.universal` | A map of stable collections from V to the underlying collection of a modular operad extends uniquely to a morphism from the free modular operad MV, respecting flag permutations and contractions. |

**Checks.**

- A one-vertex loop raises total genus by 1 and consumes two flags.
- A separating one-edge graph has total genus equal to the sum of its two vertex genera.
- A two-edge graph with an edge swap has ordinary finite invariants here; its det(edge) sign belongs instead to the normalized-closed-strata weight complex.

<a id="TC8-getzler-kapranov"></a>

### Getzler–Kapranov boundary-character formula

In the completed stable symmetric-function ring with filtration degree(p_i)=i, degree(h)=2 and Adams psi_r(h)=h^r, put Ch(V)=sum h^(g−1) ch(V(g, n)). Let Delta=sum_(r≥1) h^r[(r/2)∂²/∂p_r²+∂/∂p_(2r)]. Then Ch(MV)=Log(exp(Delta) Exp(Ch(V))). Here exp(Delta) is the ordinary operator exponential; Exp and Log are inverse plethystic operations. For point counts psi_r(q)=q^r. Positive-edge terms are Ch(MV)−Ch(V).

The target is `TC.8/getzler-kapranov`. Exp makes unordered vertex collections; exp(Delta) joins pairs of flags, with the symmetric edge factor1/2 and the p_(2r) term for exchanged endpoints; Log selects connected graphs. Euler’s graph formula yields the h exponent. The missing completed lambda-ring and Exp/Log interfaces are recorded in G-symmetric-functions.

Builds on [TC.8/stable-graph-transform](#TC8-stable-graph-transform), [TC.8/weight-euler-characteristic](#TC8-weight-euler-characteristic). Source: [Ezra Getzler; Mikhail Kapranov](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/F104F3BA8ACC4FBC07F93AC93787BA88/S0010437X98000050a.pdf/modular-operads.pdf), GK §§8.1–8.13 pp.107–111; BFP Proposition 9.6 p.1354.

**Check.** Delta(p1²)=h; Delta(p2)=h, fixing both coefficient terms. Use Theorem 8.13, not the misprinted8.3 in BFP’s section opening.

<a id="TC8-polynomial-induction"></a>

### Polynomial counts of open moduli and boundary

If all compact Mbar_g′, n′ for(g′, n′)≼(g, n) have polynomial point counts over every finite field, then the Frobenius eigenvalues on H_c*(M_g, n) are integral powers of q; the open and boundary stacks have polynomial counts, and their equivariant weight Euler polynomials give the corresponding twisted counts. Do not infer semisimplicity of open Frobenius from eigenvalues.

The target is `TC.8/polynomial-induction`. Use the oriented normalized-closed-strata weight spectral sequence to control eigenvalues. Separately use open-stratum graph additivity to count the boundary. Smooth proper all-Z polynomial counts give integral actual Betti representation coefficients; arbitrary finite-field class functions do not automatically lie in the integral representation ring.

Builds on [TC.8/curve-marking-twists](#TC8-curve-marking-twists), [TC.8/weight-euler-characteristic](#TC8-weight-euler-characteristic), [TC.8/getzler-kapranov](#TC8-getzler-kapranov), `DeligneWeightsAndPurity:DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`, `WeilConjectures:WC.4/equivariant-polynomial-point-counts`, `WeilConjectures:WC.6/purity-for-smooth-proper-dm-stacks`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Proposition 4.2 pp.1331–1332; Corollary 9.5 p.1353.

**Check.** The edge-orientation sign appears in the spectral sequence but not in the ordinary open-stratum GK sum.

<a id="TC8-genus-four-euler"></a>

### The genus-four Euler-characteristic normalization

The ordinary Euler characteristic chi(M4,3)=−10. Equivariantly chi^(S3)(M4,3)=2s_(3)−6s_(2,1), with sign coefficient0. These are cohomological Euler characteristics of the moduli stack/coarse space with rational coefficients, not orbifold Euler mass.

The target is `TC.8/genus-four-euler`. Evaluate Gorsky’s finite automorphism-orbit formula at genus4 using h=1−(sum_j k_j)/2, as required by its Riemann–Hurwitz identity, and modulus r throughout the finite congruence count. These preprint typos are independently checked and already discussed by Kannan Remark3.8. An exact 25-term rational calculation gives the degree-three power-sum expression −5p1^3/3+p1p2+8p3/3, hence Schur coefficients (2,−6,0). The independent review records every nonzero coefficient and the bounded enumeration. Published-source collation and formal certification remain open in G-computations; this arithmetic check does not prove the geometric orbit formula.

Builds on [TC.8/weight-euler-characteristic](#TC8-weight-euler-characteristic). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §10.1 p.1355 and §11.3 p.1361; [Eugene Gorsky](https://arxiv.org/pdf/0906.0841), arXiv v3 Proposition3.1 equation(3) p.4; Theorem3.8 p.6, corrected as E15–E16.

**Check.** At the identity2−6·2=−10. The ordinary value alone cannot distinguish both S3 Schur coefficients.

<a id="TC8-hyperelliptic-equivariant"></a>

### Equivariant hyperelliptic genus-four counts

For every q, #^(S2)H4,2=(q9+q8−1)s2+q8 s_(1,1); #^(S3)H4,3=(q10+q9−q8−q)s3+(q9−q)s_(2,1), with zero sign coefficient.

The target is `TC.8/hyperelliptic-equivariant`. Apply the low-marking equivariant hyperelliptic configuration counts of Bergström to the three cycle types and invert the S2/S3 character tables. Characteristic-two verification is retained in the primary-source gap.

Builds on [TC.7/hyperelliptic-marked-counts](#TC7-hyperelliptic-marked-counts), [TC.8/curve-marking-twists](#TC8-curve-marking-twists), [TC.8/weight-euler-characteristic](#TC8-weight-euler-characteristic). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP §11.1 p.1357.

**Check.** Identity character evaluation agrees with the n=2,3 ordinary hyperelliptic polynomials.

<a id="TC8-twisted-sieve"></a>

### Sieve coefficients for nontrivial marking twists

For marking cycle types(2),(2,1),(3), the attached cone, nonsplit and split tables give S_d for 0≤d≤3. Cone entries are exact; nonsplit and split entries are specified modulo o(q6), with unshown coefficients below degree 6. For the nonsplit(3) S0 the full exact expression is(q6−q²)p12 and its degree≥6 part is q18+q17+q16+q15. For split S0 rows the exact expressions are obtained from ordered cycle-type incidence; the displayed polynomials retain all nonzero degree≥6 terms. Here p_r=sum_(i=0)^r q^i.

The target is `TC.8/twisted-sieve`. Enumerate marked Frobenius orbit types and singular coincidences in the equation kernels, keeping the quadric ruling involution for nonsplit quadrics. In the(3) cases cancellation of three collinear conjugate points requires its own incidence count; do not replace q by q3 in the ordinary table.

Builds on [TC.8/curve-marking-twists](#TC8-curve-marking-twists), [TC.7/quadric-incidence](#TC7-quadric-incidence), [TC.7/quadric-inverse-zeta](#TC7-quadric-inverse-zeta), [TC.7/sieve-tail](#TC7-sieve-tail). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Propositions11.2–11.4 pp.1357–1360.

**Check.** A(2) marking has no rational individually fixed point. The cone(3) S2 is q15−q13, whereas the nonsplit(3) S2 is0.

Cone marking-twist coefficients:

| Cycle type | S0 | S1 | S2 | S3 |
| --- | --- | --- | --- | --- |
| (2) | q17-q14 | -q16-q15+q14+q13 | q14-2q13+q12+q11-q10 | q12-q11-q10+q9 |
| (2,1) | q18+q17-q15-q14 | -q17-3q16+4q14+q13-q12 | 2q15-q14-4q13+3q12+2q11-2q10 | q13+q12-5q11+q10+4q9-2q8 |
| (3) | q18+q15-q14-q13 | -q17-q16+q13+q12 | q15-q13 | -q12+q11+q10-q9 |

Nonsplit marking-twist coefficients:

| Cycle type | S0 | S1 | S2 | S3 |
| --- | --- | --- | --- | --- |
| (2) | (q4+q2)p13 | -(q2+1)(q4+q2)p10 | -q13-q12-q11-q10 | 4q12+3q11+5q10+5q9+3q8+3q7+3q6 |
| (2,1) | (q2+1)(q4+q2)p12 | -(q2+1)(q4+q2)p10-(q2+1)(q6+q4)p9 | q15-q14+q13-2q12-q11-q10-q9 | 4q13+6q12+8q11+10q10+7q9+7q8+4q7+4q6 |
| (3) | q18+q17+q16+q15 | -q17-q16-2q15-2q14-q13-q12+q7+q6 | 0 | q13+2q11+2q10+q8-2q7-2q6 |

Split marking-twist coefficients:

| Cycle type | S0 | S1 | S2 | S3 |
| --- | --- | --- | --- | --- |
| (2) | q17+q16+2q15 | -q16-3q15-5q14-5q13-2q12 | 2q14+5q13+11q12+5q11+q10-2q6 | -2q12-7q11-7q10-q9+q8+q7+3q6 |
| (2,1) | q18+3q17+5q16+5q15+2q14 | -q17-6q16-16q15-22q14-15q13-4q12+q7+5q6 | 3q15+17q14+35q13+32q12+11q11-q10-q9-2q8-8q7-18q6 | -8q13-24q12-26q11-10q10+3q9+7q8+12q7+18q6 |
| (3) | q18+q17+q16+3q15+2q14 | -q17-3q16-6q15-10q14-9q13-3q12+q7+3q6 | 2q15+8q14+16q13+16q12+6q11-2q8-4q7-6q6 | -3q13-12q12-14q11-4q10+2q9+3q8+4q7+6q6 |

## TC.9. Genus-four counts and odd vanishing

The count calculation recovers actual compact Betti multiplicities only after the smooth proper all-Z recognition hypotheses are verified. Open coefficients are virtual and can be negative.

Atlas planets: Genus-four boundary counts; Compact genus-four point counts; Smooth genus-four point counts; Odd vanishing through degree nine; Equivariant genus-four counts.

<a id="TC9-genus-four-cutoff"></a>

### The genus-four approximate-count cutoff

For 0≤n≤3, if #Mbar_4, n(F_(p^m))=P(p^m)+o(p^(m(9+2n)/2)) for a fixed prime p and polynomial P, then H9(Mbar_4, n)=0. Here d=9+n and s=9+2n; duality turns the high-odd vanishing k≥s into low-odd vanishing k≤9. An integral approximation with smaller error o(q^((9+n)/2)) supplies the exact-polynomial recognition input for smooth proper all-Z moduli.

The target is `TC.9/genus-four-cutoff`. Apply the local cutoff with the displayed s, d, then Poincaré duality. Restrict its immediate conclusion to genus4; pass to all genera only after odd induction. Use the stronger count-recognition theorem, not the local cutoff alone, for global exactness.

Builds on `WeilConjectures:WC.5/local-polynomial-count-cutoff`, [TC.0/boundary-exactness](#TC0-boundary-exactness), `StableReductionPartII:key/moduli-curves`, `WeilConjectures:WC.5/approximate-counts-and-tate-semisimplification`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Corollary 3.2 p.1330, corrected genus4 indices; §10.1 p.1355.

**Check.** At n=3 the cutoff exponent is15/2, whereas the full polynomial calculation needs the sharper q6 remainder.

<a id="TC9-genus-four-boundary-counts"></a>

### Genus-four boundary point counts

For 0≤n≤3 and every q, #boundary M4, n is the polynomial with ascending coefficient list in the attached table. Its degree is8+n. Coefficients come from ordinary open boundary strata with their finite graph automorphism quotients.

The target is `TC.9/genus-four-boundary-counts`. Compute the coefficient h3 in the stable-graph transform through n=3. Determine n=0,1 from lower genus, then use the already recovered open M4,1 to calculate boundary M4,2, and open M4,2 for boundary M4,3. The only genus4 valence2 graph in the last step has trivial automorphisms, so no S2-equivariant unknown is required. A finite reproducible substitute for the Maple/SF output is G-computations.

Builds on [TC.8/getzler-kapranov](#TC8-getzler-kapranov), [TC.1/lower-polynomial-counts](#TC1-lower-polynomial-counts), [TC.8/polynomial-induction](#TC8-polynomial-induction). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Proposition 9.6 pp.1353–1354.

**Check.** The n=3 constant coefficient is2, and its q6 coefficient10606 differs by 1 from the closed coefficient. The computational order is boundary0→closed0/open0, boundary1→closed1/open1→boundary2→closed2/open2→boundary3.

The following rows give the entire polynomial, independently of the sieve truncation tables.

| n | Polynomial |
| --- | --- |
| 0 | 1 + 4q + 13q^2 + 32q^3 + 50q^4 + 50q^5 + 33q^6 + 12q^7 + 3q^8 |
| 1 | 1 + 6q + 31q^2 + 93q^3 + 191q^4 + 240q^5 + 192q^6 + 94q^7 + 28q^8 + 4q^9 |
| 2 | 1 + 11q + 78q^2 + 321q^3 + 838q^4 + 1362q^5 + 1362q^6 + 842q^7 + 321q^8 + 72q^9 + 8q^10 |
| 3 | 2 + 19q + 205q^2 + 1179q^3 + 3977q^4 + 8296q^5 + 10606q^6 + 8292q^7 + 3990q^8 + 1172q^9 + 200q^10 + 17q^11 |

<a id="TC9-genus-four-closed-counts"></a>

### Polynomial counts of compact genus-four moduli

For 0≤n≤3 and every finite field, #Mbar_4, n(F_q) is the polynomial with ascending integer coefficient list in the attached table. It has degree d=9+n, nonnegative coefficients and symmetry a_i=a_(d−i). The n=3 middle coefficient is10605.

The target is `TC.9/genus-four-closed-counts`. Divide the three smooth incidence approximations by the automorphism orders, add hyperelliptic and boundary contributions, and recognize a polynomial by the all-Z count theorem with its extra DM inputs. Palindromicity supplies lower coefficients. For n=3 retain Bq6; chi(M4,3)=−10 fixes B=10605.

Builds on [TC.7/cone-sieve](#TC7-cone-sieve), [TC.7/nonsplit-sieve](#TC7-nonsplit-sieve), [TC.7/split-sieve](#TC7-split-sieve), [TC.7/sieve-tail](#TC7-sieve-tail), [TC.7/quadric-orbit-count](#TC7-quadric-orbit-count), [TC.7/hyperelliptic-marked-counts](#TC7-hyperelliptic-marked-counts), [TC.9/genus-four-boundary-counts](#TC9-genus-four-boundary-counts), [TC.8/genus-four-euler](#TC8-genus-four-euler), `WeilConjectures:WC.5/polynomial-counts-over-z-and-tate-cohomology`, `WeilConjectures:WC.5/approximate-counts-and-tate-semisimplification`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Theorem 1.4 p.1325; §10.1 p.1355.

**Check.** n=0 has coefficients1,4,13,32,50,50,32,13,4,1. n=3 coefficient10605 is fixed by an independent Euler characteristic, not by palindromicity alone.

The following rows give the entire polynomial, independently of the sieve truncation tables.

| n | Polynomial |
| --- | --- |
| 0 | 1 + 4q + 13q^2 + 32q^3 + 50q^4 + 50q^5 + 32q^6 + 13q^7 + 4q^8 + q^9 |
| 1 | 1 + 6q + 30q^2 + 93q^3 + 191q^4 + 240q^5 + 191q^6 + 93q^7 + 30q^8 + 6q^9 + q^10 |
| 2 | 1 + 11q + 76q^2 + 319q^3 + 838q^4 + 1362q^5 + 1362q^6 + 838q^7 + 319q^8 + 76q^9 + 11q^10 + q^11 |
| 3 | 1 + 21q + 207q^2 + 1168q^3 + 3977q^4 + 8296q^5 + 10605q^6 + 8296q^7 + 3977q^8 + 1168q^9 + 207q^10 + 21q^11 + q^12 |

<a id="TC9-genus-four-open-counts"></a>

### Polynomial counts of smooth genus-four moduli

For 0≤n≤3 and every q, #M4, n(F_q) is the polynomial with ascending coefficient list in the attached table. It is the difference of closed and boundary polynomials. In particular the n=3 q3 coefficient is−11, correcting the q4 misprint in §10.1.

The target is `TC.9/genus-four-open-counts`. Subtract the exact boundary coefficient table term by term. As a second test evaluate the n=3 polynomial at 1 and obtain−10.

Builds on [TC.9/genus-four-closed-counts](#TC9-genus-four-closed-counts), [TC.9/genus-four-boundary-counts](#TC9-genus-four-boundary-counts). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Theorem 1.5 p.1326; §10.1 p.1355.

**Check.** The n=0 polynomial is q9+q8+q7−q6. Open coefficients may be negative; they represent a virtual weight Euler characteristic.

The following rows give the entire polynomial, independently of the sieve truncation tables.

| n | Polynomial |
| --- | --- |
| 0 | −q^6 + q^7 + q^8 + q^9 |
| 1 | −q^2 − q^6 − q^7 + 2q^8 + 2q^9 + q^10 |
| 2 | −2q^2 − 2q^3 − 4q^7 − 2q^8 + 4q^9 + 3q^10 + q^11 |
| 3 | −1 + 2q + 2q^2 − 11q^3 − q^6 + 4q^7 − 13q^8 − 4q^9 + 7q^10 + 4q^11 + q^12 |

<a id="TC9-genus-four-tate"></a>

### Pure Tate cohomology in the compact genus-four range

For n≤3, odd cohomology of Mbar_4, n vanishes and H^(2j) is a direct sum of a_(n, j) copies of L^j, with a_(n, j) the closed-count coefficient. This holds for rational Hodge structures and as actual G_Q-representations after the full all-Z comparison inputs. For the open stacks the displayed polynomials describe only the alternating compact-support realization class.

The target is `TC.9/genus-four-tate`. Apply exact polynomial-count recognition to the smooth proper all-Z moduli stack; then its p-adic de Rham/Hodge comparison identifies Hodge type(j, j). The required stack extension and comparison are stated in G-stack-comparisons; a single finite-field characteristic polynomial would not prove an actual global splitting.

Builds on [TC.9/genus-four-closed-counts](#TC9-genus-four-closed-counts), `WeilConjectures:WC.5/polynomial-counts-over-z-and-tate-cohomology`, `WeilConjectures:WC.6/purity-for-smooth-proper-dm-stacks`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Remark 1.6 p.1326 and §3 p.1330.

**Check.** H12(Mbar_4,3) has dimension 10605 and type(6,6).

<a id="TC9-odd-nine"></a>

### Odd cohomology vanishes through degree nine

For all stable pairs H^k(Mbar_g, n)=0 for odd k≤9. The cutoff is sharp uniformly in(g, n), because dim H11(Mbar_1,11)=2.

The target is `TC.9/odd-nine`. The remaining finite degree 9 bases are genus4 with n≤3. Apply their polynomial-count vanishing and the compact-support/boundary induction. Preserve the separate top-vcd vanishing input that reduces the finite base list.

Builds on [TC.9/genus-four-tate](#TC9-genus-four-tate), [TC.1/odd-seven](#TC1-odd-seven), [TC.1/odd-induction](#TC1-odd-induction), [TC.0/cusp-moduli-identification](#TC0-cusp-moduli-identification), [TC.1/low-genus-odd-nine](#TC1-low-genus-odd-nine). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Theorem 1.1 p.1324; §2 pp.1328–1329.

**Check.** The assertion concerns all stable genera and marks, while Corollary 3.2 alone concerns only genus4.

<a id="TC9-genus-four-equivariant-counts"></a>

### Symmetric-group equivariant genus-four counts

For n=2,3 the compact and open equivariant count polynomials are the Schur coefficient lists attached here, in ascending powers of q. For n=2 the basis is s2, s11, dimensions1,1; for n=3 it is s3, s21, s111, dimensions1,2,1. Compact coefficients are actual Betti representation classes, open coefficients virtual weight Euler classes.

The target is `TC.9/genus-four-equivariant-counts`. Evaluate the twisted sieve/count approximation in each cycle type and subtract equivariant boundary contributions. Invert the S2/S3 character matrices, enforce compact duality and use the equivariant Euler normalization at n=3. The graph and Euler arithmetic requires the recorded certificate.

Builds on [TC.8/twisted-sieve](#TC8-twisted-sieve), [TC.8/hyperelliptic-equivariant](#TC8-hyperelliptic-equivariant), [TC.8/genus-four-euler](#TC8-genus-four-euler), [TC.9/genus-four-closed-counts](#TC9-genus-four-closed-counts), [TC.8/getzler-kapranov](#TC8-getzler-kapranov), `WeilConjectures:WC.4/equivariant-polynomial-point-counts`. Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Theorem 11.1 p.1356 and §11.3 pp.1360–1361.

**Check.** Dimension specialization recovers all ordinary n=2,3 polynomials. At q=1 the open S3 class is2s3−6s21 with zero sign part.

Each row is the coefficient of the named Schur character.

| Stack | Character | Polynomial |
| --- | --- | --- |
| Compact | n2.s2 | 1 + 9q + 55q^2 + 220q^3 + 561q^4 + 901q^5 + 901q^6 + 561q^7 + 220q^8 + 55q^9 + 9q^10 + q^11 |
| Compact | n2.s11 | 2q + 21q^2 + 99q^3 + 277q^4 + 461q^5 + 461q^6 + 277q^7 + 99q^8 + 21q^9 + 2q^10 |
| Compact | n3.s3 | 1 + 11q + 87q^2 + 424q^3 + 1347q^4 + 2694q^5 + 3414q^6 + 2694q^7 + 1347q^8 + 424q^9 + 87q^10 + 11q^11 + q^12 |
| Compact | n3.s21 | 5q + 58q^2 + 349q^3 + 1220q^4 + 2578q^5 + 3304q^6 + 2578q^7 + 1220q^8 + 349q^9 + 58q^10 + 5q^11 |
| Compact | n3.s111 | 4q^2 + 46q^3 + 190q^4 + 446q^5 + 583q^6 + 446q^7 + 190q^8 + 46q^9 + 4q^10 |
| Open | n2.s2 | −q^2 − q^3 − 2q^7 − 2q^8 + 3q^9 + 2q^10 + q^11 |
| Open | n2.s11 | −q^2 − q^3 − 2q^7 + q^9 + q^10 |
| Open | n3.s3 | 2q^2 − q^3 − q^6 + 2q^7 − 4q^8 − 2q^9 + 3q^10 + 2q^11 + q^12 |
| Open | n3.s21 | −1 − 4q^3 + q^7 − 4q^8 − q^9 + 2q^10 + q^11 |
| Open | n3.s111 | 1 + 2q − 2q^3 − q^8 |

<a id="TC9-genus-four-local-system-traces"></a>

### Local-system Euler traces on M4

For each lambda listed, the alternating compact-support geometric-Frobenius trace on H_c*(M4, V_lambda) is the attached polynomial for every q. Its weight-Euler/Galois realization is obtained by replacing q with L with the same coefficients. The partitions have size≤3.

The target is `TC.9/genus-four-local-system-traces`. Use relative configuration Künneth over M4 and the harmonic Schur decomposition of tensor powers of R1. Solve the six coefficient identities from marked counts through n=3, retaining the Tate shifts from symplectic contractions. This identifies Euler classes, not individual cohomology groups.

Builds on [TC.2/symplectic-local-systems](#TC2-symplectic-local-systems), [TC.9/genus-four-equivariant-counts](#TC9-genus-four-equivariant-counts), [TC.9/genus-four-open-counts](#TC9-genus-four-open-counts). Source: [Jonas Bergström; Carel Faber; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf), BFP Theorem 11.5 pp.1362–1363 and preceding §11.4.

**Check.** The lambda=(2) trace is0; vanishing of this Euler trace alone is not vanishing of all H_c groups. The lambda=(1,1) formula differs from lambda=(2) by the primitive exterior-square contribution.

| Highest weight | Alternating compact-support trace |
| --- | --- |
| (1) | q7+q2 |
| (2) | 0 |
| (1,1) | q9-q8-q7-q2 |
| (3) | q3-2q-1 |
| (2,1) | q8-q7-q4+2q3+1 |
| (1,1,1) | -q10-q9+q8+q6-q4-q2 |

## TC.10. Tautological even cohomology and homology

Cohomological and homological statements now diverge. Low even homology controls high complementary cohomology; it does not establish tautological cohomology in every low even degree.

Atlas planets: Tautological degree-four cohomology; Stable degree-six cohomology; Tautological low even homology.

<a id="TC10-low-cohomology"></a>

### Tautological cohomology through degree three

For all stable pairs H^k(Mbar_g, n)=RH^k(Mbar_g, n) for 0≤k≤3. In particular H1=H3=0, H0=Q, and degree 2 is spanned by boundary, psi and Hodge divisor classes.

The target is `TC.10/low-cohomology`. Supply the degree-two divisor theorem and connectedness, together with the odd-degree vanishing already imported. Primary verification of the divisor generators is a source-input obligation.

Builds on [TC.0/tautological-rings](#TC0-tautological-rings), [TC.1/odd-135](#TC1-odd-135). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP §6.1 p.22, citing Arbarello–Cornalba Theorem 2.1.

**Check.** An even Tate realization alone does not identify its classes as tautological.

<a id="TC10-degree-four"></a>

### All degree-four cohomology is tautological

For every stable pair H4(Mbar_g, n)=RH4(Mbar_g, n), in cohomological grading.

The target is `TC.10/degree-four`. Finite generation reduces degree 4 to g<7, n≤4. The known CKgP and tautological Chow ranges make the pure open quotient tautological; boundary and marking filling give the compact result. Use the strengthened filling criterion, retaining same-degree smaller marking cases.

Builds on [TC.3/finite-generation](#TC3-finite-generation), [TC.10/low-cohomology](#TC10-low-cohomology), [TC.4/pure-algebraicity](#TC4-pure-algebraicity), [TC.4/known-ckgp-ranges](#TC4-known-ckgp-ranges). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Theorem 1.5(1) p.2; §6.1 p.22.

**Check.** Genus7 is absent from the seed range because the genus inequality is strict.

<a id="TC10-degree-six-stable"></a>

### Degree-six cohomology in genus at least ten

For g≥10 and every stable n, H6(Mbar_g, n)=RH6(Mbar_g, n).

The target is `TC.10/degree-six-stable`. Degree-six pure open cohomology is in the stable tautological range. Degree-four boundary factors and their lower-degree Künneth factors are tautological, so the boundary exact sequence completes the proof.

Builds on [TC.10/degree-four](#TC10-degree-four), [TC.10/low-cohomology](#TC10-low-cohomology), [TC.2/stable-tautological-range](#TC2-stable-tautological-range), [TC.0/boundary-exactness](#TC0-boundary-exactness). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Theorem 1.5(2) p.2; §6.1 p.22.

**Check.** No all-genus degree-six cohomological statement is concluded.

<a id="TC10-even-homology"></a>

### Tautological even homology through degree fourteen

For every stable pair and every even 0≤k≤14, the complementary cohomology H^(2d−k)(Mbar_g, n) is tautological. Equivalently ordinary H_k is represented by tautological cycles, with the duality twist(d) understood. Negative cohomological degrees are zero.

The target is `TC.10/even-homology`. Induct on homological degree and stable pairs. BM vanishing leaves n≤1,2g≤k or n≥2,2g−2+n≤k. For g≥3 and k≤14 the CKgP table covers every such pair; pure BM classes are tautological. Genus1 and 2 use the separate even-cohomology theorems. Boundary Künneth has only even factors after odd vanishing below 11; two odd factors cannot sum to k≤14.

Builds on [TC.1/compact-support-vanishing](#TC1-compact-support-vanishing), [TC.0/boundary-exactness](#TC0-boundary-exactness), [TC.1/genus-zero-cohomology](#TC1-genus-zero-cohomology), [TC.2/genus-one-even](#TC2-genus-one-even), [TC.3/genus-two-even](#TC3-genus-two-even), [TC.4/pure-algebraicity](#TC4-pure-algebraicity), [TC.4/known-ckgp-ranges](#TC4-known-ckgp-ranges), [TC.6/genus-seven-chow](#TC6-genus-seven-chow), [TC.9/odd-nine](#TC9-odd-nine). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Theorem 1.5(3) p.2; §6.2 p.23, corrected inequality in proof.

**Check.** The source proof opening says k≥14; the theorem and argument use k≤14. This is not the assertion H^k=RH^k for every even k≤14.

<a id="TC10-even-high-realization"></a>

### The complementary degree-fourteen Tate realization

For all stable pairs, H^(2d−14)(Mbar_g, n)^ss is a finite direct sum of L^(d−7), as rational Hodge structures and as Q_l[G_Q]-representations. The multiplicity is zero if the degree lies outside0..2d.

The target is `TC.10/even-high-realization`. Algebraic codimension d−7 classes give Tate constituents with precisely the indicated exponent. Retain semisimplification in the realization statement.

Builds on [TC.10/even-homology](#TC10-even-homology), [TC.0/boundary-exactness](#TC0-boundary-exactness). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Corollary 6.2 p.23.

**Check.** The exponent is d−7, whereas H14 itself has exponent7.

<a id="TC10-degree-six-pairing-criterion"></a>

### A finite criterion for all degree-six cohomology

If RH6(Mbar_g, n)×RH^(2d−6)(Mbar_g, n)→Q(−d) is a perfect pairing for every stable g≤9, n≤6, then H6(Mbar_g, n)=RH6(Mbar_g, n) for all stable pairs. This is a conditional criterion; the finite perfectness calculation is not supplied.

The target is `TC.10/degree-six-pairing-criterion`. The low homology result identifies all complementary classes as tautological. Nondegeneracy on the two tautological pieces forces degree 6 equality by ambient duality. The marking reduction and stable range reduce verification to the stated finite rectangle.

Builds on [TC.3/local-system-quotient](#TC3-local-system-quotient), [TC.3/filling-criterion](#TC3-filling-criterion), [TC.10/degree-six-stable](#TC10-degree-six-stable), [TC.10/even-homology](#TC10-even-homology). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Remark 6.1 p.22.

**Check.** The factors have cohomological degrees6 and 2d−6; pairing degree 6 with itself is inappropriate unless d=6.

## TC.11. Cusp graphs and the exceptional genus-two bases

Graphical bases count independent maps from the rank-two cusp seed. The restriction rank825 detects part of the degree-fifteen group; its remaining eleven directions require a nonzero pairing and an independent upper bound.

Atlas planets: Cusp-decorated graphs; The genus-two cusp basis; Boundary restriction rank; The genus-two degree-fifteen base case.

<a id="TC11-genus-two-odd-galois"></a>

### Genus-two degree thirteen and fifteen realizations

For every n≥0, W13 H13(M_2, n)^ss and H13(Mbar_2, n)^ss are sums of L S12; W15 H15(M_2, n)^ss and H15(Mbar_2, n)^ss are sums of L² S12 as Q_l[G_Q]-representations. Multiplicities can be zero. The Hodge version of degree 15 is proved geometrically in TC.12.

The target is `TC.11/genus-two-odd-galois`. Use Petersen’s compact-type direct-image decomposition, genus-two local systems and Siegel-modular cohomology classification. The hyperelliptic involution kills odd |lambda|. Boundary pieces add only the indicated S12 twists. Primary verification of those classification inputs is a recorded gap.

Builds on [TC.2/symplectic-local-systems](#TC2-symplectic-local-systems), [TC.0/cusp-moduli-identification](#TC0-cusp-moduli-identification), [TC.0/boundary-exactness](#TC0-boundary-exactness), [TC.1/low-genus-odd-nine](#TC1-low-genus-odd-nine), [TC.10/low-cohomology](#TC10-low-cohomology), [TC.3/cusp-ste-operations](#TC3-cusp-ste-operations). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Proposition 2.8 and Corollary 2.9 p.8.

**Check.** The statement is semisimplified Galois cohomology; it does not assert a canonical splitting or infer the Hodge theorem from Frobenius polynomials.

<a id="TC11-omega-graphs"></a>

### Cusp-decorated stable graphs

An omega-decorated stable graph has one specified genus-one vertex carrying a pullback of omega∈H11(Mbar_1,11) along the forgetful map that retains eleven selected flags, unit classes on other vertices, and additional named tautological decorations. Pushforward along its e edges, before extra decorations, is a morphism L^e S12→H^(11+2e)(Mbar_g, n). A graphical basis means a basis of this Hom multiplicity space together with the resulting isomorphism from its tensor product with L^e S12; it is not a basis of individual rational vectors. Omitted markings lie on the designated genus-one vertex only when this is explicitly the drawing convention.

The target is `TC.11/omega-graphs`. Use stable-graph products, forgetting pullback and Gysin pushforward, retaining the order/sign of the eleven retained flags. Extend linearly in the entire rank-two seed and take graph automorphism invariants.

Builds on [TC.3/cusp-ste-operations](#TC3-cusp-ste-operations), `StableReductionPartII:MC.7/consumer-clp`, [TC.0/cusp-moduli-identification](#TC0-cusp-moduli-identification). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP §7.2 pp.24–25, conventions1–5.

The API serves CLP Lemmas7.4–7.7 (Specifies the multiplicity bases.); CLP Lemma 7.3 (Defines the 891 maps and their restriction matrix.).

| Declaration | Contract |
| --- | --- |
| `OmegaGraphs.push` | A graph and a retained eleven-flag set determine the indicated realization morphism. |
| `OmegaGraphs.degree` | Each edge adds cohomological degree 2 and Tate factor L. |
| `OmegaGraphs.forget` | omega_i and omega_ij are pullbacks forgetting those flags, with all other retained flags named. |
| `OmegaGraphs.basis` | A basis of m cusp maps realizes the target as (L^e S12)^m when the evaluation map is an isomorphism. |
| `OmegaGraphs.flag_sign` | Permuting the ordered eleven retained cusp flags multiplies the cusp map by the sign character of S11; relabelling carries all retained and forgotten flag sets with it. |

**Checks.**

- A two-edge unit-decorated graph contributes degree 15 and L²S12.
- Eleven independent one-edge cusp maps give rational dimension 22, not11.
- A genus-one vertex with fewer than eleven flags has no H11 cusp decoration.

<a id="TC11-basis-1-12"></a>

### Cusp multiplicity basis on Mbar_(1,12)

H13(Mbar_(1,12)) is the direct sum of 11 copies of L S12, and the 11 one-edge maps specified by the source graph families form its multiplicity basis.

The target is `TC.11/basis-1-12`. Use one separating edge to a rational tail bearing marking1 and i, for i=2,…,12; decorate the remaining genus-one vertex by its eleven-flag cusp seed. Pair with the eleven forgotten-marking cusp classes on Mbar_1,12. The resulting matrix is block diagonal and nonzero.

Builds on [TC.11/omega-graphs](#TC11-omega-graphs), [TC.2/genus-one-pure](#TC2-genus-one-pure). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 7.4 p.25.

**Check.** Rational dimension is22. The finite certificate must name every retained flag, graph automorphism factor and the nonzero pairing or triangular pivot.

<a id="TC11-basis-1-13"></a>

### Cusp multiplicity basis on Mbar_(1,13)

Fix labels{x, y,1,…,11}. H13(Mbar_1,13)≅(L S12)^429 has the following one-edge multiplicity basis, with all omitted labels on the genus-one side and p its attaching flag: (a) a rational tail bearing any three-element label set, decorated by omega on its eleven remaining flags (286); (b) a tail{y, i}, i∈{1,…,11}, and omega_x on the genus-one side (11); (c) a tail{x, j}, j≠x, and omega_i for any original label i∉{x, j} (132). Retained flags are ordered by the fixed label order followed by p.

The target is `TC.11/basis-1-13`. Use the three families in the cited figure: rational tails with three markings (286 maps), the eleven tails {y,i} with fixed forgotten flag x (11 maps), and the variable fixed-mark two-tail family (132 maps). Give the complete retained-flag sets in the finite graph certificate, not only this count. Boundary generation and pullback of the preceding basis span the group; the independently supplied multiplicity429 proves freeness.

Builds on [TC.11/omega-graphs](#TC11-omega-graphs), [TC.2/genus-one-pure](#TC2-genus-one-pure), [TC.11/basis-1-12](#TC11-basis-1-12). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 7.5 p.26.

**Check.** Rational dimension is858. The finite certificate must name every retained flag, graph automorphism factor and the nonzero pairing or triangular pivot.

<a id="TC11-basis-1-14"></a>

### Cusp multiplicity basis on Mbar_(1,14)

Fix labels{x, y,1,…,12}. H13(Mbar_1,14)≅(L S12)^6006 has five one-edge multiplicity-basis families, with rational tail and all omitted labels on the genus-one side: (a) any four-label tail, decoration omega (1001); (b) any three-label tail, omega_l for any of the eleven remaining original labels l (4004); (c) tail{1, i}, 2≤i≤12, omega_xy (11); (d) tail{y, j}, j∈{1,…,12}, omega_xi for i∈{1,…,12} minus{j} (132); (e) tail{x, k}, k≠x, omega_ij for an unordered two-subset{i, j} of the other twelve original labels (858). The attaching flag is retained and ordered last.

The target is `TC.11/basis-1-14`. Use the five families in the cited figure, with multiplicities1001,4004,11,132,858, respectively. These are the four-mark tails, three-mark tails with one forgotten flag, and three pullback families of two-mark tails. The graph certificate must specify the retained flags and distinguished marks x, y. Straighten by pullback from Mbar_1,12 after removing the first two families; the independent genus-one multiplicity6006 proves freeness.

Builds on [TC.11/omega-graphs](#TC11-omega-graphs), [TC.2/genus-one-pure](#TC2-genus-one-pure), [TC.11/basis-1-12](#TC11-basis-1-12), [TC.11/basis-1-13](#TC11-basis-1-13). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 7.6 p.26.

**Check.** Rational dimension is12012. The finite certificate must name every retained flag, graph automorphism factor and the nonzero pairing or triangular pivot.

<a id="TC11-basis-2-12"></a>

### Cusp multiplicity basis on Mbar_(2,12)

H13(Mbar_(2,12)) is the direct sum of 264 copies of L S12, and the 264 one-edge maps specified by the source graph families form its multiplicity basis.

The target is `TC.11/basis-2-12`. Join two genus-one vertices. The right vertex carries a pair{i, j}, a singleton j, or no original marks; the left cusp decorations respectively forget zero, one i, or two i, j flags. The family sizes are66,132,66. Normalize the right vertex to a rational vertex with two new flags x, y; pullback embeds these maps among the independent preceding6006 maps. Supply the independent multiplicity264 from the genus-two character computation.

Builds on [TC.11/omega-graphs](#TC11-omega-graphs), [TC.2/genus-one-pure](#TC2-genus-one-pure), [TC.11/basis-1-14](#TC11-basis-1-14). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 7.7 p.26.

**Check.** Rational dimension is528. The finite certificate must name every retained flag, graph automorphism factor and the nonzero pairing or triangular pivot.

<a id="TC11-graph-restriction-rank"></a>

### The891-graph restriction matrix

The891 two-edge cusp maps in CLP Figure 2 have a selected boundary-restriction matrix of rank 825. Its66-dimensional kernel is spanned by M_ij=R1(ij)+(1/24)R2(ij)+R3[i, j]+R3[j, i]−R4(ij)+(1/12)R5(ij), indexed by unordered pairs of distinct labels. These are relations among the selected restrictions, not yet relations among the global classes.

The target is `TC.11/graph-restriction-rank`. The row families have sizes132,11,132,220,66,66,132,66,66. Isolate A1 in column 1 and A2–A4 in column 2 using the genus-one basis. The remaining blocks are upper triangular, giving825 pivots. Verify the 66 displayed kernel combinations using the low-marking genus-one psi/boundary relations and all excess-intersection signs. A complete rational matrix/pivot certificate is G-computations.

Builds on [TC.11/omega-graphs](#TC11-omega-graphs), [TC.11/basis-1-13](#TC11-basis-1-13), [TC.11/basis-1-14](#TC11-basis-1-14), [TC.11/basis-2-12](#TC11-basis-2-12), [TC.0/tautological-rings](#TC0-tautological-rings). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Figure 2 p.25; proof of Lemma 7.3 p.27.

**Check.** The row counts sum to891 and 891−825=66. The two-edge pullback includes negative psi decorations from self-intersection.

<a id="TC11-unordered-pair-module"></a>

### The corrected unordered-pair representation

The S12-module spanned by formal symbols M_ij is Ind_(S10×S2)^S12(sgn10⊠1), of dimension 66, and decomposes as T_(2,1^10)⊕T_(3,1^9), dimensions11 and 55. It is not induction from S10 alone, which has dimension 132.

The target is `TC.11/unordered-pair-module`. The complementary ten retained flags supply the sign and the unordered pair has trivial S2 action. Apply the horizontal-two-strip Pieri rule. Compare subgroup indices and hook dimensions.

Builds on [TC.11/graph-restriction-rank](#TC11-graph-restriction-rank), `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP proof of Lemma 7.3 p.27, corrected induction subgroup.

**Check.** 12!/(10!2!)=66;12!/10!=132. 11+55=66.

<a id="TC11-genus-two-fifteen-base"></a>

### Boundary generation of H15 on Mbar_2,12

H15(Mbar_2,12) is an actual direct sum of836 copies of L²S12, generated by the 891 two-edge cusp maps. Their global relation space has dimension 55.

The target is `TC.11/genus-two-fifteen-base`. Supply the independent semisimple multiplicity836. Pair M_ij with R5(ik), k≠j, with dual cusp decorations: the first five terms vanish and the last term is nonzero. Thus the 66-symbol module has nonzero image; its two irreducible constituents and the upper bound836 force an11-dimensional image. Add this to the 825 detected restriction directions. The resulting836 independent rank-two maps establish actual semisimplicity, not merely a Grothendieck identity.

Builds on [TC.11/graph-restriction-rank](#TC11-graph-restriction-rank), [TC.11/unordered-pair-module](#TC11-unordered-pair-module), [TC.8/getzler-kapranov](#TC8-getzler-kapranov). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 7.3 pp.24–27, equation(7.1).

**Check.** 825+11=836, and 891−836=55. The argument needs the nonzero pairing and the independent upper bound; rank 825 alone does not suffice.

<a id="TC11-genus-two-nearby-bases"></a>

### The adjacent genus-two exceptional bases

The cusp STE generated by H11(Mbar_1,11) contains H13(Mbar_2,11) and H15(Mbar_2,13).

The target is `TC.11/genus-two-nearby-bases`. For the first base, CKgP at(2,10) puts H13 there on the boundary, then the odd-marking reduction applies. For the second, combine the degree 15 base at 12 marks, degree 13 at 12 marks, and the genus-one cusp reductions.

Builds on [TC.3/genus-two-odd-markings](#TC3-genus-two-odd-markings), [TC.3/cusp-ste-operations](#TC3-cusp-ste-operations), [TC.4/known-ckgp-ranges](#TC4-known-ckgp-ranges), [TC.11/genus-two-fifteen-base](#TC11-genus-two-fifteen-base), [TC.11/basis-2-12](#TC11-basis-2-12). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 7.1 p.23 and Lemma 7.10 p.27.

**Check.** Use n=11, k=13 and n=13, k=15 with distinct lower groups.

## TC.12. Cusp homology and the realization classification

The final induction uses the finite cusp bases and the oriented weight complex. The passage from Hodge to Galois realizations uses the same geometric maps, rather than a comparison of Hodge numbers alone.

Atlas planets: Cusp generation of degree-thirteen homology; Two-cusp homology generation; The oriented weight-fifteen complex; Absence of weight-fifteen holomorphic forms; The degree-thirteen to fifteen classification.

<a id="TC12-homology-thirteen"></a>

### Cusp generation of degree-thirteen homology

For every stable pair the STE generated by H11(Mbar_1,11) contains H^(2d−13)(Mbar_g, n), equivalently the complementary cohomological realization of H_13.

The target is `TC.12/homology-thirteen`. BM vanishing and boundary induction leave only(2,11),(1,11),(1,12),(1,13) outside the CKgP table. Treat genus2 by the nearby base and hard Lefschetz and genus1 by the pure formula and boundary induction. Künneth in total13 has one odd factor of degree 11 or13, since all smaller odd degrees vanish.

Builds on [TC.0/boundary-exactness](#TC0-boundary-exactness), [TC.1/compact-support-vanishing](#TC1-compact-support-vanishing), [TC.9/odd-nine](#TC9-odd-nine), [TC.4/pure-algebraicity](#TC4-pure-algebraicity), [TC.4/known-ckgp-ranges](#TC4-known-ckgp-ranges), [TC.6/genus-seven-chow](#TC6-genus-seven-chow), [TC.11/genus-two-nearby-bases](#TC11-genus-two-nearby-bases), [TC.2/genus-one-pure](#TC2-genus-one-pure), [TC.10/low-cohomology](#TC10-low-cohomology). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Theorem 1.6 p.2; proof pp.23–24.

**Check.** The assertion concerns H_13, not all H^13.

<a id="TC12-homology-fifteen"></a>

### Two-cusp generation of degree-fifteen homology

For every stable pair the STE generated by H11(Mbar_1,11) and H15(Mbar_1,15) contains H^(2d−15)(Mbar_g, n).

The target is `TC.12/homology-fifteen`. The finite BM region has CKgP in genus≥3. Remaining genus-one marks11–15 are covered by the two cusp seeds and the pure formula. Remaining genus-two marks11–13 use the base computations and hard Lefschetz. Boundary Künneth needs odd degrees11,13,15 and tautological even degrees≤4.

Builds on [TC.12/homology-thirteen](#TC12-homology-thirteen), [TC.11/genus-two-nearby-bases](#TC11-genus-two-nearby-bases), [TC.11/genus-two-fifteen-base](#TC11-genus-two-fifteen-base), [TC.11/basis-2-12](#TC11-basis-2-12), [TC.1/compact-support-vanishing](#TC1-compact-support-vanishing), [TC.6/genus-seven-chow](#TC6-genus-seven-chow), [TC.4/known-ckgp-ranges](#TC4-known-ckgp-ranges), [TC.2/genus-one-pure](#TC2-genus-one-pure), [TC.10/degree-four](#TC10-degree-four). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Theorem 1.7 p.2; proof p.27.

**Check.** The degree 15 genus-one seed is necessary at(1,15), even though no S16 survives in cohomology H15 for genus≥2.

<a id="TC12-high-odd-realizations"></a>

### Complementary odd-degree realizations

For every stable pair, H^(2d−13)^ss is a sum of copies of L^(d−12)S12, and H^(2d−15)^ss is a sum of copies of L^(d−13)S12 and L^(d−15)S16, in both Hodge and Galois realizations. Multiplicities depend on the pair and vanish outside its cohomological range.

The target is `TC.12/high-odd-realizations`. Each gluing adds L and each forgetful pullback preserves weight. Track the complementary dimension and seed weights. Genus-one degree 15 additionally uses the Getzler multiplicity186263 for the boundary L²S12 part; that numeric input is recorded in G-computations.

Builds on [TC.12/homology-thirteen](#TC12-homology-thirteen), [TC.12/homology-fifteen](#TC12-homology-fifteen), [TC.0/cusp-moduli-identification](#TC0-cusp-moduli-identification). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Corollary 7.2 p.24 and Corollary 7.11 p.28.

**Check.** Weights are2d−13 and 2d−15 respectively. These are semisimplified statements; arbitrary equal-weight Galois extensions have not been split.

<a id="TC12-genus-two-cohomology-fifteen"></a>

### Genus-two complementary-degree generation and degree-fifteen realizations

For every n, with d=3+n, the STE generated by H11(Mbar_1,11) contains H^(2d−15)(Mbar_2, n), the complementary cohomology underlying degree-fifteen homology. By duality, H^15(Mbar_2, n)^ss is a sum of L²S12 in Hodge and Galois realizations. This does not assert STE generation of H^15 itself for all n.

The target is `TC.12/genus-two-cohomology-fifteen`. Dualize the genus-two Galois classification to the complementary target. In the exhibited two-seed geometric homological generation maps, the S16 seed has no common simple Galois constituent with that target and its map is zero. Retain the S12-generated image, obtaining STE generation of H^(2d−15). The same geometric maps and Betti/etale comparison give its Hodge realization; duality then gives the cohomological degree-fifteen classification.

Builds on [TC.11/genus-two-odd-galois](#TC11-genus-two-odd-galois), [TC.12/homology-fifteen](#TC12-homology-fifteen), [TC.12/high-odd-realizations](#TC12-high-odd-realizations), [TC.3/cusp-ste-operations](#TC3-cusp-ste-operations). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 8.1 p.28.

**Check.** Excluding one constituent after semisimplification does not by itself construct the required STE maps; use the already exhibited geometric generation.

<a id="TC12-weight-fifteen-complex"></a>

### The oriented weight-fifteen boundary complex

Let C^j_15(g, n)=⊕_(|EΓ|=j)(H15(Mbar_Γ)⊗det Q^EΓ)^AutΓ. For j=0 this is H15(Mbar_g, n). The differential is the signed sum of restrictions that add one edge, with its exterior orientation; write alpha=d0 and beta=d1 on Hodge type(15,0). Use compact normalized vertex factors, not open strata.

The target is `TC.12/weight-fifteen-complex`. Take the weight15 row of the imported oriented normal-crossings weight spectral sequence. Compatible edge ordering makes d²=0; finite graph invariants retain the orientation action.

Builds on `DeligneWeightsAndPurity:DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`, `StableReductionPartII:MC.7/consumer-clp`, [TC.8/stable-graph-transform](#TC8-stable-graph-transform). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP equations(8.1)–(8.2) pp.28–29.

The API serves CLP Lemma 8.2 (Identifies the injection alpha.); CLP proof of Theorem 1.1 (Eliminates Hodge type(15,0) using beta.).

| Declaration | Contract |
| --- | --- |
| `WeightFifteenComplex.d_square` | Successive edge additions cancel in opposite orders, so d_(j+1)d_j=0. |
| `WeightFifteenComplex.alpha` | d0 is restriction to normalized one-edge boundary components. |
| `WeightFifteenComplex.beta` | d1 preserves Hodge type and carries the det(edge) action. |
| `WeightFifteenComplex.relabel` | The complex is S_n-equivariant and independent of the temporary edge order. |
| `WeightFifteenComplex.orientation_change` | Changing an ordering of the edges by tau multiplies its oriented summand by sign(tau); the induced signed restriction map is independent of the chosen presentation. |

**Checks.**

- A transposition of two edges acts by−1 on det Q^E.
- A two-edge stratum with a trivial H15 summand and an edge-swap automorphism need not contribute that summand after the orientation twist.
- Ordinary stable-graph Euler assembly does not insert this determinant sign.

<a id="TC12-fifteen-boundary-injection"></a>

### Injectivity in the weight-fifteen row

For g≥3, alpha:H15(Mbar_g, n)→C1_15(g, n) is injective.

The target is `TC.12/fifteen-boundary-injection`. If n≤1 and 2g>15 or n≥2 and 2g−2+n>15, compact-support degree 15 vanishes. The remaining pairs with g≥3 lie in the CKgP table, so Gr15^W Hc15=0. The spectral edge map is therefore injective. Use the piecewise bound: the shorter source argument would otherwise appear to require unlisted CKgP at(8,0),(8,1).

Builds on [TC.12/weight-fifteen-complex](#TC12-weight-fifteen-complex), [TC.1/compact-support-vanishing](#TC1-compact-support-vanishing), [TC.4/pure-algebraicity](#TC4-pure-algebraicity), [TC.4/known-ckgp-ranges](#TC4-known-ckgp-ranges), [TC.6/genus-seven-chow](#TC6-genus-seven-chow). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 8.2 p.28.

**Check.** At g=8, n=0 or1 the 2g bound gives the result directly; no genus-eight CKgP theorem is assumed.

<a id="TC12-no-fifteen-zero"></a>

### No Hodge type(15,0) in genus at least two

For all g≥2, n, H^(15,0)(Mbar_g, n)=H^(0,15)(Mbar_g, n)=0.

The target is `TC.12/no-fifteen-zero`. Induct on genus. A nonseparating one-edge term has genus g−1≥2, hence zero(15,0). A separating term can carry(15,0) only on a genus-one side with at least15 flags; its other side has genus≥2. Add a loop on that other vertex and reduce its genus by 1. The resulting oriented two-edge restriction is injective on the original genus-one cusp summand, and the reverse deletion term is a vanishing higher-genus source. Thus beta has trivial kernel in this type. Since beta alpha=0 and alpha is injective, the target type vanishes.

Builds on [TC.12/genus-two-cohomology-fifteen](#TC12-genus-two-cohomology-fifteen), [TC.12/fifteen-boundary-injection](#TC12-fifteen-boundary-injection), [TC.12/weight-fifteen-complex](#TC12-weight-fifteen-complex), [TC.12/high-odd-realizations](#TC12-high-odd-realizations). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP proof of Theorem 1.1 pp.28–29, Figure 3.

**Check.** Loop insertion changes genus of its vertex from g−1 to g−2 and preserves total genus. Stability survives even when g−2=1 because the vertex has the separating flag and both loop flags.

<a id="TC12-genus-one-fifteen-split"></a>

### A geometric splitting of the genus-one seed

In H15(Mbar_1,15), let V be the boundary-pushforward image and W=image(Hc15(M_1,15)→H15(Mbar_1,15)). Then H15=V⊕W in both Hodge and Galois realizations, W≅S16, and V^ss≅(L²S12)^186263.

The target is `TC.12/genus-one-fifteen-split`. The open quotient is S16. Duality pairs its quotient map with the compact-support image W. V has types(13,2),(2,13), while W has(15,0),(0,15), so they are orthogonal and the restricted pairing on W is nondegenerate. All maps are geometric over Q; the vector-space splitting is consequently also Galois-equivariant. The exact boundary multiplicity is an independent Getzler input.

Builds on [TC.0/cusp-moduli-identification](#TC0-cusp-moduli-identification), [TC.2/genus-one-pure](#TC2-genus-one-pure), [TC.3/cusp-ste-operations](#TC3-cusp-ste-operations), [TC.0/boundary-exactness](#TC0-boundary-exactness). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Lemma 8.3 p.29.

**Check.** Orthogonality uses Hodge types and actual geometric maps; an equality of virtual classes would not split an extension.

<a id="TC12-realization-classification"></a>

### The cohomological realization classification

For every stable pair H13(Mbar_g, n)^ss is a sum of L S12 and H14(Mbar_g, n)^ss is a sum of L7. For g≥2, H15(Mbar_g, n)^ss is a sum of L²S12. These hold as rational Hodge structures and as Q_l[G_Q]-representations.

The target is `TC.12/realization-classification`. Duality gives degrees13,14 and leaves S16 as the only possible extra degree 15 constituent. The Hodge argument excludes it for g≥2. In the exhibited complementary-degree generation maps, restrict each genus-one15 seed to the geometric W summand. Its map vanishes as a Hodge morphism, hence on rational Betti spaces and, by comparison, on etale realizations. Therefore no Galois S16 constituent remains. Do not infer a Galois result merely from matching Hodge numbers.

Builds on [TC.10/even-high-realization](#TC10-even-high-realization), [TC.12/high-odd-realizations](#TC12-high-odd-realizations), [TC.12/no-fifteen-zero](#TC12-no-fifteen-zero), [TC.12/genus-one-fifteen-split](#TC12-genus-one-fifteen-split), `MotivesAndAlgebraicCycles:MC.2`. Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Theorem 1.1 p.1; §8 pp.28–30.

**Check.** At genus1, n=15 there is an S16 summand; the g≥2 restriction is essential. Each L S12 summand has rational dimension 2 and weight13.

<a id="TC12-genus-three-cohomology"></a>

### Realizations of genus-three moduli through eleven markings

For n≤11, every H^k(Mbar_3, n)^ss is a finite direct sum of tensor monomials in L and S12 in Hodge and Galois realizations; equivalently the total semisimplified cohomology lies in the positive semiring generated by their realization classes.

The target is `TC.12/genus-three-cohomology`. Use CKgP and tautological Chow on the open genus-three range, boundary induction, Künneth and hard Lefschetz. Since d=6+n≤17, only degrees≤17 below the middle require consideration; boundary factors and the genus-one/two inputs control the remaining possible odd classes. Preserve tensor products, rather than assert a direct sum of untensored S12 alone.

Builds on [TC.12/realization-classification](#TC12-realization-classification), [TC.10/even-homology](#TC10-even-homology), [TC.4/known-ckgp-ranges](#TC4-known-ckgp-ranges), [TC.4/pure-algebraicity](#TC4-pure-algebraicity), [TC.0/boundary-exactness](#TC0-boundary-exactness), [TC.2/genus-one-pure](#TC2-genus-one-pure). Source: [Samir Canning; Hannah Larson; Sam Payne](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf), CLP Theorem 1.9 p.3 and proof §4 p.13.

**Check.** The polynomial is in a Grothendieck semiring after semisimplification; it does not assert a Chow-motive decomposition.

## Conjectural boundary

For all stable pairs every even H^k(Mbar_g,n),k≤20, is tautological. This is conjecture; not assumed. Source: CLP, Conjecture1.8 p.3.

For g≥2, H15(Mbar_g,n) belongs to the STE generated by H11(Mbar_1,11). This is conjecture; not implied by the realization classification. Source: CLP, Conjecture7.12 p.28.

The degree-six perfect-pairing criterion is a proved conditional implication, not a completed finite pairing computation. The forthcoming complete cusp-graph relations mentioned in CLP Remark 7.8 are not present in that paper. The rank836 alternative in Remark 7.9 is a valid certificate route only after its actual self-pairing matrix is supplied.

## Source corrections and proof gates

All sixteen findings below have independent confirmed verdicts. The twelve inherited findings were checked at their published locators. E13–E14 concern two general statements in BFP, without refuting its proper polynomial-count applications. E15–E16 are scoped to Gorsky’s v3 preprint and credit the prior corrections in [Kannan Remark3.8, pp.11–12](https://arxiv.org/pdf/2602.09117v2). The bounded searches and the versions actually read are recorded in the packet.

**E1 — Published §6.2 p.23, first sentence of proof of Theorem1.5(3).** The proof opens with the range even k≥14. Use even0≤k≤14. The theorem on p.2 and the finite CKgP table argument use the upper bound14. Effect: nothing. Recorded by PAPER-CANNING-LARSON-PAYNE-24; no independent correction located in this bounded search.

**E2 — Published §5.3 pp.20–22, equations(5.10)–(5.13).** The model treats a rank16 half-spin vector bundle as SO10-equivariant and identifies the displayed SO10 quotient with curve moduli. Use the Spin10 lift, prove central mu4 rigidification/effective PSO10 comparison and actual stabilizers, and separately prove every needed bundle/Chow transfer. The central−1 in Spin10 acts nontrivially on the half-spin vector representation, so it cannot descend to SO10. Projective action alone does not descend vector bundles. Effect: the proof. Already recorded as extraction items95–96 and its Mukai finding; no independent published repair located.

**E3 — Published proof of Lemma7.3 p.27, induced representation.** The subgroup in the66-symbol induction is written S10. Use S10×S2, with sgn10⊠1. Its index is66; the printed subgroup has index132. The corrected decomposition has dimensions11+55. Effect: nothing. Already recorded in the reviewed CLP extraction.

**E4 — Published Lemma2.1 pp.4–5, hypotheses(2.2).** Only smaller triples of degree k′≤k−2 are required, although the proof also invokes same-degree forgetting sources. A sufficient corrected statement requires all0≤k′≤k with the same smaller-pair and complementary-dimension constraints. Take S=RH and(g,n,k)=(1,12,11). Proposition2.2 makes the current pure quotient by Phi zero; all required degrees≤9 in genus≤1 are tautological. Yet RH11=0 and H11(Mbar_1,12) has dimension22. The missing(1,11,11) test fails the repaired hypothesis. Effect: a stated result. Independently confirmed in this review; no correction located in the bounded search.

**E5 — Published proof of Lemma5.10 p.19, trivialization step.** A trivialization of the underlying vector bundle is used to identify the relative orthogonal Grassmannian with a product. Trivialize the quadratic form and chosen component, or prove a rational splitting-principle/descent argument for the actual universal iterates. A vector-space basis alone need not split a quadratic form over a base or field. The present universal application needs an additional justified reduction. Effect: the proof. Independently confirmed as a printed proof gap; no correction located in the bounded search.

**E6 — Published §5.3.1 setup p.18 before Lemma5.8, equivariant bundle description.** The pulled-back quadratic bundle is described as an equivariant direct sum U⊕U dual. Use the P-equivariant exact sequence0→U→V→U dual→0; its Chern identity suffices. The parabolic unipotent radical acts with a nonzero off-diagonal block, so a Levi splitting is not P-equivariant. Effect: the proof. No correction located by the bounded paper-title search; no failure of the resulting Chern formula is asserted.

**E7 — Published Corollary3.2 p.1330, conclusion.** The conclusion uses general(g,n) after assuming a genus-four count. Conclude H9(Mbar_4,n)=0 immediately; use §2 induction for all genera. A count of one genus does not imply all-genus vanishing without the separate boundary induction. Effect: nothing. Already recorded in PAPER-BERGSTROM-FABER-PAYNE-24.

**E8 — Published proof of Proposition3.1 p.1330, trace remainder.** The comparison line uses a remainder with dimension exponent d/2. Keep the hypothesis cutoff exponent s/2. The invoked approximation hypothesis has cutoff s, not necessarily d. Effect: nothing. Already recorded in the reviewed BFP extraction.

**E9 — Published §10.1 p.1355, displayed open three-mark polynomial.** The lower coefficient is placed at−11q4. It is−11q3. Theorem1.5 and exact closed-minus-boundary subtraction give−11 at degree3 and0 at degree4. Effect: nothing. Already recorded in the reviewed BFP extraction.

**E10 — Published Remark2.2 p.1328.** The low compact-support result is cited as Proposition2. Use Proposition2.1. The numbered proposition with the stated bounds is2.1. Effect: nothing. Already recorded in the reviewed BFP extraction.

**E11 — Published opening of §9 p.1351.** The modular-operad formula is cited as Getzler–Kapranov Theorem8.3. Use Theorem8.13. The formula occurs in the theorem on pp.110–111 of the published Modular operads paper. Effect: nothing. Already recorded in the reviewed BFP extraction.

**E12 — Published equation(3) p.1331, normalized closed-strata spectral sequence.** The displayed boundary terms have ordinary cohomology of the normalized strata without the edge-orientation local system, and the indices obscure total degree. Use E1^(j,k)=H^k(Dnorm_j,det Q^edges)⇒Hc^(j+k)(open), with weight k; take graph-automorphism invariants after the determinant twist. Ordinary open-stratum Euler assembly remains untwisted. Two rational vertices with one external leg each and two joining edges give a codimension2 stratum of Mbar_1,2 whose edge swap acts by−1 on det(edges). Its twisted H0 invariants vanish while plain H0 invariants do not. Untwisted closed-strata alternating terms consequently give the wrong Euler count. Effect: the proof. Already identified in the reviewed BFP extraction; corrected DWP.8 supplier explicitly retains orientation.

**E13 — Published §9.1 p.1351, final trace-formula sentence.** The point count of a general twisted variety is identified with the graded trace on ordinary etale cohomology. Use compactly supported etale cohomology for a nonproper variety; ordinary cohomology suffices when proper. For A1 with the identity twist, ordinary cohomology has graded Frobenius trace1, but the point count is q. Compact support gives H_c^2=Q_l(−1), hence trace q. TC.8 already uses compact support. Effect: nothing. Not located in the bounded search; the proper applications do not require a changed trace formula.

**E14 — Published Definition9.1 p.1351.** An arbitrary equivariant twisted point-count class function is assigned an element of the representation ring. In general retain a class function (or a scalar extension of the character space). Integral rational representation-ring coefficients need additional hypotheses such as the all-Z smooth proper/Tate comparison of Proposition9.3. Take X=Spec F_(q^3) with G=C3 its F_q automorphisms. Frobenius is a three-cycle on the geometric points, and the three twisted counts are (0,0,3), up to ordering of the nonidentity elements. Rational C3 characters have equal values on the two nonidentity elements, so this class function is not in R_Q(C3). Its complex irreducible-character coefficients also need not be integers. Effect: a stated result. Not located in the bounded search. The later polynomial-count conclusions retain their stronger hypotheses and are not refuted.

**E15 — arXiv:0906.0841v3 Theorem3.8 p.6, definition of quotient genus.** The displayed quotient genus is half of one minus the sum of the orbit exponents. Use h=1−(sum_(j=1)^r k_j)/2, following Proposition3.1 equation(3) p.4. Include the negative exponent k_r. For an unramified type use gamma=r, equivalently gcd(r,{j:k_j>0}), in the product factor. For the identity automorphism of a genus4 curve the only exponent is k1=−6. The printed expression gives h=7/2, whereas the quotient genus is4. Riemann–Hurwitz gives the corrected constant term. Kannan already identifies the constant-term slip; the sum here is fixed directly by Gorsky’s equation(3), including k_r. Effect: nothing. Prior correction: Siddarth Kannan, arXiv:2602.09117v2 Remark3.8 pp.11–12 identifies the constant-term typo. Gorsky’s published text has not been collated here.

**E16 — arXiv:0906.0841v3 Definition3.5 and Lemma3.6 p.5.** The local congruence count of modulus r retains a dummy symbol k in gcd(x_i,k) and c(k,lambda_i,d). Replace those occurrences of k by r; retain k only as the generic first argument in the separately defined function c. The variables x_i belong to Z/r and the sum condition is modulo r. Only gcd(x_i,r) is invariant under residue representatives; k is otherwise unbound in the definition and lemma. Direct residue convolution with modulus r reproduces the coefficient calculation. Effect: nothing. Prior correction: Siddarth Kannan, arXiv:2602.09117v2 Remark3.8 pp.11–12 explicitly identifies both occurrences. Gorsky’s published text has not been collated here.

The orientation correction separates two constructions: the normalized-closed-strata weight complex retains det(edges), whereas ordinary open-stratum Euler assembly uses the usual Koszul action without an extra edge determinant.

## Exact remaining inputs and supplier boundary

These are direct obligations. An endpoint also inherits every obligation on the prerequisite paths leading to it. The packet records this transitive dependency in each layer’s remaining list.

### G-stack-duality. Duality and comparison for the actual moduli stacks

Prove rational Betti and Q_l compact-support/Verdier duality for the imported smooth DM stacks, including H_k=H^(2d−k)(d), H_k^BM=H_c^k dual, finite quotient invariants, Kunneth and normalized-boundary functoriality. EtaleDualityAndPerverseSheavesPartIIStacks is the routed owner but has no established stage/node contract here. The EDC scheme results are insufficient.

Direct consumers: [TC.0/boundary-exactness](#TC0-boundary-exactness), [TC.1/compact-support-vanishing](#TC1-compact-support-vanishing), [TC.1/normalized-boundary-injection](#TC1-normalized-boundary-injection), [TC.8/curve-marking-twists](#TC8-curve-marking-twists).

### G-stack-comparisons. Geometric weight, Hodge and count comparisons

Construct the geometric rational MHS of these DM stacks, its strict functorial maps and Betti/etale comparisons; prove smooth proper all-Z stack trace, fibrewise constancy and p-adic comparison hypotheses required by WC.4/WC.5. Establish an S_n-compatible finite smooth cover if the BFP presentation argument is used, or prove the stack theorem directly. Proper rigid-analytic Hodge–Tate degeneration alone is not this theorem. Actual global Tate splitting needs the everywhere-good-reduction/unramified-extension argument of the WC.5 exact all-Z theorem, not just Frobenius eigenvalues.

Direct consumers: [TC.0/cusp-moduli-identification](#TC0-cusp-moduli-identification), [TC.4/pure-algebraicity](#TC4-pure-algebraicity), [TC.8/curve-marking-twists](#TC8-curve-marking-twists), [TC.8/weight-euler-characteristic](#TC8-weight-euler-characteristic), [TC.8/polynomial-induction](#TC8-polynomial-induction), [TC.9/genus-four-cutoff](#TC9-genus-four-cutoff), [TC.9/genus-four-tate](#TC9-genus-four-tate), [TC.9/genus-four-equivariant-counts](#TC9-genus-four-equivariant-counts), [TC.12/genus-one-fifteen-split](#TC12-genus-one-fifteen-split), [TC.12/realization-classification](#TC12-realization-classification).

### G-stack-cycle. Stack cycle and intersection extension

The two precise SF.5 and MC.2 requests above remain open. In particular scheme-only exterior products cannot state CKgP for arbitrary test stacks, and projective smooth-variety GRR does not apply to a nodal universal stack family. Verify support/properness and codimension/Tate conventions for all curve operations.

Direct consumers: [TC.0/tautological-rings](#TC0-tautological-rings), [TC.0/kappa-classes](#TC0-kappa-classes), [TC.4/chow-kunneth-generation](#TC4-chow-kunneth-generation), [TC.4/ckgp-permanence](#TC4-ckgp-permanence), [TC.4/pure-algebraicity](#TC4-pure-algebraicity), [TC.5/ce-pushforward](#TC5-ce-pushforward), [TC.6/spinor-tautological-bundles](#TC6-spinor-tautological-bundles).

### G-projectivity-lefschetz. Pointed projectivity, tautological ample classes and stack Lefschetz

Prove projectivity of the coarse compactification for every stable pointed pair, exhibit an ample rational tautological divisor, and transfer hard Lefschetz to rational Hodge and etale cohomology of the smooth proper DM stack, with the correct twist. StableReductionPartII MC.4 proper coarse space is not all-pointed projectivity; DWP.9/hard-lefschetz-4-1-1 is scheme-only. Extend the respective owners as PartII rather than asserting their existing statements cover this. CLP Introduction p.3 also asserts full paritywise unimodality of an STE. TC.3/top-heavy establishes only opposite-degree injectivity and growth below the middle; a separate argument is needed for decrease above the middle. No perfect pairing on the STE is assumed.

Direct consumers: [TC.3/top-heavy](#TC3-top-heavy), [TC.12/homology-thirteen](#TC12-homology-thirteen), [TC.12/homology-fifteen](#TC12-homology-fifteen), [TC.12/genus-two-cohomology-fifteen](#TC12-genus-two-cohomology-fifteen), [TC.12/genus-three-cohomology](#TC12-genus-three-cohomology).

### G-mapping-class-inputs. Primary dimension and stability proofs

Collate the actual Harer vcd theorem (g≥2 unmarked, g≥1 marked), Church–Farb–Putman and Morita–Sakasai–Suzuki top-degree rational vanishing, Harer/Wahl stability with k≤(2g−2)/3, and the stable kappa/psi cohomology theorem. Both papers quote these as inputs; their primary proofs and Teichmuller-to-stack comparison have not been read in this job.

Direct consumers: [TC.1/vcd](#TC1-vcd), [TC.1/top-vcd-vanishing](#TC1-top-vcd-vanishing), [TC.2/stable-tautological-range](#TC2-stable-tautological-range).

### G-source-inputs. Primary finite-base and genus-one cohomology inputs

Read Keel’s Chow/cohomology presentation, Arbarello–Cornalba’s finite bases and divisor theorem, Petersen’s genus-one even-cohomology theorem, Getzler’s genus-one configuration/cusp computation and the earlier CLP all-genus H11 generation theorem at their original theorem/page locators. The present statements have been checked in CLP/BFP but their quoted primary proofs have not. None is promoted to a baseline declaration.

Direct consumers: [TC.1/genus-zero-cohomology](#TC1-genus-zero-cohomology), [TC.1/odd-135](#TC1-odd-135), [TC.2/genus-one-pure](#TC2-genus-one-pure), [TC.2/genus-one-even](#TC2-genus-one-even), [TC.3/cusp-ste-operations](#TC3-cusp-ste-operations), [TC.10/low-cohomology](#TC10-low-cohomology), [TC.0/cusp-moduli-identification](#TC0-cusp-moduli-identification).

### G-genus-two-inputs. Primary compact-type and local-system inputs in genus two

Read Petersen’s compact-type direct-image decomposition and local-system cohomology classification that supply CLP Propositions2.6 and2.8. Check all weights/Tate shifts and the hyperelliptic-involution parity. Verify the earlier CLP H11 theorem and degree-two tautological base independently. The Galois classification cannot be inferred merely from the present paper’s numerical graph computation.

Direct consumers: [TC.3/genus-two-even](#TC3-genus-two-even), [TC.11/genus-two-odd-galois](#TC11-genus-two-odd-galois).

### G-local-system-descent. Geometric configuration and harmonic-tensor comparison

Construct the symplectic monodromy torsor/local systems over the smooth curve stack; prove relative Kunneth, Leray degeneration and configuration diagonal restrictions, with harmonic contractions and the transposed Specht action. The imported Brauer algebra only supplies representation algebra, not these geometric maps.

Direct consumers: [TC.2/symplectic-local-systems](#TC2-symplectic-local-systems), [TC.3/local-system-quotient](#TC3-local-system-quotient), [TC.9/genus-four-local-system-traces](#TC9-genus-four-local-system-traces).

### G-known-chow. Earlier low-gonality and Chow–Kunneth ranges

Read Canning–Larson’s primary marked Hurwitz/tautological-Chow results: CKgP and A*=R* in the finite ranges c(1)=c(2)=10,c(3)=c(4)=11,c(5)=7,c(6)=5; hyperelliptic/trigonal strata through14 marks; the tetragonal filling criterion, splitting-stratum presentation and surjectivity. CLP’s recalled §5 arguments do not themselves reproduce all those earlier proofs. For the Hurwitz presentation, distinguish the intrinsic PGL2 target from an SL2 lift on which O(1), E and F exist. Prove gerbe/central descent and product-natural rational Chow transfer for the z_i and Chern generators; do not assume a universal O(1) descends to the intrinsic quotient.

Direct consumers: [TC.4/known-ckgp-ranges](#TC4-known-ckgp-ranges), [TC.5/low-gonality-input](#TC5-low-gonality-input), [TC.5/sigma-chow](#TC5-sigma-chow), [TC.5/tetragonal-global-chow](#TC5-tetragonal-global-chow).

### G-orthogonal. The valid orthogonal relative Chow theorem

Prove the rational relative orthogonal Grassmannian Chow/CKgP theorem for the actual iterated universal oriented quadratic bundles, with a selected maximal-isotropic component, or a valid flag-bundle/splitting-principle descent argument. CLP Lemma5.10’s passage from a trivial underlying vector bundle to a split quadratic form requires justification; use no arbitrary quadratic bundle assertion without it. The parabolic universal exact sequence0→U→V→U dual→0 need not be equivariantly split.

Direct consumers: [TC.6/orthogonal-universal-chow](#TC6-orthogonal-universal-chow), [TC.6/orthogonal-fibre-powers](#TC6-orthogonal-fibre-powers).

### G-mukai. Central rigidification and bundle/Chow descent gates

Prove TC.6/mukai-lift-gate and mukai-descent-gate, including family-level Mukai comparison, actual stabilizers, mu4 weights/cancelling twists and rational Chow transfer natural after every product. Existing Spin primitives and generic rigidification supply neither gate. Until then genus-seven CKgP and every endpoint using it have an explicit open proof dependency.

Direct consumers: [TC.6/mukai-lift-gate](#TC6-mukai-lift-gate), [TC.6/mukai-descent-gate](#TC6-mukai-descent-gate).

### G-finite-field-geometry. Primary hyperelliptic and quadric geometry

Read Arsie–Vistoli’s exact change-of-variables quotient (including parity), Bergstrom’s characteristic-two low-marking hyperelliptic counts and equivariant extension, canonical genus-four complete-intersection geometry and all-characteristic finite-field quadric classification/stabilizers. GN.2 local-global arithmetic is not a verified characteristic-two quadric-surface supplier. The FF.1/FF.3 finite-field polynomial inputs are exact imports but do not supply these geometric results.

Direct consumers: [TC.7/hyperelliptic-quotient](#TC7-hyperelliptic-quotient), [TC.7/hyperelliptic-marked-counts](#TC7-hyperelliptic-marked-counts), [TC.7/quadric-incidence](#TC7-quadric-incidence), [TC.7/quadric-orbit-count](#TC7-quadric-orbit-count), [TC.8/hyperelliptic-equivariant](#TC8-hyperelliptic-equivariant).

### G-symmetric-functions. Completed lambda-ring and modular characteristic calculus

Obtain completed symmetric functions in p_i,h with deg p_i=i, deg h=2, stable support2g−2+n>0, Adams psi_r(h)=h^r, psi_r(q)=q^r, plethystic Exp/Log and continuous ordinary exp(Delta). Prove coefficientwise finiteness and distinguish ordinary/plethystic exponentials. This is routed to SchurWeylSymmetricFunctionsPartII; current SchurWeyl Layer7 is fixed-degree and QSeriesAndPadicModularForms QM.0 scalar formal series does not cover it.

Direct consumers: [TC.8/getzler-kapranov](#TC8-getzler-kapranov), [TC.8/stable-graph-transform](#TC8-stable-graph-transform).

### G-computations. Finite exact certificates for graph and Euler calculations

Supply reproducible rational/integer finite certificates for BFP boundary coefficients (ordinary and equivariant); lower-genus equivariant coefficients; formal certification and published collation of Gorsky’s formula; Getzler multiplicities429,6006,186263; genus-two multiplicities264,836; the complete891 decorated graphs, all restriction entries,825 pivots,66 kernel vectors and one nonzero M_ij pairing. Specify retained flag sets and graph automorphism/excess signs. CLP’s cited software and BFP’s Maple/SF calculations are not reproduced by transcribing their outputs. The independent review reproduces Gorsky’s genus-four degree-three arithmetic by a 25-term exact enumeration, recording its coefficients and algorithm in the review report. It yields ordinary−10 and Schur2s3−6s21; the geometric orbit formula, Harer–Zagier input and published collation are not thereby formalized. Polynomial consistency checks do not generate the boundary tables or the graph matrices. These remaining tasks keep this gap open.

Direct consumers: [TC.1/lower-polynomial-counts](#TC1-lower-polynomial-counts), [TC.8/genus-four-euler](#TC8-genus-four-euler), [TC.9/genus-four-boundary-counts](#TC9-genus-four-boundary-counts), [TC.9/genus-four-equivariant-counts](#TC9-genus-four-equivariant-counts), [TC.11/basis-1-13](#TC11-basis-1-13), [TC.11/basis-1-14](#TC11-basis-1-14), [TC.11/basis-2-12](#TC11-basis-2-12), [TC.11/graph-restriction-rank](#TC11-graph-restriction-rank), [TC.11/genus-two-fifteen-base](#TC11-genus-two-fifteen-base), [TC.12/genus-one-fifteen-split](#TC12-genus-one-fifteen-split), [TC.12/high-odd-realizations](#TC12-high-odd-realizations).

### G-graph-presentations. Unpublished complete cusp-graph relations

CLP Remark7.8 announces a complete graphical presentation in forthcoming work. The existence of a spanning graphical family follows from STE generation, but no complete relation theorem is proved in the paper. Do not turn that announcement or Conjecture7.12 into a proved endpoint. This announced result is not needed by the planned endpoints and has no target consumer. The alternative self-pairing computation of Remark7.9 is instead a finite certificate covered by G-computations.

Source-coverage record only; no planned target depends on the announced theorem.

Four explicit stage requests accompany the exact-node imports:

- `SchemeAndStackFoundations:SF.5`: Extend the existing scheme exterior product, localization, affine/Grassmann bundle and Chern formulas to the rational Chow groups of finite-type stacks stratified by quotient stacks, naturally after product with every such stack. Also supply proper nonrepresentable rational pushforward with degree and excess formulas, and GRR for the universal nodal curve. The existing projective-GRR node is only for smooth quasiprojective varieties.
- `MotivesAndAlgebraicCycles:MC.2`: Extend the realization/cycle-class contract beyond smooth projective schemes to smooth possibly open DM stacks: CH^c_Q→W_(2c)H^(2c), Tate-twisted as a realization map, compatible with exterior products, proper maps, Gysin, trace and Betti/etale comparison. The existing Weil-cohomology scheme nodes do not prove this generality.
- `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk`: Import the current roadmap Layer7 fixed-degree Frobenius characteristic, Specht representations, branching and Pieri rules. Its finite-variable/fixed-degree scope suffices for hook characters and the66-dimensional induction decomposition; completion and plethystic Exp/Log are a distinct PartII gap.
- `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-9-schur-weyl-duality-for-the-orthogonal-and-symplectic-groups-the-brauer-algebra`: Import current Layer9 symplectic harmonic tensors and the Brauer contraction decomposition. Geometric descent to a local system and relative Kunneth remain an explicit additional gap.

The generic DM duality, completed symmetric functions, stack intersection/realization/Lefschetz and finite-field quadratic-geometry extensions have Part II ownership proposals in the packet. No unestablished prospective node identifier is used as a prerequisite. No theorem in current Tau Ceti is re-planned.

## Suggested Lean and acceptance

The suggested file has light, real-bodied definitions of numerical stability, integer dimension, the stable-pair order, the finite cohomological seed region and the three genus-four polynomial tables. Its theorem statements test well-foundedness, finiteness, degree, palindromicity and exact closed/open/boundary subtraction. Its examples distinguish the strict seed genus bound, unstable pairs, the −11q3 correction and the middle coefficient10605. The prototype checks types; its placeholder proofs do not verify these theorems or any geometric endpoint.

The seventeen definitions/constructions above retain their mathematical APIs and at least three discriminating checks each; marked spinor incidence has a fourth test for the quotient convention. Sixteen of their carriers are absent at the pins and stay in the reader: tautological rings and kappa classes; symplectic local systems; STEs and marking subspaces; CKgP; gonality, Hurwitz and splitting data; marked spinor incidence; quadric incidence; marking twists, equivariant weight Euler characteristic and the stable-graph transform; cusp graphs; and the oriented weight-fifteen complex. The remaining numerical stable-pair order is prototyped over existing carriers. General stack or cohomology stand-ins are not added to make an endpoint typecheck.

Independent exact arithmetic checks compare the closed and boundary tables with the open tables, test every compact palindromic coefficient and positivity, and specialize the equivariant characters to dimensions. A separate 25-term exact evaluation of Gorsky’s corrected finite formula reproduces the three-mark open Euler value−10 and its Schur class2s3−6s21; the review report preserves its algorithm and coefficients. These checks do not replace the geometric orbit formula, sieve proofs, boundary assembly or graph matrices.

The independent review accepts this target-level pass after the corrections above. All TC.0–TC.12 stages have status **planned**, with exact remaining obligations; none has status closed. The extraction coverage map has134 entries, including the two conjectures, the corrected filling criterion and the announced complete-graph-relations gap. A follow-up closes the named proof/supplier/certificate obligations rather than guessing a new source target or repeating a definition owned elsewhere.

## Bibliography and access record

- Samir Canning; Hannah Larson; Sam Payne, [Extensions of tautological rings and motivic structures in the cohomology of moduli spaces of stable curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/TautologicalExtensions.pdf). Forum of Mathematics, Pi 12 (2024), e23, 1–31; DOI 10.1017/fmp.2024.24. Read Published author copy, entire paper pp.1–31, including graph figures pp.25–27. Accessed 2026-10-19. SHA-256 `9e2dc8b19e6bd1c56e953272b3f82a345a6a6ae914527dab0778a086f0900535`.
- Jonas Bergström; Carel Faber; Sam Payne, [Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/PolynomialPointCounts.pdf). Annals of Mathematics 199 (2024), 1323–1365; DOI 10.4007/annals.2024.199.3.7. Read Published author copy, entire paper pp.1323–1365; sieve tables and equivariant refinements included. Accessed 2026-10-19. SHA-256 `9843c296d6f775472ca718be1520c2152d13f5a37dd6928e8e454c2b2d134bd3`.
- Ezra Getzler; Mikhail Kapranov, [Modular operads](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/F104F3BA8ACC4FBC07F93AC93787BA88/S0010437X98000050a.pdf/modular-operads.pdf). Compositio Mathematica 110 (1998), 65–126. Read §2 pp.74–78 (free modular graph construction); §8.1–8.13 pp.107–111 (completion, characteristic, Laplacian and graph formula). Accessed 2026-10-19. SHA-256 `098aea954a92808a9caa698f9c98fef8798e8f59d5015e7417856256970386ed`.
- Eugene Gorsky, [The equivariant Euler characteristic of moduli spaces of curves](https://arxiv.org/pdf/0906.0841). arXiv:0906.0841v3 (25 November 2013); published Advances in Mathematics 250 (2014), 588–595, not collated here. Read §§1–3, Theorems1.1,2.5,3.8, preprint pp.1–7. Independent genus-four degree-three arithmetic reproduced with the E15–E16 corrections; published collation remains open. Accessed 2026-10-19. SHA-256 `9d8caed9f8c06b45c46742888fe13fb9604d508da953f556c8c65cd51ff2c7a4`.
- Siddarth Kannan, [Euler characteristics of the universal Picard stack](https://arxiv.org/pdf/2602.09117v2). arXiv:2602.09117v2 (18 February 2026); later journal version not collated. Read §3.3 pp.10–12, especially Remark3.8 pp.11–12: prior correction of Gorsky’s genus constant and congruence modulus. No Picard-stack result is planned here. Accessed 2026-10-19. SHA-256 `0b080b6910e0b8ec494d18aa5b994f39d9e90ff04ad6a91c3808bf2e97cbd208`.
