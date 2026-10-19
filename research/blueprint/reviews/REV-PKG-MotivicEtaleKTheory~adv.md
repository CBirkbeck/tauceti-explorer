# Independent package review: MotivicEtaleKTheory

Issue: #11150, `REV-PKG-MotivicEtaleKTheory~adv`. Reviewer: Codex, session
`codex-zt9ZSv`, 2026-10-19. Input: package from PR #11101, written by a different
session, at atlas commit `29eb466061f5c271366c91f619b59bbe7af290ed`.

**Verdict: needs_changes.** The mathematical corrections below are applied. Two
required supplier exports remain absent, and the K-theory family has no assigned
upstream order or bundle. These are readiness defects; this is a completed
review, not a checkpoint. No target was deleted or weakened to obtain a pass.

## Corrections applied

1. **Reduced motive in §6.1.** The split-Tate weight bound concerns the reduced
   motive of the pointed Eilenberg–MacLane space. Its ordinary motive also has
   the basepoint unit. With zero coefficients and positive weight, that unit
   already contradicts the original unqualified bound. The statement now names
   the reduced motive and gives the source's perfect-field, resolution and
   exponential-characteristic assumptions, including its characteristic-zero
   specialization. The Check computes both motives. Source: Voevodsky,
   *Motivic Eilenberg–MacLane spaces*, Theorem 3.25, Corollaries 3.28 and 3.33,
   pp.71–74.
2. **Characteristic-p generation in §7.4.** An arbitrary Artin–Schreier equation
   cannot be solved in an extension of degree prime to p. Over F_p the equation
   X^p−X=1 requires degree p. The revised proof instead uses the leading-term
   logarithmic lemma after making the (p−1)st-power map surjective, followed by
   norm/trace descent and continuity. The three proof targets are named in the
   README and Lean closing comment. The lexicographic filtration, nonzero
   coefficient, finite-basis intermediate step and absence of a functorial
   choice of basis are explicit. Sources: Kurihara–Fesenko, §A2.1, pp.36–40;
   Sobiech, arXiv:2105.01319v1, pp.2–3, Proposition 1.3. Bloch–Kato's relative
   injectivity argument remains separate.
3. **Dyadic example and locator in §11.5.** For Z[√7,1/2], the signature defect
   is one, not zero. The fundamental unit 8+3√7 and the dyadic unit 3+√7 are
   positive at both embeddings; −1 gives only the diagonal sign. Inverting 7
   adds the opposite-sign unit √7 and lowers the defect to zero, while the
   Milnor-image rank remains one. The resulting degree-four extension has
   2-primary group Z/32, not Z/2⊕Z/16. The integral period-eight table is cited
   to Weibel VI, Theorem 9.11, pp.524–525; the example is VI.9.10.1,
   pp.523–524.
4. **Weight-zero Deligne complex in §12.2.** The displayed complex with O in
   degree one applies to j≥1. At j=0 the complex is Z[0]. The new point Check
   distinguishes H_D^0(point,Z(0))=Z from the zero kernel of Z→C.
5. **Missing suppliers are explicit.** The exact-contract section and the
   consuming paragraphs now distinguish the algebraic quadratic comparison
   from its circular cohomological analogue, and geometric Deligne support
   theory from linear Hodge structures and variations. The semipurity contract
   includes the necessary codimension bound on the closed support.

The existing Checks were retained. There are 71 numbered subsections and 290
Check bullets, with at least three in every subsection. This count is a shape
check; the mathematical discrimination is recorded below. The Lean companion
still has three real-bodied definitions, five admitted theorem targets and six
proved examples, two examples per definition. No new data carrier is admitted.

## Remaining defects and exact repair routes

### R1. Algebraic Pfister-symbol comparison before norm residue

Section 6.4 needs the all-length algebraic equivalence between Pfister isometry
and equality of pure Milnor symbols modulo two, with the hyperbolic/zero-symbol
corollary. Together with roundness this supplies the rational-point criterion
for the Pfister neighbor. QuadraticFormInvariantsPartII Q2.1–Q2.2 plans the
all-length quadratic results, but does not export this comparison.

