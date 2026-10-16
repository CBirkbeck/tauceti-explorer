# Independent review of R09.7c

**Accepted after corrections**, as a complete target-level consolidation with stage coverage **planned** and implementation **unchecked**. Reviewer: Codex, session `codex-4uIbCq`, issue #9915, 2026-10-16. The input author was the different session `codex-gsFaGv` (#9911). The [packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7c.json) records the independent verdict and nine per-target checks; the [reader](../readmes/AlgebraicModuliForArithmeticGeometry--R09.7c.md) incorporates the corrections.

There are **zero new nodes**, **nine imported targets** (one definition, three constructions, five theorems), **eleven direct support imports**, **fourteen imported API items**, **twelve imported tests**, **three imported planets**, and **ten confirmed baseline declarations**. Five target contracts received clarifications or citation corrections; four were verified unchanged. No node, API item, test, planet, supplier request or source finding was added. Three inherited supplier requests remain open. There is no newly identified mathematical gap or unresolved contradiction in this consolidation; acceptance does not discharge those requests or prove the targets.

## Corrections made

1. **Prescribed bad loci.** Explicitly require the closed unresolved locus to be a union of equality strata for the selected variant's invariant. Closedness alone would allow an arbitrary singular subset of a smooth constant-invariant stratum and would not imply a smooth centre. Remarks 10.3, p. 284, check the required condition for the singular and old-boundary loci. The reader now retains this condition when describing the ideal and pair variants. It still selects all incomparable maximal values and glues coherent centre ideals.
2. **Source labels.** Corrected the embedded-resolution references to **Theorem 11.4**, p. 288, **Corollary 11.9** and **Lemma 11.11**, p. 289, in both the imported target's locator and the reader. Proposition 11.13 and Theorem 11.14 retain their correct labels.
3. **Nonreduced endpoint.** Clarified that the locally constant Hilbert–Samuel function belongs to the possibly nonreduced endpoint, in the source's closed-point convention. Its reduction is smooth. This assertion does not make the nonreduced endpoint smooth; the native output construction here takes reduced input.
4. **Dimension convention.** Restricted the displayed embedding-dimension inequality for the smooth-pair bad locus to closed points. Added the scheme-wide formulation by dependence of restricted boundary differentials in the relative cotangent space, with Jacobian minors defining closed defect loci for every boundary subset. The rank of the cotangent bundle is locally constant on a smooth component; local-ring dimension at arbitrary scheme points is not. The generic and closed points of an affine line distinguish the two. This is a clarification of the passage from the source's p. 213 convention to schemes, not an error attributed to the paper.
5. **Tower comparisons.** Specified that arbitrary changes of local smooth embedding yield isomorphic **intrinsic strict-transform towers**. Ambient-pair isomorphisms give ambient-tower isomorphisms; closed smooth ambient enlargements give compatible ambient embeddings. Ambient spaces of different dimensions are not asserted isomorphic. Both the local-isomorphism target and embedded output import carry this clarification, and the reader explains it at Remarks 13.1 and Theorem 13.2.

The new `scopeClarification` fields specify how this part consumes its imported contracts. The canonical R09.7 and R09.7a packets were not edited or duplicated, and their recorded hashes remain valid. The suggested Lean file was checked and left unchanged: its endpoint consequence neither uses the ambiguous local dimension formula nor asserts an ambient-tower comparison.

## Source checks and mathematical closure

