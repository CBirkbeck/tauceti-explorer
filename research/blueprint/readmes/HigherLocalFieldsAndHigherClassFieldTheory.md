# Class field theory, Part II: higher local fields and higher reciprocity

The first prerequisite is [Class field theory](../../../content/tau-ceti/ClassFieldTheory/README.md), atlas identifier `tauceti:TauCetiRoadmap/ClassFieldTheory`. This roadmap starts with the higher and wild additions that the ordinary theory does not supply. Accepted RS-28 retains all eight layers HL.0–HL.7. The inherited proposal to remove HL.7 is withdrawn: equality of arithmetic maps and comparison with their consumers are mathematical obligations.

**Status: partial.** This continuation adds an 18-declaration component for the equal-characteristic higher topology on native Laurent series. Its dependency graph terminates in the pinned baseline. The rest of the packet retains source obligations, corrected where the source or supplier contract settles them; it is not a complete extraction or proof graph. All eight stages remain open, and every implementation status is unchecked. The packet contains 65 nodes, 95 API entries, 58 unit-test specifications, 19 planets, 47 baseline references, 27 requests and 13 gaps.

The suggested file gives real mathematical signatures for the new component: 18 nodes, 13 API entries and nine examples. The inherited file assigned a vacuous proposition to every declaration; those declarations have been removed. The residue-tower, mixed-characteristic, Milnor, Kato-coefficient and arithmetic-scheme signatures still require canonical supplier interfaces. Their names and mathematical specifications remain in this document, and their absence from the typed prototype is an explicit agreement gap. Compiling the new signatures establishes type correctness only, not their proofs or full packet coverage.

## The coefficient topology and the direction of comparison

Fix a field F with a specified nonarchimedean additive topology. This means that the additive group is topological and every neighborhood of zero contains an open additive subgroup. Use the native Laurent-series field F((T)); its outer T-adic topology already exists in the baseline and is kept throughout. The higher topology is a separately named topology on this same carrier. Its construction does not install a global instance that could silently change which topology a theorem uses.

For a family U_i of open additive subgroups, indexed by all integers, the coefficient box consists of those Laurent series whose i-th coefficient lies in U_i for every i. The family is admissible for the neighborhood basis when U_i=F for all i≥N for some integer N. There is no restriction that the neighborhoods at negative exponents become constant or that only finitely many coefficients are constrained. Each individual Laurent series has support bounded below; the coefficient conditions still range over every integer. These two different bounds must not be conflated.

Pointwise intersection gives intersection of boxes. Taking the maximum of two cutoffs proves directedness. Each box is already an additive subgroup, so it supplies the addition and negation requirements of the native additive filter-basis construction. For the source’s formulation using arbitrary zero-neighborhoods, choose an open additive subgroup inside each neighborhood below N and choose F at and above N. The resulting families are cofinal and define the same topology. This cofinality is where the nonarchimedean hypothesis is used.

The identity from the outer T-adic topology to the higher topology is continuous. Indeed an admissible box with cutoff N contains T^N F[[T]], because all lower coefficients of an element of this tail vanish. That tail contains a native valuation ball. Hence every higher zero-neighborhood is an outer zero-neighborhood. The higher topology is therefore coarser. In Mathlib’s order on topologies, finer topologies are smaller, so the comparison is outerTopology ≤ higherTopology. The inherited packet had the direction reversed.

The induced topology on the constants is particularly useful. A monomial cT^j belongs to a box exactly when c belongs to U_j. This gives continuity of the monomial embedding. The j-th coefficient projection is continuous and left-inverse to that embedding, so the induced topology is precisely the original topology of F. The outer topology induces the discrete topology on constants: the open outer ball T F[[T]] meets the constants only in zero. Equality of the two Laurent-series topologies therefore forces F to be discrete. Conversely, if F is discrete, using U_i={0} below N and F above N makes T^N F[[T]] itself a higher basic neighborhood. This proves equality exactly in the discrete-coefficient case.

For F_q((u))((t)), the constants-in-t sequence u^j tends to zero in the higher topology, because its u-adic order tends to infinity. Its outer t-order remains zero, so it does not tend to zero in the outer topology. This concrete witness detects the direction error. A second test excludes the box with one fixed proper coefficient subgroup at every exponent from the basis: if another family defined that same box, testing monomials would identify every one of its coefficient subgroups with that proper subgroup, contradicting eventual equality with F.

Continuous coefficient projections also prove Hausdorffness when F is Hausdorff: distinct Laurent series have different coefficients somewhere, and disjoint coefficient neighborhoods pull back to separate them. This argument requires no completeness of F. The component makes no inference from the native completeness theorem for the outer topology to completeness of the higher topology. Joint multiplication, sequential continuity, mixed-characteristic liftings and pro-ind comparisons each require separate statements and proofs.

## Topologies, characteristic regimes and normalization

Zhukov §1.3 constructs the unsaturated additive higher topology. Fesenko §6.2 defines its sequential saturation, which has the same convergent sequences but can have more open sets; the dimension-two example on printed p. 63 explicitly distinguishes them. The multiplicative topology τ of Zhukov §1.4.2 is another construction. In dimensions one and two it is a topological-group topology, even though the higher additive field in dimension two is not a topological field. Its sequential saturation λ* is separate again. The retained broad topology obligations must be split along these boundaries.

A residue tower is chosen data. At every step one must specify the valued-field structure and residue identification, with finite final residue field in this roadmap. The rank-n valuation compares the last differing coordinate first, so the outer coordinate is most significant. The ordinary outer valuation ring and the rank-n valuation ring must remain distinguishable. The non-Noetherian rank-two example uses the ascending chain P(0,1) ⊊ P(−1,1) ⊊ P(−2,1) ⊊ ⋯. The inherited descending-chain argument did not establish non-Noetherianity.

For F{{T}}, coefficient valuations are bounded below and tend to positive infinity as i tends to negative infinity. The direction is part of the definition. A Teichmüller set in mixed characteristic is not a finite subfield. For Q_3 the representatives are 0, 1 and −1, while 1+1=2 lies outside that set. The expansion theorem needs a section of the residue map, together with admissible supports; it does not require an additive field structure on the representatives. Source issue E1 records the published overstatement rather than silently correcting it.

The Milnor residue convention is imported from K2SymbolsBrauer: the uniformizer is the final entry of the symbol. Thus the ordered symbol {t_1,…,t_n} has iterated residue +1, while exchanging two entries gives its negative. This does not exchange the valuations or assert an automorphism interchanging the parameters. For transfer, the iterated residue commutes with the final residue-field transfer with no extra ramification factor. For restriction, the factor is the product of the ramification indices. At final Milnor degree zero, the transfer is multiplication by the final residue degree. These two formulas were mixed in the inherited packet and are now separated.

The final residue characteristic p controls the prime-to-p higher duality regime. An element p may be invertible in a mixed-characteristic top field while still being the wild residue prime. Kato’s characteristic-p differential cohomology is not ordinary p-primary continuous Galois cohomology in disguise. The unqualified cohomological-dimension formula is withdrawn; generic dimension definitions come from ProfiniteCohomology, and exact higher or wild dimension theorems remain source obligations. At dimension one the local invariant is in degree two with twist one; the character paired with K* lies in degree one with twist zero.

## Ownership and the existing baseline

LocalFieldsRamification Layer 0 supplies ordinary local-field arithmetic. K2SymbolsBrauer supplies all-degree algebraic Milnor groups, individual residues, Bass–Tate transfers, transitivity and projection formulas. This roadmap owns iteration on a specified tower, topology on the Milnor groups, actual quotient subgroups, and the higher comparisons. Existing supplier packet nodes are imported by their identifiers; their presence is not described as independent review acceptance.

ProfiniteCohomology supplies generic continuous cohomology, all-degree cups and dimension definitions. ClassFieldTheory Layer 5 supplies the ordinary invariant and duality only in its stated coefficient scopes. CrystallineCohomology CR.4 supplies ordinary and relative de Rham–Witt complexes; MotivicEtaleKTheory M.5d supplies its differential and norm-residue comparisons. KTheoryFiniteLocalFields L.5 is not treated as a supplier of every wild higher-local coefficient interface.

ClassFieldTheory Layers 6–8 supply ordinary reciprocity maps, arithmetic Frobenius normalization, full mixed-characteristic correspondence and the stated prime-to-p equal-characteristic correspondence. HL.3 still owns the missing equal-characteristic p-primary existence, injectivity and completion input, including at n=1. A dense image never identifies the raw Milnor group with a profinite group. HL.4 imports the ordinary ramification filtration and local K_2 symbols; its higher filtration and explicit formulas need their own sources and index comparisons.

GlobalNumberFields Layer 6 and FunctionFieldArithmetic FA.2 supply the two ordinary idele branches. ClassFieldTheory Layers 10–12 supply number-field global reciprocity; FA.4 supplies the finite-field curve branch. Higher flag rings must include all branches, and higher adeles require exact restricted conditions. Milnor residue complexes and cohomological Kato complexes are different objects. Their comparison requires coefficients and degree shifts, and a global square-zero theorem requires codimension-two reciprocity with branch norms, not merely a local sign convention. For number rings, archimedean conditions and the quotient classifying unramified covers must be specified before comparing to the full idele class group.

The current validator misclassifies upstream stage identifiers beginning with tauceti as library declarations. Their exact mathematical edges are preserved in unresolvedPrerequisites and requests, following the existing repository convention, with an explicit graph-encoding gap. Those edges must be read alongside prerequisites. The 18-node new component has no such unresolved edge.

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`; pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Every listed baseline statement was read at these pins in this continuation. The Laurent-series completeness theorem concerns the outer topology. The abstract Galois-category class does not construct an arithmetic-scheme fundamental group. The zero-coefficient continuous-cochain-map lemma does not supply Tate twists or higher duality.

## Reading record and source corrections

**Invitation to higher local fields** — Ivan Fesenko and Masato Kurihara, editors; contributions by I. Zhukov, O. Izhboldin, M. Kurihara, J. Nakamura, I. Fesenko, S. V. Vostokov, M. Spiess, L. Spriano, K. Kato, A. N. Parshin, D. Osipov and others. Geometry & Topology Monographs, Volume 3 (2000), open access; 316 PDF pages; printed page numbers run from iii to 306, and the extraction page equals the printed page plus twelve. [Source](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf). SHA-256 `a6c9088000d9b18ded4d2159531d7544683b86d6eecdbb2ab6cc9b743baabe62`.

- Published MSP volume downloaded and SHA-256 verified on 2026-09-27; physical page number equals positive printed page number plus twelve. The campaign README now defines AE-HLFVOLUME and AE-HLCFT explicitly.
- Fresh reading: Zhukov, Part I §1, printed pp. 5–18 in full, extracted in batches of at most three physical pages using pymupdf. Printed p. 6 also inspected visually.
- Fresh reading: Kurihara, Part I §5, printed pp. 53–58 only; the section continues through p. 60. Printed pp. 55–56 also inspected visually. The proof sketch and its cited primary inputs are not treated as proof closure.
- Fresh reading: Fesenko, Part I §6, printed pp. 61–63 only, including the definition of sequential saturation, which is distinct from the unsaturated higher additive topology.
- Fresh short-page audit: Introduction pp. iii–vi and contents p. xi; Part I §7 pp. 75–76 only (the section continues through p. 79); §8 p. 81; §10 pp. 99–100; Part II §1 pp. 199–200. Inherited formula paraphrases have been replaced by checked short literal anchors. Introduction pp. vii–x were read by the predecessor, not freshly reverified. The old full-section reading claims for §§5 and 7 are withdrawn.
- Not read: Kato existence paper pp. 165–195; remaining proof sections and original papers needed for the higher local and global endpoints. Exact remaining work is listed in coverage and gaps.
- Author-hosted Part I copy checked at the four source-issue passages; its distinct SHA-256 and precise reading extent are in sourceVersions. All four problems persist in that copy.

### HigherLocalFieldsAndHigherClassFieldTheory/E1

Zhukov, Part I §1.1, printed p. 6 (physical p. 18), paragraph preceding Classification Theorem; published MSP volume.

Printed: “Then the set of Teichmüller representatives R in O_K is a field isomorphic to K_0.”

The stated preceding hypothesis char(k_K)=p includes mixed characteristic. Require char(K)=p for the assertion that these representatives form a field; in mixed characteristic they give multiplicative representatives, not a subfield. Additive expansions require representatives, not a field structure on them.

For K=Q_3 the last residue field is F_3 and the representatives are 0, 1, −1. They satisfy the stated residue-characteristic hypothesis, but 1+1=2 is not in that set in Q_3. No field of characteristic zero contains a finite subfield. Zhukov p. 14 correctly distinguishes A=K_0 in characteristic p from A=W(K_0) in characteristic zero.

Classification: error; affects a stated result. Recorded as a new finding pending independent review; the correction searches establish no priority claim.

- MSP volume contents https://msp.org/gtm/2000/03/ and article page https://msp.org/gtm/2000/03/p001.xhtml, inspected 2026-09-27; no correction link found.
- arXiv https://arxiv.org/abs/math/0012132 submission history lists only v1; checked 2026-09-27.
- Author publication profile https://www.mathnet.ru/eng/person13714 and title/author/Teichmüller/errata searches, 2026-09-27; no correction located. This search does not establish priority.
- Author-hosted Part I https://ivanfesenko.org/wp-content/uploads/2021/10/m3-partI.pdf checked 2026-09-27 at the issue-bearing page; the same printed statement remains. Exact hash and limited reading extent are recorded in sourceVersions.

### HigherLocalFieldsAndHigherClassFieldTheory/E2

Kurihara, Part I §5.1, printed p. 55 (physical p. 67), target group immediately after the displayed lifted symbol; published MSP volume.

Printed: “H^1(K, Z/p^n(q − 1))”

The lifted cup-product symbol has target H^q(K, Z/p^n(q − 1)).

The first factor i(w) has degree one and each of the q−1 Kummer factors has degree one; their cup product has degree q and twist q−1. The map being defined on this page is i_F^K:H^q(F)→H^q(K). The exponent 1 was verified visually in the published PDF.

Classification: misprint; affects nothing. Recorded as a new finding pending independent review; the correction searches establish no priority claim.

- MSP volume contents and article page https://msp.org/gtm/2000/03/p005.xhtml, inspected 2026-09-27; no correction link found.
- arXiv https://arxiv.org/abs/math/0012136 history checked 2026-09-27; only v1 listed.
- Title/author/errata and correction searches on 2026-09-27 found no correction. The attempted author homepage https://www.math.keio.ac.jp/~kurihara/ was unavailable to the fetcher; this is not a negative search of that page.
- Author-hosted Part I https://ivanfesenko.org/wp-content/uploads/2021/10/m3-partI.pdf checked 2026-09-27 at the issue-bearing page; the same printed statement remains. Exact hash and limited reading extent are recorded in sourceVersions.

### HigherLocalFieldsAndHigherClassFieldTheory/E3

Kurihara, Part I §5.2, printed p. 56 (physical p. 68), sentence beginning “Since the isomorphism”; published MSP volume.

Printed: “inv: H^d(K) → Q/Z”

The invariant has domain H^{d+1}(K).

The invariant displayed above that sentence and both entries in the immediately following corestriction square are H^{d+1}; the text has dropped the +1. Verified visually. For a one-dimensional local field the invariant is on H^2=Br, not H^1 of characters.

Classification: misprint; affects nothing. Recorded as a new finding pending independent review; the correction searches establish no priority claim.

- MSP volume contents and article page https://msp.org/gtm/2000/03/p005.xhtml, inspected 2026-09-27; no correction link found.
- arXiv https://arxiv.org/abs/math/0012136 history checked 2026-09-27; only v1 listed.
- Title/author/errata and correction searches on 2026-09-27 found no correction. The attempted author homepage https://www.math.keio.ac.jp/~kurihara/ was unavailable to the fetcher; this is not a negative search of that page.
- Author-hosted Part I https://ivanfesenko.org/wp-content/uploads/2021/10/m3-partI.pdf checked 2026-09-27 at the issue-bearing page; the same printed statement remains. Exact hash and limited reading extent are recorded in sourceVersions.

### HigherLocalFieldsAndHigherClassFieldTheory/E4

Fesenko, Part I §10.5, Corollary 1, printed p. 100 (physical p. 112), published MSP volume.

Printed: “The reciprocity map Ψ_F: K_n^top(F) → Gal(L/F) is injective.”

Replace Gal(L/F) by Gal(F^ab/F), the target of Ψ_F defined on p. 99 and used in Theorem 3 on p. 100. A finite-extension target requires quotienting by the norm group.

The preceding construction defines the absolute reciprocity map. The displayed finite target cannot receive an injection from K_n^top(F), which has an infinite valuation factor. Already for n=1, F=F_q((t)) and L=F the finite-target assertion would inject F× into the trivial group. The printed target was checked visually.

Classification: misprint; affects nothing. Recorded as a new finding pending independent review; the correction searches establish no priority claim.

- MSP volume PDF and contents checked 2026-09-27; the published p. 100 still has Gal(L/F). The article-page fetch failed and is not counted as a negative correction search.
- https://arxiv.org/abs/math/0012141 history checked 2026-09-27; only v1 is listed.
- Author research page https://ivanfesenko.org/?page_id=126 and its linked Part I PDF https://ivanfesenko.org/wp-content/uploads/2021/10/m3-partI.pdf checked 2026-09-27. The same target remains on printed p. 100; exact hash is recorded in sourceVersions.
- Title/author/errata searches on 2026-09-27 found no correction. This finding awaits independent review and makes no priority claim.

The preceding upstream reading of Multiquadratic and Completed/EffectiveBounds was reused after verifying the current files byte-for-byte unchanged. This continuation also consulted the local-field and class-field contracts, the full accepted RS-28 decisions/ownership/links, the reviewed AUDIT-03 entries and review, reserved identifiers, and all link records mentioning this roadmap.

## Declaration inventory

## HL.0

Coverage: **partial**. Source obligations are retained under accepted RS-28; this stage is not closed.

- The 18-node equal-characteristic coefficient-topology component is decomposed to the pinned baseline. The rest of HL.0 needs the chosen residue-tower interface, split classification/expansion proofs, mixed-characteristic topology and pro-ind/sequential comparisons.
- Epp and the Madunts–Zhukov proof inputs have not been extracted. The multiplicative topology has now been read through p. 18, correcting the n=2 group-property claim.

### Coefficient boxes

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box`. Kind: construction. Implementation status: unchecked.

For U assigning an open additive subgroup U_i of K to every integer i, coefficientBox(U) is the additive subgroup of K((T)) consisting of f with f_i ∈ U_i for every i. No eventual-tail restriction is imposed on this subgroup construction.

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. Use the existing LaurentSeries carrier and its HahnSeries coefficients. Define the carrier by the stated universal condition.
2. The zero, sum and negative coefficients lie in each U_i because U_i is an additive subgroup. Use the native coefficient identities and AddSubgroup constructor.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `HigherLaurent.coefficientBox` | constructor | The additive subgroup with the stated coefficient carrier. |
| `HigherLaurent.mem_coefficientBox` | characterisation | Membership is equivalent to all coefficient conditions; this is the separate membership lemma. |
| `HigherLaurent.single_mem_coefficientBox` | simp | The monomial cT^j belongs exactly when c ∈ U_j; see the separate lemma. |
| `HigherLaurent.coefficientBox_inf` | compatibility | Pointwise intersections of coefficient subgroups give intersections of boxes; see the separate lemma. |

**Unit-test specifications.**

- `coefficientBox_top_test` (degenerate): If U_i=K for every i, the box is all of K((T)).
- `coefficientBox_single_test` (non-example): If c ∉ U_j then cT^j is outside the box, for every integer j, including negative j.
- `coefficientBox_intersection_test` (characterisation): Membership in the box of U_i∩V_i is equivalent to membership in both boxes.

**Uses.**

- HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-neighborhood-basis: Makes the source neighborhood condition explicit on native coefficients.
- HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-equals-outer-iff-discrete: Separates the original coefficient topology from the outer T-adic topology without replacing the latter globally.

**Acceptance.**

- Imposing a condition at a negative exponent is meaningful; Laurent series have finite negative support individually, with no common lower bound built into the carrier.

**Prerequisites.**

- `mathlib:LaurentSeries`
- `mathlib:OpenAddSubgroup`
- `mathlib:HahnSeries.coeff_add`
- `mathlib:HahnSeries.coeff_neg`
- `mathlib:HahnSeries.coeff_zero`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### Membership in a coefficient box

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box-membership`. Kind: lemma. Implementation status: unchecked.

For every Laurent series f and family U, f ∈ coefficientBox(U) if and only if f_i ∈ U_i for every integer i.

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. Unfold the carrier of the coefficient box.

**Acceptance.**

- The zero series belongs because each subgroup contains zero.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### Monomials in coefficient boxes

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box-single`. Kind: lemma. Implementation status: unchecked.

For j ∈ ℤ and c ∈ K, cT^j ∈ coefficientBox(U) if and only if c ∈ U_j.

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. Apply the membership lemma. At j the native single coefficient is c; at every other index it is zero, which every U_i contains.

**Acceptance.**

- A condition at any one exponent can be recovered from the box, so different families cannot define the same box.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box-membership`
- `mathlib:HahnSeries.single`
- `mathlib:HahnSeries.coeff_single`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### Intersection of coefficient boxes

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box-intersection`. Kind: lemma. Implementation status: unchecked.

coefficientBox(i ↦ U_i ∩ V_i) = coefficientBox(U) ∩ coefficientBox(V).

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. Use additive-subgroup extensionality and the membership lemma. Distribute the universal quantifier over the conjunction.

**Acceptance.**

- The intersection of an unconstrained box with any box is that box.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box-membership`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### Outer valuation tails inside boxes

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box-tail`. Kind: lemma. Implementation status: unchecked.

If U_i=K for every i≥N, then the set of Laurent series with f_i=0 for every i<N is contained in coefficientBox(U).

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. Split each integer index at N. Below N, the coefficient is zero and lies in U_i; at or above N, the constraint is the full field.

**Acceptance.**

- N may be negative, zero or positive; the direction is i≥N, never i≤N.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box-membership`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### The coefficient-box filter basis

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-filter-basis`. Kind: construction. Implementation status: unchecked.

coefficientBasis(K) is the native AddGroupFilterBasis on the additive group K((T)). Its sets are exactly coefficientBox(U), viewed as sets, for families of open additive subgroups satisfying ∃N∈ℤ, ∀i≥N, U_i=K.

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. The constant full-field family supplies a basis set.
2. For two families take their pointwise intersection. Beyond the maximum of their cutoffs the intersection is full. The coefficient-box intersection lemma gives directedness.
3. Every basis set is a subgroup: it contains zero, is closed under addition and negation, and translation-conjugation in this commutative group fixes it. Supply these facts to the native additive filter-basis constructor. No ring-filter-basis axiom is asserted.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `HigherLaurent.coefficientBasis` | constructor | The native additive filter basis of the admissible coefficient boxes. |
| `HigherLaurent.mem_coefficientBasis` | characterisation | A set belongs to the basis exactly when it is a box for a family eventually equal to K toward positive infinity; see the separate lemma. |
| `HigherLaurent.coefficientBox_mem_basis` | compatibility | Every coefficient box whose family is equal to K for all sufficiently large positive exponents belongs to coefficientBasis(K). This is the usable introduction form of the basis-set membership lemma. |

**Unit-test specifications.**

- `coefficientBasis_top_test` (degenerate): The entire Laurent-series field belongs to the basis.
- `coefficientBasis_tail_direction_test` (computation): Every family equal to K for i≥0 supplies a basis set, with arbitrarily small neighborhoods allowed at negative i.
- `coefficientBasis_uniform_constraint_test` (non-example): For a proper open additive subgroup V of K, the box with U_i=V for all i is not a basis set. The monomial membership lemma rules out an alternative admissible family defining that same box.

**Uses.**

- HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-neighborhood-basis: Makes the source neighborhood condition explicit on native coefficients.
- HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-equals-outer-iff-discrete: Separates the original coefficient topology from the outer T-adic topology without replacing the latter globally.

**Acceptance.**

- An arbitrary family is not a basis family: a proper fixed subgroup repeated at all exponents fails the positive-tail condition.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box-intersection`
- `mathlib:AddGroupFilterBasis`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### Basis-set membership

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-filter-basis-membership`. Kind: lemma. Implementation status: unchecked.