Q2.3 is not a substitute: its graded cohomological comparison and zero criterion
depend on `MotivicEtaleKTheory:M.5d` norm residue. Using them in §6.4 would feed
the theorem into its own construction. The current library's all-length Pfister
definitions do not prove this comparison; its low-length hyperbolicity results
also do not supply arbitrary length.

Extend the quadratic successor with the **algebraic** chain-equivalence theorem
and naturality under every field extension, for char F≠2 and every n≥1. The
n=1 case is elementary; the general algebraic source is Elman–Lam, Theorem 2
and Corollary 1, p.972, proof outline pp.972–973. Keep this export before Q2.3.
The owning packet is outside this review's permitted files, so the missing
export is stated here and at its use, rather than silently attributed to it.

### R2. Geometric Deligne foundation is not in the named Hodge successor

HodgeStructures supplies linear Hodge objects. The present
HodgeStructuresPartII package supplies connections, Higgs/λ-connections and
variations. It does not supply the logarithmic Deligne–Beilinson complex,
compactification independence, homotopy invariance and support semipurity used
to prove the two quasi-isomorphisms in §12.2. ComplexComparisonPartII
C5.3,C5.5–C5.7 supplies related geometric Hodge/logarithmic de Rham inputs, not
this complete contract.

The Hodge geometric successor must export the filtered Betti/logarithmic de Rham
cone with its integral inclusion, real D_log comparison, conjugation, pullback,
products and support boundaries. For codim Z≥p it must prove vanishing below
2p and identify degree-2p support cohomology with the real cycle generators.
The comparison must retain (2πi)^p. Sources: Burgos, Definition 10.1,
(10.2)–(10.5), pp.89–91; Burgos–Feliu, §§1.8–1.9, Definition 1.28 and (1.30),
pp.10–11. This is an existing owner's extension, not an excuse to replace the
regulator roof by an abstract map or delete the nonproper theory. Supplier
files cannot be changed in this review.

### R3. Upstream dependency order remains unassigned

`upstream/CaraianiNewton.md` orders the Caraiani–Newton subset, not the entire
atlas. It does not assign MotivicEtaleKTheory, SchemeKTheoryOperations,
K2SymbolsBrauer and the broader arithmetic K-theory family a usable global
tier/bundle. A layer-level proof order does not establish the required
lower-tier or same-bundle condition. No higher tier was invented and no
`FoundationsAndLibraryIntegration` or `UPSTREAM:` placeholder was introduced.

Assign the family an upstream order/bundle and check the actual supplier
exports in that order. Preserve the early/late splits: algebraic Milnor inputs
before Tate comparison; local rigidity before its later motivic application;
effective motives before geometric stabilization; early Chern/Deligne maps
before the Borel, syntomic and Selmer comparisons returned by their consumers.
This routing decision is outside the review's permitted files. It is not a
claim that the outside-the-94 appendix bans K-theory work.

## Source verification

The author's flagged unverified proof input was characteristic-p logarithmic
generation, whose original Kato LNM 967 source was unavailable in a cleared
copy. That volume was not obtained elsewhere. The public Kurihara–Fesenko
appendix was read through its generation proof and separate injectivity
discussion; Sobiech's lexicographic version of the exact leading-term lemma
was checked as well. The appendix is a proof sketch, not a formal proof
certificate. The revised roadmap states its proof inputs as targets.

Public versions of the additionally identified quadratic and Deligne contracts
were opened. The Elman–Lam statement was read in the author-uploaded copy
linked in References; its proof outline is not represented as an existing Lean
proof. No source passage or source file is included in this change.

For the random audit, take one principal locator for each numbered subsection,
enumerate the 71 subsections in README order, and draw 15 without replacement
with Python `random.Random(11150).sample`. These are the resulting sections in
README order. Supplementary locators read while checking them are included in
the last column; the report does not certify every unsampled reference.

