# PAPER-CESNAVICIUS-19 — Purity for the Brauer group

Worker: Codex, session codex-a71f92. Refs #1328. Read/check date: 2026-09-22.

Status: **partial checkpoint**. The entire main paper has been read and its named conclusions, constructions, remarks and proof interfaces inventoried. This is not a closed proof plan: the JSON names 25 open source/proof gaps, several requiring further one-declaration decomposition. Nothing in this submission claims a new formalization.

There are 148 items: 11 library imports, 11 existing planned interfaces and 126 missing items. Every missing item has exactly one route. The 38 definitions carry 114 unexecuted planning tests, API outlines and use records. All 17 routes are sources for existing proposed roadmaps; no new roadmap or Part II is needed.

## Source and reading boundary

The main source is the [author's final arXiv version, 1711.06456v4](https://arxiv.org/pdf/1711.06456v4), all 17 pages, including every proof, footnote, remark and the appendix. The arXiv submission date is 1 December 2018; the PDF internally says 4 December 2018. Its metadata identifies Duke Mathematical Journal 168(8) (2019), 1461–1486, DOI [10.1215/00127094-2018-0057](https://doi.org/10.1215/00127094-2018-0057). This supports the publication correspondence, but is not a page-by-page comparison with the unavailable publisher PDF.

SHA-256: a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709.

The JSON records URLs, hashes, dates and precise reading ranges for the supporting PDFs. In particular:

- [Gabber–Ramero](https://websites.umich.edu/~bhattb/almost_purity_2011/almost_ring_theory.pdf): the selected approximation path through §§5.4.1–5.4.42 and §§5.8.3–5.8.16, including proofs. The available preprint's **Corollary 5.4.42**, not its Lemma 5.4.41, is the projective-module completion theorem cited as GR03 5.4.41 in the main paper. Its Lemma 5.4.41 is the smoothness input. The induction still relies on Elkik's Noetherian approximation and the cotangent obstruction theorem.
- [Bhatt–Morrow–Scholze](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf): the entire §3.2, Definition 3.5 through Lemma 3.21 and their proofs. This author file is dated 8 January 2019, later than the BMS16 citation; the relevant numbering matches. The earlier θ construction and referenced root-control results remain gaps.
- [Kedlaya–Liu v5](https://arxiv.org/pdf/1301.0792v5): §3.6 through Remark 3.6.24, including the Banach, localization, finite étale and tilting proofs. The input is general Banach Q_p geometry, not only algebras over a chosen perfectoid field. The étale-site conclusion is **Remark 3.6.23** in this version.
- [SGA 2, Laszlo's annotated edition](https://www.cmls.polytechnique.fr/~laszlo/sga2/sga2-smf.pdf): X §2 definitions and Example 2.1's full proof; XI 2.1–2.2 and XI 3.1–3.17, including the parafactoriality theorem and its proof. Earlier local/formal coherence results in VIII–IX are not claimed read or closed.
- The actual statements and displayed proofs of Stacks [0E9K](https://stacks.math.columbia.edu/tag/0E9K), [069I](https://stacks.math.columbia.edu/tag/069I), [07D3](https://stacks.math.columbia.edu/tag/07D3) and [09Q7](https://stacks.math.columbia.edu/tag/09Q7) were read. Their short proofs still import substantial local algebra.

Other references in the prerequisite ledger are explicitly marked as unread proof inputs or bibliographic pointers. Locating a publisher page is not counted as reading its theorem. The historical Gabber cases (iv)–(vi) in the introduction are not used by this proof and have not been smuggled in as shortcuts.

## Mathematical scope

The central local result is H²_et(U_R,G_m)=0 for a strictly henselian regular local ring R of dimension at least two. The new mixed-characteristic p-primary argument passes through a tower of finite flat **regular local** algebras and the **p-adic completion of their colimit**. Neither the finite stages nor the uncompleted colimit are declared perfectoid.

The dependency spine is:

1. Hartogs extension and an affine diagonal Weil quotient give finite-flat descent. The Picard vanishing needed on the double self-product is local Grothendieck–Lefschetz in dimension at least four.
2. Henselian approximation preserves torsion Brauer classes on a principal generic fibre. Iterating principal completions along a regular parameter system yields injection on punctured H² after maximal-ideal completion.
3. Replace an integral perfectoid model R by the powerbounded subring of A=R[1/p]. The quotient A°/R is killed by each chosen small pseudouniformizer root; it is **not** assumed zero.
4. Scheme/adic comparison, tilting of the full étale site, and affine characteristic-p cohomological dimension give H^i(A,G)=0 for finite commutative étale p-primary G and i≥2. Kummer gives H^i(A,G_m)[p∞]=0 in the same degree range.
5. Combine this with the small-dimensional cases and prime-to-p absolute purity, then use supported cohomology and coniveau to obtain the global theorem.

The small-dimensional and prime-to-p results are genuine external proof engines: Grothendieck's dimension-two argument, Gabber's dimension-three theorem, and Gabber absolute cohomological purity. Smooth purity in EDC.2 does not supply the last one.

The global torus theorem is deliberately stronger than the introductory G_m statement in its permitted base schemes. For arbitrary X and closed Z, it assumes regular local rings of dimension at least two **at every point of Z**, together with quasi-compactness of X minus Z into X. It gives isomorphisms in degrees 0, 1 and 2, and only injection in degree 3. X need not be regular away from Z.

The codimension-one intersection formula for an arbitrary torus additionally assumes H²(V,T)→H²(K,T) is injective for **every nonempty open V**. This holds for G_m, and the paper cites a flasque-torus extension. It does not hold for all tori: the norm-one torus for C/R on P¹_R yields a nonzero generically trivial class.

The residue sequence retains the primary-part exclusions at imperfect characteristic-p residue fields. It is not an unrestricted wild residue theorem, and no surjectivity onto the direct sum is appended.

Appendix A uses Serre's **dimension at most one**, including the extra characteristic-p Brauer-vanishing condition over all finite separable extensions. It proves the equivalent higher fppf vanishing for all finite commutative group schemes, then all finite-type commutative group schemes. It does not assert H¹ vanishing for every such group.

## Two proof-sensitive qualifications

First, Proposition 2.2 is retained in its printed nonabelian scope, with G-NONABELIAN attached. The displayed quotient argument directly proves that the neutral fibre is trivial. For a nonabelian H¹ pointed set, that alone is not full injectivity. A continuation must read Giraud III.3.2.2 and verify the twisted-fibre argument under the exact hypotheses. This checkpoint does not claim the theorem false. All subsequent applications in the main purity proof use commutative groups, where the neutral-kernel argument does suffice; that specialization is a separate item.

Second, Huber's book has a blanket Noetherian convention. The paper does not apply it directly to R perfectoid. Its proof constructs integral finite-type stages R_j, compares the adic cohomology of their generic pairs with the scheme cohomology of **R_j^h[1/p]**, then passes to limits. Footnote 3 extends qcqs étale descent from perfectoid stages to **Noetherian integral stages with perfectoid completed limit**. That exact extension is a separate item and gap. It is neither automatic from the usual statement nor a reason to demand the stronger affinoid descent owned by A3.

Lemma 2.1's rank-zero edge case is handled on its clopen locus before the positive-rank fppf descent argument. Its product decomposition is an isomorphism of groups only in the commutative case. No false counterexample is claimed from the rank-zero case.

## Ownership decisions

| Supplier | Exact contribution |
| --- | --- |
| SchemeAndStackFoundations SF.0 | Punctured opens, Hartogs/coherent extension and determinant/Picard bridge |
| SF.1 | General scheme-torus descent, diagonal quotient, torsor lifting and finite-type group reductions |
| SF.2 | Coefficient-specific cohomology, Brauer comparison/descent/purity, coniveau, residues and Appendix A field cohomology |
| SF.4 | Henselian approximation, projective presentation groupoid, iterated-completion adapter and local parafactorial/Picard theory |
| DeformationAndDerivedPatchingAlgebra R03.3 | Shared local depth, lci and regular-factorial algebra |
| ReductiveGroupsPartII RG2.0a | The existing Weil restriction/norm owner, extended to the exact arbitrary-affine and finite-flat smoothness scope |
| PerfectoidQuotients Q0:integral-algebra | Integral perfectoid specialization, θ comparison, compatible roots and integral/Tate adapter |
| PerfectoidSpaces P1/P2/P3 | General Banach realization, tilt, rational homeomorphism/sheafiness, finite étale and full-site equivalence |
| PerfectoidSpaces P5/P7 | Noetherian-stage qcqs limit extension; regular finite-flat towers and their completed limit |
| AdicEtaleGeometry A1 | Actual adic étale-site basis and stability |
| ClassicalAdicEtaleCohomology H0/H1:henselian | Adic cohomology continuity and Huber's henselian comparison |
| AdicCoefficientsAndComparisons L2 | Scheme finite-presentation/cohomology continuity |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 | Only the source-scoped finite connected/connected p-group devissage |

These are source refinements of existing proposed layers, not new foundations detached from their owners. At integration, split early site/field/approximation prefixes from later purity suffixes. In particular the generic P1 foundations precede Q0, while the specialized Q0-to-P1 adapter is later; SF.2's early coefficient theory precedes SF.4, and its final purity consumer follows. Adding blanket reverse edges between whole stages would create artificial cycles.

The catalogue pass included new roadmaps, packets, integrated decompositions, reserved IDs and the relevant RS-02/05/25/31 ownership records. Cartier duality and strict henselization are not reassigned from their upstream owners. The current Gille–Parimala paper already uses SF.0–SF.1 for coherent Hartogs and torsor purity; Harpaz–Wittenberg20 uses SF.2 for G_m/purity/residues. The present source coalesces with these uses.

Neither K2SymbolsBrauer's explicit classical symbols nor the Lefschetz-pencil/vanishing-cycle project owns local Brauer purity or the local parafactorial theorem. SF.3's curve/Picard objects also do not by themselves provide the higher-dimensional local theorem.

## Pinned-library findings

The inspected commits are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Actual reused declarations include IsRegularLocalRing; HenselianRing/HenselianLocalRing and the adic-complete instance; IsAzumaya; scheme small étale/fppf topologies; generic CategoryTheory.Sheaf.H; PreTilt and its multiplicative sharp; WittVector and the perfect-field Witt DVR theorem; and Tau Ceti's affine-base finite locally free Cartier dual/equivalence/bidual/base-change API.

Important distinctions:

- Mathlib's BrauerGroup is a field central-simple-algebra quotient, not H²_et of an arbitrary scheme.
- The actual regular-local class and polynomial regularity theorems are not a complete regular-local factoriality/localization library.
- Tau Ceti's field torus category is useful but not arbitrary scheme-torus descent.
- The Cartier dual construction really is present over an arbitrary affine base; Appendix A must import it.
- The inverse-limit and sharp carriers do not themselves define a perfectoid ring or prove tilting.
- Generic sheaf cohomology and global-sections continuity do not prove higher étale continuity.

Reviewed AUDIT-01, AUDIT-17 and AUDIT-18 entries were read, and their conclusions checked against these actual statements. Where no audit entry existed, that absence was not used as evidence of missing mathematics.

The open [Mathlib integral-perfectoid PR #26385](https://github.com/leanprover-community/mathlib4/pull/26385), at the inspected head 75d288cfb2e8c7033535f60168edf49cfbb0daeb, is shape guidance only. Its pseudouniformizer nonzerodivisor condition is narrower than unrestricted BMS integral perfectoid and is compatible with the paper's torsion-free direction. It is not in the pinned baseline.

## Continuation and checks

The complete gap ledger is in the JSON. Resume first with G-NONABELIAN, then G-HUBER/G-ADIC-LIMIT and G-LEFSCHETZ/G-ELKIK. The latter two branches already have substantial direct source reading, so a continuation should extend those proof paths rather than repeat the main-paper inventory. Gabber/absolute purity, Cohen structure and the Appendix A SGA3/Serre/CGP inputs remain mandatory before a complete claim.

The paper checker and a supplemental audit cover JSON validity, unique IDs, exact-one missing-item routing, known owners/stages, acyclic item dependencies, explicit gap references, and three tests plus use-derived APIs for every definition. These are structural checks, not mathematical certification. No Lean file is requested by this issue, and no Lean compilation or test execution is claimed.