A subset S of K((T)) belongs to coefficientBasis(K) exactly when there is a family U of open additive subgroups with ∃N, ∀i≥N, U_i=K and S=coefficientBox(U).

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. Unfold the sets field of the constructed filter basis.

**Acceptance.**

- The equality describes basis sets, not arbitrary supersets that merely are neighborhoods.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-filter-basis`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### Higher topology on Laurent series

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/equal-characteristic-higher-topology`. Kind: construction. Implementation status: unchecked.

higherTopology(K) is the topology supplied by coefficientBasis(K) through the native AddGroupFilterBasis topology construction. It is a named second topology on the existing LaurentSeries K type. For a nonarchimedean topological additive group K it agrees with the coefficient-neighborhood topology of Zhukov §1.3.1(a).

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. Apply the native group-filter-basis topology constructor to coefficientBasis(K).
2. The construction itself is meaningful for any topology on K. Agreement with the source uses the separate cofinality theorem under NonarchimedeanAddGroup K. Keep the higher topology explicit in continuity, neighborhood and separation statements.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `HigherLaurent.higherTopology` | constructor | The explicitly named topology on native Laurent series. |
| `HigherLaurent.higherTopology_eq_basis` | characterisation | Equality with the native additive-basis topology; see the separate specification lemma. |
| `HigherLaurent.mem_nhds_zero_iff` | characterisation | A zero-neighborhood contains an admissible box; see the separate lemma. |
| `HigherLaurent.higher_isTopologicalAddGroup` | structure | The addition and negation maps are continuous in the named higher topology; see the separate theorem. |
| `HigherLaurent.continuous_coeff` | compatibility | For nonarchimedean K, each coefficient map from the higher topology to K is continuous; see the separate theorem. |
| `HigherLaurent.induced_single` | compatibility | For nonarchimedean K, the topology induced by c ↦ cT^j is exactly the given topology of K; see the separate theorem. |

**Unit-test specifications.**

- `higherTopology_discrete_test` (compatibility): For discrete nonarchimedean K the higher topology equals the native T-adic topology.
- `higherTopology_constant_sequence_test` (non-example): For a sequence s_n in a nonarchimedean K with s_n→0 and all s_n≠0, the constant Laurent series s_n converge to zero in the higher topology and do not converge to zero in the native outer topology.
- `higherTopology_outer_ball_test` (non-example): If the nonarchimedean coefficient topology is not discrete, T K[[T]], the set with f_i=0 for i<1, is not open for the higher topology, although it is open for the outer valuation topology.

**Uses.**

- HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-neighborhood-basis: Makes the source neighborhood condition explicit on native coefficients.
- HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-equals-outer-iff-discrete: Separates the original coefficient topology from the outer T-adic topology without replacing the latter globally.

**Acceptance.**

- The equality with the native outer topology holds exactly for discrete coefficient topology, under the nonarchimedean hypothesis.
- No field-topology, completeness, local compactness or joint-multiplication-continuity instance is inferred.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-filter-basis`
- `mathlib:GroupFilterBasis.topology`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

Planet: **Higher topology on Laurent series**.

### Topology specified by its additive basis

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology-basis-specification`. Kind: lemma. Implementation status: unchecked.

higherTopology(K) equals the topology produced by coefficientBasis(K).

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. Unfold the named topology construction.

**Acceptance.**

- The statement identifies the precise topology used in every subsequent signature.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/equal-characteristic-higher-topology`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### Continuity of addition in the higher topology

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topological-add-group`. Kind: theorem. Implementation status: unchecked.

The additive group K((T)), equipped with higherTopology(K), is a topological additive group.

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. Transport the native AddGroupFilterBasis topological-additive-group instance along the specification equality.

**Acceptance.**

- This supplies continuous addition and negation without asserting continuous multiplication.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology-basis-specification`
- `mathlib:GroupFilterBasis.topology`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### Neighborhoods in the higher topology

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-neighborhood-basis`. Kind: lemma. Implementation status: unchecked.

A subset S of K((T)) is a neighborhood of zero in higherTopology(K) if and only if it contains a coefficientBox(U) for an open-subgroup family U eventually equal to K at positive exponents.

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. Use the native group-filter-basis neighborhood theorem at zero, transported by the specification equality.
2. Rewrite basis-set membership using its exact characterization. The result is containment in S, not equality with S.

**Acceptance.**

- Any superset of a box is a neighborhood; it need not itself be a box.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology-basis-specification`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-filter-basis-membership`
- `mathlib:GroupFilterBasis.nhds_one_hasBasis`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### Open subgroup boxes recover the source topology

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/open-subgroup-boxes-cofinal`. Kind: lemma. Implementation status: unchecked.

Assume NonarchimedeanAddGroup K. For every family of zero-neighborhoods U_i in K with U_i=K for all i≥N, there exists a family of open additive subgroups V_i⊆U_i with V_i=K for all i≥N. Thus these subgroup boxes are cofinal among the source neighborhood boxes.

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. Below N apply the native nonarchimedean property separately at each integer to choose an open additive subgroup inside U_i.
2. At and above N choose K itself. The same cutoff remains valid; coordinatewise inclusion gives inclusion of boxes.
3. Conversely every open additive subgroup contains zero and is a zero-neighborhood. The two neighborhood systems therefore agree.

**Acceptance.**

- The eventual equality is preserved exactly, rather than replaced by a uniform bound on all coefficient neighborhoods.

**Prerequisites.**

- `mathlib:NonarchimedeanAddGroup`
- `mathlib:OpenSubgroup.mem_nhds_one`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-neighborhood-basis`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### Continuous coefficient projections

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-coefficient-continuity`. Kind: theorem. Implementation status: unchecked.

Assume NonarchimedeanAddGroup K. For every integer j the coefficient projection f ↦ f_j from higherTopology(K) to the specified topology on K is continuous.

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. For a zero-neighborhood in K choose an open additive subgroup V inside it.
2. Choose the box family equal to V at j and K elsewhere. It is admissible with cutoff j+1, and its image under the coefficient map lies in V.
3. The coefficient map is additive by the native coefficient identity. Continuity at zero extends to all points using the two topological additive groups.

**Acceptance.**

- Every integer projection, including negative indices, is continuous.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/open-subgroup-boxes-cofinal`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-neighborhood-basis`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topological-add-group`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box-membership`
- `mathlib:HahnSeries.coeff_add`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### The coefficient field inside the higher topology

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-single-induced-topology`. Kind: theorem. Implementation status: unchecked.

Assume NonarchimedeanAddGroup K. For each integer j, the topology induced on K by c ↦ cT^j into higherTopology(K) equals the given topology on K.

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. The inverse image of any admissible box under c ↦ cT^j is U_j by monomial membership. This proves continuity at zero; additivity gives continuity everywhere.
2. The coefficient projection at j is continuous and is a left inverse of this map. Pulling back its neighborhood preimages proves the reverse inclusion of topologies.

**Acceptance.**

- For j=0 this is the original coefficient field, whose topology is discrete inside the outer T-adic topology but need not be discrete here.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box-single`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-neighborhood-basis`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-coefficient-continuity`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topological-add-group`
- `mathlib:HahnSeries.coeff_single`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### Hausdorffness of the higher topology

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-hausdorff`. Kind: theorem. Implementation status: unchecked.

If K is a Hausdorff nonarchimedean topological additive group and a field, higherTopology(K) on K((T)) is Hausdorff.

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. Distinct Laurent series have different coefficients at some integer, by the native coefficient extensionality theorem.
2. Separate those coefficients by disjoint open sets in K. Their inverse images under the continuous coefficient projection separate the Laurent series.

**Acceptance.**

- No completeness of K is required for separation.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-coefficient-continuity`
- `mathlib:HahnSeries.coeff_injective`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### The higher topology is coarser than the outer topology

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-versus-outer-topology`. Kind: theorem. Implementation status: unchecked.

Assume NonarchimedeanAddGroup K. The identity map from K((T)) with its native outer T-adic topology to higherTopology(K) is continuous. In Mathlib topology order this says outerTopology ≤ higherTopology.

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. It suffices to compare neighborhoods of zero in the two additive groups. Any higher neighborhood contains an admissible box with cutoff N.
2. The tail lemma puts T^N K[[T]] inside that box. The native Laurent-series valuation inequality identifies the tail with v(f)≤exp(−N).
3. A strictly smaller native valuation ball lies inside this tail, so the box is an outer zero-neighborhood. Translate to all points.

**Acceptance.**

- The direction reverses the inherited packet assertion. A sequence converging in the outer topology converges in the higher topology.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-neighborhood-basis`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topological-add-group`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box-tail`
- `mathlib:LaurentSeries.valued`
- `mathlib:LaurentSeries.valuation_le_iff_coeff_lt_eq_zero`
- `mathlib:Valued.hasBasis_nhds_zero`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### Equality of the two topologies detects discrete coefficients

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-equals-outer-iff-discrete`. Kind: theorem. Implementation status: unchecked.

Assume NonarchimedeanAddGroup K. The higher topology on K((T)) equals the native outer T-adic topology if and only if the topology of K is discrete.

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. If K is discrete, the coefficient family {0} for i<N and K for i≥N is admissible and its box is T^N K[[T]]. Thus each native valuation neighborhood contains a higher neighborhood. Combine with the comparison theorem.
2. Conversely, the topology that the outer valuation induces on constants is discrete: the outer open ball T K[[T]] meets constants only in zero.
3. The induced-single theorem identifies the topology on constants in the higher topology with the original topology of K. Equality therefore forces zero to be open, hence all singletons to be open by translation.

**Acceptance.**

- A finite discrete residue field gives the ordinary one-dimensional Laurent-series topology. An inner Laurent-series field with its valuation topology gives strict inequality.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-versus-outer-topology`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-single-induced-topology`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-neighborhood-basis`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/coefficient-box-membership`
- `mathlib:discreteTopology_iff_isOpen_singleton_one`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### Strict comparison for nondiscrete coefficients

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-strictly-coarser`. Kind: theorem. Implementation status: unchecked.

If K is a nonarchimedean topological additive group and a field whose topology is not discrete, the native outer T-adic topology is strictly finer than higherTopology(K). In Mathlib order: outerTopology < higherTopology.

**Hypotheses and conventions.**

- K is a field with a specified topology; K((T)) is the native LaurentSeries carrier. Additional topological hypotheses are stated explicitly.

**Proof outline.**

1. Combine the comparison inequality with the equality-if-and-only-if-discrete theorem and the hypothesis that K is not discrete.

**Acceptance.**

- In F_q((u))((t)), the sequence of constant-in-t elements u^n converges to zero in the higher topology, but its outer t-valuation is always zero.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-versus-outer-topology`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-equals-outer-iff-discrete`

**Sources.**

- inv, Zhukov, Part I §1.3.1(a), printed p. 9; additive properties §1.3.2, printed p. 11. “a sequence of neighbourhoods of zero” The coefficient-neighborhood construction. The subgroup-basis formulation and the explicit comparison with the native outer valuation topology are derived here; neither is a claim that the source already gives a Lean interface.

### n-dimensional local fields and their residue towers

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`. Kind: definition. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

A complete discrete valuation field K has the structure of an n-dimensional local field if there is a chain of fields K = K_n, K_{n-1}, ..., K_1, K_0 in which each K_{i+1} is a complete discrete valuation field with residue field K_i and K_0 is a finite field. K_{n-1} is the first residue field and K_0 the last; finite fields are the 0-dimensional local fields. Most properties are unchanged if K_0 is only required to be perfect, and one then speaks of an n-dimensional local field over a perfect field. Mathlib has IsNonarchimedeanLocalField, whose compatibility with the chosen one-step structure is an n = 1 comparison obligation, and one-step discrete-valuation API; the residue-tower structure and the n-local predicate are absent from both libraries.

**Hypotheses and conventions.**

- The chain is part of the structure, not a property: a complete discrete valuation field may carry more than one such chain, and the objects below depend on the chain through the system of local parameters.
- The last residue field is required finite here; the variant over a perfect K_0 is recorded because sections 10.2, 16 and 17 of the source work in that generality.
- The rank-n order compares the last differing coordinate first: the outer coordinate v_n is most significant. Distinguish the ordinary rank-one valuation ring from the rank-n valuation ring.
- The nonzero integral ideals in the cited rank-n ideal lemma have nonnegative threshold tuple, including the zero tuple; strict positivity would omit the unit ideal.

**Proof outline.**

1. Specify a chosen residue tower using canonical one-step valued-field and residue-field interfaces; do not replace the chosen chain by an existential property. The exact data interface remains a gap.
2. Define a system of local parameters t_1, ..., t_n: t_n a prime element of K_n, t_{n-1} a unit of O_K whose residue is a prime element of K_{n-1}, and so on.
3. Define the rank-n valuation v = (v_1, ..., v_n) with values in Z^n with the lexicographic order with the last coordinate most significant, and record that for n > 1 it depends on the choice of t_2, ..., t_n but only up to equivalence.
4. Define the objects that do not depend on that choice: O_K, M_K, the group of principal units V_K = 1 + M_K and the subgroups P(i_l, ..., i_n).
5. Prove the ideal lemma: the nonzero ideals of O_K are exactly the P(i_l, ..., i_n), and O_K is not Noetherian for n > 1.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `HigherLocalField` | data | The structure on a complete discrete valuation field given by a chain of residue fields ending in a finite field. |
| `HigherLocalField.residue` | projection | The i-th field of the chain, with K_n = K and K_0 finite. |
| `HigherLocalField.localParameters` | constructor | A system of local parameters t_1, ..., t_n. |
| `HigherLocalField.rankValuation` | data | The rank-n valuation with values in Z^n for the lexicographic order with the last coordinate most significant. |
| `HigherLocalField.ring` | data | O_K, M_K and the group of principal units V_K = 1 + M_K, independent of the choice of parameters. |
| `HigherLocalField.idealClassification` | characterisation | The nonzero ideals of O_K are exactly the P(i_l, ..., i_n). |
| `HigherLocalField.not_noetherian` | relation | O_K is not Noetherian for n > 1. |
| `HigherLocalField.ofLocalField` | compatibility | For n = 1 the structure is Mathlib's IsNonarchimedeanLocalField. |

**Unit-test specifications.**

- `iterated_laurent` (characterisation): F_q((u))((t)) is a two-dimensional local field with residue field F_q((u)) and last residue field F_q; a definition that does not accept it is wrong.
- `one_dimensional` (characterisation): For a chosen one-step complete discrete valuation field with finite residue field, establish compatibility with native IsNonarchimedeanLocalField through the chosen valuation and its topology; no definitional equality of carriers is claimed.
- `mixed_characteristic` (characterisation): Q_p((t)) is a two-dimensional local field; so is Q_p{{T}}, and the two are not isomorphic, so the definition must distinguish them.
- `ideals_not_noetherian` (characterisation): For n=2 the rank-two valuation ring has the strictly ascending chain P(0,1) ⊊ P(−1,1) ⊊ P(−2,1) ⊊ ⋯; an element with valuation (−j−1,1) separates consecutive terms. This violates the ascending-chain condition.

**Uses.**

- Part I sections 5, 6, 7 and 10: Every statement of higher local class field theory is about an n-dimensional local field and its Milnor K-groups, and the induction is on n through the residue tower.
- Part II section 1, subsection 1.0.1: A flag of subschemes on an n-dimensional scheme gives an n-dimensional local field, which is what makes the higher adeles of HL.5 a restricted product of these.
- HL.1 and HL.4: The system of local parameters is what the iterated residues, the signs and the explicit symbols are computed against.

**Acceptance.**

- Examples: F_q((X_1))...((X_n)); k((X_1))...((X_{n-1})) for k a finite extension of Q_p; and the standard fields k{{T_1}}...{{T_m}}((T_{m+2}))...((T_n)).
- For n = 1 the definition reduces to a nonarchimedean local field with finite residue field, which is Mathlib's IsNonarchimedeanLocalField.

**Prerequisites.**

- `mathlib:IsNonarchimedeanLocalField`
- `mathlib:Valued`
- `mathlib:Valued.integer`
- `mathlib:IsDiscreteValuationRing`
- `mathlib:IsLocalRing.ResidueField`
- `mathlib:Valuation`
- `mathlib:LaurentSeries`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`

**Sources.**

- inv, Part I, section 1, subsection 1.1, Definition, printed p. 5. “A complete discrete valuation field K is said to have the structure of an n-dimensional local field” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 1, subsection 1.1, Lemma, printed p. 7. “The set of all non-zero ideals” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

Planet: **n-dimensional local field**.

### Standard fields and the classification theorem

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For a complete discrete valuation field F set F{{T}} to be the set of doubly infinite series in T with coefficients in F whose valuations are bounded below and tend to infinity as i→−∞, with the valuation the minimum of the coefficient valuations; it is a complete discrete valuation field with residue field k_F((t)). For a local field k the fields k{{T_1}}...{{T_m}}((T_{m+2}))...((T_n)) for 0 <= m <= n-1 are n-dimensional local fields, the standard fields, and K((X)){{Y}} is isomorphic to K((Y))((X)). Let m be maximal with char(K_m) = p. Then there are n+1 types of n-dimensional local field, and the classification theorem says: if char(K) = p then K is isomorphic to F_q((X_1))...((X_n)); if char(K_1) = 0 then K is isomorphic to k((X_1))...((X_{n-1})) for a local field k; and if char(K_{m+1}) = 0 and char(K_m) = p then K is a finite extension of a standard field and some finite extension of K is standard.

**Hypotheses and conventions.**

- The mixed-characteristic case is m = n-1; the intermediate cases 0 < m < n-1 are genuinely present and the classification is stated for all of them.
- The last assertion uses Epp's theorem on elimination of wild ramification, which is a real input and not a formality.
- In F{{T}}, the coefficient valuations are bounded below and tend to +∞ as the exponent i tends to −∞. The three dimension-two types are compared as fields with their specified outer valuation and residue towers.

**Proof outline.**

1. Construct F{{T}} and prove that it is a complete discrete valuation field with the stated residue field.
2. Prove the isomorphism K((X)){{Y}} = K((Y))((X)).
3. In equal characteristic deduce the classification from the classical structure theorem for complete discrete valuation fields.
4. In mixed characteristic let k_0 be the fraction field of the Witt vectors of F_q and K_0 = k_0{{T_1}}...{{T_{n-1}}}; K_0 is absolutely unramified with the same first residue field as K, so K is a finite extension of K_0; alternatively embed K_0 into K using the canonical lifting.
5. For the last assertion apply Epp's theorem to find a finite extension l of k_0 with e(lK/lK_0) = 1, so that lK_0 and lK are standard.

**Acceptance.**

- For n = 1 the classification is the classical one: a local field is a finite extension of Q_p or of F_q((t)).
- Q_p{{T}} is the arithmetic generalisation of Q_p and is not of the form k((X)).

**Prerequisites.**

- `mathlib:LaurentSeries`
- `mathlib:PowerSeries`
- `mathlib:WittVector`
- `mathlib:Padic`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`

**Sources.**

- inv, Part I, section 1, subsection 1.1, Examples and Classification Theorem, printed pp. 6-7. “Then K is a complete discrete valuation field” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 1, subsection 1.1, Classification Theorem, printed p. 6. “there is a finite extension of K which is a standard field” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

Planet: **Classification of higher local fields**.

### The higher topology on the additive group and its properties

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`. Kind: construction. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

The valuation topology of the top discrete valuation ignores the topologies of the residue fields. The higher topology is built so that they are taken into account: starting from the discrete topology on the last residue field, one defines the topology on F((X)) from a topology on F by taking as a base of neighbourhoods of zero the sets of series whose i-th coefficient lies in U_i, for sequences of neighbourhoods U_i of zero in F that are equal to F for every sufficiently large positive exponent i. In mixed characteristic one uses the canonical lifting h attached to a choice of t_1, ..., t_{n-1}, and in the case char(K) = char(K_{n-1}) = 0 the construction depends on the choice of a coefficient subfield. The price is that K is not a topological field: for n > 1 multiplication is not continuous, indeed UU = K for every open subgroup U. Multiplication is sequentially continuous, which is what class field theory actually uses.

**Hypotheses and conventions.**

- The failure of joint continuity is not an artefact: for n > 1 and every open subgroup U one has UU = K, because U contains some P(c) and is contained in no P(s).
- For n > 1 every base of neighbourhoods of zero is uncountable, so sequential continuity is strictly weaker than continuity and the distinction has to be kept.
- The construction in the case char(K) = char(K_{n-1}) = 0 depends on a choice; the roadmap text asks that only the continuity properties actually valid in the chosen framework be proved.
- This is the unsaturated additive higher topology. Fesenko §6.2 defines a distinct sequential saturation; equality of convergent sequences does not imply equality of topologies.
- For K=F((T)) with nondiscrete nonarchimedean F, the higher topology is strictly coarser than the outer T-adic topology.

**Proof outline.**

1. Define the topology on F((X)) from a topology on F by the sets of series with prescribed coefficient neighbourhoods, and iterate from the discrete topology on K_0 in the equal-characteristic case.
2. Construct the canonical lifting h attached to t_1, ..., t_{n-1}: first the auxiliary lifting H determined by its compatibility with p-th powers, then the correction maps lambda_i, then h as the p-adic sum of the H(lambda_i(a)).
3. Define the topology in mixed characteristic using h, and check that it is well defined.
4. Prove the properties: K is a complete separated topological group; for n > 1 every base of neighbourhoods of zero is uncountable and multiplication is not continuous although it is sequentially continuous; multiplication by a nonzero constant is a homeomorphism; for a finite extension L/K the topology of L is the product topology of a finite-dimensional K-vector space, and the topology of K is induced from that of L.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `HigherLocalField.topology` | data | The higher topology on the additive group of an n-dimensional local field. |
| `HigherLocalField.canonicalLifting` | constructor | The canonical lifting h attached to a choice of t_1, ..., t_{n-1}, used in the mixed-characteristic construction. |
| `HigherLocalField.topology_completeSeparated` | structure | K is a complete separated topological group. |
| `HigherLocalField.mul_not_continuous` | relation | For n > 1, UU = K for every open subgroup U, so multiplication is not continuous. |
| `HigherLocalField.mul_seqContinuous` | characterisation | Multiplication is sequentially continuous. |
| `HigherLocalField.topology_of_finiteExtension` | compatibility | For a finite extension the topology is the finite-dimensional vector space topology, and the topology of the subfield is the induced one. |
| `HigherLocalField.topology_uncountable_base` | relation | For n > 1 every base of neighbourhoods of zero is uncountable. |
| `HigherLocalField.principalUnits_topGenerators` | characterisation | V_F is topologically generated by the 1 + theta t_n^{i_n} ... t_1^{i_1}. |

**Unit-test specifications.**

- `equal_characteristic` (characterisation): For F_q((u))((t)) the construction gives the topology in which a sequence tends to zero when its coefficients do and its supports are bounded below.
- `higher_topology_is_coarser` (characterisation): For F_q((u))((t)), the higher topology is strictly coarser than the outer t-adic topology: u^j tends to zero in the higher topology and has outer t-order zero for every j.
- `not_topological_field` (characterisation): For n > 1, UU = K for every open subgroup U; a construction in which multiplication is continuous is wrong.
- `one_dimensional` (characterisation): For n = 1 the higher topology is the valuation topology and K is a topological field (the degenerate case).

**Uses.**

- Part I section 6: The topological Milnor K-groups are defined as the quotient of the Milnor K-groups by the intersection of all neighbourhoods of zero for a topology built from this one.
- Part I section 7, Theorem 1: Parshin's description of the topological K-groups in characteristic p is a homeomorphism from a product of explicit subgroups, and is a statement about this topology.
- Part I section 10.5: The existence theorem characterises norm subgroups as the open subgroups of finite index, which is a statement about the topology on the K-groups induced by this one.

**Acceptance.**

- The last two properties let one define the topology first for standard fields using h and then for an arbitrary field either as a finite-dimensional vector space topology or as the topology induced from a standard field containing it.
- The group of principal units V_F is topologically generated by the elements 1 + theta t_n^{i_n} ... t_1^{i_1} with theta in the Teichmueller representatives, which is the fact that makes the topological Milnor K-groups computable.

**Prerequisites.**

