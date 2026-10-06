# BP-HabiroNumberFields--HB.2 — handoff

Issue [#6494](https://github.com/CBirkbeck/tauceti-explorer/issues/6494), Codex — `codex-in1rju`, 2026-10-06. The bot confirmed the claim at [the claim comment](https://github.com/CBirkbeck/tauceti-explorer/issues/6494#issuecomment-6007410683). This is a complete target-level planning pass, not a checkpoint or an implementation.

## Result and coverage

Only the four authorized deliverables are changed. The accepted parent packet is unchanged. All 28 of its HB.2 nodes are imported by id, including their APIs and tests. Four new declarations refine its proof obligations:

- One construction: `cyclic-hypergeometric-sum`, with eight API items and four unit tests.
- Two theorems: `kms-odd-order-proof` and `eta-chern-signed-evaluation`.
- One comparison: `eta-bar-bloch-specialization`.

There are six inspected baseline declarations, seven supplier requests and three gap records. One new planet, Kashaev–Mangazeev–Stroganov identity, joins five retained parent landmarks. The proposed HB.5 rescope moves the parent's Hutchinson refinement landmark, preserving six planets in HB.2. The hypergeometric sum is supporting API, and the signed Chern theorem refines the existing Chern landmark.

`HabiroNumberFields:HB.2` is **planned**, not closed. Every original target is assigned to a parent import, a new refinement or a precise supplier/gap endpoint. No stage is claimed closed. The three restructuring proposals concern the HB.5 assembly/common q-series inputs, the early finite-Chern prefix, and the arithmetic proof closure for Bass–Tate.

## Mathematical work completed in this pass

The odd-order KMS route is based on the published GZ Appendix A, rather than a citation of an uninspected appendix. The packet and reader give the finite sum, cyclic relation, cleared identity and a corrected analytic calculation. The Gaussian exponent has numerator Y−X and the residue-class mass includes 1/√n. The nth-power product prefactor has power n/2. Exact q-product shifts retain the finite factor lost by substituting qx with ζx. The Dedekind eta phase is computed explicitly and matched with Dζ(1), rather than absorbed into an unspecified root of unity. The proof ends with a monic cyclotomic-integral specialization argument, so positive characteristic is not treated by an impossible embedding into C.

The cyclic bar calculation imports Hutchinson 2013 §6.4's generic configuration map from its proper owner. Its cyclotomic specialization is worked out: the cross-ratio is u_j u_(j+2)/u_(j+1)² = 1−1/u_(j+1)². The correction [0] is retained, including the empty internal sum at N=3. The diagonalizing matrix is modified to determinant one. This comparison supplies the missing input to the parent's Bott/Hurewicz argument; it does not depend on that argument. Restriction to Q(ζ) takes place in K-theory, not through B(Q(ζ))/N.

With the positive resolution/Bott and standard Kummer conventions, raw Soulé evaluates eta to [ζ⁻¹]. The map whose degree-(2,1) Chern class is independently negated evaluates eta to [ζ]. Neither is silently identified with the fixed CGZ/GSWZ map. The parent sign finding E14 remains explicit. Negating a map inverts its square in the multiplicative target, so the sign issue cannot be dismissed by saying that epsilon is a square.

## The four confirmed findings

| Finding | Handling |
| --- | --- |
| `RT-AREA-ktheory-2/2` | Reuse the existing `HabiroNahmSeries:HB.4/acceptance-andrews-gordon`, which now plans CGZ Theorem 7.4. Request the scalar-two assembly in existing **HabiroNahmSeries HB.5**, importing QM.0's Andrews–Gordon/Nahm form and QM.1's theta/eta APIs. Add QM.0→HB.5, QM.1→HB.5 and HB.5→HB.9. Keep HB.2's unknown invertible scalar and the conditional parent implication; introduce no HB.2b or HB.4→HB.2 edge. |
| `RT-AREA-ktheory-2/13` | Import the existing V.5 finite-field Bloch, nonsplit-Cartan and mod-n comparison nodes and propose V.5→HB.2. Preserve actual maps and generator compatibility. The H₃ order q²−1 claim is only used away from the field characteristic, avoiding an incorrect integral statement at exceptional small fields. |
| `RT-AREA-ktheory-2/18` | One generic Soulé finite-Chern/product owner: request an early prefix split from M.8 with M.7 as its only stage prerequisite. HB.1 specializes/untwists, HB.2 evaluates, D.2 imports the same construction. Unsplit M.8 is not an HB.2 dependency, and no nonexistent split-stage identifier is invented. |
| `RT-AREA-ktheory-2/19` | Import V.2's degree-three specialization of the existing T.2:symbols Bass–Tate theorem and retain its original-proof gap. Request arithmetic proof closure at T.7 under the same K2SymbolsBrauer owner, with real places from M.2, Hilbert/global-K₂ inputs from T.7, weak approximation, and the product-by-{−1} consequence. The Milnor owner's Matsumoto comparison supplies Quillen K₂. T.7 and M.3 already consume T.2:symbols, so do not add them as prerequisites of that whole stage. The proposed M.2→T.7, M.2→V.2 and T.7→V.2 edges are acyclic. |

These are proposals and supplier contracts in this job's files. No other packet, roadmap or atlas data was edited.

## Exact remaining work

1. **QM.0 and P.1 analytic exports.** Supply the arbitrary-ring finite q-product interface, Ramanujan bilateral identity, fixed-argument leading-product asymptotic, and the uniform two-sided residue/tail limit with the constants stated in §3 of the reader. Supply the full complex five-term identity B=0 on the specified branch domain. A Bloch–Wigner identity and a pointwise central expansion do not suffice. The regulator-independent product/bilateral material must precede HB.2 and HB.4; importing HB.4 into HB.2 is forbidden by the dependency order.
2. **V.4 generic bar map.** Export the actual refined configuration-to-homology/Bloch map with Hutchinson's cyclic formula, auxiliary-point independence, forgetful comparison and agreement with V.5. The specialization here must be applied to that map, not to an assumed isomorphism of abstract groups.
3. **Early Chern prefix and signs.** Apply the M.8 restructuring and export the finite-coefficient construction, coefficient and base-change compatibility, standard Kummer map, Bott normalization and negative product formula. Prove which normalization agrees with the fixed CGZ/GSWZ class by comparing the actual maps, including Suslin and Hurewicz signs. Until that is done, retain R=c_+² and R=c_raw^(−2) as convention-qualified conclusions.
4. **Inherited Bass–Tate gap.** Obtain and plan the original arithmetic proof of the existing number-field signature theorem at its single owner. Rescope that proof after T.7 before adding arithmetic prerequisites; the generic T.2:symbols stage must stay upstream of T.7. Retain the old statement import and gap until the rescope is applied.
5. **HB.5 and HB.9 consumption.** Assemble the prime-power scalar evaluation using the existing HB.4 Andrews–Gordon theorem, local generators, global comparison and CRT. Export the sign-qualified assembled result to HB.9. Epsilon_m=c_m² on actual K₃ for every m remains the parent's early definition, independently of where equality with R is proved.

The seven requests include the already-owned ProfiniteCohomology Layer 9 Kummer isomorphism as an import contract. No new plan for an upstream Tau Ceti roadmap is proposed.

## Sources, findings and limits

Exact URLs, SHA-256 hashes, access date, editions and read sections are in the packet. Sources read:

- CGZ published Ann. Sci. ENS 56 (2023), §2.5, §§4.2–5.1, §5.3 and §7.2. Use published eta (36) and Andrews–Gordon (47), not preprint (34)/(45).
- GZ published Ramanujan J. 55 (2021), common q-product proof and Appendix A, including page images of pp.236–237. DOI 10.1007/s11139-020-00266-x.
- Hutchinson arXiv:1107.0264v2, dated 18 January 2013, §§6.3–6.4, §3 and §7; Hutchinson arXiv:2104.14413v4, dated 27 March 2024, all §§1–4.
- Soulé's author-hosted thesis transcription, second part §§2.2.2.3, 2.2.3.3, 2.2.4.3 and 2.2.5. Its product proposition treats integral times finite-coefficient K-theory, sufficient for the integral unit ζ times β. Its remark does not establish a general product formula for two finite-coefficient classes; that broader claim is not attributed to this text.

The four new source issues `HabiroNumberFields/EHB2.1`–`EHB2.4` record the published GZ Gaussian sign, prefactor/exponent, parameter-shift and phase problems. They concern its proof. The preprint, author publication page and correction searches yielded no known correction. No independent verdict is claimed. The inherited Hutchinson sign finding is preserved rather than relabelled as new.

Missing source access: the full Hutchinson 2024 publisher version of record, the Hutchinson 2013 version of record, and the separate Soulé Inventiones 1979 version of record. The inspected versions are distinguished explicitly. CGZ and GZ were inspected in author-hosted published copies. The source-sign comparison requires more than the author thesis's confirmation of the negative coefficient.

## Checks and prototype status

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNumberFields--HB.2.json`: **0 errors, 0 warnings**.
- The embedded source issues and version records pass the errata schema after projection to its errata envelope. The standalone errata command expects an errata-job file, so it is not directly applicable to a blueprint packet.
- Declaration, API and test names match the suggested file; every new construction's four tests appear as examples. All implementation statuses are unchecked. The reader and packet contain no Lean code or proof placeholders.
- Eight proposed stage edges were checked sequentially against the extracted atlas graph, with no reverse paths. The two tempting arithmetic edges into T.2:symbols were separately checked and rejected because reverse paths exist.
- Exhaustive finite-field checks of (KMS), for a fixed primitive ζ in each field and every admissible triple: (n,p)=(3,19), (5,31), (7,43), (9,73), respectively 108, 500, 1372 and 4374 checks, 6354 total. Reproduce by looping nonzero x,y,z, rejecting X=1, Y=1, X=Y, and testing (1−Y)Z=1−X; evaluate the finite products and cleared identity directly modulo p.
- Gaussian sanity checks used X=.2+.1i, Y=2+.1i, principal nth roots, orders 3 and 5, ε=.02,.01,.005, and bilateral summation from −3999 to 3999. Corrected relative errors were approximately (.00891,.00445,.00222) and (.01523,.00759,.00379). The Dedekind phase was checked by direct finite products at every primitive root of orders 3,5,7,9. These computations do not discharge any analytic gap.

**Lean was not compiled.** No existing shared build was found at both pinned commits. No library build, update, cache download, new project or language server was started. The prototype imports individual Mathlib and Tau Ceti modules and uses their existing primitive-root and power-class types. The absent actual Bloch/K-theory/Chern comparison signatures are named in comments with their missing supplier objects, rather than replaced by arbitrary proposition fields. The four baseline statements about power classes and Kummer, and the two Mathlib primitive-root statements, were read at the pins.

Scratch source texts and numerical scripts are disposable. Everything needed to resume the mathematical obligations is in the packet, reader and this note; no handoff depends on private paths or scratch files.
