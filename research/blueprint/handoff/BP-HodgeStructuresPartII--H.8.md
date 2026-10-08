# BP-HodgeStructuresPartII--H.8 — handoff

Issue #6947. Worker: Codex, session codex-0rtX9j. This is a completed target-level planning pass for `HodgeStructuresPartII:H.8`, submitted for independent review. It is not a checkpoint or an implementation. The sole stage is planned; no stage is closed.

## Delivered and coverage

The four deliverables are the H.8 packet, reader, suggested file and this handoff. The packet contains 31 nodes: 6 definitions, 21 theorems, 1 lemma and 3 applications. Every definition has uses, API and four definition tests: 28 API items and 24 tests in total. Three API results consumed by other nodes are promoted under their own ids. All ten mandatory items in `PAPER-BENOIST-19/route7` are covered, including the Voisin pushforward-kernel cone and ordinary integral weak Lefschetz. There are 16 baseline declaration references, 6 planets, 5 gaps and 10 supplier requests. All implementation statuses remain unchecked.

The roughly 6,600-word reader states the conventions, targets, proof routes, dependencies, API and tests. The parent/design packet and other workers' packets are imported by id and were not edited. Neither upstream roadmap documents nor application/atlas data were changed. There is no consumer-to-supplier prerequisite cycle: `RealSurfacePeriodIndex` consumes H.8 and provides its own application-specific hypotheses.

## Mathematical boundaries to retain

- Geometric conjugation is complex-linear and exchanges Hodge indices; coefficient conjugation exchanges them independently; their combined semilinear action preserves them. A nonreal point's geometric map lands at its conjugate basepoint. The compatible chart action extends actual native fibre Hodge structures without introducing a replacement variation carrier.
- Tate fixed coordinates are geometric anti-invariants, the native kernel of sigma plus identity. The moving-filtration symbol has positive KS-contraction sign. The quotient obstruction of a fixed flat class has negative sign.
- The normal factorization passes through degree-one cohomology of the curve normal bundle. The three sheaf vanishings imply surjectivity on the full normal-section space; a smaller parameter family supplies a characteristic-map surjectivity condition.
- Green's real cone is open in the twisted invariant subspace and gives nearby real points. Its good locus is empty or open dense separately on each real connected component. Finite polynomial minor coefficients and the several-variable analytic identity theorem justify density.
- The constant/vanishing splitting uses a nondegenerate Hodge pairing on the constant summand. The full surface intersection form is not declared a polarization without the Lefschetz sign correction. The codimension bound gives onto only the vanishing `(0,2)` target, and the class used for the vanishing Green theorem belongs to the vanishing summand.
- Voisin's class and target are both in the pushforward kernel; the cone deforms over the complex base. The nonempty polynomial rank locus meets the coefficient-conjugation real form, providing a real Hodge class for the evaluation argument. The product specialization retains the strict canonical-intersection inequality and sufficiently large degree.
- Ordinary integral Gysin is an isomorphism in degrees 3 to 5 and a surjection in degrees 2 to 4. Both retain torsion and use affine CW dimension and integral relative/Poincaré duality. Affine surface vanishing applies independently to a smooth finite étale cover; it does not assert arbitrary sign or equivariant coefficient vanishing.
- Complex divisor conversion imports MC.7's integral `(1,1)` known case. Real conversion additionally requires an actual equivariant integral lift and the real cycle-class refinement. Invariant ordinary integral Hodge cohomology alone does not assert descent to a real line bundle.

## Follow-up and exact supplier requests

The five gaps are the starting worklist for closure, not omitted targets:

1. **G1:** obtain common global geometric signatures from `ShimuraData:D3/variation`, H.2 geometric-pure/Gauss–Manin, H.3 period-symbol/derivative-connection and natural relative comparisons. D3's request includes flat marked charts, real-analytic Hodge evaluation, kernels and flat Hodge orthogonal projectors. `ComplexComparisonPartII:C1` supplies coherent Hodge, cup/contraction, real-action and pushforward compatibility; C5's existing Betti/de Rham repair is imported.
2. **G2:** `SchemeAndStackFoundations:SF.2`, SF.4 and SF.5 supply actual coherent connecting maps, KS/embedded characteristic maps, normal/divisor/Atiyah extension comparisons and Chern-class signs. The fully typed elementary `normalComposite_surjective` is only the linear part.
3. **G3:** the packet proposes **Geometric topology, Part II** for smooth finite-involution fixed manifolds/tangents and proper Morse exhaustion/handle-to-CW infrastructure. The present upstream manifold layer does not state these targets. Existing upstream AlgebraicTopology stages 4 and 6 supply cellular integral cohomology, relative/manifold duality and the integral inclusion-to-Gysin dictionary, with analytification adapters requested. No upstream file was edited.
4. **G4:** close the precise general inputs in the complete Voisin proof: Barth's symmetric determinantal node count, the Grassmannian Koszul/Bott vanishing, Harris uniform position, Green/Macaulay low-codimension multiplication and Griffiths Jacobian/residue/kernel identifications. SF.2/SF.4/SF.5, `AlgebraicModuliForArithmeticGeometry:R09.1` and C1 are requested for their portions; exact suppliers for all the nodal/combinatorial linear-series inputs have not been located. A broad moduli stage is not claimed to supply an unstated theorem.
5. **G5:** extend `MotivesAndAlgebraicCycles:MC.7` by the real equivariant integral `(1,1)` result cited through Benoist–Wittenberg Proposition 2.8/Krasnov. Obtain and read its precise proof source. Keep the consumer's genuine equivariant integral lift as a hypothesis. The already planned complex known case is imported, not reproduced.