- `mathlib:Valued`
- `mathlib:LaurentSeries`
- `mathlib:UniformSpace.Completion`
- `mathlib:WittVector`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/equal-characteristic-higher-topology`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-strictly-coarser`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`

**Sources.**

- inv, Part I, section 1, subsection 1.3, before 1.3.1, printed p. 9. “a topology in K which takes into account topologies of the residue fields.” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 1, subsection 1.3.2, Properties (2) and (3), printed p. 11. “If n > 1, then every base of neighbourhoods of 0 is uncountable.” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

Planet: **Higher topology**.

### Finite extensions, the ramification matrix and the degree formula

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Let L/K be a finite extension of n-dimensional local fields. Choosing systems of local parameters of K and of L and the corresponding rank-n valuations v and v', the matrix E(L|K) with entries v'_j(t_i) is lower triangular with diagonal entries e_i(L|K) = e(L_i/K_i), and the e_i do not depend on the choice of parameters. The degree formula is |L : K| = f(L|K) times the product of the e_i(L|K), where f(L|K) = |L_0 : K_0|. The word unramified is used in two senses: e_n(L|K) = 1 with L_{n-1}/K_{n-1} separable, called semiramified, and the product of all e_i equal to 1, called purely unramified; the two must be kept apart.

**Hypotheses and conventions.**

- The ambiguity in the word unramified is recorded by the source and is a genuine hazard: the two notions differ as soon as n > 1.
- The matrix E(L|K) is triangular but not diagonal in general, which is why the degree formula is a product of the diagonal entries and not of the entries of a single row.

**Proof outline.**

1. Construct the matrix E(L|K) from the two systems of parameters and prove that its diagonal entries are the e_i and are independent of the choices.
2. Prove the degree formula by induction on n from the classical one-step formula at each level.
3. Define semiramified and purely unramified extensions and prove that a purely unramified extension is semiramified but not conversely.
4. Prove that the higher local field structure is inherited by a finite extension.

**Acceptance.**

- For n = 1 the formula is the classical |L : K| = e f.
- For K = F_q((u))((t)) and L = K(t^{1/m}) with m prime to p, e_2 = m and e_1 = f = 1.

**Prerequisites.**

- `mathlib:IsDiscreteValuationRing`
- `mathlib:Valuation`
- `mathlib:IsNonarchimedeanLocalField`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`
- `tauceti:TauCeti.Place.ramificationGroup`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`

**Sources.**

- inv, Part I, section 1, subsection 1.2, printed p. 8. “do not depend on the choice of parameters” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 1, subsection 1.2, printed p. 8. “It can be also used in a narrower sense” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

### Representatives and admissible convergent expansions

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Let K have a chosen residue tower ending in a finite field, chosen parameters t_1,…,t_n, and a zero-preserving section of the rank-n residue map. Every element has a unique expansion in these parameters with coefficients in that section and admissible support: fixing the higher coordinates leaves the next coordinate bounded below. The associated sums converge in the unsaturated higher topology (Zhukov §1.3.4). Under char(K_{n−1})=p, the multiplicative expansion uses representatives θ in the Teichmüller set and admissible positive exponent support (§1.4.3). This set is a subfield only when char(K)=p; in mixed characteristic it is a multiplicative set of representatives. Neither arbitrary infinite products nor arbitrary exponent supports are admitted.

**Hypotheses and conventions.**

- The finite final residue field is part of the additive expansion theorem.
- Use the admissibility definition of §1.3.4 and the union-admissibility and finite-overlap conditions (i),(ii) of §1.4.3 for general product families.
- Source issue E1 corrects the false field assertion in mixed characteristic. The published p. 17 remark explicitly corrects the omitted conditions in Madunts–Zhukov [MZ1] Theorems 2.1–2.2; [MZ1] itself has not been read here.

**Proof outline.**

1. Extract coefficients successively by the residue maps in the fixed order; the residue of the leading term determines the next coefficient uniquely.
2. Use induction on the tower and admissible support to show that only finitely many summands lie outside a given zero-neighborhood.
3. For products, first prove the family convergence lemma of §1.4.3 with both support hypotheses, then lift the additive expansion through successive principal-unit quotients.
4. Separate these proof leaves and the precise residue-tower signatures before claiming closure.

**Acceptance.**

- For Q_3 the Teichmüller set {0,1,−1} is not closed under addition.
- The products ∏(1+t_1^i+t_1^{−i}t_2) and ∏(1+t_1^i+t_2) are the source p. 17 non-examples when the support conditions are omitted.

**Prerequisites.**

- `mathlib:WittVector`
- `mathlib:IsLocalRing.ResidueField`
- `mathlib:Valued`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`

**Sources.**

- inv, Zhukov §1.3.4 pp. 13–14 and §1.4.3 pp. 16–18; source issue E1 at p. 6. “Conditions (i) and (ii) in the Lemma are essential.” Admissible expansions and the explicit warning about unrestricted products; use representatives rather than the incorrect mixed-characteristic subfield claim.

### The two acceptance examples worked out

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`. Kind: application. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

The two examples the layer's acceptance asks for are worked out. For K = F_q((u))((t)): the chain is K_2 = K, K_1 = F_q((u)), K_0 = F_q; a system of local parameters is t_1 = u, t_2 = t; the rank-two valuation sends a series to the pair (order in u of the leading coefficient, order in t); char(K) = p, so the field is of the first type of the classification. For K = Q_p((t)): the chain is K_2 = K, K_1 = Q_p, K_0 = F_p; a system of local parameters is t_1 = p, t_2 = t; char(K) = char(K_1) = 0, so the field is of the second type and its Teichmüller representatives are not a subfield of characteristic p. Both are two-dimensional local fields, and Q_p{{T}} is a third, of mixed-characteristic type, which is not isomorphic to either as a field with its specified residue tower.

**Hypotheses and conventions.**

- The examples are the acceptance cases of the layer and are also the objects HL.4's explicit computations are carried out in.
- The roadmap text warns against reusing the locally compact Haar-measure API without proving its hypotheses: an n-dimensional local field with n > 1 is not locally compact for the higher topology.

**Proof outline.**

1. Instantiate the definition for F_q((u))((t)) from Mathlib's LaurentSeries applied twice, and exhibit the chain, the parameters and the valuation.
2. Instantiate it for Q_p((t)) from LaurentSeries over Padic, and exhibit the chain, the parameters and the multiplicative Teichmüller section.
3. Construct Q_p{{T}} by the F{{T}} construction and check that its first residue field is F_p((t)), so that it is of mixed-characteristic type.
4. Record that none of the three is locally compact for the higher topology when n > 1.

**Acceptance.**

- The three examples separate the three types of the classification theorem in dimension two.
- K((X)){{Y}} is isomorphic to K((Y))((X)), so the F{{T}} construction does not always produce a new type.

**Prerequisites.**

- `mathlib:LaurentSeries`
- `mathlib:Padic`
- `mathlib:PadicInt`
- `mathlib:IsNonarchimedeanLocalField`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`

**Sources.**

- inv, Part I, section 1, subsection 1.1, Examples, printed p. 6. “For a complete discrete valuation field F” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Introduction, printed p. iii. “A complete discrete valuation field K” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

### The topology on the multiplicative group and its sequential properties

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Keep the multiplicative topology τ of Zhukov §1.4.2 separate from the additive higher topology and from its own sequential saturation λ*. If char(K_{n−1})=p, τ is transported from V_K × ⟨t_1⟩ × ⋯ × ⟨t_n⟩ × R*, with the topology on V_K induced from the additive field and the other factors discrete. In the regime char(K)=char(K_{m+1})=0, char(K_m)=p, m≤n−2, use the inverse-image construction through O_K*→O_{K_{m+1}}*; its neighborhood intersection is the uniquely divisible kernel specified by the source. Multiplication is sequentially continuous; for n≤2, τ makes K* a topological group with a countable basis of open subgroups. Thus failure of joint multiplication on the additive higher field does not imply failure of the topological-group law on K* in dimension two. The complete comparison with λ* and the pro-ind formulation remains open.

**Hypotheses and conventions.**

- Use the characteristic regimes and topology transports stated explicitly in §1.4.2.
- No requirement that a map be discontinuous is imposed merely because the available theorem supplies sequential continuity.

**Proof outline.**

1. Extract the two characteristic-dependent definitions of τ and their change-of-parameter comparisons.
2. For n≤2 use the neighborhood basis of §1.4.1 to prove the group property.
3. For λ*, use the sequential-saturation definition of §6.2 and prove equality of convergent sequences; do not infer equality of topologies.
4. The exact native carrier and transport signatures remain part of the topology-comparison gap.

**Acceptance.**

- For n=1 recover the ordinary multiplicative local-field topology.
- For n=2 τ is a topological-group topology even though the additive higher field is not a topological field.

**Prerequisites.**

- `mathlib:Valued`
- `mathlib:UniformSpace.Completion`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`

**Sources.**

- inv, Zhukov §1.4.1–1.4.2 pp. 14–16; Fesenko §6.2 p. 63. “If n ⩽2, then the multiplicative group K∗is a topological group” Corrects the inherited claim that every n>1 multiplicative topology has only sequential group operations.

### Higher local fields over a perfect or quasi-finite last residue field

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/perfect-and-quasi-finite-variants`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Most properties of n-dimensional local fields are unchanged if the last residue field K_0 is required only to be perfect rather than finite, and one then speaks of an n-dimensional local field over a perfect field; one can also allow an arbitrary K_0. The class field theory of the following layers is stated for a finite K_0, but the invariant map and the isomorphism theorem of HL.2 and HL.3 hold whenever K_0 is quasi-finite, and there is a further generalisation to a perfect K_0 that is not separably p-closed, which describes abelian totally ramified p-extensions.

**Hypotheses and conventions.**

- The volume states its results for a finite last residue field and records at each point which of them survive for a quasi-finite or a perfect one; the packet keeps that distinction rather than asserting the general case.
- For a perfect but not separably p-closed K_0 the theory is about totally ramified p-extensions only, and the norm groups determine the extensions.

**Proof outline.**

1. Define the variants and record which of the constructions of this layer are unchanged.
2. Record that the corollary computing H^{d+1}(K) as Q/Z holds when the last residue field is quasi-finite.
3. Record the generalisation of the existence theorem to a perfect, not separably p-closed, last residue field, and the statement that two abelian totally ramified p-extensions coincide if and only if their norm groups do.

**Acceptance.**

- A typical example satisfying the assumptions of the corollary in section 5.1 is a d-dimensional local field; if the last residue field is quasi-finite, not necessarily finite, the assumptions are still satisfied.
- The general theory for an arbitrary last residue field is the subject of sections 13, 16 and 17 of the source and is not developed here.

**Prerequisites.**

- `mathlib:IsNonarchimedeanLocalField`
- `mathlib:PerfectRing`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`

**Sources.**

- inv, Part I, section 1, subsection 1.1, Remark, printed p. 5. “perfect rather than finite.” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 5, subsection 5.1, Corollary, printed p. 56. “quasi-finite (not necessarily finite)” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

## HL.1

Coverage: **partial**. Source obligations are retained under accepted RS-28; this stage is not closed.

- Milnor K-theory itself, the tame symbol, the higher residues, the transfer and the norm-residue formula are owned by K2SymbolsBrauer:T.2, T.3 and T.4 and are imported by node identifier, not planned here. AUDIT-03 records exactly those three duplications.
- The structure results for the Milnor K-groups of a one-dimensional local field, due to Bass, Tate, Moore, Merkurjev, Kahn and Sivitsky, are quoted from the source and not proved.
- The computation of the graded pieces of the filtration in positive degrees is recorded case by case and not proved; sections 12, 13 and 15 of the source, where it is carried out, were not read.
- The inherited bundled declarations and typed-interface frontier remain open; see the named gaps.

### The iterated residue attached to a residue tower

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`. Kind: construction. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For a fixed residue tower K_n→⋯→K_0 and m≥n, compose the imported right-uniformizer Milnor residues ∂_v{u_1,…,u_{r−1},π}={ū_1,…,ū_{r−1}} to obtain K_m^M(K_n)→K_{m−n}^M(K_0). It sends {t_1,…,t_n} to +1 in K_0^M(K_0)=Z. Permuting entries of a symbol changes this value by the permutation sign; this does not permute the chosen residue tower or produce a field automorphism exchanging parameters. Equal entries give skew-symmetry, not integral alternation with automatic vanishing.

**Hypotheses and conventions.**

- The sign is the content: there is no canonical identification making the iterated residue independent of the order of the parameters.
- The boundary map at each level is the one of K2SymbolsBrauer:T.3, applied to the complete discrete valuation field K_{i+1} with residue field K_i.

**Proof outline.**

1. Compose the imported one-step residues in the fixed order, outer valuation first.
2. For the ordered parameter symbol, apply the right-uniformizer equation at each step.
3. Apply the imported skew-symmetry to permuted symbol entries; distinguish it from exchanging valuations in a tower.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `HigherLocalField.iteratedResidue` | data | The iterated residue attached to a system of local parameters. |
| `HigherLocalField.iteratedResidue_symbol` | characterisation | Its value on the symbol of the parameters together with a constant-field unit. |
| `HigherLocalField.iteratedResidue_sign` | relation | Permuting the parameters changes the iterated residue by the sign of the permutation. |
| `HigherLocalField.iteratedResidue_comp` | functoriality | It is the composite of the one-step boundary maps of the tower. |
| `HigherLocalField.iteratedResidue_one_dimensional` | compatibility | For n = 1 it is the tame symbol of K2SymbolsBrauer:T.3. |
| `HigherLocalField.iteratedResidue_norm` | compatibility | Its compatibility with the Milnor norm of a finite extension, through the ramification matrix. |

**Unit-test specifications.**

- `parameters` (characterisation): The iterated residue of {t_1, ..., t_n} is 1, and of {theta, t_1, ..., t_n} is the residue of theta.
- `sign` (characterisation): Exchanging t_1 and t_2 changes the iterated residue by minus one; a construction in which it does not is wrong (the required non-example).
- `one_dimensional` (characterisation): For n=1 the iterated map is the imported degree-lowering Milnor residue; at input degree two it is the imported tame symbol in the right-uniformizer convention.
- `norm_compatibility` (characterisation): For a finite extension with the imported one-step norm-residue hypotheses, the iterated residue of a transfer equals the transfer on the final residue field of the iterated residue, with no extra ramification factor. In degree zero the final transfer is multiplication by the final residue degree.

**Uses.**

- Part I section 6.4 and section 7: The tame symbol and the valuation map split the topological Milnor K-group into a free part and the part generated by the principal units; the iterated residue is the top piece of that splitting.
- Part I section 10.5: The existence theorem produces the norm subgroup of a tame cyclic extension as the orthogonal complement of an element for the tame symbol, which is built from the iterated residue.
- HL.5: The residue maps attached to a Parshin chain are the iterated residues of the higher local field attached to the flag.

**Acceptance.**

- In F_q((u))((t)), ∂_u∂_t{u,t}=+1 and ∂_u∂_t{t,u}=−1.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`
- `K2SymbolsBrauer:T.3/tame-symbol`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `K2SymbolsBrauer:T.3/rigidity`
- `K2SymbolsBrauer:T.2/milnor-alternating`
- `K2SymbolsBrauer:T.2/milnor-k-theory`

**Sources.**

- inv, Part I, section 7, subsection 7.1, printed p. 75. “apply the tame symbol and valuation map of subsection 6.4” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I §6, opening overview, printed p. 61 (the body of §§6.4–6.8 has not been read). “presents very useful pairings” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

Planet: **Iterated residue**.

### Milnor norms for a finite extension of higher local fields, and the projection formula

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For a finite extension L/K of n-dimensional local fields with the compatible residue towers and the one-step finiteness hypotheses of the imported norm–residue theorem, the iterated residues satisfy ∂_K∘N_{L/K}=N_{L_0/K_0}∘∂_L. There is no extra ramification factor in this transfer identity. Separately, restriction satisfies ∂_L∘res_{L/K}=(∏ e_i) res_{L_0/K_0}∘∂_K. In degree m=n the final transfer on K_0^M=Z is multiplication by f=[L_0:K_0]. Projection formula and transfer transitivity are imported, not reconstructed.

**Hypotheses and conventions.**

- Use compatible specified residue towers and the finiteness hypotheses of the imported one-step norm–residue result.
- Ramification factors appear in restriction, while residue degrees enter through the final transfer.
- All-degree transfers and projection formula are imported from K2SymbolsBrauer T.4.

**Proof outline.**

1. At each step apply the imported transfer–residue square with the unique valuation above the complete base. Compose the squares and use transfer transitivity on the final residue fields.
2. For restriction compose the one-step higher-ramification formulas; the scalars multiply to ∏e_i.
3. In degree zero use the supplier transfer-degree formula; this is where f appears.

**Acceptance.**

- For a totally ramified one-step extension with f=1, ord_K(Nπ_L)=1 even when e>1; an extra e factor would fail.
- For a purely unramified tower extension, the degree-zero norm is f, while the restriction multiplier is 1.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`
- `K2SymbolsBrauer:T.3/transfer-and-norm-residue`
- `K2SymbolsBrauer:T.3/higher-ramification-formula`
- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`
- `K2SymbolsBrauer:T.4/milnor-projection-formula`
- `K2SymbolsBrauer:T.2/milnor-k-theory`

**Sources.**

- inv, Part I, section 5, subsection 5.2, printed p. 57. “If L/K is unramified, the norm map” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I §6, opening overview, printed p. 61 (the body of §§6.4–6.8 has not been read). “6.8 presents various properties of the norm map on K-groups.” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

### Topological Milnor K-groups

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`. Kind: definition. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Endow the Milnor K-groups of an n-dimensional local field F with the topology induced from the higher topology on the multiplicative group through the symbol map, and let Lambda_m(F) be the intersection of all neighbourhoods of zero in K_m(F). The topological Milnor K-group K^top_m(F) is the quotient K_m(F)/Lambda_m(F). It coincides with the quotient of K_m(F) by the intersection of the subgroups l K_m(F) over all l greater than one. The reciprocity map of a higher local field is not injective on K_n(F): its kernel contains that intersection, so the Milnor K-groups are too large from the point of view of class field theory and one passes to the topological quotient without losing arithmetical information. The notion was first introduced by Parshin.

**Hypotheses and conventions.**

- The definition of the quotient must fix which subgroup is divided out: the closure of zero for the chosen topology, equivalently the intersection of the l K_m(F), and not any other divisible subgroup. The roadmap text says the topological group is to be defined only after fixing that.
- The algebraic and the topological Milnor groups are not interchangeable; the roadmap text says so and the source's whole section 6 is about the difference.
- That the intersection of the l K_n(F) equals Lambda_n(F) equals the kernel of the reciprocity map is a corollary of the existence theorem of HL.3, not part of the definition.

**Proof outline.**

1. Define the topology on K_m(F) as the finest topology for which the symbol map from the m-fold product of the multiplicative group is sequentially continuous and addition is sequentially continuous.
2. Define Lambda_m(F) as the intersection of all neighbourhoods of zero and K^top_m(F) as the quotient.
3. Prove that K^top_m(F) is the quotient of K_m(F) by the intersection of the l K_m(F), for l over the integers greater than one.
4. In characteristic p, record the decomposition K^top_n(F) ≃ Z ⊕ (Z/(q−1))^n ⊕ VK^top_n(F), with n tame cyclic factors, where q is the cardinality of the final residue field. The source generator {t_n,…,t_1} of the free factor has iterated residue (−1)^{n(n−1)/2} in the imported right-uniformizer convention.
5. Record that the open subgroups of finite index of K_n(F) are in one-to-one correspondence with those of K^top_n(F), so the existence theorem can be stated either way.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `HigherLocalField.KTop` | data | The topological Milnor K-group K^top_m(F). |
| `HigherLocalField.Lambda` | data | The intersection Lambda_m(F) of all neighbourhoods of zero in K_m(F). |
| `HigherLocalField.KTop_eq_quotient_divisible` | characterisation | K^top_m(F) is K_m(F) modulo the intersection of the l K_m(F). |
| `HigherLocalField.KTop_structure` | structure | In characteristic p with final residue field F_q, K^top_n(F) ≃ Z ⊕ (Z/(q−1))^n ⊕ VK^top_n(F). |
| `HigherLocalField.KTop_openSubgroups` | equivalence | Open subgroups of finite index of K_n(F) correspond bijectively to those of K^top_n(F). |
| `HigherLocalField.KTop_no_p_torsion` | relation | For a field of characteristic p, K^top_m(F) has no nonzero p-torsion and the intersection of the p^r VK^top_m(F) is zero, in the degree range 1≤m≤n+1 of Parshin’s theorem. |
| `HigherLocalField.KTop_top_degree` | example | In characteristic p, K^top_{n+1}(F) is isomorphic to the multiplicative group of the last residue field. |
| `HigherLocalField.KTop_one_dimensional` | compatibility | For n = 1 the topological K_1 is the multiplicative group itself. |

**Unit-test specifications.**

- `one_dimensional` (characterisation): For n = 1, K^top_1(F) is F^times and the passage to the topological quotient does nothing in degree one (the degenerate case).
- `degree_two_local` (characterisation): For a one-dimensional local field, K_2(F) is the direct sum of its torsion and an uncountable uniquely divisible group, so K^top_2(F) is the torsion part; a construction that returns K_2(F) itself is wrong.
- `top_degree_characteristic_p` (characterisation): In characteristic p, K^top_{n+1}(F) is the multiplicative group of the last residue field.
- `not_the_algebraic_group` (characterisation): K^top_n(F) is a proper quotient of K_n(F) whenever the latter has a nonzero divisible part, so the two must not be identified (the required non-example).
- `rank_two_tame_factors` (characterisation): For F_q((u))((t)), the characteristic-p decomposition of K^top_2 has two tame cyclic factors of order q−1. Replacing their product by one such factor gives the wrong finite order when q>2.

**Uses.**

- Part I sections 7 and 10: Both routes to the reciprocity map, Parshin's in characteristic p and Fesenko's explicit one, construct it on K^top_n(F) and not on K_n(F).
- Part I section 10.5: The existence theorem is the statement that every open subgroup of finite index of K^top_n(F) is a norm subgroup.
- HL.3: The injectivity of the reciprocity map holds on K^top_n(F) and fails on K_n(F), which is the reason the topological group exists.

**Acceptance.**