I read the full consolidated reader, all nine canonical target contracts, their direct supporting statements and proof outlines, and the [full published Bierstone–Milman article](https://mahalex.net/teaching/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), *Inventiones mathematicae* 128 (1997), 207–302, at the following target locators. The public PDF's SHA-256 agrees with the packet: `f01ebbb0591fa62f9b65c16ab54f35e7409cf4fb0abd1f01bf3bf9b59d87ecaf`. All statements and explanations in these edits are in my own words.

| Imported target | Source and check |
| --- | --- |
| Global centres | Remarks 1.15–1.16, pp. 220–221; Remarks 10.3 and algorithm, pp. 284–285; Theorem 11.14, pp. 290–291. Checked birth-ordered component selection, maximal rather than greatest values, the prescribed bad locus, smooth disjoint centre strata and ideal-level overlap agreement. |
| Termination | Theorem 1.14(2),(4), pp. 219–220; terminal monomial calculation, pp. 259–260; algorithm, pp. 284–285. Realized invariant words stabilize, then equal-word monomial mass drops; quasi-compactness globalizes the finite algorithm. A finite set of values at each separate year alone would not suffice. |
| Principalization | Theorem 1.10, pp. 216–217; Remark 1.18, p. 225; §6, pp. 254–260. Retained empty initial boundary, generic nonvanishing on every component, invertible monomial **total** ideal, unit weak transform and preservation outside the original support. |
| Embedded resolution | Theorem 11.4 through Theorem 11.14 and following paragraph, pp. 288–291. Checked the reduced endpoint, nonreduced distinction, singular-locus centres, strict transforms, properness and original regular-open preservation. |
| Resolved locus | Theorem 12.4, Lemma 12.5 and Remarks 12.6, p. 293; simultaneous-coordinate convention, p. 213. Checked distinct boundary germs, local noncontainment, every subset, scheme structure, openness and restriction. |
| Preservation of resolved points | Theorems 12.2/12.4, Lemmas 12.7/12.8 and Example 12.9, pp. 292–296. Checked residual-product induction and the stronger monomial cleanup using new exceptional intersections inside the unresolved pair locus. Ordinary principalization alone does not prove the result. |
| Local-isomorphism resolution | Remarks 13.1 and Theorem 13.2 with proof, pp. 296–298. Checked intrinsic embedding independence, coherent centre ideals, comparison squares, unique lifts and cocycles, with empty-centre steps omitted on restriction. Arbitrary smooth-morphism functoriality is outside this target. |
| Principalization tower output | Theorem 1.10, Remark 1.18 and algorithm, pp. 216–217, 225, 283–287. The accepted finite-tower carrier records the centre-by-centre witness, native pullbacks, exceptional labels and distinct total/weak transforms. |
| Embedded tower output | Theorems 11.14, 12.2, 12.4 and 13.2, pp. 290–298. Checked native kernel strict closure, permissible centres, all commuting squares, smooth/SNC endpoint and specified-open identifications. |

The monomial example with weights 3/5 and 3/5 has new pivot weight 1/5 and new chart mass at most 4/5. Direct standard-monomial counting gives cumulative Hilbert functions `(1,4,4,4,…)` and `(1,3,4,5,5,…)` for the two Artin examples, so they are incomparable. The total pullback of `x²y³` under `x=u, y=uv` has exponents `(5,3)`. I also checked the cusp's three successive centres, the `z=xy` pair defect and its two-step cleanup, and the strict-transform tests distinguishing an empty strict transform from a nonempty exceptional total inverse image. These tests reject plausible incorrect definitions. The four definitions/constructions each retain at least three tests and a usable API.

The twelve tests and fourteen API names exactly match their canonical owners and occur in the reader. The three planets refer to central named constructions/theorems already owned by those packets. No new planet or duplicate mathematical definition is needed.

The accepted **1989 Hilbert–Samuel stabilization** target remains an explicit import: its statement and its use in Theorem 1.14 were checked, but I did not reread the 1989 paper or re-prove the accepted supporting development. The packet has no local `sourceIssues`. The inherited E1901/E1902 remain owned by R09.7; I inspected the relevant 1997 passages on pp. 226 and 282 and did not register a duplicate finding. This review checks the R09.7c contracts, not a replacement review of every accepted ancestor's source ledger.

## Baseline and ownership

I personally read all ten cited declarations at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**, including their hypotheses and surrounding interfaces. None was removed or replaced.

| Pinned declaration | Confirmed contribution and boundary |
| --- | --- |
| `AlgebraicGeometry.Scheme.IdealSheafData` | Compatible quasi-coherent ideal data on affine opens of an actual scheme. |
| `AlgebraicGeometry.Scheme.IdealSheafData.comap` | Native pullback ideal; the associated subscheme is the corresponding fibre product. |
| `AlgebraicGeometry.Scheme.IdealSheafData.comap_comp` | Contravariant composition in the order used by the tower tests. |
| `AlgebraicGeometry.Scheme.IdealSheafData.comap_id` | Identity pullback. |
| `AlgebraicGeometry.Scheme.Hom.ker` | Largest quasi-coherent ideal in the section kernels. The section-kernel comparison requires quasi-compactness, supplied here by the Noetherian setting. |
| `AlgebraicGeometry.Smooth` | Smoothness of affine restriction ring maps. |
| `AlgebraicGeometry.Scheme.Hom.smoothLocus` | Open formally smooth stalk locus under local finite presentation; the characteristic-zero identification with the regular locus is a geometric obligation, not part of this definition. |
| `AlgebraicGeometry.IsProper` | Separated, universally closed and locally finite-type scheme morphism. |
| `AlgebraicGeometry.IsReduced` | Reduced rings of sections. |
| `MvPolynomial.eval₂Hom` | Polynomial substitution ring homomorphism with specified coefficients and variable images. |

The reviewed library audit for R09.7c was read. I separately inspected current TauCetiRoadmap main **0d144d044dacebca17b654695b6f1ad58f159b27** and current Tau Ceti **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039**, read-only. StableReduction Layer 4 already owns ordinary blowups, their universal property, strict transforms, charts and flat base change; it is not being asked to supply higher-dimensional characteristic-zero resolution. AlgebraicVectorBundles owns its algebraic sheaf/relative-Spec infrastructure. Current native effective-Cartier and affine-blowup-chart declarations are reused. The analytic toric boundary normal forms concern complex toric charts and do not provide the general scheme-theoretic invariant, resolved-pair locus or finite resolution towers specified here. Searches of current roadmaps and library found no duplicate target implementation.

Both canonical import hashes and their accepted review identities match. Every direct prerequisite list matches its canonical node exactly. Traversing the imported targets reaches **40 distinct canonical nodes**, with no cycle, ending at **14 boundary references**: pinned-library references, StableReduction Layer 4, and SF.0/SF.3 interfaces. Eleven explicitly imported direct supporting nodes retain their accepted owners and prerequisite graphs.

The three inherited requests are precise and remain open:

- **StableReduction Layer 4:** the general ordinary-blowup interface and regular-pivot chart identification; existing current chart declarations do not discharge the entire interface.
- **SF.0:** residual localization/completion/quotient and coordinate comparisons over actual closed-point residue fields, local smooth embeddings and open gluing. I read the Jacobson and étale-coordinate supplier statements; their packet is `needs_changes`, and the reader does not credit them as accepted or implemented or pretend they discharge the whole request.
- **SF.3:** the remaining unrestricted Cartier/divisor and ideal-product dictionary, reusing native effective Cartier ideals and requiring regular pulled-back equations. Blowups are not assumed flat.

Thus **planned** is the correct stage status. All six requested target groups map to the nine imported targets. Remaining work explicitly includes suppliers, finite carriers, full comparisons and proofs. Nothing is marked closed or formalized.

## Validation and handoff

- `python3 scripts/check_blueprint.py` on the corrected packet: **0 errors, 0 warnings**.
- Independent import/hash, prerequisite, coverage, review-verdict, planet and API/test-name audit: passed. Numerical witness checks above passed.
- `lean-check` on the unchanged 74-line suggested file at the shared pinned Mathlib/Tau Ceti build: **exit 0**, **five declaration-uses-sorry warnings**, no errors or other warnings. The native existence theorem and four examples elaborate; they remain unproved. No heavy carrier or data definition is hidden in this file.
- Whitespace and deliverable-scope checks: passed. Canonical supplier packets and current upstream were not modified.

No revision round or orchestrator decision is needed for this review. Assembly/package work should retain the five clarifications, the inherited requests and the omitted-carrier ledger. The [handoff](../handoff/REV-AlgebraicModuliForArithmeticGeometry--R09.7c.md) records the completed job. This run handles only #9915.
