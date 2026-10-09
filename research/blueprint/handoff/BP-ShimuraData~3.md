# BP-ShimuraData~3 — revision handoff

Issue [#7567](https://github.com/CBirkbeck/tauceti-explorer/issues/7567). Agent: Codex, session **codex-w7eqoq**, 2026-10-09. This is one completed planning revision, for independent review, of the [packet](../packets/ShimuraData.json), [reader](../readmes/ShimuraData.md) and [suggested file](../suggested/ShimuraData.lean). The binding input is [REV-ShimuraData~2](../reviews/REV-ShimuraData~2.md).

All 123 inherited node IDs, the complete historical `review` object and `reviewHistory`, and all sixteen existing source-issue verdicts/history are preserved. In particular the historical needs_changes verdict is still present; the author has not accepted this revision or confirmed the new source finding. The source-ledger explanation of E15 now distinguishes its valid single-local product argument from E17's separate restriction-of-scalars obstruction.

## Completion and counts

The packet is **complete** as a planning pass. D0, D1, D2, D3, D4 and D5 are each **planned**, with zero closed stages and all implementation statuses **unchecked**. Counts are 19 definitions, 25 constructions, 53 lemmas and 26 theorems; 140 definition/construction APIs plus two categorical comparison interfaces; 132 labeled unit tests; 27 planets (1,4,4,6,6,6); 45 baseline declarations; 26 exact supplier requests; ten explicit gaps; seventeen source findings, of which the sixteen historical findings have independent verdicts and E17 awaits review.

No nodes or planets were added or removed. Seven native Mathlib carrier citations were added, with their full statements read at the exact pin: RootPairing, its Base and Base.IsPos, RootPairing.weylGroup, Matrix.unitaryGroup, NumberField.RingOfIntegers and Matrix.GeneralLinearGroup.toLin. The original 38 baseline statements were also read at their exact source pins. These supply carriers and operations, rather than the GSp comparison theorems.

## Nine conclusions restored

| Named interface | Revision and source locator |
| --- | --- |
| hilbertDeterminantMap | A rational datum morphism to Res_F/ℚ Gm, its contravariant determinant coordinate map, real base-change S-map equation, split pointwise determinants and diagonal norm h. F and its embeddings occur in the actual target. This is the degree-d restriction torus; Milne Example 5.24 pp.63–64, with D4 datum maps and D5 torus data. |
| siegelRootConvention | Uses R7's native RootPairing and Base; identifies parity characters, compact/noncompact positives, both half-sums and G/M coroot-dominant cones in the BP convention. BP §3.1 pp.33–34. |
| siegelWeylPermutations | A multiplicative equivalence from the imported Weyl group to reflected permutations, its action on standard weights, the Levi first-half criterion, the cyclic inverse-image minimal-left-representative criterion and its 2^g count. BP §3.1 p.34, corrected E3. |
| kostantSequenceGeometry | Constructs the inverse-image Lagrangian and reference flag as actual submodules. Membership in P·w̃·B and minimality imply the intersection ranks; parabolic representative invariance and cell constancy are conclusions. No rank equality is assumed. BP §3.1 p.34. |
| gsp4CgRoots | Imported CG roots paired with coroots, simple and Levi roots, evaluation pairing, rho, dominant cones, actual torus-character evaluation and parity conversion. CG §2.1 PDF pp.7–8, corrected E5. |
| gsp4Kostant | A bijection onto the four actual minimal Weyl representatives, all coordinate actions and lengths 0–3, longest Levi/full actions and lengths 1/4, maximal-length characterizations and reversal i↦3−i. CG §2.1.1 PDF p.8, corrected E6. |
| gsp4Unitary | The actual real orthogonal J-centralizer subgroup is multiplicatively equivalent to native U(2). The map is A+iB; its inverse is the specified 4×4 block matrix. A/B extraction, block recovery and both unitary equations are included. Lie compatibility remains the explicit AF.1 condition. CG §2.2 PDF p.9. |
| gsp4PilloniConvention | Compares the imported parity character lattice and half-integral dual with CG coordinates, retains the dot pairing and dual bases, matches root/coroot indices, and specifies corrected lower-Borel positives, simple pairs, compact root and rho. The BP compact order remains distinct. The dual is explicitly half-integral, including 2d integral. Pilloni §5.1.1 p.20 and Remark 5.2.1.1 p.23, corrected E11. |
| iwahoriNeat | Every element of the actual compact open adelic GSp4 subgroup is strongly adelically neat, followed by neatLevel for every rational conjugate intersection and neatness on any retained rational-prime family containing the certification prime. The old single-local calculation is retained as localGeneratedNeat. The hypothesis requires all F-places over one rational prime; see E17 below. BCGP Definition 3.2.1 pp.201–202 and Lemma 7.8.3 p.409. |

The extra longest lengths and the half-integral ambient dual lattice make values explicit that had been implicit in the packet's descriptions. Existing native root/Weyl constructions remain owned by R7, integral flags by R9, and dualization by RG2.5.

## New source finding E17

The published BCGP Lemma 7.8.3 uses one F-place, while Definition 3.2.1 tests eigenvalues of a faithful representation of the rational group Res_F/ℚ GSp4, indexed by rational primes. These spectra include all F-places above a rational prime. Product closure within one four-dimensional factor does not bound the other factors.

A counterexample is F=ℚ(√2), u=7+5√2=(1+√2)³, of norm −1. The rational prime 7 splits; at v=(7,√2−3) its completion is ℚ7 and u reduces to 1. Thus γ=uI4 belongs to Iw1(v), and is integral and invertible at every other finite place. Choose Iw1(v) there and full integral level elsewhere. In the faithful rational representation on F4, u and 7−5√2 are eigenvalues; their product is −1. The rational γ therefore fails neatness, and its diagonal adele fails the strong definition at every rational prime. Its similitude u² is totally positive. At the other place above 7 the scalar reduces to −1.

The corrected theorem requires every v|ℓ to be absolutely unramified and the level projection to lie in Iw1(v), for one rational ℓ>5. The source's degree-four bound applies to all local factors and embeddings; product/inverse closure and the cyclotomic torsion gap then kill torsion in the full rational local spectrum. For F=ℚ this specializes to the original one-place conclusion. The prime-to-p consequence retains ℓ≠p.

The packet records the version-of-record PDF, its unchanged SHA-256, and searches of the publisher/Numdam listing, arXiv version history and author publication pages. No corresponding corrigendum was located. E17 has no author-supplied independent verdict. Review it particularly carefully, including the distinction from the historically confirmed E15 proof gap.

## Fifteen reviewer corrections retained and rechecked

The first fifteen numbered corrections in REV-ShimuraData~2 remain in place:

1. The finite real Hodge decomposition includes internal sum and finite nonzero support under Module.Finite.
2. The inverse-diagonal coordinate arrow remains O(S)→O(Gm).
3. The three tangent signatures retain the supplied complex chart instances.
4. The quotient imports native Hausdorff/second-countable instances and compares the actual h-orbit by a homeomorphism.
5. The GL2 μ test retains characteristic polynomial (X−z)(X−1).
6. productMaps remains the unique universal pairing of two datum morphisms, with both projection equations.
7. Product tests use actual torus and GL2 product data and the trivial factor isomorphism.
8. Adjoint tests retain the real quadratic two-versus-four-component non-surjectivity distinction.
9. Principal K(3) and full GL2 integral-level tests are actual adelic levels.
10. gammaGl2 retains its rational Möbius action, positive determinant and integral principal congruence characterization.
11. Hilbert and Hilbert-star rational tests are datum isomorphisms; the nonscalar trace-representation obstruction remains qualified.
12. The negative trace-polarization sign still requires u≠0.
13. gl2-integral-torsion-root remains the reviewer-added arithmetic lemma with its provenance; gl2CongruenceNeat retains the all-conjugate neatLevel conclusion and AA.3 lattice input.
14. Native IsPolarization is still qualified as integral, with rational polarization separately requested from H1.
15. Source-version distinctions, own-word correction ledger, locators, previous credit and reader synchronization remain intact. New evidence is dated separately; no source passage was copied into the repository.

## Sources, ownership and remaining leaves

The revision rechecked the nine interface locators in Milne 2017, the BP higher Hida author copy, the CG publisher-typeset advance-publication copy, Pilloni's author copy and published BCGP. Their downloaded files match the recorded hashes. The original eleven source versions and locators remain in the reader; Deligne's scan/hash was also checked. Author-copy and preprint findings remain scoped to those versions rather than unchecked published copies.

All twenty-six supplier requests remain. AA.1 and native R1 now explicitly supply the faithful rational restriction-of-scalars spectral comparison at all places over a rational prime; RG2.3 is a direct Iwahori input; R7 directly supplies genus-two representative/length data. No supplier packet, native roadmap or atlas data was edited. RT-AREA-algebraicgeometry/27 remains handled by the existing H0→D1 and H1→D3 requests/direct prerequisites; the native outgoing graph and other roadmap edges remain the maintainer's upstream note. V0 is still downstream, and CM.0 enters only the downstream CM example.

The nine-conclusion mismatch gap was removed. The ten retained gaps are effective comodule descent; holomorphic flat-bundle gluing; complex analytic quotients; integral flag incidence; reflex parabolic-type descent; Mumford–Tate/classification inputs; explicitly omitted signature conditions; the real-point/homogeneous quotient bridge; nonaffine Hilbert compact-dual comparison; and the normalized cyclotomic valuation theorem. Coverage also retains real component finiteness and the AA.3 rational lattice comparison. Unread foundational proofs remain Wolf 1984 Theorem 8.7.9, BL03 I Lemma 1, general SGA3 parabolic representability, independent elliptic Hodge-endomorphism/MT classification and the cyclotomic valuation identity. None is credited as established.

Implementation must restore the specified supplier identifications, all-place absolute unramifiedness and local spectral comparisons, real analytic/Lie compatibility and the other recorded hypotheses. The complete packet statements remain definitive.

## Validation and Lean status

- Packet checker with the exact pinned declaration index: **0 errors, 0 warnings**, 123 nodes, all six stages planned.
- Source-issue/version checker through an errata-v1 scratch wrapper: **0 errors**. Seventeen findings, with all sixteen historical verdicts/history unchanged.
- Structural checks: all 123 declaration names, 142 API names and 132 labeled examples retained; every node statement, hypothesis, proof step, API/test statement and acceptance paragraph occurs in the reader. Node IDs and complete historical review/history compare equal to the input.
- Exact rational checks: reflected-permutation cyclic criterion agrees with positive-Levi-root minimality for g=1,2,3, with counts 2,4,8; BP half-sums agree in ranks 1–6; the Pilloni character/dual basis pairing is the identity.
- **Focused Lean check passed**, with only expected sorry warnings: the eight Mathlib-only root/Weyl/flag, genus-two and Iwahori interfaces. The small norm/congruence identities in the E17 example are proved.
- **The full suggested module was not compiled.** No existing shared build has both pinned commits. The default build has Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti cf386627e9176a3827c1a5fe804989fd94a4d216 rather than the required f790474821cf4256814db967cb154e7af3d0c369. No build/cache/update or language server was started.
- JSON, individual import source paths, whitespace and four-file deliverable scope checked.

To reproduce the focused check without retaining scratch: use the suggested-file section beginning with the absolute-root/Weyl comment and ending immediately before the rational adelic lattice comment. Prepend its individual Mathlib imports, the namespace and the unchanged Qbar, kostantRepresentatives, neat, neatLevel and adelicNeat definitions from that file; close the namespace. This uses no Tau Ceti imports and leaves the Hilbert determinant interface and the rest of the module unchecked. Run it only with lean-check at the exact Mathlib pin. This recipe and the permanent mathematical counterexample suffice after scratch deletion.

The next step is independent revision review of all nine signatures, the preserved reviewer fixes, and especially E17. No original revision task is left as a checkpoint; proof/supplier work remains openly planned.
