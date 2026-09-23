# PAPER-LE-LEHUNG-LEVIN-ETAL-20: partial extraction checkpoint

Codex — codex-hjdg0j. Refs #1402. **Partial**: nine explicit gap groups remain. This is not complete inventory, proof closure or formalisation.

The source is Daniel Le, Bao V. Le Hung, Brandon Levin and Stefano Morra, [Serre weights and Breuil’s lattice conjecture in dimension three](https://doi.org/10.1017/fmp.2020.1), Forum of Mathematics, Pi 8 (2020), e5. The [arXiv v4](https://arxiv.org/abs/1608.06570v4) text, pp.1–102, was read in full, including all proof text and §6. The [135-page published author copy](https://math.rice.edu/~bl70/LLHLMlattices.pdf) was compared selectively; full collation and reconstruction of every diagram remain outstanding. PDF hashes and precise pinned provenance are in the JSON.

There are 84 items: five library imports, four planned imports and 75 missing items. Every missing item has exactly one route. Every definition/construction, including imported carriers, has a consumer API and at least three planning tests. These are test specifications unless identified as executed Python checks below. The dependency graph is acyclic but its named proof gaps remain open.

## Mathematical targets

For unramified p-adic fields and semisimple 10-generic residual GL3 representations, Theorem 3.5.2 identifies patched weight support with the predicted Serre weights, each of multiplicity one in the fixed ambient dimension. Theorem 3.5.3 supplies reduced special fibres, formally smooth equidimensional components and their count; a **nonzero** type ring is a normal Cohen–Macaulay domain. Genericity alone does not enforce determinant compatibility. E04 records the missing qualification.

For a 13-generic Deligne–Lusztig representation, Theorem 4.1.9 determines the reduction of every irreducible-cosocle lattice. Radical depth equals extension-graph distance, both directed graphs point away from the cosocle, the Loewy length is 3f−Def+1, reduction is rigid, and the reverse normalized inclusion is scaled by p to the graph distance. The exponent uses **p**, even after ramified coefficient extension: unramified descent remains a proof obligation. Here “saturated” for full lattices means the reduction of the inclusion is nonzero; this differs from the usual torsion-free-cokernel convention.

Theorem 5.1.1 proves rank-one patched freeness under its exact upper-alcove condition at shape coordinates of length at most one. Proposition 5.1.8 gives a lower-alcove obstruction. Theorem 5.2.3 constructs the gauge ideal by extension from the regular complement of the crossings. The final theorem proves locality of an automorphic lattice **up to homothety**, with fixed minimal away-p data and minimal ramification of the lift. It does not supply an explicit formula for every shape.

Global fields, level, coefficient lattices, Hecke dual convention and the unresolved auxiliary/minimality references are explicit in conventions.global. The original LLHLM18 Definition 7.3 was read: its Taylor–Wiles condition requires a subgroup GL3(F0) with |F0|>9 and cyclotomic noncontainment. It has not been replaced by an unspecified adequacy condition.

## Existing suppliers and audit boundary

Actual Mathlib declarations were read at 082e2d37e8b0463410cdb532e111cd43d5a66174: Rep and its equivariant morphisms, RootPairing, RootDatum, RootPairing.weylGroup, and the cited Nakayama lemma. Tau Ceti declarations were read at f790474821cf4256814db967cb154e7af3d0c369: TauCeti.socle, its semisimplicity and containment theorem. L01–L05 retain file locators. These carriers are imported.

The existing Young-tableau Weyl module requires a rational algebra, so it does not provide the modular Weyl module here. The existing dot action is a finite Weyl rho-shift, not the affine p-dot eta action. Quiver-specific socle work is not G1T injective theory. Negative searches are scoped evidence rather than a claim about all possible library formulations.

Reviewed audits read: DeformationAndDerivedPatchingAlgebra R03.1–R03.6 (REV-AUDIT-17) and CompletedCohomologyPartII CC.0–CC.8 (REV-AUDIT-14). No direct audit entry for LocalGaloisDeformationRings or the upstream representation roadmaps was found. Direct source reads supplement that limit.

Ownership documents read in full: AlgebraicModularFormsAndSerreWeights, SerreWeightAndLevelOptimisation, DeformationAndDerivedPatchingAlgebra, LocalGaloisDeformationRings, CompletedCohomologyPartII and CompletedCohomologyAndLocalGlobalCompatibility. Two upstream roadmaps read in full: ReductiveGroups and RepresentationTheory/RootSystems. HighestWeightTheory's characteristic-zero standing convention was checked separately. Searches also covered proposed roadmaps, packets and decompositions.

## Routes

### 1. DeformationAndDerivedPatchingAlgebra — source

The complete-local, multiplicity, support and monomial-ideal algebra is reusable within these existing layers; it is not new arithmetic patching infrastructure.

Existing stages: DeformationAndDerivedPatchingAlgebra:R03.1, DeformationAndDerivedPatchingAlgebra:R03.3, DeformationAndDerivedPatchingAlgebra:R03.6.

Items: P01, P02, T31, T32, D19.

### 2. LocalGaloisDeformationRings — source

L7 already owns arbitrary-rank bounded-height lattice moduli and potentially semistable ring/component comparisons. The GL3 shape charts and component labeling are precise source obligations within that scope.

Existing stages: LocalGaloisDeformationRings:L7.

Items: P03, T11, T12, T33, T36, T37, T38, T50, T51, T52, T53.

### 3. CompletedCohomologyPartII — source

The completed degree-zero definite unitary tower is an application of the generic completed tower, with its actual coefficient and Hecke comparison.

Existing stages: CompletedCohomologyPartII:CC.1, CompletedCohomologyPartII:CC.2, CompletedCohomologyPartII:CC.8.

Items: P04.

### 4. ModularRepresentationsOfFiniteReductiveGroups — part-ii

Existing reductive groups and characteristic-zero highest-weight theory do not supply modular rational representations, G1T injectives, Deligne–Lusztig reduction or GL3 cosocle lattices.

Import Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), Root systems (tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems), and the existing Rep and TauCeti.socle carriers. Do not reuse characteristic-zero complete reducibility in characteristic p. Construct modular rational representations, Frobenius kernels G1T and injective envelopes, translation functors and restriction to finite rational points; prove the Jantzen/Pillen/Andersen inputs of LLHLM20 §4.2. Build Deligne–Lusztig representations and their integral reduction, the GL3 translation charts, nine-point model and 6-deep Ext-one edge theorem. Add general finite-length radical/socle filtrations, multiplicity-free subobject graphs and normalized lattice inclusions. The exact target is LLHLM20 Theorem 4.1.9: for a 13-generic R, graph distance equals radical depth, both extension digraphs are oriented away from the cosocle, Loewy length is 3f−Def+1, reduction is rigid, and the reversed normalized inclusion uses p raised to graph distance. Import the weak minimal patching existence and numerical theorem from GenericGL3SerreWeightsAndLattices only up to its pre-lattice stages, and local charts from LocalGaloisDeformationRings:L7, to prove Proposition 4.3.7 before the defect induction. Never use the final lattice theorem in the globalization that proves it. The original-input and chart gaps in this partial extraction must be closed before a complete design can be accepted.

