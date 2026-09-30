# Redteam: Lust–Stevens, depth-zero L-packets

Agent: Codex · Session: `codex-rtOQ9t` · Issue: #5102 · Read: 2026-09-30.

The attack is complete and reports **five high-severity findings**. Two concern the finite-group constructions: the displayed Weyl representative is not symplectic, and the rational-primary-space stabilizer is not the required Levi. Three concern known source corrections that the accepted extraction still fails to apply to its target statements. The findings address the extraction, not edits to Tau Ceti's own roadmaps.

The extraction and its independent review were written by other workers. I read the full published paper, all 158 extraction items, the extraction/review reports, all 38 source issues and both route briefs. The accepted main-theorem inequality, finite/p-adic owner split, and repaired example multisets remain useful. A note acknowledging an erroneous formula does not make the formula suitable as a theorem target: PROTOCOL §18 requires corrected item statements.

## Sources and versions

The principal source is [the published paper](https://ueaeprints.uea.ac.uk/id/eprint/74421/7/Published_Version.pdf), Proc. London Math. Soc. (3) 121 (2020), 1083–1120, DOI [10.1112/plms.12340](https://doi.org/10.1112/plms.12340). I read all 38 PDF pages, including the bibliography. Printed page `p` is PDF page `p−1082`.

The comparison source is [arXiv v1](https://arxiv.org/pdf/1611.08421v1), 25 November 2016. I selectively collated it, especially §7.3 pp. 17 and 19; I do not claim a second full-paper read of all 36 preprint pages. Both Weyl-representative displays were inspected as rendered pages. The PDF hashes match those in the accepted extraction:

| Version | SHA-256 |
| --- | --- |
| Published | `bd8295cfd75e81b7c55f1bff08909679ca267c85c724debba23a3dc990624c55` |
| Preprint | `c1c8bd2f3dce4b2934c9b2172665f3ad7bccea16d751c1301434a97011b2d489` |

On 2026-09-30 I searched the title with erratum/corrigendum, Lust/Stevens/1102/symplectic, and the title with Levi/correction. I inspected the publisher article, [UEA record](https://ueaeprints.uea.ac.uk/id/eprint/74421/) and [arXiv version history](https://arxiv.org/abs/1611.08421). I found no correction of the Weyl sign in those results. This is a bounded search, not a claim that no correction exists anywhere. The Levi passage is already repaired in print and must be labelled accordingly.

## Findings

### 1. The Weyl representative is not symplectic — high

**Where:** `research/blueprint/papers/PAPER-LUST-STEVENS-20.result.json; PAPER-LUST-STEVENS-20/s7-7.6-weyl-representative-action`

The exported Weyl representative sends both vectors of each exchanged hyperbolic pair to epsilon times the other vector. For epsilon = -1 this fails to preserve the alternating form, so it is not an element of the asserted symplectic group. This source slip is absent from sourceIssues.

**Evidence.** Published §7.3, p. 1102, display immediately before (7.7), and arXiv v1 p. 19, before (7.6), both visually checked: w(e_i^±) = ε e_i^∓ on the exchanged pairs. Take N = n = 1, ε = -1, J = [[0,1],[-1,0]] and W = [[0,-1],[-1,0]]. Then W^t J W = -J ≠ J in odd characteristic and det W = -1. The stated representative therefore fails already in Sp_2. Mathlib 082e2d3, Mathlib/LinearAlgebra/SymplecticGroup.lean:101–102, independently defines the symplectic carrier by A J A^t = J. Sources: https://ueaeprints.uea.ac.uk/id/eprint/74421/7/Published_Version.pdf#page=20 and https://arxiv.org/pdf/1611.08421v1#page=19.

**Fix.** Replace the exchanged-pair formula by w(e_i^-) = e_i^+ and w(e_i^+) = ε e_i^- (fix the other pairs). Verify the isometry condition and determinant: this lies in Sp for ε = -1, and in SO for ε = 1 when n is even. Retain the induced inverse-transpose action, with the chosen ordered-basis convention checked. Add a sourceIssues record for the sign slip in both versions, recording the rank-one counterexample, source versions and correction search. Update the extraction report and route-2 construction instructions; do not change the later parameter table solely because this representative was mistyped.

### 2. The preprint rational-eigenspace stabilizer survived publication collation — high

**Where:** `research/blueprint/papers/PAPER-LUST-STEVENS-20.result.json; PAPER-LUST-STEVENS-20/s7-7.3-eigenspace-levi`

The extraction still defines the required Levi as the stabilizer of the decomposition into rational P-primary spaces. That stabilizer need not be a Levi. The published paper replaced this preprint construction, but the accepted item and its locator still export the superseded version.

**Evidence.** ArXiv v1 §7.3, p. 17 gives the rational-eigenspace stabilizer. Published §7.3, p. 1100 instead specifies the “minimal F-stable Levi subgroup containing the centralizer of s”. For a concrete allowed cuspidal datum, take q = 3, G* = SO_5 and charpoly(s) = (X-1)P with P = X^4+X^3+X^2+X+1. P is irreducible over F_3 (ord_5(3)=4), self-reciprocal and separable. Its exponents satisfy (7.2)(ii): a_P=1, m_P=1; a_+=1, m_+=0; a_-=0. The connected stabilizer of the rational 4+1 decomposition is SO_4, dimension 6, not a Levi of SO_5: proper geometric Levis have types GL_2, GL_1×SO_3 or a torus, of dimensions 4, 4 or 2. The desired centralizer is the two-dimensional elliptic torus. Sources: https://arxiv.org/pdf/1611.08421v1#page=17 and https://ueaeprints.uea.ac.uk/id/eprint/74421/7/Published_Version.pdf#page=18.

**Fix.** Replace the item by the published construction using the minimal Frobenius-stable Levi containing the semisimple centralizer. Explain its product of general-linear factors with twisted Frobenius and the residual classical factor on ker(s²-1), as in the following published paragraphs; do not identify it with the stabilizer of rational primary blocks. Cite published p. 1100. Record the preprint error in sourceIssues as already corrected in the version of record, and update the report/version comparison and route-2 design guidance.

### 3. The ramified-unitary quotient still has the rejected determinant condition — high

**Where:** `research/blueprint/papers/PAPER-LUST-STEVENS-20.result.json; PAPER-LUST-STEVENS-20/s2-reductive-quotient-J`

The executable target statement retains the residue determinant-norm condition in the ramified unitary case, although its own note and confirmed sourceIssue E5 correctly reject it. The false condition changes the reductive quotient that route 1 is to construct.

**Evidence.** Published §2, pp. 1089–1090, and arXiv v1 p. 6 print N_{k_F/k_o}(det g_1 det g_2)=1; existing E5 already supplies the correction. Rechecked directly: let F/F_o be ramified quadratic, p odd, V=Fe, h(e,e)=1 and L=O_F e. Then G=F^1, L#=p_F L, Vbar_1=k_F, Vbar_2=0. The element -1 is in G and reduces nontrivially, and J/J^1={±1}=O_1(k_F). Since k_F=k_o, the item’s residue norm is the identity, so its determinant equation wrongly removes -1 and gives the trivial group. The following source paragraph also gives [J:J°]=2 in this case. Source: https://ueaeprints.uea.ac.uk/id/eprint/74421/7/Published_Version.pdf#page=7; the issue is unpropagated E5, not a newly discovered published error.

**Fix.** Branch the item statement by ramification. Retain the displayed condition for F=F_o and unramified quadratic F/F_o; in the ramified quadratic case state J/J^1 ≅ U(Vbar_1)×U(Vbar_2), with no determinant condition, and retain the connected-component description. Propagate this branch into the report and route-1 reductive-quotient instructions. Keep the existing E5 rather than creating a duplicate erratum.

### 4. The two maximal-parahoric criteria contradict each other — high

**Where:** `research/blueprint/papers/PAPER-LUST-STEVENS-20.result.json; PAPER-LUST-STEVENS-20/s2-parahoric-Jo-properties, PAPER-LUST-STEVENS-20/s2-maximal-parahoric-exceptions`

The first maximality item excludes every two-dimensional special orthogonal residual factor, while the later item correctly excludes only split SO(1,1) factors, with an ambient-dimension exception. The accepted extraction therefore exports contradictory maximality criteria despite confirmed E6.

**Evidence.** Published §2 p. 1090 uses “a two-dimensional special orthogonal group”; p. 1091 gives the refined split-SO(1,1) criterion. The extraction’s s2-maximal-parahoric-exceptions matches the latter. Rechecked E6: for an anisotropic four-dimensional quadratic space over an odd-residue-characteristic local field, the building is a point and the unique parahoric is maximal, while its connected reductive quotient is SO(2,0,k_F)×SO(2,0,k_F). Both factors have dimension two as quadratic spaces but neither is split; the first item incorrectly declares the parahoric nonmaximal. Source: https://ueaeprints.uea.ac.uk/id/eprint/74421/7/Published_Version.pdf#page=8 and #page=9; existing E6 is confirmed by the accepted review.

**Fix.** Replace the maximality clause of s2-parahoric-Jo-properties by the criterion already stated in s2-maximal-parahoric-exceptions: failure occurs for a split SO(1,1) residual factor when the ambient group is not itself two-dimensional special orthogonal. Preserve the explicit case list. Make the two items and the report agree; retain E6 as the source provenance. Handle the independent normalizer/SO(1,1) defect under finding 5.

### 5. The split SO(1,1) exception is absent from theorem statements — high

**Where:** `research/blueprint/papers/PAPER-LUST-STEVENS-20.result.json; PAPER-LUST-STEVENS-20/s2-maximal-compact-lattice-stabilizers, PAPER-LUST-STEVENS-20/s2-parahoric-Jo-properties, PAPER-LUST-STEVENS-20/s2-standard-lattices-conjugacy, PAPER-LUST-STEVENS-20/s3-depth-zero-classical-classification, PAPER-LUST-STEVENS-20/s3-depth-zero-uniqueness`

The normalizer, lattice-label uniqueness and compact-induction classification still quantify over split SO(1,1), although confirmed E7 and route 1 acknowledge the exception. Notes do not repair the false target statements or the dependent assertion that (N_1,N_2) is determined by the representation.

**Evidence.** Published §2–3, pp. 1089–1092, and arXiv v1 pp. 6–9; the classification describes the normalizer as “compact open”. Rechecked E7: identify SO(1,1)(F) with F× acting by diag(t,t^-1). L_{1,0}=Oe_-⊕Oe_+ and L_{0,1}=Oe_-⊕p e_+ are distinct almost self-dual lattices, with duals pL_{1,0} and L_{0,1}. Both stabilizers are O×. The valuation sum of the two lattice exponents is invariant under diag(t,t^-1), so these lattices are not G-conjugate. Also N_{F×}(O×)=F× is noncompact. For a depth-zero character χ, c-Ind_{O×}^{F×}(χ|_{O×}) has infinite dimension (one coset for every integer valuation), hence cannot equal the one-dimensional χ. Source: https://ueaeprints.uea.ac.uk/id/eprint/74421/7/Published_Version.pdf#page=7 through #page=10.

**Fix.** Add the explicit G≠SO(1,1) hypothesis to the affected normalizer, compact-induction and injective-label statements, and propagate it through their use in the later local-data constructions. Treat split SO(1,1) separately by characters of F× and its full noncompact normalizer, or explicitly defer that case; do not claim it follows from compact induction from O×. Preserve any valid lattice-orbit statement separately from the false injectivity of lattice labels on stabilizers. Keep E7 and align the report and route-1 brief with the corrected scope.

## Counterexample and calculation details

For finding 1, write the alternating pairing on a hyperbolic pair as `h(e_−,e_+)=1` and `h(e_+,e_−)=−1`. Applying the printed map to both arguments changes the first value to `−1`. The proposed replacement has matrix `[[0,−1],[1,0]]`, for which `WᵗJW=J`. This is a sign defect in the chosen lift, not evidence that the later self-duality test or Hecke parameter table is false. The nearby even-orthogonal inversion typo is already correctly identified by E18 and corrected in route 2; it is not counted as a newly discovered source mistake here.

For finding 2, the example satisfies the cuspidal-series conditions, rather than being an arbitrary semisimple counterexample outside the item's hypotheses. A root ζ of `P` has order five in `F_81`; Frobenius acts on it with orbit length four and ζ^9=ζ^−1. Multiplication by ζ on the four-dimensional `F_3` space `F_81` preserves the nondegenerate quadratic form

`Q(x)=Tr_(F_9/F_3)(x·x^9)`.

Its determinant is the norm of ζ, namely one. Add a nondegenerate one-dimensional summand on which `s` is the identity, obtaining an element of `SO_5(F_3)`. Its eigenvalues are distinct over the algebraic closure, so its centralizer is a rank-two torus. Equation (7.2)(ii) permits precisely these exponents for a cuspidal series of the connected-centre group. But preserving the entire rational four-dimensional block permits an `SO_4` factor; it does not force an element to preserve the four individual geometric eigenspaces. That distinction explains why the preprint construction is too large. The published construction uses the Levi containing the centralizer, and its subsequent reduction isolates the ±1 block.

For finding 5, write a diagonal lattice as `p^a Oe_− ⊕ p^b Oe_+`. Multiplication by `diag(t,t^−1)` changes its exponents by `(v(t),−v(t))`, preserving `a+b`. The two displayed lattices have sums zero and one, so their equality of stabilizers does not arise from a hidden `G`-conjugacy. The full normalizer is noncompact because the group is abelian. The ordinary compact induction from `O×` has a basis indexed by valuation cosets, whereas a character has dimension one.

I also ran exact rational/integer calculations on all 441 pairs `0≤m_1,m_2≤20`. The generic formula gives reducibility points `(m_1+m_2+1)/2` and `|m_1−m_2|/2`; the sum of their squared floors equals `m_1(m_1+1)/2+m_2(m_2+1)/2`. The inverse formula recovers the unordered pair. For `X±1`, I checked the inverse formula for all four possibilities `f_i=2m_i+c_i`, `c_i∈{0,1}`. I checked the irreducibility of `P` over `F_3` against every monic divisor of degrees one and two, and both rank-one matrix identities. These checks support the calculations; they do not constitute formal proofs of the representation theory.

The corrected multisets in Examples 9.3, 9.4 and 9.6–9.9 agree with the rule `m=2s−1`, retaining only positive `m`. For example, Example 9.7 gives `s=3/2,1/2` in each quadratic inertial class, so only `m=2` remains. Example 9.9 has `s=5/2,1`, giving `m=4,1`; the corrected dual characteristic polynomial has the required degree thirteen. Existing E26–E28 cover these errors, and I do not duplicate them.

## Status, library and ownership checks

The route membership check covers all 158 items: four planned, 154 missing, with each missing item assigned once. Route 1 receives 102 items and route 2 receives 52. Their identifiers, parents, titles and areas match the accepted Fintzen and LLHLM routes. The general Deligne–Lusztig/Harish-Chandra theory remains with `ModularRepresentationsOfFiniteReductiveGroups`; the local covers, reducibility and packet counting consume it in `SmoothRepresentationsPartII`.

I assembled a fresh atlas at `449dda7` and read the relevant SR.1–SR.3, GN.2, RG2.2–RG2.3, ET.6 and ML.4 contracts, together with the cited local-field and Witt layers and the reviewed GN.2 library audit. SR.2 supplies normalized parabolic induction; SR.3 supplies the Bernstein block description; the classical-group lattice formulas require more than the abstract building/parahoric stages. The quadratic Witt theorem is an existing ingredient; the general hermitian/skew-hermitian development is not supplied by that quadratic theorem alone. The extraction's note already discloses that the special anti-invariant uniformizer is additional work.

The following declarations were read at the specified pins, rather than inferred from their names:

| Pin | Read source | What it actually supplies |
| --- | --- | --- |
| Mathlib `082e2d3` | `Mathlib/NumberTheory/LocalField/Basic.lean:45` | `IsNonarchimedeanLocalField`, with field, valuation and topology hypotheses. |
| Mathlib `082e2d3` | `Mathlib/Algebra/Polynomial/Mirror.lean:39` | Polynomial reversal preserving degree, an ingredient rather than the full conjugate-reciprocal predicate. |
| Mathlib `082e2d3` | `Mathlib/LinearAlgebra/SymplecticGroup.lean:101` | The exact symplectic matrix equation used in finding 1. |
| Mathlib `082e2d3` | `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:62` | The Lipschitz subgroup generated by invertible vectors; not the asserted reductive dual-group identification. |
| Tau Ceti `f790474` | `TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean:221,238` | Witt index and decomposition of regular quadratic-form classes. |
| Tau Ceti `f790474` | `TauCeti/LinearAlgebra/BilinearForm/DualLattice.lean:81,99` | Dual-lattice equivalence and double duality for nondegenerate bilinear forms and free full lattices. |
| Tau Ceti `f790474` | `TauCeti/RepresentationTheory/Induction/Clifford/Equivalence.lean:281` | Restriction of a simple finite-dimensional representation to a normal subgroup as equal-multiplicity conjugate constituents over an algebraically closed field. |
| Tau Ceti `f790474` | `TauCeti/RepresentationTheory/Induction/Mackey/Decomposition.lean:390` | General double-coset decomposition for algebraic induction/restriction. |
| Tau Ceti `f790474` | `TauCeti/RepresentationTheory/Induction/IndexTwo.lean:57,66` | Vanishing of induced characters off the subgroup and the inverted-subgroup character formula, not the finite cuspidal twist criterion. |
| Tau Ceti `f790474` | `TauCeti/Algebra/AlgebraicGroup/{Orthogonal,SpecialOrthogonal}/Basic.lean` | Standard matrix point models, not a completed general ε-hermitian local-group theory. |

The full pins are recorded in the JSON. Both pinned source trees were searched for the finite Lusztig/Howlett–Lehrer and similitude/GSpin interfaces. In particular, the general Mackey theorem does **not** turn item `s7-7.5-mackey-formula` into a built result: that item also asserts the finite Harish-Chandra decomposition with one or two constituents. The review's correction of that status survives this attack.

The main result is retained as the published lower bound, with equality for the depth-zero sub-sum. Positive-depth vanishing remains a separately justified input (published Remark 8.2), and packet-count interpretations retain assumption (A) and the even-orthogonal caveat. I have not certified every cited external theorem, or an equal-characteristic LLC from the mixed-characteristic ET.6 construction. No finding here depends on such a claim, and no new packet/LLC owner is introduced.

## Validation

Only this report and its companion result JSON are delivered. The redteam checker passed; intake reported two files and zero problems; the staged whitespace check passed. No Lean file is required by this issue; no Lean compilation, Lake project, cache download or language server was started. The findings are proposals for independent verification, not self-approved corrections to the target extraction.