- In characteristic p, K^top_{n+1}(F) is isomorphic to F_q^times, and every element of VK^top_n(F) is uniquely a convergent series in the symbols {1 + theta t^i, t_1, ..., hat t_l, ..., t_n}, which is Parshin's theorem of section 7.2.
- In characteristic p and 1≤m≤n+1, K^top_m(F) has no nonzero p-torsion and the intersection of the p^r VK^top_m(F) is zero.
- For n = 1 the structure of K_2 of a local field is the classical one: the torsion is cyclic of order the number of roots of unity and the rest is uniquely divisible and uncountable.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`
- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `K2SymbolsBrauer:T.7/classical-local-symbols`

**Sources.**

- inv, Part I, section 6, subsection 6.0, printed p. 62. “by the intersection” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 6, subsection 6.0, printed p. 62. “as open subgroups of finite index” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

Planet: **Topological Milnor K-group**.

### Parshin: the structure of the principal-unit part in characteristic p

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Let F be an n-dimensional local field of characteristic p. Using the Artin-Schreier-Witt pairing between K^top_n(F) modulo p^r and the Witt vectors of F modulo the image of Frobenius minus one, every element of VK^top_n(F) is uniquely representable as a convergent series of symbols {1 + theta t_n^{i_n} ... t_1^{i_1}, t_1, ..., hat t_l, ..., t_n} with coefficients in the p-adic integers, where theta runs over a basis of K_0 over F_p, the exponent vector is not divisible by p and l is the least index with p not dividing i_l; and that pairing is nondegenerate. Moreover, for J running over the (m-1)-element subsets of {1, ..., n} and E_J the corresponding subgroups of V_F, the map from the product of the E_J to VK^top_m(F) sending a family to the sum of the symbols is a homeomorphism for the sequential product topology.

**Hypotheses and conventions.**

- Nondegeneracy of the pairing and the homeomorphism statement are different claims and the source proves both; the roadmap text for HL.2 warns that nondegeneracy and topological perfectness are distinct.
- The theorem is for characteristic p; the mixed-characteristic structure is the subject of sections 6.5 to 6.8 and of section 8.
- The product homeomorphism and its torsion corollary are stated for 1≤m≤n+1. The characteristic-p decomposition in degree n has n tame cyclic factors.

**Proof outline.**

1. Recall the explicit Artin-Schreier-Witt pairing of subsection 6.4.3.
2. Prove the unique representability of an element of VK^top_n(F) as a convergent series of the stated symbols, and deduce the nondegeneracy of the pairing.
3. Construct the sequentially continuous map from the product of V_F with n-1 copies of F^times to the product of the E_J and prove that its composite with the symbol map is the symbol map.
4. Prove that the resulting map is a homeomorphism by comparing open sets, using the sequential definition of the topology.

**Acceptance.**

- Corollary: K^top_m(F) has no nontrivial p-torsion and the intersection of the p^r VK^top_m(F) is zero.
- The computation i_1 ... i_n {1 + theta t^i, t_1, ..., t_n} = 0, which uses that V_F is (q-1)-divisible, is the first step and is what makes the top K-group cyclic of order q-1.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`
- `mathlib:WittVector`
- `mathlib:WittVector.frobenius`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`

**Sources.**

- inv, Part I, section 7, subsection 7.2, Theorem 1, printed p. 76. “is a homeomorphism.” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 7, subsection 7.2, printed p. 76. “We also deduce that the pairing ( , ]r is non-degenerate.” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

Planet: **Parshin's structure theorem**.

### The filtration on the Milnor K-groups and its graded pieces

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

The Milnor K-groups of a complete discrete valuation field K with residue field F carry a filtration U_m K_d(K), where U_0=K_d(K) and U_m by the symbols in which one entry lies in 1 + M_K^m. The graded piece gr_0 K_d(K) is the direct sum of K_d(F) and K_{d-1}(F), and for m > 0 the graded pieces are computed, in the equal-characteristic and in the mixed-characteristic cases, as quotients of modules of differential forms of the residue field. These computations are what the index calculation in the isomorphism theorem rests on, and they are also the bridge between the Milnor K-groups and the logarithmic de Rham-Witt coefficients of HL.2.

**Hypotheses and conventions.**

- The graded pieces in degree zero are as stated; in positive degrees the answer depends on the characteristic profile and on the absolute ramification, and the complete list of known results is the subject of section 15 of the source, which was not read.
- The relation between the filtration on the K-groups and the ramification filtration on the Galois side is the subject of HL.4.
- Separate the unit-symbol subgroup from U_0 of this filtration: the displayed two-summand gr_0 formula uses U_0=K_d(K). The source §4.2 proof and all positive graded pieces remain unextracted.

**Proof outline.**

1. Define the filtration U_m K_d(K) by the condition that one entry of the symbol lies in the m-th step of the unit filtration.
2. Compute gr_0 K_d(K) as the direct sum of K_d(F) and K_{d-1}(F), through the residue and the specialisation.
3. Record the computation of the graded pieces for m > 0 in the two characteristic profiles as quotients of differential modules of F, citing the source rather than proving it here.
4. Record the surjective homomorphism from the module of (d-1)-forms of F onto K_d(K)/N K_d(L) that appears in the proof of the isomorphism theorem for a totally ramified or ferociously ramified degree-p extension.

**Acceptance.**

- In the isomorphism theorem for a totally ramified extension of degree p, the map sending x d log y_1 ... d log y_{d-1} to the class of {1 + x b, y_1, ..., y_{d-1}} is surjective onto K_d(K)/N K_d(L), and its source is the d-1 forms of F modulo the image of Frobenius minus one and of d, which is isomorphic to H^d(F, Z/p(d-1)) and has order p.
- For a ferociously ramified extension, that is one for which the residue extension is purely inseparable of degree p, the same shape of argument applies with a different generator.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`
- `tauceti:TauCeti.unitFiltration`
- `mathlib:WittVector`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `K2SymbolsBrauer:T.2/milnor-k-theory`

**Sources.**

- inv, Part I, section 5, subsection 5.2, printed p. 57. “has a filtration” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 5, subsection 5.2, printed p. 58. “the above map induces a surjective homomorphism” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

### The acceptance computation: an iterated residue and its sign

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/acceptance-computation-of-an-iterated-residue`. Kind: application. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Take F = F_q((u))((t)) with local parameters t_1 = u, t_2 = t, and let theta be a Teichmueller representative of an element of F_q^times. Then the iterated residue of the symbol {theta, u, t} in K_3(F) is the class of theta in F_q^times; the iterated residue of {theta, t, u} is its inverse; and the symbol {t, u} has iterated residue −1 in the sense of the two-parameter computation. In the topological group, K^top_3(F) is isomorphic to F_q^times through theta mapsto {theta, u, t}, and K^top_2(F) is the direct sum of Z, of two copies of Z/(q−1), and of the principal-unit part described by Parshin's theorem.

**Hypotheses and conventions.**

- This is the acceptance computation the layer asks for, and its point is the sign: changing the order of the parameters must produce the expected sign and not an unproved canonical identification.
- The computation is carried out in the topological group, where K^top_{n+1}(F) is cyclic of order q-1; in the algebraic group K_3(F) is much larger.
- The source lists {t_n,…,t_1} as the free generator. Relative to the imported ordered-residue normalization, its image is (−1)^{n(n−1)/2}; the generator of Z must be chosen accordingly.

**Proof outline.**

1. Compute the first boundary map, at the t-adic valuation of F with residue field F_q((u)).
2. Compute the second, at the u-adic valuation of F_q((u)) with residue field F_q.
3. Compose and evaluate on the two orderings of the parameters, recording the sign.
4. Identify the answer with Parshin's computation of K^top_{n+1}(F).

**Acceptance.**

- Section 7.1 of the source carries out the computation that i_1 ... i_n {1 + theta t^i, t_1, ..., t_n} = 0 and deduces that K^top_{n+1}(F) is isomorphic to F_q^times.
- Section 6.5 gives the splitting of K^top_n(F) into the free part generated by {t_n, ..., t_1}, the part generated by {theta, ..., hat t_l, ...} and the principal-unit part.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`

**Sources.**

- inv, Part I, section 7, subsection 7.1, printed p. 75. “apply the tame symbol and valuation map of subsection 6.4” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 7, subsection 7.1, printed p. 75. “apply the tame symbol and valuation map of subsection 6.4” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

### The topological and the algebraic Milnor K-groups are not interchangeable

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-versus-algebraic-k-groups`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For a one-dimensional local field F the Milnor K-group K_2(F) is the direct sum of its torsion subgroup, which is cyclic of order the number of roots of unity in F, and an uncountable uniquely divisible group; and K_m(F) for m at least three is uniquely divisible and uncountable. Consequently the map from K_m(F) to K^top_m(F) has an enormous kernel, the reciprocity map is not injective on K_m(F), and every statement of class field theory has to be read on the topological group. In particular a norm subgroup is open of finite index in the topological group, and the correspondence between finite abelian extensions and open subgroups of finite index is a correspondence of subgroups of K^top_n(F); it transports to K_n(F) only because open subgroups of finite index correspond bijectively.

**Hypotheses and conventions.**

- These structure results for a one-dimensional local field are due to Bass, Tate, Moore, Merkurjev, Kahn and Sivitsky and are quoted by the source; they are not proved here.
- The roadmap text records exactly this as the known boundary of the layer: the algebraic and topological Milnor groups are not interchangeable.

**Proof outline.**

1. Record the structure of K_2 and of K_m for m at least three of a one-dimensional local field, with the attributions.
2. Deduce that the kernel of the map to the topological group is uncountable.
3. Record that the reciprocity map is therefore not injective on K_n(F) and that its kernel contains the intersection of the l K_n(F).
4. Record the bijection between open subgroups of finite index on the two sides, which is what makes the existence theorem transportable.

**Acceptance.**

- This is the content of subsections 6.0 and 6.1 of the source and is the reason the whole of section 6 exists.
- A statement of the existence theorem phrased on K_n(F) without the topological quotient would be false as an injectivity statement and true only as a statement about open subgroups of finite index.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`
- `K2SymbolsBrauer:T.2/milnor-examples`
- `KTheoryFiniteLocalFields:L.3`
- `K2SymbolsBrauer:T.2/milnor-k-theory`

**Sources.**

- inv, Part I, section 6, subsection 6.1, printed p. 62. “is an uncountable uniquely divisible group” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 6, subsection 6.0, printed p. 62. “is not injective in general” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

## HL.2

Coverage: **partial**. Source obligations are retained under accepted RS-28; this stage is not closed.

- Generic continuous cohomology and dimension definitions are imported from ProfiniteCohomology; ordinary n=1 invariant/duality from ClassFieldTheory Layer 5 in its exact scope.
- CR.4 supplies ordinary/relative de Rham–Witt; M.5d supplies its norm-residue/differential comparison. Wild higher-local coefficients, duality and exact hypotheses remain open.
- Extract the prime-to-p duality proof leaves and maintain the typed-interface gap.

### Kato's cohomology groups H^q(k) and their two characteristic cases

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`. Kind: definition. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For a field k and q>0 define H^q(k) as follows. If char(k) = 0, H^q(k) is the Galois cohomology group H^q(k, Q/Z(q-1)), the (q-1)st Tate twist. If char(k) = p > 0, then following Illusie one sets H^q(k, Z/p^n(q-1)) = H^1(k, W_n Omega^{q-1}_{k^sep, log}), which is explicitly the group of Witt vectors of length n tensored with q-1 copies of the multiplicative group, modulo the subgroup generated by the elements w tensor b_1 ... b_{q-1} with two equal entries, by (0, ..., 0, a, 0, ..., 0) tensor a tensor b_1 ... b_{q-2}, and by (F-1)(w) tensor b_1 ... b_{q-1} where F is the Frobenius on Witt vectors; one then takes the colimit over n and the direct sum over all primes of the corresponding groups. For every field, H^1(k) is the group of continuous characters of the absolute Galois group and H^2(k) is the Brauer group.

**Hypotheses and conventions.**

- The characteristic-p part is defined through logarithmic de Rham-Witt sheaves and not through etale cohomology of roots of unity; the roadmap text warns that Kummer arguments at an invertible prime do not prove the characteristic-p case.
- The identification of H^2(k) with the Brauer group in characteristic p uses the bijectivity of the differential symbol, that is the Bloch-Gabber-Kato theorem.
- For the mixed-characteristic lift on source p. 55 the target is H^q, not the printed H^1; see source issue E2. The q=1 presentation has only the Frobenius-minus-one relation, with no negative number of tensor factors.

**Proof outline.**

1. Define H^q(k) in characteristic zero as the Galois cohomology of the Tate twist.
2. In characteristic p define H^q(k, Z/p^n(q-1)) as the first cohomology of the logarithmic de Rham-Witt sheaf, and give the explicit presentation by Witt vectors and units modulo the three families of relations.
3. Take the colimit over n to get the p-part and the direct sum over primes to get H^q(k).
4. Prove H^1(k) is the character group and H^2(k) is the Brauer group; in characteristic p the latter uses the differential symbol and the Kummer sequence for the pn-torsion of the Brauer group.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `Kato.H` | data | The group H^q(k), defined by cases on the characteristic. |
| `Kato.H.charZero` | constructor | In characteristic zero, the Galois cohomology of the (q-1)st Tate twist. |
| `Kato.H.charP` | constructor | In characteristic p, the first cohomology of the logarithmic de Rham-Witt sheaf, with its explicit presentation. |
| `Kato.H_one` | characterisation | H^1(k) is the group of continuous characters of the absolute Galois group. |
| `Kato.H_two` | characterisation | H^2(k) is the Brauer group of k. |
| `Kato.H_finiteField` | example | For a finite field H^1 is Q/Z and H^q vanishes for q at least two. |
| `Kato.H_functorial` | functoriality | H^q is functorial in the field, with corestriction for a finite extension. |

**Unit-test specifications.**

- `finite_field` (characterisation): For a finite field, H^1 is Q/Z and H^2 vanishes (the degenerate case that starts the induction).
- `brauer_group` (characterisation): H^2(k) is the Brauer group; a definition for which this fails in characteristic p is wrong.
- `char_p_not_etale` (characterisation): In characteristic p the p-part is not the etale cohomology of roots of unity: the required non-example, since mu_p is infinitesimal.
- `tate_twist` (characterisation): In characteristic zero the twist is by q-1 and not by q; the degree and the twist of the invariant map are what the acceptance case checks.

**Uses.**

- Part I section 5, Theorem of Kato and its Corollary: The computation of H^q(K) for a henselian discrete valuation field in terms of H^q and H^{q-1} of the residue field is what produces the invariant map by induction on the dimension.
- Part I section 5.2: The reciprocity map is defined by the cup product K_d(K) times H^1(K) to H^{d+1}(K) followed by the invariant isomorphism.
- HL.4: The explicit formulas for the Hilbert symbol are formulas for this cup product in the two characteristic regimes.

**Acceptance.**

- For k a finite field, H^1(k) is Q/Z and H^q(k) vanishes for q at least two; this is the base of the induction that produces the invariant map.
- For k of characteristic p the groups H^q(k, Z/p^n(q-1)) are what the logarithmic de Rham-Witt coefficients of the wild case are.

**Prerequisites.**

- `mathlib:groupCohomology`
- `mathlib:WittVector`
- `mathlib:WittVector.frobenius`
- `tauceti:TauCeti.ContinuousCohomology.cochainsMap_zero`
- `mathlib:ProfiniteGrp`
- `CrystallineCohomology:CR.4`
- `MotivicEtaleKTheory:M.5d`
- `K2SymbolsBrauer:T.2:symbols`
- `K2SymbolsBrauer:T.3:localization-comparison`
- `K2SymbolsBrauer:T.3:symbols`
- `K2SymbolsBrauer:T.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Part I, section 5, subsection 5.1, printed p. 54. “If char(k) = p > 0, then following Illusie [I] we define” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 5, subsection 5.1, printed p. 54. “J is the subgroup generated by elements of the form” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

Planet: **Kato's cohomology groups**.

### Kato's theorem on a henselian discrete valuation field, and the invariant map

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Let K be a henselian discrete valuation field with residue field F, let pi be a prime element and consider the homomorphism i from the direct sum of H^q(F) and H^{q-1}(F) to H^q(K) sending (a, b) to i_{K/F}(a) + i_{K/F}(b) cup pi. Suppose char(F) = p. Then i is bijective in the prime-to-p component; in the p-component it is injective and its image is the p-component of the kernel of the restriction from H^q(K) to H^q of the maximal unramified extension. Consequently, if char(F) = p, the residue field satisfies |F : F^p| = p^{d-1} and there is an isomorphism H^d(F) onto Q/Z, then i induces an isomorphism H^{d+1}(K) onto Q/Z. Applying this by induction down the residue tower of a d-dimensional local field gives a canonical invariant isomorphism inv from H^{d+1}(K) to Q/Z.

**Hypotheses and conventions.**

- The theorem requires char(F) = p; the mixed-characteristic p-part is the delicate half and is where the logarithmic de Rham-Witt description enters.
- The corollary applies to a d-dimensional local field, and also when the last residue field is quasi-finite rather than finite.
- The invariant map is canonical: it is what makes the corestriction diagram for a finite extension commute and therefore what makes the reciprocity map compatible with norms.

**Proof outline.**

1. Construct the maps i_{K/F} in both characteristic profiles, the mixed case using Artin-Schreier-Witt theory to send a Witt vector to a character.
2. Prove Kato's theorem: bijectivity away from p and the description of the image at p as the unramified kernel.
3. Deduce the corollary from Bloch-Kato's theorem on the norm residue homomorphism, which is imported.
4. Construct the invariant map inv on a d-dimensional local field by induction on d, starting from the finite last residue field where H^1 is Q/Z.
5. Prove that for a finite extension L/K the corestriction makes the two invariant maps agree.

**Acceptance.**

- The acceptance case at n = 1 is the classical invariant of the Brauer group of a local field, which the audit records as absent from both libraries.
- The induction is exactly the reason the whole theory is organised along the residue tower.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`
- `mathlib:WittVector`
- `tauceti:TauCeti.ContinuousCohomology.cochainsMap_zero`
- `MotivicEtaleKTheory:M.5d`
- `CrystallineCohomology:CR.4`
- `K2SymbolsBrauer:T.2:symbols`
- `K2SymbolsBrauer:T.3:localization-comparison`
- `K2SymbolsBrauer:T.3:symbols`
- `K2SymbolsBrauer:T.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Part I §5.1, Theorem (Kato [K2, Th. 3]), printed pp. 55–56. “Let K be a henselian discrete valuation field” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 5, subsection 5.1, Corollary, and 5.2, printed p. 56. “Then, i induces an isomorphism” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

Planet: **The invariant map**.

### Cohomological dimension of a higher local field and the Tate twists

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For a fixed n-dimensional local field K with finite final residue characteristic p, the prime-to-p cohomological-dimension target is cd_ℓ(K)=n+1 for primes ℓ≠p, with the corresponding dimensions down the tower. The characteristic-p differential theory of Kato must not be identified with ordinary p-cohomological dimension of the absolute Galois group; the inherited unqualified dimension formula is withdrawn. Import the generic cohomological-dimension definitions and all-degree continuous cup machinery from ProfiniteCohomology. Kato H^{n+1}(K) has twist n, and the n=1 invariant is the degree-two, twist-one Brauer invariant. Exact wild dimension statements and their proof leaves remain a gap.

**Hypotheses and conventions.**

- The cohomological dimension statement is used in the proof of the isomorphism theorem, where it forces the norm map on the residue fields to be surjective modulo l.
- The degree and the twist of the invariant map are the acceptance check the roadmap text asks for.

**Proof outline.**

1. Import generic dimension and continuous-cohomology definitions from their canonical owner.
2. Extract the prime-to-p induction through successive discrete valuations and the finite-field base, including exact hypotheses.
3. Keep Kato differential p-cohomology and ordinary continuous Galois cohomology separate; acquire the selected wild dimension theorem before stating an analogue.

**Acceptance.**

- The n=1 Brauer invariant is in degree two with twist one.
- An ordinary p-cohomological-dimension formula n+1 is not asserted in equal characteristic p.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`
- `mathlib:groupCohomology`
- `mathlib:ProfiniteGrp`
- `MotivicEtaleKTheory:M.5d`
- `CrystallineCohomology:CR.4`
- `K2SymbolsBrauer:T.2:symbols`
- `K2SymbolsBrauer:T.3:localization-comparison`
- `K2SymbolsBrauer:T.3:symbols`
- `K2SymbolsBrauer:T.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Part I, section 5, subsection 5.2, printed p. 57. “the cohomological dimension of F [K2, p.220] is d.” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 5, subsection 5.1, Corollary, printed p. 56. “Then, i induces an isomorphism” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

### The norm residue theorem and the identification of the symbol cup products

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Bloch-Kato's theorem states that for a henselian discrete valuation field K of characteristic zero with residue field of positive characteristic the norm residue homomorphism from K_q(K)/m to H^q(K, Z/m(q)) is an isomorphism; the general norm residue theorem identifies Milnor K-theory modulo m with etale cohomology with Tate-twisted finite coefficients for every field in which m is invertible, and the characteristic-p statement is the differential symbol of Bloch-Gabber-Kato. This layer imports these and uses them to identify the cup products of symbols with the images of Milnor symbols: the pairing K_d(K) times H^1(K) to H^{d+1}(K) that defines the reciprocity map is computed on symbols through that identification, and the kernel of multiplication by p on H^{d+1}(K) is identified with H^{d+1}(K, Z/p(d)) and with K_{d+1}(K)/p.

**Hypotheses and conventions.**

- The norm residue theorem is not proved here; it is owned by MotivicEtaleKTheory and imported. What this layer does is use it to compute the pairing.
- The identification of the kernel of multiplication by p is exactly the step used in the surjectivity half of the isomorphism theorem.

**Proof outline.**

1. Import the norm residue theorem and the differential symbol.
2. Use them to identify K_q(K)/m with H^q(K, Z/m(q)) and to compute the cup product of a Milnor symbol with a character.
3. Record the identification of the p-torsion of H^{d+1}(K) with K_{d+1}(K)/p that the surjectivity argument uses.
4. Record the two-dimensional equal-characteristic residue pairing that the layer's acceptance asks for.

**Acceptance.**

- In the surjectivity half of the isomorphism theorem, showing that the reciprocity map hits a given character amounts to finding x in K_d(K) with {x, a} nonzero in K_{d+1}(K)/p, which is possible by the identification above.
- The acceptance case is the equal-characteristic two-dimensional residue pairing, which is the Artin-Schreier-Witt pairing of section 6.4.3 of the source.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`
- `MotivicEtaleKTheory:KU-normresidue`
- `MotivicEtaleKTheory:M.5d`
- `K2SymbolsBrauer:T.7/symbol-formula`
- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `CrystallineCohomology:CR.4`
- `K2SymbolsBrauer:T.2:symbols`
- `K2SymbolsBrauer:T.3:localization-comparison`
- `K2SymbolsBrauer:T.3:symbols`
- `K2SymbolsBrauer:T.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Introduction, printed p. v. “the norm residue homomorphism” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Part I, section 5, subsection 5.2, printed p. 58. “By Bloch-Kato's theorem” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

### Logarithmic de Rham-Witt and Artin-Schreier-Witt coefficients for the wild case

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`. Kind: construction. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

In characteristic p the coefficients of the theory are the logarithmic parts W_n Omega^r_{log} of the de Rham-Witt complex, and the corresponding arithmetic input is Artin-Schreier-Witt theory, which identifies H^1(k, Z/p^n) with the Witt vectors of length n modulo the image of Frobenius minus one. The differential symbol of Bloch-Gabber-Kato identifies K_r(k)/p with W_1 Omega^r_{log}, which is what makes the explicit presentation of Kato's groups in characteristic p correct. Mathlib has Witt vectors; neither library has de Rham-Witt complexes or their logarithmic parts, and the audit records that the layer's wild coefficients have to be built from CrystallineCohomology:CR.4.

**Hypotheses and conventions.**

- The logarithmic part is not the whole de Rham-Witt complex, and the symbol lands in the logarithmic part only; the distinction is what the Bloch-Gabber-Kato theorem is about.
- Artin-Schreier-Witt theory is the p-adic analogue of Kummer theory and is the only route to the p-part in characteristic p.
- At modulus p the differential symbol uses length-one logarithmic forms; modulus p^s uses the corresponding length-s object and its separately imported theorem.

**Proof outline.**

1. Import the de Rham-Witt complex and construct its logarithmic part.
2. Construct the Artin-Schreier-Witt isomorphism between H^1(k, Z/p^n) and the Witt vectors modulo Frobenius minus one.
3. Import the Bloch-Gabber-Kato differential symbol and record that it is an isomorphism onto the logarithmic part.
4. Assemble the explicit presentation of Kato's groups in characteristic p from these.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `DeRhamWitt.log` | data | The logarithmic part W_n Omega^r_{log} of the de Rham-Witt complex. |
| `ArtinSchreierWitt.iso` | equivalence | H^1(k, Z/p^n) is the Witt vectors of length n modulo the image of Frobenius minus one. |
| `DifferentialSymbol` | data | The differential symbol from K_r(k)/p to the logarithmic part. |
| `DifferentialSymbol.bijective` | characterisation | Bloch-Gabber-Kato: the differential symbol is an isomorphism. |
| `ArtinSchreierWitt.pairing` | structure | The pairing between K^top_n(F) modulo p^r and the Witt vectors modulo Frobenius minus one. |
| `ArtinSchreierWitt.pairing_nondegenerate` | characterisation | The pairing is nondegenerate, which is a different statement from topological perfectness. |

**Unit-test specifications.**

- `one_dimensional_artin_schreier` (characterisation): For n = 1 and r = 1 the pairing is the classical Artin-Schreier symbol.
- `logarithmic_is_proper` (characterisation): The logarithmic part is a proper subsheaf of the de Rham-Witt complex; a construction identifying the two is wrong (the required non-example).
- `differential_symbol_iso` (characterisation): The differential symbol is bijective, which is what makes the presentation of Kato's groups correct.
- `nondegenerate_not_perfect` (characterisation): Nondegeneracy of the pairing is not the same as topological perfectness; the two must be stated separately.

**Uses.**

- Part I section 5.1: The explicit presentation of Kato's groups in characteristic p is exactly the target of the differential symbol.
- Part I section 7.2: Parshin's structure theorem is proved using the explicit form of the Artin-Schreier-Witt pairing.
- Part I section 10.5: In the characteristic-p case the existence theorem produces the norm subgroup as an orthogonal complement for this pairing.

**Acceptance.**

- The Artin-Schreier-Witt pairing between K^top_n(F) modulo p^r and the Witt vectors modulo Frobenius minus one is the pairing that Parshin's structure theorem uses and that the existence theorem uses in the characteristic-p case.
- For n = 1 the pairing is the classical Artin-Schreier-Witt symbol.

**Prerequisites.**

- `mathlib:WittVector`
- `mathlib:WittVector.frobenius`
- `mathlib:groupCohomology`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`
- `CrystallineCohomology:CR.4`
- `K2SymbolsBrauer:T.2:symbols`
- `K2SymbolsBrauer:T.3:localization-comparison`
- `K2SymbolsBrauer:T.3:symbols`
- `K2SymbolsBrauer:T.4`
- `MotivicEtaleKTheory:M.5d`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Part I, section 5, subsection 5.1, printed p. 54. “If char(k) = p > 0, then following Illusie [I] we define” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Introduction, printed p. v. “Kato's cohomology groups in characteristic p” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

