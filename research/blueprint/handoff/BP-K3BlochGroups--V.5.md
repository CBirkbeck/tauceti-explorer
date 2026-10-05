# BP-K3BlochGroups--V.5 — completed target-level pass

Codex — codex-qorF7t; issue #6385; 5 October 2026.

## Deliverables and status

The new part packet, reader and suggested Lean file cover exactly K3BlochGroups:V.5. The accepted parent is unchanged; the new packet records its imported IDs and uses fresh IDs for refinements. Packet status is **complete**, stage coverage is **planned**, not closed. Every original target and the finite-field HB.2 export is accounted for in targetCoverage.

There are 18 nodes: 4 applications, 8 theorems, 5 constructions and 1 comparison; 20 API items, 15 construction tests, 6 planets and 10 baseline declarations. Five precise gaps and three supplier requests remain. This is a finished planning pass under PROTOCOL §0, with proof refinement boundaries, not a checkpoint or implementation claim.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/K3BlochGroups--V.5.json`: zero errors and zero packet warnings. The same check with `--index` also passed, using a 246,008-declaration index generated directly from the existing pinned Mathlib tree. Each baseline declaration was additionally checked by reading its source statement at the pin. Pinned Tau Ceti searches and the reviewed V.5 audit were also read.
- The shared `lean-check` elaborated the final suggested file against Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**, with only declaration-uses-placeholder-proof warnings. No Lean errors, language server, library build or dependency update. Available memory was above 90 GB. The file imports Mathlib only; Tau Ceti sources were examined at **f790474821cf4256814db967cb154e7af3d0c369**.
- Source-issue schema and source-version checks pass; the record identifies both the published CGZ text and the preprint hashes.
- Construction/API/test names were cross-checked between packet and suggested file; all fifteen named tests occur as examples. The single intentionally unstated chain API is explicitly described below.

The K₃, Milnor, indecomposable and Bloch carriers/maps in the prototype are supplier parameters, following the parent file’s convention. The real interval Rogers function and the coefficient localization map are also supplier parameters. Successful elaboration does not certify mathematical assertions for arbitrary parameters. The real Mathlib carriers are used for homology, SL₂, tensors, norm, multiplication matrices and AddCircle. There are no proposition-valued stand-ins for missing mathematics.

## Confirmed red-team findings

- **RT-AREA-ktheory-2/13:** finite Bloch orders, the actual refined Bloch–Wigner homomorphism, localization/stabilization comparison, odd-n tensor comparison and the actual norm-one Cartan embedding/homology map are new nodes. The V.5→HabiroNumberFields:HB.2 export is explicit. The finding’s integral H₃ assertion is corrected: Hutchinson computes the prime-to-characteristic group; integral H₃ has characteristic torsion for q=2,3,4,5,8,9,27. Small fields are not fed into the q≥4 Bloch sequence.
- **/19:** the exact existing Bass–Tate supplier T.2:symbols/milnor-number-field is imported, not duplicated. The product-image application uses Matsumoto, multiplicativity, degree-three signs and upstream total-sign surjectivity to show the Milnor image equals [−1]·K₂. Rational and Gaussian applications consume it.
- **/21:** the stable finite groups and transfer/Frobenius formulas are exact L.1 imports with a direct edge. V.5 only transports them to indecomposables and constructs Bloch comparisons.
- **/22:** ambient arithmetic groups are imported from N.5/N.7 and requested as N.8 certified examples. N.8’s current example nodes still refer back to V.5; importing them directly would be circular. The packet records the needed supplier correction and requests removal of that reverse ownership before the N.8→V.5 edge is materialised. The rational group can already be imported independently; the Gaussian w₂=24 certificate is an explicit boundary. No other job’s files were changed.

## Exact refinement work

1. Supply generic homological Sylow stable elements, cyclic/quaternion periodic homology, subgroup inclusion multipliers and elementary-abelian low-degree homology. Hutchinson §3 states the needed Brown/Swan inputs; their original proofs were not read. The proposed foundational owner is **StableHomotopyKTheory, Part II: finite-group periodic homology**. H.6’s K-spectrum coefficient theory is not treated as this supplier.
2. Verify the natural stable elementary-to-SL bridge for parent V.1/k2-to-k3-h3-e, and supply Sah’s algebraically closed unstable comparison used by Hutchinson Corollary3.9. Its original proof remains unread.
3. Refine the finite square-class configuration complex, the β chain maps and homotopies, the finite exactness analysis in Hutchinson Theorem4.3, and the comparison of its torsion arrow with parent V.4’s enhanced Tor. **finiteBlochHom_cyclic_bar** is specified mathematically and commented in the prototype but intentionally not stated as an executable signature until those carriers/maps exist. All other construction APIs and tests have signatures.
4. **Polylogarithms:P.1** must supply the requested interval Rogers function with the exact endpoints, derivative, reflection, half-value and ordered five-term constant. Refine Suslin Lemma1.6’s positive-presentation descent, read on pp219–220. The final detector has period π² and takes c to −π²/6; the π²/2 normalization is insufficient.
5. Correct **ArithmeticKTheory:N.8** as above and provide its Gaussian r₂=1,w₂=24 certificate. The third request consumes the already-scoped total-sign surjectivity of upstream Global Number Fields Layer1; it does not request changes to that upstream roadmap.

## Sources and source corrections

Public author copies of K-book III.7.2, IV.1.13 and VI.2/5; Hutchinson arXiv1107.0264v2 §§3,4,6,7; CGZ’s published2023 §§4.2–4.3 and arXiv v3; Suslin’s scan pp219–220; Zagier’s Rogers discussion II.1.A were read. URLs, hashes, read sections and access date are in the packet. Source copies stay outside the repository and are discarded after submission.

**E501** records the CGZ integral H₃ order error with its unaffected odd-n comparison. **E502** records the non-natural identification of H₃(C¹) with C¹: inversion acts by its square on degree-three homology, and torsion roots must be distinguished from modulo-n generators. Both findings name the published locator and versions searched; their independent review remains to be done. The parent K-book finite-Suslin source issue is resolved through Hutchinson at q≥4, rather than recorded a second time.

The reader’s finite-field table tests integral versus localized homology, odd versus even Bloch orders, the small-field presentation, and the missing gcd condition. In particular Bₛ(F₃)=2ℤ inside its pre-Bloch ℤ, not the exterior-square kernel. The two upstream documents read for style and carrier design were Algebraic Topology and Global Number Fields.