| Section | Public source opened and location | Result |
|---|---|---|
| 1.1 | Weibel III.6.10, pp.241–243 | Kummer/symbol coefficient convention agrees; tensor pairing is essential. |
| 1.2 | Tate §3, p.262; Weibel VI.8.2–8.3, pp.513–514 | Lattice coefficient inclusions and reductions differ from factorwise inclusions of roots. |
| 3.1 | Tate Theorem 3.1 and proof, pp.262–263 | Adic Steinberg proof and finite reduction have the stated prime-to-characteristic setting. |
| 3.2 | Tate §3, pp.262–264; Weibel III.6.10 | Galois symbols use ordered cups, norms and projection formula; no multiplication-of-roots pairing. |
| 6.2 | Voevodsky, *Reduced power operations*, Theorems 10.2–10.3, §§12–14, preprint pp.38–57 | Checked bidegrees, motivic τ/ρ terms and the odd-prime recursion convention. |
| 6.3 | Voevodsky, *On motivic cohomology with Z/ℓ-coefficients*, Lemmas 4.1,4.3, Theorem 4.4, pp.20–23; Haesemeyer–Weibel Definition 0.5 | Degree and norm-variety hypotheses agree; zero-dimensional characteristic number remains separate. |
| 7.3 | Bloch–Kato Lemma 2.2 and surrounding §2, pp.113–114 | Cartier-fixed group and degree-one pth-power kernel agree; generation is not a definition. |
| 7.6 | Kahn Theorem 2.34 and Corollary 2.38(a), pp.609–612; MVW Lemma 3.9, p.23 | Resolution-free comparison is distinguished from older resolution-dependent routes; p-coefficient inseparable invariance is not asserted. |
| 8.7 | Levine, *K-theory and motivic cohomology of schemes, I*, §11.8 pp.47–48, §§11.14–11.15 pp.51–52, §12.12 pp.57–59, Corollary 13.11 p.68, Theorems 14.5–14.7 pp.71–74 | Products are constructed on moved support diagrams; Adams action has weight q. Filtration comparison is stronger than an E₂-page identification. |
| 10.4 | Feng–Galatius–Venkatesh Proposition 2.9 and Lemma 2.10, pp.12–13; Weibel VI.4.1–4.2, pp.480–481 | FGV proves the arithmetic case. The general finite-cd field claim is a tower-comparison deduction from the preceding local targets, not the literal generality of that proposition. |
| 10.5 | Weibel VI.8.2 and proof, pp.513–514 | Finite even coefficients retain H⁰; completed positive twists have a different formula. |
| 10.6 | Blumberg–Mandell Theorem 10.1, Lemma 10.2, Proposition 10.4, pp.43–46; FGV Proposition 2.15/Remark 2.16, pp.15–16; Calmès et al. v4 Lemma 3.2.4, pp.56–57 | Transfer is a map of descent constructions. The duality sign is (−1)^n in degree 2n−1. |
| 11.3 | Weibel VI Theorem 9.4 and proof, pp.519–520 | Divisible dyadic table and nonsplit residue-five filtration agree, including the exceptional degree zero. |
| 11.5 | Weibel VI Theorem 9.11, pp.524–525, Corollary 9.10 and Example 9.10.1, pp.523–524 | Corrected the integral-table locator and the √7 signature-defect example. |
| 12.5 | Soulé §§4.1–4.4, pp.238–240; FGV Proposition 2.15, pp.15–16 | Odd-prime Bott lift, degree, coefficient reduction and norm compatibility agree. No family-existence theorem follows merely from defining a compatible family. |

Tate's 1976 K₂ paper is distinct from Tate's thesis. No theorem of Tate's
thesis is used. Scanned pages of the 1976 source were inspected visually.
The added public generation source is arXiv:math/0012134v1, SHA-256
`b2a4b946a0e83eb34a6bed6e085d5f6f38e36bba3c8f402bf0a8a3423df1f5bd`;
the precise lexicographic lemma source is arXiv:2105.01319v1, SHA-256
`49ed6474ae83dc739659679308018adb8fc14b613ebb50bcf2583100c9a63e9f`.

## Library, ownership and prerequisite audit

The pinned build uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current-library
duplication was checked separately against Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. A current declaration is not
assumed to elaborate at the older pins.