After those supplier interfaces exist, replace the named global-signature omission ledger in the suggested file by the actual typed theorems, preserving the packet statements and signs. Independently review all source matches, the Voisin proof boundary, integral torsion and the preprint-scoped misprint. Scope remains H.8; double-cover construction, relative-pair/Kummer transport, finite-index integral image and application-specific vanishings belong to `RealSurfacePeriodIndex`.

## Sources read and source limits

Public version URLs, access date and SHA-256 hashes are in the packet. The relevant full proof passages read were:

- Benoist 2019 published PDF: §1 pp.69–72, Lemmas 1.3–1.4, Theorem 1.5 and cone/coset argument; §3.2 Proposition 3.2 pp.78–79; §5.1–5.2 pp.84–90 generic maps and normal factorization; §6.2 Proposition 6.6 and proof pp.93–95.
- Benoist 2018 author-hosted typeset copy: §1.1–1.2 Propositions 1.1–1.3 and Remarks 1.4–1.5 pp.1050–1052, and §2.1 Proposition 2.1/Corollary 2.2 pp.1053–1054, including the extension-class proof.
- Voisin author preprint: §1 pp.3–5, the complete required §2 uniruled/rank argument pp.7–18, §3 Propositions 8–9 pp.19–21 and appendix pp.22–23. These are author PDF page numbers. The DOI/Project Euclid endpoint did not provide the published chapter, and the Calabi–Yau theorem is outside scope.
- Griffiths II 1968 published scan: II.1(a) pp.809–815, including the local KS construction, Proposition (1.20), Theorem (1.23) and their complete derivative/cup proof.
- Milnor, Morse Theory §7 pp.39–42: Theorem 7.2, Corollary 7.3 and Theorem 7.4 with their full affine/index and weak Lefschetz proofs. The original Andreotti–Frankel paper was not obtained; the cited proof is Milnor's.

The original general Barth/Harris/Bott/Green/Macaulay/Jacobian foundations were not independently read; their exact uses in Voisin remain G4. The real cycle-class refinement's original proof was not obtained (G5). No private book copy was used. The upstream HodgeStructures and Completed/IntegralLattices reader documents were read in full. The pinned baseline source statements and the relevant supplier packets were read. Mathlib's complexification/Hodge Zulip discussion and open Hodge/Kodaira/Lefschetz PR searches were checked; PR40975 concerns complex structures, not the missing geometric/cone statements.

Two source issues are recorded in own words. The degree correction in Benoist 2019 equation (5.7), p.88, is already confirmed as `PAPER-BENOIST-19/E12`. The second projection label in Voisin author-preprint Corollary 4(ii), p.13, is a preprint-scoped finding for independent review, checked against the page image, proof and Corollary 5. No error is attributed to an unread published version.

## Checks and Lean status

`python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII--H.8.json` reports **zero errors and zero warnings**. Definition/API/test names agree across the packet, reader and suggested file; all mandatory target names appear in the reader and every omitted global name is retained in the ledger. Source hashes, permitted paths, scope, prerequisite acyclicity and six-planet limits were checked.

The full suggested file was **not compiled**. The prescribed `lean-check` stopped at its first import because the shared build lacks the compiled `TauCeti.Geometry.Hodge.Structure` module. Memory was sufficient (112 GB available). The shared build has exactly the pinned Mathlib; its Tau Ceti checkout is beyond the pinned source baseline. No Tau Ceti/Mathlib build, cache fetch, new Lake project or language server was started.

The exact extracted Mathlib-only portion elaborates with proof placeholders as its only warnings. It includes twisted invariants, contraction, cones, lattice cosets, the good-locus definition and APIs/tests, averaging, the rank criterion, the graph derivative and the explicit local submersion/analytic-coefficient implications. This does not establish the native Hodge-action/locus portion, any global geometric signature or an implementation. Nothing is left compiling in the background.