### Finite-coefficient duality for primes invertible in the field

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Let K be an n-dimensional local field with finite final residue characteristic p and let ℓ be a prime different from p. The prime-to-final-residue-characteristic target is the perfect pairing H^i(K,Z/ℓ(r)) × H^{n+1−i}(K,Z/ℓ(n−r)) → H^{n+1}(K,Z/ℓ(n)) ≃ Z/ℓ, with exact coefficient conventions and proof leaves to be extracted. At n=1 compare with ClassFieldTheory Layer 5 in its scope. Primes merely invertible in the top field are not automatically in this prime-to-p regime: for mixed-characteristic higher fields the residue-characteristic pairing needs its own wild coefficient theorem and topology. No finite perfect pairing for that regime is asserted here.

**Hypotheses and conventions.**

- ℓ differs from the final residue characteristic p; the twist and degree sums are fixed as displayed.
- The ordinary mixed-characteristic local-field case available upstream is imported in its own scope.

**Proof outline.**

1. Import the canonical continuous cohomology and cup products.
2. Extract the prime-to-p duality theorem, including finiteness and the invariant normalization, and split its induction through the tower.
3. State wild higher-field duality separately after selecting its exact coefficients, topology and nondegeneracy/perfectness statement.

**Acceptance.**

- For n=1 the two cohomological degrees sum to two and the twists sum to one.
- For Q_p{{t}}, ℓ=p is excluded from this theorem even though p is invertible in the top field.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`
- `mathlib:groupCohomology`
- `MotivicEtaleKTheory:M.5d`
- `CrystallineCohomology:CR.4`
- `K2SymbolsBrauer:T.2:symbols`
- `K2SymbolsBrauer:T.3:localization-comparison`
- `K2SymbolsBrauer:T.3:symbols`
- `K2SymbolsBrauer:T.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Part I, section 5, subsection 5.2, printed p. 56. “The cup product defines a pairing” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Introduction, printed p. iv. “For these fields there is a reciprocity map” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

### The acceptance computations: local duality at n = 1 and a two-dimensional residue pairing

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`. Kind: application. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

The two acceptance computations of the layer are recorded. First, for n = 1 the invariant map is the Brauer invariant, the pairing K_1(K) times H^1(K) to H^2(K) is the classical one and the duality is ordinary local Tate duality; the twist of the degree-two invariant is one (the H^1 character has twist zero) and the degree is two, which is the explicit check the roadmap text asks for. Second, for K = F_q((u))((t)) of equal characteristic p the residue pairing is the Artin-Schreier-Witt pairing between K^top_2(K) modulo p^r and the Witt vectors of K of length r modulo Frobenius minus one, with values in Z/p^r; its explicit form is the one in subsection 6.4.3 of the source, and it is nondegenerate by Parshin's theorem.

**Hypotheses and conventions.**

- The twist and the degree of the invariant map are checked explicitly in both cases, which is what the acceptance asks.
- The two computations are in different coefficient regimes, prime-to-p and p, and neither proves the other.

**Proof outline.**

1. Instantiate the invariant map for n = 1 and identify it with the Brauer invariant.
2. Check the twist and the degree.
3. Instantiate the residue pairing for F_q((u))((t)) and identify it with the Artin-Schreier-Witt pairing.
4. Record the nondegeneracy from Parshin's theorem and distinguish it from topological perfectness.

**Acceptance.**

- The n = 1 invariant is the one the audit records as belonging to Tau Ceti's ClassFieldTheory layer 5, which is the duplicate the audit names.
- The two-dimensional pairing is the one Parshin's class field theory in characteristic p is built on.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`
- `CrystallineCohomology:CR.4`
- `K2SymbolsBrauer:T.2:symbols`
- `K2SymbolsBrauer:T.3:localization-comparison`
- `K2SymbolsBrauer:T.3:symbols`
- `K2SymbolsBrauer:T.4`
- `MotivicEtaleKTheory:M.5d`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Part I, section 7, subsection 7.2, printed p. 76. “Using the Artin-Schreier-Witt pairing” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 5, subsection 5.0, printed p. 53. “First, for the Brauer group Br(K)” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

## HL.3

Coverage: **partial**. Source obligations are retained under accepted RS-28; this stage is not closed.

- The source gives an outline of the isomorphism theorem and not a complete proof; the three cases of the index computation are sketched and the reader is referred to Kato's papers and to Serre's book for the argument by calculation of symbols.
- Kato's own route to the existence theorem, which defines the class of open subgroups of finite index without introducing a topology on K_n(F), is in his preprint on printed pages 165 to 195 of the volume, which was not read.
- The generalisation of the existence theorem to a perfect, not separably p-closed, last residue field is recorded and not developed; section 16 of the source was not read.
- The inherited bundled declarations and typed-interface frontier remain open; see the named gaps.

### The higher local reciprocity homomorphism

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`. Kind: construction. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Let K be a d-dimensional local field. The cup product gives a pairing from K_d(K) times H^1(K) to H^{d+1}(K), which the invariant map identifies with Q/Z. This pairing induces a homomorphism Psi_K from K_d(K) to Gal(K^ab/K), identified with the group of homomorphisms from H^1(K) to Q/Z; it is the reciprocity map. Since the invariant map is natural, for a finite abelian extension L/K the corestriction makes the square of invariant maps commute, hence the square relating Psi_L and Psi_K through the norm on the left and the canonical map on the right commutes, and one obtains an induced homomorphism Psi_{L/K} from K_d(K)/N K_d(L) to Gal(L/K). The map is not injective on K_d(K); it becomes injective on the topological quotient K^top_d(K), and its image is dense.

**Hypotheses and conventions.**

- The reciprocity map is defined on the algebraic Milnor K-group but is only injective on the topological quotient; the roadmap text warns that a dense image is not automatically an isomorphism of raw groups.
- The compatibility with norms is a consequence of the naturality of the invariant map under corestriction, not an extra axiom.

**Proof outline.**

1. Construct the cup product pairing and compose with the invariant map.
2. Define Psi_K as the induced homomorphism to the group of homomorphisms from H^1(K) to Q/Z, which is Gal(K^ab/K).
3. Prove the corestriction compatibility of the invariant maps and deduce the norm-compatibility square.
4. Define Psi_{L/K} on K_d(K)/N K_d(L) and record that Psi_K has dense image and kernel containing the intersection of the l K_d(K).

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `HigherLocalField.reciprocity` | data | The reciprocity homomorphism Psi_K from K_d(K) to Gal(K^ab/K). |
| `HigherLocalField.reciprocity_norm` | compatibility | The square relating Psi_L and Psi_K through the norm and the canonical map commutes. |
| `HigherLocalField.reciprocityQuotient` | constructor | The induced map Psi_{L/K} on K_d(K)/N K_d(L). |
| `HigherLocalField.reciprocity_denseImage` | characterisation | The image of Psi_K is dense in Gal(K^ab/K). |
| `HigherLocalField.reciprocity_kernel` | characterisation | The kernel of Psi_K contains the intersection of the l K_d(K), and equals it by the existence theorem. |
| `HigherLocalField.reciprocity_residue_square` | relation | The square relating Psi_K, the boundary map to K^top_{d-1} of the residue field and the reciprocity map of the residue field commutes. |
| `HigherLocalField.reciprocity_one_dimensional` | compatibility | For d = 1 it is the classical local reciprocity map with the chosen Frobenius normalisation. |

**Unit-test specifications.**

- `one_dimensional` (characterisation): For d = 1 the map is the classical local reciprocity map; the Frobenius normalisation must be fixed and checked (the acceptance case).
- `not_injective` (characterisation): Psi_K is not injective on K_d(K); a construction claiming injectivity on the algebraic group is wrong (the required non-example).
- `unramified_two_dimensional` (characterisation): For a finite unramified extension of a two-dimensional local field, the image of the constant-field Frobenius and the index of the norm subgroup are the acceptance computation.
- `norm_square` (characterisation): The norm-compatibility square commutes; a construction for which it does not cannot induce Psi_{L/K}.

**Uses.**

- Part I section 5, Isomorphism Theorem: Psi_{L/K} is an isomorphism for a finite abelian extension, which is the main theorem of the layer.
- Part I section 10.5, Existence Theorem: The norm subgroups are exactly the open subgroups of finite index, so the correspondence between abelian extensions and subgroups is a statement about this map.
- HL.6: The global reciprocity map of an arithmetic scheme is assembled from these local ones along the Parshin chains.

**Acceptance.**

- For d = 1 the construction is the classical one through the cyclic algebra pairing and the Brauer invariant, and Psi_K is the classical reciprocity map.
- The commutative square with the boundary map to K^top_{d-1}(K_{d-1}) and the reciprocity map of the residue field is Theorem 3 of section 10.5 and is what makes the induction on d work.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`
- `mathlib:ProfiniteGrp`
- `CrystallineCohomology:CR.4`
- `MotivicEtaleKTheory:M.5d`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Part I, section 5, subsection 5.2, printed p. 56. “which we call the reciprocity map.” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 5, subsection 5.2, printed p. 57. “So, as in the classical case, we have a homomorphism” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

Planet: **Higher local reciprocity map**.

### The isomorphism theorem for a finite abelian extension

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For a finite abelian extension L/K of d-dimensional local fields the induced map Psi_{L/K} from K_d(K)/N K_d(L) to Gal(L/K) is an isomorphism. The proof reduces to a cyclic extension of prime degree l and splits into an index inequality and a surjectivity statement. The index inequality that the index of the norm subgroup is at most l is proved by the filtration on the Milnor K-groups: in the unramified case the first filtration step lies in the norm subgroup and the quotient is identified with the corresponding quotient one level down the tower, so the induction on d applies; in the tamely ramified case a similar argument identifies the quotient with K_d(F)/l; and in the wildly ramified or ferociously ramified case of degree p there is a surjection from the (d-1)-forms of the residue field, modulo the images of Frobenius minus one and of d, onto the quotient, and the source of that surjection has order p. Surjectivity is proved through the norm residue theorem.

**Hypotheses and conventions.**

- The three cases of the index inequality are genuinely different arguments and the wild case is the one that needs the differential forms.
- Ferocious ramification, meaning that the residue extension is purely inseparable of degree p, is a case with no one-dimensional analogue and is treated separately in the source.

**Proof outline.**

1. Reduce to L/K cyclic of prime degree l.
2. Unramified case: the norm induces surjections on the graded pieces of the filtration, so U_1 K_d(K) lies in the norm subgroup; then use the identification of gr_0 with the direct sum of K_d(F) and K_{d-1}(F), the p-divisibility statements and the induction on d.
3. Tame case, l prime to char(F): the same argument shows U_1 K_d(K) lies in the norm subgroup and the quotient is K_d(F)/l, of order l.
4. Wild and ferocious cases, l = p = char(F): construct the surjection from the (d-1)-forms of F onto the quotient using the congruence for the norm of 1 + xa, and compute the order of the source as p.
5. Surjectivity: identify the p-torsion of H^{d+1}(K) with K_{d+1}(K)/p and produce an element x with the symbol {x, a} nonzero.

**Acceptance.**

- The acceptance case for a finite unramified extension in dimension two: the image of the constant-field Frobenius under the reciprocity map and the index of the norm subgroup are both computed by the unramified case of the argument.
- The proof does not use the exact sequence with the Brauer group that the classical proof uses; the source gives the more elementary route by calculation of symbols.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`
- `CrystallineCohomology:CR.4`
- `MotivicEtaleKTheory:M.5d`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Part I, section 5, subsection 5.2, Isomorphism Theorem, printed p. 57. “We outline a proof.” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 5, subsection 5.2, printed p. 58. “We can use an argument similar to the previous one.” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

Planet: **Isomorphism theorem**.

### Parshin's route to the reciprocity map in characteristic p

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For an n-dimensional local field F of characteristic p there is a route to all the main theorems of class field theory that is remarkably simple and uses relatively few ingredients: the explicit structure of K^top_n(F) as the direct sum of Z, of Z/(q-1) and of the principal-unit part, the nondegenerate Artin-Schreier-Witt pairing between K^top_n(F) modulo p^r and the Witt vectors modulo Frobenius minus one, and the tame symbol. It does not use the cohomological machinery of HL.2, and the results of subsections 6.6 to 6.8 of the source are not needed for it. The resulting reciprocity map agrees with the cohomological one of the previous nodes.

**Hypotheses and conventions.**

- The route is for characteristic p only. It is the cheapest way to the theorems in that case and the source presents it separately for that reason.
- Agreement of the two constructions of the reciprocity map is a statement that has to be proved, not a convention.

**Proof outline.**

1. Record the structure of K^top_n(F) and the nondegenerate pairing.
2. Construct the reciprocity map from the pairing together with Artin-Schreier-Witt theory for the p-part and the tame symbol for the prime-to-p part.
3. Prove the isomorphism theorem in this setting from the nondegeneracy of the pairing.
4. Prove that the resulting map agrees with the cohomological reciprocity map.

**Acceptance.**

- The computation K^top_{n+1}(F) isomorphic to F_q^times and Parshin's structure theorem are the only inputs beyond the pairing.
- The corollary that K^top_m(F) has no nontrivial p-torsion is what makes the pairing nondegenerate on the quotient.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`
- `CrystallineCohomology:CR.4`
- `MotivicEtaleKTheory:M.5d`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Part I, section 7, opening paragraph, printed p. 75. “In this section we use the results and definitions of 6.1-6.5” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 7, subsection 7.1, printed p. 75. “apply the tame symbol and valuation map of subsection 6.4” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

Planet: **Parshin's characteristic-p route**.

### Artin-Schreier trees and the explicit construction of the reciprocity map

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

There is a third route, due to Fesenko, which constructs the reciprocity map explicitly by generalising the Neukirch and Hazewinkel axiomatic approaches to class field theory. For a strong Artin-Schreier tree L/F there is an exact sequence relating Gal(L/F)^ab, the quotient of VK^top_n(L^pur) by the subgroup generated by the sigma-differences and the norm from L^pur to F^pur, and VK^top_n(F^pur); from it one defines a homomorphism Y_{L/F} from VK^top_n(F)/N VK^top_n(L) to Gal(L/F)^ab, proves that the composite of Y_{L/F} with Psi^ab_{L/F} is the identity, so that Psi^ab_{L/F} is injective and Y_{L/F} surjective, and then that Psi^ab_{L/F} is an isomorphism. Passing to the projective limit gives the reciprocity map with dense image. The construction does not work for trees that are not strong, and the source gives an example showing it.

**Hypotheses and conventions.**

- Strongness of the Artin-Schreier tree is a real hypothesis: the source exhibits an example showing that Y_{L/F} cannot be defined otherwise.
- The route works uniformly in the characteristic-p case and, through the device of Artin-Schreier trees, sketches the characteristic-zero case as well.

**Proof outline.**

1. Define Artin-Schreier trees and the strongness condition.
2. Prove the exact sequence by induction on the degree, using the compatibility of the subgroup generated by sigma-differences with subextensions.
3. Define Y_{L/F} and prove that its composite with Psi^ab_{L/F} is the identity.
4. Prove that Psi^ab_{L/F} is an isomorphism, using property (3) of Artin-Schreier trees and a commutative diagram, with surjectivity by induction on the degree.
5. Pass to the projective limit and record that the image of Psi_F is dense.

**Acceptance.**

- Theorem 3 of section 10.5: the square relating Psi_F, the boundary map to K^top_{n-1} of the residue field and the reciprocity map of the residue field commutes, because the boundary of {t_1, ..., t_n} is a prime element of K^top_{n-1}(K_{n-1}).
- This is the route on which the existence theorem of the next node is proved.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`
- `CrystallineCohomology:CR.4`
- `MotivicEtaleKTheory:M.5d`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Part I, section 10, subsection 10.4.2, Corollary and Proposition 2, printed p. 99. “is the identity map” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 10, subsection 10.4.2, Remark, printed p. 99. “As the example above shows, one cannot define” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

### The existence theorem and the class field correspondence

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Every open subgroup of finite index in K^top_n(F) is the norm group of a uniquely determined abelian extension L/F. The proof reduces to a subgroup N of prime index l and produces an element alpha of the multiplicative group of F whose orthogonal complement is N, for the tame symbol if l is prime to p, for the Artin-Schreier-Witt pairing if the characteristic is p = l, and for Vostokov's pairing if the characteristic is zero and l = p; in the last case one first passes to F adjoined a primitive p-th root of unity when necessary and comes back using that the degree is prime to p. Kummer and Artin-Schreier theory then produce the cyclic extension, and one induces on the index. Since open subgroups of finite index of K_n(F) correspond bijectively to open subgroups of K^top_n(F), the correspondence sending L to N_{L/F} K_n(L) is a bijection between finite abelian extensions of F and open subgroups of finite index of K_n(F). A corollary is that the reciprocity map is injective on K^top_n(F).

**Hypotheses and conventions.**

- The theorem is the one the roadmap text asks for by page range; it is proved in section 10.5 of the source and independently by Kato's preprint in the same volume through a different characterisation of the class of open subgroups of finite index, which does not use the topology.
- The kernel and the topological completion are separate statements: injectivity on K^top_n(F) is a corollary, and the identification of the kernel of the reciprocity map on K_n(F) with the intersection of the l K_n(F) is another.
- For a perfect, not separably p-closed, last residue field there is a generalisation of the existence theorem, and a generalisation of the whole theory to totally ramified p-extensions.

**Proof outline.**

1. Reduce to an open subgroup of prime index.
2. In each of the three regimes produce the element alpha whose orthogonal complement for the appropriate pairing is the given subgroup, using the explicit formulas of HL.4 in the characteristic-zero wild case.
3. Construct the cyclic extension by Kummer or Artin-Schreier theory and identify its norm subgroup with the given one.
4. Induct on the index, and deduce the bijection with the open subgroups of finite index of K_n(F).
5. Deduce the injectivity of the reciprocity map on K^top_n(F) from the corollary of Theorem 1 of section 6.6.

**Acceptance.**

- The corollary that the intersection of the l K_n(F) equals Lambda_n(F) equals the kernel of the reciprocity map is exactly what makes the passage to the topological quotient lose no arithmetical information.
- Kato's preprint in the same volume defines the class of open subgroups of finite index without introducing a topology on K_n(F), which is a genuinely different approach to the same theorem.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`
- `CrystallineCohomology:CR.4`
- `MotivicEtaleKTheory:M.5d`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Part I, section 10, subsection 10.5, Existence Theorem, printed p. 100. “is the norm group of a uniquely determined abelian extension” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 10, subsection 10.5, Remark 1 and Corollary 1, printed p. 100. “is a one-to-one correspondence between finite abelian extensions of F” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

Planet: **Existence theorem**.

### The kernel of the reciprocity map and the completion statements, kept apart

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Three statements must be kept apart. First, the reciprocity map Psi_F on K_n(F) has kernel containing the intersection of the l K_n(F) over l greater than one, and by the corollary of the existence theorem that containment is an equality; so Psi_F is injective exactly on the topological quotient K^top_n(F). Second, the image of Psi_F is dense in Gal(F^ab/F) but is not all of it; a dense image is not an isomorphism of raw groups. Third, the induced maps Psi_{L/F} on the quotients by norm subgroups of finite abelian extensions are isomorphisms, and the profinite completion of K^top_n(F) with respect to the open subgroups of finite index maps isomorphically onto Gal(F^ab/F). Each of these is a separate exact statement and the roadmap text says so.

**Hypotheses and conventions.**

- The roadmap text's known boundary for this layer is exactly this: a dense reciprocity image is not automatically an isomorphism of raw groups, and kernel and profinite completion require separate exact statements.
- The identification of the kernel is a corollary of the existence theorem and not part of the construction of the reciprocity map.
- The injective map from K_n^top(F) has absolute target Gal(F^ab/F). The finite-extension quotient is K_n^top(F)/N_{L/F}K_n^top(L); see source misprint E4.

**Proof outline.**

1. State and prove the containment of the intersection of the l K_n(F) in the kernel directly.
2. Deduce the equality from the existence theorem.
3. State the density of the image and give the example showing that it is not surjective.
4. State the isomorphism on the profinite completion and distinguish it from surjectivity of Psi_F.

**Acceptance.**

- For n = 1 the classical statement is the same: the reciprocity map of a local field is injective with dense image and induces isomorphisms on the quotients by norm subgroups.
- The completion statement is the correct form of the phrase the reciprocity map is close to an isomorphism that the volume's introduction uses.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-versus-algebraic-k-groups`
- `CrystallineCohomology:CR.4`
- `MotivicEtaleKTheory:M.5d`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Introduction, printed p. iv. “everywhere dense image; but it is not injective” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Part I, section 6, subsection 6.0, printed p. 62. “As a corollary of the existence theorem in 10.5” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

### The acceptance cases: the n = 1 Frobenius convention and an unramified extension in dimension two

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`. Kind: application. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Two acceptance cases are recorded. For n = 1 the reciprocity map is the classical one and the convention has to be fixed: the packet takes the arithmetic normalisation, in which a prime element maps to a lift of the arithmetic Frobenius, which is the convention of the Tau Ceti ClassFieldTheory layer that the audit names as the duplicate. For a finite unramified extension L/F of a two-dimensional local field, that is one with all ramification indices one and separable residue extensions, the norm subgroup N_{L/F} K^top_2(L) has index equal to the degree, the quotient is cyclic generated by the class of the symbol of the two local parameters, and the reciprocity map sends that class to the Frobenius of the constant-field extension. The commutative square with the boundary map to K^top_1 of the residue field reduces the computation to the one-dimensional case.

**Hypotheses and conventions.**

- The Frobenius convention is a choice and must be fixed once; the roadmap text asks that the n = 1 case recover the chosen arithmetic or geometric convention.
- The unramified computation is the one the acceptance asks for and is the case in which the index inequality of the isomorphism theorem is proved by induction on the dimension.

**Proof outline.**

1. Fix the arithmetic normalisation at n = 1 and record the comparison with the geometric one.
2. For an unramified extension in dimension two, compute the norm subgroup through the graded pieces of the filtration.
3. Compute the image of the symbol of the local parameters under the reciprocity map, using the commutative square with the boundary map.
4. Record the index of the norm subgroup.

**Acceptance.**

- The square with the boundary map commutes because the boundary of the symbol of the local parameters is a prime element of the topological K-group one level down, which is Theorem 3 of section 10.5.
- In the unramified case the norm induces surjections on the graded pieces, so the whole first filtration step lies in the norm subgroup.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/acceptance-computation-of-an-iterated-residue`
- `K2SymbolsBrauer:T.7/classical-local-symbols`
- `CrystallineCohomology:CR.4`
- `MotivicEtaleKTheory:M.5d`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

**Sources.**

- inv, Part I, section 10, subsection 10.5, Theorem 3, printed p. 100. “The following diagram is commutative” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 5, subsection 5.2, printed p. 57. “If L/K is unramified, the norm map” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

## HL.4

Coverage: **partial**. Source obligations are retained under accepted RS-28; this stage is not closed.

- Read the complete explicit symbol formulas, including product order, roots, residues, traces and normalization. Only the old source role inventory is retained.
- Read Zhukov §17 before specifying a higher ramification filtration; the ordinary Herbrand transform is not a substitute for the higher theory.
- Prove the exact relation of ramification and Milnor K-filtrations with all index shifts.