| Mathematical object searched/read | Ownership result |
|---|---|
| Universal derivation, absolute differential module, exterior algebra and semilinear base change | Existing Mathlib `KaehlerDifferential.D`, `ExteriorAlgebra.ιMulti` and Tau Ceti `KaehlerDifferential.mapSemilinear` are consumed. Only the logarithmic specialization is defined. |
| Kummer roots, boundary, class injection, equivariant degree-(1,1) cup | Existing `KummerCoeff`, `kummerMap`, `kummerClassMap_injective`, `explicitCup11` and `explicitCup_projection11` are consumed; the Steinberg theorem is the new assertion. |
| Compact cyclotomic module and finite character-module transitions | Current `PadicTateTwist`, `ZModTwist.reduce`, `mulPow`, `shortExact`, cyclotomic Prescription and `PrimeToPTateModule` remain boundary deferrals. Layer 1 adds arithmetic/sheaf comparisons. |
| Elliptic Tate representation, rank, pairing and determinant | Current `AlgebraicGeometry.EllipticCurve.TateModule` modules supply these. Layer 12 adds variance, twist and regulator compatibility. |
| Weight-one unit regulator and Hodge Tate object | Existing number-field unit regulator/log embedding and `Geometry.Hodge.Tate` remain suppliers; higher Deligne comparison is different. |
| All-length quadratic splitting and algebraic symbol comparison | Native Pfister carriers exist; low-length results do not imply the required all-length comparison. R1 remains. |
| Concrete spectra, EM spectra, towers and derived prime completion | GeneralizedCohomology G2,G3.4,G3.8–G3.9 already owns them; its current remote main README was read. |
| Coherent sheaves, hyperdescent, concrete/abstract spectrum comparison | EnhancedDerivedSheaves E2.6–E2.7 and E5:spectra-comparison have explicit contracts. Read at `d336bcd086af6526da9f35c30f3a695c26502355`; upstream PR #908 is merged. |
| Exact-category K-spectra, products/transfers and finite-field groups | GeneralAlgebraicKTheory §§1.5,3.12,7.4–7.8,11.15–11.16,13.8a–13.8c owns them. Read the current PR #1212 head `e25a1fe493e4aafe1dcd177fe8c6a7981c4f8901`; it remains open. |
| Real/complex Bott theory, BO/KO and coefficient ring | TopologicalKTheory T4,T7 and GeneralizedCohomology G5.4 own these. Read PR #894 at `f2c908debdefa440e7dfda339a54cb3b74cdc51c`; it remains open. Layer 11 is an arithmetic comparison. |
| Milnor presentation, norms/residues, supports and scheme operations | K2SymbolsBrauer and SchemeKTheoryOperations remain exact suppliers, not new constructions here. Their placement must satisfy R3. |
| Hodge structures, connections/variations, logarithmic de Rham comparison | Existing and successor Hodge owners have narrower contracts than Deligne support theory; R2 remains. |
| Syntomic/local conditions, Selmer fibres, determinant functor, Borel constants | Named owners are retained; the local-to-global regulator maps and conditional integral comparisons require their actual exports, not just equality of group dimensions. |

Both README and Suggested files were read for the upstream models
AlgebraicVectorBundles and ProfiniteArithmetic. Object searches also covered the
other seven newer roadmaps and the four named Completed roadmaps. The apparent
overlaps were ordinary bundle/characteristic-class successor discussions,
smooth differential forms, local Kummer/cyclotomic arithmetic, Clifford
algebras and the ordinary unit regulator. They do not supply higher Chow
complexes, motivic operations, the coniveau cycle-layer comparison or the
geometric Deligne contract. Existing deferrals in this package already respect
those boundaries. **No additional duplicated target was found or removed in
this review.** No changes were made in either read-only checkout.

All 195 unique input node IDs in the five packets occur in the existing package
handoff's target-to-subsection crosswalk: M.1 has 82, M.5d 67, M.6 7, M.6a 21
and M.6b 18. The corresponding 71 subsections and their target families were
read. Packets were not edited. Dependencies within the package follow the
layer order and the stated weight induction; external availability is subject
to R1–R3, not certified by that crosswalk or by packet validation.

