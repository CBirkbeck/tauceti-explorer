# PAPER-LE-LEHUNG-LEVIN-ETAL-20: partial extraction checkpoint

Codex — codex-c83e7a. Refs #1402. **Partial**: nine gap groups remain. The 84 item IDs and 39 source-issue IDs from checkpoint #2197 (Codex — codex-hjdg0j) are preserved. This continuation adds 19 items and four proposed source findings. It does not claim complete inventory, proof closure or formalisation.

The source is Daniel Le, Bao V. Le Hung, Brandon Levin and Stefano Morra, [Serre weights and Breuil’s lattice conjecture in dimension three](https://doi.org/10.1017/fmp.2020.1), Forum of Mathematics, Pi 8 (2020), e5. This continuation read all 135 pages of the [published author copy](https://math.rice.edu/~bl70/LLHLMlattices.pdf), including all six tables and seven figures. Selected images checked typography and diagrams; every diagram has not been reconstructed independently. The earlier complete reading of [arXiv v4](https://arxiv.org/abs/1608.06570v4), pp.1–102, belongs to #2197; this continuation collated its pp.12,57 and the corresponding [Morra author copy](https://www.math.univ-paris13.fr/~morra/master2.pdf) passages. Full version collation remains open. Acquisition times and hashes are in the JSON.

There are **103 items: eight library imports, five planned imports and 90 missing items**, with seven routes. Every missing item has exactly one route. Every definition/construction has at least two consumer API entries and three planning tests. The dependency graph is acyclic. These are planning tests unless explicitly included among the executed finite checks below.

## Mathematical targets

For unramified p-adic fields and semisimple 10-generic residual GL3 representations, Theorem 3.5.2 identifies patched weight support with the predicted Serre weights, each of multiplicity one in the fixed ambient dimension. Theorem 3.5.3 supplies reduced special fibres, formally smooth equidimensional components and their count; a **nonzero** type ring is a normal Cohen–Macaulay domain. Genericity alone does not enforce determinant compatibility. E04 records the missing qualification.

For a 13-generic Deligne–Lusztig representation, Theorem 4.1.9 determines the reduction of every irreducible-cosocle lattice. Radical depth equals extension-graph distance, both directed graphs point away from the cosocle, the Loewy length is 3f−Def+1, reduction is rigid, and the reverse normalized inclusion is scaled by p to the graph distance. The exponent uses **p**, even after ramified coefficient extension: unramified descent remains a proof obligation. Here “saturated” for full lattices means the reduction of the inclusion is nonzero; this differs from the usual torsion-free-cokernel convention.

Theorem 5.1.1 proves rank-one patched freeness under its exact upper-alcove condition at shape coordinates of length at most one. Proposition 5.1.8 gives a lower-alcove obstruction. Theorem 5.2.3 constructs the gauge ideal by extension from the regular complement of the crossings. The final theorem proves locality of an automorphic lattice **up to homothety**, with fixed minimal away-p data and minimal ramification of the lift. It does not supply an explicit formula for every shape.

Global fields, level, coefficient lattices, Hecke dual convention and the unresolved auxiliary/minimality references are explicit in conventions.global. The original LLHLM18 Definition 7.3 was read: its Taylor–Wiles condition requires a subgroup GL3(F0) with |F0|>9 and cyclotomic noncontainment. It has not been replaced by an unspecified adequacy condition.

## Existing suppliers and audit boundary

The following baseline audit and ownership record is retained from #2197; it is not a claim that all those original reads were newly repeated.

Actual Mathlib declarations were read at 082e2d37e8b0463410cdb532e111cd43d5a66174: Rep and its equivariant morphisms, RootPairing, RootDatum, RootPairing.weylGroup, and the cited Nakayama lemma. Tau Ceti declarations were read at f790474821cf4256814db967cb154e7af3d0c369: TauCeti.socle, its semisimplicity and containment theorem. L01–L05 retain file locators. These carriers are imported.

The existing Young-tableau Weyl module requires a rational algebra, so it does not provide the modular Weyl module here. The existing dot action is a finite Weyl rho-shift, not the affine p-dot eta action. Quiver-specific socle work is not G1T injective theory. Negative searches are scoped evidence rather than a claim about all possible library formulations.

Reviewed audits read: DeformationAndDerivedPatchingAlgebra R03.1–R03.6 (REV-AUDIT-17) and CompletedCohomologyPartII CC.0–CC.8 (REV-AUDIT-14). No direct audit entry for LocalGaloisDeformationRings or the upstream representation roadmaps was found. Direct source reads supplement that limit.

Ownership documents read in full: AlgebraicModularFormsAndSerreWeights, SerreWeightAndLevelOptimisation, DeformationAndDerivedPatchingAlgebra, LocalGaloisDeformationRings, CompletedCohomologyPartII and CompletedCohomologyAndLocalGlobalCompatibility. Two upstream roadmaps read in full: ReductiveGroups and RepresentationTheory/RootSystems. HighestWeightTheory's characteristic-zero standing convention was checked separately. Searches also covered proposed roadmaps, packets and decompositions.

The continuation additionally read the pinned Mathlib `Algebra/Homology/LocalCohomology.lean` in full and `AlgebraicGeometry/Modules/Tilde.lean` at `tildeEquiv`. L06–L08 reuse the Ext-colimit local cohomology functor, its radical invariance and the affine quasi-coherent equivalence. The local-cohomology file explicitly leaves derived/Čech comparison and long exact sequences as future work. Tau Ceti’s `Scheme/Regular.lean` Hartogs result concerns rational functions on an open of dimension at most one; it is not the needed coherent MCM extension theorem.

Reviewed SF.0/SF.2 targets and R03.3 targets/evidence were checked before adding routes. Existing general Hartogs routes in PAPER-GILLE-PARIMALA-26/130–135 and PAPER-CESNAVICIUS-19/hartogs and coherent base change in PAPER-BENOIST-19/185 supply the ownership precedent. SF.0 owns coherent extension; SF.2 owns sections/base-change comparison; R03.3/R03.6 own depth and specialization algebra. No new roadmap was added. Final input screening includes the concurrently merged LLHLM23 extraction: the existing two candidates are broadened to all rank in their common stages, while the present lattice endpoint remains GL3. Integral Weyl modules are imported from PA.1, affine combinatorics from RootSystemsPartIIDominanceAndDemazure, and the common patching construction from the existing all-rank CEGGPS candidate; the route briefs record this reconciliation.

## Routes

### 1. DeformationAndDerivedPatchingAlgebra — source

Existing stages: DeformationAndDerivedPatchingAlgebra:R03.1, DeformationAndDerivedPatchingAlgebra:R03.3, DeformationAndDerivedPatchingAlgebra:R03.6.

The complete-local, multiplicity, support and monomial-ideal algebra is reusable within these existing layers; it is not new arithmetic patching infrastructure.

Items: P01, P02, T31, T32, D19, P05, D25, T56, T57, T62, T63, T65.

### 2. LocalGaloisDeformationRings — source

Existing stages: LocalGaloisDeformationRings:L7.

L7 already owns arbitrary-rank bounded-height lattice moduli and potentially semistable ring/component comparisons. The GL3 shape charts and component labeling are precise source obligations within that scope.

Items: P03, T11, T12, T33, T36, T37, T38, T50, T51, T52, T53.

### 3. CompletedCohomologyPartII — source

Existing stages: CompletedCohomologyPartII:CC.1, CompletedCohomologyPartII:CC.2, CompletedCohomologyPartII:CC.8.

The completed degree-zero definite unitary tower is an application of the generic completed tower, with its actual coefficient and Hecke comparison.

Items: P04.

### 4. ModularRepresentationsOfFiniteReductiveGroups — part-ii

Existing reductive groups and characteristic-zero highest-weight theory do not supply modular rational representations, G1T injectives, Deligne–Lusztig reduction or GL3 cosocle lattices.

Import Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), Root systems (tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems), and the existing Rep and TauCeti.socle carriers. Do not reuse characteristic-zero complete reducibility in characteristic p. Construct modular rational representations, Frobenius kernels G1T and injective envelopes, translation functors and restriction to finite rational points; prove the Jantzen/Pillen/Andersen inputs of LLHLM20 §4.2. Build Deligne–Lusztig representations and their integral reduction, the GL3 translation charts, nine-point model and 6-deep Ext-one edge theorem. Add general finite-length radical/socle filtrations, multiplicity-free subobject graphs and normalized lattice inclusions. The exact target is LLHLM20 Theorem 4.1.9: for a 13-generic R, graph distance equals radical depth, both extension digraphs are oriented away from the cosocle, Loewy length is 3f−Def+1, reduction is rigid, and the reversed normalized inclusion uses p raised to graph distance. Import the weak minimal patching existence and numerical theorem from GenericGL3SerreWeightsAndLattices only up to its pre-lattice stages, and local charts from LocalGaloisDeformationRings:L7, to prove Proposition 4.3.7 before the defect induction. Never use the final lattice theorem in the globalization that proves it. The original-input and chart gaps in this partial extraction must be closed before a complete design can be accepted. Reconcile the concurrently merged PAPER-LE-LEHUNG-LEVIN-ETAL-23 route: import integral Weyl/dual Weyl modules from PotentialAutomorphyInfrastructure:PA.1 and the common rational-module interface coordinated with ReductiveGroupsIntegralRepresentationsPartII. Import affine combinatorics from RootSystemsPartIIDominanceAndDemazure. Place the shared all-rank Deligne–Lusztig/Serre foundation before the specialized GL3 lattice and G1T obligations; do not create a second foundation here.