### The higher tame symbol and the Hilbert symbol of a higher local field

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`. Kind: definition. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For m prime to the final residue characteristic p with μ_m⊂F, the higher tame pairing on K_n^M(F)×F* is obtained by the product into K_{n+1}^M(F), the n-fold right-uniformizer residue into K_1^M(F_q)=F_q*, the exponent (q−1)/m, and the inverse reduction identification μ_m(F)≃μ_m(F_q). The exponent q−1 would make this map trivial. The comparison with the Artin-defined Hilbert pairing requires fixing the order of the product entries and the arithmetic Frobenius convention; that sign comparison is not established in this checkpoint. Wild p-power pairings require the separately sourced characteristic-zero or Artin–Schreier–Witt formulas.

**Hypotheses and conventions.**

- m divides q−1, and μ_m is identified with its reduction.
- The sign comparison to the Artin pairing is a named open input; no equality is inferred just from a common target.

**Proof outline.**

1. Use the imported algebraic Milnor product and the fixed iterated residue.
2. Raise the residue to (q−1)/m and transport the resulting root of unity through reduction.
3. Extract the exact source normalization and prove the comparison to the existing reciprocity map.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `HigherLocalField.hilbertSymbol` | data | The Hilbert symbol of a higher local field containing the relevant roots of unity, defined through the reciprocity map. |
| `HigherLocalField.tameSymbol` | data | The higher tame symbol: the iterated residue followed by the power map on the last residue field. |
| `HigherLocalField.tameSymbol_is_prime_to_p_part` | characterisation | The tame symbol computes the prime-to-p part of the Hilbert pairing. |
| `HigherLocalField.KTop_splitting` | structure | The valuation map and the tame symbol split K^top_n(F) into a free part, a cyclic part of order q-1 and the principal-unit part. |
| `HigherLocalField.tameSymbol_orthogonal` | characterisation | A subgroup of index prime to p is the orthogonal complement of an element for the tame symbol. |
| `HigherLocalField.hilbertSymbol_one_dimensional` | compatibility | For n = 1 it is the classical Hilbert symbol. |

**Unit-test specifications.**

- `tame_k2_symbol` (characterisation): The tame K_2 symbol over F_q((u))((t)) evaluated on a pair of parameters is the acceptance computation, and its comparison with the abstract reciprocity map is the check.
- `one_dimensional` (characterisation): For n = 1 the tame symbol is the classical one (the degenerate case).
- `prime_to_p_only` (characterisation): The tame symbol does not see the wild part: for a wildly ramified extension its orthogonal complement is not the norm subgroup (the required non-example).
- `splitting` (characterisation): In characteristic p with final residue field of size q, the valuation and parameter-indexed tame symbols recover Z and n copies of Z/(q−1) from K^top_n. In rank two the tame finite factor has order (q−1)^2.

**Uses.**

- Part I section 10.5: In the first case of the existence theorem the norm subgroup of a cyclic extension of degree prime to p is the orthogonal complement of an element for the tame symbol.
- Part I section 6.4 and section 7: The splitting of the topological K-group is what makes Parshin's route computable.
- HL.6: The reciprocity relations on an arithmetic surface are sums of tame symbols over the flags through a point or along a curve.

**Acceptance.**

- For m=q−1 the power on F_q* is one; for m=1 the pairing has the trivial target.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`
- `K2SymbolsBrauer:T.3/tame-symbol`
- `K2SymbolsBrauer:T.7/classical-local-symbols`
- `KTheoryFiniteLocalFields:L.3`
- `K2SymbolsBrauer:T.3:symbols`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`

**Sources.**

- inv, Part I, section 8, opening paragraph, printed p. 81. “the Hilbert symbol for a local field K with finite residue field” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 7, subsection 7.1, printed p. 75. “apply the tame symbol and valuation map of subsection 6.4” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

Planet: **Higher tame symbol**.

### Explicit formulas for the wild Hilbert symbol: the two branches

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For K=Q_p(ζ_p), p odd, and principal units ε,η, Kummer’s formula is (ε,η)_p = ζ_p^{res(log η(X) d log ε(X) X^(−p))}, with ε(X),η(X) in Z_p[[X]]× specializing at X=ζ_p−1 to ε,η. The residue appears as an exponent, interpreted in the source’s mod-p normalization; it is not itself a value in the roots-of-unity target. The precise integrality and lift-independence proof remains to be extracted. Shafarevich’s complete formula on the same page assumes K⊃Q_p(ζ_{p^n}) and p≠2 and uses a special principal-unit basis. Vostokov’s higher formulas and their characteristic-profile restrictions require the unread body of §8; this node is an inventory of obligations, not a uniform formula for all higher fields.

**Hypotheses and conventions.**

- No single explicit formula applies to all mixed-characteristic higher local fields; the roadmap text says so and the source's section 8 is a survey of the different regimes.
- The formulas are for the wild part; the tame part is the previous node.
- Vostokov's formula is the one section 6.4.4 uses to define the pairing V_1 that the third case of the existence theorem needs.

**Proof outline.**

1. Record Kummer's formula and its hypotheses.
2. Record Shafarevich's complete formula and its difficulties.
3. Record Vostokov's formula in the form used in subsections 6.4.4 and 8.3 of the source, and its extension to higher local fields.
4. Record which formula applies in which characteristic profile, and that the choice is by characteristic profile and not uniform.

**Acceptance.**

- The existence theorem in the characteristic-zero wild case produces the norm subgroup as the orthogonal complement of an element for Vostokov's pairing V_1, citing the theorems of section 8.3.
- Kurihara's exponential map of section 9 relates differential forms and the Milnor K-groups and gives an application to explicit formulas.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`
- `mathlib:PowerSeries`
- `mathlib:WittVector`
- `K2SymbolsBrauer:T.7/symbol-formula`
- `K2SymbolsBrauer:T.3:symbols`
- `KTheoryFiniteLocalFields:L.3`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`

**Sources.**

- inv, Part I, section 8, subsection 8.1.1, Theorem (Kummer 1858), printed p. 81. “The important point is that one associates to the elements” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 8, subsection 8.1.1, Theorem (Shafarevich 1950), printed p. 81. “using a special basis of the group of principal units.” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

Planet: **Explicit reciprocity formulas**.

### Vostokov's pairing and the wild case of the existence theorem

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Vostokov's explicit formula defines a pairing V_1 on the topological Milnor K-groups of a higher local field of characteristic zero whose residue characteristic is p, and it is of importance both for the study of the topological Milnor K-groups of section 6 and for the existence theorem of section 10.5. In the third case of the existence theorem, where the characteristic is zero and the index is p, one produces an element alpha of the multiplicative group such that the given subgroup is the orthogonal complement of alpha for V_1; if the field does not contain a primitive p-th root of unity one passes to the extension obtained by adjoining one and comes back, using that the degree of that extension is prime to p.

**Hypotheses and conventions.**

- The passage to the extension containing the roots of unity and back is legitimate only because the degree is prime to p; that is a hypothesis and not a formality.
- The pairing V_1 is defined by an explicit formula and its nondegeneracy is the theorem of section 8.3 that the existence theorem cites.

**Proof outline.**

1. Record the definition of the pairing V_1 from Vostokov's formula.
2. Record its nondegeneracy, which is the theorem of subsection 8.3.
3. Carry out the third case of the existence theorem: produce alpha, identify the orthogonal complement with the given subgroup, and construct the cyclic extension by Kummer theory.
4. Record the descent along the extension adjoining a primitive p-th root of unity.

**Acceptance.**

- This is the case of the existence theorem which cannot be handled by the tame symbol or by the Artin-Schreier-Witt pairing, and it is the only place in the proof where an explicit formula is needed.
- The source records that Vostokov's formula is of importance for the study of topological Milnor K-groups in section 6 as well.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`
- `mathlib:PowerSeries`
- `K2SymbolsBrauer:T.3:symbols`
- `KTheoryFiniteLocalFields:L.3`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`

**Sources.**

- inv, Part I, section 10, subsection 10.5, Existence Theorem proof, printed p. 100. “defined in 6.4.4 (see the theorems in 8.3).” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Introduction, printed p. v. “Vostokov's explicit formula” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

### Ramification filtrations in a fixed indexing convention

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`. Kind: definition. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Import ordinary lower and upper ramification groups and their Herbrand convention at n=1 from LocalFieldsRamification Layer 3. In higher dimension, especially with imperfect residue field, select and extract the appropriate higher ramification theory before defining a filtration or claiming quotient compatibility. Zhukov §17, under its p-basis restrictions, is a source lead; the ordinary Herbrand transform is not asserted to provide the required higher-dimensional filtration automatically. The exact comparison with Milnor K-filtrations, indexing shifts and arithmetic reciprocity remains open.

**Hypotheses and conventions.**

- The indexing convention has to be fixed once and used everywhere: the roadmap text asks for a fixed indexing convention and the relation to the filtration on the Milnor K-groups is stated in that convention.
- Zhukov's theory has non-integer breaks, so it is not a reindexing of the classical one; it is recorded as a separately sourced extension.

**Proof outline.**

1. Import the ordinary filtration and its normalization.
2. Read the chosen higher theory with all p-basis and characteristic hypotheses.
3. State a named n=1 comparison and only then the exact higher reciprocity/filtration comparison.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `HigherLocalField.ramificationGroup` | data | The lower-numbering ramification groups of a finite Galois extension of higher local fields. |
| `HigherLocalField.ramificationGroup_upper` | data | The upper numbering, defined by the Herbrand transform. |
| `HigherLocalField.herbrand` | constructor | The Herbrand transform relating the two numberings. |
| `HigherLocalField.ramification_quotient` | compatibility | The upper numbering is compatible with quotients, the lower with subgroups. |
| `HigherLocalField.ramification_vs_K_filtration` | relation | The reciprocity map carries the filtration on the Milnor K-groups into the upper-numbering filtration, in the fixed indexing convention. |
| `HigherLocalField.ramification_one_dimensional` | compatibility | For n = 1 the filtrations and the correspondence are the classical ones. |

**Unit-test specifications.**

- `one_dimensional` (characterisation): For n = 1 the definitions agree with the classical ramification filtration and with Tau Ceti's unit filtration (the degenerate case).
- `tame_extension` (characterisation): For a tamely ramified extension the ramification groups vanish from the first step on.
- `non_integer_breaks` (characterisation): In Zhukov's theory a cyclic extension of degree p may have a non-integer break, so the classical indexing cannot be assumed in that generality (the required non-example).
- `herbrand` (characterisation): The Herbrand transform converts the lower into the upper numbering and is compatible with quotients; a convention for which it is not is wrong.

**Uses.**

- Part I section 5.2: The index computation in the wildly ramified case of the isomorphism theorem is organised by the filtration on the K-groups, which is the K-side of this correspondence.
- Part I sections 12, 13 and 15: The quotient filtration on the Milnor K-groups is computed there in terms of differential forms of the residue field, which is the refinement of this correspondence.
- HL.6: The tame and wild variants of the higher global reciprocity theorems are distinguished by exactly this filtration.

**Acceptance.**

- At n=1 the upper numbering is the ordinary quotient-compatible numbering. No n>1 formula is justified by that check alone.

**Prerequisites.**

- `tauceti:TauCeti.Place.ramificationGroup`
- `tauceti:TauCeti.unitFiltration`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`
- `K2SymbolsBrauer:T.3:symbols`
- `KTheoryFiniteLocalFields:L.3`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`

**Sources.**

- inv, Introduction, printed p. vi. “New lower and upper filtrations are defined” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Part I, section 1, subsection 1.1, printed p. 7. “Epp's theorem on elimination of wild ramification” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

### Kurihara exponential maps, differential forms and the two types of field

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For a complete discrete valuation field of characteristic zero there is an exponential homomorphism relating the differential forms of the field and its Milnor K-groups, which gives additional information on the structure of the latter and has an application to explicit formulas. There is also a classification of complete discrete valuation fields of characteristic zero with residue field of characteristic p into two types, according to the behaviour of the torsion part of a differential module; for each type, the quotient filtration on the Milnor K-groups is characterised, for all sufficiently large members of the filtration, as a quotient of differential modules. For a higher local field this, together with higher local class field theory, implies restrictions on the types of cyclic extension of sufficiently large degree.

**Hypotheses and conventions.**

- The classification is into two types and the characterisation of the quotient filtration holds only for sufficiently large members; both restrictions are part of the statement.
- The consequence for cyclic extensions is a restriction on the possible types and not a classification of them.

**Proof outline.**

1. Construct Kurihara's exponential homomorphism from the differential forms to the Milnor K-groups of a complete discrete valuation field of characteristic zero.
2. Record the classification into two types by the torsion of the differential module.
3. Record the characterisation of the quotient filtration for large members in each type.
4. Record the resulting restriction on cyclic extensions of large degree of a higher local field.

**Acceptance.**

- The application to explicit formulas is in subsection 9.2 of the source and is one of the routes to the formulas of the previous nodes.
- Nakamura's section 15 lists all known results on the quotient filtration in terms of differential forms of the residue field, including the tamely ramified characteristic-zero case treated by the exponential map and a syntomic complex.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`
- `CrystallineCohomology:CR.4`
- `K2SymbolsBrauer:T.3:symbols`
- `KTheoryFiniteLocalFields:L.3`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`

**Sources.**

- inv, Introduction, printed p. v. “introduces his exponential homomorphism” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Introduction, printed p. vi. “depending on the behaviour of the torsion part of a differential module.” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

### The acceptance computations: a tame K_2 symbol and an Artin-Schreier-Witt example

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`. Kind: application. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Two computations are recorded over F = F_q((u))((t)). First, the tame K_2 symbol: for a and b in F^times the symbol {a, b} has tame image given by the iterated residue of HL.1, and its comparison with the abstract reciprocity map of HL.3 is the identity, with the sign fixed by the order of the parameters. Second, an Artin-Schreier-Witt example: for w a Witt vector over F of length one, that is an element of F, and a symbol x in K^top_2(F), the pairing (x, w] of subsection 6.4.3 computes the image of x under the reciprocity map applied to the character of the Artin-Schreier extension defined by w, and evaluating it on the explicit generators of VK^top_2(F) recovers Parshin's expansion. Every residue, sign and trace convention used in the two computations is fixed and tested.

**Hypotheses and conventions.**

- The point of the acceptance is that every convention is tested: the order of the parameters, the sign of the residue, the normalisation of the trace in the Witt-vector pairing and the Frobenius convention of the reciprocity map.
- The two computations cover the prime-to-p and the p parts of the pairing and neither proves the other.

**Proof outline.**

1. Fix the conventions: the order of the parameters, the sign of the iterated residue, the normalisation of the Artin-Schreier-Witt pairing and the Frobenius convention.
2. Compute the tame K_2 symbol and compare with the abstract reciprocity map.
3. Compute the Artin-Schreier-Witt pairing on the explicit generators of the principal-unit part.
4. Check that the p-primary pairing annihilates prime-to-p torsion. There is no shared nontrivial prime-primary regime in which the tame and Artin–Schreier–Witt formulas can be identified.

**Acceptance.**

- Parshin’s expansion is generally a convergent infinite series. A finite computation requires a stated continuity or truncation bound for the chosen character; the expansion alone does not provide that bound.
- The first computation is the acceptance case of HL.1 read through the reciprocity map.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/acceptance-computation-of-an-iterated-residue`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`
- `K2SymbolsBrauer:T.3:symbols`
- `KTheoryFiniteLocalFields:L.3`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`

**Sources.**

- inv, Part I, section 7, subsection 7.2, printed p. 76. “Using the Artin-Schreier-Witt pairing” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.
- inv, Part I, section 7, subsection 7.1, printed p. 75. “apply the tame symbol and valuation map of subsection 6.4” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

## HL.5

Coverage: **partial**. Source obligations are retained under accepted RS-28; this stage is not closed.

- Only the first two printed pages of Part II section 1 were read. The restricted-product condition is recorded as part of the definition and the source's own formulation is cited, but the comparison of Parshin's, Beilinson's and Huber's formulations is not carried out.
- Osipov's adelic constructions for direct images, Part II section 2, were not read; the functoriality node records the direct images by their role only.
- The original Parshin and Beilinson sources with their exact regularity and properness assumptions, which the roadmap text asks be acquired, were not obtained.
- Singular schemes are kept in a separately sourced extension, as the roadmap text asks; the multi-branch phenomenon is recorded and not developed.
- The inherited bundled declarations and typed-interface frontier remain open; see the named gaps.

### Flags of subschemes and the higher local field attached to one

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`. Kind: construction. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Let X be a scheme of dimension n and let X_0 inside X_1 inside ... inside X_{n-1} inside X_n = X be a flag of irreducible subschemes with dim X_i = i. One attaches to the flag a ring K_{X_0, ..., X_{n-1}} by successive completion and localisation; when everything is regularly embedded the ring is an n-dimensional local field. For a projective surface X over a field k, a closed point P and an irreducible curve C through P, the construction is explicit: complete the local ring of X at P, localise at the ideal of C, complete again, and take the fraction field; when X and C are smooth at P the result is k(P)((u))((t)) with t a local equation of C at P and u a function restricting to a local parameter of C at P. The left-hand construction is meaningful without any smoothness condition, and the completed local ring along a flag can have several branches, in which case the result is a product of fields and not a field.

**Hypotheses and conventions.**

- The multi-branch phenomenon is real: the roadmap text says not to replace a product by one field without a proven normality or unibranch condition, and the source says the construction is meaningful without smoothness while the identification with a higher local field is not.
- Regular embedding of the flag is what makes the ring a field; without it the construction still produces a ring and the theory has to carry it.

**Proof outline.**

1. Define the ring attached to a flag by the alternating sequence of completions and localisations.
2. Prove that for a regularly embedded flag on a regular scheme the result is an n-dimensional local field, by induction on the length of the flag.
3. Carry out the surface case explicitly and identify the result with k(P)((u))((t)) under the smoothness hypothesis.
4. Record the general case: the completed local ring along a flag may have several branches and the construction then gives a finite product of higher local fields.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `Parshin.chain` | data | A flag of irreducible subschemes of a scheme of dimension n with the expected dimensions. |
| `Parshin.ring` | constructor | The ring attached to a flag by successive completion and localisation. |
| `Parshin.ring_isHigherLocalField` | characterisation | For a regularly embedded flag on a regular scheme the ring is an n-dimensional local field. |
| `Parshin.surfaceExample` | example | For a surface, a point P and a curve C smooth at P, the ring is k(P)((u))((t)). |
| `Parshin.ring_branches` | relation | In general the completed local ring along a flag may have several branches and the construction gives a finite product of fields. |
| `Parshin.ring_dimensionOne` | compatibility | In dimension one the construction is the completion at a closed point. |
| `Parshin.functorial` | functoriality | Functoriality of the construction in the scheme and in refinements of the flag. |

**Unit-test specifications.**

- `surface_smooth` (characterisation): For a smooth point on a smooth curve on a surface over a finite field the ring is k(P)((u))((t)), a two-dimensional local field.
- `dimension_one` (characterisation): For a curve the construction gives the completion at a closed point (the degenerate case).
- `multi_branch` (characterisation): For a nodal curve through a point the completed local ring along the flag has two branches and the construction gives a product of two fields, not a field (the required non-example).
- `regular_embedding_needed` (characterisation): Without regular embedding the ring need not be a field; a construction asserting that it always is is wrong.

**Uses.**

- Part II section 1, subsection 1.0.1: The higher adeles of X are the restricted product of these rings over all flags, so they must exist first.
- HL.6: The global reciprocity map of an arithmetic scheme is assembled from the local reciprocity maps of HL.3 applied to these fields.
- HL.4: The residue maps attached to a flag are the iterated residues of the attached higher local field.

**Acceptance.**

- The example of a projective surface is the acceptance case of the layer, and it is the one where the duality between points and curves, generalising the duality between points and lines in projective geometry, is visible.
- In dimension one the construction is the completion of the local ring at a closed point, that is the usual local field of a place.

**Prerequisites.**

- `mathlib:AlgebraicGeometry.Scheme`
- `mathlib:IsAdicComplete`
- `mathlib:IsDedekindDomain`
- `mathlib:LaurentSeries`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.5`
- `FunctionFieldArithmetic:FA.2`
- `K2SymbolsBrauer:T.2:symbols`
- `K2SymbolsBrauer:T.3:localization-comparison`
- `K2SymbolsBrauer:T.3:symbols`
- `K2SymbolsBrauer:T.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`

**Sources.**

- inv, Part II, section 1, subsection 1.0.1, printed p. 199. “In the case where everything is regularly embedded” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Part II, section 1, subsection 1.0.1, Example, printed pp. 199-200. “If X and C are smooth at P” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

Planet: **Parshin chain**.

### Higher adeles as a restricted product over flags

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`. Kind: construction. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For a scheme X of dimension n one forms the adelic object A_X as the restricted product over all flags of the rings attached to them, the restriction being a condition on the components in the sense of Parshin, Beilinson and Huber. The restricted-product condition is part of the definition and is not to be replaced by the unrestricted product. Mathlib has a general RestrictedProduct construction and the finite adeles of a Dedekind domain, which is the one-dimensional case; Tau Ceti has the repartition space of a function field. Nothing for higher dimensions exists in either library.

**Hypotheses and conventions.**

- The restricted-product condition is the content: the roadmap text asks that it be defined rather than taking the unrestricted product.
- The condition is stated in the literature in several ways, by Parshin, by Beilinson and by Huber; the packet records that they have to be compared and does not assert that they agree.

**Proof outline.**

1. Define the index set of flags and the local rings attached to them.
2. Define the restriction condition on the components, following one of the sources, and construct A_X as the corresponding restricted product.
3. Prove functoriality in X for the morphisms for which it holds.
4. Prove compatibility with the residue maps of the individual flags.
5. Record that the different formulations of the restriction condition require a comparison.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `Parshin.adeles` | data | The restricted product A_X over all flags of a scheme of dimension n. |
| `Parshin.adeles_restriction` | characterisation | The restriction condition on the components, stated explicitly. |
| `Parshin.adeles_functorial` | functoriality | Functoriality in the scheme for the morphisms for which it holds. |
| `Parshin.adeles_residue` | compatibility | Compatibility with the residue maps of the individual flags. |
| `Parshin.adeles_dimensionOne` | compatibility | In dimension one the construction is the ordinary adele ring. |
| `Parshin.subringPoint` | constructor | The subring K_P attached to a point, the minimal subring containing the function field and the completed local ring, which is not a field in general. |
| `Parshin.subringCurve` | constructor | The subring K_C attached to a curve, the fraction field of the local ring of the curve. |

**Unit-test specifications.**

- `curve` (characterisation): For a curve over a finite field the construction is the ordinary adele ring, matching FunctionFieldArithmetic:FA.2 and Tau Ceti's repartition space (the acceptance case).
- `surface_flags` (characterisation): For a regular surface the flags are the pairs (P, C) with P a closed point on an irreducible curve C, and the components are the K_{P,C}.
- `restricted_not_full` (characterisation): The unrestricted product over all flags is strictly larger and carries no useful topology; a construction that takes it is wrong (the required non-example).
- `subring_not_field` (characterisation): K_P is not a field in general, so the components of an adele are not all fields.

**Uses.**

- HL.6: The global reciprocity map is defined on an idelic or cycle-theoretic quotient of this object.
- Part II section 1, subsections 1.0.2 onwards: The higher analogue of Tate and Iwasawa's analytic L-function is an integral over this object, which is why the restricted product and not the full product is used.
- Part II section 2: Osipov's adelic constructions for direct images of differentials and symbols are constructions on this object.

**Acceptance.**

- Acceptance: for a curve over a finite field the construction recovers the ordinary adeles, which is FunctionFieldArithmetic:FA.2's object and Tau Ceti's repartition space.
- For a surface the construction gives Parshin's adelic ring, with its subrings K_P and K_C attached to a point and to a curve and the duality between them.

**Prerequisites.**