## Adversarial mathematics pass

Each row covers the subsection's definitions, named API, theorem targets and
conventions. It records computations and scope checks, not proofs of admitted
targets. Heavy carriers are absent at the pins, so their negative controls
remain README Checks rather than artificial Lean encodings.

| Statements | Instances tried and result | Disposition |
|---|---|---|
| Conventions | Uniformizer last gives ∂{u,π}=ū on Milnor symbols and −κ(ū) on the ordered cup; coefficient cofibres have a Tor term. | Signs and derived coefficient convention retained. |
| 1.1 Finite dictionary | m=1 gives zero at every weight; complex conjugation acts oppositely at weights one and two modulo four; dual evaluation has weight zero. | Retain actual tensor/dual action. |
| 1.2 Adic/divisible dictionary | Level 1→2 multiplies lattice coordinates by ℓ; tensoring two root inclusions instead multiplies by ℓ² and kills the generator. | Scalar coefficient inclusion retained. |
| 1.3 Cups and divisible twists | Different prime-primary factors tensor to zero; two degree-one classes give the cohomological sign, independent of weights. | No extra weight sign. |
| 1.4 Continuous coefficients | Degree zero is an inverse limit; infinite finite-level H¹ does not justify removing lim¹; pullback is contravariant. | Derived limit and naturality retained. |
| 1.5 Kummer on S-integers | A field has Pic=0; a ring can have Pic[n]≠0; n=1 kills both displayed finite rows. | Unit-only description rejected. |
| 1.6 Residues | Unit residue zero, uniformizer residue one; empty removed set gives zero residue; compact generic-point residues need not have finite support. | Finite-set restriction retained. |
| 2.1 Real kernel/fibre | A zero restriction map still leaves a shifted target in its fibre; ordinary positive real cohomology has parity dependence. | Kernel and fibre kept distinct. |
| 2.2 High-degree arithmetic | Odd-primary real terms vanish; ordinary dyadic real terms persist in high degrees. | Tate-modified compact supports are not substituted. |
| 2.3 Brauer/mod-two dimensions | One real place versus a complex place; global invariant sum has one relation. | Real and finite-place contributions retained. |
| 2.4 Adic ranks | r₁=0 removes real terms; positive compact twist has no fixed lattice vector; weight zero is exceptional. | Degree/weight bounds retained. |
| 2.5 Degree-two localization | Removing no primes gives the identity; a principal uniformizer maps to its valuation. | Diagram direction and residue normalization retained. |
| 3.1 Steinberg | a+b=1 with both units excludes a=0,1; m=1 gives zero; char two does not require dividing by two. | Equivariant biadditive pairing retained. |
| 3.2 Symbols | Empty symbol maps 1 to 1; degree one is Kummer; swapping two entries changes the cup sign; inseparable prime-to-characteristic restriction is treated separately. | Tensor target and functoriality retained. |
| 3.3 Tate descent | Base exponent one and the next coefficient level; coefficient inclusion is multiplication by ℓ, not an identity. | Bockstein/connecting diagrams retained. |
| 3.4 Local/global comparison | Finite fields, local fields and global fields have different cohomological bounds; real dyadic terms are not finite-cd inputs. | Field hypotheses retained. |
| 3.5 Ring symbols | Nonzero Pic/m contributes a kernel; the field case has no Pic term; a root-of-unity symbol is ordered. | Picard correction retained. |
| 4.1 Admissible cycles | Empty support is admissible; a cycle lying in a forbidden face fails proper intersection; a unit graph avoids cube faces. | Facewise condition retained. |
| 4.2 Complexes/grading | Cube degree one fixes ∞−0 orientation; degeneracies are quotiented; degree n has motivic degree 2j−n. | Shift and normalization retained. |
| 4.3 Moving/localization | Identity pullback is immediate; arbitrary pullback needs moving; localization uses the open complement of the support. | No unrestricted chain pullback. |
| 4.4 Products/low weights | Weight zero is the constant complex; weight one is units shifted; {u,1−u} vanishes. | Diagonal symbol orientation retained. |
| 4.5 Projective bundles/purity | Rank-one projectivization is X; a divisor raises support degree by two and weight by one. | Rank and codimension shifts retained. |
| 4.6 Graphs/Gersten | Empty symbol gives the unit; degree-one graph has its ordered boundary; initial Gersten terms over mixed bases are not automatic. | Last-term comparison scope retained. |
| 4.7 Mixed characteristic | A field and a DVR have different purity inputs; truncated finite comparison does not imply integral Gersten exactness. | Geisser's conditional/full versus truncated claims kept separate. |
| 5.1 Correspondences | Identity graph is the diagonal; disconnected sources require finiteness over each appropriate component; empty source gives zero. | Multiplicities and proper projections retained. |
| 5.2 Transfers/tensor | Representable of a disjoint union splits; a constant non-singleton presheaf fails at the empty object; tensor unit is the point. | Radditivity and genuine tensor construction retained. |
| 5.3 Suslin complex | Degree zero evaluates at X; A¹ projection becomes an equivalence only after the stated localization. | Derived sheafification retained. |
| 5.4 Effective category | Unit twist zero is unchanged; cancellation compares both twists, not an inverse Tate object already present effectively. | Stabilization deferred. |
| 5.5 Cycle transfers | Finite flat degree d gives multiplicity d; degree-one graph agrees with the ordinary pullback. | Comparison follows independent constructions. |
| 5.6 Rigidity | Modulus divisible by the characteristic is excluded; separably closed field finite coefficients give the expected constant realization. | Invertibility and torsion assumptions retained. |
| 6.1 Operations/EML | A=0 has reduced motive zero and ordinary unit; q>0 excludes that unit from the claimed weight bound; ρ=0 over C does not kill τ. | Fixed reduced motive; retained representability targets. |
| 6.2 Relations | n=1 gives βP¹=P¹β−Q₁; over R the ρ correction survives; zero bundle has zero positive Newton class. | Recursion sign and motivic corrections retained. |
| 6.3 Degree/norm varieties | Degree-ℓ zero-dimensional scheme has s₀=ℓ; conic has s₁=2; ℓ²-divisibility makes the Thom coefficient zero. | Separate dimension-zero convention retained. |
| 6.4 Norm-variety construction | n=1 uses a finite quadratic scheme; n=2 gives a conic; a point splits the symbol only with the missing algebraic comparison. | R1 made explicit; general construction retained. |
| 6.5 Rost summand | Split symbol changes the Čech situation; missing rational point cannot be replaced by geometric nonemptiness; ℓ=2 is included. | Integral/coefficient and summand hypotheses retained. |
| 6.6 Norm residue induction | Degree zero is Z/ℓ; degree one is Kummer; characteristic ℓ cannot use the étale prime-to-ℓ proof. | Weight induction and separate characteristic-p route retained. |
| 7.1 dlog | dlog 1=0; dlog u⁻¹=−dlog u; absolute differentials over Z agree with the prime-field convention. | Concrete definition retained. |
| 7.2 Exterior symbols | Empty wedge is 1; repeated entry gives zero even in characteristic two; dlog a∧dlog(1−a)=0. | Alternation, not division by two. |
| 7.3 Cartier kernel | ν₀=F_p; F_p(t) has nonzero dlog t; perfect fields have zero positive forms. | Kernel remains an additive F_p-group, not an F-subspace. |
| 7.4 Generation/injectivity | X^p−X−1 over F_p needs degree p; the auxiliary (p−1) root tower is trivial at p=2; each form uses finitely many basis entries. | Fixed descent route; separate absolute and relative lemmas. |
| 7.5 Witt coefficients | q=0 is Z/p^r; for A=Z/p the proposed first map into A/p² is zero; Tor reduction multiplies by p. | No general short-exact quotient row. |
| 7.6 Continuity | F_p(t)→F_p(t^(1/p)) kills the mod-p class of t, but prime-to-p restriction is invertible. | Coefficient distinction retained. |
| 8.1 Supports | Empty support gives zero fibre; p=0 allows full support; a support meeting one face improperly is excluded. | Actual support spectra retained. |
| 8.2 Moving/functoriality | Empty list of maps gives ordinary supports; two maps require a common refinement; finite-field moving needs its descent step. | Homotopy-coherent construction retained. |
| 8.3 Semilocal/well-connected | p=0 has the simplex convention; a field point tests connectivity and vanishing separately; empty scheme has zero theory. | Both well-connectedness conditions retained. |
| 8.4 Cycle layer | Generic reduced coherent class has length one; length e has coefficient e; disconnected components carry separate ranks. | Actual rank-to-cycle map retained. |
| 8.5 Coherent/global model | Affine local agreement alone does not specify the global hyperdescent object or its transition homotopies. | Enhanced supplier contract retained. |
| 8.6 Exact couple | A differential changes total K-degree by −1; weight zero and finite-dimensional vanishing bound the filtration. | Strong convergence requires its hypotheses. |
| 8.7 Operations on tower | Integral theory acts on finite coefficients; at modulus two no arbitrary ring pairing is assumed; a line's Adams weight is one. | Moving/product and weighted-filtration constructions retained. |
| 9.1 Higher Chern | a₁=1,a₂=−1,a₃=1/2; on P², c₂(L+L)=h²; rank is not the positive-degree formula. | Factorial/sign and K₀ distinction retained. |
| 9.2 Character/inverse cycle | Reduced cycle has coefficient one; raw structure-sheaf class can have higher weights; relative face trivializations are data. | Projection and actual relative construction retained. |
| 9.3 Spectral comparison | A single Adams eigenspace equality does not identify the edge map; degree-two Milnor class requires the stated sign. | Map-level comparison retained. |
| 9.4 Supported normalization | Empty support gives zero; disjoint supports have zero product; codimension-one divisor has leading coefficient +1. | Character distinguished from top Chern class. |
| 10.1 Truncation | Weight zero and one give their low-degree comparisons; degrees above the truncation are not asserted equal. | Resolution-free route retained. |
| 10.2 Dedekind base | A smooth field fibre and a DVR closed fibre have distinct purity shifts; integral Gersten remains conditional. | Mixed-base hypotheses retained. |
| 10.3 Étale periodicity | Geometric point has negative even Bott degrees; real dyadic field has infinite cd₂; finite Krull dimension alone is insufficient. | Corrected Thomason hypotheses/erratum retained. |
| 10.4 Comparison range | d=0 admits all nonnegative degrees, d=1 begins at zero, d=2 begins at one; a real dyadic field is excluded. | General tower proof distinguished from old Bott route. |
| 10.5 Arithmetic coefficients | Finite even degree has H⁰; positive compact twist has zero inverse-limit H⁰; K(F) need not be finitely generated. | Ring finite-generation hypothesis retained. |
| 10.6 Transfer/duality | Degree-one extension gives identity; ψ⁻¹ in K_(2n−1) has sign (−1)^n, including n=2. | Actual transfer and dualizing-module comparison retained. |
| 11.1 Real comparison | Real coefficient K₂ is Z/4; replacing it by its two Z/2 graded pieces fails. | Extension retained. |
| 11.2 Real fibres | Trivial real target removes the fibre term; a nonzero preceding cokernel cannot be discarded. | Fibre long exact sequence retained. |
| 11.3 Divisible dyadic | n=0 is Q₂/Z₂; r₁=1 kills rank r₁−1; residues two and six give Z/2 and zero respectively. | Exceptional degree zero retained. |
| 11.4 Mod-two table | Surjective signatures give ε=0; enlarging S can lower ε; K₀ retains Pic/2. | Positive-degree table not extrapolated to zero. |
| 11.5 Integral dyadic | First admitted degree in each residue class; √7 has ε=ρ=1 before inverting 7 and ε=0 afterward. | Fixed example and table locator; nonsplit Z/32 retained. |
| 12.1 Finite/supported Chern | Diagonal factors are 1,−1,2; a factorial may vanish modulo m; vertical support can disappear generically. | No factorial division or general vertical-cycle inference. |
| 12.2 Deligne roof | j=0 gives Z[0]; p=0 gives constant cycles; J₁=−1,J₀=1 fixes the cubical chain sign. | Fixed weight zero; R2 remains for the geometric supplier. |
| 12.3 Number-field regulator | Real embedding contributes zero at j=2; conjugation gives rank r₂ or r₁+r₂; 2Z and Z have equal rational span but different covolume. | Integral image/model and lattice hypotheses retained. |
| 12.4 Euler factors | Tate weight one gives Rubin 1−X versus cohomological 1−q⁻¹X; rank-two determinant is q^(1−2j). | Variance and twist dictionary retained; q≠0. |
| 12.5 Norm families | Bott family has degree 2i−1; coefficient levels reduce before transfer; p=2 is outside the concrete Soulé construction. | General definition and specific existence example separated. |
| 12.6 Local/Selmer maps | Weight-one uniformizer fails the finite local condition; higher Tate weights behave differently; H¹ membership alone is not a complex map. | Supplied local comparison and complex lift required. |
| 12.7 Determinant lines | Two-term complex reverses the odd determinant factor; acyclic line is canonically trivial; real dyadic terms need a perfect modified complex. | Conditional integral comparison retained. |
| 12.8 Lattice index | Rank zero gives factor one; j=3,r=1,I=Z,L_c=2Z gives L_ch=Z and covolume ratio one. | Index direction, factorial and absolute determinant retained. |