Items: D01, D02, D03, D04, D05, T01, T02, D06, D07, D08, D09, D10, T03, D11, T04, T05, T06, D12, D13, D14, T07, D15, T08, T09, T10, T13, T14, T15, T16, D16, T17, D17, T18, T19, T20, T21, T22, T23, T24, T25, T26, T27, T28, T29, T30, T64.

### 5. GenericGL3SerreWeightsAndLattices — part-ii

R15.4 is the classical GL2 local weight recipe and R20 is classical optimization; they do not own set-valued GL3 weights, minimal unitary patching or Breuil lattice locality.

Import Commutative algebra for deformation theory and patching (DeformationAndDerivedPatchingAlgebra R03.1/R03.3/R03.5/R03.6), Local Galois deformation rings (LocalGaloisDeformationRings L7), and Completed cohomology, homology and arithmetic towers—Part II (CompletedCohomologyPartII CC.1–CC.3/CC.8). Import finite reductive representation theory from ModularRepresentationsOfFiniteReductiveGroups rather than duplicate it. First construct Herzig’s W? and the nonzero weak minimal patching functor with all four axioms and corrected fixed-level coefficients. Prove numerical multiplicity one and W_BM=W? for semisimple 10-generic unramified GL3 data (3.5.2) before using the integral lattice structure theorem. Then prove cyclicity and rank-one freeness exactly under the 13-generic type and upper-alcove condition at shape components of length ≤1 in 5.1.1; prove the converse nonfreeness 5.1.8 separately. Construct the codimension-two gauge ideal in 5.2.3 and its local descent. Finish with 5.3.3, 5.3.4, 5.3.1 and 5.3.5 under the CM definite-unitary, split-ramification, source-specific Taylor–Wiles and minimal-level conventions in this extraction. For 5.3.5 also require minimal ramification of the lift away from p; spell out CHT08 Definition 2.4.14 before implementation. Prove locality up to homothety, without claiming a full GL3 p-adic Langlands correspondence or an explicit formula for every shape. Expand §6.0.2’s level-lowering proof and all cited globalization/duality inputs; this partial brief records the target and ownership, not proof closure. Import the absolute coherent Hartogs and ideal extension interface from SchemeAndStackFoundations:SF.0, the local-cohomology comparison and flat open-base-change interface from SF.2, and CM localization and torsion-free specialization from R03.3/R03.6. Compute gauges on ordinary spectra of complete rings. The source image is MCM; the target becomes free only under 5.1.1. Preserve these asymmetrical hypotheses. The concurrent LLHLM23 extraction broadens this same candidate to all-rank generic Breuil–Mezard/Serre theory. Import the common exact weak/minimal functor construction from CompletedCohomologyAndLocalGlobalCompatibilityPartIIPatchedGLdDensity, and specify only the present source-specific arithmetic application and stronger GL3 lattice hypotheses here. Keep its numerical pre-lattice stages before the lattice consumer.

Items: D18, T34, T35, T39, T40, T41, D20, T42, T43, T44, T45, D21, T46, T47, T48, T49, D22.

### 6. SchemeAndStackFoundations — source

Existing stages: SchemeAndStackFoundations:SF.0.

The same coherent-Hartogs owner already used by PAPER-GILLE-PARIMALA-26/130–135 and PAPER-CESNAVICIUS-19/hartogs supplies arbitrary coherent full-support MCM extension and embedded ideal closure. Import the existing affine module equivalence and R03.3 depth. GL3 gauge modules consume this general theory.

Items: D23, D24, T58, T59, T61.

### 7. SchemeAndStackFoundations — source

Existing stages: SchemeAndStackFoundations:SF.2.

Own the comparison from existing Ext-colimit local cohomology to the localization exact sequence and canonical flat base change for sections/ideal closures. This extends the coherent direct-image interface already used by PAPER-BENOIST-19/185. It does not duplicate torsion étale proper/smooth base change.

Items: T54, T55, T60.

The two new directions require staged contracts. First the representation roadmap supplies types, constituents and combinatorics. Then arithmetic constructs weak minimal patching and numerical multiplicity one using existing local deformation suppliers. Only these pre-lattice results feed Proposition 4.3.7. The representation roadmap then proves the lattice theorem, and arithmetic consumes it for freeness, gauges and global locality. Using final lattice locality in its own globalization would create a cycle.

## Proof spine

Closed constituent subsets recover subobjects in a multiplicity-free finite-length category. Radical paths measure radical depth; duality reverses arrows; sufficiently long paths test rigidity. The Ext-one comparison uses 6-deep weights and the still-unclosed original G1T theory.

Normal-crossing charts and arithmetic globalization prove that adjacent cosocle lattices have saturation distance one. Triangle inequalities bound saturation by graph distance. Maximal saturation at farthest vertices then implies equality everywhere, since a geodesic through any constituent extends to a farthest one. Lower-alcove defect-zero weights supply the base case. Duality and the obvious-weight graph cover all defect-zero weights, and induction on defect gives every constituent. Radical-path inclusion chains and bipartiteness yield the predicted strata, both graphs, and rigidity. T07–T30 preserve this dependency order.

For Lemma 3.6.13, elimination and the change of variables on published pp.70–71 give F[[a,b,c,d,e,f]]/(ab,ac,ae,bc,bd,cf). Its ideal is the intersection of the four coordinate primes (a,b,c), (a,b,f), (a,c,d), (b,c,e); all have height three. Squarefree monomial membership proves radicality. The surjection criterion T31 keeps Noetherianity, finite Krull dimension, equidimensionality and a finite equal minimal-prime count: pullback exhausts the minimal primes, so the kernel lies in the zero nilradical. The full chart identification remains G04.

For gauges, HK04 Proposition 3.5 requires codimension two in each fibre. Over Spec O a crossing can have codimension one in the special fibre. The original proposition and adjacent depth argument were read. T55–T58 and T65 give the absolute proof using depth at least two on the removed locus. T60 proves flat base change of the embedded ideal. T62 uses ordinary spectra of complete rings, so an adic-open comparison is unnecessary. This clarifies the citation rather than asserting a failure of the gauge theorem. The remaining arithmetic specialization/duality input is G08.