- `mathlib:RestrictedProduct`
- `mathlib:IsDedekindDomain.FiniteAdeleRing`
- `mathlib:NumberField.AdeleRing`
- `mathlib:AlgebraicGeometry.Scheme`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`
- `FunctionFieldArithmetic:FA.2`
- `SchemeAndStackFoundations:SF.5`
- `K2SymbolsBrauer:T.2:symbols`
- `K2SymbolsBrauer:T.3:localization-comparison`
- `K2SymbolsBrauer:T.3:symbols`
- `K2SymbolsBrauer:T.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`

**Sources.**

- inv, Part II, section 1, subsection 1.0.1, printed p. 199. “with respect to certain restrictions on components of adeles” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Part II, section 1, subsection 1.0.1, printed p. 200. “is not a field in general.” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

Planet: **Higher adeles**.

### Residue maps attached to a flag and their compatibilities

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For each flag on a regular scheme the iterated residue of HL.1, applied to the higher local field attached to the flag, gives a residue map from the Milnor K-groups of the field to the Milnor K-groups of the residue field of the closed point of the flag. These maps are compatible with the inclusions of the intermediate subrings K_P and K_C, with the functoriality of the adelic construction and with the boundary maps of the localisation sequences of the successive subschemes. Local residue compatibility is the condition that makes the sum of the residues over the flags through a fixed subscheme well defined and is the input to the reciprocity relations of HL.6.

**Hypotheses and conventions.**

- Compatibility is with the maps of the adelic construction and not only with the abstract residue maps of the individual fields.
- The sum of the residues over the flags through a fixed point is finite by the finite-support statement of K2SymbolsBrauer:T.3, which is what makes the reciprocity relations meaningful.

**Proof outline.**

1. Attach to each flag the iterated residue of the corresponding higher local field.
2. Prove the compatibility with the inclusions of the subrings K_P and K_C.
3. Prove finite support: for a fixed element only finitely many flags through a given subscheme give a nonzero residue.
4. Prove the compatibility with the boundary maps of the localisation sequences, which is the form in which the residues enter the cycle complexes of HL.6.

**Acceptance.**

- The finite-support statement is the higher analogue of the one-dimensional fact that a rational function has finitely many zeros and poles.
- The reciprocity relations of HL.6 are the vanishing of the sum of the residues over the flags through a point or along a curve.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`
- `K2SymbolsBrauer:T.3/finite-support`
- `K2SymbolsBrauer:T.3/localization-boundary`
- `K2SymbolsBrauer:T.4/weil-reciprocity`
- `FunctionFieldArithmetic:FA.2`
- `K2SymbolsBrauer:T.2:symbols`
- `K2SymbolsBrauer:T.3:localization-comparison`
- `K2SymbolsBrauer:T.3:symbols`
- `K2SymbolsBrauer:T.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`

**Sources.**

- inv, Part II, section 1, subsection 1.0.1, printed p. 200. “We can compare the structure of adelic components in dimension one and two” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Part I, section 1, subsection 1.1, printed p. 5. “such that both S and C are regular at x.” Literal short anchor on a freshly read page; formula notation is transcribed in the mathematical statement rather than quoted here. The retained obligation still needs declaration splitting, exact supplier signatures and proof extraction as recorded in coverage and gaps.

### The higher idelic and cycle-complex input for global reciprocity

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`. Kind: construction. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

The higher idelic object requires precise branchwise restricted conditions on local Milnor groups and a specified global relation subgroup. Separately, a Milnor residue complex has terms in Milnor K-theory; the cohomological Kato complex of HL.6 has terms in Galois or logarithmic cohomology. These are not identical by definition. Their differentials require finite-support and codimension-two reciprocity theorems, including branch norms, before the square-zero property can be asserted. The necessary coefficient and degree comparisons remain gaps.

**Hypotheses and conventions.**

- The two inputs are different objects and the comparison between them is a theorem, not a definition.
- The vanishing of the square of the boundary is a statement about signs and is exactly where the sign convention of the iterated residue matters.

**Proof outline.**

1. Extract the higher idelic restriction conditions and relation subgroup from the chosen global source.
2. Specify Milnor and cohomological complex terms separately, with degree conventions.
3. Import or prove the branchwise codimension-two reciprocity identity and compare the two complexes only through a precisely stated coefficient theorem.

**API.**

| Name | Role | Mathematical statement |
| --- | --- | --- |
| `Parshin.ideles` | data | The restricted product of the topological Milnor K-groups over the flags. |
| `Parshin.milnorResidueComplex` | data | The Milnor residue complex in a fixed degree range, after the branchwise square-zero theorem. It is distinct from the cohomological Kato complex. |
| `Parshin.milnorResidueComplex_d_squared` | characterisation | The differential squares to zero by the sourced codimension-two reciprocity identity with all branch norms; a local sign check alone is insufficient. |
| `Parshin.milnorResidueComplex_dimensionOne` | compatibility | For a regular integral curve in Milnor degree one, the boundary from K_1^M of the function field to the sum of K_0^M of the closed-point residue fields is the divisor map, after identifying these groups with units and Z respectively. This is not an identification of the cohomological Kato complex. |
| `Parshin.ideles_dimensionOne` | compatibility | For a smooth proper curve over a finite field the dimension-one construction agrees with the ordinary function-field idele group; number rings require an explicit finite/infinite-place convention. |
| `Parshin.ideles_vs_complex` | relation | The comparison between the idelic and the cycle-theoretic inputs, stated as a theorem to be proved. |

**Unit-test specifications.**

- `curve` (characterisation): In Milnor degree one on a regular integral curve, a rational function is sent to the sum of its normalized orders at the closed points. The cohomological Kato complex remains a distinct object.
- `d_squared` (characterisation): The sum of branch-normed successive residues in each codimension-two interval vanishes under the chosen source hypotheses. Both branch multiplicities and residue signs are tested.
- `surface` (characterisation): For a regular surface the complex has three terms, indexed by the surface, its curves and its closed points.
- `restricted` (characterisation): The idelic object is a restricted and not a full product, matching the adelic construction.

**Uses.**

- HL.6: The global reciprocity map is defined on the idelic object, and the cohomological Hasse principles are statements about Kato's complex.
- Part II section 2: Osipov's adelic constructions for direct images of symbols are maps between these objects for a morphism of schemes.
- HL.4: The sign convention of the iterated residue is what makes the boundary square to zero.

**Acceptance.**

- A sign convention for one local residue alone does not imply the global differential squares to zero.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`
- `K2SymbolsBrauer:T.4/weil-reciprocity`
- `SchemeAndStackFoundations:SF.5`
- `FunctionFieldArithmetic:FA.2`
- `K2SymbolsBrauer:T.2:symbols`
- `K2SymbolsBrauer:T.3:localization-comparison`
- `K2SymbolsBrauer:T.3:symbols`
- `K2SymbolsBrauer:T.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`

**Sources.**

- inv, Part II, section 1, subsection 1.0.1, printed p. 199. “with respect to certain restrictions on components of adeles” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Introduction, printed p. iii. “to work with the Milnor K-groups instead of the multiplicative group” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

### Functoriality of the adelic construction and direct images of symbols

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

The adelic construction is functorial for the morphisms of schemes for which the flags can be transported, and for a proper morphism there are direct images of differentials and of symbols, constructed adelically. The direct image of symbols is compatible with the residue maps and with the norms of the local fields, which is the statement that makes the reciprocity relations of HL.6 functorial. The general case requires regularity and properness hypotheses that have to be stated exactly, and the roadmap text asks that the source route acquire the original Parshin and Beilinson references with those hypotheses.

**Hypotheses and conventions.**

- Functoriality is not automatic: a morphism does not in general carry a flag to a flag, and the hypotheses under which it does are part of the statement.
- The direct images are constructed adelically and their agreement with the geometric ones is a theorem.

**Proof outline.**

1. State the class of morphisms for which flags transport and construct the induced map of adelic objects.
2. Construct the direct images of differentials and of symbols for a proper morphism, following Osipov's adelic construction.
3. Prove the compatibility with the residue maps and with the local norms.
4. Record the regularity and properness hypotheses exactly, and record that the original sources have to be read for them.

**Acceptance.**

- For a curve the direct image of symbols along a finite morphism is the norm map, and the compatibility with residues is the classical one.
- The direct images are what make the reciprocity relations of HL.6 compatible with morphisms of arithmetic schemes.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`
- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`
- `SchemeAndStackFoundations:SF.5`
- `SchemeAndStackFoundations:SF.0`
- `FunctionFieldArithmetic:FA.2`
- `K2SymbolsBrauer:T.2:symbols`
- `K2SymbolsBrauer:T.3:localization-comparison`
- `K2SymbolsBrauer:T.3:symbols`
- `K2SymbolsBrauer:T.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`

**Sources.**

- inv, Contents, Part II, printed p. xi. “Adelic constructions for direct images of differentials and symbols” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Part II, section 1, subsection 1.0.1, printed p. 199. “a flag of irreducible subschemes” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

### The acceptance cases: ordinary ideles for a curve and the flags of a regular surface

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`. Kind: application. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Two acceptance cases are recorded. First, for X a smooth projective curve over a finite field the flags are the pairs consisting of a closed point and the curve itself, the attached rings are the completions of the local rings at the closed points, and the restricted product recovers the ordinary adeles and ideles of the function field; this is FunctionFieldArithmetic:FA.2's object and Tau Ceti's repartition space. Second, for X a regular projective surface over a finite field the flags are the pairs (P, C) with P a closed point lying on an irreducible curve C, the attached ring is K_{P,C}, which is k(P)((u))((t)) when X and C are regular at P, and the residue maps are the two-step iterated residues; the intermediate subrings K_P and K_C and the duality between points and curves are part of the picture.

**Hypotheses and conventions.**

- The surface case is the first genuinely higher-dimensional one and is the one in which the multi-branch phenomenon can occur if C is singular at P.
- The curve case is what the acceptance asks the construction to recover, and it is the check that the restricted-product condition is the right one.

**Proof outline.**

1. Instantiate the flag construction for a curve and identify the result with the ordinary adeles.
2. Instantiate it for a regular surface, list the flags and the attached fields, and compute the residue maps.
3. Record the intermediate subrings and the point-curve duality.
4. Record what changes when C is singular at P.

**Acceptance.**

- The example in subsection 1.0.1 of Part II section 1 is exactly the surface computation and is the source of the identification with k(P)((u))((t)).
- The duality between points and curves in dimension two generalises the duality between points and lines in projective geometry, which is the source's own way of describing it.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`
- `FunctionFieldArithmetic:FA.2`
- `K2SymbolsBrauer:T.2:symbols`
- `K2SymbolsBrauer:T.3:localization-comparison`
- `K2SymbolsBrauer:T.3:symbols`
- `K2SymbolsBrauer:T.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`

**Sources.**

- inv, Part II, section 1, subsection 1.0.1, Example, printed pp. 199-200. “an algebraic projective irreducible surface over a field k” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Part II, section 1, subsection 1.0.2, printed p. 200. “In the one-dimensional case for every character” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

## HL.6

Coverage: **partial**. Source obligations are retained under accepted RS-28; this stage is not closed.

- Acquire the chosen higher-global primary theorem and state each kernel/completion/cokernel result with its actual hypotheses.
- Build the cohomological Kato complex with branchwise codimension-two reciprocity and coefficient-specific square-zero proof.
- Import the distinct number-field and finite-field-curve global suppliers. Specify the archimedean and unramified quotients for a number ring.
- Exact Hasse principles and the native scheme/fundamental-group signatures remain open.

### The reciprocity map of an arithmetic scheme and the comparison with the abelian fundamental group

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For a regular arithmetic scheme X of dimension n, assembling the local reciprocity maps of HL.3 along the flags gives a reciprocity map from the higher idelic object of HL.5, or from the appropriate cycle-theoretic quotient, to the abelianized etale fundamental group of X. The theorem to be proved is that this map has the expected kernel and cokernel and identifies a suitable quotient with the abelianized fundamental group, in the proper case, or with its tame or wild variants in the open case. Proper and open, and tame and wild, are different theorems and are to be stated separately. Neither library has an etale fundamental group of an arithmetic scheme and none of this exists in either.

**Hypotheses and conventions.**

- The proper and the open case are different theorems with different targets, and so are the tame and the wild variants; the roadmap text asks that they be added as different theorems.
- Every asserted kernel or exactness theorem must specify the dimension, the base, the regularity hypothesis and the coefficient primes; the roadmap text says so and this packet records it as the acceptance condition rather than asserting a general statement.
- The source volume is a local source: its introduction points to W. Raskind's review of abelian class field theory of arithmetic schemes for the global aspects, and does not prove them.

**Proof outline.**

1. Assemble the local reciprocity maps along the flags into a map from the idelic object.
2. Prove that the assembled map kills the global subgroup, which is the reciprocity relation of the next node.
3. Construct the comparison with the abelianized etale fundamental group and state the kernel and cokernel in the proper case.
4. State the open, tame and wild variants separately, with their hypotheses.

**Acceptance.**

- For a curve over a finite field the statement is global class field theory for the function field, which is FunctionFieldArithmetic:FA.4's and which the audit names as the duplicate.
- For a number ring the statement is global Artin reciprocity, which is Tau Ceti's ClassFieldTheory layer 11 and which the audit names as the other duplicate.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`
- `mathlib:CategoryTheory.GaloisCategory`
- `SchemeAndStackFoundations:SF.2`
- `FunctionFieldArithmetic:FA.4`
- `FunctionFieldArithmetic:FA.2`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`

**Sources.**

- inv, Introduction, printed p. iii. “review on abelian class field theory of arithmetic schemes.” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Introduction, printed p. iii. “some blending of class field theories for local fields.” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

Planet: **Global reciprocity for arithmetic schemes**.

### The reciprocity relations along a point and along a curve

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

The relations that make the assembled map well defined are the vanishing of the sums of the local contributions along the two kinds of subscheme of codimension one in the flag poset: for a fixed closed point P, the sum over the curves C through P of the local invariants at (P, C) vanishes; and for a fixed irreducible curve C, the sum over the closed points P of C of the local invariants at (P, C) vanishes. Each sum is finite by the finite-support statement, and each is the higher analogue of the classical reciprocity law: the second, along a curve, is Weil reciprocity on that curve, and the first is its dual.

**Hypotheses and conventions.**

- Both relations are needed and they are not equivalent; the duality between points and curves in dimension two exchanges them.
- Finiteness of the sums is the finite-support statement of the residue maps and is part of what has to be proved.

**Proof outline.**

1. State the two relations for a regular surface and their analogues in higher dimension, one for each subscheme of codimension one in the flag poset.
2. Prove finiteness of the sums from the finite-support statement.
3. Prove the relation along a curve from Weil reciprocity on that curve, which is K2SymbolsBrauer:T.4's.
4. Prove the relation along a point, and record which of the two needs a properness hypothesis.

**Acceptance.**

- For a curve over a finite field the single relation is Weil reciprocity together with the product formula, which is the classical input to global class field theory.
- The relations are the statement that the assembled map kills the image of the global Milnor K-group.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`
- `K2SymbolsBrauer:T.4/weil-reciprocity`
- `K2SymbolsBrauer:T.3/finite-support`
- `FunctionFieldArithmetic:FA.2`
- `FunctionFieldArithmetic:FA.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`

**Sources.**

- inv, Part II, section 1, subsection 1.0.1, printed p. 200. “a duality between points P and curves C” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Introduction, printed p. iii. “it describes abelian extensions of number fields” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

### Kato complexes and the vanishing of the square of the boundary

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Kato's complex of an arithmetic scheme has in degree i the direct sum, over the points x of X of dimension i, of H^{i+1}(k(x), Z/m(i)) for a coefficient modulus m, with differentials given by the residue maps of HL.5. The first thing to prove is that the boundary squares to zero, which requires a codimension-two reciprocity theorem, finite support, branch norms and compatible residue signs, not merely a sign convention. Only then can the cohomological Hasse principles, which are statements about the exactness or the vanishing of the cohomology of this complex in specified degrees, be attempted; the roadmap text asks that the complex and the boundary-square-zero statement come first and that the Hasse principles be sourced.

**Hypotheses and conventions.**

- The vanishing of the square of the boundary is not a formality: it is where the sign conventions of HL.1 are tested.
- The cohomological Hasse principles are not proved here and are not assumed: general local-global exactness for arbitrary arithmetic schemes is not assumed, and resolution or alteration and wild-prime restrictions are genuine prerequisites.
- The coefficients are the Kato cohomology groups of HL.2, so the complex exists in both characteristic regimes.
- The coefficient modulus must be treated prime by prime: ordinary Galois twists at invertible primes and the selected logarithmic coefficients at residue-characteristic primes. The precise source and base-scheme hypotheses remain open.

**Proof outline.**

1. Define the complex with the Kato cohomology groups of the residue fields as terms and the residue maps as differentials.
2. Prove that the boundary squares to zero by the two-flag computation and the sign rule of HL.1.
3. State the cohomological Hasse principles as separate theorems, each with its dimension, base, regularity and coefficient hypotheses, and record that their proofs need a primary source that this packet does not have.
4. Record the restrictions: resolution or alteration, and the wild primes.

**Acceptance.**

- For a curve over a finite field the complex is the one whose exactness is the Brauer-group sequence, and the Hasse principle is the classical one.
- The complex is the cycle-theoretic input of HL.5 with Kato coefficients rather than Milnor K-groups.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`
- `SchemeAndStackFoundations:SF.2`
- `MotivicEtaleKTheory:M.5d`
- `FunctionFieldArithmetic:FA.2`
- `FunctionFieldArithmetic:FA.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`

**Sources.**

- inv, Introduction, printed p. iii. “to work with the Milnor K-groups instead of the multiplicative group” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Part II, section 1, subsection 1.0.1, printed p. 199. “a flag of irreducible subschemes” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

Planet: **Kato complexes**.

### The tame and wild, proper and open variants as separate theorems

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`. Kind: theorem. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

Choose separate proper and open global reciprocity theorems with their exact regularity, base and coefficient hypotheses. For an open scheme, distinguish covers of the open scheme, those extending unramified across a chosen boundary, and those only tamely ramified along it. These are different quotients of fundamental groups. Likewise, tame ramification is not identified with the entire prime-to-p quotient without a theorem. No general quotient-isomorphism, kernel or cokernel theorem is asserted until its primary source has been acquired.

**Hypotheses and conventions.**

- The roadmap text asks that these be added as different theorems, and that every asserted kernel or exactness statement specify dimension, base, regularity and coefficient primes.
- Resolution of singularities or de Jong alterations, and restrictions on the wild primes, are genuine prerequisites of the known proofs, and this packet records them as hypotheses rather than as background.

**Proof outline.**

1. Acquire a primary higher-global theorem for each selected regime.
2. Define the exact ramification conditions along the boundary and the resulting target quotient.
3. Extract the kernel/completion/cokernel statement with its hypotheses; the inherited blanket identifications are withdrawn.

**Acceptance.**

- Unramified across the boundary is stricter than merely étale on the open scheme.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`
- `SchemeAndStackFoundations:SF.2`
- `mathlib:CategoryTheory.GaloisCategory`
- `FunctionFieldArithmetic:FA.2`
- `FunctionFieldArithmetic:FA.4`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`

**Sources.**

- inv, Introduction, printed p. iii. “review on abelian class field theory of arithmetic schemes.” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Introduction, printed p. vi. “abelian totally ramified p-extensions” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

### The curve case reduces to one-dimensional global class field theory

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`. Kind: application. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

For a smooth proper curve over a finite field, compare the higher idelic construction in dimension one with FunctionFieldArithmetic FA.2 and the assembled map with FA.4 global reciprocity. A cohomological Kato complex is not the divisor sequence by definition; its coefficient/degree comparison must be proved separately. For a number ring, compare with the ClassFieldTheory number-field Artin map only after specifying the finite-place and archimedean conditions and the quotient classifying covers unramified over that ring. The full number-field idele class group is not identified with the class group or the abelian fundamental group of Spec O_K.

**Hypotheses and conventions.**

- The acceptance of the layer asks exactly this: show how the curve case reduces to the existing global class-field-theory owner.
- Global class field theory itself is absent from both libraries, as the audit records, so the reduction is to a requested object and not to an existing one.

**Proof outline.**

1. Use the existing dimension-one carrier comparisons for the finite-field curve.
2. Prove equality of the two reciprocity maps with arithmetic Frobenius normalization.
3. For a number ring, state and prove the precise quotient and archimedean comparison before transporting the number-field theorem.

**Acceptance.**

- The finite-field curve and number-field branches have distinct suppliers.
- No identification of the cohomological Kato complex with a divisor complex is assumed.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`
- `FunctionFieldArithmetic:FA.4`
- `FunctionFieldArithmetic:FA.2`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`

**Sources.**

- inv, Introduction, printed p. iv. “higher local class field theory contains the classical local class field theory as its one-dimensional version.” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.
- inv, Introduction, printed p. iii. “a blending of higher dimensional local class field theories” Literal short anchor for the source role and example inventory. This overview does not prove the entire retained obligation; the complete definitions, hypotheses and proof dependencies indicated in coverage and gaps remain to be extracted.

## HL.7

Coverage: **partial**. The proposal to delete HL.7 is withdrawn. Its mathematical comparison work remains in scope.

- Accepted RS-28 retains HL.7 as mathematics. Prove the named dimension-one equality of Artin maps and the exact maps to Brauer-obstruction, arithmetic-duality and motivic consumers.
- Reuse HL.0’s two-dimensional fields and HL.5’s surface flags. Their consumer comparisons need new theorems; do not reconstruct the examples.

### Dimension-one comparison of Artin maps

Identifier: `HigherLocalFieldsAndHigherClassFieldTheory:HL.7/dimension-one-artin-map-comparison`. Kind: comparison. Implementation status: unchecked.

**Open source obligation.** This retained item is outside the typed prototype frontier; its remaining proof extraction and declaration splitting are gaps.

After the higher reciprocity map is constructed, prove that at n=1 its composite with the canonical K_1^M(K)≃K* identification equals the existing ClassFieldTheory absolute local Artin map, with arithmetic Frobenius normalization, on each finite abelian restriction. Use the resulting equality for the actual consumer maps. Equality of maps is required, not only an isomorphism of their targets. The equal-characteristic p-primary existence and completion input remains owned by HL.3.

**Hypotheses and conventions.**

- K is an ordinary nonarchimedean local field with the chosen one-step tower.
- Use the same canonical absolute Galois carrier and arithmetic Frobenius convention in both maps.

**Proof outline.**

1. Import the existing ordinary map and its finite restrictions.
2. Evaluate the higher pairing at n=1 against each finite character and compare the local invariant with the ordinary Brauer invariant in its exact coefficient scope.
3. Use equality on every finite abelian quotient to identify the profinite-valued maps. The coefficient-specific proof leaves remain open.

**Acceptance.**

- A uniformizer maps to arithmetic Frobenius in the unramified quotient.
- A geometric-Frobenius normalization differs by inversion and must fail the unmodified comparison.

**Prerequisites.**

- `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`

**Unresolved upstream stage edges (real mathematical prerequisites).**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`

**Sources.**

- inv, Kurihara §5.0 pp. 53–54 and §5.2 pp. 56–57. “which we call the reciprocity map” The higher construction is compared against the ordinary construction; the equality and coefficient-scope proof are obligations, not new ordinary reciprocity definitions.

## Imported native declarations