Items: D01, D02, D03, D04, D05, T01, T02, D06, D07, D08, D09, D10, T03, D11, T04, T05, T06, D12, D13, D14, T07, D15, T08, T09, T10, T13, T14, T15, T16, D16, T17, D17, T18, T19, T20, T21, T22, T23, T24, T25, T26, T27, T28, T29, T30.

### 5. GenericGL3SerreWeightsAndLattices — part-ii

R15.4 is the classical GL2 local weight recipe and R20 is classical optimization; they do not own set-valued GL3 weights, minimal unitary patching or Breuil lattice locality.

Import Commutative algebra for deformation theory and patching (DeformationAndDerivedPatchingAlgebra R03.1/R03.3/R03.5/R03.6), Local Galois deformation rings (LocalGaloisDeformationRings L7), and Completed cohomology, homology and arithmetic towers—Part II (CompletedCohomologyPartII CC.1–CC.3/CC.8). Import finite reductive representation theory from ModularRepresentationsOfFiniteReductiveGroups rather than duplicate it. First construct Herzig’s W? and the nonzero weak minimal patching functor with all four axioms and corrected fixed-level coefficients. Prove numerical multiplicity one and W_BM=W? for semisimple 10-generic unramified GL3 data (3.5.2) before using the integral lattice structure theorem. Then prove cyclicity and rank-one freeness exactly under the 13-generic type and upper-alcove condition at shape components of length ≤1 in 5.1.1; prove the converse nonfreeness 5.1.8 separately. Construct the codimension-two gauge ideal in 5.2.3 and its local descent. Finish with 5.3.3, 5.3.4, 5.3.1 and 5.3.5 under the CM definite-unitary, split-ramification, source-specific Taylor–Wiles and minimal-level conventions in this extraction. For 5.3.5 also require minimal ramification of the lift away from p; spell out CHT08 Definition 2.4.14 before implementation. Prove locality up to homothety, without claiming a full GL3 p-adic Langlands correspondence or an explicit formula for every shape. Expand §6.0.2’s level-lowering proof and all cited globalization/duality inputs; this partial brief records the target and ownership, not proof closure.

Items: D18, T34, T35, T39, T40, T41, D20, T42, T43, T44, T45, D21, T46, T47, T48, T49, D22.

The two new directions require staged contracts. First the representation roadmap supplies types, constituents and combinatorics. Then arithmetic constructs weak minimal patching and numerical multiplicity one using existing local deformation suppliers. Only these pre-lattice results feed Proposition 4.3.7. The representation roadmap then proves the lattice theorem, and arithmetic consumes it for freeness, gauges and global locality. Using final lattice locality in its own globalization would create a cycle.

## Proof spine

Closed constituent subsets recover subobjects in a multiplicity-free finite-length category. Radical paths measure radical depth; duality reverses arrows; sufficiently long paths test rigidity. The Ext-one comparison uses 6-deep weights and the still-unclosed original G1T theory.