The original EGS15 §4.1 proofs were read: multiplicity-free reduction gives cosocle lattices unique up to scaling; normalized maps and Nakayama reconstruct a lattice, and the fractional-ideal gauge determines it. The Deligne–Lusztig multiplicity-free input, unramified descent and later cyclicity lemma remain open.

## Absolute extension and specialization

Let A be the complete type ring, Z its locus of intersections of special-fibre components, and U its complement in the **ordinary** spectrum. The relevant condition is that every point of Z has total-space height at least two. It is not a fibrewise codimension-two assertion over the coefficient DVR.

A full-support MCM source module has depth at least two at these points (T57). Prime avoidance gives an I-regular pair from these stalk depths (T65), and the local-cohomology restriction sequence (T55–T56) identifies the module with sections on U. T55 requires the Noetherian comparison between Ext-colimit local cohomology and support cohomology. The proof sources are [Stacks 0BJA](https://stacks.math.columbia.edu/tag/0BJA), [0952](https://stacks.math.columbia.edu/tag/0952), [0955](https://stacks.math.columbia.edu/tag/0955) and [0A6T](https://stacks.math.columbia.edu/tag/0A6T). Injective torsion, the associated-prime criterion and the regular-element depth formula remain explicit shared foundational proof inputs. This is a mathematical planning proof, not a claim that the comparison is implemented.

For J⊂A, define H_U(J) as sections of J on U, embedded in A through the Hartogs identification. It is a finite ideal, and its associated sheaf is the open pushforward (T59). This ideal can exceed J: over k[x,y], the punctured-plane closure of (x,y) is A. The product ideal in the gauge proof must therefore not simply be assumed MCM. Only the patched source is extended by its MCM property. The rank-one target is free under the precise hypothesis of 5.1.1; T61 moves that finite free factor through extension.

For a flat A-algebra B, tensor preserves the finite principal-open equalizer computing sections. Thus H_U(J)B=H_(U_B)(JB) **as embedded ideals**, not only as abstract modules (T54,T60; [Stacks 02KH](https://stacks.math.columbia.edu/tag/02KH)). In the paper B=A[[x_1,…,x_h]]. Reduced special fibres identify their minimal primes and crossing opens (T62). This proves the required descent formulation on ordinary spectra without replacing localization by adic completion.

Finally let an injection M→A have image I containing a power of the coefficient uniformizer. Under A→O to a DVR with nonzero uniformizer image, the map becomes an isomorphism over Frac(O). Its specialized kernel is exactly O-torsion and its image is IO. Hence (M tensor_A O)/torsion ≅ IO (T63). Raw specialization need not be rank one free: for I=(pi,t) in O[[t]] and t↦0 it is O⊕O/(pi), whose image is pi O. The global Schikhof/Pontryagin identification needed to connect this algebra to the automorphic lattice still requires the original references in G08.

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
| §5.2 | Absolute Hartogs, embedded ideal base change and ordinary-Spec descent | Underlying chart/full-support inputs (G04/G05); implementation of general depth/comparison primitives |
| §5.3 | Global setup and four endpoints | Original automorphic/duality/minimality inputs (G07/G08) |
| §6 | All 25 numbered corrections | Original corrected locations and proof inputs (G07/G09) |

## Item index

| ID | Kind / status | Name | Locator |
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
| L06 | construction / library | Local cohomology as an Ext colimit | https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/LocalCohomology.lean, definition localCohomology |
| L07 | theorem / library | Radical invariance of local cohomology | https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/LocalCohomology.lean, localCohomology.isoOfSameRadical |
| L08 | construction / library | Affine module and quasi-coherent sheaf equivalence | https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Tilde.lean, AlgebraicGeometry.tildeEquiv |
| P05 | definition / planned | Depth and full-support maximal Cohen–Macaulay modules | Stacks 10.103.1,10.103.8; 47.11; LLHLM20 Definition3.5.1 and proof5.2.3 |
| D23 | construction / missing | Sections on a finite union of principal opens | Stacks02KH proof in degree zero; LLHLM20 Remark5.2.4, underlying ordinary spectra |
| D24 | construction / missing | Hartogs closure of an ideal | LLHLM20 Theorem5.2.3 and Remark5.2.4; absolute replacement for the HK04 citation |
| D25 | construction / missing | Torsion-free specialization over a DVR | LLHLM20 proof5.3.5, immediately before (5.9) |
| T54 | theorem / missing | Flat base change for sections on an open | Stacks02KH, Lemma30.5.2, degree-zero affine-base case |
| T55 | theorem / missing | Local-cohomology restriction exact sequence | HK04 (3.5.1); Stacks0BJA Lemma47.8.2,0955 Lemma47.10.1,0A6T Lemma51.2.1 |
| T56 | theorem / missing | Depth two annihilates the first local cohomology groups | Stacks0AVY Lemma47.11.1 |
| T57 | theorem / missing | Full-support Cohen–Macaulay modules localize with full depth | Stacks00N2 Lemma10.103.11 and Definition10.103.8 |
| T58 | theorem / missing | Absolute Hartogs extension for a full-support MCM module | Stacks0E9I Lemma31.5.11; LLHLM20 proof5.2.3 |
| T59 | theorem / missing | Coherent ideal extension from the Hartogs open | LLHLM20 gauge ideal; Stacks0E9I and quasi-compact-open quasi-coherence |
| T60 | theorem / missing | Hartogs ideal closure commutes with flat scalar extension | Stacks02KH and LLHLM20 Remark5.2.4 |
| T61 | theorem / missing | Hartogs extension and a finite free target | LLHLM20 Theorem5.2.3, last displayed equality |
| T62 | theorem / missing | Crossing opens pull back under adjoining formal variables | LLHLM20 §5.2 setup and Remark5.2.4, with Spf notation made explicit |
| T63 | theorem / missing | DVR specialization of a lattice image | Algebraic clarification of LLHLM20 (5.9) |
| T64 | theorem / missing | Interior degree of the extension graph | Definition2.1.6 and Remark2.1.7, published p.14/arXiv v4 p.12, corrected E15 |
| T65 | theorem / missing | Stalkwise depth two gives a regular pair on the support ideal | Support-depth step in Stacks0E9I; independent prime-avoidance derivation for T58 |

## Continuation proof contracts

The complete statements, dependencies and all earlier APIs remain in the JSON. The additional contracts follow.

### L06 — Local cohomology as an Ext colimit

For a commutative ring A, ideal I and natural number q, localCohomology I q is the functor on ModuleCat A given by colim_n Ext^q_A(A/I^n,−).

Proof/input boundary: Read the entire pinned file. Its comparison to derived torsion/Čech cohomology and long exact sequences are explicitly future work; those statements are not supplied by this carrier.

API:

- `use_existing_colimit`: Import localCohomology rather than define a second module. Consumer: T55–T56.
- `local_cohomology_map`: Use its functor map for A-linear module maps. Consumer: Hartogs naturality.
- `change_support_radical`: Use L07 when the defining ideal changes without changing its radical. Consumer: D24.

Planning tests:

- I=A gives zero in every degree since all quotients are zero.
- For I=0 the cofinal positive powers give H^0=M and H^q=0 for q>0.
- An A-linear identity induces the identity map by the functor laws.

### L07 — Radical invariance of local cohomology

For Noetherian commutative A and ideals I,J with equal radicals, localCohomology I q and localCohomology J q are naturally isomorphic for every q.

Proof/input boundary: The pinned statement constructs the natural isomorphism via the cofinal diagram of ideals whose radical contains I.

### L08 — Affine module and quasi-coherent sheaf equivalence

For a commutative ring A, M↦M-tilde is an equivalence from ModuleCat A to quasi-coherent O_Spec(A)-modules.

Proof/input boundary: Read the declaration and isQuasicoherent_iff_isIso_fromTildeΓ immediately above it. Coherence and Hartogs extension require additional results.

API:

- `module_to_affine_sheaf`: Use the functor of tildeEquiv for finite modules. Consumer: T55,T58.
- `affine_sections_inverse`: Use the inverse/global-sections functor and unit. Consumer: D23.
- `transport_maps`: Transport A-linear maps to sheaf maps using the equivalence. Consumer: T44.

Planning tests:

- The module A corresponds to the structure sheaf.
- Zero corresponds to zero.
- An isomorphism of modules induces an isomorphism of associated sheaves.

### P05 — Depth and full-support maximal Cohen–Macaulay modules

For Noetherian A, ideal I and finite M, depth_I(M) is the supremum of lengths of M-regular sequences in I, with value infinity when IM=M. For local A, depth(M) uses its maximal ideal. M is Cohen–Macaulay if depth(M)=dim Supp(M), and maximal Cohen–Macaulay if depth(M)=dim A. Full support means Supp(M)=Spec A and is a separate condition.

Proof/input boundary: The reviewed R03.3 audit finds regular sequences and Rees Ext-vanishing infrastructure, but no depth or CM predicate. Import that owner; do not create a GL3-specific depth theory.

API:

- `depth_regular_sequence`: A regular sequence in I of length n gives depth_I(M)≥n. Consumer: T56.
- `cm_localize`: Apply T57 to localizations. Consumer: T58.
- `full_support_not_automatic`: Require full support when replacing dim Supp(M_P) by dim A_P. Consumer: T44.

Planning tests:

- A nonzero finite free module over a regular local ring of dimension d has depth d.
- For A=k[[x,y]], A/(x) is CM of dimension one but not MCM over A.
- For M=0 or IM=M use infinity and do not invoke a nonexistent first nonzero local-cohomology degree.

### D23 — Sections on a finite union of principal opens

Let A be commutative, I=(f_1,…,f_r), U=Spec A minus V(I), and M an A-module. Define Sec_U(M)=Gamma(U,M-tilde). By the sheaf axiom it is the kernel of product_i M[f_i^−1]→product_(i<j) M[(f_i f_j)^−1], whose (i,j)-component is the difference of the two restrictions. The empty cover has zero sections.

Proof/input boundary: All intersections of the chosen opens are affine. Restriction identifies the module on each principal open with localization; compatible tuples are precisely sections.

API:

- `sections_restrict`: Construct the natural restriction M→Sec_U(M). Consumer: T55,T58.
- `sections_change_generators`: Canonical identification for two finite lists defining the same open U. Consumer: D24.
- `sections_flat_base_change`: Use T54 for an A-flat algebra B. Consumer: T60.

Planning tests:

- A one-element unit cover gives Sec_U(M)=M.
- For A=k[x,y] and U=D(x) union D(y), a Laurent monomial lies in both localizations exactly when both exponents are nonnegative.
- For I=0, U is empty and sections are zero.

### D24 — Hartogs closure of an ideal

Let A be Noetherian, U⊂Spec A a quasi-compact open and suppose A→Gamma(U,O_U) is an isomorphism. For an ideal J⊂A define H_U(J) to be Gamma(U,J-tilde|U), embedded in A through this isomorphism. The embedding, rather than an abstract isomorphism class, is part of the construction.

Proof/input boundary: The inclusion J-tilde→O induces an injection on sections. Its image is an A-submodule of A, hence an ideal; Noetherianness makes it finite.

API:

- `ideal_le_hartogs`: J⊂H_U(J) via restriction. Consumer: T44.
- `hartogs_restrict`: The associated sheaf of H_U(J) restricts to J-tilde on U; use quasi-coherence of a quasi-compact open pushforward. Consumer: T59.
- `hartogs_flat`: For flat B, identify H_U(J)B with H_(U_B)(JB) under the induced structure-sheaf isomorphism. Consumer: T60.

Planning tests:

- U=Spec A gives H_U(J)=J.
- For A=k[x,y], U punctured at (x,y), H_U((x,y))=A.
- For the same U, H_U((x))=(x); a codimension-one divisor is not erased.

### D25 — Torsion-free specialization over a DVR

Let A→O be a ring map to a DVR and M a finite A-module. Set M_O^tf=(M tensor_A O)/T, where T consists of elements killed by a nonzero element of O. This is specialization followed by the torsion-free quotient; it is not generally the raw tensor product.

Proof/input boundary: Use the existing torsion-submodule and quotient constructions. The new interface records the specialization order and the particular image comparison T63.

API:

- `specialize_tf_map`: An A-linear map induces a map on torsion-free specializations. Consumer: T63.
- `specialize_tf_generic`: Tensoring M_O^tf with Frac(O) agrees with tensoring M with Frac(O). Consumer: T63.
- `specialize_tf_rank_one`: Use T63 for a lattice image containing a nonzero power of the coefficient uniformizer. Consumer: T49.

Planning tests:

- M=A gives O.
- M=A⊕A/(pi), with pi mapping to a nonzero nonunit, gives O after removing torsion.
- For A=O[[t]], I=(pi,t), t↦0, the raw specialization is O⊕O/(pi), while its torsion-free quotient maps isomorphically onto pi O.

### T54 — Flat base change for sections on an open

Let A→B be flat, U⊂Spec A quasi-compact open and M an A-module. Then Sec_U(M) tensor_A B→Sec_(U_B)(M tensor_A B) is an isomorphism, where U_B is the inverse image open in Spec B.

Proof/input boundary: Use a finite principal-open cover. Tensoring with B preserves its equalizer because B is flat, and preserves the finite products. Localization commutes with tensor. These identifications also identify the restriction maps, so this is the canonical base-change map. No properness or formal-scheme theorem is needed.

### T55 — Local-cohomology restriction exact sequence

For Noetherian A, ideal I, U=Spec A minus V(I), and A-module M, the Ext-colimit local cohomology of L06 fits functorially into 0→H_I^0(M)→M→Sec_U(M)→H_I^1(M)→0.

Proof/input boundary: Compare the Ext colimit with derived I-power torsion using an injective resolution and exact filtered colimits. For Noetherian A this agrees with support cohomology (0955). The augmented finite localization Čech complex computes that support functor (0952/0A6T). Its first two cohomology groups are the kernel and cokernel of M→Sec_U(M). The Noetherian comparison is essential, not a theorem already provided by L06.

### T56 — Depth two annihilates the first local cohomology groups

For Noetherian A, finite M and ideal I, if depth_I(M)≥2 then H_I^0(M)=H_I^1(M)=0. If IM=M both groups also vanish.

Proof/input boundary: A regular sequence in I of length two gives Ext_A^q(A/I^n,M)=0 for q<2 for every n, using equality of depth for I and I^n. Pass to the Ext colimit. Equivalently use the regular-element induction in 47.11.1. If IM=M, finite generation gives support disjoint from V(I), so these groups vanish.

### T57 — Full-support Cohen–Macaulay modules localize with full depth

For Noetherian local A and finite Cohen–Macaulay M with Supp(M)=Spec A, every localization M_P has depth_A_P(M_P)=dim A_P. In particular its depth is at least two at primes of height at least two.

Proof/input boundary: CM localizes by 10.103.11. Support localizes to all of Spec A_P by the full-support assumption. Thus the CM depth equals dim A_P. This supplies the stalkwise condition and avoids the false inference from MCM to support on every component in general.

### T58 — Absolute Hartogs extension for a full-support MCM module

Let A be a Noetherian local ring, M finite Cohen–Macaulay with full support, and Z⊂Spec A closed with every point of height at least two. For j:U=Spec A minus Z→Spec A, M-tilde→j_*j^*M-tilde is an isomorphism. The conclusion also holds for any coherent sheaf on a locally Noetherian scheme whose stalks have depth at least two on the complement.

Proof/input boundary: By T57 every removed stalk has depth at least two. On each affine neighborhood T65 and T56 give vanishing in degrees zero and one, and T55 identifies the restriction as an isomorphism. These maps are natural and glue. This uses absolute stalk depths; the relative fibrewise codimension condition in HK04 3.5 is not asserted for the special-fibre crossings.

### T59 — Coherent ideal extension from the Hartogs open

Under D24, H_U(J) is a finite ideal of A, its associated sheaf is j_*(J-tilde|U), and it restricts to J-tilde on U. If J-tilde has depth at least two on the complement, H_U(J)=J.

Proof/input boundary: The finite principal-cover equalizer commutes with localization, so its sheaf is the open pushforward and restricts correctly. As a submodule of Noetherian A it is finite. For the final assertion apply absolute Hartogs to J-tilde. Do not claim an arbitrary initial product ideal is already MCM.

### T60 — Hartogs ideal closure commutes with flat scalar extension

Let A→B be flat between Noetherian rings, let U⊂Spec A be quasi-compact and assume A≅Sec_U(A). For J⊂A, B≅Sec_(U_B)(B) canonically and H_U(J)B=H_(U_B)(JB) as embedded ideals of B.

Proof/input boundary: Apply T54 first to A and then to J. Flatness identifies J tensor_A B with JB and H_U(J) tensor_A B with its embedded extension ideal. The comparison is compatible with both inclusions into B. This proves equality of ideals, not merely an abstract module isomorphism.

### T61 — Hartogs extension and a finite free target

Let A,U satisfy D24, J⊂A and L a finite free A-module. Then j_*j^*(J L) is canonically H_U(J) tensor_A L inside L-tilde. For rank one this is H_U(J)L and is independent of the chosen basis of L.

Proof/input boundary: After a basis choice both sides are finite direct sums of the same ideal-section module; the equalizer commutes with finite sums. Naturality under GL(L) makes the isomorphism independent of basis. In rank one rescaling the generator by a unit preserves the embedded ideal.

### T62 — Crossing opens pull back under adjoining formal variables

Let A be Noetherian complete local over a DVR O, A/varpi reduced, and let P_i⊂A be the inverse images of the finitely many minimal primes of A/varpi. Put B=A[[t_1,…,t_h]]. The minimal primes of B/varpi are P_i B/varpi. For Z_A=union_(i<j) V(P_i+P_j), its inverse image in Spec B is the crossing locus Z_B of the special fibre. Hence U_B=Spec B minus Z_B is the inverse image of U_A. All spectra here are ordinary spectra of the complete rings.

Proof/input boundary: A→B is flat and finite intersections extend under a flat map. Each quotient B/P_iB=(A/P_i)[[t]] is a domain. Since the intersection of the P_i modulo varpi is zero, these extended primes are exactly the minimal primes. The ideals of pairwise intersections extend to their sums. The paper has precisely B=A[[x_1,…,x_h]] for the type quotient; no general equivalence of open subsets of Spec and Spf is claimed.

### T63 — DVR specialization of a lattice image

Let A be Noetherian, pi∈A, u:M→A an injection from a finite module, and I=im(u), with pi^n A⊂I for some n. Let a:A→O be a map to a DVR with a(pi) nonzero. The induced map M tensor_A O→O has image IO and torsion kernel; it identifies M_O^tf with the nonzero ideal IO. Thus M_O^tf is free of rank one even when the raw specialization has torsion.

Proof/input boundary: After inverting pi, u becomes an isomorphism because its cokernel is killed by pi^n. After tensoring with Frac(O) it remains an isomorphism. Consequently the specialized kernel is O-torsion, and every torsion element maps to zero in O, so the kernel is exactly the torsion submodule. Right exactness gives image IO, containing a(pi)^n. A nonzero ideal of a DVR is free of rank one. This does not supply the separately required Schikhof-duality identification of the automorphic lattice.

### T64 — Interior degree of the extension graph

In D02, fix a vertex whose seven possible one-coordinate changes remain in the translation chart at every embedding. Its neighbors are in bijection with J×{0,±epsilon1,±epsilon2,±(epsilon1−epsilon2)}; its degree is 7|J|.

Proof/input boundary: A neighbor has a unique changed alcove label, determining j. Its coordinate displacement determines one of seven distinct values. Conversely each such pair changes that coordinate and flips its label, giving a neighbor. These maps are inverse. The zero displacement still flips one label; simultaneous flips in several embeddings are not edges.

### T65 — Stalkwise depth two gives a regular pair on the support ideal

Let A be Noetherian, M finite, I an ideal, and suppose depth(M_P)≥2 for every P∈V(I) in Supp(M). If IM≠M then I contains an M-regular sequence of length two. If IM=M use the infinite-depth convention.

Proof/input boundary: No associated prime of M contains I, since at an associated prime the nonzero localized module has depth zero. Finiteness of Ass(M) and prime avoidance choose x∈I outside all associated primes, so x is M-regular. At P∈V(I) in the support of M/xM, the regular-element depth formula gives depth((M/xM)_P)≥1. Thus no associated prime of M/xM contains I; prime avoidance chooses y∈I regular on M/xM. Since IM≠M, the final quotient is nonzero. The finite-associated-prime/zero-divisor criterion and the regular-element depth formula are shared R03.3 prerequisites, not supplied by the existing localCohomology carrier.

## Source issues

E01–E12 and E15–E18 are proposed findings awaiting independent review. “New” means no correction found in the recorded bounded search. E13–E14 were corrected in the published version. E101–E125 are the authors’ corrections to LLHLM18, read through LLHLM20 §6, not a fresh audit of every original location. E115’s extraction was repaired: its three negative signs apply to the complete parenthesized exponents. This repairs our record, not an additional source error.

The continuation checked arXiv metadata (v4, 4 March 2020), both author copies, Morra’s publication page and title/correction searches. No standalone correction was found in that scope. A fresh DOI resolver fetch failed; the earlier publisher checks are retained with their original attribution. No author contact was made.

- **E01** (misprint; Proposition 3.2.1 proof, arXiv v4 pp.22–23; published p.29, two ranges): 0 ≤ j′ < f′ − 1 Correction: Use 0 ≤ j′ ≤ f′−1 in both tuples of embeddings. Reason: The tuple must range over all f′ embeddings, as the immediately following universal condition does. When f′=1 the printed range is empty.
- **E02** (misprint; Proposition 3.3.9 statement, arXiv v4 p.25; published p.33): T^{dd}(M′)^* ≅ ρ|_{G_{K∞}} Correction: The right side must be ρ′|_{G_{K∞}}. Reason: The proposition compares rho and rho-prime. With the printed condition one may always take M-prime=M, independently of rho-prime, making the proposed equivalence with matching inertial semisimplifications false. The proof uses the primed representation.
- **E03** (misprint; Lemma 3.5.12 proof, arXiv v4 p.32; published p.43, first multiplicity difference): e(M∞(sigma(tau′)^circ)) − e(M∞(sigma(tau′)^circ)) Correction: The second term is e(M∞(sigma(tau)^circ)). Reason: The printed difference is zero. The two component counts used in the proof differ by 2^(delta+1)−2^delta, which is positive. The subsequent comparison uses tau-prime minus tau.
- **E04** (error; Theorem 3.5.3, arXiv v4 p.29; published p.38): The ring R^tau_rho is a normal domain Correction: Qualify the normal-domain assertion by R^tau_rho≠0. The Cohen–Macaulay and component statements should also be read with the zero case separated as in T36–T53. Reason: The proof treats the nonzero case. Genericity of a tame type does not make it compatible with a fixed rho: a tame central twist can preserve all genericity differences while changing the determinant character required of a lift. An incompatible determinant gives an empty deformation problem. The zero ring is not a domain.
- **E05** (misprint; Table 3 alpha-beta-alpha row: arXiv v4 p.53, published p.51; matching computation: arXiv p.45, published p.63): (a−b)c31 c12 + (b−c)c11 c33* Correction: Use c22* in place of c33* (and the corresponding primed c22* in the matching computation). Reason: The alpha-beta-alpha chart has unit parameters c13*,c22*,c31*; c33* is not a parameter there. Table 4 on arXiv p.55/published p.60 and the repeated computation on published p.68 use c22*.
- **E06** (misprint; Table 3 alpha-beta row matrix, arXiv v4 p.53; published p.51): A11 = c13 c12/(c32*) Correction: Use A11=c31 c12/(c32*). Reason: The same matrix is correct in the body (arXiv p.43/published p.59). The constant minor in rows 1,3 and columns 1,2 must vanish; the printed value instead produces c12(c13−c31). The finite test below gives −t².
- **E07** (misprint; Table 3 alpha-beta row relation, arXiv v4 pp.53–54; published pp.51–52): c12(−(b−c)d33 c21* +(a−c−1)c31 c23 +(b−c)c31 d23)=0 Correction: The coefficient of d33 c21* must be +(b−c). Reason: Equation (3.14), published p.61, and the listed component prime have the plus sign. In F_101[t]/t^4 with (a,b,c)=(30,15,0), units one, c12=c31=d23=t, d33=−t² and c13=−t³, the plus relation vanishes while the printed relation is 30t³.
- **E08** (misprint; Table 3 continued beta-alpha row, arXiv v4 p.54; published p.52): c11 c32 = 0 Correction: Use c11 c33=0, as on the preceding row/page. Reason: The preceding beta-alpha matrix gives constant (1,3)-row/column minor c11 c33. The earlier duplicate relation is c11 c33. The correct chart permits c11=c32=t, c33=d11=c13=d22=0 and units one, whereas the continuation would impose t²=0.
- **E09** (misprint; Identity-shape matching, arXiv v4 p.48; published p.68): z=t_(1,0,−1) Correction: Use z=t_(−1,0,1) in that sentence. Reason: The displayed matrix directly below is diag(v^−1,1,v), and the definition of t_nu uses those exponents. The computation itself uses the displayed matrix.
- **E10** (misprint; Proposition 4.1.7, arXiv v4 p.59; published p.78, first digraph isomorphism): Gamma(M) ≅ Gamma(M*) Correction: Transpose the target digraph: Gamma(M) ≅ Gamma(M*)^op, with vertices identified by duality. Reason: A nonsplit extension 0→T→E→S→0 becomes 0→S*→E*→T*→0 under exact contravariant duality. Thus the arrow S→T reverses. The next, filtered display already includes the transposition.
- **E11** (misprint; Alpha-shape c_(epsilon1,1) substitution, arXiv v4 p.47; published p.65): d22 = d′21 Correction: Add c22=c′21 to the substitution list. Reason: The identity compares the (2,2) coefficients c22+v d22 and c′21+v d′21. The linear coefficient is assigned, but the constant coefficient assignment is missing.
- **E12** (misprint; Alpha-beta w0 matching substitution, arXiv v4 p.46; published p.64): d23 = d′23 Correction: Use d23=c′23. Reason: The right-hand matrix has v c′23 in that entry and its parameter list has c′23; it has no d′23. Comparing v coefficients forces the correction.
- **E13** (misprint; arXiv v4 abstract, p.1): Deligne–Luzstig Correction: Deligne–Lusztig Reason: The mathematical name is misspelled; the published abstract uses the corrected spelling.
- **E14** (misprint; arXiv v4 introduction, p.3): three-dimenional Correction: three-dimensional Reason: Spelling only; the published introduction corrects it.
- **E101** (gap; LLHLM20 arXiv v4 §6(1), p.97, reporting a correction to LLHLM18 Theorem 1.1): its special fiber is as predicted by the geometric Breuil–Mézard conjecture Correction: Under the theorem hypotheses the special fibre is reduced and its number of components is at most |W?(rho^ss)∩JH(sigma(tau))|, with equality for semisimple rho. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The authors replace the ambiguous phrase by an exact component inequality and its equality case.
- **E102** (error; LLHLM20 arXiv v4 §6(2), p.97, reporting a correction to LLHLM18 Proposition 3.4): the codomain of Ttan should be replaced Correction: Use pairs (rho,gamma0) where rho is an F′[epsilon]/epsilon² representation of G_K∞ and gamma0 identifies its special fibre with Tdd(M)^*. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The tangent deformation includes its specified residual identification.
- **E103** (gap; LLHLM20 arXiv v4 §6(3), p.97, reporting a correction to LLHLM18 after equation (3.7)): we have a canonical isomorphism Correction: Record M_A tensor_A F ≅ M for a point (M_A,rho_A,delta_A) of the framed deformation functor. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The residual identification is needed by the subsequent deformation comparison.
- **E104** (gap; LLHLM20 arXiv v4 §6(4), p.97, reporting a correction to LLHLM18 after Definition 4.15): denotes the category of pairs Correction: Use pairs (M_R,j_R) with j_R:M_R tensor_R F ≅ M in the descent-data category, also for the fixed-Hodge-type subcategory. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. A deformation of the fixed residual object includes an identification, not just an isomorphic special fibre.
- **E105** (gap; LLHLM20 arXiv v4 §6(5), p.97, reporting a correction to LLHLM18 Theorem 4.17 proof): p-flat and reduced by [Cal18, Lemma 2.6] Correction: Supply p-flatness and reducedness of R from the cited lemma, after acquiring its hypotheses. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The addendum identifies the missing source of these properties; that original lemma remains unread.
- **E106** (gap; LLHLM20 arXiv v4 §6(6), p.97, reporting a correction to LLHLM18 Lemma 5.2): still converges Correction: For complete local Noetherian O-flat R the formula converges in lambda^−1 Mat(R[1/p][[u]]); the argument needs base-change compatibility there. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The authors distinguish this sufficient target from the stronger assertion about O_R^rig.
- **E107** (misprint; LLHLM20 arXiv v4 §6(7), p.97, reporting a correction to LLHLM18 Corollary 5.13 and before Theorem 6.14): T1, . . . , T8 Correction: Use T1,…,T9 at both locations. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The ninth chart is required in the table reference.
- **E108** (misprint; LLHLM20 arXiv v4 §6(8), p.97, reporting a correction to LLHLM18 §5.3.2): c11 ≡ 0 modulo varpi Correction: Both c11 and c13 are zero modulo the maximal ideal. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The corrected assertion changes both the list of coordinates and the ideal of reduction.
- **E109** (misprint; LLHLM20 arXiv v4 §6(9), p.97, reporting a correction to LLHLM18 §5.3.3, lines −6 and −4): c13* Correction: Replace the two starred parameters by c13. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The addendum distinguishes a nonunit coordinate from a distinguished unit.
- **E110** (gap; LLHLM20 arXiv v4 §6(10), p.97, reporting a correction to LLHLM18 Definition 7.1): automorphic of weight V, level U, and coefficients W Correction: Use Definition 6.0.1: S(U,V tensor W)_m is nonzero for a cofinite Hecke set, with m determined by the dual residual characteristic polynomials; U is unramified at p and its p-factor acts trivially on W. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. Level and coefficients must be retained for the later patching nonvanishing assertion.
- **E111** (error; LLHLM20 arXiv v4 §6(11), p.97, reporting a correction to LLHLM18 Definition 7.11(2)): automorphic of weight V Correction: Fix U and W and require automorphy of weight V at that level with those coefficients. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. Allowing varying levels/coefficients does not imply nonvanishing for a single patched functor.
- **E112** (error; LLHLM20 arXiv v4 §6(12), p.98, reporting a correction to LLHLM18 before Proposition 7.14): The definition of e(M) ... is incorrect Correction: For support dimension at most fixed d, take d! times the degree-d Hilbert-polynomial coefficient; it is zero in lower dimension. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The ordinary multiplicity in the module’s own dimension would not have the needed vanishing and additivity.
- **E113** (misprint; LLHLM20 arXiv v4 §6(13), p.98, reporting a correction to LLHLM18 after Proposition 7.14): should exclude primes dividing p Correction: Define Sigma0 using ramification away from p. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The p-adic and away-p coefficient factors are treated separately.
- **E114** (error; LLHLM20 arXiv v4 §6(14), p.98, reporting a correction to LLHLM18 Proposition 7.15 proof): automorphic of weight V Correction: Fix the stated minimal U: hyperspecial at split v≠v1, upper-triangular inverse image at v1 and hyperspecial at inert places; fix W a lattice in the product of minimal away-p types. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. This is the level and coefficient module supplied to the patching construction.
- **E115** (misprint; LLHLM20 arXiv v4 §6(15), p.98, reporting a correction to LLHLM18 Proposition 7.16 proof): the tame inertial type tau′ should read Correction: tau′=omega2^(−((b+1)+p(b+1))) ⊕ omega2^(−((c−1)+pa)) ⊕ omega2^(−(a+p(c−1))). Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The addendum supplies the corrected three exponents; their original derivation remains part of G07. Continuation correction to the extraction: the minus signs apply to the entire parenthesized exponents, as printed in the author addendum, published p.130. The previous report lost those parentheses; this is not an additional error in the source.
- **E116** (gap; LLHLM20 arXiv v4 §6(16), p.98, reporting a correction to LLHLM18 Theorems 7.8 and 7.4 proofs): also requires the following proposition Correction: Add Proposition 6.0.2: an automorphic residual GL3 representation with split ramification outside p and the Taylor–Wiles conditions, automorphic in a reachable weight, is automorphic in some reachable weight at the specified minimal U and W. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The original nonvanishing argument cannot cite the corrected Definition 7.11(2) before lowering level. The addendum gives a proof via solvable base change and finite deformation rings.
- **E117** (misprint; LLHLM20 arXiv v4 §6(17), p.99, reporting a correction to LLHLM18 §8.1, after Lemma 8.2): has relative dimension 15 over O Correction: Use relative dimension 15 for R_M,rho^(tau,beta,square). Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The corrected framed dimension is needed in the subsequent comparisons.
- **E118** (error; LLHLM20 arXiv v4 §6(18), p.99, reporting a correction to LLHLM18 Corollary 8.4): there should be the further relation Correction: Add c12 c33=0. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The displayed presentation omitted a required minor relation.
- **E119** (error; LLHLM20 arXiv v4 §6(19), p.99, reporting a correction to LLHLM18 Corollary 8.4 and Proposition 8.11): is a quotient of Correction: Replace the final claim by R_M,rho^(tau,beta,square)/varpi being a quotient of R-tilde[[c_ii*−[c_ii*],x_j:1≤i≤3,1≤j≤9]]. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. This supplies the dimension bound used in Lemma 8.8 and Proposition 8.6; the addendum does not assert equality here.
- **E120** (gap; LLHLM20 arXiv v4 §6(20), p.100, reporting a correction to LLHLM18 Proposition 8.11 proof): we remark that c33 = Correction: Use c33=c23 c31/(c21*). Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The elimination uses the distinguished unit c21*.
- **E121** (misprint; LLHLM20 arXiv v4 §6(21), p.100, reporting a correction to LLHLM18 Table 4 caption): the coefficients are in F Correction: Use residue-field coefficients F. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The caption must match the characteristic-p table.
- **E122** (misprint; LLHLM20 arXiv v4 §6(22), p.100, reporting a correction to LLHLM18 Table 5 caption): the coefficients are in R Correction: Use coefficients in R. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The coefficient ring is specified by the authors.
- **E123** (misprint; LLHLM20 arXiv v4 §6(23), p.100, reporting a correction to LLHLM18 Table 6, entry (1,3)): Leading term of the monodromy condition Correction: Use that header for the third column. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The column records a leading term, not the full condition.
- **E124** (gap; LLHLM20 arXiv v4 §6(24), p.100, reporting a correction to LLHLM18 Table 6, missing entries): can be read off from Table 5 Correction: Fill the second-column entries from Table 5 and the third-column entry from Proposition 8.3. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. The addendum supplies the locations; the actual entries must still be copied and checked from LLHLM18 before closure.
- **E125** (misprint; LLHLM20 arXiv v4 §6(25), p.100, reporting a correction to LLHLM18 Table 6 alpha-beta-alpha-gamma row and caption): the second c33* should be removed Correction: Delete the second c33* from the leading monodromy term and use bold a_(s_(j+1)(i)) for i=1,2,3 in the caption. Reason: Author-reported correction, read in LLHLM20; original LLHLM18 locator not independently reread in this checkpoint. These are the two corrections explicitly reported in addendum item (25).
- **E15** (misprint; Remark2.1.7, published p.14; arXiv v4 p.12): 7^{#J} adjacent vertices Correction: Replace the exponent by multiplication: 7·#J. Reason: Definition2.1.6 changes exactly one component. A neighbor is specified by that component and one of seven displacements. Two embeddings give 14 neighbors, not 49. Images in both versions confirm the superscript. T64 proves the corrected count.
- **E16** (gap; §4.1.1, published p.76; arXiv v4 p.57, definition of filtration degree): the unique value n such that Hom_C(sigma, gr_F^n(M)) is nonzero Correction: Require F to be semisimple in this definition, as in D11; alternatively define the degree by composition-factor occurrence rather than Hom. Reason: For a nonsplit extension 0→T→M→S→0 of distinct simples, the one-step filtration has only grade M but Hom(S,M)=0. Thus no such n exists for S despite multiplicity-freeness. A semisimple filtration has exactly one grade containing each simple, and Hom then detects it. The subsequent radical/socle applications are semisimple.
- **E17** (misprint; Published abstract p.1, reference title to LLHLM18): deformation 3985 rings Correction: Delete the stray digits 3985. Reason: The page image contains the digits inside the cited title; the bibliography on p.135 gives the title without them. The arXiv abstract does not contain this expanded reference title.
- **E18** (misprint; Published §1.4, p.8, Hodge–Tate convention): Hodge–Tate weighs Correction: Hodge–Tate weights Reason: Confirmed in the page image; the displayed HT formula and surrounding definition specify weights.

## Reproducible finite checks

The following two standard-library Python scripts were executed. They check finite models and explicit counterexamples, not the arbitrary-ring theorems or complete deformation presentations.

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

```python
from itertools import product
from math import gcd
checks=0
def check(b):
 global checks
 assert b
 checks+=1
D={(0,0),(1,0),(-1,0),(0,1),(0,-1),(1,-1),(-1,1)}
local=[(x,y,a) for (x,y),a in product(sorted(D),(0,1))]
def adj(x,y):
 changed=[i for i in range(len(x)) if x[i]!=y[i]]
 if len(changed)!=1:return False
 i=changed[0]
 return x[i][2]!=y[i][2] and (x[i][0]-y[i][0],x[i][1]-y[i][1]) in D
for f in range(1,5):
 origin=((0,0,0),)*f
 neighbors={v for v in product(local,repeat=f) if adj(origin,v)}
 expected=set()
 for j,d in product(range(f),D):
  v=list(origin);v[j]=(*d,1);expected.add(tuple(v))
 check(neighbors==expected);check(len(neighbors)==7*f)
 for v in neighbors:check(adj(v,origin));check(sum(a[2] for a in v)%2==1)
 print(f'Ambient graph with {f} factors: degree {len(neighbors)}, expected {7*f}')
check(14!=7**2)
# The natural module for the algebra of upper triangular 2x2 matrices over F_5.
p=5
vectors=list(product(range(p),repeat=2))
def E11(v):return(v[0],0)
def E12(v):return(v[1],0)
def E22(v):return(0,v[1])
# Quotient simple S has E11=E12=0 and E22=1.
homS=[v for v in vectors if E11(v)==(0,0) and E12(v)==(0,0) and E22(v)==v]
check(homS==[(0,0)])
lines={frozenset(((a*x)%p,(a*y)%p) for a in range(p)) for x,y in vectors if (x,y)!=(0,0)}
stable=[L for L in lines if all(T(v) in L for v in L for T in (E11,E12,E22))]
check(stable==[frozenset((a,0) for a in range(p))]);check(len(lines)==p+1)
print('Nonsplit two-simple module: unique stable line; Hom(S,M)=0')
# Exact Laurent monomial membership, checked on a bounded exponent square.
for a,b in product(range(-10,11),repeat=2):
 inAx=b>=0;inAy=a>=0;inA=a>=0 and b>=0
 check((inAx and inAy)==inA)
 # For (x,y), local membership means divisibility by x or y in each chart.
 inIdealAx=(b>=0 or b>=1);inIdealAy=(a>=1 or a>=0)
 check((inIdealAx and inIdealAy)==inA)
 # (x) on D(x) is unit; on D(y) its exponent of x is >=1.
 check((inAx and a>=1)==(a>=1 and b>=0))
print('Laurent intersection: functions extend, (x,y) closes to A, (x) remains (x)')
# I=(p,t) over O[[t]] has presentation (-t,p). At t=0 it is (0,p).
# The resulting module is O e1 plus (O/p)e2; the image sends e1 to p and e2 to 0.
for p in (3,5,7):
 check(gcd(0,p)==p)
 for a,b in product(range(-12,13),range(p)):
  image=p*a
  check((image==0)==(a==0))
  # Multiplication on the torsion coordinate in the specialized presentation.
  annihilator=min(n for n in range(1,p+1) if n*b%p==0)
  check(annihilator==(1 if b==0 else p))
 check(p!=0)
 print(f'DVR presentation for p={p}: torsion O/p survives in raw tensor; image=(p)')
print(f'{checks} exact finite assertions passed; no Lean or general-theorem proof claimed.')
```

Observed output:

```text
Ambient graph with 1 factors: degree 7, expected 7
Ambient graph with 2 factors: degree 14, expected 14
Ambient graph with 3 factors: degree 21, expected 21
Ambient graph with 4 factors: degree 28, expected 28
Nonsplit two-simple module: unique stable line; Hom(S,M)=0
Laurent intersection: functions extend, (x,y) closes to A, (x) remains (x)
DVR presentation for p=3: torsion O/p survives in raw tensor; image=(p)
DVR presentation for p=5: torsion O/p survives in raw tensor; image=(p)
DVR presentation for p=7: torsion O/p survives in raw tensor; image=(p)
2231 exact finite assertions passed; no Lean or general-theorem proof claimed.
```

## Resume in depth

**G01 — §§1.4–2.3: root conventions, translation charts, tame types and weight recipe.** The whole main text was read, but the item inventory omits the full definitions of affine/extended Weyl operations, Lambda_W, Tr_mu, admissibility, the p-dot action, local and algebraic Frobenius twists, Deligne–Lusztig R_s(mu), tau(s,mu), R involution, W?, W?(rho,tau), shapes and all chart-overlap and weight-combinatorics lemmas. Add individually with hypotheses, APIs, ≥3 tests, usage-derived proof dependencies; acquire LLHL19 and Herzig originals. Resume: Definitions 2.1.1–2.1.9, Propositions 2.1.5/2.1.10, §§2.2–2.3, Table 2.

**G02 — §4.1 lattice prerequisites.** EGS15 §4.1 original proofs have been read; itemise them separately. Still acquire and prove residual multiplicity-freeness and the field-of-definition/unramified descent used to replace varpi-powers by integral p-powers. Do not conflate LLHLM normalisation with the usual torsion-free-cokernel definition of saturated. Resume: EGS15 4.1.1–4.1.4; Herzig09 appendix Theorem 3.4; LLHLM20 Remark 4.3.5.

**G03 — §4.2 lower-alcove base case.** Expand every part of 4.2.4–4.2.16 separately: G1T, baby Verma modules and Q1, their socle series, rational/injective lifting, restriction to finite points, translation, U_nu, extension maps and vanishing. Read original Jantzen/Pillen/Andersen/Andersen–Kaneda/Bowman–Doty–Martin sources. Current T21 is an explicit unclosed supplier, not proof closure. Resume: Theorem 4.2.7 and its proof, then cited original inputs.

**G04 — §§3.1–3.6 local deformation geometry.** Add full Kisin module/descent datum/height/shape/semisimplicity definitions and 3.2–3.4 theorems; read LLHLM18 and LLHL19 proofs. Encode all corrected Tables 3–4, chart maps and minimal primes, including 3.6.12/14/15/16 intersections. Prove completed tensor compatibility, not just one-factor formulas. Expand 3.6.3 formal-monomorphism inference with representability/separatedness hypotheses. Typographical suspicion in Table 4 and the height convention need checking, not assertion as established errors. Resume: LLHLM18 with all §6 corrections applied; LLHLM20 §§3.1–3.4 and 3.6.

**G05 — Numerical patching and existence.** Split and prove 3.5.4–3.5.14, especially globalisation, nonzero minimal patching and defect descent. Read EG14 Appendix A, Enns, Kisin and the corrected LLHLM18 patching construction. The generic patching inverse limit belongs to R03.5; arithmetic functor and axioms belong to the proposed GL3 consumer. Resume: 3.5.13–14 and original globalisation first; then 3.5.4–12.

**G06 — §5.1 freeness and nonfreeness.** Expand all five cyclicity/gluing stages 5.1.3–7 and EGS15 Lemma 10.1.13 from its original proof. Fully prove the sketch in 5.1.8 with the required generator counts and ideal equalities. T40/T41 record the exact endpoint and missing subproofs. Resume: 5.1.3, then 5.1.4–7 with 3.6.12–16 and Figures 7–11.

**G07 — §5.3 and §6 global arithmetic.** Define the definite unitary group model, automorphic spaces, reachable weights, local/global Langlands normalization, Hecke ideals and Schikhof duality individually. Acquire CHT08 Definition 2.4.14, the precise auxiliary-v1 hypotheses, CEG+16/Le18 specialization and all level-lowering/base-change inputs of Proposition 6.0.2. Global conventions below faithfully expose these references as unclosed, not substitute a vague adequacy/minimality predicate. Resume: §5.3 setup, original LLHLM18 §§7.2–7.3 with addendum (10)–(16), then §6.0.2 originals.

**G08 — §5.2 and lattice specialization.** The absolute Hartogs, ordinary-Spec flat ideal base change and torsion-free specialization algebra are now itemized with proofs (D23–D25,T54–T63). The remaining arithmetic comparison is the precise Schikhof/Pontryagin dual and completed-automorphic specialization identification in §5.3.5: acquire CEG+16 Corollary2.11, Le18 and HLM17 Theorem5.2.1, and track the torsion-free quotient before (5.9). Underlying deformation-ring normality/full support still depend on G04/G05. Generic depth/local-cohomology comparison primitives, including the associated-prime criterion and regular-element depth formula used in T65, must be implemented in the shared owners; none is claimed formalised. Resume: Start at published pp.125–126 and the three original global duality/specialization references. Reuse T58,T60,T62,T63; do not repeat the relative HK04 application or require every cosocle module to be free.

**G09 — Completion of extraction and independent verification.** Inventory is partial, not every source definition/key theorem. Split remaining grouped definitions and prerequisites. The continuation read the entire published version and all its tables/figures; full version collation and independent reconstruction remain.  independently verify E01–E14 and the corrections reported by §6 against LLHLM18, then rerun ownership/library searches against the current atlas. No Lean file or proof was compiled. E15–E18 are new proposed findings awaiting independent review; E115 extraction parentheses were corrected. The new general local-cohomology comparison T55 still imports injective torsion and Čech comparison from Stacks0955/0A6T; this is an explicit shared proof obligation, not existing Lean support. Resume: Use the section coverage table and per-item dependsOn; never upgrade status solely because validators pass.

## Validation

The paper checker, intake path validator and independent integrity script pass. The integrity script checks unique preserved IDs, resolvable acyclic dependencies, exactly one route per missing item, and at least two API entries and three tests per definition/construction. Both embedded finite scripts pass (the continuation script executes 2,231 assertions). Only the three issue deliverables are published. No Lean file was requested or compiled; the available Lean shim has no configured toolchain and the pinned library copies have no build environment. Nothing is claimed formalised.