## Lean signature audit and validation

Ten signatures were checked against their README hypotheses and ambient
variable blocks:

| Signature | Agreement checked |
|---|---|
| `kummerCup_steinberg` | Arbitrary field; invertible modulus; both entries units with sum one; actual Kummer classes; continuous equivariant biadditive pairing. |
| `logOne` | Absolute Ω[F/Z], inverse scalar multiplication, no perfection hypothesis. |
| `logSymbol` | Ordered exterior multiplication, n=0 permitted; degree-n image is described without inventing a new carrier. |
| `logOne_mul` | All field units, including characteristic two. |
| `logOne_natural` | Algebra homomorphism over Z and semilinear differential pullback. |
| `logOne_eq_zero_iff` | Prime p and CharP F p; pth powers in units; arbitrary imperfect field allowed. |
| `logSymbol_steinberg` | Two units summing to one; repeated differential alternation requires no inverse of two. |
| `positiveChernFactor` | Positive weight subtype; rational factorial denominator is nonzero. |
| Empty-symbol example | Degree-zero exterior product is one, proved. |
| Weight-three factor example | Coefficient 1/2, proved, distinguishing (j−1)! from j!. |

The other four examples were read as well. They are proved definition tests,
not admitted examples or unrelated arithmetic calculations. Missing sites,
motives, spectra, Witt sheaves and determinant carriers stay in the README and
closing comment. The added generation targets were added to that comment.

Validation completed on 2026-10-19:

- `lean-check` on the package's absolute Suggested.lean path: exit 0, five
  `declaration uses sorry` warnings and no other warnings or errors.
- `python3 research/blueprint/intake.py check-files` on README.md,
  Suggested.lean, metadata.toml, review.json and this report: five files,
  zero problems.
- `python3 scripts/check_blueprint.py` on all five
  `MotivicEtaleKTheory--*.json` input packets: zero errors and zero warnings
  for each. Their pre-existing gap/request counts are not administratively
  closed by this review.
- `git diff --check`: exit 0. Only the authorized package files and this review
  report are changed; metadata.toml and the packets remain unchanged.

## Handoff

The next package fix must resolve R1–R3 and then rerun the package checks. Keep
the four mathematical corrections, the public generation proof decomposition,
all 195 input targets and all discriminating Checks. Do not use Q2.3 to prove
norm residue, replace geometric Deligne cohomology by the linear Hodge category,
or treat an open upstream supplier PR as merged. The source locations and
commit identifiers above are sufficient to reproduce the checks without the
ephemeral source files. No suspicious instruction in fetched material was
acted on. No second job was claimed.