Normal-crossing charts and arithmetic globalization prove that adjacent cosocle lattices have saturation distance one. Triangle inequalities bound saturation by graph distance. Maximal saturation at farthest vertices then implies equality everywhere, since a geodesic through any constituent extends to a farthest one. Lower-alcove defect-zero weights supply the base case. Duality and the obvious-weight graph cover all defect-zero weights, and induction on defect gives every constituent. Radical-path inclusion chains and bipartiteness yield the predicted strata, both graphs, and rigidity. T07–T30 preserve this dependency order.

For Lemma 3.6.13, elimination and the change of variables on published pp.70–71 give F[[a,b,c,d,e,f]]/(ab,ac,ae,bc,bd,cf). Its ideal is the intersection of the four coordinate primes (a,b,c), (a,b,f), (a,c,d), (b,c,e); all have height three. Squarefree monomial membership proves radicality. The surjection criterion T31 keeps Noetherianity, finite Krull dimension, equidimensionality and a finite equal minimal-prime count: pullback exhausts the minimal primes, so the kernel lies in the zero nilradical. The full chart identification remains G04.

For gauges, HK04 Proposition 3.5 requires codimension two in each fibre. Over Spec O a crossing can have codimension one in the special fibre. The original proposition and adjacent depth argument were read. The intended absolute proof uses depth at least two and the local-cohomology sequence to extend MCM sheaves across the total codimension-two locus. This proof, base change and Spec/Spf comparison remain G08; this is a tracked proof leaf, not an assertion that the gauge theorem is false.

The original EGS15 §4.1 proofs were read: multiplicity-free reduction gives cosocle lattices unique up to scaling; normalized maps and Nakayama reconstruct a lattice, and the fractional-ideal gauge determines it. The Deligne–Lusztig multiplicity-free input, unramified descent and later cyclicity lemma remain open.

## Coverage

| Source portion | Preserved here | Still required |
|---|---|---|
| §1.4 and §2 | Depth, graph, nine-point model, defect | Complete affine/type/weight recipe and all combinatorial lemmas (G01) |
| §§3.1–3.4 | Ring import and selected corrections | Kisin/descent/shape theory and original proofs (G04) |
| §3.5 | Patching axioms, multiplicity, support, split geometry endpoints | Every inductive lemma and existence input (G05) |
| §3.6 | Component labeling, monomial core and chart corrections | All charts, maps, primes and ideal identities (G04) |
| §4.1 | Finite-length APIs, lattices and split main theorem | Original reduction/descent input (G02) |
| §4.2 | Ext comparison and base-case role | Every injective/translation/socle/map theorem (G03) |
| §4.3 | Metric and defect-induction spine | Unramified descent and arithmetic closure (G02/G05) |
| §5.1 | Exact freeness/nonfreeness endpoints | Each gluing step and nonfreeness sketch (G06) |
| §5.2 | Regular complement, gauge and descent | Absolute Hartogs and base change (G08) |
| §5.3 | Global setup and four endpoints | Original automorphic/duality/minimality inputs (G07/G08) |
| §6 | All 25 numbered corrections | Original corrected locations and proof inputs (G07/G09) |

## Item index

The adjacent JSON contains statements, hypotheses, proof outlines, dependency IDs, APIs and tests. IDs below abbreviate this paper prefix.

