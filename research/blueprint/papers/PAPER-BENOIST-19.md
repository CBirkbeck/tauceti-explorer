# Benoist (2019): period and index on real surfaces

Partial extraction for issue #1454. Agent: Codex, session `codex-a71f92`.

The published paper has been read completely. The accompanying JSON inventories **151 items**: **8 library**, **8 planned**, and **135 missing**. It proposes ten routes for **132** missing items. Items **66, 67 and 149** are deliberately unrouted proof-audit gates, not hidden assumptions. All 60 original definition/construction items, plus the shared VHS definition added at final review, have an API and at least three discriminating tests.

This is not a claim of formalization, transitive proof closure, or a counterexample to Benoist's theorems. The unresolved steps and unread prerequisite proofs make `status: partial` necessary.

## Source and what was read

Olivier Benoist, [The period-index problem for real surfaces](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf), *Publications Mathématiques de l’IHÉS* **130** (2019), 63–110, DOI [10.1007/s10240-019-00108-7](https://doi.org/10.1007/s10240-019-00108-7). Accessed 2026-09-22.

All 48 published pages, including every proof and the bibliography, were read. SHA-256: `8dfc0f221ab510ba1ecfe7c5b5fde12c217019f33d704ea89ce1a0c144398d3b`. Published pp. 76, 84 and 85 were also inspected as page images. The author copy and arXiv v2 were used for targeted checks, not claimed as independent full readings or as textually identical editions.

Additional proof reading:

- Benoist–Wittenberg I: proper Gysin and its twist, the self-dual localization sequence and Theorem 1.12 proof, real divisor (1,1), Picard primitivity and the zero-cycle norm input.
- Benoist (2018): all of §1 and §2.1, including the real Green criterion and the normal-boundary factorization with proofs.
- Voisin (2006), author manuscript: §3, Propositions 8–9 and their proofs. Proposition 9 still imports substantial earlier residue/degeneration arguments not yet read here.

Exact URLs, hashes and read boundaries are in `sourceLedger`. Prerequisite citations linked to the main paper's bibliography are explicitly **unread source requests**, not claims that those independent proofs were acquired.

## Mathematical endpoints and boundaries

The central result concerns the actual real numbers. For a smooth connected real surface U and α in Br(U), vanishing of α at every real point implies period equals index in R(U). This includes function fields of smooth projective real surfaces without real points, without requiring the class to be unramified on that projective model.

For α unramified on a smooth connected projective real surface S, let n be its period and Θ the nonzero evaluation locus. Odd n gives index n. For even n, index n is equivalent to the existence of **some** Kummer lift of (n/2)α whose degree-one real component vanishes on Θ; otherwise the index is 2n. Changing the lift by a Picard class matters.

The quadratic-form consequence uses the **Elman–Lam** u-invariant: only anisotropic forms with zero signature at every ordering count. It is at most four for every transcendence-degree-two extension of R, including non-finitely-generated extensions, and equals four for function fields of integral real surfaces. This is not the unrestricted anisotropic-rank invariant of a formally real field. Lang's and Pfister's general conjectures remain conjectures.

The applications give the real Enriques criterion in terms of orientability, halves and Euler parity, and a degree-four del Pezzo rational-point theorem over R(C) when C(R) is empty. The Puiseux K3 example has H¹ of the real locus zero but a period-two/index-four class, so the real-surface topological criterion must not be extended to all real closed fields.

The JSON's `proofSpines` separates the complex unramified argument, real double-cover construction, arbitrary-period induction, necessity, quadratic-form applications and Enriques/Puiseux cases.

## Ownership: shared foundations first

The catalogue was audited at `1c16a3cd24b5b8e55dee3f5ef2fef8dd054bee96`, then rechecked against main `5a2df16e0b15e326e1adf3e6999e2fd3e32b73bd`. The relevant change was another worker's partial BKT20 Hodge proposal. Its routes led to a further read of ShimuraData D3, the full README and AUDIT-10. That check corrected generic VHS ownership before submission.

| Owner or proposed continuation | This paper's contribution |
| --- | --- |
| SchemeAndStackFoundations SF.2 | Scheme Brauer group, residues/purity, Kummer and real finite-coefficient comparison |
| MotivesAndAlgebraicCycles MC.2 | Krasnov/Borel–Haefliger classes and real line-bundle compatibility |
| MotivesAndAlgebraicCycles MC.7 | Early complex/real integral divisor (1,1) and primitive Picard-image leaves |
| AlgebraicModuliForArithmeticGeometry R09.1/A0-extension | Precise ample-twist and Serre-vanishing input |
| ShimuraData D3 | Existing general VHS definition; item 151 imports it |
| Semisimple algebras, Part II: period and index arithmetic | Class index, splitting-degree gcd and extension/period divisibilities beyond the built algebra-index API |
| Algebraic topology, Part II: involutions and real-locus cohomology | C2-equivariant integral coefficients, sign local systems, components/Bocksteins, purity, self-duality and cover interfaces |
| DegeneratingHodgeStructures, proposed Hodge Part II | Geometric/real infinitesimal and Noether–Lefschetz tranche, using BKT20's same proposed ID |
| Quadratic forms, Part II: orderings and real function fields | Harrison descent, Pfister criterion, real-curve/Springer inputs and late u-invariant applications |
| RealSurfacePeriodIndex, new | Ramified-cover geometry, the obstruction theorem, Enriques/Puiseux and del Pezzo applications |

The proposed Hodge continuation is **not** a second generic variation carrier. It imports D3, ComplexComparisonPartII C5's comparison/Gauss–Manin maps and the upstream Hodge linear algebra. It coordinates with BKT20's existing `DegeneratingHodgeStructures` proposal; neither partial extraction makes that proposal an accepted atlas layer.

Similarly, the Charles K3/twisted-sheaf proposal is a coordination lead, not an accepted supplier. Basic K3 and Brauer interfaces must be reconciled at integration. This paper does not re-plan stable sheaves, Mukai lattices, IHS boundedness or Kuga–Satake.

There is an important dependency order within the quadratic-form and surface programmes: early ordering/quaternion/real-curve inputs feed surface period–index; only then does surface period–index feed the u-invariant endpoint. Refine stages accordingly instead of creating a circular roadmap-level proof.

## Pinned libraries and audit evidence

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Actual statements were read in the Brauer quotient, Tau Ceti group/base-change/division/real-group files, CentralSimple/Index, Mathlib quadratic-form anisotropy, and Tau Ceti Hodge/Structure. Thus the extraction reuses, among others:

- the algebraic Brauer commutative group and scalar-extension kernel;
- unique central division representatives, the algebra index and a splitting field of degree exactly that index;
- `TauCeti.Quaternion.brauerGroupMulEquiv`;
- `QuadraticMap.Anisotropic`;
- `TauCeti.Hodge.HodgeStructureOn`.

These do not establish geometric Br(X), a real-equivariant comparison theorem, geometric Hodge structures, general VHS, or the u-invariant. An index-degree splitting extension does not alone prove that index divides every splitting degree.

Reviewed AUDIT-01, AUDIT-02, AUDIT-05 and the final D3 AUDIT-10 targets were inspected. Where this snapshot has no reviewed entry for an owner, that absence was not used as evidence of a missing theorem. Both pinned source trees and the atlas's descriptions, new-roadmap definitions, packets, decompositions, reservations and nearby paper proposals were searched. The full QFI and HodgeStructures upstream READMEs were read as the two near-area density references.

## Proof-audit gates

### The unresolved gates

**G4b / item 67, Proposition 4.5, pp. 84–85.** The hypothesis gives α̃ in mod-two equivariant cohomology. The proof uses it in an equality with integral Z(1)-cohomology classes, then uses 2α̃ as an integral class. An integral lift on U does not follow from the Kummer sequence: its topological obstruction need not vanish there. The published page images, author copy and arXiv v2 retain this expression. A cochain/derived reconstruction or authoritative correction is required. Also, Assumption 4.1(ii) allows additional real curve classes; these must be absorbed before claiming a class lies in the pushforward image. No integral lift or pushforward equality has been invented to fill this gap.

**G4a / item 66, Proposition 4.4, p. 84.** The displayed twisted Bockstein calculation gives
`[ζ]1|Ψ = [α̃]0|Ψ · [e]1|Ψ`
when `[α̃]1|Ψ=0`. The following line replaces the right-hand side by `[e]1|Ψ`, while §4 allows Ψ strictly larger than Θ. The degree-zero Kummer component is the characteristic function of Θ. Resolve that generality or supply the missing correction. In the actual Proposition 6.7 application Ψ=Θ (or is empty), so this particular mismatch is avoided; it does not resolve G4b.

**G10 / item 149.** The exact Jannsen 3×3-complex chase and injective replacement still require primary-source reading with coefficient/sign bookkeeping. The abstract existence of derived categories does not prove this particular chase.

These three items are missing and unrouted. Their theorem statements remain visible, and consumers explicitly carry the gates.

### Normalizations and further checks

- **G1:** At r=s=0 the projective equation rv²=sw² has an entire P1 fiber. The model is not finite there. Distinguish it and its resolution from the finite flat Stein factor, and restrict finite-map arguments to S0.
- **G2:** In Lemma 1.4 choose β reducing to p*α̃ before asserting n-divisibility of its pushforward. The existential compatible choice suffices downstream; an arbitrary Brauer lift does not.
- **G4:** With the paper's map (1,−φ) and operator ψ, Lemma 7.3 must use p*η−ψζ. Its mod-n reduction follows directly; for n=4 a one-sheet tuple distinguishes the signs. Reconstruct the truncated-complex diagram in Lemma 7.5 as well; its printed reduction labels must not be used to infer a split extension.
- **G5:** Separate odd n from the half-period condition. After the quadratic cover, the restricted period divides n/2; the final divisibility sandwich forces equality.
- **G6:** Enlarge the descent field by a transcendence basis. For the lower-bound example choose the two positive local parameters jointly generically, and verify the determinant of their differentials; individual nonproportionality is not the whole test.
- **G7:** BW1 (1.22) confirms that general proper Gysin uses the dimension twist M(d′−d), not the M(−k) printed in Benoist (2.1).
- **G8:** The normal-sequence boundary in (5.7) lands in H¹(C,N_C/T), as the independently read Benoist2018 Proposition 2.1 confirms.
- **G9:** Formulate the final Puiseux sign argument at generic smooth real divisor points avoiding all relevant zeros/poles, not at a fixed point where a rational function may be undefined.

These are precise reading/typing obligations, not an assertion that the main published results are false.

## Prerequisite work and validation

The JSON lists the precise remaining source tasks: Pfister/Elman–Lam, Scheiderer, Grothendieck and residue purity, Jannsen, Greenblatt, Nash/Bröcker approximation, Voisin's earlier proof inputs, de Jong, real Enriques/Picard computations, component-evaluation realization, Witt/Springer/Amer–Brumer and equivariant Ehresmann. Some have broad atlas owners; their exact proof leaves are still missing. Do not turn citations or unread monographs into axioms.

Run `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BENOIST-19.result.json`. The submission was checked against the snapshot catalogue, together with item/reference uniqueness, exactly-once routing except the three named gaps, APIs/three tests and the allowed-path scope. No Lean file is authorized by this paper issue and no Lean compilation is claimed.

Resume from [the handoff](../handoff/PAPER-BENOIST-19.md), beginning with Proposition 4.5's coefficient reconstruction.