- `mathlib:AlgebraicGeometry.Scheme` (Mathlib/AlgebraicGeometry/Scheme.lean): Schemes, on which the flags of a Parshin chain are taken. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:CategoryTheory.GaloisCategory` (Mathlib/CategoryTheory/Galois/Basic.lean): An abstract pre-Galois category admitting a fiber functor to finite sets; not the arithmetic-scheme étale fundamental-group construction. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:IsAdicComplete` (Mathlib/RingTheory/AdicCompletion/Basic.lean): Adic completeness, used for the successive completions along a Parshin chain. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:IsDedekindDomain` (Mathlib/RingTheory/DedekindDomain/Basic.lean): Dedekind domains, the dimension-one case of the schemes carrying Parshin chains. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:IsDedekindDomain.FiniteAdeleRing` (Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean): The finite adeles of a Dedekind domain, which the audit records as the dimension-one case of the higher adeles. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:IsDiscreteValuationRing` (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean): Discrete valuation rings, one step of a residue tower. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:IsLocalRing` (Mathlib/RingTheory/LocalRing/Defs.lean): Local rings, the setting of the residue map. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:IsLocalRing.ResidueField` (Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean): The residue field of a local ring, the map that is iterated n times to form the tower. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean): The native valuative-topology, local compactness and nontrivial-valuation class. Compatibility with a chosen complete discrete valuation/residue tower is a theorem, not a definitional equality. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:LaurentSeries` (Mathlib/RingTheory/LaurentSeries.lean): Laurent series over a field, with their X-adic valuation, integers and residue field. The audit records that each step of the equal-characteristic example exists this way and that only the two-step tower is missing. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:NumberField.AdeleRing` (Mathlib/NumberTheory/NumberField/AdeleRing.lean): The adele ring of a number field, the other dimension-one case. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:Padic` (Mathlib/NumberTheory/Padics/PadicNumbers.lean): The p-adic numbers, the coefficient field of the mixed-characteristic two-dimensional example Q_p((t)). Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:PadicInt` (Mathlib/NumberTheory/Padics/PadicIntegers.lean): The p-adic integers. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:PerfectRing` (Mathlib/FieldTheory/Perfect.lean): Perfect rings, the condition on the last residue field in the variant of the theory over a perfect field. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:PowerSeries` (Mathlib/RingTheory/PowerSeries/Basic.lean): Power series, the ring of integers of a Laurent series field and the carrier of the explicit reciprocity formulas. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:ProfiniteGrp` (Mathlib/Topology/Algebra/Category/ProfiniteGrp/Basic.lean): Profinite groups, in which the absolute Galois group and the target of the reciprocity map live. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:RestrictedProduct` (Mathlib/Topology/Algebra/RestrictedProduct/Basic.lean): General restricted products, the construction out of which the higher adeles are built; the audit names it as the available half of that target. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:RingQuot` (Mathlib/Algebra/RingQuot.lean): Quotients of rings by relations, the construction by which the Steinberg ideal is divided out. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:TensorAlgebra` (Mathlib/LinearAlgebra/TensorAlgebra/Basic.lean): Tensor algebras, in which Milnor K-theory is defined as a quotient; the definition itself is imported from K2SymbolsBrauer. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:UniformSpace.Completion` (Mathlib/Topology/UniformSpace/Completion.lean): Completions of uniform spaces, used for the higher topology and for the completions of the chain. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:Valuation` (Mathlib/RingTheory/Valuation/Basic.lean): Valuations on a ring, in which the rank-n valuation of a higher local field is built. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:ValuationSubring` (Mathlib/RingTheory/Valuation/ValuationSubring.lean): Valuation subrings, the one-step analogue of the ring O_K of a higher local field. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:Valued` (Mathlib/Topology/Algebra/Valued/ValuationTopology.lean): Valued fields with their valuation topology, the carrier of each single step of a residue tower. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:Valued.integer` (Mathlib/Topology/Algebra/Valued/ValuedField.lean): The ring of integers of a valued field. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:WittVector` (Mathlib/RingTheory/WittVector/Defs.lean): Witt vectors, the coefficients of Kato's cohomology groups in characteristic p and of Artin-Schreier-Witt theory. The audit records that Mathlib has Witt vectors and no de Rham-Witt complexes. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:WittVector.frobenius` (Mathlib/RingTheory/WittVector/Frobenius.lean): The Frobenius on Witt vectors, which appears in the relation (F-1)(w) defining Kato's groups. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:groupCohomology` (Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean): Group cohomology, the nearest pinned notion to the continuous Galois cohomology in which Kato's groups and the duality are stated. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `tauceti:TauCeti.ContinuousCohomology.cochainsMap_zero` (TauCeti/RepresentationTheory/Homological/ContCohomology/Additive.lean): The map of continuous cochain complexes induced by the zero coefficient morphism is zero. This declaration does not by itself supply twists, all-degree duality or cohomological dimension. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `tauceti:TauCeti.Place.ramificationGroup` (TauCeti/FieldTheory/FunctionField/Place/Extension/RamificationGroup.lean): Lower-numbering ramification groups for the places of a function field. The audit records that Tau Ceti has these and no upper numbering and no Milnor K filtrations. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `tauceti:TauCeti.unitFiltration` (TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean): The unit filtration of a local field, which is the K_1 filtration at n = 1 and the one-dimensional case of the filtration on the Milnor K-groups. Statement read at the pinned commit on 2026-09-27; source bytes verified against the pinned tree.
- `mathlib:LaurentSeries.valued` (Mathlib/RingTheory/LaurentSeries.lean): Native outer T-adic valued structure, not the higher topology. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:LaurentSeries.valuation_le_iff_coeff_lt_eq_zero` (Mathlib/RingTheory/LaurentSeries.lean): v(f)≤exp(−D) iff f_i=0 for i<D; fixes the valuation/order sign. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:LaurentSeries.instLaurentSeriesComplete` (Mathlib/RingTheory/LaurentSeries.lean): Completeness for the native outer topology only. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:HahnSeries.coeff_add` (Mathlib/RingTheory/HahnSeries/Addition.lean): The coefficient of a sum is the sum of coefficients. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:HahnSeries.coeff_neg` (Mathlib/RingTheory/HahnSeries/Addition.lean): The coefficient of a negative is the negative coefficient. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:HahnSeries.coeff_zero` (Mathlib/RingTheory/HahnSeries/Basic.lean): The zero series has zero coefficients. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:HahnSeries.single` (Mathlib/RingTheory/HahnSeries/Basic.lean): The native Laurent/Hahn monomial supported at one exponent. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:HahnSeries.coeff_single` (Mathlib/RingTheory/HahnSeries/Basic.lean): A monomial has the specified coefficient at its exponent and zero elsewhere. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:HahnSeries.coeff_injective` (Mathlib/RingTheory/HahnSeries/Basic.lean): All coefficients determine a Hahn series. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:OpenAddSubgroup` (Mathlib/Topology/Algebra/OpenSubgroup.lean): An additive subgroup with an open carrier. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:NonarchimedeanAddGroup` (Mathlib/Topology/Algebra/Nonarchimedean/Basic.lean): Every zero-neighborhood contains an open additive subgroup; extends the topological additive-group class. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:AddGroupFilterBasis` (Mathlib/Topology/Algebra/FilterBasis.lean): An additive-group filter basis, with zero/addition/negation/translation-conjugation axioms. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:GroupFilterBasis.topology` (Mathlib/Topology/Algebra/FilterBasis.lean): The native group-basis topology, with the generated additive counterpart used here. The attached isTopologicalGroup instance and its additive counterpart were also read at lines 193–217; the declaration index omits the named instance, so this record cites the indexed construction rather than inventing an indexed name. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:GroupFilterBasis.nhds_one_hasBasis` (Mathlib/Topology/Algebra/FilterBasis.lean): The native basis theorem at the identity, including the generated zero-neighborhood version. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:OpenSubgroup.mem_nhds_one` (Mathlib/Topology/Algebra/OpenSubgroup.lean): Open subgroups are identity-neighborhoods, with the generated additive version. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:Valued.hasBasis_nhds_zero` (Mathlib/Topology/Algebra/Valued/ValuationTopology.lean): The native valued zero-neighborhood basis. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.
- `mathlib:discreteTopology_iff_isOpen_singleton_one` (Mathlib/Topology/Algebra/Group/Basic.lean): Discrete group topology iff the identity singleton is open, with the generated additive counterpart. Statement and additive annotation, where relevant, read at the pinned commit on 2026-09-27; source bytes verified.

## Supplier requests

### CrystallineCohomology:CR.4

Supply ordinary/relative de Rham–Witt complexes with Frobenius, Verschiebung and dlog. The field norm-residue/differential comparison is M.5d, and the higher local wild duality is HL.2.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`.

### FunctionFieldArithmetic:FA.2

The adeles and ideles of a curve over a finite field, built from the local completions. AUDIT-03 names FA.2 as building exactly the object that HL.5's acceptance asks the higher construction to recover in dimension one.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`.

### FunctionFieldArithmetic:FA.4

Global class field theory for a curve over a finite field: the global reciprocity map and the correspondence between abelian extensions and subgroups of the idele class group. AUDIT-03 names FA.4 as the curve case of HL.6, and records that global class field theory itself is not built.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`.

### K2SymbolsBrauer:T.2:symbols

Supply the canonical interface stated by accepted RS-28 for this stage, with its exact arithmetic hypotheses.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`.

### K2SymbolsBrauer:T.3:localization-comparison

Supply the canonical interface stated by accepted RS-28 for this stage, with its exact arithmetic hypotheses.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`.

### K2SymbolsBrauer:T.3:symbols

Supply the canonical interface stated by accepted RS-28 for this stage, with its exact arithmetic hypotheses.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`.

### K2SymbolsBrauer:T.4

Milnor transfers constructed through the Bass-Tate sequence, their transitivity, and Weil reciprocity on a proper regular curve. AUDIT-03 names T.4 as a duplicate of HL.1's norm maps; HL.5 and HL.6 also use Weil reciprocity for the relation along a curve.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`.

### KTheoryFiniteLocalFields:L.3

The local symbols on K_2 of a local field with their Hilbert-symbol components, which AUDIT-03 names as the n = 1 case of HL.4's explicit symbols.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-versus-algebraic-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`.

### MotivicEtaleKTheory:KU-normresidue

The norm residue theorem identifying Milnor K-theory modulo m with etale cohomology with Tate-twisted finite coefficients, and Bloch-Kato's theorem for a henselian discrete valuation field of characteristic zero with residue field of positive characteristic. HL.2 uses both to identify the symbol cup products and HL.3 uses the second in the surjectivity half of the isomorphism theorem.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`.

### MotivicEtaleKTheory:M.5d

Supply the exact prime-power norm-residue and characteristic-p differential comparison of M.5d, including finite coefficient length. Do not supply generic continuous-cohomology carriers, ordinary local duality, or an unqualified wild higher-field dimension theorem.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`.

### SchemeAndStackFoundations:SF.0

Schemes with the local rings of their points, completions and localisations, in the generality in which a Parshin chain alternates the two operations. HL.5's construction is an alternating sequence of completions and localisations along a flag.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`.

### SchemeAndStackFoundations:SF.2

Supply the regularity, properness and dimension interfaces in the stated scope. The precise arithmetic-scheme étale fundamental-group owner and representation need independent resolution; no such full carrier is assumed merely from SF.2.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`.

### SchemeAndStackFoundations:SF.5

Supply only the cycle and localization interfaces in the stated scope. Branchwise codimension-two reciprocity and the cohomological Kato complex square-zero proof are distinct open inputs here.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants

Imported prerequisite: The two dimension-one global branches have distinct owners. The anchor is a number-field roadmap, whereas FA.4 supplies curves over finite fields; higher-global reciprocity remains HL.6. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Imported prerequisite: The two dimension-one global branches have distinct owners. The anchor is a number-field roadmap, whereas FA.4 supplies curves over finite fields; higher-global reciprocity remains HL.6. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence

Imported prerequisite: The two dimension-one global branches have distinct owners. The anchor is a number-field roadmap, whereas FA.4 supplies curves over finite fields; higher-global reciprocity remains HL.6. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

Imported prerequisite: CFT Layer 5 owns its one-dimensional invariant/duality results; ProfiniteCohomology owns the generic cohomology machinery, CR.4 owns ordinary de Rham–Witt, and M.5d owns its norm-residue/differential comparison. Higher-field invariants and wild duality remain here. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity

Imported prerequisite: The anchor constructs one-dimensional reciprocity in all characteristics, but excludes equal-characteristic p-primary existence and injectivity. Only the latter and the higher-dimensional theory are new. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

Imported prerequisite: The anchor constructs one-dimensional reciprocity in all characteristics, but excludes equal-characteristic p-primary existence and injectivity. Only the latter and the higher-dimensional theory are new. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.7/dimension-one-artin-map-comparison`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence

Imported prerequisite: The anchor constructs one-dimensional reciprocity in all characteristics, but excludes equal-characteristic p-primary existence and injectivity. Only the latter and the higher-dimensional theory are new. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles

Imported prerequisite: GlobalNumberFields Layer 6 owns ordinary number-field ideles; FunctionFieldArithmetic FA.2 owns ordinary function-field ideles. HL.5 owns higher flag constructions and their comparisons. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions

Imported prerequisite: LocalFieldsRamification Layer 0 owns the one-local-field substrate; HL.0 adds towers and their higher topologies. The retired FoundationsAndLibraryIntegration:LI.4 is not a supplier. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/perfect-and-quasi-finite-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration

Imported prerequisite: The existing tame-symbol and ordinary ramification owners provide the building blocks, not a higher-field explicit reciprocity formula. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality

Imported prerequisite: CFT Layer 5 owns its one-dimensional invariant/duality results; ProfiniteCohomology owns the generic cohomology machinery, CR.4 owns ordinary de Rham–Witt, and M.5d owns its norm-residue/differential comparison. Higher-field invariants and wild duality remain here. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees

Imported prerequisite: CFT Layer 5 owns its one-dimensional invariant/duality results; ProfiniteCohomology owns the generic cohomology machinery, CR.4 owns ordinary de Rham–Witt, and M.5d owns its norm-residue/differential comparison. Higher-field invariants and wild duality remain here. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension

Imported prerequisite: CFT Layer 5 owns its one-dimensional invariant/duality results; ProfiniteCohomology owns the generic cohomology machinery, CR.4 owns ordinary de Rham–Witt, and M.5d owns its norm-residue/differential comparison. Higher-field invariants and wild duality remain here. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees

Imported prerequisite: CFT Layer 5 owns its one-dimensional invariant/duality results; ProfiniteCohomology owns the generic cohomology machinery, CR.4 owns ordinary de Rham–Witt, and M.5d owns its norm-residue/differential comparison. Higher-field invariants and wild duality remain here. Use only the named upstream stage’s actual hypothesis and coefficient scope.

Used by: `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`.

## Remaining proof and interface gaps

### Kato's preprint, the existence theorem the stage text points at by page range, was not read

The HL.3 stage text names AE-HLCFT existence theorem pp. 165-195. Those are the printed pages of Kato's Existence theorem for higher local class field theory, the IHES preprint of 1980 never published elsewhere, which sits between Parts I and II of this volume. It was not read. This packet takes the existence theorem from Fesenko's section 10.5, printed p. 100, which proves the same statement by a different route using the topology on the K-groups; Kato's route characterises the class of open subgroups of finite index without introducing that topology, and the source says so explicitly. Next source action: read printed pages 165 to 195 of the volume and record Kato's characterisation, then compare the two statements.

Affected declarations: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/perfect-and-quasi-finite-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/acceptance-computation-of-an-iterated-residue`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-versus-algebraic-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.7/dimension-one-artin-map-comparison`.

### The isomorphism theorem is sketched in the source, not proved

Section 5 of the volume says it outlines a proof. The index inequality is obtained by an argument by calculation of symbols, for which the source refers to Serre's book, and the wildly and ferociously ramified cases are compressed into a page. The surjectivity half is given in the most interesting case only, char(K) = 0 with residue characteristic p and l = p. Next source action: read Kato's original papers on higher local class field theory, which the source cites as [K1] and [K2], for the complete argument.

Affected declarations: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/perfect-and-quasi-finite-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/acceptance-computation-of-an-iterated-residue`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-versus-algebraic-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.7/dimension-one-artin-map-comparison`.

### Only the first pages of sections 6, 8 and 10 of the volume were read

Section 6, the topological Milnor K-groups, has now been read through printed page 63; subsections 6.3 to 6.8, which contain the pairings, the structure results and the properties of the norm map, were not. Section 8, the explicit formulas, was read to printed page 81; the statements of Vostokov's formula in subsection 8.3, which the existence theorem cites, were not read. Section 10 was read on printed pages 99 and 100 only. Next source action: read subsections 6.3 to 6.8, 8.2 to 8.3 and 10.1 to 10.4 in that order; they are the computational heart of HL.1, HL.3 and HL.4.

Affected declarations: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/perfect-and-quasi-finite-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/acceptance-computation-of-an-iterated-residue`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-versus-algebraic-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.7/dimension-one-artin-map-comparison`.

### The global theory has no source in this packet

The volume is a local source. Its introduction refers the reader to W. Raskind's review of abelian class field theory of arithmetic schemes for the global aspects, and the contents of Part II list L-functions, adelic direct images, buildings, Drinfeld modules, harmonic analysis, Galois cohomology, recovering fields from Galois groups, skew fields, local reciprocity cycles and Galois modules. The HL.6 stage text says in so many words that AE-HLCFT alone is a local source and does not prove this stage. Next source action: obtain Kato and Saito, Global class field theory of arithmetic schemes, and Raskind's review, and record their exact regularity, properness and coefficient hypotheses.

Affected declarations: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/perfect-and-quasi-finite-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/acceptance-computation-of-an-iterated-residue`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-versus-algebraic-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.7/dimension-one-artin-map-comparison`.

### Part II section 1 was read for two pages only, and section 2 not at all

HL.5 rests on Parshin's construction of the ring attached to a flag and of the adelic object, printed pages 199 and 200, which were read in full. The restriction condition on the components is stated there by reference to Parshin's, Beilinson's and Huber's papers, none of which was obtained, so the three formulations are not compared here. Osipov's section 2, on adelic constructions for direct images of differentials and symbols, was not read at all, so the functoriality node records the direct images by their role only. Next source action: obtain Parshin's and Beilinson's papers for the restriction condition and read Osipov's section.

Affected declarations: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/perfect-and-quasi-finite-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/acceptance-computation-of-an-iterated-residue`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-versus-algebraic-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.7/dimension-one-artin-map-comparison`.

### Epp's theorem is quoted and not proved

The last assertion of the classification theorem of HL.0, that a mixed-characteristic higher local field has a standard finite extension, is proved in the source by Epp's theorem on elimination of wild ramification, which is quoted from subsection 17.1 of the volume. Section 17 was not read. Epp's theorem is also one of the two ingredients of Zhukov's ramification theory recorded in HL.4. Next source action: read section 17 of the volume, printed pages 143 to 150.

Affected declarations: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/perfect-and-quasi-finite-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/acceptance-computation-of-an-iterated-residue`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-versus-algebraic-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.7/dimension-one-artin-map-comparison`.

### The structure of the Milnor K-groups of a one-dimensional local field is quoted

Subsection 6.1 of the source states, with attributions to Bass, Tate, Moore, Merkurjev, Kahn and Sivitsky, that K_2 of a one-dimensional local field is the direct sum of a cyclic torsion group and an uncountable uniquely divisible group and that K_m is uniquely divisible and uncountable for m at least three. These are quoted here and not proved; they are what makes the passage to the topological quotient necessary, so a continuation that wants HL.1 closed must either import them from KTheoryFiniteLocalFields or read the references.

Affected declarations: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/perfect-and-quasi-finite-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/acceptance-computation-of-an-iterated-residue`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-versus-algebraic-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.7/dimension-one-artin-map-comparison`.

### Inherited proof obligations are not declaration-sized closure

The retained source inventories contain bundled assertions, incompletely extracted proofs and proof sketches. Split their actual mathematical declarations before closure. Freshly checked corrections do not certify their remaining proofSteps or full source coverage. The 18-node coefficient-topology component has a separate baseline-closed dependency graph; all eight stages remain partial.

Affected declarations: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/perfect-and-quasi-finite-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/acceptance-computation-of-an-iterated-residue`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-versus-algebraic-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.7/dimension-one-artin-map-comparison`.

### Typed prototype frontier and missing canonical interfaces

The suggested file now gives actual native-carrier signatures for exactly the 18 coefficient-topology nodes, their 13 API entries and nine tests. The inherited residue tower, mixed-characteristic lifting, Milnor topological quotient, Kato coefficients, reciprocity and scheme/flag declarations cannot yet be prototyped against canonical supplier interfaces. Their prior vacuous declarations have been removed. The corresponding API names and tests remain explicit mathematical obligations in the packet, but do not yet appear as typed declarations. This is an open section-13 agreement frontier, not a completed suggested file.

Affected declarations: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/perfect-and-quasi-finite-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/acceptance-computation-of-an-iterated-residue`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-versus-algebraic-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.7/dimension-one-artin-map-comparison`.

### Higher topology, sequential saturation and pro-ind comparison

Zhukov §1.3 gives the unsaturated additive topology; Fesenko §6.2 defines its sequential saturation and gives a strictness example in dimension two. The new component addresses only the equal-characteristic coefficient-box topology and its native valuation comparison. Mixed-characteristic canonical lifting, coefficient-subfield dependence, completeness, sequential continuity, multiplicative τ/λ* and pro-ind comparison require their own declarations and source proofs.

Affected declarations: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/perfect-and-quasi-finite-variants`.

### Wild coefficients, dimensions and higher symbol normalizations

Extract coefficient-specific higher duality and dimension theorems. Do not identify ordinary characteristic-p Galois cohomological dimension with Kato’s differential-cohomology dimension. Fix the tame pairing product order and arithmetic Artin normalization, finite Witt lengths, and each explicit wild formula. The corrected transfer identity has no extra ramification factor; the factors belong to restriction.

Affected declarations: `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/iterated-residue-with-signs`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/norms-and-projection-formulas`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/parshin-structure-of-the-topological-k-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/filtration-on-milnor-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/acceptance-computation-of-an-iterated-residue`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.1/topological-versus-algebraic-k-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`.

### Higher-global carriers and square-zero proof

No unspecified expected kernel/cokernel counts as a theorem. Select the arithmetic-scheme fundamental-group carrier and primary global source. Distinguish Milnor and cohomological Kato complexes, prove codimension-two reciprocity with all branches/norms, and specify the restrictions and archimedean quotient in dimension-one comparisons.

Affected declarations: `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.7/dimension-one-artin-map-comparison`.

### Upstream stage dependency encoding

The current check_blueprint.py tests the broad tauceti baseline-reference pattern before atlas-stage membership, so it misclassifies upstream roadmap stages as Lean declarations. Following the existing ShimuraCompactifications C0 packet convention, exact supplier stages remain in each consumer’s unresolvedPrerequisites and in requests with neededBy. These are real mathematical dependencies and open graph-encoding gaps; they must be read alongside prerequisites. Restore the ordinary prerequisite edges once the resolver is corrected. No stage is represented as a baseline declaration and no checker is modified.

Affected declarations: `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/n-dimensional-local-field`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/classification-and-standard-fields`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/higher-topology`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/extensions-and-ramification-matrix`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/teichmueller-representatives-and-expansions`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/two-dimensional-examples`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/topology-on-the-multiplicative-group`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.0/perfect-and-quasi-finite-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-cohomology-groups`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/kato-residue-theorem-and-the-invariant-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/norm-residue-and-the-symbol-identification`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/finite-coefficient-duality`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/two-dimensional-residue-pairing-acceptance`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/reciprocity-map`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/isomorphism-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/parshin-reciprocity-in-characteristic-p`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/artin-schreier-trees-and-the-explicit-construction`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/existence-theorem`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/kernel-and-completion-statements`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.3/unramified-acceptance-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/higher-tame-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/explicit-formulas-for-the-hilbert-symbol`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/vostokov-pairing-and-the-wild-existence-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/ramification-filtrations-and-their-indexing`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/kurihara-exponential-and-differential-forms`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.4/artin-schreier-witt-acceptance-computation`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-adeles`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/residue-maps-along-a-flag`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/higher-idelic-and-cycle-complex-input`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/acceptance-recover-ideles-and-list-surface-flags`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/global-reciprocity-for-arithmetic-schemes`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reciprocity-relations`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/kato-complexes-and-boundary-square-zero`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/tame-and-wild-proper-and-open-variants`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6/reduction-of-the-curve-case`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.7/dimension-one-artin-map-comparison`.

## Preserved source and import notes

### Milnor K-groups of a higher local field: what is imported and what is added

Inherited source/import inventory; not a mathematical declaration.

The Milnor K-groups of a field, defined as the tensor algebra of the multiplicative group modulo the homogeneous Steinberg ideal, together with their alternating property and the standard computations, are owned by K2SymbolsBrauer:T.2 and are imported here by node identifier. The tame symbol of a discrete valuation, the higher Milnor residues with their product signs, the ramification formula for a finite extension, the transfer and the norm-residue formula are owned by K2SymbolsBrauer:T.3 and T.4 and are likewise imported. The reviewed audit AUDIT-03 records exactly these overlaps. What this layer adds is what is specific to a residue tower: the iterated residue with its sign, the compatibility of the iterated residue with the norm through the ramification matrix, and the topological Milnor K-groups.

### What the local source does not prove, and what a primary source must supply

Inherited source/import inventory; not a mathematical declaration.

The volume that this packet reads is a local source. Its introduction states that for an introduction to the global aspects one should see Raskind's review, and Part II contains no proof of a global reciprocity theorem: its sections treat L-functions, adelic direct images, buildings, Drinfeld modules, harmonic analysis, Galois cohomology, recovering fields from Galois groups, skew fields, local reciprocity cycles and Galois modules. Consequently every statement of this layer is recorded as an obligation with its hypotheses and none is proved here. A primary source for the chosen Kato-Saito or subsequent higher-global theorem has to be acquired, with its exact regularity and properness assumptions, before the layer can be closed; the roadmap text says so in those words.