| ID | Kind/status | Name | Locator |
|---|---|---|---|
| L01 | definition / library | Representation carrier | §4.1.1 module realisation; Mathlib/RepresentationTheory/Rep/Basic.lean:30–82 |
| L02 | definition / library | Socle | §4.1.1; TauCeti/RingTheory/SimpleModule/Socle.lean:42–80 |
| L03 | theorem / library | Nakayama vanishing | §5.1.1 proof; Mathlib/RingTheory/Nakayama.lean:118 |
| L04 | definition / library | Root pairing and integral root datum carriers | §1.4; Mathlib/LinearAlgebra/RootSystem/Defs.lean:82–109 |
| L05 | construction / library | Weyl group carrier | §1.4; Mathlib/LinearAlgebra/RootSystem/WeylGroup.lean:55 |
| P01 | construction / planned | Complete local coefficient algebra | §3.5.1 |
| P02 | theorem / planned | Maximal Cohen–Macaulay regular-local freeness | Lemma 5.1.2; Proposition 4.3.7 |
| P03 | construction / planned | Potentially crystalline framed rings | §3.5.1; Kisin 2008 Theorem 3.3.4 |
| P04 | construction / planned | Degree-zero completed arithmetic tower | §5.3, pp.90–92 |
| D01 | definition / missing | Depth in a p-alcove | Definition 2.1.9 |
| D02 | definition / missing | Extension graph | Definition 2.1.6 and Remark 2.1.7 |
| D03 | definition / missing | Graph distance | Definition 2.1.8 |
| D04 | definition / missing | Nine-point constituent model | §2.3, Definition 2.3.3 |
| D05 | definition / missing | Defect | Definition 2.3.8 |
| T01 | theorem / missing | Graph bipartiteness | Remark 2.1.11; Proposition 4.3.16 |
| T02 | theorem / missing | Longest geodesics and defect descent | Remark 4.1.10, equation (4.22), proofs of 4.3.14 and 4.3.19 |
| D06 | definition / missing | Radical and cosocle | §4.1.1 |
| D07 | construction / missing | Radical filtration | §4.1.1 |
| D08 | construction / missing | Socle filtration | §4.1.1 |
| D09 | definition / missing | Loewy length and rigidity | §4.1.1, equation (4.1) |
| D10 | definition / missing | Multiplicity-free extension digraph | §4.1.1 |
| T03 | theorem / missing | Subobjects are closed constituent subsets | Proposition 4.1.1 |
| D11 | definition / missing | Filtered extension graph and depth | §4.1.1, Proposition 4.1.2 |
| T04 | theorem / missing | Paths in Loewy filtrations | Lemma 4.1.3 and Corollary 4.1.4 |
| T05 | theorem / missing | Rigidity by continuing extension paths | Proposition 4.1.6 |
| T06 | theorem / missing | Duality reverses extension arrows | Proposition 4.1.7, corrected first digraph display (E10) |
| D12 | construction / missing | Irreducible-cosocle lattices | §4.1.2; EGS15 Lemma 4.1.1 |
| D13 | definition / missing | Normalised saturated inclusion | Definition 4.3.4 and Remark 4.3.5; normalization condition in EGS15 Lemma 4.1.2 |
| D14 | definition / missing | Saturation distance | Definition 4.3.4 and Remark 4.3.5 |
| T07 | theorem / missing | Saturation distance is a metric | Lemma 4.3.6 |
| D15 | construction / missing | Minimal constituent submodule | Lemma 4.3.2 |
| T08 | theorem / missing | Radical depth inequality for Q | Lemma 4.3.3 |
| T09 | theorem / missing | Extensions are graph edges | Lemma 4.2.6; Proposition 2.1.10 |
| T10 | theorem / missing | Graph distance bounds radical depth | Corollary 4.3.1 |
| T11 | theorem / missing | Normal-crossing shape chart | Lemma 3.6.10 and Proposition 4.3.7 setup |
| T12 | theorem / missing | Component prime distance | Lemma 3.6.10 |
| T13 | theorem / missing | Adjacent weights have saturation distance one | Proposition 4.3.7 |
| T14 | theorem / missing | Saturation is bounded by graph distance | Corollary 4.3.8 |
| T15 | theorem / missing | Adjacent normalised lattices are comparable | Lemma 4.3.9 |
| T16 | theorem / missing | Radical depth orients lattice inclusions | Lemma 4.3.10 |
| D16 | definition / missing | Predicted radical strata | Definition 4.3.11 |
| T17 | theorem / missing | Strata determine the radical graph | Lemma 4.3.12 |
| D17 | definition / missing | Maximally saturated constituent | Definition 4.3.13 |
| T18 | theorem / missing | Maximal saturation controls all distances | Proposition 4.3.14 |
| T19 | theorem / missing | Radical paths give lattice chains | Lemma 4.3.15 |
| T20 | theorem / missing | Maximal saturation predicts radical strata | Proposition 4.3.16 |
| T21 | theorem / missing | Lower-alcove defect-zero base case | Theorem 4.2.16 |
| T22 | theorem / missing | Lower-alcove base case is maximally saturated | Proposition 4.3.17 |
| T23 | theorem / missing | Every defect-zero constituent is maximally saturated | Lemma 4.3.18 |
| T24 | theorem / missing | All constituents are maximally saturated | Proposition 4.3.19 |
| T25 | theorem / missing | Graph distance equals radical depth | Theorem 4.1.9(1), first assertion |
| T26 | theorem / missing | Loewy-length formula | Theorem 4.1.9(1), second assertion |
| T27 | theorem / missing | Predicted radical extension graph | Theorem 4.1.9(2) |
| T28 | theorem / missing | Predicted full extension graph | Theorem 4.1.9(3) |
| T29 | theorem / missing | Rigidity of cosocle-lattice reduction | Theorem 4.1.9(4) |
| T30 | theorem / missing | Normalised p-power lattice inclusion | Theorem 4.1.9(5) |
| T31 | theorem / missing | Reduced equidimensional surjection criterion | Lemma 3.6.11, in its complete Noetherian local application |
| T32 | theorem / missing | Four-prime monomial quotient | Proof of Lemma 3.6.13 |
| T33 | theorem / missing | Identity-shape triple intersection | Lemma 3.6.13 |
| D18 | definition / missing | Weak minimal patching functor | Definition 3.5.1, all four axioms |
| D19 | definition / missing | Fixed-dimension Hilbert–Samuel multiplicity | §3.5.1; §6(12) correction to LLHLM18 |
| T34 | theorem / missing | Numerical Breuil–Mézard for weak minimal patching | Theorem 3.5.2, multiplicity assertion |
| T35 | theorem / missing | Weight support is predicted | Theorem 3.5.2, final assertion |
| T36 | theorem / missing | Non-generic type emptiness | Theorem 3.5.3, first assertion |
| T37 | theorem / missing | Nonzero type ring is a normal domain | Theorem 3.5.3, normal-domain assertion with E04 nonzero qualification |
| T38 | theorem / missing | Canonical component labeling | Proposition 3.6.1(1) |
| T39 | theorem / missing | Patching support respects component labels | Proposition 3.6.1(2) |
| T40 | theorem / missing | Upper-alcove condition gives rank-one freeness | Theorem 5.1.1 |
| T41 | theorem / missing | Lower-alcove short-shape obstruction | Proposition 5.1.8 |
| D20 | construction / missing | Codimension-two complement for gauges | §5.2 |
| T42 | theorem / missing | Regularity away from crossings | Lemma 5.2.1 |
| T43 | theorem / missing | Gauge on the regular open | Lemma 5.2.2 |
| T44 | theorem / missing | Global gauge ideal | Theorem 5.2.3 |
| T45 | theorem / missing | Gauge ideal descends to local data | Remark 5.2.4 |
| D21 | definition / missing | Taylor–Wiles condition in this paper | LLHLM18 Definition 7.3, published p.72; used throughout §5.3 |
| T46 | theorem / missing | Global Serre weights | Theorem 5.3.3 |
| T47 | theorem / missing | Mod-p multiplicity one | Theorem 5.3.4 |
| T48 | theorem / missing | Automorphy lifting | Theorem 5.3.1 and Remark 5.3.2 |
| T49 | theorem / missing | Breuil lattice locality | Theorem 5.3.5 |
| T50 | theorem / missing | Nonzero type ring is Cohen–Macaulay | Theorem 3.5.3, Cohen–Macaulay assertion |
| T51 | theorem / missing | Type special fibre is reduced | Theorem 3.5.3, reducedness assertion |
| T52 | theorem / missing | Type components are formally smooth and equidimensional | Theorem 3.5.3, component-geometry assertion |
| T53 | theorem / missing | Type component count | Theorem 3.5.3, component-count assertion |
| D22 | definition / missing | Patching weight support | §3.5.1, before Theorem 3.5.2 |

## Source issues

E01–E12 are proposed findings after visual/source/algebra checks, awaiting independent review; new means no correction found in the explicitly scoped search. E13–E14 were corrected in the published version. E101–E125 are the authors’ known corrections to LLHLM18, read through LLHLM20 §6, not a fresh audit of all original locations. No author contact made.

The JSON retains printed expressions, corrections, reasons, affected scope and the exact correction-search boundary. Rendered formulas were inspected where text extraction can lose stars, primes or negations. Each finding awaits independent review. No author contact was made.

- **E01** (misprint; new): Proposition 3.2.1 proof, arXiv v4 pp.22–23; published p.29, two ranges. Use 0 ≤ j′ ≤ f′−1 in both tuples of embeddings.
- **E02** (misprint; new): Proposition 3.3.9 statement, arXiv v4 p.25; published p.33. The right side must be ρ′|_{G_{K∞}}.
- **E03** (misprint; new): Lemma 3.5.12 proof, arXiv v4 p.32; published p.43, first multiplicity difference. The second term is e(M∞(sigma(tau)^circ)).
- **E04** (error; new): Theorem 3.5.3, arXiv v4 p.29; published p.38. Qualify the normal-domain assertion by R^tau_rho≠0. The Cohen–Macaulay and component statements should also be read with the zero case separated as in T36–T53.
- **E05** (misprint; new): Table 3 alpha-beta-alpha row: arXiv v4 p.53, published p.51; matching computation: arXiv p.45, published p.63. Use c22* in place of c33* (and the corresponding primed c22* in the matching computation).
- **E06** (misprint; new): Table 3 alpha-beta row matrix, arXiv v4 p.53; published p.51. Use A11=c31 c12/(c32*).
- **E07** (misprint; new): Table 3 alpha-beta row relation, arXiv v4 pp.53–54; published pp.51–52. The coefficient of d33 c21* must be +(b−c).
- **E08** (misprint; new): Table 3 continued beta-alpha row, arXiv v4 p.54; published p.52. Use c11 c33=0, as on the preceding row/page.
- **E09** (misprint; new): Identity-shape matching, arXiv v4 p.48; published p.68. Use z=t_(−1,0,1) in that sentence.
- **E10** (misprint; new): Proposition 4.1.7, arXiv v4 p.59; published p.78, first digraph isomorphism. Transpose the target digraph: Gamma(M) ≅ Gamma(M*)^op, with vertices identified by duality.
- **E11** (misprint; new): Alpha-shape c_(epsilon1,1) substitution, arXiv v4 p.47; published p.65. Add c22=c′21 to the substitution list.
- **E12** (misprint; new): Alpha-beta w0 matching substitution, arXiv v4 p.46; published p.64. Use d23=c′23.
- **E13** (misprint; Published version, abstract (2020).): arXiv v4 abstract, p.1. Deligne–Lusztig
- **E14** (misprint; Published version, introduction (2020).): arXiv v4 introduction, p.3. three-dimensional
- **E101** (gap; LLHLM20 §6(1), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(1), p.97, reporting a correction to LLHLM18 Theorem 1.1. Under the theorem hypotheses the special fibre is reduced and its number of components is at most |W?(rho^ss)∩JH(sigma(tau))|, with equality for semisimple rho.
- **E102** (error; LLHLM20 §6(2), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(2), p.97, reporting a correction to LLHLM18 Proposition 3.4. Use pairs (rho,gamma0) where rho is an F′[epsilon]/epsilon² representation of G_K∞ and gamma0 identifies its special fibre with Tdd(M)^*.
- **E103** (gap; LLHLM20 §6(3), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(3), p.97, reporting a correction to LLHLM18 after equation (3.7). Record M_A tensor_A F ≅ M for a point (M_A,rho_A,delta_A) of the framed deformation functor.
- **E104** (gap; LLHLM20 §6(4), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(4), p.97, reporting a correction to LLHLM18 after Definition 4.15. Use pairs (M_R,j_R) with j_R:M_R tensor_R F ≅ M in the descent-data category, also for the fixed-Hodge-type subcategory.
- **E105** (gap; LLHLM20 §6(5), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(5), p.97, reporting a correction to LLHLM18 Theorem 4.17 proof. Supply p-flatness and reducedness of R from the cited lemma, after acquiring its hypotheses.
- **E106** (gap; LLHLM20 §6(6), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(6), p.97, reporting a correction to LLHLM18 Lemma 5.2. For complete local Noetherian O-flat R the formula converges in lambda^−1 Mat(R[1/p][[u]]); the argument needs base-change compatibility there.
- **E107** (misprint; LLHLM20 §6(7), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(7), p.97, reporting a correction to LLHLM18 Corollary 5.13 and before Theorem 6.14. Use T1,…,T9 at both locations.
- **E108** (misprint; LLHLM20 §6(8), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(8), p.97, reporting a correction to LLHLM18 §5.3.2. Both c11 and c13 are zero modulo the maximal ideal.
- **E109** (misprint; LLHLM20 §6(9), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(9), p.97, reporting a correction to LLHLM18 §5.3.3, lines −6 and −4. Replace the two starred parameters by c13.
- **E110** (gap; LLHLM20 §6(10), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(10), p.97, reporting a correction to LLHLM18 Definition 7.1. Use Definition 6.0.1: S(U,V tensor W)_m is nonzero for a cofinite Hecke set, with m determined by the dual residual characteristic polynomials; U is unramified at p and its p-factor acts trivially on W.
- **E111** (error; LLHLM20 §6(11), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(11), p.97, reporting a correction to LLHLM18 Definition 7.11(2). Fix U and W and require automorphy of weight V at that level with those coefficients.
- **E112** (error; LLHLM20 §6(12), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(12), p.98, reporting a correction to LLHLM18 before Proposition 7.14. For support dimension at most fixed d, take d! times the degree-d Hilbert-polynomial coefficient; it is zero in lower dimension.
- **E113** (misprint; LLHLM20 §6(13), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(13), p.98, reporting a correction to LLHLM18 after Proposition 7.14. Define Sigma0 using ramification away from p.
- **E114** (error; LLHLM20 §6(14), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(14), p.98, reporting a correction to LLHLM18 Proposition 7.15 proof. Fix the stated minimal U: hyperspecial at split v≠v1, upper-triangular inverse image at v1 and hyperspecial at inert places; fix W a lattice in the product of minimal away-p types.
- **E115** (misprint; LLHLM20 §6(15), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(15), p.98, reporting a correction to LLHLM18 Proposition 7.16 proof. tau′=omega2^(−(b+1)+p(b+1)) ⊕ omega2^(−(c−1)+pa) ⊕ omega2^(−a+p(c−1)).
- **E116** (gap; LLHLM20 §6(16), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(16), p.98, reporting a correction to LLHLM18 Theorems 7.8 and 7.4 proofs. Add Proposition 6.0.2: an automorphic residual GL3 representation with split ramification outside p and the Taylor–Wiles conditions, automorphic in a reachable weight, is automorphic in some reachable weight at the specified minimal U and W.
- **E117** (misprint; LLHLM20 §6(17), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(17), p.99, reporting a correction to LLHLM18 §8.1, after Lemma 8.2. Use relative dimension 15 for R_M,rho^(tau,beta,square).
- **E118** (error; LLHLM20 §6(18), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(18), p.99, reporting a correction to LLHLM18 Corollary 8.4. Add c12 c33=0.
- **E119** (error; LLHLM20 §6(19), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(19), p.99, reporting a correction to LLHLM18 Corollary 8.4 and Proposition 8.11. Replace the final claim by R_M,rho^(tau,beta,square)/varpi being a quotient of R-tilde[[c_ii*−[c_ii*],x_j:1≤i≤3,1≤j≤9]].
- **E120** (gap; LLHLM20 §6(20), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(20), p.100, reporting a correction to LLHLM18 Proposition 8.11 proof. Use c33=c23 c31/(c21*).
- **E121** (misprint; LLHLM20 §6(21), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(21), p.100, reporting a correction to LLHLM18 Table 4 caption. Use residue-field coefficients F.
- **E122** (misprint; LLHLM20 §6(22), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(22), p.100, reporting a correction to LLHLM18 Table 5 caption. Use coefficients in R.
- **E123** (misprint; LLHLM20 §6(23), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(23), p.100, reporting a correction to LLHLM18 Table 6, entry (1,3). Use that header for the third column.
- **E124** (gap; LLHLM20 §6(24), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(24), p.100, reporting a correction to LLHLM18 Table 6, missing entries. Fill the second-column entries from Table 5 and the third-column entry from Proposition 8.3.
- **E125** (misprint; LLHLM20 §6(25), arXiv:1608.06570v4 / DOI 10.1017/fmp.2020.1 (2020).): LLHLM20 arXiv v4 §6(25), p.100, reporting a correction to LLHLM18 Table 6 alpha-beta-alpha-gamma row and caption. Delete the second c33* from the leading monodromy term and use bold a_(s_(j+1)(i)) for i=1,2,3 in the caption.

The Ext group in Corollary 4.3.1 is visibly **nonzero** in both versions. A lost negation in extracted text was rejected as an OCR artefact. The relative HK04 application, formal-monormorphism inference, height convention and possible Table 4 index remain verification tasks rather than established source errors.

## Reproducible finite checks

Run the following with Python 3; it needs only the standard library. It checks the one- and two-factor combinatorial model, minimal coordinate primes and two table counterchecks. It does not prove arbitrary products or the complete deformation presentation.

```python
from itertools import product, combinations
from collections import deque,Counter
V=[(0,0,0),(1,0,0),(0,1,0),(1,1,0),(1,-1,0),(-1,1,0),(0,0,1),(1,0,1),(0,1,1)]
D={(0,0),(1,0),(-1,0),(0,1),(0,-1),(1,-1),(-1,1)}
def adj(x,y):return x[2]!=y[2] and (x[0]-y[0],x[1]-y[1]) in D
A={x:[y for y in V if adj(x,y)] for x in V};dist={}
for x in V:
 d={x:0};q=deque([x])
 while q:
  u=q.popleft()
  for v in A[u]:
   if v not in d:d[v]=d[u]+1;q.append(v)
 assert len(d)==9;dist[x]=d
assert sum(map(len,A.values()))==30
inn={(0,0,0),(1,0,0),(0,1,0)}
for f in (1,2):
 vertices=list(product(V,repeat=f))
 metric=lambda x,y:sum(dist[a][b] for a,b in zip(x,y))
 defect=lambda x:sum(a in inn for a in x)
 for x in vertices:
  maximum=3*f-defect(x)
  far=[y for y in vertices if metric(x,y)==maximum]
  assert max(metric(x,y) for y in vertices)==maximum
  for y in vertices:
   assert any(metric(x,y)+metric(y,z)==maximum for z in far)
  for z in far:
   assert defect(z)<=defect(x)
   if defect(x)>0 and defect(z)==defect(x):
    assert any(metric(z,w)==1 and defect(w)==defect(x)-1 and metric(x,w)==maximum-1 for w in vertices)
 print('Sigma^%d: %d vertices; diameter %d; eccentricity, geodesic extension, defect descent PASS'%(f,len(vertices),3*f))
# Minimal coordinate primes of squarefree monomial ideal in Lemma3.6.13.
edges=[set(s) for s in ['ab','ac','ae','bc','bd','cf']]
covers=[set(s) for n in range(7) for s in combinations('abcdef',n) if all(set(s)&e for e in edges)]
minimal=[s for s in covers if not any(t<s for t in covers)]
assert sorted(''.join(sorted(s)) for s in minimal)==['abc','abf','acd','bce']
print('Lemma3.6.13: exactly four minimal coordinate primes of height3 PASS')
# F_101[t]/t^4; scalar polynomials as four coefficients.
p=101
add=lambda x,y:tuple((a+b)%p for a,b in zip(x,y))
neg=lambda x:tuple(-a%p for a in x)
mul=lambda x,y:tuple(sum(x[i]*y[n-i] for i in range(n+1))%p for n in range(4))
scale=lambda a,x:tuple(a*b%p for b in x)
z=(0,0,0,0);t=(0,1,0,0);t2=mul(t,t)
c12=c31=d23=t;d33=neg(t2);c13=mul(d33,c12)
plus=mul(c12,add(scale(15,d33),scale(15,mul(c31,d23))))
minus=mul(c12,add(neg(scale(15,d33)),scale(15,mul(c31,d23))))
assert plus==z and minus==(0,0,0,30)
assert add(c13,neg(mul(d33,c12)))==z
wrong_minor=add(mul(c13,c12),neg(mul(c12,c31)))
assert wrong_minor==(0,0,100,0)
print('Table3 alpha-beta: plus relation=0; printed minus=30*t^3; printed matrix minor=-t^2 PASS')
print('All checks are finite/computational, not Lean proofs of the paper.')
```

Observed output:

```text
Sigma^1: 9 vertices; diameter 3; eccentricity, geodesic extension, defect descent PASS
Sigma^2: 81 vertices; diameter 6; eccentricity, geodesic extension, defect descent PASS
Lemma3.6.13: exactly four minimal coordinate primes of height3 PASS
Table3 alpha-beta: plus relation=0; printed minus=30*t^3; printed matrix minor=-t^2 PASS
All checks are finite/computational, not Lean proofs of the paper.
```

## Resume in depth

**G01 — §§1.4–2.3: root conventions, translation charts, tame types and weight recipe.** The whole main text was read, but the item inventory omits the full definitions of affine/extended Weyl operations, Lambda_W, Tr_mu, admissibility, the p-dot action, local and algebraic Frobenius twists, Deligne–Lusztig R_s(mu), tau(s,mu), R involution, W?, W?(rho,tau), shapes and all chart-overlap and weight-combinatorics lemmas. Add individually with hypotheses, APIs, ≥3 tests, usage-derived proof dependencies; acquire LLHL19 and Herzig originals. Resume: Definitions 2.1.1–2.1.9, Propositions 2.1.5/2.1.10, §§2.2–2.3, Table 2.

**G02 — §4.1 lattice prerequisites.** EGS15 §4.1 original proofs have been read; itemise them separately. Still acquire and prove residual multiplicity-freeness and the field-of-definition/unramified descent used to replace varpi-powers by integral p-powers. Do not conflate LLHLM normalisation with the usual torsion-free-cokernel definition of saturated. Resume: EGS15 4.1.1–4.1.4; Herzig09 appendix Theorem 3.4; LLHLM20 Remark 4.3.5.

**G03 — §4.2 lower-alcove base case.** Expand every part of 4.2.4–4.2.16 separately: G1T, baby Verma modules and Q1, their socle series, rational/injective lifting, restriction to finite points, translation, U_nu, extension maps and vanishing. Read original Jantzen/Pillen/Andersen/Andersen–Kaneda/Bowman–Doty–Martin sources. Current T21 is an explicit unclosed supplier, not proof closure. Resume: Theorem 4.2.7 and its proof, then cited original inputs.

**G04 — §§3.1–3.6 local deformation geometry.** Add full Kisin module/descent datum/height/shape/semisimplicity definitions and 3.2–3.4 theorems; read LLHLM18 and LLHL19 proofs. Encode all corrected Tables 3–4, chart maps and minimal primes, including 3.6.12/14/15/16 intersections. Prove completed tensor compatibility, not just one-factor formulas. Expand 3.6.3 formal-monomorphism inference with representability/separatedness hypotheses. Typographical suspicion in Table 4 and the height convention need checking, not assertion as established errors. Resume: LLHLM18 with all §6 corrections applied; LLHLM20 §§3.1–3.4 and 3.6.

**G05 — Numerical patching and existence.** Split and prove 3.5.4–3.5.14, especially globalisation, nonzero minimal patching and defect descent. Read EG14 Appendix A, Enns, Kisin and the corrected LLHLM18 patching construction. The generic patching inverse limit belongs to R03.5; arithmetic functor and axioms belong to the proposed GL3 consumer. Resume: 3.5.13–14 and original globalisation first; then 3.5.4–12.

**G06 — §5.1 freeness and nonfreeness.** Expand all five cyclicity/gluing stages 5.1.3–7 and EGS15 Lemma 10.1.13 from its original proof. Fully prove the sketch in 5.1.8 with the required generator counts and ideal equalities. T40/T41 record the exact endpoint and missing subproofs. Resume: 5.1.3, then 5.1.4–7 with 3.6.12–16 and Figures 7–11.

**G07 — §5.3 and §6 global arithmetic.** Define the definite unitary group model, automorphic spaces, reachable weights, local/global Langlands normalization, Hecke ideals and Schikhof duality individually. Acquire CHT08 Definition 2.4.14, the precise auxiliary-v1 hypotheses, CEG+16/Le18 specialization and all level-lowering/base-change inputs of Proposition 6.0.2. Global conventions below faithfully expose these references as unclosed, not substitute a vague adequacy/minimality predicate. Resume: §5.3 setup, original LLHLM18 §§7.2–7.3 with addendum (10)–(16), then §6.0.2 originals.

**G08 — §5.2 and lattice specialization.** Prove absolute MCM Hartogs extension and the relevant flat/formally smooth base-change statement. HK04 3.5 was read and requires fibrewise codimension≥2; crossing loci have codimension one in the special fibre, so a direct Spec O application is insufficient. Also resolve Spec/Spf comparison and torsion-free specialization in (5.9), rather than assert every cosocle lattice module is free. Resume: Depth/local cohomology exact sequence at 5.2.3, then 5.2.4 and 5.3.5.

**G09 — Completion of extraction and independent verification.** Inventory is partial, not every source definition/key theorem. Split remaining grouped definitions and prerequisites. Finish published/arXiv collation and all diagrams, independently verify E01–E14 and the corrections reported by §6 against LLHLM18, then rerun ownership/library searches against the current atlas. No Lean file or proof was compiled. Resume: Use the section coverage table and per-item dependsOn; never upgrade status solely because validators pass.

## Validation

The paper checker passes. Additional integrity checks establish unique IDs, resolvable acyclic dependencies, exactly one route per missing item, and at least two API entries and three tests per definition/construction. The embedded Python finite checks pass. The only deliverables are the result JSON, this report and the handoff. No Lean file was requested or compiled; nothing is claimed formalised. Intake path validation and git diff whitespace checks are run before submission and reported in the PR.
